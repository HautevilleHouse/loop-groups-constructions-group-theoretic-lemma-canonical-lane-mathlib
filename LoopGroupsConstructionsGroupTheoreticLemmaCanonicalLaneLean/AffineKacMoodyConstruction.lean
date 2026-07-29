import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

structure AffineKacMoodyConstruction (k : Type) [Field k] where
  loopAlgebra : LoopGroupAlgebra k
  centralExtension : CentralExtension k
  derivation : Type
  derivationAction : derivation → loopAlgebra.baseLoopSpace → loopAlgebra.baseLoopSpace
  commutationRelations : Prop
  invariantForm : Prop
  weylGroupAction : Prop
  integrableRep : Prop

structure AffineKacMoodyConstructionEvidence (A : AffineKacMoodyConstruction k) where
  commutationRelationsClosed : A.commutationRelations
  invariantFormClosed : A.invariantForm
  weylGroupActionClosed : A.weylGroupAction
  integrableRepClosed : A.integrableRep

def AffineKacMoodyConstructionClosed (A : AffineKacMoodyConstruction k) : Prop :=
  A.commutationRelations ∧ A.invariantForm ∧
  A.weylGroupAction ∧ A.integrableRep

theorem affine_kac_moody_construction_closed_from_evidence
    (A : AffineKacMoodyConstruction k)
    (E : AffineKacMoodyConstructionEvidence A) :
    AffineKacMoodyConstructionClosed A := by
  exact And.intro E.commutationRelationsClosed
    (And.intro E.invariantFormClosed
      (And.intro E.weylGroupActionClosed E.integrableRepClosed))

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse
