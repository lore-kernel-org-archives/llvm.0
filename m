Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF39258E
	for <llvm@lists.linux.dev>; Mon, 23 May 2022 15:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FA6C385A9;
	Mon, 23 May 2022 15:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653318859;
	bh=l1LCYu0hcwtnxmyFXetKIqhcWt+wCgwru2nVCwXYr20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cGjOjW/ARfZens8HRGLxIEIz4y78wXSfLe2BZKH69J9egMjE+rsW3PJRF+7upPXRo
	 yjnwf3iCxdT8mGx+V80gdvV8V96KMQtsjOccAa9UvWXFGtoCqgRu45dgXVAaQaZDJO
	 Xk3y/4sNoDOSIB4QFNEcG5cqP2FvPG/d8Ey7KpSAZariwNXWe8IFiKhr8kAcOSkQ7N
	 FDXgtkYrEjn61dIbl5bl9S+4MftdKX/gKuBdGPvG1edGZaKX6Iv+sG2tzzu2PyFcLe
	 ftKuymqrHWWNjEJQHRZ+vuWcz0HpF1D7WqfgBIWSkbBhaqFKXW0dpFRkrOncNTQAb5
	 8Y+OndQhtvhvw==
Date: Mon, 23 May 2022 08:14:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: Sanjay Patel <spatel@rotateright.com>, llvm@lists.linux.dev
Subject: Re: [TCWG CI] Regression caused by llvm: [InstCombine] fold icmp
 with sub and bool
Message-ID: <YoukyUoa2LfUZ9gw@dev-arch.thelio-3990X>
References: <913191959.251.1653268218351@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <913191959.251.1653268218351@jenkins.jenkins>

On Mon, May 23, 2022 at 01:10:17AM +0000, ci_notify@linaro.org wrote:
> [TCWG CI] Regression caused by llvm: [InstCombine] fold icmp with sub and bool:
> commit 4069cccf3b4ff4afb743d3d371ead9e2d5491e3a
> Author: Sanjay Patel <spatel@rotateright.com>
> 
>     [InstCombine] fold icmp with sub and bool
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
> 546
> # First few build errors in logs:
> # 00:01:23 clang-15: error: clang frontend command failed with exit code 134 (use -v to see invocation)
> # 00:01:23 make[1]: *** [scripts/Makefile.build:295: block/bio.o] Error 134
> # 00:01:32 make: *** [Makefile:2000: block] Error 2
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
> 563
> # linux build successful:
> all
> 
> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
> 
> This commit has regressed these CI configurations:
>  - tcwg_kernel/llvm-master-arm-next-allnoconfig
> 
> First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allnoconfig/3/artifact/artifacts/build-4069cccf3b4ff4afb743d3d371ead9e2d5491e3a/
> Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allnoconfig/3/artifact/artifacts/build-aa9acb51f69a862547699c5f7fa5c6f6c1353253/
> Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allnoconfig/3/artifact/artifacts/build-baseline/
> Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allnoconfig/3/artifact/artifacts/

Looks like this change was reverted then updated:

https://github.com/llvm/llvm-project/commit/cba0ebd576228d11817181a9ebc53a1931bb972b

https://github.com/llvm/llvm-project/commit/1ebad988b1106e5cb35ea76813a4d3f66070b8f0

I am pretty sure I have built an LLVM toolchain with the new patch and I
have not seen any build failures.

Cheers,
Nathan
