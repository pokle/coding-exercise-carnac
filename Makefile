run: carnac
	./carnac

carnac: carnac.hs
	ghc carnac.hs
