Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D3C441A
	for <llvm@lists.linux.dev>; Wed,  5 Oct 2022 18:47:17 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id x32-20020a17090a38a300b00209dced49cfso2643393pjb.0
        for <llvm@lists.linux.dev>; Wed, 05 Oct 2022 11:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=pShbk/EsUm1t/4omZpGj5FA2liL2IhjcLVlHmRf06Jc=;
        b=YLSz9oMAfTnNftS/vepY77Gc0Q3RFJnpKMpv0BUPBA8jb5dZzdWtGj6iTjdC9HgLSD
         iDM+dZdNCmwGaquWR9+woaQtTAWpYu8N/FI845WxYnyBEYQUeY5rryHEBP6NeBwbtjy8
         dxYS8nKIT05CywxDR2tlVCBjTy8CqOI+bSQsIJlTe9hpxzT/CoahP2wO7eKevX+5RXLy
         x0TCcjsMxLvjilqDrZVWMz6ywemYTzntVmUNJmaCCDgQHdCK2hGFESyj89kXTVYMfeg3
         tQZEClcIqCdDhEK+sdSHiZxPsvECFibj4oyz2+Y2FjOeGnZmluRQQrO15xviKvv1TAUx
         Tskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=pShbk/EsUm1t/4omZpGj5FA2liL2IhjcLVlHmRf06Jc=;
        b=unL8nC8niL2wNXtcUddA+UIQEM4to8R4RYhLDyZ674EVQxpqzrkxnZxiMSpB017Aw2
         ZvcOTepIVMNHbjU44bZW4uM8/lEHMyadXhfwjyvV3QSkoqpslzwtvL0mWsDHqB5JITL4
         H4iaMgsyrlMUkiMwX+58AiyiB6l7WOFPbPfwhNU8wZNRcwKxyOtd0x09qmJH0Kg0ErPA
         5mDtpFX8hJnyxD+TPJKomnIaPvSmTOyutzg6a59a6QX7KPuK9ypoGy00N3aO2I+hYIK1
         tjVM2FZ71oPVQqP8SxZ18i+bmIlcf5om474aLOdVVBVOanatuj6r6oA9/HzmsYppS9++
         5QMQ==
X-Gm-Message-State: ACrzQf3zE+ii6EJvD95yuzvcLTp4y/OZyJpkd6AEyMXx4RuIP0JcS0oP
	TQNcm28yuqMTXxnG1MTZzZfMR6QLhEkYnRFqII7JJ8I5Zq1vXA==
X-Google-Smtp-Source: AMsMyM6UUot2c8cM7XGoBoIFyluJh31A23XfszaEmBa5StO60yOqXFl70cDK3UYwKO3u2y8W2NOJIXJ8yoHiFFEtAgs=
X-Received: by 2002:a17:902:b210:b0:17d:c3ca:4a4f with SMTP id
 t16-20020a170902b21000b0017dc3ca4a4fmr845733plr.33.1664995636057; Wed, 05 Oct
 2022 11:47:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1381147791.7160.1664995454696@jenkins.jenkins>
In-Reply-To: <1381147791.7160.1664995454696@jenkins.jenkins>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 5 Oct 2022 11:47:04 -0700
Message-ID: <CAKwvOdnVstWBFzujquTFQ3Nf8BiZvYxSa7kj24gBWBufqTHL-g@mail.gmail.com>
Subject: Re: [TCWG CI] Failure after llvmorg-16-init-6570-gb20e34b39f72:
 [InstCombine] Switch foldOpIntoPhi() to use InstSimplify
To: llvm@lists.linux.dev
Cc: Nikita Popov <npopov@redhat.com>, ci_notify@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 5, 2022 at 11:44 AM <ci_notify@linaro.org> wrote:
>
> Failure after llvmorg-16-init-6570-gb20e34b39f72: [InstCombine] Switch foldOpIntoPhi() to use InstSimplify:

Thanks for the report, looks like it was reverted in
https://reviews.llvm.org/rGd7592bbb0362b38d82bdf6e97294f54059e3f456

>
> Results changed to
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 21247
> # First few build errors in logs:
> # 00:06:30 clang-16: error: clang frontend command failed with exit code 134 (use -v to see invocation)
> # 00:06:31 make[4]: *** [scripts/Makefile.build:249: drivers/video/fbdev/sis/sis_main.o] Error 1
> # 00:06:55 make[3]: *** [scripts/Makefile.build:465: drivers/video/fbdev/sis] Error 2
> # 00:12:24 sound/soc/atmel/mchp-spdiftx.c:505:20: error: implicit truncation from 'int' to a one-bit wide bit-field changes value from 1 to -1 [-Werror,-Wsingle-bit-bitfield-constant-conversion]
> # 00:12:24 make[3]: *** [scripts/Makefile.build:249: sound/soc/atmel/mchp-spdiftx.o] Error 1
> # 00:12:26 make[2]: *** [scripts/Makefile.build:465: drivers/video/fbdev] Error 2
> # 00:12:26 make[1]: *** [scripts/Makefile.build:465: drivers/video] Error 2
> # 00:12:51 make[2]: *** [scripts/Makefile.build:465: sound/soc/atmel] Error 2
> # 00:23:47 clang-16: error: clang frontend command failed with exit code 134 (use -v to see invocation)
> # 00:23:47 make[3]: *** [scripts/Makefile.build:249: drivers/scsi/aic7xxx/aic79xx_core.o] Error 1
>
> from
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 21254
>
> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
>
> For latest status see comments in https://linaro.atlassian.net/browse/LLVM-646 .
> Status of llvmorg-16-init-6570-gb20e34b39f72 commit for tcwg_kernel:
> commit b20e34b39f72f2be035dfb7367b6880fd2cf213a
> Author: Nikita Popov <npopov@redhat.com>
> Date:   Fri Sep 30 12:13:40 2022 +0200
>
>     [InstCombine] Switch foldOpIntoPhi() to use InstSimplify
>
>     foldOpIntoPhi() currently only folds operations into the phi if all
>     but one operands constant-fold. The two exceptions to this are freeze
>     and select, where we allow more general simplification.
>
>     This patch makes foldOpIntoPhi() generally simplification based and
>     removes all the instruction-specific logic. We just try to simplify
>     the instruction for each operand, and for the (potentially) one
>     non-simplified operand, we move it into the new block with adjusted
>     operands.
>
>     This fixes https://github.com/llvm/llvm-project/issues/57448, which
>     was my original motivation for the change.
> * llvm-master-aarch64-norov-allyesconfig
> ** Failure after llvmorg-16-init-6570-gb20e34b39f72: [InstCombine] Switch foldOpIntoPhi() to use InstSimplify:
> ** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-norov-allyesconfig/61/
>
> Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-norov-allyesconfig/61/artifact/artifacts
> Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-norov-allyesconfig/60/artifact/artifacts
>
> Reproduce current build:
> <cut>
> mkdir -p investigate-llvm-b20e34b39f72f2be035dfb7367b6880fd2cf213a
> cd investigate-llvm-b20e34b39f72f2be035dfb7367b6880fd2cf213a
>
> # Fetch scripts
> git clone https://git.linaro.org/toolchain/jenkins-scripts
>
> # Fetch manifests for bad and good builds
> mkdir -p bad/artifacts good/artifacts
> curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-norov-allyesconfig/61/artifact/artifacts/manifest.sh --fail
> curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-norov-allyesconfig/60/artifact/artifacts/manifest.sh --fail
>
> # Reproduce bad build
> (cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
> # Reproduce good build
> (cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
> </cut>
>
> Full commit (up to 1000 lines):
> <cut>
> commit b20e34b39f72f2be035dfb7367b6880fd2cf213a
> Author: Nikita Popov <npopov@redhat.com>
> Date:   Fri Sep 30 12:13:40 2022 +0200
>
>     [InstCombine] Switch foldOpIntoPhi() to use InstSimplify
>
>     foldOpIntoPhi() currently only folds operations into the phi if all
>     but one operands constant-fold. The two exceptions to this are freeze
>     and select, where we allow more general simplification.
>
>     This patch makes foldOpIntoPhi() generally simplification based and
>     removes all the instruction-specific logic. We just try to simplify
>     the instruction for each operand, and for the (potentially) one
>     non-simplified operand, we move it into the new block with adjusted
>     operands.
>
>     This fixes https://github.com/llvm/llvm-project/issues/57448, which
>     was my original motivation for the change.
> ---
>  .../InstCombine/InstructionCombining.cpp           | 167 +++++++--------------
>  llvm/test/Transforms/InstCombine/intptr1.ll        |   9 +-
>  llvm/test/Transforms/InstCombine/intptr4.ll        |   7 +-
>  llvm/test/Transforms/InstCombine/intptr5.ll        |   7 +-
>  llvm/test/Transforms/InstCombine/intptr7.ll        |   7 +-
>  .../Transforms/InstCombine/phi-select-constant.ll  |   8 +-
>  llvm/test/Transforms/InstCombine/phi.ll            |  10 +-
>  llvm/test/Transforms/InstCombine/recurrence.ll     |   4 +-
>  8 files changed, 74 insertions(+), 145 deletions(-)
>
> diff --git a/llvm/lib/Transforms/InstCombine/InstructionCombining.cpp b/llvm/lib/Transforms/InstCombine/InstructionCombining.cpp
> index 29fb40be1afb..4e939d9b46e6 100644
> --- a/llvm/lib/Transforms/InstCombine/InstructionCombining.cpp
> +++ b/llvm/lib/Transforms/InstCombine/InstructionCombining.cpp
> @@ -1155,22 +1155,6 @@ Instruction *InstCombinerImpl::FoldOpIntoSelect(Instruction &Op, SelectInst *SI,
>    return SelectInst::Create(SI->getCondition(), NewTV, NewFV, "", nullptr, SI);
>  }
>
> -static Value *foldOperationIntoPhiValue(BinaryOperator *I, Value *InV,
> -                                        InstCombiner::BuilderTy &Builder) {
> -  bool ConstIsRHS = isa<Constant>(I->getOperand(1));
> -  Constant *C = cast<Constant>(I->getOperand(ConstIsRHS));
> -
> -  Value *Op0 = InV, *Op1 = C;
> -  if (!ConstIsRHS)
> -    std::swap(Op0, Op1);
> -
> -  Value *RI = Builder.CreateBinOp(I->getOpcode(), Op0, Op1, "phi.bo");
> -  auto *FPInst = dyn_cast<Instruction>(RI);
> -  if (FPInst && isa<FPMathOperator>(FPInst))
> -    FPInst->copyFastMathFlags(I);
> -  return RI;
> -}
> -
>  Instruction *InstCombinerImpl::foldOpIntoPhi(Instruction &I, PHINode *PN) {
>    unsigned NumPHIValues = PN->getNumIncomingValues();
>    if (NumPHIValues == 0)
> @@ -1189,48 +1173,66 @@ Instruction *InstCombinerImpl::foldOpIntoPhi(Instruction &I, PHINode *PN) {
>      // Otherwise, we can replace *all* users with the new PHI we form.
>    }
>
> -  // Check to see if all of the operands of the PHI are simple constants
> -  // (constantint/constantfp/undef).  If there is one non-constant value,
> -  // remember the BB it is in.  If there is more than one or if *it* is a PHI,
> -  // bail out.  We don't do arbitrary constant expressions here because moving
> -  // their computation can be expensive without a cost model.
> -  BasicBlock *NonConstBB = nullptr;
> +  // Check to see whether the instruction can be folded into each phi operand.
> +  // If there is one operand that does not fold, remember the BB it is in.
> +  // If there is more than one or if *it* is a PHI, bail out.
> +  SmallVector<Value *> NewPhiValues;
> +  BasicBlock *NonSimplifiedBB = nullptr;
> +  Value *NonSimplifiedInVal = nullptr;
>    for (unsigned i = 0; i != NumPHIValues; ++i) {
>      Value *InVal = PN->getIncomingValue(i);
> -    // For non-freeze, require constant operand
> -    // For freeze, require non-undef, non-poison operand
> -    if (!isa<FreezeInst>(I) && match(InVal, m_ImmConstant()))
> -      continue;
> -    if (isa<FreezeInst>(I) && isGuaranteedNotToBeUndefOrPoison(InVal))
> +    BasicBlock *InBB = PN->getIncomingBlock(i);
> +
> +    // NB: It is a precondition of this transform that the operands be
> +    // phi translatable! This is usually trivially satisfied by limiting it
> +    // to constant ops, and for selects we do a more sophisticated check.
> +    SmallVector<Value *> Ops;
> +    for (Value *Op : I.operands()) {
> +      if (Op == PN)
> +        Ops.push_back(InVal);
> +      else
> +        Ops.push_back(Op->DoPHITranslation(PN->getParent(), InBB));
> +    }
> +
> +    // Don't consider the simplification successful if we get back a constant
> +    // expression. That's just an instruction in hiding.
> +    Value *NewVal = simplifyInstructionWithOperands(&I, Ops, SQ);
> +    if (NewVal && !match(NewVal, m_ConstantExpr())) {
> +      NewPhiValues.push_back(NewVal);
>        continue;
> +    }
>
>      if (isa<PHINode>(InVal)) return nullptr;  // Itself a phi.
> -    if (NonConstBB) return nullptr;  // More than one non-const value.
> +    if (NonSimplifiedBB) return nullptr;  // More than one non-simplified value.
>
> -    NonConstBB = PN->getIncomingBlock(i);
> +    NonSimplifiedBB = InBB;
> +    NonSimplifiedInVal = InVal;
> +    NewPhiValues.push_back(nullptr);
>
>      // If the InVal is an invoke at the end of the pred block, then we can't
>      // insert a computation after it without breaking the edge.
>      if (isa<InvokeInst>(InVal))
> -      if (cast<Instruction>(InVal)->getParent() == NonConstBB)
> +      if (cast<Instruction>(InVal)->getParent() == NonSimplifiedBB)
>          return nullptr;
>
>      // If the incoming non-constant value is reachable from the phis block,
>      // we'll push the operation across a loop backedge. This could result in
>      // an infinite combine loop, and is generally non-profitable (especially
>      // if the operation was originally outside the loop).
> -    if (isPotentiallyReachable(PN->getParent(), NonConstBB, nullptr, &DT, LI))
> +    if (isPotentiallyReachable(PN->getParent(), NonSimplifiedBB, nullptr, &DT,
> +                               LI))
>        return nullptr;
>    }
>
> -  // If there is exactly one non-constant value, we can insert a copy of the
> +  // If there is exactly one non-simplified value, we can insert a copy of the
>    // operation in that block.  However, if this is a critical edge, we would be
>    // inserting the computation on some other paths (e.g. inside a loop).  Only
>    // do this if the pred block is unconditionally branching into the phi block.
>    // Also, make sure that the pred block is not dead code.
> -  if (NonConstBB != nullptr) {
> -    BranchInst *BI = dyn_cast<BranchInst>(NonConstBB->getTerminator());
> -    if (!BI || !BI->isUnconditional() || !DT.isReachableFromEntry(NonConstBB))
> +  if (NonSimplifiedBB != nullptr) {
> +    BranchInst *BI = dyn_cast<BranchInst>(NonSimplifiedBB->getTerminator());
> +    if (!BI || !BI->isUnconditional() ||
> +        !DT.isReachableFromEntry(NonSimplifiedBB))
>        return nullptr;
>    }
>
> @@ -1241,88 +1243,23 @@ Instruction *InstCombinerImpl::foldOpIntoPhi(Instruction &I, PHINode *PN) {
>
>    // If we are going to have to insert a new computation, do so right before the
>    // predecessor's terminator.
> -  if (NonConstBB)
> -    Builder.SetInsertPoint(NonConstBB->getTerminator());
> -
> -  // Next, add all of the operands to the PHI.
> -  if (SelectInst *SI = dyn_cast<SelectInst>(&I)) {
> -    // We only currently try to fold the condition of a select when it is a phi,
> -    // not the true/false values.
> -    Value *TrueV = SI->getTrueValue();
> -    Value *FalseV = SI->getFalseValue();
> -    BasicBlock *PhiTransBB = PN->getParent();
> -    for (unsigned i = 0; i != NumPHIValues; ++i) {
> -      BasicBlock *ThisBB = PN->getIncomingBlock(i);
> -      Value *TrueVInPred = TrueV->DoPHITranslation(PhiTransBB, ThisBB);
> -      Value *FalseVInPred = FalseV->DoPHITranslation(PhiTransBB, ThisBB);
> -      Value *InV = nullptr;
> -      // Beware of ConstantExpr:  it may eventually evaluate to getNullValue,
> -      // even if currently isNullValue gives false.
> -      Constant *InC = dyn_cast<Constant>(PN->getIncomingValue(i));
> -      // For vector constants, we cannot use isNullValue to fold into
> -      // FalseVInPred versus TrueVInPred. When we have individual nonzero
> -      // elements in the vector, we will incorrectly fold InC to
> -      // `TrueVInPred`.
> -      if (InC && isa<ConstantInt>(InC))
> -        InV = InC->isNullValue() ? FalseVInPred : TrueVInPred;
> -      else {
> -        // Generate the select in the same block as PN's current incoming block.
> -        // Note: ThisBB need not be the NonConstBB because vector constants
> -        // which are constants by definition are handled here.
> -        // FIXME: This can lead to an increase in IR generation because we might
> -        // generate selects for vector constant phi operand, that could not be
> -        // folded to TrueVInPred or FalseVInPred as done for ConstantInt. For
> -        // non-vector phis, this transformation was always profitable because
> -        // the select would be generated exactly once in the NonConstBB.
> -        Builder.SetInsertPoint(ThisBB->getTerminator());
> -        InV = Builder.CreateSelect(PN->getIncomingValue(i), TrueVInPred,
> -                                   FalseVInPred, "phi.sel");
> -      }
> -      NewPN->addIncoming(InV, ThisBB);
> -    }
> -  } else if (CmpInst *CI = dyn_cast<CmpInst>(&I)) {
> -    Constant *C = cast<Constant>(I.getOperand(1));
> -    for (unsigned i = 0; i != NumPHIValues; ++i) {
> -      Value *InV = nullptr;
> -      if (auto *InC = dyn_cast<Constant>(PN->getIncomingValue(i)))
> -        InV = ConstantExpr::getCompare(CI->getPredicate(), InC, C);
> -      else
> -        InV = Builder.CreateCmp(CI->getPredicate(), PN->getIncomingValue(i),
> -                                C, "phi.cmp");
> -      NewPN->addIncoming(InV, PN->getIncomingBlock(i));
> -    }
> -  } else if (auto *BO = dyn_cast<BinaryOperator>(&I)) {
> -    for (unsigned i = 0; i != NumPHIValues; ++i) {
> -      Value *InV = foldOperationIntoPhiValue(BO, PN->getIncomingValue(i),
> -                                             Builder);
> -      NewPN->addIncoming(InV, PN->getIncomingBlock(i));
> -    }
> -  } else if (isa<FreezeInst>(&I)) {
> -    for (unsigned i = 0; i != NumPHIValues; ++i) {
> -      Value *InV;
> -      if (NonConstBB == PN->getIncomingBlock(i))
> -        InV = Builder.CreateFreeze(PN->getIncomingValue(i), "phi.fr");
> +  Instruction *Clone = nullptr;
> +  if (NonSimplifiedBB) {
> +    Clone = I.clone();
> +    for (Use &U : Clone->operands()) {
> +      if (U == PN)
> +        U = NonSimplifiedInVal;
>        else
> -        InV = PN->getIncomingValue(i);
> -      NewPN->addIncoming(InV, PN->getIncomingBlock(i));
> -    }
> -  } else if (auto *EV = dyn_cast<ExtractValueInst>(&I)) {
> -    for (unsigned i = 0; i != NumPHIValues; ++i)
> -      NewPN->addIncoming(Builder.CreateExtractValue(PN->getIncomingValue(i),
> -                                                    EV->getIndices(), "phi.ev"),
> -                         PN->getIncomingBlock(i));
> -  } else {
> -    CastInst *CI = cast<CastInst>(&I);
> -    Type *RetTy = CI->getType();
> -    for (unsigned i = 0; i != NumPHIValues; ++i) {
> -      Value *InV;
> -      if (Constant *InC = dyn_cast<Constant>(PN->getIncomingValue(i)))
> -        InV = ConstantExpr::getCast(CI->getOpcode(), InC, RetTy);
> -      else
> -        InV = Builder.CreateCast(CI->getOpcode(), PN->getIncomingValue(i),
> -                                 I.getType(), "phi.cast");
> -      NewPN->addIncoming(InV, PN->getIncomingBlock(i));
> +        U = U->DoPHITranslation(PN->getParent(), NonSimplifiedBB);
>      }
> +    InsertNewInstBefore(Clone, *NonSimplifiedBB->getTerminator());
> +  }
> +
> +  for (unsigned i = 0; i != NumPHIValues; ++i) {
> +    if (NewPhiValues[i])
> +      NewPN->addIncoming(NewPhiValues[i], PN->getIncomingBlock(i));
> +    else
> +      NewPN->addIncoming(Clone, PN->getIncomingBlock(i));
>    }
>
>    for (User *U : make_early_inc_range(PN->users())) {
> diff --git a/llvm/test/Transforms/InstCombine/intptr1.ll b/llvm/test/Transforms/InstCombine/intptr1.ll
> index 37febe3ee498..0f46efaacad9 100644
> --- a/llvm/test/Transforms/InstCombine/intptr1.ll
> +++ b/llvm/test/Transforms/InstCombine/intptr1.ll
> @@ -57,19 +57,18 @@ define void @test1_neg(ptr %a, ptr readnone %a_end, ptr %b.i64) {
>  ; CHECK-NEXT:    br i1 [[CMP1]], label [[FOR_BODY_PREHEADER:%.*]], label [[FOR_END:%.*]]
>  ; CHECK:       for.body.preheader:
>  ; CHECK-NEXT:    [[B:%.*]] = load i64, ptr [[B_I64:%.*]], align 8
> +; CHECK-NEXT:    [[TMP0:%.*]] = inttoptr i64 [[B]] to ptr
>  ; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
>  ; CHECK:       for.body:
>  ; CHECK-NEXT:    [[A_ADDR_03:%.*]] = phi ptr [ [[INCDEC_PTR:%.*]], [[BB:%.*]] ], [ [[A]], [[FOR_BODY_PREHEADER]] ]
> -; CHECK-NEXT:    [[B_ADDR_02:%.*]] = phi i64 [ [[ADD_INT:%.*]], [[BB]] ], [ [[B]], [[FOR_BODY_PREHEADER]] ]
> -; CHECK-NEXT:    [[TMP:%.*]] = inttoptr i64 [[B_ADDR_02]] to ptr
> -; CHECK-NEXT:    [[PTRCMP:%.*]] = icmp ult ptr [[TMP]], [[A_END]]
> +; CHECK-NEXT:    [[B_ADDR_02:%.*]] = phi ptr [ [[ADD:%.*]], [[BB]] ], [ [[TMP0]], [[FOR_BODY_PREHEADER]] ]
> +; CHECK-NEXT:    [[PTRCMP:%.*]] = icmp ult ptr [[B_ADDR_02]], [[A_END]]
>  ; CHECK-NEXT:    br i1 [[PTRCMP]], label [[FOR_END]], label [[BB]]
>  ; CHECK:       bb:
>  ; CHECK-NEXT:    [[I1:%.*]] = load float, ptr [[A]], align 4
>  ; CHECK-NEXT:    [[MUL_I:%.*]] = fmul float [[I1]], 4.200000e+01
>  ; CHECK-NEXT:    store float [[MUL_I]], ptr [[A_ADDR_03]], align 4
> -; CHECK-NEXT:    [[ADD:%.*]] = getelementptr inbounds float, ptr [[A]], i64 1
> -; CHECK-NEXT:    [[ADD_INT]] = ptrtoint ptr [[ADD]] to i64
> +; CHECK-NEXT:    [[ADD]] = getelementptr inbounds float, ptr [[A]], i64 1
>  ; CHECK-NEXT:    [[INCDEC_PTR]] = getelementptr inbounds float, ptr [[A_ADDR_03]], i64 1
>  ; CHECK-NEXT:    [[CMP:%.*]] = icmp ult ptr [[INCDEC_PTR]], [[A_END]]
>  ; CHECK-NEXT:    br i1 [[CMP]], label [[FOR_BODY]], label [[FOR_END]]
> diff --git a/llvm/test/Transforms/InstCombine/intptr4.ll b/llvm/test/Transforms/InstCombine/intptr4.ll
> index 333d278d0bf6..193b45a315da 100644
> --- a/llvm/test/Transforms/InstCombine/intptr4.ll
> +++ b/llvm/test/Transforms/InstCombine/intptr4.ll
> @@ -8,18 +8,17 @@ define  void @test(ptr %a, ptr readnone %a_end, i64 %b, ptr %bf) unnamed_addr  {
>  ; CHECK-NEXT:    [[B_FLOAT:%.*]] = inttoptr i64 [[B:%.*]] to ptr
>  ; CHECK-NEXT:    br i1 [[CMP1]], label [[BB1:%.*]], label [[BB2:%.*]]
>  ; CHECK:       bb1:
> +; CHECK-NEXT:    [[TMP0:%.*]] = inttoptr i64 [[B]] to ptr
>  ; CHECK-NEXT:    br label [[FOR_BODY_PREHEADER:%.*]]
>  ; CHECK:       bb2:
> -; CHECK-NEXT:    [[BFI:%.*]] = ptrtoint ptr [[BF:%.*]] to i64
>  ; CHECK-NEXT:    br label [[FOR_BODY_PREHEADER]]
>  ; CHECK:       for.body.preheader:
> -; CHECK-NEXT:    [[B_PHI:%.*]] = phi i64 [ [[B]], [[BB1]] ], [ [[BFI]], [[BB2]] ]
> -; CHECK-NEXT:    [[B_PHI_PTR:%.*]] = inttoptr i64 [[B_PHI]] to ptr
> +; CHECK-NEXT:    [[B_PHI:%.*]] = phi ptr [ [[TMP0]], [[BB1]] ], [ [[BF:%.*]], [[BB2]] ]
>  ; CHECK-NEXT:    br label [[FOR_BODY:%.*]]
>  ; CHECK:       for.body:
>  ; CHECK-NEXT:    [[A_ADDR_03:%.*]] = phi ptr [ [[INCDEC_PTR:%.*]], [[FOR_BODY]] ], [ [[A]], [[FOR_BODY_PREHEADER]] ]
>  ; CHECK-NEXT:    [[B_ADDR_FLOAT:%.*]] = phi ptr [ [[B_ADDR_FLOAT_INC:%.*]], [[FOR_BODY]] ], [ [[B_FLOAT]], [[FOR_BODY_PREHEADER]] ]
> -; CHECK-NEXT:    [[B_ADDR_I64_PTR:%.*]] = phi ptr [ [[B_ADDR_FLOAT_INC]], [[FOR_BODY]] ], [ [[B_PHI_PTR]], [[FOR_BODY_PREHEADER]] ]
> +; CHECK-NEXT:    [[B_ADDR_I64_PTR:%.*]] = phi ptr [ [[B_ADDR_FLOAT_INC]], [[FOR_BODY]] ], [ [[B_PHI]], [[FOR_BODY_PREHEADER]] ]
>  ; CHECK-NEXT:    [[L:%.*]] = load float, ptr [[B_ADDR_FLOAT]], align 4
>  ; CHECK-NEXT:    [[MUL_I:%.*]] = fmul float [[L]], 4.200000e+01
>  ; CHECK-NEXT:    store float [[MUL_I]], ptr [[A_ADDR_03]], align 4
> diff --git a/llvm/test/Transforms/InstCombine/intptr5.ll b/llvm/test/Transforms/InstCombine/intptr5.ll
> index b88eb45c89a0..e2793d44d3eb 100644
> --- a/llvm/test/Transforms/InstCombine/intptr5.ll
> +++ b/llvm/test/Transforms/InstCombine/intptr5.ll
> @@ -8,20 +8,19 @@ define  void @test(ptr %a, ptr readnone %a_end, i64 %b, ptr %bf) unnamed_addr  {
>  ; CHECK-NEXT:    [[B_FLOAT:%.*]] = inttoptr i64 [[B:%.*]] to ptr
>  ; CHECK-NEXT:    br i1 [[CMP1]], label [[BB1:%.*]], label [[BB2:%.*]]
>  ; CHECK:       bb1:
> +; CHECK-NEXT:    [[TMP0:%.*]] = inttoptr i64 [[B]] to ptr
>  ; CHECK-NEXT:    br label [[FOR_BODY_PREHEADER:%.*]]
>  ; CHECK:       bb2:
> -; CHECK-NEXT:    [[BFI:%.*]] = ptrtoint ptr [[BF:%.*]] to i64
>  ; CHECK-NEXT:    br label [[FOR_BODY_PREHEADER]]
>  ; CHECK:       for.body.preheader:
> -; CHECK-NEXT:    [[B_PHI:%.*]] = phi i64 [ [[B]], [[BB1]] ], [ [[BFI]], [[BB2]] ]
> -; CHECK-NEXT:    [[B_PHI_PTR:%.*]] = inttoptr i64 [[B_PHI]] to ptr
> +; CHECK-NEXT:    [[B_PHI:%.*]] = phi ptr [ [[TMP0]], [[BB1]] ], [ [[BF:%.*]], [[BB2]] ]
>  ; CHECK-NEXT:    switch i64 [[B]], label [[FOR_BODY:%.*]] [
>  ; CHECK-NEXT:    i64 1, label [[FOR_BODY]]
>  ; CHECK-NEXT:    ]
>  ; CHECK:       for.body:
>  ; CHECK-NEXT:    [[A_ADDR_03:%.*]] = phi ptr [ [[INCDEC_PTR:%.*]], [[FOR_BODY]] ], [ [[A]], [[FOR_BODY_PREHEADER]] ], [ [[A]], [[FOR_BODY_PREHEADER]] ]
>  ; CHECK-NEXT:    [[B_ADDR_FLOAT:%.*]] = phi ptr [ [[B_ADDR_FLOAT_INC:%.*]], [[FOR_BODY]] ], [ [[B_FLOAT]], [[FOR_BODY_PREHEADER]] ], [ [[B_FLOAT]], [[FOR_BODY_PREHEADER]] ]
> -; CHECK-NEXT:    [[B_ADDR_I64_PTR:%.*]] = phi ptr [ [[B_ADDR_FLOAT_INC]], [[FOR_BODY]] ], [ [[B_PHI_PTR]], [[FOR_BODY_PREHEADER]] ], [ [[B_PHI_PTR]], [[FOR_BODY_PREHEADER]] ]
> +; CHECK-NEXT:    [[B_ADDR_I64_PTR:%.*]] = phi ptr [ [[B_ADDR_FLOAT_INC]], [[FOR_BODY]] ], [ [[B_PHI]], [[FOR_BODY_PREHEADER]] ], [ [[B_PHI]], [[FOR_BODY_PREHEADER]] ]
>  ; CHECK-NEXT:    [[L:%.*]] = load float, ptr [[B_ADDR_FLOAT]], align 4
>  ; CHECK-NEXT:    [[MUL_I:%.*]] = fmul float [[L]], 4.200000e+01
>  ; CHECK-NEXT:    store float [[MUL_I]], ptr [[A_ADDR_03]], align 4
> diff --git a/llvm/test/Transforms/InstCombine/intptr7.ll b/llvm/test/Transforms/InstCombine/intptr7.ll
> index f640c87c5376..8bd5aaf7b81a 100644
> --- a/llvm/test/Transforms/InstCombine/intptr7.ll
> +++ b/llvm/test/Transforms/InstCombine/intptr7.ll
> @@ -51,17 +51,16 @@ define void @no_matching_phi(i64 %a, ptr %b, i1 %cond) {
>  ; CHECK-NEXT:    [[ADDB:%.*]] = getelementptr inbounds float, ptr [[B:%.*]], i64 2
>  ; CHECK-NEXT:    br i1 [[COND:%.*]], label [[B:%.*]], label [[A:%.*]]
>  ; CHECK:       A:
> +; CHECK-NEXT:    [[TMP0:%.*]] = inttoptr i64 [[ADD_INT]] to ptr
>  ; CHECK-NEXT:    br label [[C:%.*]]
>  ; CHECK:       B:
> -; CHECK-NEXT:    [[ADDB_INT:%.*]] = ptrtoint ptr [[ADDB]] to i64
>  ; CHECK-NEXT:    [[ADD:%.*]] = inttoptr i64 [[ADD_INT]] to ptr
>  ; CHECK-NEXT:    store float 1.000000e+01, ptr [[ADD]], align 4
>  ; CHECK-NEXT:    br label [[C]]
>  ; CHECK:       C:
>  ; CHECK-NEXT:    [[A_ADDR_03:%.*]] = phi ptr [ [[ADDB]], [[A]] ], [ [[ADD]], [[B]] ]
> -; CHECK-NEXT:    [[B_ADDR_02:%.*]] = phi i64 [ [[ADD_INT]], [[A]] ], [ [[ADDB_INT]], [[B]] ]
> -; CHECK-NEXT:    [[I0:%.*]] = inttoptr i64 [[B_ADDR_02]] to ptr
> -; CHECK-NEXT:    [[I1:%.*]] = load float, ptr [[I0]], align 4
> +; CHECK-NEXT:    [[B_ADDR_02:%.*]] = phi ptr [ [[TMP0]], [[A]] ], [ [[ADDB]], [[B]] ]
> +; CHECK-NEXT:    [[I1:%.*]] = load float, ptr [[B_ADDR_02]], align 4
>  ; CHECK-NEXT:    [[MUL_I:%.*]] = fmul float [[I1]], 4.200000e+01
>  ; CHECK-NEXT:    store float [[MUL_I]], ptr [[A_ADDR_03]], align 4
>  ; CHECK-NEXT:    ret void
> diff --git a/llvm/test/Transforms/InstCombine/phi-select-constant.ll b/llvm/test/Transforms/InstCombine/phi-select-constant.ll
> index e51cb3d0caf4..15760e2a5b85 100644
> --- a/llvm/test/Transforms/InstCombine/phi-select-constant.ll
> +++ b/llvm/test/Transforms/InstCombine/phi-select-constant.ll
> @@ -77,17 +77,15 @@ final:
>  define <2 x i8> @vec3(i1 %cond1, i1 %cond2, <2 x i1> %x, <2 x i8> %y, <2 x i8> %z) {
>  ; CHECK-LABEL: @vec3(
>  ; CHECK-NEXT:  entry:
> -; CHECK-NEXT:    [[PHI_SEL1:%.*]] = shufflevector <2 x i8> [[Z:%.*]], <2 x i8> [[Y:%.*]], <2 x i32> <i32 0, i32 3>
>  ; CHECK-NEXT:    br i1 [[COND1:%.*]], label [[IF1:%.*]], label [[ELSE:%.*]]
>  ; CHECK:       if1:
> -; CHECK-NEXT:    [[PHI_SEL2:%.*]] = shufflevector <2 x i8> [[Y]], <2 x i8> [[Z]], <2 x i32> <i32 0, i32 3>
>  ; CHECK-NEXT:    br i1 [[COND2:%.*]], label [[IF2:%.*]], label [[ELSE]]
>  ; CHECK:       if2:
> -; CHECK-NEXT:    [[PHI_SEL:%.*]] = select <2 x i1> [[X:%.*]], <2 x i8> [[Y]], <2 x i8> [[Z]]
>  ; CHECK-NEXT:    br label [[ELSE]]
>  ; CHECK:       else:
> -; CHECK-NEXT:    [[PHI:%.*]] = phi <2 x i8> [ [[PHI_SEL]], [[IF2]] ], [ [[PHI_SEL1]], [[ENTRY:%.*]] ], [ [[PHI_SEL2]], [[IF1]] ]
> -; CHECK-NEXT:    ret <2 x i8> [[PHI]]
> +; CHECK-NEXT:    [[PHI:%.*]] = phi <2 x i1> [ [[X:%.*]], [[IF2]] ], [ <i1 false, i1 true>, [[ENTRY:%.*]] ], [ <i1 true, i1 false>, [[IF1]] ]
> +; CHECK-NEXT:    [[SEL:%.*]] = select <2 x i1> [[PHI]], <2 x i8> [[Y:%.*]], <2 x i8> [[Z:%.*]]
> +; CHECK-NEXT:    ret <2 x i8> [[SEL]]
>  ;
>  entry:
>    br i1 %cond1, label %if1, label %else
> diff --git a/llvm/test/Transforms/InstCombine/phi.ll b/llvm/test/Transforms/InstCombine/phi.ll
> index df5e17421091..98b3b2e932e0 100644
> --- a/llvm/test/Transforms/InstCombine/phi.ll
> +++ b/llvm/test/Transforms/InstCombine/phi.ll
> @@ -697,10 +697,10 @@ ret:
>  define i32 @test23(i32 %A, i1 %pb, ptr %P) {
>  ; CHECK-LABEL: @test23(
>  ; CHECK-NEXT:  BB0:
> -; CHECK-NEXT:    [[PHI_BO:%.*]] = add i32 [[A:%.*]], 19
> +; CHECK-NEXT:    [[TMP0:%.*]] = add i32 [[A:%.*]], 19
>  ; CHECK-NEXT:    br label [[LOOP:%.*]]
>  ; CHECK:       Loop:
> -; CHECK-NEXT:    [[B:%.*]] = phi i32 [ [[PHI_BO]], [[BB0:%.*]] ], [ 61, [[LOOP]] ]
> +; CHECK-NEXT:    [[B:%.*]] = phi i32 [ [[TMP0]], [[BB0:%.*]] ], [ 61, [[LOOP]] ]
>  ; CHECK-NEXT:    store i32 [[B]], ptr [[P:%.*]], align 4
>  ; CHECK-NEXT:    br i1 [[PB:%.*]], label [[LOOP]], label [[EXIT:%.*]]
>  ; CHECK:       Exit:
> @@ -1280,14 +1280,12 @@ define i1 @pr57488_icmp_of_phi(ptr %ptr.base, i64 %len) {
>  ; CHECK-NEXT:    [[LEN_ZERO:%.*]] = icmp eq i64 [[LEN]], 0
>  ; CHECK-NEXT:    br i1 [[LEN_ZERO]], label [[EXIT:%.*]], label [[LOOP:%.*]]
>  ; CHECK:       loop:
> -; CHECK-NEXT:    [[ACCUM:%.*]] = phi i8 [ [[ACCUM_NEXT:%.*]], [[LOOP]] ], [ 1, [[START:%.*]] ]
> +; CHECK-NEXT:    [[ACCUM:%.*]] = phi i1 [ [[AND:%.*]], [[LOOP]] ], [ true, [[START:%.*]] ]
>  ; CHECK-NEXT:    [[PTR:%.*]] = phi ptr [ [[PTR_NEXT:%.*]], [[LOOP]] ], [ [[PTR_BASE]], [[START]] ]
>  ; CHECK-NEXT:    [[PTR_NEXT]] = getelementptr inbounds i64, ptr [[PTR]], i64 1
> -; CHECK-NEXT:    [[ACCUM_BOOL:%.*]] = icmp ne i8 [[ACCUM]], 0
>  ; CHECK-NEXT:    [[VAL:%.*]] = load i64, ptr [[PTR]], align 8
>  ; CHECK-NEXT:    [[VAL_ZERO:%.*]] = icmp eq i64 [[VAL]], 0
> -; CHECK-NEXT:    [[AND:%.*]] = and i1 [[ACCUM_BOOL]], [[VAL_ZERO]]
> -; CHECK-NEXT:    [[ACCUM_NEXT]] = zext i1 [[AND]] to i8
> +; CHECK-NEXT:    [[AND]] = and i1 [[ACCUM]], [[VAL_ZERO]]
>  ; CHECK-NEXT:    [[EXIT_COND:%.*]] = icmp eq ptr [[PTR_NEXT]], [[END]]
>  ; CHECK-NEXT:    br i1 [[EXIT_COND]], label [[EXIT]], label [[LOOP]]
>  ; CHECK:       exit:
> diff --git a/llvm/test/Transforms/InstCombine/recurrence.ll b/llvm/test/Transforms/InstCombine/recurrence.ll
> index 74fdbf388373..c00ecd5112db 100644
> --- a/llvm/test/Transforms/InstCombine/recurrence.ll
> +++ b/llvm/test/Transforms/InstCombine/recurrence.ll
> @@ -4,9 +4,9 @@
>  define i64 @test_or(i64 %a) {
>  ; CHECK-LABEL: @test_or(
>  ; CHECK-NEXT:  entry:
> +; CHECK-NEXT:    [[TMP0:%.*]] = or i64 [[A:%.*]], 15
>  ; CHECK-NEXT:    br label [[LOOP:%.*]]
>  ; CHECK:       loop:
> -; CHECK-NEXT:    [[TMP0:%.*]] = or i64 [[A:%.*]], 15
>  ; CHECK-NEXT:    tail call void @use(i64 [[TMP0]])
>  ; CHECK-NEXT:    br label [[LOOP]]
>  ;
> @@ -84,9 +84,9 @@ loop:                                             ; preds = %loop, %entry
>  define i64 @test_and(i64 %a) {
>  ; CHECK-LABEL: @test_and(
>  ; CHECK-NEXT:  entry:
> +; CHECK-NEXT:    [[TMP0:%.*]] = and i64 [[A:%.*]], 15
>  ; CHECK-NEXT:    br label [[LOOP:%.*]]
>  ; CHECK:       loop:
> -; CHECK-NEXT:    [[TMP0:%.*]] = and i64 [[A:%.*]], 15
>  ; CHECK-NEXT:    tail call void @use(i64 [[TMP0]])
>  ; CHECK-NEXT:    br label [[LOOP]]
>  ;
> </cut>



-- 
Thanks,
~Nick Desaulniers
