Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A266E4C95
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 17:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA203C340E8;
	Wed,  9 Mar 2022 17:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646845885;
	bh=1nooImyrYF7c84QbPyX78TXYa4QdvgZgl714Zksma1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=khSGTPoxgw4WWEc8PX+IUEGF7kAqJsZkKUtitEx1Qqql8BhkkNwAVIQkcCtmp5AcD
	 9mjgZ4FXUqRI7ooI2cgCdkKV+Duk4HJLXfrqTWN0abR5NX6WoHOq7zgEep8TRplo41
	 89azKH7HSCi5CP5k4NqeBiO13mGqpQ/uMPEX97BnUp0njn3LYFMGC9qKeFw0/hdjv6
	 POchjwbg+dnD/4GWlBtHHZVwVehFaeD1WAR6qswP99ROHD8subzZkpQSc2meXsmGjT
	 0Nn2Hzu+Rd71v2lq7kZaiZahEh8ZTQOyFnuTnRolBaQuLEuXNaq2b+GGGP1gRkb+03
	 CiHYWHXDQf5kg==
Date: Wed, 9 Mar 2022 10:11:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kernel-team@android.com,
	James Morse <james.morse@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, llvm@lists.linux.dev
Subject: Re: [PATCH] arm64: Paper over ARM_SMCCC_ARCH_WORKAROUND_3 Clang issue
Message-ID: <YijftpaApSJWuZ3m@dev-arch.thelio-3990X>
References: <20220309155716.3988480-1-maz@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3yjywy72XW9qj2eo"
Content-Disposition: inline
In-Reply-To: <20220309155716.3988480-1-maz@kernel.org>


--3yjywy72XW9qj2eo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 09, 2022 at 03:57:16PM +0000, Marc Zyngier wrote:
> Compiling the arm64 kernel with the BHB workarounds and Clang+LTO
> results in a bunch of:
> 
> <instantiation>:4:2: error: invalid fixup for movz/movk instruction
>  mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
> 
> when compiling arch/arm64/kernel/entry.S, and makes no sense at all.
> 
> As it turns out, moving a single include line around makes the
> problem disappear. Why, you'd ask? Well, I don't have the faintest
> idea, and I'm running out of patience. So make of that what you want.
> 
> Cc: James Morse <james.morse@arm.com>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  include/linux/arm-smccc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> index 220c8c60e021..0a341dd9ff61 100644
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.h
> @@ -5,7 +5,6 @@
>  #ifndef __LINUX_ARM_SMCCC_H
>  #define __LINUX_ARM_SMCCC_H
>  
> -#include <linux/init.h>
>  #include <uapi/linux/const.h>
>  
>  /*
> @@ -193,6 +192,7 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +#include <linux/init.h>
>  #include <linux/linkage.h>
>  #include <linux/types.h>
>  
> -- 
> 2.34.1

I am still looking at this but I wanted to post a preliminary finding.
It seems the source of the error is that ARM_SMCCC_ARCH_WORKAROUND_3 is
not getting expanded by the preprocessor. If you preprocess
arch/arm64/kernel/entry.S without LTO then with LTO, it reveals the
attached diff, which shows just "#ARM_SMCCC_ARCH_WORKAROUND_3", rather
than "# (((1) << 31) | ((0) << 30) | (((0) & 0x3F) << 24) | ((0x3fff) & 0xFFFF))".

$ make -skj"$(nproc)" ARCH=arm64 LLVM=1 mrproper defconfig arch/arm64/kernel/entry.s

I'll see if I can figure out what is going wrong in the include chain.

Cheers,
Nathan

--3yjywy72XW9qj2eo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="entry.s.diff"

diff --git a/entry.s.good b/entry.s.bad
index ab98e34..b331cc4 100644
--- a/entry.s.good
+++ b/entry.s.bad
@@ -35,71 +35,17 @@
 # 6 "./include/linux/compiler.h" 2
 # 266 "./include/linux/compiler.h"
 # 1 "./arch/arm64/include/asm/rwonce.h" 1
-# 71 "./arch/arm64/include/asm/rwonce.h"
-# 1 "./include/asm-generic/rwonce.h" 1
-# 72 "./arch/arm64/include/asm/rwonce.h" 2
-# 267 "./include/linux/compiler.h" 2
-# 6 "./include/linux/init.h" 2
-# 1 "./include/linux/types.h" 1
-
-
-
-
-
-# 1 "./include/uapi/linux/types.h" 1
-
-
-
-
-# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
-# 1 "./include/uapi/asm-generic/types.h" 1
-
-
-
-
-
-
-# 1 "./include/asm-generic/int-ll64.h" 1
-# 11 "./include/asm-generic/int-ll64.h"
-# 1 "./include/uapi/asm-generic/int-ll64.h" 1
-# 12 "./include/uapi/asm-generic/int-ll64.h"
-# 1 "./arch/arm64/include/uapi/asm/bitsperlong.h" 1
-# 22 "./arch/arm64/include/uapi/asm/bitsperlong.h"
-# 1 "./include/asm-generic/bitsperlong.h" 1
-
-
-
-
-# 1 "./include/uapi/asm-generic/bitsperlong.h" 1
-# 6 "./include/asm-generic/bitsperlong.h" 2
-# 23 "./arch/arm64/include/uapi/asm/bitsperlong.h" 2
-# 13 "./include/uapi/asm-generic/int-ll64.h" 2
-# 12 "./include/asm-generic/int-ll64.h" 2
-# 8 "./include/uapi/asm-generic/types.h" 2
-# 2 "./arch/arm64/include/generated/uapi/asm/types.h" 2
-# 6 "./include/uapi/linux/types.h" 2
-# 7 "./include/linux/types.h" 2
-# 7 "./include/linux/init.h" 2
-# 9 "./include/linux/arm-smccc.h" 2
-# 1 "./include/uapi/linux/const.h" 1
-# 10 "./include/linux/arm-smccc.h" 2
-# 11 "arch/arm64/kernel/entry.S" 2
-
-# 1 "./include/linux/linkage.h" 1
-
-
-
-
-
-# 1 "./include/linux/stringify.h" 1
-# 7 "./include/linux/linkage.h" 2
-# 1 "./include/linux/export.h" 1
-# 8 "./include/linux/linkage.h" 2
-# 1 "./arch/arm64/include/asm/linkage.h" 1
+# 11 "./arch/arm64/include/asm/rwonce.h"
+# 1 "./arch/arm64/include/asm/alternative-macros.h" 1
 
 
 
 
+# 1 "./arch/arm64/include/generated/asm/cpucaps.h" 1
+# 6 "./arch/arm64/include/asm/alternative-macros.h" 2
+# 1 "./arch/arm64/include/asm/insn-def.h" 1
+# 7 "./arch/arm64/include/asm/alternative-macros.h" 2
+# 80 "./arch/arm64/include/asm/alternative-macros.h"
 # 1 "./arch/arm64/include/asm/assembler.h" 1
 # 15 "./arch/arm64/include/asm/assembler.h"
 # 1 "./include/asm-generic/export.h" 1
@@ -141,108 +87,6 @@ __kstrtab_\name:
 
 
 # 1 "./arch/arm64/include/asm/alternative-macros.h" 1
-
-
-
-
-# 1 "./arch/arm64/include/generated/asm/cpucaps.h" 1
-# 6 "./arch/arm64/include/asm/alternative-macros.h" 2
-# 1 "./arch/arm64/include/asm/insn-def.h" 1
-# 7 "./arch/arm64/include/asm/alternative-macros.h" 2
-# 80 "./arch/arm64/include/asm/alternative-macros.h"
-# 1 "./arch/arm64/include/asm/assembler.h" 1
-# 81 "./arch/arm64/include/asm/alternative-macros.h" 2
-
-.macro altinstruction_entry orig_offset alt_offset feature orig_len alt_len
- .word \orig_offset - .
- .word \alt_offset - .
- .hword \feature
- .byte \orig_len
- .byte \alt_len
-.endm
-
-.macro alternative_insn insn1, insn2, cap, enable = 1
- .if \enable
-661: \insn1
-662: .pushsection .altinstructions, "a"
- altinstruction_entry 661b, 663f, \cap, 662b-661b, 664f-663f
- .popsection
- .subsection 1
-663: \insn2
-664: .org . - (664b-663b) + (662b-661b)
- .org . - (662b-661b) + (664b-663b)
- .previous
- .endif
-.endm
-# 126 "./arch/arm64/include/asm/alternative-macros.h"
-.macro alternative_if_not cap
- .set .Lasm_alt_mode, 0
- .pushsection .altinstructions, "a"
- altinstruction_entry 661f, 663f, \cap, 662f-661f, 664f-663f
- .popsection
-661:
-.endm
-
-.macro alternative_if cap
- .set .Lasm_alt_mode, 1
- .pushsection .altinstructions, "a"
- altinstruction_entry 663f, 661f, \cap, 664f-663f, 662f-661f
- .popsection
- .subsection 1
- .align 2
-661:
-.endm
-
-.macro alternative_cb cb
- .set .Lasm_alt_mode, 0
- .pushsection .altinstructions, "a"
- altinstruction_entry 661f, \cb, 71, 662f-661f, 0
- .popsection
-661:
-.endm
-
-
-
-
-.macro alternative_else
-662:
- .if .Lasm_alt_mode==0
- .subsection 1
- .else
- .previous
- .endif
-663:
-.endm
-
-
-
-
-.macro alternative_endif
-664:
- .org . - (664b-663b) + (662b-661b)
- .org . - (662b-661b) + (664b-663b)
- .if .Lasm_alt_mode==0
- .previous
- .endif
-.endm
-
-
-
-
-.macro alternative_cb_end
-662:
-.endm
-
-
-
-
-
-
-.macro alternative_else_nop_endif
-alternative_else
- nops (662b-661b) / 4
-alternative_endif
-.endm
 # 6 "./arch/arm64/include/asm/alternative.h" 2
 # 18 "./arch/arm64/include/asm/assembler.h" 2
 # 1 "./arch/arm64/include/asm/asm-bug.h" 1
@@ -305,12 +149,30 @@ alternative_endif
 
 
 # 1 "./include/vdso/const.h" 1
+
+
+
+
+# 1 "./include/uapi/linux/const.h" 1
+# 6 "./include/vdso/const.h" 2
 # 5 "./include/linux/const.h" 2
 # 6 "./include/linux/bits.h" 2
 # 1 "./include/vdso/bits.h" 1
 # 7 "./include/linux/bits.h" 2
-# 13 "./arch/arm64/include/asm/sysreg.h" 2
+# 1 "./arch/arm64/include/uapi/asm/bitsperlong.h" 1
+# 22 "./arch/arm64/include/uapi/asm/bitsperlong.h"
+# 1 "./include/asm-generic/bitsperlong.h" 1
+
+
 
+
+# 1 "./include/uapi/asm-generic/bitsperlong.h" 1
+# 6 "./include/asm-generic/bitsperlong.h" 2
+# 23 "./arch/arm64/include/uapi/asm/bitsperlong.h" 2
+# 8 "./include/linux/bits.h" 2
+# 13 "./arch/arm64/include/asm/sysreg.h" 2
+# 1 "./include/linux/stringify.h" 1
+# 14 "./arch/arm64/include/asm/sysreg.h" 2
 # 1 "./include/linux/kasan-tags.h" 1
 # 15 "./arch/arm64/include/asm/sysreg.h" 2
 
@@ -365,8 +227,35 @@ alternative_endif
 # 2 "./include/uapi/linux/errno.h" 2
 # 6 "./include/linux/errno.h" 2
 # 9 "./arch/arm64/include/asm/debug-monitors.h" 2
+# 1 "./include/linux/types.h" 1
+
+
+
 
 
+# 1 "./include/uapi/linux/types.h" 1
+
+
+
+
+# 1 "./arch/arm64/include/generated/uapi/asm/types.h" 1
+# 1 "./include/uapi/asm-generic/types.h" 1
+
+
+
+
+
+
+# 1 "./include/asm-generic/int-ll64.h" 1
+# 11 "./include/asm-generic/int-ll64.h"
+# 1 "./include/uapi/asm-generic/int-ll64.h" 1
+# 12 "./include/asm-generic/int-ll64.h" 2
+# 8 "./include/uapi/asm-generic/types.h" 2
+# 2 "./arch/arm64/include/generated/uapi/asm/types.h" 2
+# 6 "./include/uapi/linux/types.h" 2
+# 7 "./include/linux/types.h" 2
+# 10 "./arch/arm64/include/asm/debug-monitors.h" 2
+
 # 1 "./arch/arm64/include/asm/esr.h" 1
 # 10 "./arch/arm64/include/asm/esr.h"
 # 1 "./arch/arm64/include/asm/memory.h" 1
@@ -389,6 +278,12 @@ alternative_endif
 # 1 "./arch/arm64/include/asm/insn.h" 1
 # 10 "./arch/arm64/include/asm/insn.h"
 # 1 "./include/linux/build_bug.h" 1
+
+
+
+
+# 1 "./include/linux/compiler.h" 1
+# 6 "./include/linux/build_bug.h" 2
 # 11 "./arch/arm64/include/asm/insn.h" 2
 # 13 "./arch/arm64/include/asm/debug-monitors.h" 2
 # 1 "./arch/arm64/include/asm/ptrace.h" 1
@@ -409,6 +304,9 @@ alternative_endif
 # 26 "./arch/arm64/include/asm/assembler.h" 2
 
 # 1 "./arch/arm64/include/asm/thread_info.h" 1
+# 11 "./arch/arm64/include/asm/thread_info.h"
+# 1 "./include/linux/compiler.h" 1
+# 12 "./arch/arm64/include/asm/thread_info.h" 2
 # 28 "./arch/arm64/include/asm/assembler.h" 2
 
 
@@ -1089,7 +987,7 @@ alternative_cb_end
 
  stp x0, x1, [sp, #-16]!
  stp x2, x3, [sp, #-16]!
- mov w0, #(((1) << 31) | ((0) << 30) | (((0) & 0x3F) << 24) | ((0x3fff) & 0xFFFF))
+ mov w0, #ARM_SMCCC_ARCH_WORKAROUND_3
 alternative_cb smccc_patch_fw_mitigation_conduit
  nop
 alternative_cb_end
@@ -1097,6 +995,122 @@ alternative_cb_end
  ldp x0, x1, [sp], #16
 
  .endm
+# 81 "./arch/arm64/include/asm/alternative-macros.h" 2
+
+.macro altinstruction_entry orig_offset alt_offset feature orig_len alt_len
+ .word \orig_offset - .
+ .word \alt_offset - .
+ .hword \feature
+ .byte \orig_len
+ .byte \alt_len
+.endm
+
+.macro alternative_insn insn1, insn2, cap, enable = 1
+ .if \enable
+661: \insn1
+662: .pushsection .altinstructions, "a"
+ altinstruction_entry 661b, 663f, \cap, 662b-661b, 664f-663f
+ .popsection
+ .subsection 1
+663: \insn2
+664: .org . - (664b-663b) + (662b-661b)
+ .org . - (662b-661b) + (664b-663b)
+ .previous
+ .endif
+.endm
+# 126 "./arch/arm64/include/asm/alternative-macros.h"
+.macro alternative_if_not cap
+ .set .Lasm_alt_mode, 0
+ .pushsection .altinstructions, "a"
+ altinstruction_entry 661f, 663f, \cap, 662f-661f, 664f-663f
+ .popsection
+661:
+.endm
+
+.macro alternative_if cap
+ .set .Lasm_alt_mode, 1
+ .pushsection .altinstructions, "a"
+ altinstruction_entry 663f, 661f, \cap, 664f-663f, 662f-661f
+ .popsection
+ .subsection 1
+ .align 2
+661:
+.endm
+
+.macro alternative_cb cb
+ .set .Lasm_alt_mode, 0
+ .pushsection .altinstructions, "a"
+ altinstruction_entry 661f, \cb, 71, 662f-661f, 0
+ .popsection
+661:
+.endm
+
+
+
+
+.macro alternative_else
+662:
+ .if .Lasm_alt_mode==0
+ .subsection 1
+ .else
+ .previous
+ .endif
+663:
+.endm
+
+
+
+
+.macro alternative_endif
+664:
+ .org . - (664b-663b) + (662b-661b)
+ .org . - (662b-661b) + (664b-663b)
+ .if .Lasm_alt_mode==0
+ .previous
+ .endif
+.endm
+
+
+
+
+.macro alternative_cb_end
+662:
+.endm
+
+
+
+
+
+
+.macro alternative_else_nop_endif
+alternative_else
+ nops (662b-661b) / 4
+alternative_endif
+.endm
+# 12 "./arch/arm64/include/asm/rwonce.h" 2
+# 71 "./arch/arm64/include/asm/rwonce.h"
+# 1 "./include/asm-generic/rwonce.h" 1
+# 72 "./arch/arm64/include/asm/rwonce.h" 2
+# 267 "./include/linux/compiler.h" 2
+# 6 "./include/linux/init.h" 2
+# 9 "./include/linux/arm-smccc.h" 2
+# 11 "arch/arm64/kernel/entry.S" 2
+
+# 1 "./include/linux/linkage.h" 1
+
+
+
+
+
+
+# 1 "./include/linux/export.h" 1
+# 8 "./include/linux/linkage.h" 2
+# 1 "./arch/arm64/include/asm/linkage.h" 1
+
+
+
+
+# 1 "./arch/arm64/include/asm/assembler.h" 1
 # 6 "./arch/arm64/include/asm/linkage.h" 2
 # 9 "./include/linux/linkage.h" 2
 # 13 "arch/arm64/kernel/entry.S" 2

--3yjywy72XW9qj2eo--
