Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B939A3161A1;
	Wed, 25 Feb 2026 18:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772045642; cv=none; b=rIepf3r4cBpnTp8KBKDHY1hj8YINHPEwdE371SAcUB7q41PmTvd0AGwscnvlTwNHlLddpzaPgDPxh491j1kOieYIMwT4YPPnKp7k8TV7o9XKW2e6Hv7PRUpRR7SOGLvqS2esDZLw2gci7jyInLz2/YtD988+IXFjq4+UIOopMzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772045642; c=relaxed/simple;
	bh=Qmdyruk6eTjA5//rr8QWbkOM66msVj2x45cnOBkOKB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjuxWeaC0/er2sBRe24aqWYM4+9z19GuJ3Fd4rng7P1G981iE0SeI4SqRLTPMaKFvklTvLPQHh9DZk4VjMVwndiSq2Z+uhzA89XtYTbCmd5zS9uvDmWjxS3Nknq2Bgbofgfx4jirQ1oTIreQnGCSgSFR/RN0ddEi7zQXJD9XKsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ReQBUarA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ReQBUarA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52223C19421;
	Wed, 25 Feb 2026 18:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772045642;
	bh=Qmdyruk6eTjA5//rr8QWbkOM66msVj2x45cnOBkOKB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ReQBUarAD7R7u2OvY+GBhskGhuBaa65KTvRQJPQ7jHDlZWrSUdmzHbt7v0EclFkTY
	 GjDPYV/znJAcFOqMRQt1BnOA0kPmSD+E2rUvfe/NqvKYTxwVl5dQmu7qJ3ajXd4/Sp
	 9UN9QuW+6D9niQU0huvkjVCQk6PHpTdyimzLyzGhn1ts1rU9TIUkjHKRCXrDat4f47
	 fkDuKQrB3IbvhTgpkd8MUZ6fnjCZD74qaAP7TD3PR/XoHiTRtzw4+v+EflS2M+8WUe
	 fEIgZjt2g3o2PV5VtLpDIKcWWe3jZ3T8r1mmzKkY4z4RcscS+SlWUKEv3LhS9O49ac
	 H0BHeGc36a2fA==
Date: Wed, 25 Feb 2026 11:53:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Marco Elver <elver@google.com>, Bart Van Assche <bvanassche@acm.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, pkg-llvm-team@lists.alioth.debian.org
Subject: Re: [PATCH] lib/Kconfig.debug: Require a release version of LLVM 22
 for context analysis
Message-ID: <20260225185357.GA2755225@ax162>
References: <20260224-bump-clang-ver-context-analysis-v1-1-16cc7a90a040@kernel.org>
 <20260225145228.GB1282955@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225145228.GB1282955@noisy.programming.kicks-ass.net>

On Wed, Feb 25, 2026 at 03:52:28PM +0100, Peter Zijlstra wrote:
> On Tue, Feb 24, 2026 at 04:16:30PM -0700, Nathan Chancellor wrote:
> > Using a prerelease version as a minimum supported version for
> > Peter, could you take this for a 7.0-rc?
> 
> Yes, I can.

Thanks a lot!

> I would however appreciate the Debian folks to quickly push an update
> to the clang-22/experimental package. Otherwise I can't run this fancy
> stuff myself no moar.

  https://packages.debian.org/experimental/clang-22

claims that the experimental clang-22 package is at 22.1.0-rc3, so you
should be good. If not for some reason, it looks like 22.1.0 should be
coming down the pipeline soon based on the llvm-toolchain repo:

  https://salsa.debian.org/pkg-llvm-team/llvm-toolchain/-/commits/22

and there is always https://apt.llvm.org or the kernel.org copies if you
were really in a bind :)

Cheers,
Nathan
