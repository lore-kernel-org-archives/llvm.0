Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E31A55
	for <llvm@lists.linux.dev>; Sat,  9 Nov 2024 04:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731126700; cv=none; b=NcR0o+jJXojMgRZlLPzWnsmsiI08in9xuNVFcn4GuiPABgigKF7CDV7y0et+vIPDVfdS1gGX2mP8xE0cTziXevLy877eV5XieDVz3/JzzAJgN7zFXZ0Iqwr2aiOEG2iqn3V82rnhgWOsxNhBV0zQo/rm3FQse0KJN/84MU6dtp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731126700; c=relaxed/simple;
	bh=6P7VTq0iFuBOPj08izo8XoaSip1zS6ftHKfIXdnSoZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TI2/hOosJ/jaezJ4JjJYidmOY4Zm9lUwGQi6crzk1+I0nBiekooiRrGuz4LMZ9QHUOuOkQOt308RF4cEAe8/uC3fcn41NEBVOZJYsgC4RlGwbjUHASbKxjIcGgiuMjmJB98r4doXki16tEshSE2XF8HqHx2mpWHEKc8OltcrJVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXSrPL9g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXSrPL9g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5F9C4CEC6;
	Sat,  9 Nov 2024 04:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731126700;
	bh=6P7VTq0iFuBOPj08izo8XoaSip1zS6ftHKfIXdnSoZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mXSrPL9gP7yTi305m1Lmv3Piv6BOr1R2IpQE/dFq313e8zKv9k0Rq0hf8LGoA01dJ
	 MmvbHeiG9p0b79a+5HqtKFAWVNvBEbCKFJOTTZkvrZzqwcO/JAkNWgEgC57TLQVhYe
	 oFTIPv+zGb8maMiHg7fATs+hI7eJOkOvM8V2r579bwT/E4OhH62SmAvEEQTPddlM4g
	 mpnR2WaDi/5CKdxUNyo+7WxapAhFZ1SlUEbf4cUcyDZMhHGdWeNlvwunIFSvmd6aoR
	 nff3gli1az90++Yb+59o1kIPqi/SVeNXvJeGk6ykKB5RMbpZdWl2LZhIW6n/a9YwPF
	 kpmkfWoQsEXSQ==
Date: Fri, 8 Nov 2024 21:31:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ARM: cfi: Fix compilation corner case
Message-ID: <20241109043138.GA1649953@thelio-3990X>
References: <20241108-fix-kcfi-bug-v1-1-f8497c4bccae@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-fix-kcfi-bug-v1-1-f8497c4bccae@linaro.org>

On Fri, Nov 08, 2024 at 08:37:36AM +0100, Linus Walleij wrote:
> When enabling expert mode CONFIG_EXPERT and using that power
> user mode to disable the branch prediction hardening
> !CONFIG_HARDEN_BRANCH_PREDICTOR, the picky assembly linker
> in CLANG notices that some assembly in proc-v7.S does
> not have corresponding C call sites, i.e. the prototypes
> in proc-v7-bugs.c are enclosed in ifdef
> CONFIG_HARDEN_BRANCH_PREDICTOR so this assembly:
> 
> SYM_TYPED_FUNC_START(cpu_v7_smc_switch_mm)
> SYM_TYPED_FUNC_START(cpu_v7_hvc_switch_mm)
> 
> Results in:
> 
> ld.lld: error: undefined symbol: __kcfi_typeid_cpu_v7_smc_switch_mm
> >>> referenced by proc-v7.S:94 (.../arch/arm/mm/proc-v7.S:94)
> >>> arch/arm/mm/proc-v7.o:(.text+0x108) in archive vmlinux.a
> 
> ld.lld: error: undefined symbol: __kcfi_typeid_cpu_v7_hvc_switch_mm
> >>> referenced by proc-v7.S:105 (.../arch/arm/mm/proc-v7.S:105)
> >>> arch/arm/mm/proc-v7.o:(.text+0x124) in archive vmlinux.a
> 
> Fix this by adding an additional requirement that
> CONFIG_HARDEN_BRANCH_PREDICTOR has to be enabled to compile
> these assembly calls.
> 
> I suppose it wasn't a problem before because the linker is not
> so picky that other assembly symbols are actually being
> used.

I think this has been a problem since the original CFI change, so I
think it is worth dropping this block; it is more likely that
CONFIG_HARDEN_BRANCH_PREDICTOR is not often disabled outside of
randconfig, so it is hard to hit this issue in practice. As far as I can
tell, this is totally expected with the given configuration.
SYM_TYPED_FUNC_START makes use of __kcfi_typeid_<func>, which the
compiler generates for address-taken function declarations, but in this
configuration, cpu_v7_smc_switch_mm() and cpu_v7_hvc_switch_mm() have no
actual uses aside from their definition, so the compiler does not
generate these symbols, resulting in the link time error above. Perhaps
some of this could be encorporated into the beginning of the commit
message to make the issue a little more clear and less like the compiler
is at fault here ("the picky assembly linker" stands out a bit to me
there).

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411041456.ZsoEiD7T-lkp@intel.com/
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Regardless of the commit message nits, this seems like the right thing
to do.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/arm/mm/proc-v7.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
> index 5fb9a6aecb00..2cd933342679 100644
> --- a/arch/arm/mm/proc-v7.S
> +++ b/arch/arm/mm/proc-v7.S
> @@ -94,7 +94,7 @@ SYM_TYPED_FUNC_START(cpu_v7_dcache_clean_area)
>  	ret	lr
>  SYM_FUNC_END(cpu_v7_dcache_clean_area)
>  
> -#ifdef CONFIG_ARM_PSCI
> +#if defined(CONFIG_ARM_PSCI) && defined(CONFIG_HARDEN_BRANCH_PREDICTOR)
>  	.arch_extension sec
>  SYM_TYPED_FUNC_START(cpu_v7_smc_switch_mm)
>  	stmfd	sp!, {r0 - r3}
> 
> ---
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> change-id: 20241107-fix-kcfi-bug-ae3b08cbc167
> 
> Best regards,
> -- 
> Linus Walleij <linus.walleij@linaro.org>
> 
