Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEB03204
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 15:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57E9C385A4;
	Tue,  3 May 2022 15:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651592059;
	bh=VqIlEqEbZ+xZhr6crxUY9DNMWXRl3djbnBGfWQmcHOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PxzOIt6WRGY5YE/+TuJJbBHO4BLyhbbFkRwYet5xV1BzYFPPXbjUlNfqCyBlPqHO1
	 CIpGuNbOwIepe9BkRD/Gvb4SH8F02yN3K74uqRnAn2IYeyAawdzl49oLN8TGnXB3f2
	 RhUr/hOf+KoVo8ef+BBq1NFDKb+pkhIKHL3A7JSzfBWygR0g0rHHiHxO55n3z0YCUc
	 5eX3gcNMa18jT30q7w3mcTi+GmeyB9bY2dFTXmbsQfIh5wGJl6NzX8lRxOIrh5zdX+
	 csZee80+EI7AnUAh7uC+YSzzdVXLi3N2UTzBHbDnlbhN2JL5fq5NDH4bIcNnetttqj
	 wnv4hAQ1XeqUA==
Date: Tue, 3 May 2022 08:34:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Nikita Popov <npopov@redhat.com>, llvm@lists.linux.dev,
	ci_notify@linaro.org
Subject: Re: [TCWG CI] Regression caused by llvm: [GVN] Encode GEPs in offset
 representation
Message-ID: <YnFLeL93iHk+3vBd@dev-arch.thelio-3990X>
References: <962475179.3377.1651244787786@jenkins.jenkins>
 <CAKwvOdkR3tVWo9iGLryoAzY4x7BfDMCLDSx9jnd+p7-hKXD5qg@mail.gmail.com>
 <7230BF09-41E5-44C7-A3B4-C1FD017C277C@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7230BF09-41E5-44C7-A3B4-C1FD017C277C@linaro.org>

Hi Maxim,

On Tue, May 03, 2022 at 04:35:04PM +0300, Maxim Kuvyrkov wrote:
> > On Apr 29, 2022, at 8:20 PM, Nick Desaulniers <ndesaulniers@google.com> wrote:
> > 
> > On Fri, Apr 29, 2022 at 8:06 AM <ci_notify@linaro.org> wrote:
> >> 
> >> [TCWG CI] Regression caused by llvm: [GVN] Encode GEPs in offset representation:
> >> commit b9dc5651477b4c3c132662e763308b27963248a9
> >> Author: Nikita Popov <npopov@redhat.com>
> >> 
> >> [GVN] Encode GEPs in offset representation
> >> 
> >> Results regressed to
> >> # reset_artifacts:
> >> -10
> >> # build_abe binutils:
> >> -9
> >> # build_llvm:
> >> -5
> >> # build_abe qemu:
> >> -2
> >> # linux_n_obj:
> >> 22258
> >> # First few build errors in logs:
> >> # 00:02:56 arch/arm/lib/xor-neon.c:30:2: error: This code requires at least version 4.6 of GCC [-Werror,-W#warnings]
> > 
> > Hi Maxim, can you please confirm this is the correct result of the
> > bisection? The above warning on the kernel is a known issue that has
> > been fixed upstream. Are the kernel builds not against mainline?
> > 
> > I believe the below are known issues as well.
> 
> Hi Nick,
> 
> See below ...
> 
> > 
> >> # 00:02:56 make[1]: *** [scripts/Makefile.build:288: arch/arm/lib/xor-neon.o] Error 1
> >> # 00:02:56 make: *** [Makefile:1831: arch/arm/lib] Error 2
> >> # 00:03:54 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
> >> # 00:03:54 make[1]: *** [scripts/Makefile.build:288: crypto/wp512.o] Error 1
> >> # 00:06:35 make: *** [Makefile:1831: crypto] Error 2
> >> # 00:11:56 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size (1040) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-than]
> >> # 00:11:56 make[4]: *** [scripts/Makefile.build:288: drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
> >> # 00:12:06 make[3]: *** [scripts/Makefile.build:550: drivers/gpu/drm/selftests] Error 2
> >> # 00:30:12 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3043:6: error: stack frame size (1432) exceeds limit (1024) in 'bw_calcs' [-Werror,-Wframe-larger-than]
> >> 
> >> from
> >> # reset_artifacts:
> >> -10
> >> # build_abe binutils:
> >> -9
> >> # build_llvm:
> >> -5
> >> # build_abe qemu:
> >> -2
> >> # linux_n_obj:
> >> 22260
> >> 
> >> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
> >> 
> >> This commit has regressed these CI configurations:
> >> - tcwg_kernel/llvm-master-arm-stable-allmodconfig
> 
> This is reported against "stable" Linux tree, aka linux-rolling-stable branch [1].  So yeah, it's not a report about a new regression, but rather a report about regression reaching a stable branch.
> 
> Does this answer your question?  Or is the report still looks not right?

I think what Nick is getting at (or at least where I was confused by the
initial report) is that these warnings (or errors with CONFIG_WERROR, in
this case) have always been present in this configuration in the
linux-rolling-stable branch, so I would not have expected these being
present to trigger a regression report for LLVM.  In fact, the "last
good" build has the exact same errors and results as the "first bad"
build, with the LLVM hash being the only variable from what I can tell,
so I would not expect a report to be generated in that case, but I don't
know the conditions under which bisection starts.

Cheers,
Nathan
