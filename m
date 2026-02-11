Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06C234EF06
	for <llvm@lists.linux.dev>; Wed, 11 Feb 2026 19:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770838824; cv=none; b=SlIjIZFia4GGurGVwZdWKl+fHl4w/pwZyM72rzwIbK1qMULBdtRQa/Ls9t/T5XOhk90J/FxHfU+GzyB7VNIY/8x3yPP5ZEYfaNqWfZhLLo5Dx7lxuRW9GUPfu0X472y5lUOOB7u04BIfMtw9yeVBx3wkkHJ3fwkh0sps4y2D38c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770838824; c=relaxed/simple;
	bh=08hRwlCOUUB5Rqq+zDdOJN1TDr1r5StwLTwUFXq9iPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3b5lPLQ3npK4rI7v6QzAdUnYkwmvQQkwhAwY4EQF9lVHTyMEx8USqGac9bLTuJps5pNR9L3c9snf7RQp2cfx/7d9k6nr9u1ogtBLrhV644ocg1O/SKWy5ttzX/D2bSPw0dc+az+3iyMsIYme3lIO/b/OmPYA6PHr0PeJ1kBmxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geqYDRz8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geqYDRz8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C915C4CEF7;
	Wed, 11 Feb 2026 19:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770838824;
	bh=08hRwlCOUUB5Rqq+zDdOJN1TDr1r5StwLTwUFXq9iPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=geqYDRz85x0sTGnLtpv1ZldLfg4tAsS7gRD8ejI3kGqbg2DXK9hcRCwpaMTRn394k
	 qxESC9gPXcluC0NUPC6t/6lectwVE5LkLnpE1S3AGpNrx9mzWb/XhoVMjdOPY5wtc2
	 pgucvWIlmsDBG6GCJqRURK7F4i36LmMtXreqCNhxcRWMdnn2o3NSobCX+7DPptM4+T
	 tKMNUREAYmwL2RW4NLFn/C1/wZyb9ctQRwSh5wc3oKdr8nSzrIzpJXL07bEqIAmYy6
	 OhoO+s+BcRvjilXjhVqGyAeacrBImY/pJ3m36zPRYvjp0pJhIfvJpRF7tI74dXQ9ne
	 l3m7UYWbOrhHg==
Date: Wed, 11 Feb 2026 12:40:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marco Elver <elver@google.com>
Cc: clang-built-linux <llvm@lists.linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: Clang/LLVM 'main' regression testing and -Wthread-safety
Message-ID: <20260211194020.GA3482274@ax162>
References: <aYhfK3tB0X6Y_GyV@gmail.com>
 <177076109527.3702729.10282954256881857059.pr-tracker-bot@kernel.org>
 <CANpmjNODYHBpS_Xn_bbGwQfdEtkgFq_gpdT3S+_31bfgOPoeUg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNODYHBpS_Xn_bbGwQfdEtkgFq_gpdT3S+_31bfgOPoeUg@mail.gmail.com>

Hi Marco,

On Wed, Feb 11, 2026 at 11:58:55AM +0100, Marco Elver wrote:
> See below - Clang's -Wthread-safety support was merged.

Congratulations :) I am happy to hear that it has gotten across the
finish line and I look forward to more people trying it out.

> I'm not too familiar with ClangBuiltLinux testing and regression
> testing setups; but I wanted to check if LLVM 'main' is being
> continuously tested somewhere? I know the Intel test robot takes a
> ~1-2 week old snapshot of LLVM 'main' and tests that.

Yes, it is (at the repository that Miguel pointed out):

  https://github.com/ClangBuiltLinux/continuous-integration2/actions/workflows/mainline-clang-23.yml

You can see our full matrix on the ClangBuiltLinux homepage:

  https://ClangBuiltLinux.github.io

We rely on apt.llvm.org for the nightly builds, which are normally
updated every few days but it was down for a little over a month because
of the 22 to 23 transition (if I understand correctly). I actually need
to chase that transition in TuxMake.

I also have a testing framework I use for local validation of LLVM main,
so I should be able to flag issues fairly quickly:

  https://github.com/nathanchance/llvm-kernel-testing

> Basically I want to ensure that we're able to catch -Wthread-safety
> regressions on the Clang side that affect the kernel. While I've been
> adding more and more tests to the LLVM repo for the rather special
> patterns we decided to use in the kernel to make Context Analysis
> work, maybe some slipped through the cracks.
> 
> E.g. I've been reviewing
> https://github.com/llvm/llvm-project/pull/178952 and tested it, too,
> I'm only 99% certain that PR is ok -- being able to quickly catch a
> newly introduced issue before waiting for the Intel test robot to
> start spamming us would be good.

For what it's worth, I have a decent amount of local computing resources
so if you ever want a pull request explicitly tested, ping me on it and
I am happy to put it through my tests, which should flag any major
problems because the context analysis warnings are default on in
Kconfig.

> I recall there was a CI system that did this, but lost track of what's
> the latest.

Aside from our CI and Intel's, I know Linaro's toolchain group has some
testing of LLVM main that seems to be fairly up to date:

  https://lore.kernel.org/llvm/?q=f%3Aci_notify%40linaro.org

Cheers,
Nathan
