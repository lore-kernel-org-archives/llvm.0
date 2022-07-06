Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D353258B
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 16:43:26 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id l7so18414199ljj.4
        for <llvm@lists.linux.dev>; Wed, 06 Jul 2022 09:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rVzmV4/zFF4hIuJmsCnQXFYqsCcfg0OEWZMBh9r8QwY=;
        b=FPVj4q4h8bVuNJQAhSlcCrtFARrZZzcdBkgipLfGbuMKAGMTByeDYVSEMIQj3VAHBx
         CS6NXAcPWSz6bYo3nsbmXrWxSx8sJCVz9nyUqa4rSuuCTHlRTBAXHmfFY8ODMzx6jpMu
         shDo+WcomAmM7ydjY2yqPTGGRYb/HLN/Wlcm60Ge7EdXgPnI9E55/iV5XLT1MoJtOWhf
         YyD8N6APkiSgIjo64HbB131bvi1m8u5hcs7XDCs0xyDuIw1bEzchfgNIuI1oOsz8sgct
         U3c6MW2qTEh6X+g/3BFPYjZPa5p7TO0wHI3Vl+/r0cCL544+WCHngbhBax1gHf6NOyEz
         7h7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rVzmV4/zFF4hIuJmsCnQXFYqsCcfg0OEWZMBh9r8QwY=;
        b=ffusmn/WeV/mZ3Av+mMe+Az7+tQyypUd3ykNRGm1jxGb5xUny7toA9tNHEU2D2CCNY
         3ZzQf1XEg/sLo/U5uEQB413rfKHNfDzXEo/t2sgrhfzoIxaUO+VJBxobDcKSXR5uWODT
         fZsKewjv6oSncAosOL7HF2qEtcGgv80X60YkuZcXIxUDyjEBsPpoyJFDadBa/Y/4I+Fj
         t9E64KPTfCO9WgXFyMwmhm4WKhhXq9XybkxNfcEjaDjTQmEhbIxwL77MpkfIEKHHY7g3
         1L9C5bHPasNZShH571RCrm4J88PzsCMoKM9NKwAfe2R4ZF83tBp/c3PGPp4N3tXGi+G/
         vd6A==
X-Gm-Message-State: AJIora+z0i8Wrym8Y3l8RSSnCSAJs0O7nEaQ97bqAUDJlUxp68074UZh
	Gsbnx7GMp8deHf+PkkoZoIANlIJbeGmu35S6nRbvv8s2T4Z/Kw==
X-Google-Smtp-Source: AGRyM1tEkKempTC8RmYTnP6LJUPTeHpEbMPeMHBZwaBOF6L3AkzzBLStuTxGfyY4vc8y1KAkWBzzI/c29i1ZfE2Tm58=
X-Received: by 2002:a05:651c:2104:b0:25b:f4ed:db93 with SMTP id
 a4-20020a05651c210400b0025bf4eddb93mr21201947ljq.295.1657125803606; Wed, 06
 Jul 2022 09:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1701549979.7526.1657112034397@jenkins.jenkins>
In-Reply-To: <1701549979.7526.1657112034397@jenkins.jenkins>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 6 Jul 2022 09:43:12 -0700
Message-ID: <CAKwvOdnNevmCKkRLiq_vXB4epUxE_gNh+w4-=qaniWyXZT3f0Q@mail.gmail.com>
Subject: Re: [TCWG CI] Regression caused by llvm: [SimplifyCFG] Thread all
 predecessors with same value at once
To: llvm@lists.linux.dev, Nikita Popov <npopov@redhat.com>
Cc: ci_notify@linaro.org, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Looks like Nathan reported this:
https://reviews.llvm.org/D124159#3631240
Nikita fixed-forward in:
https://github.com/llvm/llvm-project/commit/20962c1240691d25b21ce425313c81eed0b1b358
I'm guessing https://reviews.llvm.org/D129205 is related cleanup?

On Wed, Jul 6, 2022 at 5:54 AM <ci_notify@linaro.org> wrote:
>
> [TCWG CI] Regression caused by llvm: [SimplifyCFG] Thread all predecessors with same value at once:
> commit dc969061c68e62328607d68215ed8b9ef4a1e4b1
> Author: Nikita Popov <npopov@redhat.com>
>
>     [SimplifyCFG] Thread all predecessors with same value at once
>
> Results regressed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 22593
> # First few build errors in logs:
> # 00:01:25 clang-15: error: clang frontend command failed with exit code 134 (use -v to see invocation)
> # 00:01:26 make[2]: *** [scripts/Makefile.build:288: arch/arm64/crypto/sha1-ce-glue.o] Error 1
> # 00:01:26 clang-15: error: clang frontend command failed with exit code 134 (use -v to see invocation)
> # 00:01:26 make[2]: *** [scripts/Makefile.build:288: crypto/asymmetric_keys/asymmetric_type.o] Error 1
> # 00:01:28 clang-15: error: clang frontend command failed with exit code 134 (use -v to see invocation)
> # 00:01:28 clang-15: error: clang frontend command failed with exit code 134 (use -v to see invocation)
> # 00:01:28 make[2]: *** [scripts/Makefile.build:288: kernel/sched/fair.o] Error 1
> # 00:01:28 clang-15: error: clang frontend command failed with exit code 134 (use -v to see invocation)
> # 00:01:29 make[2]: *** [scripts/Makefile.build:288: arch/arm64/crypto/sha2-ce-glue.o] Error 1
> # 00:01:29 make[2]: *** [scripts/Makefile.build:288: arch/arm64/crypto/sha512-ce-glue.o] Error 1
>
> from
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 31194
> # linux build successful:
> all
> # linux boot successful:
> boot
>
> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
>
> This commit has regressed these CI configurations:
>  - tcwg_kernel/llvm-master-aarch64-stable-allmodconfig
>
> First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-stable-allmodconfig/11/artifact/artifacts/build-dc969061c68e62328607d68215ed8b9ef4a1e4b1/
> Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-stable-allmodconfig/11/artifact/artifacts/build-ebb78a95cede526ece9b904e9ba623d4b963df60/
> Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-stable-allmodconfig/11/artifact/artifacts/build-baseline/
> Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-stable-allmodconfig/11/artifact/artifacts/
>
> Reproduce builds:
> <cut>
> mkdir investigate-llvm-dc969061c68e62328607d68215ed8b9ef4a1e4b1
> cd investigate-llvm-dc969061c68e62328607d68215ed8b9ef4a1e4b1
>
> # Fetch scripts
> git clone https://git.linaro.org/toolchain/jenkins-scripts
>
> # Fetch manifests and test.sh script
> mkdir -p artifacts/manifests
> curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-stable-allmodconfig/11/artifact/artifacts/manifests/build-baseline.sh --fail
> curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-stable-allmodconfig/11/artifact/artifacts/manifests/build-parameters.sh --fail
> curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-stable-allmodconfig/11/artifact/artifacts/test.sh --fail
> chmod +x artifacts/test.sh
>
> # Reproduce the baseline build (build all pre-requisites)
> ./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh
>
> # Save baseline build state (which is then restored in artifacts/test.sh)
> mkdir -p ./bisect
> rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/
>
> cd llvm
>
> # Reproduce first_bad build
> git checkout --detach dc969061c68e62328607d68215ed8b9ef4a1e4b1
> ../artifacts/test.sh
>
> # Reproduce last_good build
> git checkout --detach ebb78a95cede526ece9b904e9ba623d4b963df60
> ../artifacts/test.sh
>
> cd ..
> </cut>
>
> Full commit (up to 1000 lines):
> <cut>
> commit dc969061c68e62328607d68215ed8b9ef4a1e4b1
> Author: Nikita Popov <npopov@redhat.com>
> Date:   Tue Jul 5 12:21:06 2022 +0200
>
>     [SimplifyCFG] Thread all predecessors with same value at once
>
>     If there are multiple predecessors that have the same condition
>     value (and thus same "real destination"), these were previously
>     handled by copying the threaded block for each predecessor.
>     Instead, we can reuse one block for all of them. This makes the
>     behavior of SimplifyCFG's jump threading match that of the
>     actual JumpThreading pass.
>
>     This also avoids the infinite combine loop reported in:
>     https://reviews.llvm.org/D124159#3624387
> ---
>  llvm/lib/Transforms/Utils/SimplifyCFG.cpp          | 65 ++++++++++-----------
>  llvm/test/Transforms/SimplifyCFG/jump-threading.ll | 67 +++++++++++++++++++---
>  llvm/test/Transforms/SimplifyCFG/pr55765.ll        | 21 ++-----
>  3 files changed, 98 insertions(+), 55 deletions(-)
>
> diff --git a/llvm/lib/Transforms/Utils/SimplifyCFG.cpp b/llvm/lib/Transforms/Utils/SimplifyCFG.cpp
> index a8b6a473bdf7..bbf596e1a140 100644
> --- a/llvm/lib/Transforms/Utils/SimplifyCFG.cpp
> +++ b/llvm/lib/Transforms/Utils/SimplifyCFG.cpp
> @@ -3019,7 +3019,7 @@ static Optional<bool>
>  FoldCondBranchOnValueKnownInPredecessorImpl(BranchInst *BI, DomTreeUpdater *DTU,
>                                              const DataLayout &DL,
>                                              AssumptionCache *AC) {
> -  SmallMapVector<BasicBlock *, ConstantInt *, 8> KnownValues;
> +  SmallMapVector<ConstantInt *, SmallSetVector<BasicBlock *, 2>, 2> KnownValues;
>    BasicBlock *BB = BI->getParent();
>    Value *Cond = BI->getCondition();
>    PHINode *PN = dyn_cast<PHINode>(Cond);
> @@ -3032,12 +3032,12 @@ FoldCondBranchOnValueKnownInPredecessorImpl(BranchInst *BI, DomTreeUpdater *DTU,
>
>      for (Use &U : PN->incoming_values())
>        if (auto *CB = dyn_cast<ConstantInt>(U))
> -        KnownValues.insert({PN->getIncomingBlock(U), CB});
> +        KnownValues[CB].insert(PN->getIncomingBlock(U));
>    } else {
>      SmallDenseMap<std::pair<BasicBlock *, BasicBlock *>, ConstantInt *> Visited;
>      for (BasicBlock *Pred : predecessors(BB)) {
>        if (ConstantInt *CB = getKnownValueOnEdge(Cond, Pred, BB, Visited))
> -        KnownValues.insert({Pred, CB});
> +        KnownValues[CB].insert(Pred);
>      }
>    }
>
> @@ -3053,29 +3053,34 @@ FoldCondBranchOnValueKnownInPredecessorImpl(BranchInst *BI, DomTreeUpdater *DTU,
>    for (const auto &Pair : KnownValues) {
>      // Okay, we now know that all edges from PredBB should be revectored to
>      // branch to RealDest.
> -    ConstantInt *CB = Pair.second;
> -    BasicBlock *PredBB = Pair.first;
> +    ConstantInt *CB = Pair.first;
> +    ArrayRef<BasicBlock *> PredBBs = Pair.second.getArrayRef();
>      BasicBlock *RealDest = BI->getSuccessor(!CB->getZExtValue());
>
>      if (RealDest == BB)
>        continue; // Skip self loops.
> +
>      // Skip if the predecessor's terminator is an indirect branch.
> -    if (isa<IndirectBrInst>(PredBB->getTerminator()))
> +    if (any_of(PredBBs, [](BasicBlock *PredBB) {
> +          return isa<IndirectBrInst>(PredBB->getTerminator());
> +        }))
>        continue;
>
> -    SmallVector<DominatorTree::UpdateType, 3> Updates;
> +    LLVM_DEBUG({
> +      dbgs() << "Condition " << *Cond << " in " << BB->getName()
> +             << " has value " << *Pair.first << " in predecessors:\n";
> +      for (const BasicBlock *PredBB : Pair.second)
> +        dbgs() << "  " << PredBB->getName() << "\n";
> +      dbgs() << "Threading to destination " << RealDest->getName() << ".\n";
> +    });
>
> -    // The dest block might have PHI nodes, other predecessors and other
> -    // difficult cases.  Instead of being smart about this, just insert a new
> -    // block that jumps to the destination block, effectively splitting
> -    // the edge we are about to create.
> -    BasicBlock *EdgeBB =
> -        BasicBlock::Create(BB->getContext(), RealDest->getName() + ".critedge",
> -                           RealDest->getParent(), RealDest);
> -    BranchInst *CritEdgeBranch = BranchInst::Create(RealDest, EdgeBB);
> -    if (DTU)
> -      Updates.push_back({DominatorTree::Insert, EdgeBB, RealDest});
> -    CritEdgeBranch->setDebugLoc(BI->getDebugLoc());
> +    // Split the predecessors we are threading into a new edge block. We'll
> +    // clone the instructions into this block, and then redirect it to RealDest.
> +    BasicBlock *EdgeBB = SplitBlockPredecessors(BB, PredBBs, ".critedge", DTU);
> +
> +    // TODO: These just exist to reduce test diff, we can drop them if we like.
> +    EdgeBB->setName(RealDest->getName() + ".critedge");
> +    EdgeBB->moveBefore(RealDest);
>
>      // Update PHI nodes.
>      AddPredecessorToBlock(RealDest, EdgeBB, BB);
> @@ -3083,12 +3088,12 @@ FoldCondBranchOnValueKnownInPredecessorImpl(BranchInst *BI, DomTreeUpdater *DTU,
>      // BB may have instructions that are being threaded over.  Clone these
>      // instructions into EdgeBB.  We know that there will be no uses of the
>      // cloned instructions outside of EdgeBB.
> -    BasicBlock::iterator InsertPt = EdgeBB->begin();
> +    BasicBlock::iterator InsertPt = EdgeBB->getFirstInsertionPt();
>      DenseMap<Value *, Value *> TranslateMap; // Track translated values.
> -    TranslateMap[Cond] = Pair.second;
> +    TranslateMap[Cond] = CB;
>      for (BasicBlock::iterator BBI = BB->begin(); &*BBI != BI; ++BBI) {
>        if (PHINode *PN = dyn_cast<PHINode>(BBI)) {
> -        TranslateMap[PN] = PN->getIncomingValueForBlock(PredBB);
> +        TranslateMap[PN] = PN->getIncomingValueForBlock(EdgeBB);
>          continue;
>        }
>        // Clone the instruction.
> @@ -3126,19 +3131,15 @@ FoldCondBranchOnValueKnownInPredecessorImpl(BranchInst *BI, DomTreeUpdater *DTU,
>        }
>      }
>
> -    // Loop over all of the edges from PredBB to BB, changing them to branch
> -    // to EdgeBB instead.
> -    Instruction *PredBBTI = PredBB->getTerminator();
> -    for (unsigned i = 0, e = PredBBTI->getNumSuccessors(); i != e; ++i)
> -      if (PredBBTI->getSuccessor(i) == BB) {
> -        BB->removePredecessor(PredBB);
> -        PredBBTI->setSuccessor(i, EdgeBB);
> -      }
> +    BB->removePredecessor(EdgeBB);
> +    BranchInst *EdgeBI = cast<BranchInst>(EdgeBB->getTerminator());
> +    EdgeBI->setSuccessor(0, RealDest);
> +    EdgeBI->setDebugLoc(BI->getDebugLoc());
>
>      if (DTU) {
> -      Updates.push_back({DominatorTree::Insert, PredBB, EdgeBB});
> -      Updates.push_back({DominatorTree::Delete, PredBB, BB});
> -
> +      SmallVector<DominatorTree::UpdateType, 2> Updates;
> +      Updates.push_back({DominatorTree::Delete, EdgeBB, BB});
> +      Updates.push_back({DominatorTree::Insert, EdgeBB, RealDest});
>        DTU->applyUpdates(Updates);
>      }
>
> diff --git a/llvm/test/Transforms/SimplifyCFG/jump-threading.ll b/llvm/test/Transforms/SimplifyCFG/jump-threading.ll
> index a9191b3c61d9..aaebd0d5d431 100644
> --- a/llvm/test/Transforms/SimplifyCFG/jump-threading.ll
> +++ b/llvm/test/Transforms/SimplifyCFG/jump-threading.ll
> @@ -269,17 +269,13 @@ define void @test_multiple_threadable_preds_with_phi(i1 %cond1, i1 %cond2) {
>  ; CHECK-NEXT:    br i1 [[COND1:%.*]], label [[IF1:%.*]], label [[IF2:%.*]]
>  ; CHECK:       if1:
>  ; CHECK-NEXT:    call void @foo()
> -; CHECK-NEXT:    br i1 [[COND2:%.*]], label [[IF3_CRITEDGE1:%.*]], label [[EXIT:%.*]]
> +; CHECK-NEXT:    br i1 [[COND2:%.*]], label [[IF3_CRITEDGE:%.*]], label [[EXIT:%.*]]
>  ; CHECK:       if2:
>  ; CHECK-NEXT:    call void @bar()
> -; CHECK-NEXT:    br i1 [[COND2]], label [[IF3_CRITEDGE:%.*]], label [[EXIT]]
> +; CHECK-NEXT:    br i1 [[COND2]], label [[IF3_CRITEDGE]], label [[EXIT]]
>  ; CHECK:       if3.critedge:
> -; CHECK-NEXT:    call void @use.i32(i32 2)
> -; CHECK-NEXT:    br label [[IF3:%.*]]
> -; CHECK:       if3.critedge1:
> -; CHECK-NEXT:    call void @use.i32(i32 1)
> -; CHECK-NEXT:    br label [[IF3]]
> -; CHECK:       if3:
> +; CHECK-NEXT:    [[PHI_PH:%.*]] = phi i32 [ 2, [[IF2]] ], [ 1, [[IF1]] ]
> +; CHECK-NEXT:    call void @use.i32(i32 [[PHI_PH]])
>  ; CHECK-NEXT:    call void @foo()
>  ; CHECK-NEXT:    br label [[EXIT]]
>  ; CHECK:       exit:
> @@ -307,3 +303,58 @@ if3:
>  exit:
>    ret void
>  }
> +
> +; This test case used to infinite loop.
> +
> +define void @infloop(i1 %cmp.a, i1 %cmp.b, i1 %cmp.c) {
> +; CHECK-LABEL: @infloop(
> +; CHECK-NEXT:  entry:
> +; CHECK-NEXT:    br label [[WHILE_COND:%.*]]
> +; CHECK:       while.cond:
> +; CHECK-NEXT:    br i1 [[CMP_A:%.*]], label [[FOR:%.*]], label [[WHILE_BODY_THREAD:%.*]]
> +; CHECK:       for.body:
> +; CHECK-NEXT:    br i1 [[CMP_B:%.*]], label [[WHILE_BODY:%.*]], label [[FOR_BODY:%.*]]
> +; CHECK:       for:
> +; CHECK-NEXT:    tail call void @foo()
> +; CHECK-NEXT:    br label [[FOR_BODY]]
> +; CHECK:       while.body:
> +; CHECK-NEXT:    br i1 [[CMP_C:%.*]], label [[C_EXIT:%.*]], label [[LAND:%.*]]
> +; CHECK:       while.body.thread:
> +; CHECK-NEXT:    br i1 [[CMP_C]], label [[WHILE_BODY_THREAD]], label [[LAND]]
> +; CHECK:       land:
> +; CHECK-NEXT:    tail call void @bar()
> +; CHECK-NEXT:    br label [[WHILE_COND]]
> +; CHECK:       c.exit:
> +; CHECK-NEXT:    br i1 [[CMP_A]], label [[FOR_D:%.*]], label [[WHILE_BODY_THREAD]]
> +; CHECK:       for.d:
> +; CHECK-NEXT:    ret void
> +;
> +entry:
> +  br label %while.cond
> +
> +while.cond:                                       ; preds = %land, %while.body.thread, %entry
> +  br i1 %cmp.a, label %for, label %while.body.thread
> +
> +for.body:                                         ; preds = %for, %for.body
> +  br i1 %cmp.b, label %while.body, label %for.body
> +
> +for:                                              ; preds = %while.cond
> +  tail call void @foo()
> +  br label %for.body
> +
> +while.body:                                       ; preds = %for.body
> +  br i1 %cmp.c, label %c.exit, label %land
> +
> +while.body.thread:                                ; preds = %c.exit, %while.cond
> +  br i1 %cmp.c, label %while.cond, label %land
> +
> +land:                                             ; preds = %while.body.thread, %while.body
> +  tail call void @bar()
> +  br label %while.cond
> +
> +c.exit:                                           ; preds = %while.body
> +  br i1 %cmp.a, label %for.d, label %while.cond
> +
> +for.d:                                            ; preds = %c.exit
> +  ret void
> +}
> diff --git a/llvm/test/Transforms/SimplifyCFG/pr55765.ll b/llvm/test/Transforms/SimplifyCFG/pr55765.ll
> index 929994143f91..36d7ed1dc536 100644
> --- a/llvm/test/Transforms/SimplifyCFG/pr55765.ll
> +++ b/llvm/test/Transforms/SimplifyCFG/pr55765.ll
> @@ -8,24 +8,15 @@ declare void @dummy()
>
>  define i32 @main(i1 %c1, i1 %c2, i32 %y) {
>  ; CHECK-LABEL: @main(
> -; CHECK-NEXT:    br i1 [[C1:%.*]], label [[EXIT:%.*]], label [[LOOP_PRE_PREHEADER:%.*]]
> -; CHECK:       loop.pre.preheader:
> +; CHECK-NEXT:    [[C1_NOT:%.*]] = xor i1 [[C1:%.*]], true
>  ; CHECK-NEXT:    [[CMP:%.*]] = icmp sgt i32 [[Y:%.*]], -1
> -; CHECK-NEXT:    br i1 [[CMP]], label [[LOOP_PREHEADER:%.*]], label [[EXIT]]
> +; CHECK-NEXT:    [[OR_COND:%.*]] = select i1 [[C1_NOT]], i1 [[CMP]], i1 false
> +; CHECK-NEXT:    br i1 [[OR_COND]], label [[LOOP_PREHEADER:%.*]], label [[EXIT:%.*]]
>  ; CHECK:       loop.preheader:
>  ; CHECK-NEXT:    [[CMP2:%.*]] = icmp eq i32 [[Y]], 0
> -; CHECK-NEXT:    br label [[LOOP:%.*]]
> -; CHECK:       loop:
> -; CHECK-NEXT:    br i1 [[C1]], label [[LOOP2:%.*]], label [[LOOP]]
> -; CHECK:       loop.latch:
> -; CHECK-NEXT:    br i1 [[CMP]], label [[LOOP]], label [[EXIT]]
> -; CHECK:       loop2:
> -; CHECK-NEXT:    br i1 [[CMP2]], label [[JOIN:%.*]], label [[IF:%.*]]
> -; CHECK:       if:
> -; CHECK-NEXT:    call void @dummy()
> -; CHECK-NEXT:    br label [[JOIN]]
> -; CHECK:       join:
> -; CHECK-NEXT:    br i1 [[C2:%.*]], label [[LOOP2]], label [[LOOP_LATCH:%.*]]
> +; CHECK-NEXT:    br label [[LOOP_CRITEDGE:%.*]]
> +; CHECK:       loop.critedge:
> +; CHECK-NEXT:    br label [[LOOP_CRITEDGE]]
>  ; CHECK:       exit:
>  ; CHECK-NEXT:    ret i32 0
>  ;
> </cut>



-- 
Thanks,
~Nick Desaulniers
