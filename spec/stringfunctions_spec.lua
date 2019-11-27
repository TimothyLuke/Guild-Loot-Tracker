describe('API StringFunctions', function()
  setup (function()

    require("../spec/mockGLT")
    require("../API/Statics")
    require("../API/Options")
    require("../API/StringFunctions")

  end)

  it("tests positive assertions", function()
    assert.is_true(true)
    assert.are.equal(1, 1)
    assert.has.errors(function() error("this should fail") end)
  end)

  it("tests isEmpty", function()
    assert.is_true(GLT.isEmpty(nil))
    assert.is_true(GLT.isEmpty(''))
    assert.is_false(GLT.isEmpty("String"))
  end)

  -- Note these are all different implementations of the same thing
  it ("tests GLT.SplitMeIntolines(str)", function ()
    assert.are.same({[1] = "a", [2] = "b"}, GLT.SplitMeIntolines("a\nb"))
  end)

  it ("tests GLT.lines", function ()
    local tabl = {}
    GLT.lines(tabl, "a\nb")
    assert.are.same({[1] = "a", [2] = "b"}, tabl)
  end)

  it ("tests GLT.split", function ()
    local testring = "a,b"
    local tab1 = GLT.split(testring, ",")
    assert.are.equal(tab1[1], "a")
    assert.are.equal(tab1[2], "b")
  end)

  it ("Tests GLT.FixQuotes", function()
    local teststring = [[Sequences[‘Druid_FeralST’] = {
author=”Aaralak@Nagrand”,
specID=103,
helpTxt = ‘Talents: 3331222’,]]
    local returnstring = [[Sequences['Druid_FeralST'] = {
author="Aaralak@Nagrand",
specID=103,
helpTxt = 'Talents: 3331222',]]
    assert.are.equal(returnstring, GLT.FixQuotes(teststring))
  end)

  it ("Tests GLT.UnEscapeSequence, GLT.UnEscapeString and GLT.UnescapeTable", function()
    local testsequence = {
      KeyPress={
        "/targetenemy [noharm][dead]",
      },
      PreMacro={
        "/cast [nochanneling] Elemental Blast",
      },
      "|cff88bbdd/cast|r [nochanneling] Lava Burst",
      "/cast [nochanneling] Stormkeeper",
      "/cast [nochanneling] Lightning Bolt",
      PostMacro={
        "/use 14",
      },
      KeyRelease={
      },
    }

    local expectedresultsequence = {
      KeyPress={
        "/targetenemy [noharm][dead]",
      },
      PreMacro={
        "/cast [nochanneling] Elemental Blast",
      },
      "/cast [nochanneling] Lava Burst",
      "/cast [nochanneling] Stormkeeper",
      "/cast [nochanneling] Lightning Bolt",
      PostMacro={
        "/use 14",
      },
      KeyRelease={
      },
    }

    local resultsequence = GLT.UnEscapeSequence(testsequence)

    assert.are.same(expectedresultsequence, resultsequence )

  end)

  it ("tests GLT.CleanStrings() removes noted values", function()
    assert.are.same("/cast Judgement", GLT.CleanStrings("/cast Judgement"))
    
  end)

  it ("tests that GLT.TrimWhiteSpace(str) removes preceeding whitespace", function()
    local teststr = [[

     test   ]]
     local expectedstr = [[test]]

     assert.are.same(expectedstr, GLT.TrimWhiteSpace(teststr))
  end)
end)
