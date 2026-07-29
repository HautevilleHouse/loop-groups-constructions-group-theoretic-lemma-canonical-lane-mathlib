import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

structure HighestWeightModule (G : Type u) [Group G] (L : LoopGroup G) (E : CentralExtension G L) (K : KacMoodyAlgebra G L E) where
  moduleSpace : Type u
  moduleStructure : Module ℂ moduleSpace
  action : K.lieAlgebra → moduleSpace →ₗ[ℂ] moduleSpace
  highestWeightVector : moduleSpace
  weight : (Set.ker E.projectionMap) → ℂ
  weightFunction : ∀ h : Set.ker E.projectionMap, action (E.derivedFromExtension h) highestWeightVector = weight h • highestWeightVector
  annihilationByPositiveRoots : ∀ (x : K.lieAlgebra), (∃ (h : Set.ker E.projectionMap), K.lieBracket (E.derivedFromExtension h) x = 0) → action x highestWeightVector = 0
  irreducibility : IsSimpleModule ℂ moduleSpace

structure HighestWeightEvidence (G : Type u) [Group G] (L : LoopGroup G) (E : CentralExtension G L) (K : KacMoodyAlgebra G L E) (M : HighestWeightModule G L E K) where
  weightFunctionClosed : ∀ h : Set.ker E.projectionMap, M.action (E.derivedFromExtension h) M.highestWeightVector = M.weight h • M.highestWeightVector
  annihilationClosed : ∀ (x : K.lieAlgebra), (∃ (h : Set.ker E.projectionMap), K.lieBracket (E.derivedFromExtension h) x = 0) → M.action x M.highestWeightVector = 0
  irreducibilityClosed : IsSimpleModule ℂ M.moduleSpace

def HighestWeightClosed (G : Type u) [Group G] (L : LoopGroup G) (E : CentralExtension G L) (K : KacMoodyAlgebra G L E) (M : HighestWeightModule G L E K) : Prop :=
  (∀ h : Set.ker E.projectionMap, M.action (E.derivedFromExtension h) M.highestWeightVector = M.weight h • M.highestWeightVector) ∧
  (∀ (x : K.lieAlgebra), (∃ (h : Set.ker E.projectionMap), K.lieBracket (E.derivedFromExtension h) x = 0) → M.action x M.highestWeightVector = 0) ∧
  IsSimpleModule ℂ M.moduleSpace

theorem highest_weight_closed_from_evidence (G : Type u) [Group G] (L : LoopGroup G) (E : CentralExtension G L) (K : KacMoodyAlgebra G L E) (M : HighestWeightModule G L E K) (Ev : HighestWeightEvidence G L E K M) : HighestWeightClosed G L E K M := by
  exact And.intro Ev.weightFunctionClosed (And.intro Ev.annihilationClosed Ev.irreducibilityClosed)

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse
