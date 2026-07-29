import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

structure TheoremBoundary where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  carriedRemainder : String

def sourceRepository : String := "LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean"
def sourceDescription : String := "Loop Groups Constructions Group Theoretic Lemma"
def sourceTheoremBoundary : TheoremBoundary :=
  { sourceKey := sourceRepository,
    theoremName := "LoopGroupsConstructionsGroupTheoreticLemma",
    theoremObject := sourceDescription,
    classicalBoundary := "central extension existence via admissible loop group objects",
    carriedRemainder := "unrestricted classical boundary remains open" }

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse