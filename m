Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9CA28504D;
	Wed,  4 Feb 2026 14:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770214558; cv=none; b=qg4cAKBQGveJglFvMVkVbE3gypLNexPawfK01p6K/cjGsnRhj3MEbjJjk+GQLdV6Dg8wH3I5ZKflSXlVv5yHO21zywY5loITm0OZokV1lryUOHZFz8z03vOUYjbmr25sA/Q2++Vefe2Wwjyke6UqNpO5lBtwVz4IZGVLu3g0pq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770214558; c=relaxed/simple;
	bh=E1jdxwYVfm2leYwVacUOhzPIAuFdaG8WtIXWBNAtcUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAd2LrYyvey2SNmxeSuZsbQpmagGYD9CAFtS5DvKZd8s2M3HFA33blZ3/jrFeY5axsfjF9e5qBkdVH1Af4ISYnrFM1Vtv3ItZP7Lc14t4rYmdYUcaYDD74g1YNuDQthd1uETJWtj1OMijQJ2W287uRe6o3r2SP+pO/u+eyF8D+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEIGMLgZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEIGMLgZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69DE9C4CEF7;
	Wed,  4 Feb 2026 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770214558;
	bh=E1jdxwYVfm2leYwVacUOhzPIAuFdaG8WtIXWBNAtcUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEIGMLgZkHXkFgAdvwA8FEmf5l8TTj4oqyicVJQQbsnC/PBzaP9Pg5TjOmtwn7N52
	 p3Ff9aSftwE2aL1zZEcxyIeUJG7pBaGmHH3pS3H2o3nPmM5xovo4ttN/Q2rPbHJAlf
	 WHOIGLKLG2RgfjYgDGKq6Dw+6Z0ul/20rGH3v4vIr9kX38dHhWEfy1JnRhdeBWSEoq
	 /DvLYOR8jF9JfisiuA7zKSamB8M3X7RqKPGy/jYMB98MQW75D8BeHebA/CBJdLim8p
	 Rq/WAmYpirMcBNY5UXSeni2aZ+ei8kWPsIQTihd3k50/1nYlxPzR7fF/8XXUlBMdnP
	 Zii2AGtbOCkeA==
Date: Wed, 4 Feb 2026 14:15:52 +0000
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Marco Elver <elver@google.com>,
	David Laight <david.laight.linux@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Boqun Feng <boqun@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <aYNUmEfDzq7lTFFr@willie-the-truck>
References: <20260130132951.2714396-1-elver@google.com>
 <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck>
 <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck>
 <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
 <20260204131400.GI2995752@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204131400.GI2995752@noisy.programming.kicks-ass.net>

On Wed, Feb 04, 2026 at 02:14:00PM +0100, Peter Zijlstra wrote:
> On Wed, Feb 04, 2026 at 11:46:02AM +0100, Marco Elver wrote:
> > On Tue, 3 Feb 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
> > [...]
> > > > > What does GCC do with this? :/
> > > >
> > > > GCC currently doesn't see it, LTO is clang only.
> > >
> > > LTO is just one way that a compiler could end up breaking dependency
> > > chains, so I really want to maintain the option to enable this path for
> > > GCC in case we run into problems caused by other optimisations in future.
> > 
> > It will work for GCC, but only from GCC 11. Before that __auto_type
> > does not drop qualifiers:
> > https://godbolt.org/z/sc5bcnzKd (switch to GCC 11 to see it compile)
> > 
> > So to summarize, all supported Clang versions deal with __auto_type
> > correctly for the fallback; GCC from version 11 does (kernel currently
> > supports GCC 8 and above). From GCC 14 and Clang 19 we have
> > __typeof_unqual__.
> > 
> > I really don't see another way forward; there's no other good way to
> > solve this issue. I would advise against pessimizing new compilers and
> > features because maybe one day we might still want to enable this
> > version of READ_ONCE() for GCC 8-10.
> > 
> > Should we one day choose to enable this READ_ONCE() version for GCC,
> > we will (a) either have bumped the minimum GCC version to 11+, or (b)
> > we can only do so from GCC 11. At this point GCC 11 was released 5
> > years ago!
> 
> There is, from this thread:
> 
>   https://lkml.kernel.org/r/20260111182010.GH3634291@ZenIV
> 
> another trick to strip qualifiers:
> 
>   #define unqual_non_array(T) __typeof__(((T(*)(void))0)())
> 
> which will work from GCC-8.4 onwards. Arguably, it should be possible to
> raise the minimum from 8 to 8.4 (IMO).

That sounds reasonable to me but I'm not usually the one to push back
on raising the minimum compiler version!

> But yes; in general I think it is fine to have 'old' compilers generate
> suboptimal code.

I'm absolutely fine with the codegen being terrible for ancient
toolchains as long as it's correct.

Will
