package org.cog



import org.junit.*
import grails.test.mixin.*

@TestFor(UserSubscriptionController)
@Mock(UserSubscription)
class UserSubscriptionControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/userSubscription/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.userSubscriptionInstanceList.size() == 0
        assert model.userSubscriptionInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.userSubscriptionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.userSubscriptionInstance != null
        assert view == '/userSubscription/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/userSubscription/show/1'
        assert controller.flash.message != null
        assert UserSubscription.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/userSubscription/list'


        populateValidParams(params)
        def userSubscription = new UserSubscription(params)

        assert userSubscription.save() != null

        params.id = userSubscription.id

        def model = controller.show()

        assert model.userSubscriptionInstance == userSubscription
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/userSubscription/list'


        populateValidParams(params)
        def userSubscription = new UserSubscription(params)

        assert userSubscription.save() != null

        params.id = userSubscription.id

        def model = controller.edit()

        assert model.userSubscriptionInstance == userSubscription
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/userSubscription/list'

        response.reset()


        populateValidParams(params)
        def userSubscription = new UserSubscription(params)

        assert userSubscription.save() != null

        // test invalid parameters in update
        params.id = userSubscription.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/userSubscription/edit"
        assert model.userSubscriptionInstance != null

        userSubscription.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/userSubscription/show/$userSubscription.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        userSubscription.clearErrors()

        populateValidParams(params)
        params.id = userSubscription.id
        params.version = -1
        controller.update()

        assert view == "/userSubscription/edit"
        assert model.userSubscriptionInstance != null
        assert model.userSubscriptionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/userSubscription/list'

        response.reset()

        populateValidParams(params)
        def userSubscription = new UserSubscription(params)

        assert userSubscription.save() != null
        assert UserSubscription.count() == 1

        params.id = userSubscription.id

        controller.delete()

        assert UserSubscription.count() == 0
        assert UserSubscription.get(userSubscription.id) == null
        assert response.redirectedUrl == '/userSubscription/list'
    }
}
