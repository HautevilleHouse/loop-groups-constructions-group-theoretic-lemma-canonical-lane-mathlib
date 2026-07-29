import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

structure KacMoodyAlgebra (G : Type u) [Group G] (L : LoopGroup G) (E : CentralExtension G L) where
  lieAlgebra : Type u
  lieBracket : lieAlgebra → lieAlgebra → lieAlgebra
  jacobiIdentity : ∀ x y z : lieAlgebra, lieBracket x (lieBracket y z) + lieBracket y (lieBracket z x) + lieBracket z (lieBracket x y) = 0
  anticommutativity : ∀ x y : lieAlgebra, lieBracket x y = -lieBracket y x
  underlyingVectorSpace : VectorSpace ℂ lieAlgebra
  representation : L.carrier → (lieAlgebra →ₗ[ℂ] lieAlgebra)
  representationCompatible : ∀ g h : L.carrier, ∀ x : lieAlgebra, representation (L.pointwiseMul g h) x = representation g (representation h x)
  derivedFromExtension : (Set.ker E.projectionMap) ≃ₗ[ℂ] Submodule ℂ lieAlgebra
  circleActionCompatible : ∀ θ : S¹, ∀ x : lieAlgebra, representation (E.circleAction θ E.extensionGroupUnit) x = x

structure KacMoodyEvidence (G : Type u) [Group G] (L : LoopGroup G) (E : CentralExtension G L) (K : KacMoodyAlgebra G L E) where
  jacobiIdentityClosed : ∀ x y z : K.lieAlgebra, K.lieBracket x (K.lieBracket y z) + K.lieBracket y (K.lieBracket z x) + K.lieBracket z (K.lieBracket x y) = 0
  anticommutativityClosed : ∀ x y : K.lieAlgebra, K.lieBracket x y = -K.lieBracket y x
  representationCompatibleClosed : ∀ g h : L.carrier, ∀ x : K.lieAlgebra, K.representation (L.pointwiseMul g h) x = K.representation g (K.representation h x)
  derivedFromExtensionClosed : (Set.ker E.projectionMap) ≃ₗ[ℂ] Submodule ℂ K.lieAlgebra
  circleActionCompatibleClosed : ∀ θ : S¹, ∀ x : K.lieAlgebra, K.representation (E.circleAction θ E.extensionGroupUnit) x = x

def KacMoodyClosed (G : Type u) [Group G] (L : LoopGroup G) (E : CentralExtension G L) (K : KacMoodyAlgebra G L E) : Prop :=
  (∀ x y z : K.lieAlgebra, K.lieBracket x (K.lieBracket y z) + K.lieBracket y (K.lieBracket z x) + K.lieBracket z (K.lieBracket x y) = 0) ∧
  (∀ x y : K.lieAlgebra, K.lieBracket x y = -K.lieBracket y x) ∧
  (∀ g h : L.carrier, ∀ x : K.lieAlgebra, K.representation (L.pointwiseMul g h) x = K.representation g (K.representation h x)) ∧
  Nonempty ((Set.ker E.projectionMap) ≃ₗ[ℂ] Submodule ℂ K.lieAlgebra) ∧
  (∀ θ : S¹, ∀ x : K.lieAlgebra, K.representation (E.circleAction θ E.extensionGroupUnit) x = x)

theorem kac_moody_closed_from_evidence (G : Type u) [Group G] (L : LoopGroup G) (E : CentralExtension G L) (K : KacMoodyAlgebra G L E) (Ev : KacMoodyEvidence G L E K) : KacMoodyClosed G L E K := by
  refine And.intro Ev.jacobiIdentityClosed (And.intro Ev.anticommutativityClosed (And.intro Ev.representationCompatibleClosed (And.intro (Nonempty.intro Ev.derivedFromExtensionClosed) Ev.circleActionCompatibleClosed)))

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse
