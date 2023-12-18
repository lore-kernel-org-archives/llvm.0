Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B621D12F;
	Mon, 18 Dec 2023 18:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AuIRk08S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B97C433CC;
	Mon, 18 Dec 2023 18:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702925844;
	bh=naWCIvEvEYAGR9D+SB7trHx4NFczsGHbAbhUSikK+Iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AuIRk08SsI+UpAyDSVo0ImPh8Fn19MhReuLtOioVxSzWtF1i0+dC5GJGD3swpkezQ
	 QSGB18YfBE5H3m7mAv/Pe75BclcdpDGUhq+8l6EeI8ZdDN1Uog33DF+wk3n7lkTUR5
	 13WTlvMEKY8xrNlyERBRRI67LO2J7II30ZyDqWNXZcjwpShwPg1lxzYQlBFUfxd/f5
	 j4grjaKAHP+2h/W8/9Vsmycgm1RcaZHnK4zdEDp0T7CQwQ+F0tTYUmQclhRiZhY/hI
	 mYDxGY5aFtXSCAJl7Yo+0g+onRqLXwujflynuPrRl0FiQ/rjNr79zWco5wu+HsHPgl
	 VkT3vP2IHOt5Q==
Date: Mon, 18 Dec 2023 11:57:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [drm-xe:drm-xe-next 989/1016]
 drivers/gpu/drm/xe/xe_wait_user_fence.c:46:2: warning: variable 'passed' is
 used uninitialized whenever switch default is taken
Message-ID: <20231218185722.GA2863043@dev-arch.thelio-3990X>
References: <202312170357.KPSinwPs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202312170357.KPSinwPs-lkp@intel.com>

On Sun, Dec 17, 2023 at 03:28:47AM +0800, kernel test robot wrote:
> tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
> head:   c54005fdd0347a17088e7ff78070a55bf9103bc4
> commit: ad7d86415578e1a5deedb0ceed5c281f7367d66d [989/1016] drm/xe: Enable W=1 warnings by default
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231217/202312170357.KPSinwPs-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170357.KPSinwPs-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312170357.KPSinwPs-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    warning: unknown warning option '-Wrestrict' [-Wunknown-warning-option]
>    warning: unknown warning option '-Wpacked-not-aligned'; did you mean '-Wpacked-non-pod'? [-Wunknown-warning-option]
>    warning: unknown warning option '-Wformat-overflow'; did you mean '-Wshift-overflow'? [-Wunknown-warning-option]
>    warning: unknown warning option '-Wformat-truncation' [-Wunknown-warning-option]
>    warning: unknown warning option '-Wstringop-overflow'; did you mean '-Wshift-overflow'? [-Wunknown-warning-option]
>    warning: unknown warning option '-Wstringop-truncation'; did you mean '-Wstring-concatenation'? [-Wunknown-warning-option]

I am not sure why these warnings are even showing up in the first place,
they are wrapped with cc-option, which should be catching that they are
not supported... Is 0day doing something funky with KCFLAGS?
Regardless...

> >> drivers/gpu/drm/xe/xe_wait_user_fence.c:46:2: warning: variable 'passed' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>            default:
>            ^~~~~~~
>    drivers/gpu/drm/xe/xe_wait_user_fence.c:50:9: note: uninitialized use occurs here
>            return passed ? 0 : 1;
>                   ^~~~~~
>    drivers/gpu/drm/xe/xe_wait_user_fence.c:21:13: note: initialize the variable 'passed' to silence this warning
>            bool passed;
>                       ^
>                        = 0
>    7 warnings generated.

I was surprised that this was not caught sooner as
-Wsometimes-uninitialized is a part of -Wall but it looks like
drivers/gpu/drm/xe/Makefile was forked from the i915 Makefile before
commit 43192617f781 ("drm/i915: Enable -Wsometimes-uninitialized") was
added. It is good to see that the warnings are aligned now so that
trivial uninitialized warnings can be caught by clang because they are
disabled for GCC since commit 78a5255ffb6a ("Stop the ad-hoc games with
-Wno-maybe-initialized") in 5.7. Will this be fixed as a separate patch?

Cheers,
Nathan
