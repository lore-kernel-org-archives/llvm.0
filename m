Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD909189B8B;
	Mon, 20 Jan 2025 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737360675; cv=none; b=W9+xCvEMReGr2n6IW2ieRiwKVJ3KSHtARNu8ydjc+uwsANY2rR2/k0V7olscz9WPVF+05LC58LYjPEPS7MM4uaOczYZlm9KIdS3BZrIUPLv2Pg5PGN6eA3FWqmRFYeqzPrvAer/9B6MRsIJKqWM9m0BYEeeJE1E2whPsOsRCVoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737360675; c=relaxed/simple;
	bh=BDSk0In+tWagHet17hDyqWapV2cnvVPpQ+yKTEALR+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pG7FUWO+rwctE6E63t/rKKbibqQ2/7jQ2wqjLKsS6DlDATmF/7TMD9skPuh3MHBrIXgM7jW7t7SALVwY4WxKB0DyTS5WOYgau41mHAXqCqs4D34Zaf9gdQNt1b1chJl6eLQwrEF3S10Gq7qE11OrF4nc7T3POX/sEvNZ4cMBTe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MObVoFng; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MObVoFng"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BACEC4CEDD;
	Mon, 20 Jan 2025 08:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737360675;
	bh=BDSk0In+tWagHet17hDyqWapV2cnvVPpQ+yKTEALR+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MObVoFngx6M82eujh9+FFbM7dSl3I/HMiD3H6pLAiTLaWwcjjNXidaEcGsF8W8Yag
	 zyBQ7BJ53TnEFjKiEecJwZmmxn7PPcEqWPBGhqKplZcKOZ84FGLpOqfuVyz0jsJekW
	 8mbGl5HdugGGK2JYRMlXGCGS4wCjdbo/y/vmcmd8J4kHQzDAZ4jwVoKuxXH19p9mhV
	 quHvbHWSPvW40Kw9mxlFa4OZ0Qr7gXWEplHVs17xbe+wegr89ORmfOfBbh3GkMfAJM
	 wgRfNt/0dJMWOfJ3mXbL8j3F9Whb77iUI3q4U9ruxk8KqsD2n1e+6Q4/1gnevLhpRu
	 a2fHLMkZzVzUA==
Date: Mon, 20 Jan 2025 09:11:09 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] lockdep: Mark chain_hlock_class_idx() with
 __maybe_unused
Message-ID: <Z44FHR2Z_i54PHfJ@gmail.com>
References: <20241209170810.1485183-1-andriy.shevchenko@linux.intel.com>
 <Z180HFO6a61PtzYm@tardis.local>
 <Z19IYHyBbxf4csGB@smile.fi.intel.com>
 <Z2SWypPS7Lc2CXb6@tardis.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2SWypPS7Lc2CXb6@tardis.local>


* Boqun Feng <boqun.feng@gmail.com> wrote:

> On Sun, Dec 15, 2024 at 11:21:36PM +0200, Andy Shevchenko wrote:
> > On Sun, Dec 15, 2024 at 11:55:08AM -0800, Boqun Feng wrote:
> > > On Mon, Dec 09, 2024 at 07:08:10PM +0200, Andy Shevchenko wrote:
> > > > When chain_hlock_class_idx() is unused, it prevents kernel builds with clang,
> > > > `make W=1` and CONFIG_WERROR=y:
> > > > 
> > > > kernel/locking/lockdep.c:435:28: error: unused function 'chain_hlock_class_idx' [-Werror,-Wunused-function]
> > > > 
> > > > Fix this by marking it with __maybe_unused.
> > > > 
> > > > See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> > > > inline functions for W=1 build").
> > > > 
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > 
> > > This looks fine to me, so I'm going to queue it, but could you do me
> > > favor if you could share the exact configs that would make
> > > chain_hlock_class_idx() an unused fuction in kernel/locking/lockdep.c ?
> > 
> > I might harvest this when I come from vacations (some around mid-January).
> > 
> 
> After some investigation myself, it turns out that
> chain_hlock_class_idx() is defined outside "#ifdef CONFIG_PROVING_LOCK",
> but only used under CONFIG_PROVING_LOCK=y, hence the unused warning.
> 
> TBH, I feel we should really clean-up/consolidate those "#ifdef" to make
> internal definition/usage more clear. But nothing blocks this patch, it
> fixes a real issue, I will add the CONFIG_PROVING_LOCK part in the
> commit log. Thanks!

So now that we have:

   343060092585 lockdep: Move lockdep_assert_locked() under #ifdef CONFIG_PROVE_LOCKING

Do we really need:

   8148fa2e022b lockdep: Mark chain_hlock_class_idx() with __maybe_unused

As it would hide the problem fixed by 343060092585?

__maybe_unused annotations are almost always canaries of something 
messy being hidden.

Thanks,

	Ingo
