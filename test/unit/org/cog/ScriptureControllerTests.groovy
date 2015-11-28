package org.cog



import org.junit.*
import grails.test.mixin.*

@TestFor(ScriptureController)
@Mock(Scripture)
class ScriptureControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/scripture/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.scriptureInstanceList.size() == 0
        assert model.scriptureInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.scriptureInstance != null
    }

    void testSave() {
        controller.save()

        assert model.scriptureInstance != null
        assert view == '/scripture/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/scripture/show/1'
        assert controller.flash.message != null
        assert Scripture.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/scripture/list'


        populateValidParams(params)
        def scripture = new Scripture(params)

        assert scripture.save() != null

        params.id = scripture.id

        def model = controller.show()

        assert model.scriptureInstance == scripture
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/scripture/list'


        populateValidParams(params)
        def scripture = new Scripture(params)

        assert scripture.save() != null

        params.id = scripture.id

        def model = controller.edit()

        assert model.scriptureInstance == scripture
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/scripture/list'

        response.reset()


        populateValidParams(params)
        def scripture = new Scripture(params)

        assert scripture.save() != null

        // test invalid parameters in update
        params.id = scripture.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/scripture/edit"
        assert model.scriptureInstance != null

        scripture.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/scripture/show/$scripture.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        scripture.clearErrors()

        populateValidParams(params)
        params.id = scripture.id
        params.version = -1
        controller.update()

        assert view == "/scripture/edit"
        assert model.scriptureInstance != null
        assert model.scriptureInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/scripture/list'

        response.reset()

        populateValidParams(params)
        def scripture = new Scripture(params)

        assert scripture.save() != null
        assert Scripture.count() == 1

        params.id = scripture.id

        controller.delete()

        assert Scripture.count() == 0
        assert Scripture.get(scripture.id) == null
        assert response.redirectedUrl == '/scripture/list'
    }
}
