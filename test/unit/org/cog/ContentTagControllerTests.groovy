package org.cog



import org.junit.*
import grails.test.mixin.*

@TestFor(ContentTagController)
@Mock(ContentTag)
class ContentTagControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/contentTag/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.contentTagInstanceList.size() == 0
        assert model.contentTagInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.contentTagInstance != null
    }

    void testSave() {
        controller.save()

        assert model.contentTagInstance != null
        assert view == '/contentTag/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/contentTag/show/1'
        assert controller.flash.message != null
        assert ContentTag.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/contentTag/list'


        populateValidParams(params)
        def contentTag = new ContentTag(params)

        assert contentTag.save() != null

        params.id = contentTag.id

        def model = controller.show()

        assert model.contentTagInstance == contentTag
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/contentTag/list'


        populateValidParams(params)
        def contentTag = new ContentTag(params)

        assert contentTag.save() != null

        params.id = contentTag.id

        def model = controller.edit()

        assert model.contentTagInstance == contentTag
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/contentTag/list'

        response.reset()


        populateValidParams(params)
        def contentTag = new ContentTag(params)

        assert contentTag.save() != null

        // test invalid parameters in update
        params.id = contentTag.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/contentTag/edit"
        assert model.contentTagInstance != null

        contentTag.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/contentTag/show/$contentTag.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        contentTag.clearErrors()

        populateValidParams(params)
        params.id = contentTag.id
        params.version = -1
        controller.update()

        assert view == "/contentTag/edit"
        assert model.contentTagInstance != null
        assert model.contentTagInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/contentTag/list'

        response.reset()

        populateValidParams(params)
        def contentTag = new ContentTag(params)

        assert contentTag.save() != null
        assert ContentTag.count() == 1

        params.id = contentTag.id

        controller.delete()

        assert ContentTag.count() == 0
        assert ContentTag.get(contentTag.id) == null
        assert response.redirectedUrl == '/contentTag/list'
    }
}
