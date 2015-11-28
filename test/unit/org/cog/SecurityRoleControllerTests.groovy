package org.cog



import org.junit.*
import grails.test.mixin.*

@TestFor(SecurityRoleController)
@Mock(SecurityRole)
class SecurityRoleControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/securityRole/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.securityRoleInstanceList.size() == 0
        assert model.securityRoleInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.securityRoleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.securityRoleInstance != null
        assert view == '/securityRole/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/securityRole/show/1'
        assert controller.flash.message != null
        assert SecurityRole.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/securityRole/list'


        populateValidParams(params)
        def securityRole = new SecurityRole(params)

        assert securityRole.save() != null

        params.id = securityRole.id

        def model = controller.show()

        assert model.securityRoleInstance == securityRole
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/securityRole/list'


        populateValidParams(params)
        def securityRole = new SecurityRole(params)

        assert securityRole.save() != null

        params.id = securityRole.id

        def model = controller.edit()

        assert model.securityRoleInstance == securityRole
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/securityRole/list'

        response.reset()


        populateValidParams(params)
        def securityRole = new SecurityRole(params)

        assert securityRole.save() != null

        // test invalid parameters in update
        params.id = securityRole.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/securityRole/edit"
        assert model.securityRoleInstance != null

        securityRole.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/securityRole/show/$securityRole.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        securityRole.clearErrors()

        populateValidParams(params)
        params.id = securityRole.id
        params.version = -1
        controller.update()

        assert view == "/securityRole/edit"
        assert model.securityRoleInstance != null
        assert model.securityRoleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/securityRole/list'

        response.reset()

        populateValidParams(params)
        def securityRole = new SecurityRole(params)

        assert securityRole.save() != null
        assert SecurityRole.count() == 1

        params.id = securityRole.id

        controller.delete()

        assert SecurityRole.count() == 0
        assert SecurityRole.get(securityRole.id) == null
        assert response.redirectedUrl == '/securityRole/list'
    }
}
