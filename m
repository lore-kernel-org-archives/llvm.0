Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282C63C05
	for <llvm@lists.linux.dev>; Fri, 21 Oct 2022 16:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3DAC433D6;
	Fri, 21 Oct 2022 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666368373;
	bh=d+RQViHBNozSfSewYG8uHxYw17M1OeSizbHCJSkl61U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dniWlnDt2TDtart5T4StcSPwOSyho0nRul66IBG3LH3nC8vGXY9km47vbS4jNWZoS
	 dylRZ/Lu6ugaCdrOgWAGlA3fJ6ntguVx8HZDqVPeUQjn3oNeelq6Po4lYV0EhaWmVH
	 SQhEfh1hAR2WPmX+3jwxD/Rc4LqLcrRpP6NdGjQgF81Lw4n2WmM87eYsmdKllEjNxt
	 gjCfgkAK70/KoteWMqVlfq9F9LZPdL3A/54//IiA5a3JqLyAA+bT7A1I2b3lELMmmj
	 yrBI3Zu6unqiWtGlD+1SeBaUlt40gV7jR+/JZiPxKdcZpB1iHgVue7fcZ+8EVvzlHB
	 HV2WzNhN/7+EA==
Date: Fri, 21 Oct 2022 09:06:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: keescook@chromium.org, luc.vanoostenryck@gmail.com,
	ndesaulniers@google.com, trix@redhat.com, dlatypov@google.com,
	vitor@massaru.org, gustavoars@kernel.org,
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev,
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
	airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-sparse@vger.kernel.org, arnd@kernel.org, mchehab@kernel.org,
	mauro.chehab@linux.intel.com
Subject: Re: [PATCH v4] overflow: Introduce overflows_type() and
 castable_to_type()
Message-ID: <Y1LDctjps1M8MuK8@dev-arch.thelio-3990X>
References: <20220926191109.1803094-1-keescook@chromium.org>
 <20221021083333.646269-1-gwan-gyeong.mun@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021083333.646269-1-gwan-gyeong.mun@intel.com>

Hi Gwan-gyeong,

On Fri, Oct 21, 2022 at 11:33:33AM +0300, Gwan-gyeong Mun wrote:
> From: Kees Cook <keescook@chromium.org>
> 
> Implement a robust overflows_type() macro to test if a variable or
> constant value would overflow another variable or type. This can be
> used as a constant expression for static_assert() (which requires a
> constant expression[1][2]) when used on constant values. This must be
> constructed manually, since __builtin_add_overflow() does not produce
> a constant expression[3].
> 
> Additionally adds castable_to_type(), similar to __same_type(), but for
> checking if a constant value would overflow if cast to a given type.
> 
> Add unit tests for overflows_type(), __same_type(), and castable_to_type()
> to the existing KUnit "overflow" test.
> 
> [1] https://en.cppreference.com/w/c/language/_Static_assert
> [2] C11 standard (ISO/IEC 9899:2011): 6.7.10 Static assertions
> [3] https://gcc.gnu.org/onlinedocs/gcc/Integer-Overflow-Builtins.html
>     6.56 Built-in Functions to Perform Arithmetic with Overflow Checking
>     Built-in Function: bool __builtin_add_overflow (type1 a, type2 b,
> 
> Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Tom Rix <trix@redhat.com>
> Cc: Daniel Latypov <dlatypov@google.com>
> Cc: Vitor Massaru Iha <vitor@massaru.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-hardening@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>

<snip>

> diff --git a/lib/Makefile b/lib/Makefile
> index 161d6a724ff7..e061aad90539 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -376,6 +376,10 @@ obj-$(CONFIG_CMDLINE_KUNIT_TEST) += cmdline_kunit.o
>  obj-$(CONFIG_SLUB_KUNIT_TEST) += slub_kunit.o
>  obj-$(CONFIG_MEMCPY_KUNIT_TEST) += memcpy_kunit.o
>  obj-$(CONFIG_IS_SIGNED_TYPE_KUNIT_TEST) += is_signed_type_kunit.o
> +# We're expecting to do a lot of "always true" or "always false" tests.
> +ifdef CONFIG_CC_IS_CLANG
> +CFLAGS_overflow_kunit.o += $(call cc-disable-warning, tautological-constant-out-of-range-compare)

If you are going to wrap this in CONFIG_CC_IS_CLANG (which is good),
drop the cc-disable-warning and just disable the warning directly.

CFLAGS_overflow_kunit.o += -Wno-tautological-constant-out-of-range-compare

All kernel supported clang versions support this warning so there is no
point in checking for its existence before disabling it with
cc-disable-warning. scripts/Makefile.extrawarn does this as well.

> +endif
>  obj-$(CONFIG_OVERFLOW_KUNIT_TEST) += overflow_kunit.o
>  CFLAGS_stackinit_kunit.o += $(call cc-disable-warning, switch-unreachable)
>  obj-$(CONFIG_ST&ACKINIT_KUNIT_TEST) += stackinit_kunit.o

Cheers,
Nathan
