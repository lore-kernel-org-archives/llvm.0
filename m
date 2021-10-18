Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2569D2C81
	for <llvm@lists.linux.dev>; Mon, 18 Oct 2021 17:19:09 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id w23so1041301lje.7
        for <llvm@lists.linux.dev>; Mon, 18 Oct 2021 10:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LbhzY+/C5gh6X3K647G/hdqIlgVxlGxBwpMd9Mtx12w=;
        b=JnFta9ae+WE1Ate+M6ynmyq+DZMV4gl6nogDmo4yHr4XqTm9zGG5et/hvjcQIZBArO
         1+3f/p7quPTfziv6yHpA1Giz3hvaltQdDKYtEfGcCCBTeWdPv4aFh2QKzljaPrV8VGuH
         XL0Ff/qF7cIyGb1RymQRU0fhkDnFN3OLXtTH6Qqps0kCwHX9XIKCbuY8fb7klE+QB6dl
         pfGVD2y+tSllSgiYCn4f4rNEjifqVDUSQeMc3cSuDTKj8DPjnsN9baIvFBtAvDiGyybZ
         FIuNp3zOMBWotzqN0fXV7WpxSKGXqzU2a2RmdsjECn5DCgBKbHT+oCnCQVj6GzjYl5py
         64yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LbhzY+/C5gh6X3K647G/hdqIlgVxlGxBwpMd9Mtx12w=;
        b=7HX+vP0hyFzdnmdzNHvBYMi01W6AXKmd2hoTq1RBUVfzRzKWsVXFmrzvkdwHn4ciR6
         88CzDuEgV0jM1ixVKWY/xfsbPJiHp2YvNhFRdmdjy38lZUvFUj1KZZRGCw5rqhntp+sM
         Snlg/UaPuBgDJ6vjRSgVwSlWlXZQmgbqbFX4LIUmLDVUywKhEUjCvC3FvFkrPmP9mQaS
         3WnIjnW9RNvuSA4c0B89WpdtaSdno6EfeyCOgf58DXyLIk3x3nrGKRjfe+fM+urIitbX
         RJR/RZbES9hvcH58CHDW/2Gm4naN8W19h8g1l3UeyNBY+zLsdB86NjTyHbwh28F9pdQk
         n18g==
X-Gm-Message-State: AOAM533yk5DhqKe5VUxKACPFpfdYMbJ+xF6RH4pc19ijHCe1bFE+Q6ao
	ACFGeKJsZwaljn9435lQpOhS6MZePa0BElP5Bj/VBQ==
X-Google-Smtp-Source: ABdhPJxaGebaSJ351Ihrk8da6il42G69QbnM1dqAnRG/9ROpjSlgOyKjj5kZDUABWmUk/p6bzR85/KpqOawWZLwOiqk=
X-Received: by 2002:a2e:8695:: with SMTP id l21mr989223lji.339.1634577546716;
 Mon, 18 Oct 2021 10:19:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <71154240.164.1634484805994@jenkins.jenkins>
In-Reply-To: <71154240.164.1634484805994@jenkins.jenkins>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 18 Oct 2021 10:18:55 -0700
Message-ID: <CAKwvOdmK0NUK5WCsaQWQwD1Drox3yRGjtLBtM_4vXcoftUHQkg@mail.gmail.com>
Subject: Re: [TCWG CI] Regression caused by llvm: [AArch64] Optimize add/sub
 with immediate
To: ci_notify@linaro.org
Cc: Ben Shi <powerman1st@163.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 17, 2021 at 8:33 AM <ci_notify@linaro.org> wrote:
>
> [TCWG CI] Regression caused by llvm: [AArch64] Optimize add/sub with immediate:
> commit 9bf6bef9951a1c230796ccad2c5c0195ce4c4dff
> Author: Ben Shi <powerman1st@163.com>
>
>     [AArch64] Optimize add/sub with immediate

Thanks for the report. Looks like it was reverted 2 days ago.

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
> 6333
> # First few build errors in logs:
> # 00:01:55 clang-14: error: unable to execute command: Aborted (core dumped)
> # 00:01:55 clang-14: error: clang frontend command failed due to signal (use -v to see invocation)
> # 00:01:56 make[2]: *** [scripts/Makefile.build:280: kernel/power/swap.o] Error 254
> # 00:02:02 make[1]: *** [scripts/Makefile.build:497: kernel/power] Error 2
> # 00:04:03 clang-14: error: unable to execute command: Segmentation fault (core dumped)
> # 00:04:03 clang-14: error: clang frontend command failed due to signal (use -v to see invocation)
> # 00:04:03 make[3]: *** [scripts/Makefile.build:280: drivers/pci/controller/pcie-rockchip-host.o] Error 254
> # 00:04:07 make[2]: *** [scripts/Makefile.build:497: drivers/pci/controller] Error 2
> # 00:05:13 make: *** [Makefile:1822: kernel] Error 2
> # 00:05:29 make[1]: *** [scripts/Makefile.build:497: drivers/pci] Error 2
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
> 7114
> # linux build successful:
> all
> # linux boot successful:
> boot
>
> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
>
> This commit has regressed these CI configurations:
>  - tcwg_kernel/llvm-master-aarch64-lts-defconfig
>
> First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-lts-defconfig/7/artifact/artifacts/build-9bf6bef9951a1c230796ccad2c5c0195ce4c4dff/
> Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-lts-defconfig/7/artifact/artifacts/build-f0711106dc6c14dcaf06437a0467043e983bf9dc/
> Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-lts-defconfig/7/artifact/artifacts/build-baseline/
> Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-lts-defconfig/7/artifact/artifacts/
>
> Reproduce builds:
> <cut>
> mkdir investigate-llvm-9bf6bef9951a1c230796ccad2c5c0195ce4c4dff
> cd investigate-llvm-9bf6bef9951a1c230796ccad2c5c0195ce4c4dff
>
> # Fetch scripts
> git clone https://git.linaro.org/toolchain/jenkins-scripts
>
> # Fetch manifests and test.sh script
> mkdir -p artifacts/manifests
> curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-lts-defconfig/7/artifact/artifacts/manifests/build-baseline.sh --fail
> curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-lts-defconfig/7/artifact/artifacts/manifests/build-parameters.sh --fail
> curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-lts-defconfig/7/artifact/artifacts/test.sh --fail
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
> git checkout --detach 9bf6bef9951a1c230796ccad2c5c0195ce4c4dff
> ../artifacts/test.sh
>
> # Reproduce last_good build
> git checkout --detach f0711106dc6c14dcaf06437a0467043e983bf9dc
> ../artifacts/test.sh
>
> cd ..
> </cut>
>
> Full commit (up to 1000 lines):
> <cut>
> commit 9bf6bef9951a1c230796ccad2c5c0195ce4c4dff
> Author: Ben Shi <powerman1st@163.com>
> Date:   Tue Oct 12 09:03:16 2021 +0000
>
>     [AArch64] Optimize add/sub with immediate
>
>     Optimize ([add|sub] r, imm) -> ([ADD|SUB] ([ADD|SUB] r, #imm0, lsl #12), #imm1),
>     if imm == (imm0<<12)+imm1. and both imm0 and imm1 are non-zero 12-bit unsigned
>     integers.
>
>     Optimize ([add|sub] r, imm) -> ([SUB|ADD] ([SUB|ADD] r, #imm0, lsl #12), #imm1),
>     if imm == -(imm0<<12)-imm1, and both imm0 and imm1 are non-zero 12-bit unsigned
>     integers.
>
>     Reviewed By: jaykang10, dmgreen
>
>     Differential Revision: https://reviews.llvm.org/D111034
> ---
>  llvm/lib/Target/AArch64/AArch64MIPeepholeOpt.cpp   | 188 ++++++++++++++++++---
>  llvm/test/CodeGen/AArch64/addsub.ll                |  96 +++++++----
>  .../CodeGenPrepare/AArch64/large-offset-gep.ll     |   5 +-
>  3 files changed, 229 insertions(+), 60 deletions(-)
>
> diff --git a/llvm/lib/Target/AArch64/AArch64MIPeepholeOpt.cpp b/llvm/lib/Target/AArch64/AArch64MIPeepholeOpt.cpp
> index d091c8fd6a03..9ff92e6a2201 100644
> --- a/llvm/lib/Target/AArch64/AArch64MIPeepholeOpt.cpp
> +++ b/llvm/lib/Target/AArch64/AArch64MIPeepholeOpt.cpp
> @@ -11,10 +11,17 @@
>  // 1. MOVi32imm + ANDWrr ==> ANDWri + ANDWri
>  //    MOVi64imm + ANDXrr ==> ANDXri + ANDXri
>  //
> +// 2. MOVi32imm + ADDWrr ==> ADDWRi + ADDWRi
> +//    MOVi64imm + ADDXrr ==> ANDXri + ANDXri
> +//
> +// 3. MOVi32imm + SUBWrr ==> SUBWRi + SUBWRi
> +//    MOVi64imm + SUBXrr ==> SUBXri + SUBXri
> +//
>  //    The mov pseudo instruction could be expanded to multiple mov instructions
>  //    later. In this case, we could try to split the constant  operand of mov
> -//    instruction into two bitmask immediates. It makes two AND instructions
> -//    intead of multiple `mov` + `and` instructions.
> +//    instruction into two immediates which can be directly encoded into
> +//    *Wri/*Xri instructions. It makes two AND/ADD/SUB instructions instead of
> +//    multiple `mov` + `and/add/sub` instructions.
>  //===----------------------------------------------------------------------===//
>
>  #include "AArch64ExpandImm.h"
> @@ -41,6 +48,13 @@ struct AArch64MIPeepholeOpt : public MachineFunctionPass {
>    MachineLoopInfo *MLI;
>    MachineRegisterInfo *MRI;
>
> +  bool checkMovImmInstr(MachineInstr &MI, MachineInstr *&MovMI,
> +                        MachineInstr *&SubregToRegMI);
> +
> +  template <typename T>
> +  bool visitADDSUB(MachineInstr &MI,
> +                   SmallSetVector<MachineInstr *, 8> &ToBeRemoved, bool IsAdd);
> +
>    template <typename T>
>    bool visitAND(MachineInstr &MI,
>                  SmallSetVector<MachineInstr *, 8> &ToBeRemoved);
> @@ -119,31 +133,9 @@ bool AArch64MIPeepholeOpt::visitAND(
>    assert((RegSize == 32 || RegSize == 64) &&
>           "Invalid RegSize for AND bitmask peephole optimization");
>
> -  // Check whether AND's MBB is in loop and the AND is loop invariant.
> -  MachineBasicBlock *MBB = MI.getParent();
> -  MachineLoop *L = MLI->getLoopFor(MBB);
> -  if (L && !L->isLoopInvariant(MI))
> -    return false;
> -
> -  // Check whether AND's operand is MOV with immediate.
> -  MachineInstr *MovMI = MRI->getUniqueVRegDef(MI.getOperand(2).getReg());
> -  MachineInstr *SubregToRegMI = nullptr;
> -  // If it is SUBREG_TO_REG, check its operand.
> -  if (MovMI->getOpcode() == TargetOpcode::SUBREG_TO_REG) {
> -    SubregToRegMI = MovMI;
> -    MovMI = MRI->getUniqueVRegDef(MovMI->getOperand(2).getReg());
> -  }
> -
> -  if (MovMI->getOpcode() != AArch64::MOVi32imm &&
> -      MovMI->getOpcode() != AArch64::MOVi64imm)
> -    return false;
> -
> -  // If the MOV has multiple uses, do not split the immediate because it causes
> -  // more instructions.
> -  if (!MRI->hasOneUse(MovMI->getOperand(0).getReg()))
> -    return false;
> -
> -  if (SubregToRegMI && !MRI->hasOneUse(SubregToRegMI->getOperand(0).getReg()))
> +  // Perform several essential checks against current MI.
> +  MachineInstr *MovMI, *SubregToRegMI;
> +  if (!checkMovImmInstr(MI, MovMI, SubregToRegMI))
>      return false;
>
>    // Split the bitmask immediate into two.
> @@ -160,6 +152,7 @@ bool AArch64MIPeepholeOpt::visitAND(
>
>    // Create new AND MIs.
>    DebugLoc DL = MI.getDebugLoc();
> +  MachineBasicBlock *MBB = MI.getParent();
>    const TargetRegisterClass *ANDImmRC =
>        (RegSize == 32) ? &AArch64::GPR32spRegClass : &AArch64::GPR64spRegClass;
>    Register DstReg = MI.getOperand(0).getReg();
> @@ -185,6 +178,135 @@ bool AArch64MIPeepholeOpt::visitAND(
>    return true;
>  }
>
> +template <typename T>
> +static bool splitAddSubImm(T Imm, unsigned RegSize, T &Imm0, T &Imm1) {
> +  // The immediate must be in the form of ((imm0 << 12) + imm1), in which both
> +  // imm0 and imm1 are non-zero 12-bit unsigned int.
> +  if ((Imm & 0xfff000) == 0 || (Imm & 0xfff) == 0 ||
> +      (Imm & ~static_cast<T>(0xffffff)) != 0)
> +    return false;
> +
> +  // The immediate can not be composed via a single instruction.
> +  SmallVector<AArch64_IMM::ImmInsnModel, 4> Insn;
> +  AArch64_IMM::expandMOVImm(Imm, RegSize, Insn);
> +  if (Insn.size() == 1)
> +    return false;
> +
> +  // Split Imm into (Imm0 << 12) + Imm1;
> +  Imm0 = (Imm >> 12) & 0xfff;
> +  Imm1 = Imm & 0xfff;
> +  return true;
> +}
> +
> +template <typename T>
> +bool AArch64MIPeepholeOpt::visitADDSUB(
> +    MachineInstr &MI, SmallSetVector<MachineInstr *, 8> &ToBeRemoved,
> +    bool IsAdd) {
> +  // Try below transformation.
> +  //
> +  // MOVi32imm + ADDWrr ==> ANDWri + ANDWri
> +  // MOVi64imm + ADDXrr ==> ANDXri + ANDXri
> +  //
> +  // MOVi32imm + SUBWrr ==> SUBWri + SUBWri
> +  // MOVi64imm + SUBXrr ==> SUBXri + SUBXri
> +  //
> +  // The mov pseudo instruction could be expanded to multiple mov instructions
> +  // later. Let's try to split the constant operand of mov instruction into two
> +  // legal add/sub immediates. It makes only two ADD/SUB instructions intead of
> +  // multiple `mov` + `and/sub` instructions.
> +
> +  unsigned RegSize = sizeof(T) * 8;
> +  assert((RegSize == 32 || RegSize == 64) &&
> +         "Invalid RegSize for legal add/sub immediate peephole optimization");
> +
> +  // Perform several essential checks against current MI.
> +  MachineInstr *MovMI, *SubregToRegMI;
> +  if (!checkMovImmInstr(MI, MovMI, SubregToRegMI))
> +    return false;
> +
> +  // Split the immediate to Imm0 and Imm1, and calculate the Opcode.
> +  T Imm = static_cast<T>(MovMI->getOperand(1).getImm()), Imm0, Imm1;
> +  unsigned Opcode;
> +  if (splitAddSubImm(Imm, RegSize, Imm0, Imm1)) {
> +    if (IsAdd)
> +      Opcode = RegSize == 32 ? AArch64::ADDWri : AArch64::ADDXri;
> +    else
> +      Opcode = RegSize == 32 ? AArch64::SUBWri : AArch64::SUBXri;
> +  } else if (splitAddSubImm(-Imm, RegSize, Imm0, Imm1)) {
> +    if (IsAdd)
> +      Opcode = RegSize == 32 ? AArch64::SUBWri : AArch64::SUBXri;
> +    else
> +      Opcode = RegSize == 32 ? AArch64::ADDWri : AArch64::ADDXri;
> +  } else {
> +    return false;
> +  }
> +
> +  // Create new ADD/SUB MIs.
> +  DebugLoc DL = MI.getDebugLoc();
> +  MachineBasicBlock *MBB = MI.getParent();
> +  const TargetRegisterClass *RC =
> +      (RegSize == 32) ? &AArch64::GPR32spRegClass : &AArch64::GPR64spRegClass;
> +  Register DstReg = MI.getOperand(0).getReg();
> +  Register SrcReg = MI.getOperand(1).getReg();
> +  Register TmpReg = MRI->createVirtualRegister(RC);
> +
> +  MRI->constrainRegClass(SrcReg, RC);
> +  BuildMI(*MBB, MI, DL, TII->get(Opcode), TmpReg)
> +      .addReg(SrcReg)
> +      .addImm(Imm0)
> +      .addImm(12);
> +
> +  MRI->constrainRegClass(DstReg, RC);
> +  BuildMI(*MBB, MI, DL, TII->get(Opcode), DstReg)
> +      .addReg(TmpReg)
> +      .addImm(Imm1)
> +      .addImm(0);
> +
> +  // Record the MIs need to be removed.
> +  ToBeRemoved.insert(&MI);
> +  if (SubregToRegMI)
> +    ToBeRemoved.insert(SubregToRegMI);
> +  ToBeRemoved.insert(MovMI);
> +
> +  return true;
> +}
> +
> +// Checks if the corresponding MOV immediate instruction is applicable for
> +// this peephole optimization.
> +bool AArch64MIPeepholeOpt::checkMovImmInstr(MachineInstr &MI,
> +                                            MachineInstr *&MovMI,
> +                                            MachineInstr *&SubregToRegMI) {
> +  // Check whether current MI is in loop and is loop invariant.
> +  MachineBasicBlock *MBB = MI.getParent();
> +  MachineLoop *L = MLI->getLoopFor(MBB);
> +  if (L && !L->isLoopInvariant(MI))
> +    return false;
> +
> +  // Check whether current MI's operand is MOV with immediate.
> +  MovMI = MRI->getUniqueVRegDef(MI.getOperand(2).getReg());
> +  SubregToRegMI = nullptr;
> +  // If it is SUBREG_TO_REG, check its operand.
> +  if (MovMI->getOpcode() == TargetOpcode::SUBREG_TO_REG) {
> +    SubregToRegMI = MovMI;
> +    MovMI = MRI->getUniqueVRegDef(MovMI->getOperand(2).getReg());
> +  }
> +
> +  if (MovMI->getOpcode() != AArch64::MOVi32imm &&
> +      MovMI->getOpcode() != AArch64::MOVi64imm)
> +    return false;
> +
> +  // If the MOV has multiple uses, do not split the immediate because it causes
> +  // more instructions.
> +  if (!MRI->hasOneUse(MovMI->getOperand(0).getReg()))
> +    return false;
> +
> +  if (SubregToRegMI && !MRI->hasOneUse(SubregToRegMI->getOperand(0).getReg()))
> +    return false;
> +
> +  // It is OK to perform this peephole optimization.
> +  return true;
> +}
> +
>  bool AArch64MIPeepholeOpt::runOnMachineFunction(MachineFunction &MF) {
>    if (skipFunction(MF.getFunction()))
>      return false;
> @@ -210,6 +332,18 @@ bool AArch64MIPeepholeOpt::runOnMachineFunction(MachineFunction &MF) {
>        case AArch64::ANDXrr:
>          Changed = visitAND<uint64_t>(MI, ToBeRemoved);
>          break;
> +      case AArch64::ADDWrr:
> +        Changed = visitADDSUB<uint32_t>(MI, ToBeRemoved, true);
> +        break;
> +      case AArch64::SUBWrr:
> +        Changed = visitADDSUB<uint32_t>(MI, ToBeRemoved, false);
> +        break;
> +      case AArch64::ADDXrr:
> +        Changed = visitADDSUB<uint64_t>(MI, ToBeRemoved, true);
> +        break;
> +      case AArch64::SUBXrr:
> +        Changed = visitADDSUB<uint64_t>(MI, ToBeRemoved, false);
> +        break;
>        }
>      }
>    }
> diff --git a/llvm/test/CodeGen/AArch64/addsub.ll b/llvm/test/CodeGen/AArch64/addsub.ll
> index f0857fe2d966..37c9e4c5c6fe 100644
> --- a/llvm/test/CodeGen/AArch64/addsub.ll
> +++ b/llvm/test/CodeGen/AArch64/addsub.ll
> @@ -152,9 +152,8 @@ define void @sub_med() {
>  define i64 @add_two_parts_imm_i64(i64 %a) {
>  ; CHECK-LABEL: add_two_parts_imm_i64:
>  ; CHECK:       // %bb.0:
> -; CHECK-NEXT:    mov w8, #42325
> -; CHECK-NEXT:    movk w8, #170, lsl #16
> -; CHECK-NEXT:    add x0, x0, x8
> +; CHECK-NEXT:    add x8, x0, #2730, lsl #12 // =11182080
> +; CHECK-NEXT:    add x0, x8, #1365
>  ; CHECK-NEXT:    ret
>    %b = add i64 %a, 11183445
>    ret i64 %b
> @@ -163,9 +162,8 @@ define i64 @add_two_parts_imm_i64(i64 %a) {
>  define i32 @add_two_parts_imm_i32(i32 %a) {
>  ; CHECK-LABEL: add_two_parts_imm_i32:
>  ; CHECK:       // %bb.0:
> -; CHECK-NEXT:    mov w8, #42325
> -; CHECK-NEXT:    movk w8, #170, lsl #16
> -; CHECK-NEXT:    add w0, w0, w8
> +; CHECK-NEXT:    add w8, w0, #2730, lsl #12 // =11182080
> +; CHECK-NEXT:    add w0, w8, #1365
>  ; CHECK-NEXT:    ret
>    %b = add i32 %a, 11183445
>    ret i32 %b
> @@ -174,9 +172,8 @@ define i32 @add_two_parts_imm_i32(i32 %a) {
>  define i64 @add_two_parts_imm_i64_neg(i64 %a) {
>  ; CHECK-LABEL: add_two_parts_imm_i64_neg:
>  ; CHECK:       // %bb.0:
> -; CHECK-NEXT:    mov x8, #-42325
> -; CHECK-NEXT:    movk x8, #65365, lsl #16
> -; CHECK-NEXT:    add x0, x0, x8
> +; CHECK-NEXT:    sub x8, x0, #2730, lsl #12 // =11182080
> +; CHECK-NEXT:    sub x0, x8, #1365
>  ; CHECK-NEXT:    ret
>    %b = add i64 %a, -11183445
>    ret i64 %b
> @@ -185,9 +182,8 @@ define i64 @add_two_parts_imm_i64_neg(i64 %a) {
>  define i32 @add_two_parts_imm_i32_neg(i32 %a) {
>  ; CHECK-LABEL: add_two_parts_imm_i32_neg:
>  ; CHECK:       // %bb.0:
> -; CHECK-NEXT:    mov w8, #23211
> -; CHECK-NEXT:    movk w8, #65365, lsl #16
> -; CHECK-NEXT:    add w0, w0, w8
> +; CHECK-NEXT:    sub w8, w0, #2730, lsl #12 // =11182080
> +; CHECK-NEXT:    sub w0, w8, #1365
>  ; CHECK-NEXT:    ret
>    %b = add i32 %a, -11183445
>    ret i32 %b
> @@ -196,9 +192,8 @@ define i32 @add_two_parts_imm_i32_neg(i32 %a) {
>  define i64 @sub_two_parts_imm_i64(i64 %a) {
>  ; CHECK-LABEL: sub_two_parts_imm_i64:
>  ; CHECK:       // %bb.0:
> -; CHECK-NEXT:    mov x8, #-42325
> -; CHECK-NEXT:    movk x8, #65365, lsl #16
> -; CHECK-NEXT:    add x0, x0, x8
> +; CHECK-NEXT:    sub x8, x0, #2730, lsl #12 // =11182080
> +; CHECK-NEXT:    sub x0, x8, #1365
>  ; CHECK-NEXT:    ret
>    %b = sub i64 %a, 11183445
>    ret i64 %b
> @@ -207,9 +202,8 @@ define i64 @sub_two_parts_imm_i64(i64 %a) {
>  define i32 @sub_two_parts_imm_i32(i32 %a) {
>  ; CHECK-LABEL: sub_two_parts_imm_i32:
>  ; CHECK:       // %bb.0:
> -; CHECK-NEXT:    mov w8, #23211
> -; CHECK-NEXT:    movk w8, #65365, lsl #16
> -; CHECK-NEXT:    add w0, w0, w8
> +; CHECK-NEXT:    sub w8, w0, #2730, lsl #12 // =11182080
> +; CHECK-NEXT:    sub w0, w8, #1365
>  ; CHECK-NEXT:    ret
>    %b = sub i32 %a, 11183445
>    ret i32 %b
> @@ -218,9 +212,8 @@ define i32 @sub_two_parts_imm_i32(i32 %a) {
>  define i64 @sub_two_parts_imm_i64_neg(i64 %a) {
>  ; CHECK-LABEL: sub_two_parts_imm_i64_neg:
>  ; CHECK:       // %bb.0:
> -; CHECK-NEXT:    mov w8, #42325
> -; CHECK-NEXT:    movk w8, #170, lsl #16
> -; CHECK-NEXT:    add x0, x0, x8
> +; CHECK-NEXT:    add x8, x0, #2730, lsl #12 // =11182080
> +; CHECK-NEXT:    add x0, x8, #1365
>  ; CHECK-NEXT:    ret
>    %b = sub i64 %a, -11183445
>    ret i64 %b
> @@ -229,14 +222,57 @@ define i64 @sub_two_parts_imm_i64_neg(i64 %a) {
>  define i32 @sub_two_parts_imm_i32_neg(i32 %a) {
>  ; CHECK-LABEL: sub_two_parts_imm_i32_neg:
>  ; CHECK:       // %bb.0:
> -; CHECK-NEXT:    mov w8, #42325
> -; CHECK-NEXT:    movk w8, #170, lsl #16
> -; CHECK-NEXT:    add w0, w0, w8
> +; CHECK-NEXT:    add w8, w0, #2730, lsl #12 // =11182080
> +; CHECK-NEXT:    add w0, w8, #1365
>  ; CHECK-NEXT:    ret
>    %b = sub i32 %a, -11183445
>    ret i32 %b
>  }
>
> +define i32 @add_27962026(i32 %a) {
> +; CHECK-LABEL: add_27962026:
> +; CHECK:       // %bb.0:
> +; CHECK-NEXT:    mov w8, #43690
> +; CHECK-NEXT:    movk w8, #426, lsl #16
> +; CHECK-NEXT:    add w0, w0, w8
> +; CHECK-NEXT:    ret
> +  %b = add i32 %a, 27962026
> +  ret i32 %b
> +}
> +
> +define i32 @add_65534(i32 %a) {
> +; CHECK-LABEL: add_65534:
> +; CHECK:       // %bb.0:
> +; CHECK-NEXT:    mov w8, #65534
> +; CHECK-NEXT:    add w0, w0, w8
> +; CHECK-NEXT:    ret
> +  %b = add i32 %a, 65534
> +  ret i32 %b
> +}
> +
> +declare i32 @foox(i32)
> +
> +define void @add_in_loop(i32 %0) {
> +; CHECK-LABEL: add_in_loop:
> +; CHECK:       // %bb.0:
> +; CHECK-NEXT:    stp x30, x19, [sp, #-16]! // 16-byte Folded Spill
> +; CHECK-NEXT:    .cfi_def_cfa_offset 16
> +; CHECK-NEXT:    .cfi_offset w19, -8
> +; CHECK-NEXT:    .cfi_offset w30, -16
> +; CHECK-NEXT:    mov w19, #43690
> +; CHECK-NEXT:    movk w19, #170, lsl #16
> +; CHECK-NEXT:  .LBB15_1: // =>This Inner Loop Header: Depth=1
> +; CHECK-NEXT:    add w0, w0, w19
> +; CHECK-NEXT:    bl foox
> +; CHECK-NEXT:    b .LBB15_1
> +  br label %2
> +2:
> +  %3 = phi i32 [ %0, %1 ], [ %5, %2 ]
> +  %4 = add nsw i32 %3, 11184810
> +  %5 = tail call i32 @foox(i32 %4) #2
> +  br label %2
> +}
> +
>  define void @testing() {
>  ; CHECK-LABEL: testing:
>  ; CHECK:       // %bb.0:
> @@ -244,7 +280,7 @@ define void @testing() {
>  ; CHECK-NEXT:    ldr x8, [x8, :got_lo12:var_i32]
>  ; CHECK-NEXT:    ldr w9, [x8]
>  ; CHECK-NEXT:    cmp w9, #4095
> -; CHECK-NEXT:    b.ne .LBB13_6
> +; CHECK-NEXT:    b.ne .LBB16_6
>  ; CHECK-NEXT:  // %bb.1: // %test2
>  ; CHECK-NEXT:    adrp x10, :got:var2_i32
>  ; CHECK-NEXT:    add w11, w9, #1
> @@ -252,26 +288,26 @@ define void @testing() {
>  ; CHECK-NEXT:    str w11, [x8]
>  ; CHECK-NEXT:    ldr w10, [x10]
>  ; CHECK-NEXT:    cmp w10, #3567, lsl #12 // =14610432
> -; CHECK-NEXT:    b.lo .LBB13_6
> +; CHECK-NEXT:    b.lo .LBB16_6
>  ; CHECK-NEXT:  // %bb.2: // %test3
>  ; CHECK-NEXT:    add w11, w9, #2
>  ; CHECK-NEXT:    cmp w9, #123
>  ; CHECK-NEXT:    str w11, [x8]
> -; CHECK-NEXT:    b.lt .LBB13_6
> +; CHECK-NEXT:    b.lt .LBB16_6
>  ; CHECK-NEXT:  // %bb.3: // %test4
>  ; CHECK-NEXT:    add w11, w9, #3
>  ; CHECK-NEXT:    cmp w10, #321
>  ; CHECK-NEXT:    str w11, [x8]
> -; CHECK-NEXT:    b.gt .LBB13_6
> +; CHECK-NEXT:    b.gt .LBB16_6
>  ; CHECK-NEXT:  // %bb.4: // %test5
>  ; CHECK-NEXT:    add w11, w9, #4
>  ; CHECK-NEXT:    cmn w10, #443
>  ; CHECK-NEXT:    str w11, [x8]
> -; CHECK-NEXT:    b.ge .LBB13_6
> +; CHECK-NEXT:    b.ge .LBB16_6
>  ; CHECK-NEXT:  // %bb.5: // %test6
>  ; CHECK-NEXT:    add w9, w9, #5
>  ; CHECK-NEXT:    str w9, [x8]
> -; CHECK-NEXT:  .LBB13_6: // %common.ret
> +; CHECK-NEXT:  .LBB16_6: // %common.ret
>  ; CHECK-NEXT:    ret
>    %val = load i32, i32* @var_i32
>    %val2 = load i32, i32* @var2_i32
> diff --git a/llvm/test/Transforms/CodeGenPrepare/AArch64/large-offset-gep.ll b/llvm/test/Transforms/CodeGenPrepare/AArch64/large-offset-gep.ll
> index 1c587080f4b6..97e877211b12 100644
> --- a/llvm/test/Transforms/CodeGenPrepare/AArch64/large-offset-gep.ll
> +++ b/llvm/test/Transforms/CodeGenPrepare/AArch64/large-offset-gep.ll
> @@ -214,10 +214,9 @@ define void @test5([65536 x i32]** %s, i32 %n) {
>  ; CHECK-LABEL: test5:
>  ; CHECK:       // %bb.0: // %entry
>  ; CHECK-NEXT:    ldr x9, [x0]
> -; CHECK-NEXT:    mov w10, #14464
> -; CHECK-NEXT:    movk w10, #1, lsl #16
>  ; CHECK-NEXT:    mov w8, wzr
> -; CHECK-NEXT:    add x9, x9, x10
> +; CHECK-NEXT:    add x9, x9, #19, lsl #12 // =77824
> +; CHECK-NEXT:    add x9, x9, #2176
>  ; CHECK-NEXT:    cmp w8, w1
>  ; CHECK-NEXT:    b.ge .LBB4_2
>  ; CHECK-NEXT:  .LBB4_1: // %while_body
> </cut>



-- 
Thanks,
~Nick Desaulniers
