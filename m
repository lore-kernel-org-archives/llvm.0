Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05376AA2
	for <llvm@lists.linux.dev>; Mon, 19 Sep 2022 17:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161FEC433C1;
	Mon, 19 Sep 2022 17:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663606864;
	bh=ndqY5FLt8PS+6wqOA5dNQKv0CB8+ASxY+mAY38er7ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iWf/P8b9Mdeo/cDhdxz0uuWA1HWslgr6fHTsyUwNN0vvtOI2hVPJZ+CaJ51B2fBLA
	 RZiQfXvLrqws8kVAmMB2fg5+pPJ2fdJZy4lZl7B4KcNFiIXZfCFEyACB8i/sNoqVNR
	 la83Ts7AdXs/yH2aCXwA+/ghWwo/SzKdLtXjD3CFV+7e3NPotq658ivALs6RAuOnIa
	 eYoNjLu0tNb7Q8nQB6DDcFoXcIwNWILtTc6zkGA7aRdTemY+uiHZaYbDiBF9vWePs5
	 40nwdy6CzJTn2HeFvlMUrC06pWhsM7trutltJ7Yk62pYgUpSYgoYyaYAiDC0ODdsRQ
	 DDQxiqm8R0yRw==
Date: Mon, 19 Sep 2022 10:01:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, james.morse@arm.com, joey.gouly@arm.com,
	maz@kernel.org, will@kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 7/8] arm64: alternatives: add
 alternative_has_feature_*()
Message-ID: <YyigTrxhE3IRPzjs@dev-arch.thelio-3990X>
References: <20220912162210.3626215-1-mark.rutland@arm.com>
 <20220912162210.3626215-8-mark.rutland@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912162210.3626215-8-mark.rutland@arm.com>

Hi Mark,

On Mon, Sep 12, 2022 at 05:22:09PM +0100, Mark Rutland wrote:
> Currrently we use a mixture of alternative sequences and static branches
> to handle features detected at boot time. For ease of maintenance we
> generally prefer to use static branches in C code, but this has a few
> downsides:
> 
> * Each static branch has metadata in the __jump_table section, which is
>   not discarded after features are finalized. This wastes some space,
>   and slows down the patching of other static branches.
> 
> * The static branches are patched at a different point in time from the
>   alternatives, so changes are not atomic. This leaves a transient
>   period where there could be a mismatch between the behaviour of
>   alternatives and static branches, which could be problematic for some
>   features (e.g. pseudo-NMI).
> 
> * More (instrumentable) kernel code is executed to patch each static
>   branch, which can be risky when patching certain features (e.g.
>   irqflags management for pseudo-NMI).
> 
> * When CONFIG_JUMP_LABEL=n, static branches are turned into a load of a
>   flag and a conditional branch. This means it isn't safe to use such
>   static branches in an alternative address space (e.g. the NVHE/PKVM
>   hyp code), where the generated address isn't safe to acccess.
> 
> To deal with these issues, this patch introduces new
> alternative_has_feature_*() helpers, which work like static branches but
> are patched using alternatives. This ensures the patching is performed
> at the same time as other alternative patching, allows the metadata to
> be freed after patching, and is safe for use in alternative address
> spaces.
> 
> Note that all supported toolchains have asm goto support, and since
> commit:
> 
>   a0a12c3ed057af57 ("asm goto: eradicate CC_HAS_ASM_GOTO)"
> 
> ... the CC_HAS_ASM_GOTO Kconfig symbol has been removed, so no feature
> check is necessary, and we can always make use of asm goto.
> 
> Additionally, note that:
> 
> * This has no impact on cpus_have_cap(), which is a dynamic check.
> 
> * This has no functional impact on cpus_have_const_cap(). The branches
>   are patched slightly later than before this patch, but these branches
>   are not reachable until caps have been finalised.
> 
> * It is now invalid to use cpus_have_final_cap() in the window between
>   feature detection and patching. All existing uses are only expected
>   after patching anyway, so this should not be a problem.
> 
> * The LSE atomics will now be enabled during alternatives patching
>   rather than immediately before. As the LL/SC an LSE atomics are
>   functionally equivalent this should not be problematic.
> 
> When building defconfig with GCC 12.1.0, the resulting Image is 64KiB
> smaller:
> 
> | % ls -al Image-*
> | -rw-r--r-- 1 mark mark 37108224 Aug 23 09:56 Image-after
> | -rw-r--r-- 1 mark mark 37173760 Aug 23 09:54 Image-before
> 
> According to bloat-o-meter.pl:
> 
> | add/remove: 44/34 grow/shrink: 602/1294 up/down: 39692/-61108 (-21416)
> | Function                                     old     new   delta
> | [...]
> | Total: Before=16618336, After=16596920, chg -0.13%
> | add/remove: 0/2 grow/shrink: 0/0 up/down: 0/-1296 (-1296)
> | Data                                         old     new   delta
> | arm64_const_caps_ready                        16       -     -16
> | cpu_hwcap_keys                              1280       -   -1280
> | Total: Before=8987120, After=8985824, chg -0.01%
> | add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
> | RO Data                                      old     new   delta
> | Total: Before=18408, After=18408, chg +0.00%
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Joey Gouly <joey.gouly@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/alternative-macros.h | 41 +++++++++++++++++++++
>  arch/arm64/include/asm/cpufeature.h         |  7 ++--
>  arch/arm64/include/asm/lse.h                |  5 +--
>  arch/arm64/kernel/cpufeature.c              | 25 -------------
>  arch/arm64/kernel/image-vars.h              |  4 --
>  5 files changed, 46 insertions(+), 36 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/alternative-macros.h b/arch/arm64/include/asm/alternative-macros.h
> index 189c31be163ce..eaba9ec127897 100644
> --- a/arch/arm64/include/asm/alternative-macros.h
> +++ b/arch/arm64/include/asm/alternative-macros.h
> @@ -213,4 +213,45 @@ alternative_endif
>  #define ALTERNATIVE(oldinstr, newinstr, ...)   \
>  	_ALTERNATIVE_CFG(oldinstr, newinstr, __VA_ARGS__, 1)
>  
> +#ifndef __ASSEMBLY__
> +
> +#include <linux/bug.h>
> +#include <linux/types.h>
> +
> +static __always_inline bool
> +alternative_has_feature_likely(unsigned long feature)
> +{
> +	BUILD_BUG_ON(feature >= ARM64_NCAPS);
> +
> +	asm_volatile_goto(
> +	ALTERNATIVE("b	%l[l_no]", "nop", %[feature])
> +	:
> +	: [feature] "i" (feature)
> +	:
> +	: l_no);
> +
> +	return true;
> +l_no:
> +	return false;
> +}
> +
> +static __always_inline bool
> +alternative_has_feature_unlikely(unsigned long feature)
> +{
> +	BUILD_BUG_ON(feature >= ARM64_NCAPS);
> +
> +	asm_volatile_goto(
> +	ALTERNATIVE("nop", "b	%l[l_yes]", %[feature])
> +	:
> +	: [feature] "i" (feature)
> +	:
> +	: l_yes);
> +
> +	return false;
> +l_yes:
> +	return true;
> +}
> +
> +#endif /* __ASSEMBLY__ */
> +
>  #endif /* __ASM_ALTERNATIVE_MACROS_H */

The addition of BUILD_BUG_ON() in these functions ends up blowing up
when building with clang + CONFIG_LTO:

  In file included from kernel/bounds.c:10:
  In file included from ./include/linux/page-flags.h:10:
  In file included from ./include/linux/bug.h:5:
  In file included from ./arch/arm64/include/asm/bug.h:26:
  In file included from ./include/asm-generic/bug.h:5:
  In file included from ./include/linux/compiler.h:248:
  In file included from ./arch/arm64/include/asm/rwonce.h:11:
  ./arch/arm64/include/asm/alternative-macros.h:224:2: error: call to undeclared function 'BUILD_BUG_ON'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
          BUILD_BUG_ON(feature >= ARM64_NCAPS);
          ^
  ./arch/arm64/include/asm/alternative-macros.h:241:2: error: call to undeclared function 'BUILD_BUG_ON'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
          BUILD_BUG_ON(feature >= ARM64_NCAPS);
          ^
  2 errors generated.

As you can see from the include chain, alternative-macros.h can end up
being included from bug.h through compiler.h and rwonce.h, which will be
before the definition of BUILD_BUG_ON() in build_bug.h, so it does not
get expanded by the preprocessor. I could not come up with a clean
solution other than moving these functions into their own header so that
they do not appear in the alternative-macros.h include path (see below).
Would that be acceptable (the file name is a placeholder, I could not
come up with anything better) or do you have any other suggestions?
Another solution that might work is open coding these BUILD_BUG_ON()
calls with compiletime_assert() directly, as that should be available at
this point.

Cheers,
Nathan

diff --git a/arch/arm64/include/asm/alternative-likely.h b/arch/arm64/include/asm/alternative-likely.h
new file mode 100644
index 000000000000..f4e63d65e9eb
--- /dev/null
+++ b/arch/arm64/include/asm/alternative-likely.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_ALTERNATIVE_LIKELY_H
+#define __ASM_ALTERNATIVE_LIKELY_H
+
+#ifndef __ASSEMBLY__
+
+#include <asm/alternative-macros.h>
+#include <linux/bug.h>
+#include <linux/types.h>
+
+static __always_inline bool
+alternative_has_feature_likely(unsigned long feature)
+{
+	BUILD_BUG_ON(feature >= ARM64_NCAPS);
+
+	asm_volatile_goto(
+	ALTERNATIVE_CB("b	%l[l_no]", %[feature], alt_cb_patch_nops)
+	:
+	: [feature] "i" (feature)
+	:
+	: l_no);
+
+	return true;
+l_no:
+	return false;
+}
+
+static __always_inline bool
+alternative_has_feature_unlikely(unsigned long feature)
+{
+	BUILD_BUG_ON(feature >= ARM64_NCAPS);
+
+	asm_volatile_goto(
+	ALTERNATIVE("nop", "b	%l[l_yes]", %[feature])
+	:
+	: [feature] "i" (feature)
+	:
+	: l_yes);
+
+	return false;
+l_yes:
+	return true;
+}
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __ASM_ALTERNATIVE_LIKELY_H */
diff --git a/arch/arm64/include/asm/alternative-macros.h b/arch/arm64/include/asm/alternative-macros.h
index 4a2a98d6d222..189c31be163c 100644
--- a/arch/arm64/include/asm/alternative-macros.h
+++ b/arch/arm64/include/asm/alternative-macros.h
@@ -213,45 +213,4 @@ alternative_endif
 #define ALTERNATIVE(oldinstr, newinstr, ...)   \
 	_ALTERNATIVE_CFG(oldinstr, newinstr, __VA_ARGS__, 1)
 
-#ifndef __ASSEMBLY__
-
-#include <linux/bug.h>
-#include <linux/types.h>
-
-static __always_inline bool
-alternative_has_feature_likely(unsigned long feature)
-{
-	BUILD_BUG_ON(feature >= ARM64_NCAPS);
-
-	asm_volatile_goto(
-	ALTERNATIVE_CB("b	%l[l_no]", %[feature], alt_cb_patch_nops)
-	:
-	: [feature] "i" (feature)
-	:
-	: l_no);
-
-	return true;
-l_no:
-	return false;
-}
-
-static __always_inline bool
-alternative_has_feature_unlikely(unsigned long feature)
-{
-	BUILD_BUG_ON(feature >= ARM64_NCAPS);
-
-	asm_volatile_goto(
-	ALTERNATIVE("nop", "b	%l[l_yes]", %[feature])
-	:
-	: [feature] "i" (feature)
-	:
-	: l_yes);
-
-	return false;
-l_yes:
-	return true;
-}
-
-#endif /* __ASSEMBLY__ */
-
 #endif /* __ASM_ALTERNATIVE_MACROS_H */
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index ba8a47433b5a..147d326c4439 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -6,7 +6,7 @@
 #ifndef __ASM_CPUFEATURE_H
 #define __ASM_CPUFEATURE_H
 
-#include <asm/alternative-macros.h>
+#include <asm/alternative-likely.h>
 #include <asm/cpucaps.h>
 #include <asm/cputype.h>
 #include <asm/hwcap.h>
diff --git a/arch/arm64/include/asm/lse.h b/arch/arm64/include/asm/lse.h
index c503db8e73b0..b28b5cb73387 100644
--- a/arch/arm64/include/asm/lse.h
+++ b/arch/arm64/include/asm/lse.h
@@ -13,7 +13,7 @@
 #include <linux/jump_label.h>
 #include <linux/stringify.h>
 #include <asm/alternative.h>
-#include <asm/alternative-macros.h>
+#include <asm/alternative-likely.h>
 #include <asm/atomic_lse.h>
 #include <asm/cpucaps.h>
 
