package org.cog



import org.junit.*
import grails.test.mixin.*

@TestFor(LocationDetailController)
@Mock(LocationDetail)
class LocationDetailControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/locationDetail/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.locationDetailInstanceList.size() == 0
        assert model.locationDetailInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.locationDetailInstance != null
    }

    void testSave() {
        controller.save()

        assert model.locationDetailInstance != null
        assert view == '/locationDetail/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/locationDetail/show/1'
        assert controller.flash.message != null
        assert LocationDetail.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/locationDetail/list'


        populateValidParams(params)
        def locationDetail = new LocationDetail(params)

        assert locationDetail.save() != null

        params.id = locationDetail.id

        def model = controller.show()

        assert model.locationDetailInstance == locationDetail
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/locationDetail/list'


        populateValidParams(params)
        def locationDetail = new LocationDetail(params)

        assert locationDetail.save() != null

        params.id = locationDetail.id

        def model = controller.edit()

        assert model.locationDetailInstance == locationDetail
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/locationDetail/list'

        response.reset()


        populateValidParams(params)
        def locationDetail = new LocationDetail(params)

        assert locationDetail.save() != null

        // test invalid parameters in update
        params.id = locationDetail.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/locationDetail/edit"
        assert model.locationDetailInstance != null

        locationDetail.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/locationDetail/show/$locationDetail.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        locationDetail.clearErrors()

        populateValidParams(params)
        params.id = locationDetail.id
        params.version = -1
        controller.update()

        assert view == "/locationDetail/edit"
        assert model.locationDetailInstance != null
        assert model.locationDetailInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/locationDetail/list'

        response.reset()

        populateValidParams(params)
        def locationDetail = new LocationDetail(params)

        assert locationDetail.save() != null
        assert LocationDetail.count() == 1

        params.id = locationDetail.id

        controller.delete()

        assert LocationDetail.count() == 0
        assert LocationDetail.get(locationDetail.id) == null
        assert response.redirectedUrl == '/locationDetail/list'
    }
}
