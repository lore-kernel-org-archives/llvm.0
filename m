Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377E02C81
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 22:33:10 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id m3so16736638lfu.2
        for <llvm@lists.linux.dev>; Wed, 06 Oct 2021 15:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XAAkxyNC9tJss2AmcuvZ9hJ3P0WbWZ1zL82WojxY9D8=;
        b=GCHx/T1/g+FJVgLeiH2rkRqLMJOOR3rjYFfD7CWM7eGw0RWLwVhkhsPPl7ML73/tj1
         eFPk3HNgHY8UIs6nmt63+PgT2T+UhhnJHPmbPF5uQChYX8QGBnIo400Ln3KS/VJ/mHYt
         nJziu2m1VB0eahPoSSNeKmiF2mmdRR9/Iy0v4JfBSBJovMaTE2WCD0rwATeShiwISWJY
         Od5d3InJwC+ERRWGBQqf4FIiP0af2GrCn74cLh0QJkySsfQavqtmXbccS4FjwktQsosw
         4y84FPgUd0LnfP2kPr1aNoe4wRCLkEyZACQPaxC0qzTsV0+V92hErVT7x3rfAse8sjgC
         N0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XAAkxyNC9tJss2AmcuvZ9hJ3P0WbWZ1zL82WojxY9D8=;
        b=Y6op0ffp7cYzMhdloBtWT6Branh6QyWmb9sSh3xvylmI9fLBkcn1pITX5/FAizga71
         ht5huBtxjUW34PbxSPBCBmKjX3h+3I5QrtbhKgDn13FVLC2EZL89UQfnGZaUbNH/8Ln3
         SRwqiznVccFJKZWld9buLNCHKXXRPfHCRhM6AOAtyGScwtw/f5i3ujGn/nn8NgmVFESX
         5v9SuAKsz7AYSA4QW/pYs+onokCGjLE2jcOzVEyl7cMga2Jn5OWw/dnYS5m7RzyT5Sof
         nIMteyx3SV0l+tNwLlhFLIgWuWvLJwqj4uzeQ0aMROZm3BI2DRTJKg6NO7My38nkjzN5
         KJTw==
X-Gm-Message-State: AOAM531yI0ITj69VIhPeskxX+KaLKzV+y8APhohAhGNXdvb8XIJA+Ail
	6boCjY0gi78tHXLK6AUsk1fwYcGKLhm6rIYzhljV2g==
X-Google-Smtp-Source: ABdhPJzXORyV0QFz+8F+xHmaGclOonAy+oLX9zDvATJKmolxrC8wnCWAYG8S1tDS9VweqnlvTQElgGT1UYcyWiXaVWI=
X-Received: by 2002:a05:6512:b0c:: with SMTP id w12mr677730lfu.240.1633559587671;
 Wed, 06 Oct 2021 15:33:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1133377776.9620.1633558677135@localhost>
In-Reply-To: <1133377776.9620.1633558677135@localhost>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 6 Oct 2021 15:32:55 -0700
Message-ID: <CAKwvOdkg7dNHJttV-tiB0zZRyDH+SVzJqFODYOS29hvqqwhMdg@mail.gmail.com>
Subject: Re: [TCWG CI] Regression caused by llvm: [AArch64] Split bitmask
 immediate of bitwise AND operation
To: ci_notify@linaro.org
Cc: Jingu Kang <jingu.kang@arm.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Looks like it's been reverted as of now. Thanks for the report!

On Wed, Oct 6, 2021 at 3:18 PM <ci_notify@linaro.org> wrote:
>
> [TCWG CI] Regression caused by llvm: [AArch64] Split bitmask immediate of bitwise AND operation:
> commit 864b206796ae8aa7f35f830655337751dbd9176c
> Author: Jingu Kang <jingu.kang@arm.com>
>
>     [AArch64] Split bitmask immediate of bitwise AND operation
>
> Results regressed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 19861
> # First few build errors in logs:
> # 00:01:34 clang-14: error: clang frontend command failed with exit code 134 (use -v to see invocation)
> # 00:01:35 make[1]: *** [scripts/Makefile.build:277: ipc/sem.o] Error 134
> # 00:01:45 clang-14: error: clang frontend command failed with exit code 134 (use -v to see invocation)
> # 00:01:46 make[2]: *** [scripts/Makefile.build:277: drivers/irqchip/exynos-combiner.o] Error 134
> # 00:01:48 make: *** [Makefile:1868: ipc] Error 2
> # 00:02:00 clang-14: error: clang frontend command failed with exit code 134 (use -v to see invocation)
> # 00:02:00 clang-14: error: clang frontend command failed with exit code 134 (use -v to see invocation)
> # 00:02:00 make[2]: *** [scripts/Makefile.build:277: drivers/pwm/pwm-atmel.o] Error 134
> # 00:02:00 make[2]: *** [scripts/Makefile.build:277: arch/arm64/kernel/cpu_errata.o] Error 134
> # 00:02:00 clang-14: error: clang frontend command failed with exit code 134 (use -v to see invocation)
>
> from
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 20223
> # linux build successful:
> all
>
> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
>
> This commit has regressed these CI configurations:
>  - tcwg_kernel/llvm-master-aarch64-mainline-allyesconfig
>
> First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/18/artifact/artifacts/build-864b206796ae8aa7f35f830655337751dbd9176c/
> Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/18/artifact/artifacts/build-4f01a02d738b033c10bfed5b47014fc197509a4f/
> Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/18/artifact/artifacts/build-baseline/
> Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/18/artifact/artifacts/
>
> Reproduce builds:
> <cut>
> mkdir investigate-llvm-864b206796ae8aa7f35f830655337751dbd9176c
> cd investigate-llvm-864b206796ae8aa7f35f830655337751dbd9176c
>
> # Fetch scripts
> git clone https://git.linaro.org/toolchain/jenkins-scripts
>
> # Fetch manifests and test.sh script
> mkdir -p artifacts/manifests
> curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/18/artifact/artifacts/manifests/build-baseline.sh --fail
> curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/18/artifact/artifacts/manifests/build-parameters.sh --fail
> curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/18/artifact/artifacts/test.sh --fail
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
> git checkout --detach 864b206796ae8aa7f35f830655337751dbd9176c
> ../artifacts/test.sh
>
> # Reproduce last_good build
> git checkout --detach 4f01a02d738b033c10bfed5b47014fc197509a4f
> ../artifacts/test.sh
>
> cd ..
> </cut>
>
> Full commit (up to 1000 lines):
> <cut>
> commit 864b206796ae8aa7f35f830655337751dbd9176c
> Author: Jingu Kang <jingu.kang@arm.com>
> Date:   Wed Sep 22 17:01:21 2021 +0100
>
>     [AArch64] Split bitmask immediate of bitwise AND operation
>
>     MOVi32imm + ANDWrr ==> ANDWri + ANDWri
>     MOVi64imm + ANDXrr ==> ANDXri + ANDXri
>
>     The mov pseudo instruction could be expanded to multiple mov instructions later.
>     In this case, try to split the constant operand of mov instruction into two
>     bitmask immediates. It makes only two AND instructions intead of multiple
>     mov + and instructions.
>
>     Added a peephole optimization pass on MIR level to implement it.
>
>     Differential Revision: https://reviews.llvm.org/D109963
> ---
>  llvm/lib/Target/AArch64/AArch64.h                  |   2 +
>  llvm/lib/Target/AArch64/AArch64MIPeepholeOpt.cpp   | 213 ++++++++++++++++++
>  llvm/lib/Target/AArch64/AArch64TargetMachine.cpp   |  10 +
>  llvm/lib/Target/AArch64/CMakeLists.txt             |   1 +
>  .../AArch64/MCTargetDesc/AArch64AddressingModes.h  |   1 +
>  llvm/test/CodeGen/AArch64/O3-pipeline.ll           |   3 +-
>  .../AArch64/aarch64-split-and-bitmask-immediate.ll | 245 +++++++++++++++++++++
>  ...old-masked-merge-scalar-constmask-innerouter.ll |   5 +-
>  8 files changed, 476 insertions(+), 4 deletions(-)
>
> diff --git a/llvm/lib/Target/AArch64/AArch64.h b/llvm/lib/Target/AArch64/AArch64.h
> index 658d44771e8d..b0dd30c13137 100644
> --- a/llvm/lib/Target/AArch64/AArch64.h
> +++ b/llvm/lib/Target/AArch64/AArch64.h
> @@ -51,6 +51,7 @@ FunctionPass *createAArch64A53Fix835769();
>  FunctionPass *createFalkorHWPFFixPass();
>  FunctionPass *createFalkorMarkStridedAccessesPass();
>  FunctionPass *createAArch64BranchTargetsPass();
> +FunctionPass *createAArch64MIPeepholeOptPass();
>
>  FunctionPass *createAArch64CleanupLocalDynamicTLSPass();
>
> @@ -82,6 +83,7 @@ void initializeAArch64SLSHardeningPass(PassRegistry&);
>  void initializeAArch64SpeculationHardeningPass(PassRegistry&);
>  void initializeAArch64LoadStoreOptPass(PassRegistry&);
>  void initializeAArch64LowerHomogeneousPrologEpilogPass(PassRegistry &);
> +void initializeAArch64MIPeepholeOptPass(PassRegistry &);
>  void initializeAArch64SIMDInstrOptPass(PassRegistry&);
>  void initializeAArch64O0PreLegalizerCombinerPass(PassRegistry &);
>  void initializeAArch64PreLegalizerCombinerPass(PassRegistry&);
> diff --git a/llvm/lib/Target/AArch64/AArch64MIPeepholeOpt.cpp b/llvm/lib/Target/AArch64/AArch64MIPeepholeOpt.cpp
> new file mode 100644
> index 000000000000..f77928520b7d
> --- /dev/null
> +++ b/llvm/lib/Target/AArch64/AArch64MIPeepholeOpt.cpp
> @@ -0,0 +1,213 @@
> +//===- AArch64MIPeepholeOpt.cpp - AArch64 MI peephole optimization pass ---===//
> +//
> +// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
> +// See https://llvm.org/LICENSE.txt for license information.
> +// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
> +//
> +//===----------------------------------------------------------------------===//
> +//
> +// This pass performs below peephole optimizations on MIR level.
> +//
> +// 1. MOVi32imm + ANDWrr ==> ANDWri + ANDWri
> +//    MOVi64imm + ANDXrr ==> ANDXri + ANDXri
> +//
> +//    The mov pseudo instruction could be expanded to multiple mov instructions
> +//    later. In this case, we could try to split the constant  operand of mov
> +//    instruction into two bitmask immediates. It makes two AND instructions
> +//    intead of multiple `mov` + `and` instructions.
> +//===----------------------------------------------------------------------===//
> +
> +#include "AArch64ExpandImm.h"
> +#include "AArch64InstrInfo.h"
> +#include "MCTargetDesc/AArch64AddressingModes.h"
> +#include "llvm/ADT/SetVector.h"
> +#include "llvm/CodeGen/MachineDominators.h"
> +#include "llvm/CodeGen/MachineLoopInfo.h"
> +
> +using namespace llvm;
> +
> +#define DEBUG_TYPE "aarch64-mi-peephole-opt"
> +
> +namespace {
> +
> +struct AArch64MIPeepholeOpt : public MachineFunctionPass {
> +  static char ID;
> +
> +  AArch64MIPeepholeOpt() : MachineFunctionPass(ID) {
> +    initializeAArch64MIPeepholeOptPass(*PassRegistry::getPassRegistry());
> +  }
> +
> +  const AArch64InstrInfo *TII;
> +  MachineLoopInfo *MLI;
> +  MachineRegisterInfo *MRI;
> +
> +  template <typename T>
> +  bool visitAND(MachineInstr &MI,
> +                SmallSetVector<MachineInstr *, 8> &ToBeRemoved);
> +  bool runOnMachineFunction(MachineFunction &MF) override;
> +
> +  StringRef getPassName() const override {
> +    return "AArch64 MI Peephole Optimization pass";
> +  }
> +
> +  void getAnalysisUsage(AnalysisUsage &AU) const override {
> +    AU.setPreservesCFG();
> +    AU.addRequired<MachineLoopInfo>();
> +    MachineFunctionPass::getAnalysisUsage(AU);
> +  }
> +};
> +
> +char AArch64MIPeepholeOpt::ID = 0;
> +
> +} // end anonymous namespace
> +
> +INITIALIZE_PASS(AArch64MIPeepholeOpt, "aarch64-mi-peephole-opt",
> +                "AArch64 MI Peephole Optimization", false, false)
> +
> +template <typename T>
> +static bool splitBitmaskImm(T Imm, unsigned RegSize, T &Imm1Enc, T &Imm2Enc) {
> +  T UImm = static_cast<T>(Imm);
> +  if (AArch64_AM::isLogicalImmediate(UImm, RegSize))
> +    return false;
> +
> +  // If this immediate can be handled by one instruction, do not split it.
> +  SmallVector<AArch64_IMM::ImmInsnModel, 4> Insn;
> +  AArch64_IMM::expandMOVImm(UImm, RegSize, Insn);
> +  if (Insn.size() == 1)
> +    return false;
> +
> +  // The bitmask immediate consists of consecutive ones.  Let's say there is
> +  // constant 0b00000000001000000000010000000000 which does not consist of
> +  // consecutive ones. We can split it in to two bitmask immediate like
> +  // 0b00000000001111111111110000000000 and 0b11111111111000000000011111111111.
> +  // If we do AND with these two bitmask immediate, we can see original one.
> +  unsigned LowestBitSet = countTrailingZeros(UImm);
> +  unsigned HighestBitSet = Log2_64(UImm);
> +
> +  // Create a mask which is filled with one from the position of lowest bit set
> +  // to the position of highest bit set.
> +  T NewImm1 = (static_cast<T>(2) << HighestBitSet) -
> +              (static_cast<T>(1) << LowestBitSet);
> +  // Create a mask which is filled with one outside the position of lowest bit
> +  // set and the position of highest bit set.
> +  T NewImm2 = UImm | ~NewImm1;
> +
> +  // If the splitted value is not valid bitmask immediate, do not split this
> +  // constant.
> +  if (!AArch64_AM::isLogicalImmediate(NewImm2, RegSize))
> +    return false;
> +
> +  Imm1Enc = AArch64_AM::encodeLogicalImmediate(NewImm1, RegSize);
> +  Imm2Enc = AArch64_AM::encodeLogicalImmediate(NewImm2, RegSize);
> +  return true;
> +}
> +
> +template <typename T>
> +bool AArch64MIPeepholeOpt::visitAND(
> +    MachineInstr &MI, SmallSetVector<MachineInstr *, 8> &ToBeRemoved) {
> +  // Try below transformation.
> +  //
> +  // MOVi32imm + ANDWrr ==> ANDWri + ANDWri
> +  // MOVi64imm + ANDXrr ==> ANDXri + ANDXri
> +  //
> +  // The mov pseudo instruction could be expanded to multiple mov instructions
> +  // later. Let's try to split the constant operand of mov instruction into two
> +  // bitmask immediates. It makes only two AND instructions intead of multiple
> +  // mov + and instructions.
> +
> +  unsigned RegSize = sizeof(T) * 8;
> +  assert((RegSize == 32 || RegSize == 64) &&
> +         "Invalid RegSize for AND bitmask peephole optimization");
> +
> +  // Check whether AND's MBB is in loop and the AND is loop invariant.
> +  MachineBasicBlock *MBB = MI.getParent();
> +  MachineLoop *L = MLI->getLoopFor(MBB);
> +  if (L && !L->isLoopInvariant(MI))
> +    return false;
> +
> +  // Check whether AND's operand is MOV with immediate.
> +  MachineInstr *MovMI = MRI->getUniqueVRegDef(MI.getOperand(2).getReg());
> +  MachineInstr *SubregToRegMI = nullptr;
> +  // If it is SUBREG_TO_REG, check its operand.
> +  if (MovMI->getOpcode() == TargetOpcode::SUBREG_TO_REG) {
> +    SubregToRegMI = MovMI;
> +    MovMI = MRI->getUniqueVRegDef(MovMI->getOperand(2).getReg());
> +  }
> +
> +  // If the MOV has multiple uses, do not split the immediate because it causes
> +  // more instructions.
> +  if (!MRI->hasOneUse(MovMI->getOperand(0).getReg()))
> +    return false;
> +
> +  if (MovMI->getOpcode() != AArch64::MOVi32imm &&
> +      MovMI->getOpcode() != AArch64::MOVi64imm)
> +    return false;
> +
> +  // Split the bitmask immediate into two.
> +  T UImm = static_cast<T>(MovMI->getOperand(1).getImm());
> +  T Imm1Enc;
> +  T Imm2Enc;
> +  if (!splitBitmaskImm(UImm, RegSize, Imm1Enc, Imm2Enc))
> +    return false;
> +
> +  // Create new AND MIs.
> +  DebugLoc DL = MI.getDebugLoc();
> +  Register DstReg = MI.getOperand(0).getReg();
> +  Register SrcReg = MI.getOperand(1).getReg();
> +  Register NewTmpReg = MRI->createVirtualRegister(MRI->getRegClass(DstReg));
> +  unsigned Opcode = (RegSize == 32) ? AArch64::ANDWri : AArch64::ANDXri;
> +
> +  BuildMI(*MBB, MI, DL, TII->get(Opcode), NewTmpReg)
> +      .addReg(SrcReg)
> +      .addImm(Imm1Enc);
> +
> +  BuildMI(*MBB, MI, DL, TII->get(Opcode), DstReg)
> +      .addReg(NewTmpReg)
> +      .addImm(Imm2Enc);
> +
> +  ToBeRemoved.insert(&MI);
> +  if (SubregToRegMI)
> +    ToBeRemoved.insert(SubregToRegMI);
> +  ToBeRemoved.insert(MovMI);
> +
> +  return true;
> +}
> +
> +bool AArch64MIPeepholeOpt::runOnMachineFunction(MachineFunction &MF) {
> +  if (skipFunction(MF.getFunction()))
> +    return false;
> +
> +  TII = static_cast<const AArch64InstrInfo *>(MF.getSubtarget().getInstrInfo());
> +  MLI = &getAnalysis<MachineLoopInfo>();
> +  MRI = &MF.getRegInfo();
> +
> +  if (!MRI->isSSA())
> +    return false;
> +
> +  bool Changed = false;
> +  SmallSetVector<MachineInstr *, 8> ToBeRemoved;
> +
> +  for (MachineBasicBlock &MBB : MF) {
> +    for (MachineInstr &MI : MBB) {
> +      switch (MI.getOpcode()) {
> +      default:
> +        break;
> +      case AArch64::ANDWrr:
> +        Changed = visitAND<uint32_t>(MI, ToBeRemoved);
> +        break;
> +      case AArch64::ANDXrr:
> +        Changed = visitAND<uint64_t>(MI, ToBeRemoved);
> +        break;
> +      }
> +    }
> +  }
> +
> +  for (MachineInstr *MI : ToBeRemoved)
> +    MI->eraseFromParent();
> +
> +  return Changed;
> +}
> +
> +FunctionPass *llvm::createAArch64MIPeepholeOptPass() {
> +  return new AArch64MIPeepholeOpt();
> +}
> diff --git a/llvm/lib/Target/AArch64/AArch64TargetMachine.cpp b/llvm/lib/Target/AArch64/AArch64TargetMachine.cpp
> index 99bcb2f4649a..637f69af0365 100644
> --- a/llvm/lib/Target/AArch64/AArch64TargetMachine.cpp
> +++ b/llvm/lib/Target/AArch64/AArch64TargetMachine.cpp
> @@ -195,6 +195,7 @@ extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeAArch64Target() {
>    initializeAArch64DeadRegisterDefinitionsPass(*PR);
>    initializeAArch64ExpandPseudoPass(*PR);
>    initializeAArch64LoadStoreOptPass(*PR);
> +  initializeAArch64MIPeepholeOptPass(*PR);
>    initializeAArch64SIMDInstrOptPass(*PR);
>    initializeAArch64O0PreLegalizerCombinerPass(*PR);
>    initializeAArch64PreLegalizerCombinerPass(*PR);
> @@ -479,6 +480,7 @@ public:
>    bool addRegBankSelect() override;
>    void addPreGlobalInstructionSelect() override;
>    bool addGlobalInstructionSelect() override;
> +  void addMachineSSAOptimization() override;
>    bool addILPOpts() override;
>    void addPreRegAlloc() override;
>    void addPostRegAlloc() override;
> @@ -649,6 +651,14 @@ bool AArch64PassConfig::addGlobalInstructionSelect() {
>    return false;
>  }
>
> +void AArch64PassConfig::addMachineSSAOptimization() {
> +  // Run default MachineSSAOptimization first.
> +  TargetPassConfig::addMachineSSAOptimization();
> +
> +  if (TM->getOptLevel() != CodeGenOpt::None)
> +    addPass(createAArch64MIPeepholeOptPass());
> +}
> +
>  bool AArch64PassConfig::addILPOpts() {
>    if (EnableCondOpt)
>      addPass(createAArch64ConditionOptimizerPass());
> diff --git a/llvm/lib/Target/AArch64/CMakeLists.txt b/llvm/lib/Target/AArch64/CMakeLists.txt
> index a77a66bacc4c..aeedeb4eebac 100644
> --- a/llvm/lib/Target/AArch64/CMakeLists.txt
> +++ b/llvm/lib/Target/AArch64/CMakeLists.txt
> @@ -66,6 +66,7 @@ add_llvm_target(AArch64CodeGen
>    AArch64LowerHomogeneousPrologEpilog.cpp
>    AArch64MachineFunctionInfo.cpp
>    AArch64MacroFusion.cpp
> +  AArch64MIPeepholeOpt.cpp
>    AArch64MCInstLower.cpp
>    AArch64PromoteConstant.cpp
>    AArch64PBQPRegAlloc.cpp
> diff --git a/llvm/lib/Target/AArch64/MCTargetDesc/AArch64AddressingModes.h b/llvm/lib/Target/AArch64/MCTargetDesc/AArch64AddressingModes.h
> index c3e74757675b..876526093591 100644
> --- a/llvm/lib/Target/AArch64/MCTargetDesc/AArch64AddressingModes.h
> +++ b/llvm/lib/Target/AArch64/MCTargetDesc/AArch64AddressingModes.h
> @@ -13,6 +13,7 @@
>  #ifndef LLVM_LIB_TARGET_AARCH64_MCTARGETDESC_AARCH64ADDRESSINGMODES_H
>  #define LLVM_LIB_TARGET_AARCH64_MCTARGETDESC_AARCH64ADDRESSINGMODES_H
>
> +#include "AArch64ExpandImm.h"
>  #include "llvm/ADT/APFloat.h"
>  #include "llvm/ADT/APInt.h"
>  #include "llvm/ADT/bit.h"
> diff --git a/llvm/test/CodeGen/AArch64/O3-pipeline.ll b/llvm/test/CodeGen/AArch64/O3-pipeline.ll
> index 1d6eca60838f..6796022a95e6 100644
> --- a/llvm/test/CodeGen/AArch64/O3-pipeline.ll
> +++ b/llvm/test/CodeGen/AArch64/O3-pipeline.ll
> @@ -40,7 +40,7 @@
>  ; CHECK-NEXT:         Induction Variable Users
>  ; CHECK-NEXT:         Loop Strength Reduction
>  ; CHECK-NEXT:       Basic Alias Analysis (stateless AA impl)
> -; CHECK-NEXT:         Function Alias Analysis Results
> +; CHECK-NEXT:       Function Alias Analysis Results
>  ; CHECK-NEXT:       Merge contiguous icmps into a memcmp
>  ; CHECK-NEXT:       Natural Loop Information
>  ; CHECK-NEXT:       Lazy Branch Probability Analysis
> @@ -131,6 +131,7 @@
>  ; CHECK-NEXT:       Machine code sinking
>  ; CHECK-NEXT:       Peephole Optimizations
>  ; CHECK-NEXT:       Remove dead machine instructions
> +; CHECK-NEXT:       AArch64 MI Peephole Optimization pass
>  ; CHECK-NEXT:       AArch64 Dead register definitions
>  ; CHECK-NEXT:       Detect Dead Lanes
>  ; CHECK-NEXT:       Process Implicit Definitions
> diff --git a/llvm/test/CodeGen/AArch64/aarch64-split-and-bitmask-immediate.ll b/llvm/test/CodeGen/AArch64/aarch64-split-and-bitmask-immediate.ll
> new file mode 100644
> index 000000000000..0b082e313396
> --- /dev/null
> +++ b/llvm/test/CodeGen/AArch64/aarch64-split-and-bitmask-immediate.ll
> @@ -0,0 +1,245 @@
> +; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
> +; RUN: llc -mtriple=aarch64-none-linux-gnu < %s | FileCheck %s
> +
> +define i8 @test1(i32 %a) {
> +; CHECK-LABEL: test1:
> +; CHECK:       // %bb.0: // %entry
> +; CHECK-NEXT:    and w8, w0, #0x3ffc00
> +; CHECK-NEXT:    and w8, w8, #0xffe007ff
> +; CHECK-NEXT:    cmp w8, #1024
> +; CHECK-NEXT:    cset w0, eq
> +; CHECK-NEXT:    ret
> +entry:
> +  %and = and i32 %a, 2098176
> +  %cmp = icmp eq i32 %and, 1024
> +  %conv = zext i1 %cmp to i8
> +  ret i8 %conv
> +}
> +
> +; This constant should not be split because it can be handled by one mov.
> +define i8 @test2(i32 %a) {
> +; CHECK-LABEL: test2:
> +; CHECK:       // %bb.0: // %entry
> +; CHECK-NEXT:    mov w8, #135
> +; CHECK-NEXT:    and w8, w0, w8
> +; CHECK-NEXT:    cmp w8, #1024
> +; CHECK-NEXT:    cset w0, eq
> +; CHECK-NEXT:    ret
> +entry:
> +  %and = and i32 %a, 135
> +  %cmp = icmp eq i32 %and, 1024
> +  %conv = zext i1 %cmp to i8
> +  ret i8 %conv
> +}
> +
> +; This constant should not be split because the split immediate is not valid
> +; bitmask immediate.
> +define i8 @test3(i32 %a) {
> +; CHECK-LABEL: test3:
> +; CHECK:       // %bb.0: // %entry
> +; CHECK-NEXT:    mov w8, #1024
> +; CHECK-NEXT:    movk w8, #33, lsl #16
> +; CHECK-NEXT:    and w8, w0, w8
> +; CHECK-NEXT:    cmp w8, #1024
> +; CHECK-NEXT:    cset w0, eq
> +; CHECK-NEXT:    ret
> +entry:
> +  %and = and i32 %a, 2163712
> +  %cmp = icmp eq i32 %and, 1024
> +  %conv = zext i1 %cmp to i8
> +  ret i8 %conv
> +}
> +
> +define i8 @test4(i64 %a) {
> +; CHECK-LABEL: test4:
> +; CHECK:       // %bb.0: // %entry
> +; CHECK-NEXT:    and x8, x0, #0x3ffc00
> +; CHECK-NEXT:    and x8, x8, #0xffffffffffe007ff
> +; CHECK-NEXT:    cmp x8, #1024
> +; CHECK-NEXT:    cset w0, eq
> +; CHECK-NEXT:    ret
> +entry:
> +  %and = and i64 %a, 2098176
> +  %cmp = icmp eq i64 %and, 1024
> +  %conv = zext i1 %cmp to i8
> +  ret i8 %conv
> +}
> +
> +define i8 @test5(i64 %a) {
> +; CHECK-LABEL: test5:
> +; CHECK:       // %bb.0: // %entry
> +; CHECK-NEXT:    and x8, x0, #0x3ffffc000
> +; CHECK-NEXT:    and x8, x8, #0xfffffffe00007fff
> +; CHECK-NEXT:    cmp x8, #1024
> +; CHECK-NEXT:    cset w0, eq
> +; CHECK-NEXT:    ret
> +entry:
> +  %and = and i64 %a, 8589950976
> +  %cmp = icmp eq i64 %and, 1024
> +  %conv = zext i1 %cmp to i8
> +  ret i8 %conv
> +}
> +
> +; This constant should not be split because it can be handled by one mov.
> +define i8 @test6(i64 %a) {
> +; CHECK-LABEL: test6:
> +; CHECK:       // %bb.0: // %entry
> +; CHECK-NEXT:    mov w8, #135
> +; CHECK-NEXT:    and x8, x0, x8
> +; CHECK-NEXT:    cmp x8, #1024
> +; CHECK-NEXT:    cset w0, eq
> +; CHECK-NEXT:    ret
> +entry:
> +  %and = and i64 %a, 135
> +  %cmp = icmp eq i64 %and, 1024
> +  %conv = zext i1 %cmp to i8
> +  ret i8 %conv
> +}
> +
> +; This constant should not be split because the split immediate is not valid
> +; bitmask immediate.
> +define i8 @test7(i64 %a) {
> +; CHECK-LABEL: test7:
> +; CHECK:       // %bb.0: // %entry
> +; CHECK-NEXT:    mov w8, #1024
> +; CHECK-NEXT:    movk w8, #33, lsl #16
> +; CHECK-NEXT:    and x8, x0, x8
> +; CHECK-NEXT:    cmp x8, #1024
> +; CHECK-NEXT:    cset w0, eq
> +; CHECK-NEXT:    ret
> +entry:
> +  %and = and i64 %a, 2163712
> +  %cmp = icmp eq i64 %and, 1024
> +  %conv = zext i1 %cmp to i8
> +  ret i8 %conv
> +}
> +
> +; The split bitmask immediates should be hoisted outside loop because they are
> +; loop invariant.
> +define void @test8(i64 %a, i64* noalias %src, i64* noalias %dst, i64 %n) {
> +; CHECK-LABEL: test8:
> +; CHECK:       // %bb.0: // %loop.ph
> +; CHECK-NEXT:    and x9, x0, #0x3ffc00
> +; CHECK-NEXT:    mov x8, xzr
> +; CHECK-NEXT:    and x9, x9, #0xffffffffffe007ff
> +; CHECK-NEXT:    b .LBB7_2
> +; CHECK-NEXT:  .LBB7_1: // %for.inc
> +; CHECK-NEXT:    // in Loop: Header=BB7_2 Depth=1
> +; CHECK-NEXT:    add x8, x8, #1
> +; CHECK-NEXT:    cmp x8, x3
> +; CHECK-NEXT:    b.gt .LBB7_4
> +; CHECK-NEXT:  .LBB7_2: // %loop
> +; CHECK-NEXT:    // =>This Inner Loop Header: Depth=1
> +; CHECK-NEXT:    cmp x8, x9
> +; CHECK-NEXT:    b.hs .LBB7_1
> +; CHECK-NEXT:  // %bb.3: // %if.then
> +; CHECK-NEXT:    // in Loop: Header=BB7_2 Depth=1
> +; CHECK-NEXT:    lsl x10, x8, #3
> +; CHECK-NEXT:    ldr x11, [x1, x10]
> +; CHECK-NEXT:    str x11, [x2, x10]
> +; CHECK-NEXT:    b .LBB7_1
> +; CHECK-NEXT:  .LBB7_4: // %exit
> +; CHECK-NEXT:    ret
> +loop.ph:
> +  br label %loop
> +
> +loop:
> +  %iv = phi i64 [ %inc, %for.inc ], [ 0, %loop.ph ]
> +  %and = and i64 %a, 2098176
> +  %cmp = icmp ult i64 %iv, %and
> +  br i1 %cmp, label %if.then, label %if.else
> +
> +if.then:
> +  %src.arrayidx = getelementptr inbounds i64, i64* %src, i64 %iv
> +  %val = load i64, i64* %src.arrayidx
> +  %dst.arrayidx = getelementptr inbounds i64, i64* %dst, i64 %iv
> +  store i64 %val, i64* %dst.arrayidx
> +  br label %for.inc
> +
> +if.else:
> +  br label %for.inc
> +
> +for.inc:
> +  %inc = add nuw nsw i64 %iv, 1
> +  %cond = icmp sgt i64 %inc, %n
> +  br i1 %cond, label %exit, label %loop
> +
> +exit:
> +  ret void
> +}
> +
> +; This constant should not be split because the `and` is not loop invariant.
> +define i32 @test9(i32* nocapture %x, i32* nocapture readonly %y, i32 %n) {
> +; CHECK-LABEL: test9:
> +; CHECK:       // %bb.0: // %entry
> +; CHECK-NEXT:    cmp w2, #1
> +; CHECK-NEXT:    b.lt .LBB8_3
> +; CHECK-NEXT:  // %bb.1: // %for.body.preheader
> +; CHECK-NEXT:    mov w9, #1024
> +; CHECK-NEXT:    mov w8, w2
> +; CHECK-NEXT:    movk w9, #32, lsl #16
> +; CHECK-NEXT:  .LBB8_2: // %for.body
> +; CHECK-NEXT:    // =>This Inner Loop Header: Depth=1
> +; CHECK-NEXT:    ldr w10, [x1], #4
> +; CHECK-NEXT:    subs x8, x8, #1
> +; CHECK-NEXT:    and w10, w10, w9
> +; CHECK-NEXT:    str w10, [x0], #4
> +; CHECK-NEXT:    b.ne .LBB8_2
> +; CHECK-NEXT:  .LBB8_3: // %for.cond.cleanup
> +; CHECK-NEXT:    mov w0, wzr
> +; CHECK-NEXT:    ret
> +entry:
> +  %cmp8 = icmp sgt i32 %n, 0
> +  br i1 %cmp8, label %for.body.preheader, label %for.cond.cleanup
> +
> +for.body.preheader:                               ; preds = %entry
> +  %wide.trip.count = zext i32 %n to i64
> +  br label %for.body
> +
> +for.cond.cleanup:                                 ; preds = %for.body, %entry
> +  ret i32 0
> +
> +for.body:                                         ; preds = %for.body.preheader, %for.body
> +  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
> +  %arrayidx = getelementptr inbounds i32, i32* %y, i64 %indvars.iv
> +  %0 = load i32, i32* %arrayidx, align 4
> +  %and = and i32 %0, 2098176
> +  %arrayidx2 = getelementptr inbounds i32, i32* %x, i64 %indvars.iv
> +  store i32 %and, i32* %arrayidx2, align 4
> +  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
> +  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
> +  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body
> +}
> +
> +; After instruction selection end, we can see the `and` and `or` share the
> +; constant as below.
> +;
> +; %4:gpr32 = MOVi32imm 2098176
> +; %5:gpr32 = ANDWrr killed %3:gpr32, %4:gpr32
> +; STRWui killed %5:gpr32, %0:gpr64common, 0 :: (store (s32) into %ir.x, !tbaa !8)
> +; %6:gpr32 = LDRWui %1:gpr64common, 0 :: (load (s32) from %ir.y, !tbaa !8)
> +; %7:gpr32 = ORRWrr killed %6:gpr32, %4:gpr32
> +;
> +; In this case, the constant should not be split because it causes more
> +; instructions.
> +define void @test10(i32* nocapture %x, i32* nocapture readonly %y, i32* nocapture %z) {
> +; CHECK-LABEL: test10:
> +; CHECK:       // %bb.0: // %entry
> +; CHECK-NEXT:    ldr w8, [x1]
> +; CHECK-NEXT:    mov w9, #1024
> +; CHECK-NEXT:    movk w9, #32, lsl #16
> +; CHECK-NEXT:    and w8, w8, w9
> +; CHECK-NEXT:    str w8, [x0]
> +; CHECK-NEXT:    ldr w8, [x1]
> +; CHECK-NEXT:    orr w8, w8, w9
> +; CHECK-NEXT:    str w8, [x2]
> +; CHECK-NEXT:    ret
> +entry:
> +  %0 = load i32, i32* %y, align 4
> +  %and = and i32 %0, 2098176
> +  store i32 %and, i32* %x, align 4
> +  %1 = load i32, i32* %y, align 4
> +  %or = or i32 %1, 2098176
> +  store i32 %or, i32* %z, align 4
> +  ret void
> +}
> diff --git a/llvm/test/CodeGen/AArch64/unfold-masked-merge-scalar-constmask-innerouter.ll b/llvm/test/CodeGen/AArch64/unfold-masked-merge-scalar-constmask-innerouter.ll
> index 2e20ef67b2a2..3e30f45cfabb 100644
> --- a/llvm/test/CodeGen/AArch64/unfold-masked-merge-scalar-constmask-innerouter.ll
> +++ b/llvm/test/CodeGen/AArch64/unfold-masked-merge-scalar-constmask-innerouter.ll
> @@ -245,10 +245,9 @@ define i32 @in_multiuse_B_constmask(i32 %x, i32 %y, i32 %z) nounwind {
>  define i32 @n0_badconstmask(i32 %x, i32 %y) {
>  ; CHECK-LABEL: n0_badconstmask:
>  ; CHECK:       // %bb.0:
> -; CHECK-NEXT:    mov w9, #256
> -; CHECK-NEXT:    movk w9, #65280, lsl #16
> +; CHECK-NEXT:    and w9, w1, #0xffffff00
>  ; CHECK-NEXT:    and w8, w0, #0xffff00
> -; CHECK-NEXT:    and w9, w1, w9
> +; CHECK-NEXT:    and w9, w9, #0xff0001ff
>  ; CHECK-NEXT:    orr w0, w8, w9
>  ; CHECK-NEXT:    ret
>    %mx = and i32 %x, 16776960
> </cut>



-- 
Thanks,
~Nick Desaulniers
