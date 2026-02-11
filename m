Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EDA2D5935
	for <llvm@lists.linux.dev>; Wed, 11 Feb 2026 19:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770839503; cv=none; b=oKWN/ppQPQDQvlRpcUQS5WYowm55fihxkq2Nn+ztXihRdYKtRY+jMoqPX93OHTZMiCgmw64X6DEl5qTzhfSGqDZXQOq7jlRZH60o3hWJZwSZyYIl677gUakw03NwdzcVo9oSUSibEvbjGHypenTIHcLsRGwXyGmLd6N2Qe9iLIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770839503; c=relaxed/simple;
	bh=F3SBSpYpJlqNycnaU/w2lwIz0YNicZrGnJOVMR7W+6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+YE6CHJ9cL0ojrg+dOtgqH/yVIbR7tIagLfWLtKgxxuZFoB+8pAjbT5lCVlCdWDtNFW5pqzpCz2z+07jj1/MbCyipYuSao1PSq/mGVN9ZQlT0HNouy2wNQY+Bo/GJWEDOmbmFLma35lPondIQVJQw5A+nsCmNdjBm3wqk5Tw1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rvieqaR4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rvieqaR4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F36C4CEF7;
	Wed, 11 Feb 2026 19:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770839503;
	bh=F3SBSpYpJlqNycnaU/w2lwIz0YNicZrGnJOVMR7W+6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rvieqaR4KICAafXD+9qrh7dugePKYc3s/b+pN5eQWEu7b7+GV35B+kK5A4D9jl2iA
	 Udpx36R8CsQpg2X/j5lSB2E4lTro4MWcSTkMGetAcMLL0/nTRQCe7r4r821k6jq9S9
	 VfQ0GnopIGIZUAQ00lXGo2C8DXie9BSxkFzY2UBTAltzA8lAjnNvtt18JWCgsgYEpi
	 pz2UiR62rhkn0vKSxU3e1etpDmPEf7ApN8Lh8BecNuXu5bTX1IBfAt0MThmpEjfUdr
	 8JiUtUlIiQ7W+t4ZyTYSFqmAOGFYkLY5CY4lhqbYeGpAtRy3oC5VAqgJIP6rjS86Ux
	 1bJ4Wxq61zjKg==
Date: Wed, 11 Feb 2026 12:51:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Marco Elver <elver@google.com>,
	clang-built-linux <llvm@lists.linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Aaron Ballman <aaron@aaronballman.com>,
	"Jose E. Marchesi" <jemarch@gnu.org>
Subject: Re: Clang/LLVM 'main' regression testing and -Wthread-safety
Message-ID: <20260211195139.GB3482274@ax162>
References: <aYhfK3tB0X6Y_GyV@gmail.com>
 <177076109527.3702729.10282954256881857059.pr-tracker-bot@kernel.org>
 <CANpmjNODYHBpS_Xn_bbGwQfdEtkgFq_gpdT3S+_31bfgOPoeUg@mail.gmail.com>
 <CANiq72k6ZHbW+tnX8jjOUaj4aSMigEaH4SEkODX==OJBseKCug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k6ZHbW+tnX8jjOUaj4aSMigEaH4SEkODX==OJBseKCug@mail.gmail.com>

On Wed, Feb 11, 2026 at 12:54:40PM +0100, Miguel Ojeda wrote:
> On Wed, Feb 11, 2026 at 11:59 AM Marco Elver <elver@google.com> wrote:
> >
> > I recall there was a CI system that did this, but lost track of what's
> > the latest.
> 
> I think you may be referring to
> https://github.com/ClangBuiltLinux/continuous-integration2.

Indeed.

> By the way, some time ago I asked Aaron (Cc'd) whether we could get
> the kernel into upstream LLVM's CI system, i.e. to at least build a
> minimal kernel configuration of a fixed, tagged release for one or two
> architectures. Would that help you?
> 
> (I also suggested Jose (Cc'd) the same, for GCC.)
> 
> The idea is that it helps both sides. It serves to catch issues very
> early on (including with subtle things like diagnostics), and thus
> avoids having to play catch up later to fix them (compiler) and/or
> workaround them (kernel) in either side.
> 
> To be clear, this wouldn't replace the other CIs that run out of tree,
> like Nathan's and the tests I do for Rust stuff etc., i.e. it is not
> about catching every compiler issue or testing the kernel as a
> product.
> 
> For context, this all happened because I asked the same to upstream
> Rust and it was a success there. In that case, the goal was to catch
> issues early with the unstable features we use, but it helps with
> other things too, and thus I think it would help just the same for
> Clang and GCC. So far, we only got pinged a few times, so it has not
> been a lot of work, and it did catch a couple issues (which sometimes
> may end with a preemptive kernel patch or fixing the upstream PR).
> 
> We also did it for upstream `bindgen`, and hopefully it will happen
> for `rustc_codegen_gcc` (currently we have an out-of-tree one) and GCC
> Rust eventually.
> 
> Anyway, this is a bit of a tangent, but I thought I could raise it up
> again and see what comes out of it...

It has always been on my backburner to try and get a build of the Linux
kernel as part of LLVM's continuous integration but I have never had the
time to sit down and interface with folks to see what exactly that
entails (I figured it would involve integration with LLVM's build bot
infrastructure but I have not dug in super hard to the documentation).
An arm64 and x86_64 defconfig build would probably catch quite a bit of
initial breakage and it would be easy to pin Linux's version and only
bump it when thoroughly tested.

Cheers,
Nathan
