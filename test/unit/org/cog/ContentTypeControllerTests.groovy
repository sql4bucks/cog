package org.cog



import org.junit.*
import grails.test.mixin.*

@TestFor(ContentTypeController)
@Mock(ContentType)
class ContentTypeControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/contentType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.contentTypeInstanceList.size() == 0
        assert model.contentTypeInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.contentTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.contentTypeInstance != null
        assert view == '/contentType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/contentType/show/1'
        assert controller.flash.message != null
        assert ContentType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/contentType/list'


        populateValidParams(params)
        def contentType = new ContentType(params)

        assert contentType.save() != null

        params.id = contentType.id

        def model = controller.show()

        assert model.contentTypeInstance == contentType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/contentType/list'


        populateValidParams(params)
        def contentType = new ContentType(params)

        assert contentType.save() != null

        params.id = contentType.id

        def model = controller.edit()

        assert model.contentTypeInstance == contentType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/contentType/list'

        response.reset()


        populateValidParams(params)
        def contentType = new ContentType(params)

        assert contentType.save() != null

        // test invalid parameters in update
        params.id = contentType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/contentType/edit"
        assert model.contentTypeInstance != null

        contentType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/contentType/show/$contentType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        contentType.clearErrors()

        populateValidParams(params)
        params.id = contentType.id
        params.version = -1
        controller.update()

        assert view == "/contentType/edit"
        assert model.contentTypeInstance != null
        assert model.contentTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/contentType/list'

        response.reset()

        populateValidParams(params)
        def contentType = new ContentType(params)

        assert contentType.save() != null
        assert ContentType.count() == 1

        params.id = contentType.id

        controller.delete()

        assert ContentType.count() == 0
        assert ContentType.get(contentType.id) == null
        assert response.redirectedUrl == '/contentType/list'
    }
}
