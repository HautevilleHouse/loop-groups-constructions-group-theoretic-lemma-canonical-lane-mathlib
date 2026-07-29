import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

structure SugawaraConstruction (G : Type*) [TopologicalSpace G] [Group G] where
  stressTensor : Type*
  virasoroOperators : ℤ → (stressTensor → stressTensor)
  centralCharge : ℂ
  commutationRelations : Prop
  sugawaraClosed : Prop

structure SugawaraConstructionEvidence (G : Type*) [TopologicalSpace G] [Group G] (S : SugawaraConstruction G) where
  commutationRelationsClosed : S.commutationRelations
  sugawaraClosedTerm : S.sugawaraClosed

def SugawaraConstructionClosed (G : Type*) [TopologicalSpace G] [Group G] (S : SugawaraConstruction G) : Prop :=
  S.commutationRelations ∧ S.sugawaraClosed

theorem sugawara_construction_closed_from_evidence (G : Type*) [TopologicalSpace G] [Group G] (S : SugawaraConstruction G) (E : SugawaraConstructionEvidence G S) : SugawaraConstructionClosed G S :=
  And.intro E.commutationRelationsClosed E.sugawaraClosedTerm

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse