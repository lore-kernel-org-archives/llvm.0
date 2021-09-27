Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39673FCB
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 12:56:19 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id u18so75639113lfd.12
        for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 05:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Ry0/96eS9NXH3YbAO3wRmu8Ui92c/gaK7GzZ2t/erWU=;
        b=ndE52r9FJ3myYTc5/vGfCsKLNqpxJWACn3doRb2/TYLTTX2Pfw5QWS9KP7k9YLp2Bq
         yec1/fDKDpX4H9RGQYC9v6D28GJUdG6G69Tvh/ipNJrbBTm76SbBFokDYqH8HmmA14Xi
         B9tObwxCk/0oy5nLMBWIYh6FTMv/9Ur4AOzr4gRyMKyka82gUCE/skyGXkrIpK/Vrbpo
         y1EuhVbj5/TLJmzrrzhPa0TgERK3qhE+Lt8x0I0oZ346XoLVGkl8AnjE3/tnVdHnfCEY
         DniOEdbsPcHcXRELUZ17Lk54CC97hwONKZj/ronsebILior2ArDRc3Tj4PdFA+kMcXAL
         FZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Ry0/96eS9NXH3YbAO3wRmu8Ui92c/gaK7GzZ2t/erWU=;
        b=WhzqnfqPaqG2lQ/wF+G7x7UZhtd3gS3BjPh9bAN0M1g0j6kapfy+aWtrBcuv9E2YkG
         yFAZ7hj9z0sJbj+n/biIdxfUjFlp+RWSqoU2y1U49U5Ks7PmDE99+KGyBUVomq0dZX7L
         pz+d+vK97ios45vcSaWCL161Mnz7evTrSUFDDS8sqGW1l4IaFSr4Gst4qXeJymfJzPc0
         YPqMvtZIJsn+0oaeywamfIfM44EQrteQhrBtGrLzrmVAme9F9eb5h1G8ee2mxOVH4Qe2
         awXZCqTuncpkxdEiiz9q00wLTA0t3soBrCjZ8ugPQmzyZ7/Jqm9dlsrmvgryjUBDYh7F
         yKyQ==
X-Gm-Message-State: AOAM532WYKhi6SqXd+Wb38yKpyV3+e3EdKhLqyFmh/qSFqWGQ4cyKgjs
	cXIJgCMKRHAa5rI+d5isfLRloX2HEb+5
X-Google-Smtp-Source: ABdhPJyB0xOXqsJ8O/i+LteM76czmXS6P+hFjTdDEZlqLSkpc8Rgpv1gMg4qRgeGRPCafUCTJbvdOw==
X-Received: by 2002:a2e:bf1f:: with SMTP id c31mr28600366ljr.393.1632747377228;
        Mon, 27 Sep 2021 05:56:17 -0700 (PDT)
Received: from [192.168.0.218] ([185.30.228.145])
        by smtp.gmail.com with ESMTPSA id e28sm2126800ljo.63.2021.09.27.05.56.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Sep 2021 05:56:16 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [TCWG CI] Regression caused by llvm: Revert "Allow
 rematerialization of virtual reg uses"
From: Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
In-Reply-To: <705727008.5905.1632705101168@localhost>
Date: Mon, 27 Sep 2021 15:56:16 +0300
Cc: linaro-toolchain <linaro-toolchain@lists.linaro.org>,
 llvm@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <628C706D-4458-43AD-AE87-045AF8CB78D2@linaro.org>
References: <705727008.5905.1632705101168@localhost>
To: Stanislav Mekhanoshin <Stanislav.Mekhanoshin@amd.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)

Hi Stanislav,

The revert of your patch made LLVM compile one less object file in the =
linux kernel.  Presumably, this is due to warning re-appearing after the =
revert.  No need to investigate, imo.

Regards,

--
Maxim Kuvyrkov
https://www.linaro.org

> On 27 Sep 2021, at 04:11, ci_notify@linaro.org wrote:
>=20
> [TCWG CI] Regression caused by llvm: Revert "Allow rematerialization =
of virtual reg uses":
> commit 08d7eec06e8cf5c15a96ce11f311f1480291a441
> Author: Stanislav Mekhanoshin <Stanislav.Mekhanoshin@amd.com>
>=20
>    Revert "Allow rematerialization of virtual reg uses"
>=20
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
> 21880
> # First few build errors in logs:
> # 00:04:00 arch/arm/lib/xor-neon.c:30:2: error: This code requires at =
least version 4.6 of GCC [-Werror,-W#warnings]
> # 00:04:00 make[1]: *** [scripts/Makefile.build:277: =
arch/arm/lib/xor-neon.o] Error 1
> # 00:04:00 make: *** [Makefile:1868: arch/arm/lib] Error 2
> # 00:05:21 crypto/wp512.c:782:13: error: stack frame size (1176) =
exceeds limit (1024) in function 'wp512_process_buffer' =
[-Werror,-Wframe-larger-than]
> # 00:05:21 make[1]: *** [scripts/Makefile.build:277: crypto/wp512.o] =
Error 1
> # 00:08:06 make: *** [Makefile:1868: crypto] Error 2
> # 00:18:48 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: =
stack frame size (1032) exceeds limit (1024) in function '__igt_reserve' =
[-Werror,-Wframe-larger-than]
> # 00:18:49 make[4]: *** [scripts/Makefile.build:277: =
drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
> # 00:19:07 make[3]: *** [scripts/Makefile.build:540: =
drivers/gpu/drm/selftests] Error 2
> # 00:30:18 drivers/firmware/tegra/bpmp-debugfs.c:357:16: error: stack =
frame size (1248) exceeds limit (1024) in function 'bpmp_debug_store' =
[-Werror,-Wframe-larger-than]
>=20
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
> 21881
>=20
> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, =
REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
>=20
> This commit has regressed these CI configurations:
> - tcwg_kernel/llvm-master-arm-mainline-allmodconfig
>=20
> First_bad build: =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-mainline=
-allmodconfig/14/artifact/artifacts/build-08d7eec06e8cf5c15a96ce11f311f148=
0291a441/
> Last_good build: =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-mainline=
-allmodconfig/14/artifact/artifacts/build-e8e2edd8ca88f8b0a7dba141349b2aa8=
3284f3af/
> Baseline build: =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-mainline=
-allmodconfig/14/artifact/artifacts/build-baseline/
> Even more details: =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-mainline=
-allmodconfig/14/artifact/artifacts/
>=20
> Reproduce builds:
> <cut>
> mkdir investigate-llvm-08d7eec06e8cf5c15a96ce11f311f1480291a441
> cd investigate-llvm-08d7eec06e8cf5c15a96ce11f311f1480291a441
>=20
> # Fetch scripts
> git clone https://git.linaro.org/toolchain/jenkins-scripts
>=20
> # Fetch manifests and test.sh script
> mkdir -p artifacts/manifests
> curl -o artifacts/manifests/build-baseline.sh =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-mainline=
-allmodconfig/14/artifact/artifacts/manifests/build-baseline.sh --fail
> curl -o artifacts/manifests/build-parameters.sh =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-mainline=
-allmodconfig/14/artifact/artifacts/manifests/build-parameters.sh --fail
> curl -o artifacts/test.sh =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-mainline=
-allmodconfig/14/artifact/artifacts/test.sh --fail
> chmod +x artifacts/test.sh
>=20
> # Reproduce the baseline build (build all pre-requisites)
> ./jenkins-scripts/tcwg_kernel-build.sh @@ =
artifacts/manifests/build-baseline.sh
>=20
> # Save baseline build state (which is then restored in =
artifacts/test.sh)
> mkdir -p ./bisect
> rsync -a --del --delete-excluded --exclude /bisect/ --exclude =
/artifacts/ --exclude /llvm/ ./ ./bisect/baseline/
>=20
> cd llvm
>=20
> # Reproduce first_bad build
> git checkout --detach 08d7eec06e8cf5c15a96ce11f311f1480291a441
> ../artifacts/test.sh
>=20
> # Reproduce last_good build
> git checkout --detach e8e2edd8ca88f8b0a7dba141349b2aa83284f3af
> ../artifacts/test.sh
>=20
> cd ..
> </cut>
>=20
> Full commit (up to 1000 lines):
> <cut>
> commit 08d7eec06e8cf5c15a96ce11f311f1480291a441
> Author: Stanislav Mekhanoshin <Stanislav.Mekhanoshin@amd.com>
> Date:   Fri Sep 24 09:53:51 2021 -0700
>=20
>    Revert "Allow rematerialization of virtual reg uses"
>=20
>    Reverted due to two distcint performance regression reports.
>=20
>    This reverts commit 92c1fd19abb15bc68b1127a26137a69e033cdb39.
> ---
> llvm/include/llvm/CodeGen/TargetInstrInfo.h        |   12 +-
> llvm/lib/CodeGen/TargetInstrInfo.cpp               |    9 +-
> llvm/test/CodeGen/AMDGPU/remat-sop.mir             |   60 -
> llvm/test/CodeGen/ARM/arm-shrink-wrapping-linux.ll |   28 +-
> llvm/test/CodeGen/ARM/funnel-shift-rot.ll          |   32 +-
> llvm/test/CodeGen/ARM/funnel-shift.ll              |   30 +-
> .../test/CodeGen/ARM/illegal-bitfield-loadstore.ll |   30 +-
> llvm/test/CodeGen/ARM/neon-copy.ll                 |   10 +-
> llvm/test/CodeGen/Mips/llvm-ir/ashr.ll             |  227 +-
> llvm/test/CodeGen/Mips/llvm-ir/lshr.ll             |  206 +-
> llvm/test/CodeGen/Mips/llvm-ir/shl.ll              |   95 +-
> llvm/test/CodeGen/Mips/llvm-ir/sub.ll              |   31 +-
> llvm/test/CodeGen/Mips/tls.ll                      |    4 +-
> llvm/test/CodeGen/RISCV/atomic-rmw.ll              |  120 +-
> llvm/test/CodeGen/RISCV/atomic-signext.ll          |   24 +-
> llvm/test/CodeGen/RISCV/bswap-ctlz-cttz-ctpop.ll   |   96 +-
> llvm/test/CodeGen/RISCV/mul.ll                     |   72 +-
> llvm/test/CodeGen/RISCV/rv32i-rv64i-half.ll        |   12 +-
> llvm/test/CodeGen/RISCV/rv32zbb-zbp.ll             |  270 +-
> llvm/test/CodeGen/RISCV/rv32zbb.ll                 |   94 +-
> llvm/test/CodeGen/RISCV/rv32zbp.ll                 |  262 +-
> llvm/test/CodeGen/RISCV/rv32zbt.ll                 |  206 +-
> .../CodeGen/RISCV/rvv/fixed-vectors-bitreverse.ll  |  150 +-
> llvm/test/CodeGen/RISCV/rvv/fixed-vectors-bswap.ll |  146 +-
> llvm/test/CodeGen/RISCV/rvv/fixed-vectors-ctlz.ll  | 3584 =
++++++++++----------
> llvm/test/CodeGen/RISCV/rvv/fixed-vectors-cttz.ll  |  664 ++--
> llvm/test/CodeGen/RISCV/shifts.ll                  |  308 +-
> llvm/test/CodeGen/RISCV/srem-vector-lkk.ll         |  208 +-
> llvm/test/CodeGen/RISCV/urem-vector-lkk.ll         |  190 +-
> llvm/test/CodeGen/Thumb/dyn-stackalloc.ll          |    7 +-
> .../tail-pred-disabled-in-loloops.ll               |   14 +-
> .../LowOverheadLoops/varying-outer-2d-reduction.ll |   64 +-
> .../CodeGen/Thumb2/LowOverheadLoops/while-loops.ll |   67 +-
> llvm/test/CodeGen/Thumb2/ldr-str-imm12.ll          |   30 +-
> llvm/test/CodeGen/Thumb2/mve-float16regloops.ll    |   82 +-
> llvm/test/CodeGen/Thumb2/mve-float32regloops.ll    |   98 +-
> llvm/test/CodeGen/Thumb2/mve-postinc-dct.ll        |  529 +--
> llvm/test/CodeGen/X86/addcarry.ll                  |   20 +-
> llvm/test/CodeGen/X86/callbr-asm-blockplacement.ll |   12 +-
> llvm/test/CodeGen/X86/dag-update-nodetomatch.ll    |   17 +-
> .../X86/delete-dead-instrs-with-live-uses.mir      |    4 +-
> llvm/test/CodeGen/X86/inalloca-invoke.ll           |    2 +-
> llvm/test/CodeGen/X86/licm-regpressure.ll          |   28 +-
> llvm/test/CodeGen/X86/ragreedy-hoist-spill.ll      |   40 +-
> llvm/test/CodeGen/X86/sdiv_fix.ll                  |    5 +-
> 45 files changed, 4093 insertions(+), 4106 deletions(-)
>=20
> diff --git a/llvm/include/llvm/CodeGen/TargetInstrInfo.h =
b/llvm/include/llvm/CodeGen/TargetInstrInfo.h
> index a0c52e2f1a13..c394ac910be1 100644
> --- a/llvm/include/llvm/CodeGen/TargetInstrInfo.h
> +++ b/llvm/include/llvm/CodeGen/TargetInstrInfo.h
> @@ -117,11 +117,10 @@ public:
>                                          const MachineFunction &MF) =
const;
>=20
>   /// Return true if the instruction is trivially rematerializable, =
meaning it
> -  /// has no side effects. Uses of constants and unallocatable =
physical
> -  /// registers are always trivial to rematerialize so that the =
instructions
> -  /// result is independent of the place in the function. Uses of =
virtual
> -  /// registers are allowed but it is caller's responsility to ensure =
these
> -  /// operands are valid at the point the instruction is beeing =
moved.
> +  /// has no side effects and requires no operands that aren't always =
available.
> +  /// This means the only allowed uses are constants and =
unallocatable physical
> +  /// registers so that the instructions result is independent of the =
place
> +  /// in the function.
>   bool isTriviallyReMaterializable(const MachineInstr &MI,
>                                    AAResults *AA =3D nullptr) const {
>     return MI.getOpcode() =3D=3D TargetOpcode::IMPLICIT_DEF ||
> @@ -141,7 +140,8 @@ protected:
>   /// set, this hook lets the target specify whether the instruction =
is actually
>   /// trivially rematerializable, taking into consideration its =
operands. This
>   /// predicate must return false if the instruction has any side =
effects other
> -  /// than producing a value.
> +  /// than producing a value, or if it requres any address registers =
that are
> +  /// not always available.
>   /// Requirements must be check as stated in =
isTriviallyReMaterializable() .
>   virtual bool isReallyTriviallyReMaterializable(const MachineInstr =
&MI,
>                                                  AAResults *AA) const =
{
> diff --git a/llvm/lib/CodeGen/TargetInstrInfo.cpp =
b/llvm/lib/CodeGen/TargetInstrInfo.cpp
> index fe7d60e0b7e2..1eab8e7443a7 100644
> --- a/llvm/lib/CodeGen/TargetInstrInfo.cpp
> +++ b/llvm/lib/CodeGen/TargetInstrInfo.cpp
> @@ -921,8 +921,7 @@ bool =
TargetInstrInfo::isReallyTriviallyReMaterializableGeneric(
>   const MachineRegisterInfo &MRI =3D MF.getRegInfo();
>=20
>   // Remat clients assume operand 0 is the defined register.
> -  if (!MI.getNumOperands() || !MI.getOperand(0).isReg() ||
> -      MI.getOperand(0).isTied())
> +  if (!MI.getNumOperands() || !MI.getOperand(0).isReg())
>     return false;
>   Register DefReg =3D MI.getOperand(0).getReg();
>=20
> @@ -984,6 +983,12 @@ bool =
TargetInstrInfo::isReallyTriviallyReMaterializableGeneric(
>     // same virtual register, though.
>     if (MO.isDef() && Reg !=3D DefReg)
>       return false;
> +
> +    // Don't allow any virtual-register uses. Rematting an =
instruction with
> +    // virtual register uses would length the live ranges of the =
uses, which
> +    // is not necessarily a good idea, certainly not "trivial".
> +    if (MO.isUse())
> +      return false;
>   }
>=20
>   // Everything checked out.
> diff --git a/llvm/test/CodeGen/AMDGPU/remat-sop.mir =
b/llvm/test/CodeGen/AMDGPU/remat-sop.mir
> index c9915aaabfde..ed799bfca028 100644
> --- a/llvm/test/CodeGen/AMDGPU/remat-sop.mir
> +++ b/llvm/test/CodeGen/AMDGPU/remat-sop.mir
> @@ -51,66 +51,6 @@ body:             |
>     S_NOP 0, implicit %2
>     S_ENDPGM 0
> ...
> -# The liverange of %0 covers a point of rematerialization, source =
value is
> -# availabe.
> ----
> -name:            test_remat_s_mov_b32_vreg_src_long_lr
> -tracksRegLiveness: true
> -machineFunctionInfo:
> -  stackPtrOffsetReg:  $sgpr32
> -body:             |
> -  bb.0:
> -    ; GCN-LABEL: name: test_remat_s_mov_b32_vreg_src_long_lr
> -    ; GCN: renamable $sgpr0 =3D IMPLICIT_DEF
> -    ; GCN: renamable $sgpr1 =3D S_MOV_B32 renamable $sgpr0
> -    ; GCN: S_NOP 0, implicit killed renamable $sgpr1
> -    ; GCN: renamable $sgpr1 =3D S_MOV_B32 renamable $sgpr0
> -    ; GCN: S_NOP 0, implicit killed renamable $sgpr1
> -    ; GCN: renamable $sgpr1 =3D S_MOV_B32 renamable $sgpr0
> -    ; GCN: S_NOP 0, implicit killed renamable $sgpr1
> -    ; GCN: S_NOP 0, implicit killed renamable $sgpr0
> -    ; GCN: S_ENDPGM 0
> -    %0:sreg_32 =3D IMPLICIT_DEF
> -    %1:sreg_32 =3D S_MOV_B32 %0:sreg_32
> -    %2:sreg_32 =3D S_MOV_B32 %0:sreg_32
> -    %3:sreg_32 =3D S_MOV_B32 %0:sreg_32
> -    S_NOP 0, implicit %1
> -    S_NOP 0, implicit %2
> -    S_NOP 0, implicit %3
> -    S_NOP 0, implicit %0
> -    S_ENDPGM 0
> -...
> -# The liverange of %0 does not cover a point of rematerialization, =
source value is
> -# unavailabe and we do not want to artificially extend the liverange.
> ----
> -name:            test_no_remat_s_mov_b32_vreg_src_short_lr
> -tracksRegLiveness: true
> -machineFunctionInfo:
> -  stackPtrOffsetReg:  $sgpr32
> -body:             |
> -  bb.0:
> -    ; GCN-LABEL: name: test_no_remat_s_mov_b32_vreg_src_short_lr
> -    ; GCN: renamable $sgpr0 =3D IMPLICIT_DEF
> -    ; GCN: renamable $sgpr1 =3D S_MOV_B32 renamable $sgpr0
> -    ; GCN: SI_SPILL_S32_SAVE killed renamable $sgpr1, %stack.1, =
implicit $exec, implicit $sgpr32 :: (store (s32) into %stack.1, =
addrspace 5)
> -    ; GCN: renamable $sgpr1 =3D S_MOV_B32 renamable $sgpr0
> -    ; GCN: SI_SPILL_S32_SAVE killed renamable $sgpr1, %stack.0, =
implicit $exec, implicit $sgpr32 :: (store (s32) into %stack.0, =
addrspace 5)
> -    ; GCN: renamable $sgpr0 =3D S_MOV_B32 killed renamable $sgpr0
> -    ; GCN: renamable $sgpr1 =3D SI_SPILL_S32_RESTORE %stack.1, =
implicit $exec, implicit $sgpr32 :: (load (s32) from %stack.1, addrspace =
5)
> -    ; GCN: S_NOP 0, implicit killed renamable $sgpr1
> -    ; GCN: renamable $sgpr1 =3D SI_SPILL_S32_RESTORE %stack.0, =
implicit $exec, implicit $sgpr32 :: (load (s32) from %stack.0, addrspace =
5)
> -    ; GCN: S_NOP 0, implicit killed renamable $sgpr1
> -    ; GCN: S_NOP 0, implicit killed renamable $sgpr0
> -    ; GCN: S_ENDPGM 0
> -    %0:sreg_32 =3D IMPLICIT_DEF
> -    %1:sreg_32 =3D S_MOV_B32 %0:sreg_32
> -    %2:sreg_32 =3D S_MOV_B32 %0:sreg_32
> -    %3:sreg_32 =3D S_MOV_B32 %0:sreg_32
> -    S_NOP 0, implicit %1
> -    S_NOP 0, implicit %2
> -    S_NOP 0, implicit %3
> -    S_ENDPGM 0
> -...
> ---
> name:            test_remat_s_mov_b64
> tracksRegLiveness: true
> diff --git a/llvm/test/CodeGen/ARM/arm-shrink-wrapping-linux.ll =
b/llvm/test/CodeGen/ARM/arm-shrink-wrapping-linux.ll
> index 175a2069a441..a4243276c70a 100644
> --- a/llvm/test/CodeGen/ARM/arm-shrink-wrapping-linux.ll
> +++ b/llvm/test/CodeGen/ARM/arm-shrink-wrapping-linux.ll
> @@ -29,20 +29,20 @@ define fastcc i8* @wrongUseOfPostDominate(i8* =
readonly %s, i32 %off, i8* readnon
> ; ENABLE-NEXT:    pophs {r11, pc}
> ; ENABLE-NEXT:  .LBB0_3: @ %while.body.preheader
> ; ENABLE-NEXT:    movw r12, :lower16:skip
> -; ENABLE-NEXT:    sub r3, r1, #1
> +; ENABLE-NEXT:    sub r1, r1, #1
> ; ENABLE-NEXT:    movt r12, :upper16:skip
> ; ENABLE-NEXT:  .LBB0_4: @ %while.body
> ; ENABLE-NEXT:    @ =3D>This Inner Loop Header: Depth=3D1
> -; ENABLE-NEXT:    ldrb r1, [r0]
> -; ENABLE-NEXT:    ldrb r1, [r12, r1]
> -; ENABLE-NEXT:    add r0, r0, r1
> -; ENABLE-NEXT:    sub r1, r3, #1
> -; ENABLE-NEXT:    cmp r1, r3
> +; ENABLE-NEXT:    ldrb r3, [r0]
> +; ENABLE-NEXT:    ldrb r3, [r12, r3]
> +; ENABLE-NEXT:    add r0, r0, r3
> +; ENABLE-NEXT:    sub r3, r1, #1
> +; ENABLE-NEXT:    cmp r3, r1
> ; ENABLE-NEXT:    bhs .LBB0_6
> ; ENABLE-NEXT:  @ %bb.5: @ %while.body
> ; ENABLE-NEXT:    @ in Loop: Header=3DBB0_4 Depth=3D1
> ; ENABLE-NEXT:    cmp r0, r2
> -; ENABLE-NEXT:    mov r3, r1
> +; ENABLE-NEXT:    mov r1, r3
> ; ENABLE-NEXT:    blo .LBB0_4
> ; ENABLE-NEXT:  .LBB0_6: @ %if.end29
> ; ENABLE-NEXT:    pop {r11, pc}
> @@ -119,20 +119,20 @@ define fastcc i8* @wrongUseOfPostDominate(i8* =
readonly %s, i32 %off, i8* readnon
> ; DISABLE-NEXT:    pophs {r11, pc}
> ; DISABLE-NEXT:  .LBB0_3: @ %while.body.preheader
> ; DISABLE-NEXT:    movw r12, :lower16:skip
> -; DISABLE-NEXT:    sub r3, r1, #1
> +; DISABLE-NEXT:    sub r1, r1, #1
> ; DISABLE-NEXT:    movt r12, :upper16:skip
> ; DISABLE-NEXT:  .LBB0_4: @ %while.body
> ; DISABLE-NEXT:    @ =3D>This Inner Loop Header: Depth=3D1
> -; DISABLE-NEXT:    ldrb r1, [r0]
> -; DISABLE-NEXT:    ldrb r1, [r12, r1]
> -; DISABLE-NEXT:    add r0, r0, r1
> -; DISABLE-NEXT:    sub r1, r3, #1
> -; DISABLE-NEXT:    cmp r1, r3
> +; DISABLE-NEXT:    ldrb r3, [r0]
> +; DISABLE-NEXT:    ldrb r3, [r12, r3]
> +; DISABLE-NEXT:    add r0, r0, r3
> +; DISABLE-NEXT:    sub r3, r1, #1
> +; DISABLE-NEXT:    cmp r3, r1
> ; DISABLE-NEXT:    bhs .LBB0_6
> ; DISABLE-NEXT:  @ %bb.5: @ %while.body
> ; DISABLE-NEXT:    @ in Loop: Header=3DBB0_4 Depth=3D1
> ; DISABLE-NEXT:    cmp r0, r2
> -; DISABLE-NEXT:    mov r3, r1
> +; DISABLE-NEXT:    mov r1, r3
> ; DISABLE-NEXT:    blo .LBB0_4
> ; DISABLE-NEXT:  .LBB0_6: @ %if.end29
> ; DISABLE-NEXT:    pop {r11, pc}
> diff --git a/llvm/test/CodeGen/ARM/funnel-shift-rot.ll =
b/llvm/test/CodeGen/ARM/funnel-shift-rot.ll
> index ea15fcc5c824..55157875d355 100644
> --- a/llvm/test/CodeGen/ARM/funnel-shift-rot.ll
> +++ b/llvm/test/CodeGen/ARM/funnel-shift-rot.ll
> @@ -73,13 +73,13 @@ define i64 @rotl_i64(i64 %x, i64 %z) {
> ; SCALAR-NEXT:    push {r4, r5, r11, lr}
> ; SCALAR-NEXT:    rsb r3, r2, #0
> ; SCALAR-NEXT:    and r4, r2, #63
> -; SCALAR-NEXT:    and r12, r3, #63
> -; SCALAR-NEXT:    rsb r3, r12, #32
> +; SCALAR-NEXT:    and lr, r3, #63
> +; SCALAR-NEXT:    rsb r3, lr, #32
> ; SCALAR-NEXT:    lsl r2, r0, r4
> -; SCALAR-NEXT:    lsr lr, r0, r12
> -; SCALAR-NEXT:    orr r3, lr, r1, lsl r3
> -; SCALAR-NEXT:    subs lr, r12, #32
> -; SCALAR-NEXT:    lsrpl r3, r1, lr
> +; SCALAR-NEXT:    lsr r12, r0, lr
> +; SCALAR-NEXT:    orr r3, r12, r1, lsl r3
> +; SCALAR-NEXT:    subs r12, lr, #32
> +; SCALAR-NEXT:    lsrpl r3, r1, r12
> ; SCALAR-NEXT:    subs r5, r4, #32
> ; SCALAR-NEXT:    movwpl r2, #0
> ; SCALAR-NEXT:    cmp r5, #0
> @@ -88,8 +88,8 @@ define i64 @rotl_i64(i64 %x, i64 %z) {
> ; SCALAR-NEXT:    lsr r3, r0, r3
> ; SCALAR-NEXT:    orr r3, r3, r1, lsl r4
> ; SCALAR-NEXT:    lslpl r3, r0, r5
> -; SCALAR-NEXT:    lsr r0, r1, r12
> -; SCALAR-NEXT:    cmp lr, #0
> +; SCALAR-NEXT:    lsr r0, r1, lr
> +; SCALAR-NEXT:    cmp r12, #0
> ; SCALAR-NEXT:    movwpl r0, #0
> ; SCALAR-NEXT:    orr r1, r3, r0
> ; SCALAR-NEXT:    mov r0, r2
> @@ -245,15 +245,15 @@ define i64 @rotr_i64(i64 %x, i64 %z) {
> ; CHECK:       @ %bb.0:
> ; CHECK-NEXT:    .save {r4, r5, r11, lr}
> ; CHECK-NEXT:    push {r4, r5, r11, lr}
> -; CHECK-NEXT:    and r12, r2, #63
> +; CHECK-NEXT:    and lr, r2, #63
> ; CHECK-NEXT:    rsb r2, r2, #0
> -; CHECK-NEXT:    rsb r3, r12, #32
> +; CHECK-NEXT:    rsb r3, lr, #32
> ; CHECK-NEXT:    and r4, r2, #63
> -; CHECK-NEXT:    lsr lr, r0, r12
> -; CHECK-NEXT:    orr r3, lr, r1, lsl r3
> -; CHECK-NEXT:    subs lr, r12, #32
> +; CHECK-NEXT:    lsr r12, r0, lr
> +; CHECK-NEXT:    orr r3, r12, r1, lsl r3
> +; CHECK-NEXT:    subs r12, lr, #32
> ; CHECK-NEXT:    lsl r2, r0, r4
> -; CHECK-NEXT:    lsrpl r3, r1, lr
> +; CHECK-NEXT:    lsrpl r3, r1, r12
> ; CHECK-NEXT:    subs r5, r4, #32
> ; CHECK-NEXT:    movwpl r2, #0
> ; CHECK-NEXT:    cmp r5, #0
> @@ -262,8 +262,8 @@ define i64 @rotr_i64(i64 %x, i64 %z) {
> ; CHECK-NEXT:    lsr r3, r0, r3
> ; CHECK-NEXT:    orr r3, r3, r1, lsl r4
> ; CHECK-NEXT:    lslpl r3, r0, r5
> -; CHECK-NEXT:    lsr r0, r1, r12
> -; CHECK-NEXT:    cmp lr, #0
> +; CHECK-NEXT:    lsr r0, r1, lr
> +; CHECK-NEXT:    cmp r12, #0
> ; CHECK-NEXT:    movwpl r0, #0
> ; CHECK-NEXT:    orr r1, r0, r3
> ; CHECK-NEXT:    mov r0, r2
> diff --git a/llvm/test/CodeGen/ARM/funnel-shift.ll =
b/llvm/test/CodeGen/ARM/funnel-shift.ll
> index 6372f9be2ca3..54c93b493c98 100644
> --- a/llvm/test/CodeGen/ARM/funnel-shift.ll
> +++ b/llvm/test/CodeGen/ARM/funnel-shift.ll
> @@ -224,31 +224,31 @@ define i37 @fshr_i37(i37 %x, i37 %y, i37 %z) {
> ; CHECK-NEXT:    mov r3, #0
> ; CHECK-NEXT:    bl __aeabi_uldivmod
> ; CHECK-NEXT:    add r0, r2, #27
> -; CHECK-NEXT:    lsl r2, r7, #27
> -; CHECK-NEXT:    and r12, r0, #63
> ; CHECK-NEXT:    lsl r6, r6, #27
> +; CHECK-NEXT:    and r1, r0, #63
> +; CHECK-NEXT:    lsl r2, r7, #27
> ; CHECK-NEXT:    orr r7, r6, r7, lsr #5
> -; CHECK-NEXT:    rsb r3, r12, #32
> -; CHECK-NEXT:    lsr r2, r2, r12
> ; CHECK-NEXT:    mov r6, #63
> -; CHECK-NEXT:    orr r2, r2, r7, lsl r3
> -; CHECK-NEXT:    subs r3, r12, #32
> +; CHECK-NEXT:    rsb r3, r1, #32
> +; CHECK-NEXT:    lsr r2, r2, r1
> +; CHECK-NEXT:    subs r12, r1, #32
> ; CHECK-NEXT:    bic r6, r6, r0
> +; CHECK-NEXT:    orr r2, r2, r7, lsl r3
> ; CHECK-NEXT:    lsl r5, r9, #1
> -; CHECK-NEXT:    lsrpl r2, r7, r3
> -; CHECK-NEXT:    subs r1, r6, #32
> +; CHECK-NEXT:    lsrpl r2, r7, r12
> ; CHECK-NEXT:    lsl r0, r5, r6
> -; CHECK-NEXT:    lsl r4, r8, #1
> +; CHECK-NEXT:    subs r4, r6, #32
> +; CHECK-NEXT:    lsl r3, r8, #1
> ; CHECK-NEXT:    movwpl r0, #0
> -; CHECK-NEXT:    orr r4, r4, r9, lsr #31
> +; CHECK-NEXT:    orr r3, r3, r9, lsr #31
> ; CHECK-NEXT:    orr r0, r0, r2
> ; CHECK-NEXT:    rsb r2, r6, #32
> -; CHECK-NEXT:    cmp r1, #0
> +; CHECK-NEXT:    cmp r4, #0
> +; CHECK-NEXT:    lsr r1, r7, r1
> ; CHECK-NEXT:    lsr r2, r5, r2
> -; CHECK-NEXT:    orr r2, r2, r4, lsl r6
> -; CHECK-NEXT:    lslpl r2, r5, r1
> -; CHECK-NEXT:    lsr r1, r7, r12
> -; CHECK-NEXT:    cmp r3, #0
> +; CHECK-NEXT:    orr r2, r2, r3, lsl r6
> +; CHECK-NEXT:    lslpl r2, r5, r4
> +; CHECK-NEXT:    cmp r12, #0
> ; CHECK-NEXT:    movwpl r1, #0
> ; CHECK-NEXT:    orr r1, r2, r1
> ; CHECK-NEXT:    pop {r4, r5, r6, r7, r8, r9, r11, pc}
> diff --git a/llvm/test/CodeGen/ARM/illegal-bitfield-loadstore.ll =
b/llvm/test/CodeGen/ARM/illegal-bitfield-loadstore.ll
> index 0a0bb62b0a09..2922e0ed5423 100644
> --- a/llvm/test/CodeGen/ARM/illegal-bitfield-loadstore.ll
> +++ b/llvm/test/CodeGen/ARM/illegal-bitfield-loadstore.ll
> @@ -91,17 +91,17 @@ define void @i56_or(i56* %a) {
> ; BE-LABEL: i56_or:
> ; BE:       @ %bb.0:
> ; BE-NEXT:    mov r1, r0
> +; BE-NEXT:    ldr r12, [r0]
> ; BE-NEXT:    ldrh r2, [r1, #4]!
> ; BE-NEXT:    ldrb r3, [r1, #2]
> ; BE-NEXT:    orr r2, r3, r2, lsl #8
> -; BE-NEXT:    ldr r3, [r0]
> -; BE-NEXT:    orr r2, r2, r3, lsl #24
> -; BE-NEXT:    orr r12, r2, #384
> -; BE-NEXT:    strb r12, [r1, #2]
> -; BE-NEXT:    lsr r2, r12, #8
> -; BE-NEXT:    strh r2, [r1]
> -; BE-NEXT:    bic r1, r3, #255
> -; BE-NEXT:    orr r1, r1, r12, lsr #24
> +; BE-NEXT:    orr r2, r2, r12, lsl #24
> +; BE-NEXT:    orr r2, r2, #384
> +; BE-NEXT:    strb r2, [r1, #2]
> +; BE-NEXT:    lsr r3, r2, #8
> +; BE-NEXT:    strh r3, [r1]
> +; BE-NEXT:    bic r1, r12, #255
> +; BE-NEXT:    orr r1, r1, r2, lsr #24
> ; BE-NEXT:    str r1, [r0]
> ; BE-NEXT:    mov pc, lr
>   %aa =3D load i56, i56* %a
> @@ -127,13 +127,13 @@ define void @i56_and_or(i56* %a) {
> ; BE-NEXT:    ldrb r3, [r1, #2]
> ; BE-NEXT:    strb r2, [r1, #2]
> ; BE-NEXT:    orr r2, r3, r12, lsl #8
> -; BE-NEXT:    ldr r3, [r0]
> -; BE-NEXT:    orr r2, r2, r3, lsl #24
> -; BE-NEXT:    orr r12, r2, #384
> -; BE-NEXT:    lsr r2, r12, #8
> -; BE-NEXT:    strh r2, [r1]
> -; BE-NEXT:    bic r1, r3, #255
> -; BE-NEXT:    orr r1, r1, r12, lsr #24
> +; BE-NEXT:    ldr r12, [r0]
> +; BE-NEXT:    orr r2, r2, r12, lsl #24
> +; BE-NEXT:    orr r2, r2, #384
> +; BE-NEXT:    lsr r3, r2, #8
> +; BE-NEXT:    strh r3, [r1]
> +; BE-NEXT:    bic r1, r12, #255
> +; BE-NEXT:    orr r1, r1, r2, lsr #24
> ; BE-NEXT:    str r1, [r0]
> ; BE-NEXT:    mov pc, lr
>=20
> diff --git a/llvm/test/CodeGen/ARM/neon-copy.ll =
b/llvm/test/CodeGen/ARM/neon-copy.ll
> index 46490efb6631..09a991da2e59 100644
> --- a/llvm/test/CodeGen/ARM/neon-copy.ll
> +++ b/llvm/test/CodeGen/ARM/neon-copy.ll
> @@ -1340,16 +1340,16 @@ define <4 x i16> =
@test_extracts_inserts_varidx_insert(<8 x i16> %x, i32 %idx) {
> ; CHECK-NEXT:    .pad #8
> ; CHECK-NEXT:    sub sp, sp, #8
> ; CHECK-NEXT:    vmov.u16 r1, d0[1]
> -; CHECK-NEXT:    and r12, r0, #3
> +; CHECK-NEXT:    and r0, r0, #3
> ; CHECK-NEXT:    vmov.u16 r2, d0[2]
> -; CHECK-NEXT:    mov r0, sp
> -; CHECK-NEXT:    vmov.u16 r3, d0[3]
> -; CHECK-NEXT:    orr r0, r0, r12, lsl #1
> +; CHECK-NEXT:    mov r3, sp
> +; CHECK-NEXT:    vmov.u16 r12, d0[3]
> +; CHECK-NEXT:    orr r0, r3, r0, lsl #1
> ; CHECK-NEXT:    vst1.16 {d0[0]}, [r0:16]
> ; CHECK-NEXT:    vldr d0, [sp]
> ; CHECK-NEXT:    vmov.16 d0[1], r1
> ; CHECK-NEXT:    vmov.16 d0[2], r2
> -; CHECK-NEXT:    vmov.16 d0[3], r3
> +; CHECK-NEXT:    vmov.16 d0[3], r12
> ; CHECK-NEXT:    add sp, sp, #8
> ; CHECK-NEXT:    bx lr
>   %tmp =3D extractelement <8 x i16> %x, i32 0
> diff --git a/llvm/test/CodeGen/Mips/llvm-ir/ashr.ll =
b/llvm/test/CodeGen/Mips/llvm-ir/ashr.ll
> index a125446b27c3..8be7100d368b 100644
> --- a/llvm/test/CodeGen/Mips/llvm-ir/ashr.ll
> +++ b/llvm/test/CodeGen/Mips/llvm-ir/ashr.ll
> @@ -766,85 +766,79 @@ define signext i128 @ashr_i128(i128 signext %a, =
i128 signext %b) {
> ; MMR3-NEXT:    .cfi_offset 17, -4
> ; MMR3-NEXT:    .cfi_offset 16, -8
> ; MMR3-NEXT:    move $8, $7
> -; MMR3-NEXT:    move $2, $6
> -; MMR3-NEXT:    sw $5, 0($sp) # 4-byte Folded Spill
> -; MMR3-NEXT:    sw $4, 12($sp) # 4-byte Folded Spill
> +; MMR3-NEXT:    sw $6, 32($sp) # 4-byte Folded Spill
> +; MMR3-NEXT:    sw $5, 36($sp) # 4-byte Folded Spill
> +; MMR3-NEXT:    sw $4, 8($sp) # 4-byte Folded Spill
> ; MMR3-NEXT:    lw $16, 76($sp)
> -; MMR3-NEXT:    srlv $3, $7, $16
> -; MMR3-NEXT:    not16 $6, $16
> -; MMR3-NEXT:    sw $6, 24($sp) # 4-byte Folded Spill
> -; MMR3-NEXT:    move $4, $2
> -; MMR3-NEXT:    sw $2, 32($sp) # 4-byte Folded Spill
> -; MMR3-NEXT:    sll16 $2, $2, 1
> -; MMR3-NEXT:    sllv $2, $2, $6
> -; MMR3-NEXT:    li16 $6, 64
> -; MMR3-NEXT:    or16 $2, $3
> -; MMR3-NEXT:    srlv $4, $4, $16
> -; MMR3-NEXT:    sw $4, 16($sp) # 4-byte Folded Spill
> -; MMR3-NEXT:    subu16 $7, $6, $16
> +; MMR3-NEXT:    srlv $4, $7, $16
> +; MMR3-NEXT:    not16 $3, $16
> +; MMR3-NEXT:    sw $3, 24($sp) # 4-byte Folded Spill
> +; MMR3-NEXT:    sll16 $2, $6, 1
> +; MMR3-NEXT:    sllv $3, $2, $3
> +; MMR3-NEXT:    li16 $2, 64
> +; MMR3-NEXT:    or16 $3, $4
> +; MMR3-NEXT:    srlv $6, $6, $16
> +; MMR3-NEXT:    sw $6, 12($sp) # 4-byte Folded Spill
> +; MMR3-NEXT:    subu16 $7, $2, $16
> ; MMR3-NEXT:    sllv $9, $5, $7
> -; MMR3-NEXT:    andi16 $5, $7, 32
> -; MMR3-NEXT:    sw $5, 28($sp) # 4-byte Folded Spill
> -; MMR3-NEXT:    andi16 $6, $16, 32
> -; MMR3-NEXT:    sw $6, 36($sp) # 4-byte Folded Spill
> -; MMR3-NEXT:    move $3, $9
> +; MMR3-NEXT:    andi16 $2, $7, 32
> +; MMR3-NEXT:    sw $2, 28($sp) # 4-byte Folded Spill
> +; MMR3-NEXT:    andi16 $5, $16, 32
> +; MMR3-NEXT:    sw $5, 16($sp) # 4-byte Folded Spill
> +; MMR3-NEXT:    move $4, $9
> ; MMR3-NEXT:    li16 $17, 0
> -; MMR3-NEXT:    movn $3, $17, $5
> -; MMR3-NEXT:    movn $2, $4, $6
> -; MMR3-NEXT:    addiu $4, $16, -64
> -; MMR3-NEXT:    lw $17, 0($sp) # 4-byte Folded Reload
> -; MMR3-NEXT:    srlv $4, $17, $4
> -; MMR3-NEXT:    sw $4, 20($sp) # 4-byte Folded Spill
> -; MMR3-NEXT:    lw $6, 12($sp) # 4-byte Folded Reload
> -; MMR3-NEXT:    sll16 $4, $6, 1
> -; MMR3-NEXT:    sw $4, 8($sp) # 4-byte Folded Spill
> -; MMR3-NEXT:    addiu $5, $16, -64
> -; MMR3-NEXT:    not16 $5, $5
> -; MMR3-NEXT:    sllv $5, $4, $5
> -; MMR3-NEXT:    or16 $2, $3
> -; MMR3-NEXT:    lw $3, 20($sp) # 4-byte Folded Reload
> -; MMR3-NEXT:    or16 $5, $3
> -; MMR3-NEXT:    addiu $3, $16, -64
> -; MMR3-NEXT:    srav $1, $6, $3
> -; MMR3-NEXT:    andi16 $3, $3, 32
> -; MMR3-NEXT:    sw $3, 20($sp) # 4-byte Folded Spill
> -; MMR3-NEXT:    movn $5, $1, $3
> -; MMR3-NEXT:    sllv $3, $6, $7
> -; MMR3-NEXT:    sw $3, 4($sp) # 4-byte Folded Spill
> -; MMR3-NEXT:    not16 $3, $7
> -; MMR3-NEXT:    srl16 $4, $17, 1
> -; MMR3-NEXT:    srlv $3, $4, $3
> +; MMR3-NEXT:    movn $4, $17, $2
> +; MMR3-NEXT:    movn $3, $6, $5
> +; MMR3-NEXT:    addiu $2, $16, -64
> +; MMR3-NEXT:    lw $5, 36($sp) # 4-byte Folded Reload
> +; MMR3-NEXT:    srlv $5, $5, $2
> +; MMR3-NEXT:    sw $5, 20($sp) # 4-byte Folded Spill
> +; MMR3-NEXT:    lw $17, 8($sp) # 4-byte Folded Reload
> +; MMR3-NEXT:    sll16 $6, $17, 1
> +; MMR3-NEXT:    sw $6, 4($sp) # 4-byte Folded Spill
> +; MMR3-NEXT:    not16 $5, $2
> +; MMR3-NEXT:    sllv $5, $6, $5
> +; MMR3-NEXT:    or16 $3, $4
> +; MMR3-NEXT:    lw $4, 20($sp) # 4-byte Folded Reload
> +; MMR3-NEXT:    or16 $5, $4
> +; MMR3-NEXT:    srav $1, $17, $2
> +; MMR3-NEXT:    andi16 $2, $2, 32
> +; MMR3-NEXT:    sw $2, 20($sp) # 4-byte Folded Spill
> +; MMR3-NEXT:    movn $5, $1, $2
> +; MMR3-NEXT:    sllv $2, $17, $7
> +; MMR3-NEXT:    not16 $4, $7
> +; MMR3-NEXT:    lw $7, 36($sp) # 4-byte Folded Reload
> +; MMR3-NEXT:    srl16 $6, $7, 1
> +; MMR3-NEXT:    srlv $6, $6, $4
> ; MMR3-NEXT:    sltiu $10, $16, 64
> -; MMR3-NEXT:    movn $5, $2, $10
> -; MMR3-NEXT:    lw $2, 4($sp) # 4-byte Folded Reload
> +; MMR3-NEXT:    movn $5, $3, $10
> +; MMR3-NEXT:    or16 $6, $2
> +; MMR3-NEXT:    srlv $2, $7, $16
> +; MMR3-NEXT:    lw $3, 24($sp) # 4-byte Folded Reload
> +; MMR3-NEXT:    lw $4, 4($sp) # 4-byte Folded Reload
> +; MMR3-NEXT:    sllv $3, $4, $3
> ; MMR3-NEXT:    or16 $3, $2
> -; MMR3-NEXT:    srlv $2, $17, $16
> -; MMR3-NEXT:    lw $4, 24($sp) # 4-byte Folded Reload
> -; MMR3-NEXT:    lw $7, 8($sp) # 4-byte Folded Reload
> -; MMR3-NEXT:    sllv $17, $7, $4
> -; MMR3-NEXT:    or16 $17, $2
> -; MMR3-NEXT:    srav $11, $6, $16
> -; MMR3-NEXT:    lw $2, 36($sp) # 4-byte Folded Reload
> -; MMR3-NEXT:    movn $17, $11, $2
> -; MMR3-NEXT:    sra $2, $6, 31
> +; MMR3-NEXT:    srav $11, $17, $16
> +; MMR3-NEXT:    lw $4, 16($sp) # 4-byte Folded Reload
> +; MMR3-NEXT:    movn $3, $11, $4
> +; MMR3-NEXT:    sra $2, $17, 31
> ; MMR3-NEXT:    movz $5, $8, $16
> -; MMR3-NEXT:    move $4, $2
> -; MMR3-NEXT:    movn $4, $17, $10
> -; MMR3-NEXT:    lw $6, 28($sp) # 4-byte Folded Reload
> -; MMR3-NEXT:    movn $3, $9, $6
> -; MMR3-NEXT:    lw $6, 36($sp) # 4-byte Folded Reload
> -; MMR3-NEXT:    li16 $17, 0
> -; MMR3-NEXT:    lw $7, 16($sp) # 4-byte Folded Reload
> -; MMR3-NEXT:    movn $7, $17, $6
> -; MMR3-NEXT:    or16 $7, $3
> +; MMR3-NEXT:    move $8, $2
> +; MMR3-NEXT:    movn $8, $3, $10
> +; MMR3-NEXT:    lw $3, 28($sp) # 4-byte Folded Reload
> +; MMR3-NEXT:    movn $6, $9, $3
> +; MMR3-NEXT:    li16 $3, 0
> +; MMR3-NEXT:    lw $7, 12($sp) # 4-byte Folded Reload
> +; MMR3-NEXT:    movn $7, $3, $4
> +; MMR3-NEXT:    or16 $7, $6
> ; MMR3-NEXT:    lw $3, 20($sp) # 4-byte Folded Reload
> ; MMR3-NEXT:    movn $1, $2, $3
> ; MMR3-NEXT:    movn $1, $7, $10
> ; MMR3-NEXT:    lw $3, 32($sp) # 4-byte Folded Reload
> ; MMR3-NEXT:    movz $1, $3, $16
> -; MMR3-NEXT:    movn $11, $2, $6
> +; MMR3-NEXT:    movn $11, $2, $4
> ; MMR3-NEXT:    movn $2, $11, $10
> -; MMR3-NEXT:    move $3, $4
> +; MMR3-NEXT:    move $3, $8
> ; MMR3-NEXT:    move $4, $1
> ; MMR3-NEXT:    lwp $16, 40($sp)
> ; MMR3-NEXT:    addiusp 48
> @@ -858,80 +852,79 @@ define signext i128 @ashr_i128(i128 signext %a, =
i128 signext %b) {
> ; MMR6-NEXT:    sw $16, 8($sp) # 4-byte Folded Spill
> ; MMR6-NEXT:    .cfi_offset 17, -4
> ; MMR6-NEXT:    .cfi_offset 16, -8
> -; MMR6-NEXT:    move $12, $7
> +; MMR6-NEXT:    move $1, $7
> ; MMR6-NEXT:    lw $3, 44($sp)
> ; MMR6-NEXT:    li16 $2, 64
> -; MMR6-NEXT:    subu16 $16, $2, $3
> -; MMR6-NEXT:    sllv $1, $5, $16
> -; MMR6-NEXT:    andi16 $2, $16, 32
> -; MMR6-NEXT:    selnez $8, $1, $2
> -; MMR6-NEXT:    sllv $9, $4, $16
> -; MMR6-NEXT:    not16 $16, $16
> -; MMR6-NEXT:    srl16 $17, $5, 1
> -; MMR6-NEXT:    srlv $10, $17, $16
> -; MMR6-NEXT:    or $9, $9, $10
> -; MMR6-NEXT:    seleqz $9, $9, $2
> -; MMR6-NEXT:    or $8, $8, $9
> -; MMR6-NEXT:    srlv $9, $7, $3
> -; MMR6-NEXT:    not16 $7, $3
> -; MMR6-NEXT:    sw $7, 4($sp) # 4-byte Folded Spill
> +; MMR6-NEXT:    subu16 $7, $2, $3
> +; MMR6-NEXT:    sllv $8, $5, $7
> +; MMR6-NEXT:    andi16 $2, $7, 32
> +; MMR6-NEXT:    selnez $9, $8, $2
> +; MMR6-NEXT:    sllv $10, $4, $7
> +; MMR6-NEXT:    not16 $7, $7
> +; MMR6-NEXT:    srl16 $16, $5, 1
> +; MMR6-NEXT:    srlv $7, $16, $7
> +; MMR6-NEXT:    or $7, $10, $7
> +; MMR6-NEXT:    seleqz $7, $7, $2
> +; MMR6-NEXT:    or $7, $9, $7
> +; MMR6-NEXT:    srlv $9, $1, $3
> +; MMR6-NEXT:    not16 $16, $3
> +; MMR6-NEXT:    sw $16, 4($sp) # 4-byte Folded Spill
> ; MMR6-NEXT:    sll16 $17, $6, 1
> -; MMR6-NEXT:    sllv $10, $17, $7
> +; MMR6-NEXT:    sllv $10, $17, $16
> ; MMR6-NEXT:    or $9, $10, $9
> ; MMR6-NEXT:    andi16 $17, $3, 32
> ; MMR6-NEXT:    seleqz $9, $9, $17
> ; MMR6-NEXT:    srlv $10, $6, $3
> ; MMR6-NEXT:    selnez $11, $10, $17
> ; MMR6-NEXT:    seleqz $10, $10, $17
> -; MMR6-NEXT:    or $8, $10, $8
> -; MMR6-NEXT:    seleqz $1, $1, $2
> -; MMR6-NEXT:    or $9, $11, $9
> +; MMR6-NEXT:    or $10, $10, $7
> +; MMR6-NEXT:    seleqz $12, $8, $2
> +; MMR6-NEXT:    or $8, $11, $9
> ; MMR6-NEXT:    addiu $2, $3, -64
> -; MMR6-NEXT:    srlv $10, $5, $2
> +; MMR6-NEXT:    srlv $9, $5, $2
> ; MMR6-NEXT:    sll16 $7, $4, 1
> ; MMR6-NEXT:    not16 $16, $2
> ; MMR6-NEXT:    sllv $11, $7, $16
> ; MMR6-NEXT:    sltiu $13, $3, 64
> -; MMR6-NEXT:    or $1, $9, $1
> -; MMR6-NEXT:    selnez $8, $8, $13
> -; MMR6-NEXT:    or $9, $11, $10
> -; MMR6-NEXT:    srav $10, $4, $2
> +; MMR6-NEXT:    or $8, $8, $12
> +; MMR6-NEXT:    selnez $10, $10, $13
> +; MMR6-NEXT:    or $9, $11, $9
> +; MMR6-NEXT:    srav $11, $4, $2
> ; MMR6-NEXT:    andi16 $2, $2, 32
> -; MMR6-NEXT:    seleqz $11, $10, $2
> +; MMR6-NEXT:    seleqz $12, $11, $2
> ; MMR6-NEXT:    sra $14, $4, 31
> ; MMR6-NEXT:    selnez $15, $14, $2
> ; MMR6-NEXT:    seleqz $9, $9, $2
> -; MMR6-NEXT:    or $11, $15, $11
> -; MMR6-NEXT:    seleqz $11, $11, $13
> -; MMR6-NEXT:    selnez $2, $10, $2
> -; MMR6-NEXT:    seleqz $10, $14, $13
> -; MMR6-NEXT:    or $8, $8, $11
> -; MMR6-NEXT:    selnez $8, $8, $3
> -; MMR6-NEXT:    selnez $1, $1, $13
> +; MMR6-NEXT:    or $12, $15, $12
> +; MMR6-NEXT:    seleqz $12, $12, $13
> +; MMR6-NEXT:    selnez $2, $11, $2
> +; MMR6-NEXT:    seleqz $11, $14, $13
> +; MMR6-NEXT:    or $10, $10, $12
> +; MMR6-NEXT:    selnez $10, $10, $3
> +; MMR6-NEXT:    selnez $8, $8, $13
> ; MMR6-NEXT:    or $2, $2, $9
> ; MMR6-NEXT:    srav $9, $4, $3
> ; MMR6-NEXT:    seleqz $4, $9, $17
> -; MMR6-NEXT:    selnez $11, $14, $17
> -; MMR6-NEXT:    or $4, $11, $4
> -; MMR6-NEXT:    selnez $11, $4, $13
> +; MMR6-NEXT:    selnez $12, $14, $17
> +; MMR6-NEXT:    or $4, $12, $4
> +; MMR6-NEXT:    selnez $12, $4, $13
> ; MMR6-NEXT:    seleqz $2, $2, $13
> ; MMR6-NEXT:    seleqz $4, $6, $3
> -; MMR6-NEXT:    seleqz $6, $12, $3
> +; MMR6-NEXT:    seleqz $1, $1, $3
> +; MMR6-NEXT:    or $2, $8, $2
> +; MMR6-NEXT:    selnez $2, $2, $3
> ; MMR6-NEXT:    or $1, $1, $2
> -; MMR6-NEXT:    selnez $1, $1, $3
> -; MMR6-NEXT:    or $1, $6, $1
> -; MMR6-NEXT:    or $4, $4, $8
> -; MMR6-NEXT:    or $6, $11, $10
> -; MMR6-NEXT:    srlv $2, $5, $3
> -; MMR6-NEXT:    lw $3, 4($sp) # 4-byte Folded Reload
> -; MMR6-NEXT:    sllv $3, $7, $3
> -; MMR6-NEXT:    or $2, $3, $2
> -; MMR6-NEXT:    seleqz $2, $2, $17
> -; MMR6-NEXT:    selnez $3, $9, $17
> -; MMR6-NEXT:    or $2, $3, $2
> -; MMR6-NEXT:    selnez $2, $2, $13
> -; MMR6-NEXT:    or $3, $2, $10
> -; MMR6-NEXT:    move $2, $6
> +; MMR6-NEXT:    or $4, $4, $10
> +; MMR6-NEXT:    or $2, $12, $11
> +; MMR6-NEXT:    srlv $3, $5, $3
> +; MMR6-NEXT:    lw $5, 4($sp) # 4-byte Folded Reload
> +; MMR6-NEXT:    sllv $5, $7, $5
> +; MMR6-NEXT:    or $3, $5, $3
> +; MMR6-NEXT:    seleqz $3, $3, $17
> +; MMR6-NEXT:    selnez $5, $9, $17
> +; MMR6-NEXT:    or $3, $5, $3
> +; MMR6-NEXT:    selnez $3, $3, $13
> +; MMR6-NEXT:    or $3, $3, $11
> ; MMR6-NEXT:    move $5, $1
> ; MMR6-NEXT:    lw $16, 8($sp) # 4-byte Folded Reload
> ; MMR6-NEXT:    lw $17, 12($sp) # 4-byte Folded Reload
> diff --git a/llvm/test/CodeGen/Mips/llvm-ir/lshr.ll =
b/llvm/test/CodeGen/Mips/llvm-ir/lshr.ll
> index e4b4b3ae1d0f..ed2bfc9fcf60 100644
> --- a/llvm/test/CodeGen/Mips/llvm-ir/lshr.ll
> +++ b/llvm/test/CodeGen/Mips/llvm-ir/lshr.ll
> @@ -776,77 +776,76 @@ define signext i128 @lshr_i128(i128 signext %a, =
i128 signext %b) {
> ; MMR3-NEXT:    .cfi_offset 17, -4
> ; MMR3-NEXT:    .cfi_offset 16, -8
> ; MMR3-NEXT:    move $8, $7
> -; MMR3-NEXT:    sw $5, 4($sp) # 4-byte Folded Spill
> +; MMR3-NEXT:    sw $6, 24($sp) # 4-byte Folded Spill
> ; MMR3-NEXT:    sw $4, 28($sp) # 4-byte Folded Spill
> ; MMR3-NEXT:    lw $16, 68($sp)
> ; MMR3-NEXT:    li16 $2, 64
> -; MMR3-NEXT:    subu16 $17, $2, $16
> -; MMR3-NEXT:    sllv $9, $5, $17
> -; MMR3-NEXT:    andi16 $3, $17, 32
> +; MMR3-NEXT:    subu16 $7, $2, $16
> +; MMR3-NEXT:    sllv $9, $5, $7
> +; MMR3-NEXT:    move $17, $5
> +; MMR3-NEXT:    sw $5, 0($sp) # 4-byte Folded Spill
> +; MMR3-NEXT:    andi16 $3, $7, 32
> ; MMR3-NEXT:    sw $3, 20($sp) # 4-byte Folded Spill
> ; MMR3-NEXT:    li16 $2, 0
> ; MMR3-NEXT:    move $4, $9
> ; MMR3-NEXT:    movn $4, $2, $3
> -; MMR3-NEXT:    srlv $5, $7, $16
> +; MMR3-NEXT:    srlv $5, $8, $16
> ; MMR3-NEXT:    not16 $3, $16
> ; MMR3-NEXT:    sw $3, 16($sp) # 4-byte Folded Spill
> ; MMR3-NEXT:    sll16 $2, $6, 1
> -; MMR3-NEXT:    sw $6, 24($sp) # 4-byte Folded Spill
> ; MMR3-NEXT:    sllv $2, $2, $3
> ; MMR3-NEXT:    or16 $2, $5
> -; MMR3-NEXT:    srlv $7, $6, $16
> +; MMR3-NEXT:    srlv $5, $6, $16
> +; MMR3-NEXT:    sw $5, 4($sp) # 4-byte Folded Spill
> ; MMR3-NEXT:    andi16 $3, $16, 32
> ; MMR3-NEXT:    sw $3, 12($sp) # 4-byte Folded Spill
> -; MMR3-NEXT:    movn $2, $7, $3
> +; MMR3-NEXT:    movn $2, $5, $3
> ; MMR3-NEXT:    addiu $3, $16, -64
> ; MMR3-NEXT:    or16 $2, $4
> -; MMR3-NEXT:    lw $6, 4($sp) # 4-byte Folded Reload
> -; MMR3-NEXT:    srlv $3, $6, $3
> -; MMR3-NEXT:    sw $3, 8($sp) # 4-byte Folded Spill
> -; MMR3-NEXT:    lw $3, 28($sp) # 4-byte Folded Reload
> -; MMR3-NEXT:    sll16 $4, $3, 1
> -; MMR3-NEXT:    sw $4, 0($sp) # 4-byte Folded Spill
> -; MMR3-NEXT:    addiu $5, $16, -64
> -; MMR3-NEXT:    not16 $5, $5
> -; MMR3-NEXT:    sllv $5, $4, $5
> -; MMR3-NEXT:    lw $4, 8($sp) # 4-byte Folded Reload
> -; MMR3-NEXT:    or16 $5, $4
> -; MMR3-NEXT:    addiu $4, $16, -64
> -; MMR3-NEXT:    srlv $1, $3, $4
> -; MMR3-NEXT:    andi16 $4, $4, 32
> +; MMR3-NEXT:    srlv $4, $17, $3
> ; MMR3-NEXT:    sw $4, 8($sp) # 4-byte Folded Spill
> -; MMR3-NEXT:    movn $5, $1, $4
> +; MMR3-NEXT:    lw $4, 28($sp) # 4-byte Folded Reload
> +; MMR3-NEXT:    sll16 $6, $4, 1
> +; MMR3-NEXT:    not16 $5, $3
> +; MMR3-NEXT:    sllv $5, $6, $5
> +; MMR3-NEXT:    lw $17, 8($sp) # 4-byte Folded Reload
> +; MMR3-NEXT:    or16 $5, $17
> +; MMR3-NEXT:    srlv $1, $4, $3
> +; MMR3-NEXT:    andi16 $3, $3, 32
> +; MMR3-NEXT:    sw $3, 8($sp) # 4-byte Folded Spill
> +; MMR3-NEXT:    movn $5, $1, $3
> ; MMR3-NEXT:    sltiu $10, $16, 64
> ; MMR3-NEXT:    movn $5, $2, $10
> -; MMR3-NEXT:    sllv $2, $3, $17
> -; MMR3-NEXT:    not16 $3, $17
> -; MMR3-NEXT:    srl16 $4, $6, 1
> +; MMR3-NEXT:    sllv $2, $4, $7
> +; MMR3-NEXT:    not16 $3, $7
> +; MMR3-NEXT:    lw $7, 0($sp) # 4-byte Folded Reload
> +; MMR3-NEXT:    srl16 $4, $7, 1
> ; MMR3-NEXT:    srlv $4, $4, $3
> ; MMR3-NEXT:    or16 $4, $2
> -; MMR3-NEXT:    srlv $2, $6, $16
> +; MMR3-NEXT:    srlv $2, $7, $16
> ; MMR3-NEXT:    lw $3, 16($sp) # 4-byte Folded Reload
> -; MMR3-NEXT:    lw $6, 0($sp) # 4-byte Folded Reload
> ; MMR3-NEXT:    sllv $3, $6, $3
> ; MMR3-NEXT:    or16 $3, $2
> ; MMR3-NEXT:    lw $2, 28($sp) # 4-byte Folded Reload
> ; MMR3-NEXT:    srlv $2, $2, $16
> -; MMR3-NEXT:    lw $6, 12($sp) # 4-byte Folded Reload
> -; MMR3-NEXT:    movn $3, $2, $6
> +; MMR3-NEXT:    lw $17, 12($sp) # 4-byte Folded Reload
> +; MMR3-NEXT:    movn $3, $2, $17
> ; MMR3-NEXT:    movz $5, $8, $16
> -; MMR3-NEXT:    li16 $17, 0
> -; MMR3-NEXT:    movz $3, $17, $10
> -; MMR3-NEXT:    lw $17, 20($sp) # 4-byte Folded Reload
> -; MMR3-NEXT:    movn $4, $9, $17
> -; MMR3-NEXT:    li16 $17, 0
> -; MMR3-NEXT:    movn $7, $17, $6
> -; MMR3-NEXT:    or16 $7, $4
> +; MMR3-NEXT:    li16 $6, 0
> +; MMR3-NEXT:    movz $3, $6, $10
> +; MMR3-NEXT:    lw $7, 20($sp) # 4-byte Folded Reload
> +; MMR3-NEXT:    movn $4, $9, $7
> +; MMR3-NEXT:    lw $6, 4($sp) # 4-byte Folded Reload
> +; MMR3-NEXT:    li16 $7, 0
> +; MMR3-NEXT:    movn $6, $7, $17
> +; MMR3-NEXT:    or16 $6, $4
> ; MMR3-NEXT:    lw $4, 8($sp) # 4-byte Folded Reload
> -; MMR3-NEXT:    movn $1, $17, $4
> -; MMR3-NEXT:    li16 $17, 0
> -; MMR3-NEXT:    movn $1, $7, $10
> +; MMR3-NEXT:    movn $1, $7, $4
> +; MMR3-NEXT:    li16 $7, 0
> +; MMR3-NEXT:    movn $1, $6, $10
> ; MMR3-NEXT:    lw $4, 24($sp) # 4-byte Folded Reload
> ; MMR3-NEXT:    movz $1, $4, $16
> -; MMR3-NEXT:    movn $2, $17, $6
> +; MMR3-NEXT:    movn $2, $7, $17
> ; MMR3-NEXT:    li16 $4, 0
> ; MMR3-NEXT:    movz $2, $4, $10
> ; MMR3-NEXT:    move $4, $1
> @@ -856,91 +855,98 @@ define signext i128 @lshr_i128(i128 signext %a, =
i128 signext %b) {
> ;
> ; MMR6-LABEL: lshr_i128:
> ; MMR6:       # %bb.0: # %entry
> -; MMR6-NEXT:    addiu $sp, $sp, -24
> -; MMR6-NEXT:    .cfi_def_cfa_offset 24
> -; MMR6-NEXT:    sw $17, 20($sp) # 4-byte Folded Spill
> -; MMR6-NEXT:    sw $16, 16($sp) # 4-byte Folded Spill
> +; MMR6-NEXT:    addiu $sp, $sp, -32
> +; MMR6-NEXT:    .cfi_def_cfa_offset 32
> +; MMR6-NEXT:    sw $17, 28($sp) # 4-byte Folded Spill
> +; MMR6-NEXT:    sw $16, 24($sp) # 4-byte Folded Spill
> ; MMR6-NEXT:    .cfi_offset 17, -4
> ; MMR6-NEXT:    .cfi_offset 16, -8
> ; MMR6-NEXT:    move $1, $7
> -; MMR6-NEXT:    move $7, $4
> -; MMR6-NEXT:    lw $3, 52($sp)
> +; MMR6-NEXT:    move $7, $5
> +; MMR6-NEXT:    lw $3, 60($sp)
> ; MMR6-NEXT:    srlv $2, $1, $3
> -; MMR6-NEXT:    not16 $16, $3
> -; MMR6-NEXT:    sw $16, 8($sp) # 4-byte Folded Spill
> -; MMR6-NEXT:    move $4, $6
> -; MMR6-NEXT:    sw $6, 12($sp) # 4-byte Folded Spill
> +; MMR6-NEXT:    not16 $5, $3
> +; MMR6-NEXT:    sw $5, 12($sp) # 4-byte Folded Spill
> +; MMR6-NEXT:    move $17, $6
> +; MMR6-NEXT:    sw $6, 16($sp) # 4-byte Folded Spill
> ; MMR6-NEXT:    sll16 $6, $6, 1
> -; MMR6-NEXT:    sllv $6, $6, $16
> +; MMR6-NEXT:    sllv $6, $6, $5
> ; MMR6-NEXT:    or $8, $6, $2
> -; MMR6-NEXT:    addiu $6, $3, -64
> -; MMR6-NEXT:    srlv $9, $5, $6
> -; MMR6-NEXT:    sll16 $2, $7, 1
> -; MMR6-NEXT:    sw $2, 4($sp) # 4-byte Folded Spill
> -; MMR6-NEXT:    not16 $16, $6
> +; MMR6-NEXT:    addiu $5, $3, -64
> +; MMR6-NEXT:    srlv $9, $7, $5
> +; MMR6-NEXT:    move $6, $4
> +; MMR6-NEXT:    sll16 $2, $4, 1
> +; MMR6-NEXT:    sw $2, 8($sp) # 4-byte Folded Spill
> +; MMR6-NEXT:    not16 $16, $5
> ; MMR6-NEXT:    sllv $10, $2, $16
> ; MMR6-NEXT:    andi16 $16, $3, 32
> ; MMR6-NEXT:    seleqz $8, $8, $16
> ; MMR6-NEXT:    or $9, $10, $9
> -; MMR6-NEXT:    srlv $10, $4, $3
> +; MMR6-NEXT:    srlv $10, $17, $3
> ; MMR6-NEXT:    selnez $11, $10, $16
> ; MMR6-NEXT:    li16 $17, 64
> ; MMR6-NEXT:    subu16 $2, $17, $3
> -; MMR6-NEXT:    sllv $12, $5, $2
> +; MMR6-NEXT:    sllv $12, $7, $2
> +; MMR6-NEXT:    move $17, $7
> ; MMR6-NEXT:    andi16 $4, $2, 32
> -; MMR6-NEXT:    andi16 $17, $6, 32
> -; MMR6-NEXT:    seleqz $9, $9, $17
> +; MMR6-NEXT:    andi16 $7, $5, 32
> +; MMR6-NEXT:    sw $7, 20($sp) # 4-byte Folded Spill
> +; MMR6-NEXT:    seleqz $9, $9, $7
> ; MMR6-NEXT:    seleqz $13, $12, $4
> ; MMR6-NEXT:    or $8, $11, $8
> ; MMR6-NEXT:    selnez $11, $12, $4
> -; MMR6-NEXT:    sllv $12, $7, $2
> +; MMR6-NEXT:    sllv $12, $6, $2
> +; MMR6-NEXT:    move $7, $6
> +; MMR6-NEXT:    sw $6, 4($sp) # 4-byte Folded Spill
> ; MMR6-NEXT:    not16 $2, $2
> -; MMR6-NEXT:    srl16 $6, $5, 1
> +; MMR6-NEXT:    srl16 $6, $17, 1
> ; MMR6-NEXT:    srlv $2, $6, $2
> ; MMR6-NEXT:    or $2, $12, $2
> ; MMR6-NEXT:    seleqz $2, $2, $4
> -; MMR6-NEXT:    addiu $4, $3, -64
> -; MMR6-NEXT:    srlv $4, $7, $4
> -; MMR6-NEXT:    or $12, $11, $2
> -; MMR6-NEXT:    or $6, $8, $13
> -; MMR6-NEXT:    srlv $5, $5, $3
> -; MMR6-NEXT:    selnez $8, $4, $17
> -; MMR6-NEXT:    sltiu $11, $3, 64
> -; MMR6-NEXT:    selnez $13, $6, $11
> -; MMR6-NEXT:    or $8, $8, $9
> +; MMR6-NEXT:    srlv $4, $7, $5
> +; MMR6-NEXT:    or $11, $11, $2
> +; MMR6-NEXT:    or $5, $8, $13
> +; MMR6-NEXT:    srlv $6, $17, $3
> +; MMR6-NEXT:    lw $2, 20($sp) # 4-byte Folded Reload
> +; MMR6-NEXT:    selnez $7, $4, $2
> +; MMR6-NEXT:    sltiu $8, $3, 64
> +; MMR6-NEXT:    selnez $12, $5, $8
> +; MMR6-NEXT:    or $7, $7, $9
> +; MMR6-NEXT:    lw $5, 12($sp) # 4-byte Folded Reload
> ; MMR6-NEXT:    lw $2, 8($sp) # 4-byte Folded Reload
> -; MMR6-NEXT:    lw $6, 4($sp) # 4-byte Folded Reload
> -; MMR6-NEXT:    sllv $9, $6, $2
> +; MMR6-NEXT:    sllv $9, $2, $5
> ; MMR6-NEXT:    seleqz $10, $10, $16
> -; MMR6-NEXT:    li16 $2, 0
> -; MMR6-NEXT:    or $10, $10, $12
> -; MMR6-NEXT:    or $9, $9, $5
> -; MMR6-NEXT:    seleqz $5, $8, $11
> -; MMR6-NEXT:    seleqz $8, $2, $11
> -; MMR6-NEXT:    srlv $7, $7, $3
> -; MMR6-NEXT:    seleqz $2, $7, $16
> -; MMR6-NEXT:    selnez $2, $2, $11
> +; MMR6-NEXT:    li16 $5, 0
> +; MMR6-NEXT:    or $10, $10, $11
> +; MMR6-NEXT:    or $6, $9, $6
> +; MMR6-NEXT:    seleqz $2, $7, $8
> +; MMR6-NEXT:    seleqz $7, $5, $8
> +; MMR6-NEXT:    lw $5, 4($sp) # 4-byte Folded Reload
> +; MMR6-NEXT:    srlv $9, $5, $3
> +; MMR6-NEXT:    seleqz $11, $9, $16
> +; MMR6-NEXT:    selnez $11, $11, $8
> ; MMR6-NEXT:    seleqz $1, $1, $3
> -; MMR6-NEXT:    or $5, $13, $5
> -; MMR6-NEXT:    selnez $5, $5, $3
> -; MMR6-NEXT:    or $5, $1, $5
> -; MMR6-NEXT:    or $2, $8, $2
> -; MMR6-NEXT:    seleqz $1, $9, $16
> -; MMR6-NEXT:    selnez $6, $7, $16
> -; MMR6-NEXT:    lw $7, 12($sp) # 4-byte Folded Reload
> -; MMR6-NEXT:    seleqz $7, $7, $3
> -; MMR6-NEXT:    selnez $9, $10, $11
> -; MMR6-NEXT:    seleqz $4, $4, $17
> -; MMR6-NEXT:    seleqz $4, $4, $11
> -; MMR6-NEXT:    or $4, $9, $4
> +; MMR6-NEXT:    or $2, $12, $2
> +; MMR6-NEXT:    selnez $2, $2, $3
> +; MMR6-NEXT:    or $5, $1, $2
> +; MMR6-NEXT:    or $2, $7, $11
> +; MMR6-NEXT:    seleqz $1, $6, $16
> +; MMR6-NEXT:    selnez $6, $9, $16
> +; MMR6-NEXT:    lw $16, 16($sp) # 4-byte Folded Reload
> +; MMR6-NEXT:    seleqz $9, $16, $3
> +; MMR6-NEXT:    selnez $10, $10, $8
> +; MMR6-NEXT:    lw $16, 20($sp) # 4-byte Folded Reload
> +; MMR6-NEXT:    seleqz $4, $4, $16
> +; MMR6-NEXT:    seleqz $4, $4, $8
> +; MMR6-NEXT:    or $4, $10, $4
> ; MMR6-NEXT:    selnez $3, $4, $3
> -; MMR6-NEXT:    or $4, $7, $3
> +; MMR6-NEXT:    or $4, $9, $3
> ; MMR6-NEXT:    or $1, $6, $1
> -; MMR6-NEXT:    selnez $1, $1, $11
> -; MMR6-NEXT:    or $3, $8, $1
> -; MMR6-NEXT:    lw $16, 16($sp) # 4-byte Folded Reload
> -; MMR6-NEXT:    lw $17, 20($sp) # 4-byte Folded Reload
> -; MMR6-NEXT:    addiu $sp, $sp, 24
> +; MMR6-NEXT:    selnez $1, $1, $8
> +; MMR6-NEXT:    or $3, $7, $1
> +; MMR6-NEXT:    lw $16, 24($sp) # 4-byte Folded Reload
> +; MMR6-NEXT:    lw $17, 28($sp) # 4-byte Folded Reload
> +; MMR6-NEXT:    addiu $sp, $sp, 32
> ; MMR6-NEXT:    jrc $ra
> </cut>

