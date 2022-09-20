Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8931C14
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 13:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83DAC433C1;
	Tue, 20 Sep 2022 13:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663680678;
	bh=F3hAN7VsAKea35iH5axTvSeh2ieoDiMwjetwOG0ISMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KN4EFNzkfXXNvii6HTn/8WvmkvWtgm0DX4U730xYP31ywS+JUd9pLqvr1S/OQbuUs
	 IB8MdzUVYaSsdWNYd7TYqdO3/JZUczc9MrYaffi5lgNs6wQ7etGu0Mk0olvhoHc7gQ
	 aRcqBZJsPbRh8454nYXSWB0UenPlJjGRGBvXeAYX/IAKXc9/NGd/XZy/l3Se/0Mxv/
	 tF/S668jfDUln8zu/EvvTGPBCgygmF/veJEwXMN8PoncJeqfNi66Xmg+/tYRkOdJK+
	 jSxC00oxTH87HBOAmaibB5NQ+9+j7Yz3+6ZEKpsxoROntpjsvVcE+xsSs+0pCNKLZb
	 rgGJ8jo2DtIuQ==
Date: Tue, 20 Sep 2022 06:31:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, james.morse@arm.com, joey.gouly@arm.com,
	maz@kernel.org, will@kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 7/8] arm64: alternatives: add
 alternative_has_feature_*()
Message-ID: <YynApGi0uEX0lvq3@dev-arch.thelio-3990X>
References: <20220912162210.3626215-1-mark.rutland@arm.com>
 <20220912162210.3626215-8-mark.rutland@arm.com>
 <YyigTrxhE3IRPzjs@dev-arch.thelio-3990X>
 <Yymtd+8GH+GahbDn@FVFF77S0Q05N>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yymtd+8GH+GahbDn@FVFF77S0Q05N>

On Tue, Sep 20, 2022 at 01:09:27PM +0100, Mark Rutland wrote:
> On Mon, Sep 19, 2022 at 10:01:02AM -0700, Nathan Chancellor wrote:
> > Hi Mark,
> 
> Hi Nathan,
> 
> > > diff --git a/arch/arm64/include/asm/alternative-macros.h b/arch/arm64/include/asm/alternative-macros.h
> > > index 189c31be163ce..eaba9ec127897 100644
> > > --- a/arch/arm64/include/asm/alternative-macros.h
> > > +++ b/arch/arm64/include/asm/alternative-macros.h
> > > @@ -213,4 +213,45 @@ alternative_endif
> > >  #define ALTERNATIVE(oldinstr, newinstr, ...)   \
> > >  	_ALTERNATIVE_CFG(oldinstr, newinstr, __VA_ARGS__, 1)
> > >  
> > > +#ifndef __ASSEMBLY__
> > > +
> > > +#include <linux/bug.h>
> > > +#include <linux/types.h>
> > > +
> > > +static __always_inline bool
> > > +alternative_has_feature_likely(unsigned long feature)
> > > +{
> > > +	BUILD_BUG_ON(feature >= ARM64_NCAPS);
> > > +
> > > +	asm_volatile_goto(
> > > +	ALTERNATIVE("b	%l[l_no]", "nop", %[feature])
> > > +	:
> > > +	: [feature] "i" (feature)
> > > +	:
> > > +	: l_no);
> > > +
> > > +	return true;
> > > +l_no:
> > > +	return false;
> > > +}
> > > +
> > > +static __always_inline bool
> > > +alternative_has_feature_unlikely(unsigned long feature)
> > > +{
> > > +	BUILD_BUG_ON(feature >= ARM64_NCAPS);
> > > +
> > > +	asm_volatile_goto(
> > > +	ALTERNATIVE("nop", "b	%l[l_yes]", %[feature])
> > > +	:
> > > +	: [feature] "i" (feature)
> > > +	:
> > > +	: l_yes);
> > > +
> > > +	return false;
> > > +l_yes:
> > > +	return true;
> > > +}
> > > +
> > > +#endif /* __ASSEMBLY__ */
> > > +
> > >  #endif /* __ASM_ALTERNATIVE_MACROS_H */
> > 
> > The addition of BUILD_BUG_ON() in these functions ends up blowing up
> > when building with clang + CONFIG_LTO:
> > 
> >   In file included from kernel/bounds.c:10:
> >   In file included from ./include/linux/page-flags.h:10:
> >   In file included from ./include/linux/bug.h:5:
> >   In file included from ./arch/arm64/include/asm/bug.h:26:
> >   In file included from ./include/asm-generic/bug.h:5:
> >   In file included from ./include/linux/compiler.h:248:
> >   In file included from ./arch/arm64/include/asm/rwonce.h:11:
> >   ./arch/arm64/include/asm/alternative-macros.h:224:2: error: call to undeclared function 'BUILD_BUG_ON'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> >           BUILD_BUG_ON(feature >= ARM64_NCAPS);
> >           ^
> >   ./arch/arm64/include/asm/alternative-macros.h:241:2: error: call to undeclared function 'BUILD_BUG_ON'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> >           BUILD_BUG_ON(feature >= ARM64_NCAPS);
> >           ^
> >   2 errors generated.
> > 
> > As you can see from the include chain, alternative-macros.h can end up
> > being included from bug.h through compiler.h and rwonce.h, which will be
> > before the definition of BUILD_BUG_ON() in build_bug.h, so it does not
> > get expanded by the preprocessor.
> 
> Sorry for this!

Totally okay, these include chains have bit us before :)

> > I could not come up with a clean solution other than moving these functions
> > into their own header so that they do not appear in the alternative-macros.h
> > include path (see below).  Would that be acceptable (the file name is a
> > placeholder, I could not come up with anything better) or do you have any
> > other suggestions?
> 
> I think that'd be ok; I'd suggest `alternative_branch.h` if we do that...
> 
> > Another solution that might work is open coding these BUILD_BUG_ON()
> > calls with compiletime_assert() directly, as that should be available at
> > this point.
> 
> ... but this sounds slightly nicer to me. We already use
> compiletime_assert_atomic_type() elsewhere, so we're already relying on
> compiletime_assert(), and the diff looks simple enough:

This diff looks a lot better to me too. I build tested it against
defconfig and allmodconfig, with and without CONFIG_LTO_CLANG_THIN and I
saw no additional failures. If you send it along formally, please feel
free to add:

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---->8----
> diff --git a/arch/arm64/include/asm/alternative-macros.h b/arch/arm64/include/asm/alternative-macros.h
> index 4a2a98d6d2227..966767debaa3a 100644
> --- a/arch/arm64/include/asm/alternative-macros.h
> +++ b/arch/arm64/include/asm/alternative-macros.h
> @@ -215,13 +215,13 @@ alternative_endif
>  
>  #ifndef __ASSEMBLY__
>  
> -#include <linux/bug.h>
>  #include <linux/types.h>
>  
>  static __always_inline bool
>  alternative_has_feature_likely(unsigned long feature)
>  {
> -       BUILD_BUG_ON(feature >= ARM64_NCAPS);
> +       compiletime_assert(feature < ARM64_NCAPS,
> +                          "feature must be < ARM64_NCAPS");
>  
>         asm_volatile_goto(
>         ALTERNATIVE_CB("b       %l[l_no]", %[feature], alt_cb_patch_nops)
> @@ -238,7 +238,8 @@ alternative_has_feature_likely(unsigned long feature)
>  static __always_inline bool
>  alternative_has_feature_unlikely(unsigned long feature)
>  {
> -       BUILD_BUG_ON(feature >= ARM64_NCAPS);
> +       compiletime_assert(feature < ARM64_NCAPS,
> +                          "feature must be < ARM64_NCAPS");
>  
>         asm_volatile_goto(
>         ALTERNATIVE("nop", "b   %l[l_yes]", %[feature])
> ---->8----
> 
> ... and seems to work in a local build test (with LLVM 14.0.0 and LTO_THIN).
> 
> If that sounds ok to you I can spin that as a patch shortly.
> 
> Thanks,
> Mark.
> 
> > 
> > Cheers,
> > Nathan
> > 
> > diff --git a/arch/arm64/include/asm/alternative-likely.h b/arch/arm64/include/asm/alternative-likely.h
> > new file mode 100644
> > index 000000000000..f4e63d65e9eb
> > --- /dev/null
> > +++ b/arch/arm64/include/asm/alternative-likely.h
> > @@ -0,0 +1,47 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef __ASM_ALTERNATIVE_LIKELY_H
> > +#define __ASM_ALTERNATIVE_LIKELY_H
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +#include <asm/alternative-macros.h>
> > +#include <linux/bug.h>
> > +#include <linux/types.h>
> > +
> > +static __always_inline bool
> > +alternative_has_feature_likely(unsigned long feature)
> > +{
> > +	BUILD_BUG_ON(feature >= ARM64_NCAPS);
> > +
> > +	asm_volatile_goto(
> > +	ALTERNATIVE_CB("b	%l[l_no]", %[feature], alt_cb_patch_nops)
> > +	:
> > +	: [feature] "i" (feature)
> > +	:
> > +	: l_no);
> > +
> > +	return true;
> > +l_no:
> > +	return false;
> > +}
> > +
> > +static __always_inline bool
> > +alternative_has_feature_unlikely(unsigned long feature)
> > +{
> > +	BUILD_BUG_ON(feature >= ARM64_NCAPS);
> > +
> > +	asm_volatile_goto(
> > +	ALTERNATIVE("nop", "b	%l[l_yes]", %[feature])
> > +	:
> > +	: [feature] "i" (feature)
> > +	:
> > +	: l_yes);
> > +
> > +	return false;
> > +l_yes:
> > +	return true;
> > +}
> > +
> > +#endif /* __ASSEMBLY__ */
> > +
> > +#endif /* __ASM_ALTERNATIVE_LIKELY_H */
> > diff --git a/arch/arm64/include/asm/alternative-macros.h b/arch/arm64/include/asm/alternative-macros.h
> > index 4a2a98d6d222..189c31be163c 100644
> > --- a/arch/arm64/include/asm/alternative-macros.h
> > +++ b/arch/arm64/include/asm/alternative-macros.h
> > @@ -213,45 +213,4 @@ alternative_endif
> >  #define ALTERNATIVE(oldinstr, newinstr, ...)   \
> >  	_ALTERNATIVE_CFG(oldinstr, newinstr, __VA_ARGS__, 1)
> >  
> > -#ifndef __ASSEMBLY__
> > -
> > -#include <linux/bug.h>
> > -#include <linux/types.h>
> > -
> > -static __always_inline bool
> > -alternative_has_feature_likely(unsigned long feature)
> > -{
> > -	BUILD_BUG_ON(feature >= ARM64_NCAPS);
> > -
> > -	asm_volatile_goto(
> > -	ALTERNATIVE_CB("b	%l[l_no]", %[feature], alt_cb_patch_nops)
> > -	:
> > -	: [feature] "i" (feature)
> > -	:
> > -	: l_no);
> > -
> > -	return true;
> > -l_no:
> > -	return false;
> > -}
> > -
> > -static __always_inline bool
> > -alternative_has_feature_unlikely(unsigned long feature)
> > -{
> > -	BUILD_BUG_ON(feature >= ARM64_NCAPS);
> > -
> > -	asm_volatile_goto(
> > -	ALTERNATIVE("nop", "b	%l[l_yes]", %[feature])
> > -	:
> > -	: [feature] "i" (feature)
> > -	:
> > -	: l_yes);
> > -
> > -	return false;
> > -l_yes:
> > -	return true;
> > -}
> > -
> > -#endif /* __ASSEMBLY__ */
> > -
> >  #endif /* __ASM_ALTERNATIVE_MACROS_H */
> > diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> > index ba8a47433b5a..147d326c4439 100644
> > --- a/arch/arm64/include/asm/cpufeature.h
> > +++ b/arch/arm64/include/asm/cpufeature.h
> > @@ -6,7 +6,7 @@
> >  #ifndef __ASM_CPUFEATURE_H
> >  #define __ASM_CPUFEATURE_H
> >  
> > -#include <asm/alternative-macros.h>
> > +#include <asm/alternative-likely.h>
> >  #include <asm/cpucaps.h>
> >  #include <asm/cputype.h>
> >  #include <asm/hwcap.h>
> > diff --git a/arch/arm64/include/asm/lse.h b/arch/arm64/include/asm/lse.h
> > index c503db8e73b0..b28b5cb73387 100644
> > --- a/arch/arm64/include/asm/lse.h
> > +++ b/arch/arm64/include/asm/lse.h
> > @@ -13,7 +13,7 @@
> >  #include <linux/jump_label.h>
> >  #include <linux/stringify.h>
> >  #include <asm/alternative.h>
> > -#include <asm/alternative-macros.h>
> > +#include <asm/alternative-likely.h>
> >  #include <asm/atomic_lse.h>
> >  #include <asm/cpucaps.h>
> >  
