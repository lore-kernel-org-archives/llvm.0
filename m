Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BA77B
	for <llvm@lists.linux.dev>; Mon,  6 Feb 2023 16:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640B3C433EF;
	Mon,  6 Feb 2023 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675701831;
	bh=pR/hbXRdH1c79JWfWDYATb/rwLTprJ7HY8h1L/YDg10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eOgFjMo5S6FnrCCiRq/du1k7v2MEJjmIx0C175irBA7P635eCxuUnyHUTnwZvTnhx
	 +n2QYdyecGR4xhKmzyPwu0J4mrBoiYlwsfNQ7tq2zkSzgHfL/BCg1bDbazMO8Jzvv7
	 xj/RBW0fNiiWhD9CQwu0HfEM5NbxwliIKCInVwxBMTE52Exj/lXNLZdW8tkxGpfHIL
	 ah3EJvQrrgMvO3M8YAVoCSA+b1/yTIrH6EPXiqyExu6dit0PrT+mc0rMxZrpu+DgaN
	 UJueo0mqwKbDYc9UW5w8Z24AwXMu+FjLSyHG6lGxWuMxX8FXHiYXNfxZ2mXZtY1qBt
	 uiF+sjmYiueDQ==
Date: Mon, 6 Feb 2023 09:43:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, arnd@linaro.org
Subject: Re: [TCWG CI] Failure after v6.1.8-105-gf5e58b546cbe: drm/panfrost:
 fix GENERIC_ATOMIC64 dependency
Message-ID: <Y+EuRS3YDD8XbHgo@dev-arch.thelio-3990X>
References: <1896363883.10092.1675654927497@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1896363883.10092.1675654927497@jenkins.jenkins>

Hi,

On Mon, Feb 06, 2023 at 03:42:06AM +0000, ci_notify@linaro.org wrote:
> Failure after v6.1.8-105-gf5e58b546cbe: drm/panfrost: fix GENERIC_ATOMIC64 dependency:
> 
> Results changed to
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 23010
> # First few build errors in logs:
> # 00:31:22 ./include/linux/fortify-string.h:543:4: error: call to '__read_overflow' declared with 'error' attribute: detected read beyond size of object (1st parameter)
> # 00:31:23 make[4]: *** [scripts/Makefile.build:250: drivers/infiniband/core/cma.o] Error 1
> # 00:31:55 make[3]: *** [scripts/Makefile.build:500: drivers/infiniband/core] Error 2
> # 00:31:55 make[2]: *** [scripts/Makefile.build:500: drivers/infiniband] Error 2
> # 00:32:29 make[1]: *** [scripts/Makefile.build:500: drivers] Error 2
> # 00:32:29 make: *** [Makefile:2005: .] Error 2
> 
> from
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 23021
> 
> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
> 
> For latest status see comments in https://linaro.atlassian.net/browse/LLVM-647 .
> Status of v6.1.8-105-gf5e58b546cbe commit for tcwg_kernel:
> commit f5e58b546cbe76f049df97570cf0580aaaf3f900
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Tue Jan 17 17:44:43 2023 +0100
> 
>     drm/panfrost: fix GENERIC_ATOMIC64 dependency
>     
>     [ Upstream commit 6437a549ae178a3f5a5c03e983f291ebcdc2bbc7 ]
>     
>     On ARMv5 and earlier, a randconfig build can still run into
>     
>     WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
>       Depends on [n]: IOMMU_SUPPORT [=y] && (ARM [=y] || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
>       Selected by [y]:
>       - DRM_PANFROST [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARM [=y] || ARM64 || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=y]) && MMU [=y]
>     
>     Rework the dependencies to always require a working cmpxchg64.
>     
>     Fixes: db594ba3fcf9 ("drm/panfrost: depend on !GENERIC_ATOMIC64 when using COMPILE_TEST")
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>     Reviewed-by: Steven Price <steven.price@arm.com>
>     Signed-off-by: Steven Price <steven.price@arm.com>
>     Link: https://patchwork.freedesktop.org/patch/msgid/20230117164456.1591901-1-arnd@kernel.org
>     Signed-off-by: Sasha Levin <sashal@kernel.org>

Not an issue with this patch, it is a compiler issue:

https://github.com/ClangBuiltLinux/linux/issues/1687

A recent change in LLVM made this failure more likely but it has been
around for a while in certain configurations. I am guessing the
bisection landed on this change because it fixes one problem while
exposing another.

Cheers,
Nathan
