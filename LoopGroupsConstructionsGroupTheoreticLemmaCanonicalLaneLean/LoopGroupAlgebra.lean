import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

structure LoopGroupAlgebra (k : Type) [Field k] where
  baseLoopSpace : Type
  pointwiseMultiplication : baseLoopSpace → baseLoopSpace → baseLoopSpace
  pointwiseAddition : baseLoopSpace → baseLoopSpace → baseLoopSpace
  scalarMultiplication : k → baseLoopSpace → baseLoopSpace
  loopAdditionAssociative : Prop
  loopAdditionCommutative : Prop
  multiplicationDistributive : Prop
  scalarAssociative : Prop
  scalarDistributive : Prop

structure LoopGroupAlgebraEvidence (A : LoopGroupAlgebra k) where
  loopAdditionAssociativeClosed : A.loopAdditionAssociative
  loopAdditionCommutativeClosed : A.loopAdditionCommutative
  multiplicationDistributiveClosed : A.multiplicationDistributive
  scalarAssociativeClosed : A.scalarAssociative
  scalarDistributiveClosed : A.scalarDistributive

def LoopGroupAlgebraClosed (A : LoopGroupAlgebra k) : Prop :=
  A.loopAdditionAssociative ∧ A.loopAdditionCommutative ∧
  A.multiplicationDistributive ∧ A.scalarAssociative ∧
  A.scalarDistributive

theorem loop_group_algebra_closed_from_evidence (A : LoopGroupAlgebra k)
    (E : LoopGroupAlgebraEvidence A) : LoopGroupAlgebraClosed A := by
  exact And.intro E.loopAdditionAssociativeClosed
    (And.intro E.loopAdditionCommutativeClosed
      (And.intro E.multiplicationDistributiveClosed
        (And.intro E.scalarAssociativeClosed E.scalarDistributiveClosed)))

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse
