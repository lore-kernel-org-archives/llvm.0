Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34747F
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 00:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94412C340E8;
	Thu, 10 Mar 2022 00:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646870813;
	bh=ymR0+7HJt+j828kNldSOLB8CDGjogSDdd9MtZMnSRf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kY4jITnnMG2z8hapDLQ2cYnx22dUElqPtYRFwkydqNXC94aVJ4vIe3ToaGgauI/Ei
	 o/PoV/dPeuwBheaYOAfmNgwhXc2T5xK+OoHwgk74JyhTZ+cYTTwL+Yx4VLXQF557Mr
	 eQ6gzsSvwABZk7reqgfbWBsU4RJHb7oKmA1dbdMVejuT3KnntEQsX8It+6/ijhaPmJ
	 GCgsgkzkgh8zLtrr042Vt6IdGjqj7w6etciUlmLiQ1hbMmlrsK4ReWCufg2T0rPGa+
	 1UcnL9YglRTf4F6D20QupWzWYFChxdAnqax/zQnghbnkBNozxhtuX/M7UlTlOV8X3w
	 1WtYGoXz5f45w==
Date: Wed, 9 Mar 2022 17:06:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Arnd Bergmann <arnd@kernel.org>, Alex Shi <alexs@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, David Sterba <dsterba@suse.com>,
	Marco Elver <elver@google.com>, Jani Nikula <jani.nikula@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev, Mark Rutland <mark.rutland@arm.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 0/4] [v4] Kbuild: std=gnu11 changes
Message-ID: <YilBFcKIN1Ao5Ld1@dev-arch.thelio-3990X>
References: <20220308215615.14183-1-arnd@kernel.org>
 <CAHk-=wjsCrVxToP0Zx+cUAVZmSKi=Y6NP1+VnBcoPyPPEBfonQ@mail.gmail.com>
 <CAK7LNAQoFFVLfkhA7FC9vDbvc4wdLginYeRHL0xHVAumu6p=uw@mail.gmail.com>
 <CAK7LNASuy5hSOU7Y7Tr8_6Ks1ZqEeUKv_-c6fDjMubq0_ENRaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASuy5hSOU7Y7Tr8_6Ks1ZqEeUKv_-c6fDjMubq0_ENRaw@mail.gmail.com>

On Wed, Mar 09, 2022 at 06:18:18PM +0900, Masahiro Yamada wrote:
> On Wed, Mar 9, 2022 at 11:16 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Wed, Mar 9, 2022 at 9:09 AM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > On Tue, Mar 8, 2022 at 1:56 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > >
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > >
> > > > I've incorporated the feedback from Masahiro Yamada in this
> > > > version, splitting out one more patch, rebasing on top of
> > > > the kbuild tree, and changing the order of the patches.
> > > >
> > > > Please apply to the kbuild tree.
> > >
> > > I'd actually like to see this as a separate branch, so that I can
> > > merge it early - or other peoples git branches end up depending on it.
> >
> >
> > OK, I can apply this to a separate branch, kbuild-gnu11.
> > (and I will queue this up shortly because it is already -rc7)
> >
> > Then, I will send two pull reqs in the next MW,
> > but please note they will conflict with each other,
> > between this gnu11 patch set and the following
> > one in my usual kbuild branch:
> >
> > https://patchwork.kernel.org/project/linux-kbuild/patch/20220201213542.2808035-1-quic_eberman@quicinc.com/
> >
> >
> > I hope this is not a complex conflict, but please let me know
> > if you have any requests to me.
> >
> >
> >
> >
> >
> 
> 
> All, applied to linux-kbuild/kbuild-gnu11.
> 
> If somebody wants to give Reviewed-by, Acked-by, Tested-by, please.
> 
> I will append them later.

For the series:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Cheers,
Nathan
