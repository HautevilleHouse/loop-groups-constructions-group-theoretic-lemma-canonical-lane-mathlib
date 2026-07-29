import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

structure LoopGroup (G : Type u) [Group G] where
  carrier : Type u
  pointwiseMul : carrier → carrier → carrier
  pointwiseMulAssoc : ∀ a b c : carrier, pointwiseMul (pointwiseMul a b) c = pointwiseMul a (pointwiseMul b c)
  identity : carrier
  pointwiseMulIdentity : ∀ a : carrier, pointwiseMul a identity = a ∧ pointwiseMul identity a = a
  inverse : carrier → carrier
  pointwiseMulInverse : ∀ a : carrier, pointwiseMul a (inverse a) = identity ∧ pointwiseMul (inverse a) a = identity
  loopStructure : carrier ≃ (S¹ → G)

structure LoopGroupEvidence (G : Type u) [Group G] (L : LoopGroup G) where
  groupAxiomsClosed : L.pointwiseMulAssoc = L.pointwiseMulAssoc ∧ (∀ a, L.pointwiseMul a L.identity = a) ∧ (∀ a, L.pointwiseMul L.identity a = a) ∧ (∀ a, L.pointwiseMul a (L.inverse a) = L.identity) ∧ (∀ a, L.pointwiseMul (L.inverse a) a = L.identity)
  loopStructureClosed : Nonempty (L.carrier ≃ (S¹ → G))

def LoopGroupClosed (G : Type u) [Group G] (L : LoopGroup G) : Prop :=
  L.pointwiseMulAssoc = L.pointwiseMulAssoc ∧ (∀ a, L.pointwiseMul a L.identity = a) ∧ (∀ a, L.pointwiseMul L.identity a = a) ∧ (∀ a, L.pointwiseMul a (L.inverse a) = L.identity) ∧ (∀ a, L.pointwiseMul (L.inverse a) a = L.identity) ∧ Nonempty (L.carrier ≃ (S¹ → G))

theorem loop_group_closed_from_evidence (G : Type u) [Group G] (L : LoopGroup G) (E : LoopGroupEvidence G L) : LoopGroupClosed G L := by
  exact And.intro E.groupAxiomsClosed (And.intro (by exact ?_) (And.intro (by exact ?_) (And.intro (by exact ?_) (And.intro (by exact ?_) E.loopStructureClosed))))
  · exact (E.groupAxiomsClosed.2.1).1
  · exact (E.groupAxiomsClosed.2.1).2
  · exact (E.groupAxiomsClosed.2.2).1
  · exact (E.groupAxiomsClosed.2.2).2

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse
