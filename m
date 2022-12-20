Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314E4EA1
	for <llvm@lists.linux.dev>; Tue, 20 Dec 2022 00:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C12EC433EF;
	Tue, 20 Dec 2022 00:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671497976;
	bh=2IyieBRuslfHff6QsIS4oAapVfZbg9JVPmMQRJPaoOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P7b+bYmQxeyapFPoRI2KjiDVO7BDBo3CwZjDhhLfaR6cqXy4Ec/0IsbQ2MTYRo9Vq
	 9oZrU22T3Eyh4ucaKOQdfNlzI+DrN/deTkPXxVef8Az9+G4BSLMJUBHQdMW5U2iiJp
	 gsN3fsSQO1kMEVHz3ENtnmABDhIOUuE34Ny6i2NcsOhoYJdRxCIsAsP0Nobyo4frX1
	 iZ8vtXoSZBOyQs5nBoNJvEiT/uDfbVFQartWK6NsRZtz0Clc3X14s5ks8OqTDuB7A5
	 YieeisSt6+/Fs2D2tacGxdxG0srO5PnOnbg58ZU5B9OsnDJLjC0QFv55tFYrHbUUgj
	 zytvx0y4OTMSw==
Date: Mon, 19 Dec 2022 17:59:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: Roman Lebedev <lebedev.ri@gmail.com>, llvm@lists.linux.dev
Subject: Re: [TCWG CI] Failure after llvmorg-16-init-14942-g6adeec881a83:
 [InstCombine] `sinkNotIntoOtherHandOfLogicalOp()`: allow extra invertible
 uses of hand-to-invert
Message-ID: <Y6EI9exfR/WAg/OW@dev-arch.thelio-3990X>
References: <1017122029.3605.1671493134993@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1017122029.3605.1671493134993@jenkins.jenkins>

On Mon, Dec 19, 2022 at 11:38:54PM +0000, ci_notify@linaro.org wrote:
> Failure after llvmorg-16-init-14942-g6adeec881a83: [InstCombine] `sinkNotIntoOtherHandOfLogicalOp()`: allow extra invertible uses of hand-to-invert:
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
> 7391
> # First few build errors in logs:
> # 00:13:26 fatal error: error in backend: Broken function found, compilation aborted!
> # 00:13:29 fatal error: error in backend: Broken function found, compilation aborted!
> # 00:13:30 clang-16: error: clang frontend command failed with exit code 70 (use -v to see invocation)
> # 00:13:30 clang-16: error: clang frontend command failed with exit code 70 (use -v to see invocation)
> # 00:13:30 make[3]: *** [scripts/Makefile.build:250: fs/nfs_common/grace.o] Error 1
> # 00:13:30 make[3]: *** [scripts/Makefile.build:250: kernel/sched/core.o] Error 1
> # 00:13:33 make[2]: *** [scripts/Makefile.build:502: fs/nfs_common] Error 2
> # 00:13:37 clang-16: error: clang frontend command failed with exit code 134 (use -v to see invocation)
> # 00:13:37 make[3]: *** [scripts/Makefile.build:250: kernel/sched/build_policy.o] Error 1
> # 00:13:37 clang-16: error: clang frontend command failed with exit code 134 (use -v to see invocation)
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
> 8686
> # linux build successful:
> all
> # linux boot successful:
> boot
> 
> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
> 
> For latest status see comments in https://linaro.atlassian.net/browse/LLVM-646 .
> Status of llvmorg-16-init-14942-g6adeec881a83 commit for tcwg_kernel:
> commit 6adeec881a830c91d42077b9f4665531003143b1
> Author: Roman Lebedev <lebedev.ri@gmail.com>
> Date:   Mon Dec 19 04:21:51 2022 +0300
> 
>     [InstCombine] `sinkNotIntoOtherHandOfLogicalOp()`: allow extra invertible uses of hand-to-invert
> * llvm-master-aarch64-mainline-defconfig

I cannot reproduce this issue with current tip of tree LLVM
(3a5426f57243) but I can at 6adeec881a83, so I am guessing this was
likely fixed by the next commit, 3ae00753c156.

Cheers,
Nathan
