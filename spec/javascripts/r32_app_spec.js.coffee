describe "R32", ->
    it "passes a sanity test", ->
        app = new R32App()
        expect(app.sanity()).toEqual(true)