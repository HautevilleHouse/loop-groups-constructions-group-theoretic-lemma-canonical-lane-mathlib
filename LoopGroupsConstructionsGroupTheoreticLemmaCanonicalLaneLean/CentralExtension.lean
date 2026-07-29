import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean

structure CentralExtension (G : Type u) [Group G] (L : LoopGroup G) where
  extensionGroup : Type u
  extensionGroupMul : extensionGroup → extensionGroup → extensionGroup
  extensionGroupUnit : extensionGroup
  extensionGroupInv : extensionGroup → extensionGroup
  groupAxioms : ∀ a b c : extensionGroup, extensionGroupMul (extensionGroupMul a b) c = extensionGroupMul a (extensionGroupMul b c) ∧
    extensionGroupMul a extensionGroupUnit = a ∧ extensionGroupMul extensionGroupUnit a = a ∧
    extensionGroupMul a (extensionGroupInv a) = extensionGroupUnit ∧ extensionGroupMul (extensionGroupInv a) a = extensionGroupUnit
  projectionMap : extensionGroup → L.carrier
  projectionHomomorphism : ∀ a b : extensionGroup, projectionMap (extensionGroupMul a b) = L.pointwiseMul (projectionMap a) (projectionMap b)
  kernelAbelian : AbelianGroup (Set.ker projectionMap)
  circleAction : S¹ → extensionGroup → extensionGroup
  circleActionCompatible : ∀ θ : S¹, ∀ a : extensionGroup, projectionMap (circleAction θ a) = projectionMap a

structure CentralExtensionEvidence (G : Type u) [Group G] (L : LoopGroup G) (E : CentralExtension G L) where
  groupAxiomsClosed : ∀ a b c : E.extensionGroup, E.extensionGroupMul (E.extensionGroupMul a b) c = E.extensionGroupMul a (E.extensionGroupMul b c) ∧
    E.extensionGroupMul a E.extensionGroupUnit = a ∧ E.extensionGroupMul E.extensionGroupUnit a = a ∧
    E.extensionGroupMul a (E.extensionGroupInv a) = E.extensionGroupUnit ∧ E.extensionGroupMul (E.extensionGroupInv a) a = E.extensionGroupUnit
  projectionHomomorphismClosed : ∀ a b : E.extensionGroup, E.projectionMap (E.extensionGroupMul a b) = L.pointwiseMul (E.projectionMap a) (E.projectionMap b)
  kernelAbelianClosed : IsAbelian (Set.ker E.projectionMap)
  circleActionCompatibleClosed : ∀ θ : S¹, ∀ a : E.extensionGroup, E.projectionMap (E.circleAction θ a) = E.projectionMap a

def CentralExtensionClosed (G : Type u) [Group G] (L : LoopGroup G) (E : CentralExtension G L) : Prop :=
  (∀ a b c : E.extensionGroup, E.extensionGroupMul (E.extensionGroupMul a b) c = E.extensionGroupMul a (E.extensionGroupMul b c) ∧
    E.extensionGroupMul a E.extensionGroupUnit = a ∧ E.extensionGroupMul E.extensionGroupUnit a = a ∧
    E.extensionGroupMul a (E.extensionGroupInv a) = E.extensionGroupUnit ∧ E.extensionGroupMul (E.extensionGroupInv a) a = E.extensionGroupUnit) ∧
  (∀ a b : E.extensionGroup, E.projectionMap (E.extensionGroupMul a b) = L.pointwiseMul (E.projectionMap a) (E.projectionMap b)) ∧
  IsAbelian (Set.ker E.projectionMap) ∧
  (∀ θ : S¹, ∀ a : E.extensionGroup, E.projectionMap (E.circleAction θ a) = E.projectionMap a)

theorem central_extension_closed_from_evidence (G : Type u) [Group G] (L : LoopGroup G) (E : CentralExtension G L) (Ev : CentralExtensionEvidence G L E) : CentralExtensionClosed G L E := by
  refine And.intro Ev.groupAxiomsClosed (And.intro Ev.projectionHomomorphismClosed (And.intro Ev.kernelAbelianClosed Ev.circleActionCompatibleClosed))

end LoopGroupsConstructionsGroupTheoreticLemmaCanonicalLaneLean
end HautevilleHouse
