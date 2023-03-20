Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43A04C7D
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 19:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC29C4339B;
	Mon, 20 Mar 2023 19:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679340137;
	bh=94gPjLzOy2pXzOmmuxBBL7sppv5BgFwZA7x73zO1EZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RTcGeD8zFAd6fzgqbBlGBrEaJKiEwpnZ2wgsblpAfkCBgaG0JXeW7jefqmRBcx3At
	 TfVIBjupDhG5Lbvll1NLYGGEcL+W8oX40EDl0LmbJ2MrOMHw1OusuiUZHN0IIFfgpj
	 p5lvsMlxufHwF28rEhVWPpoXk+cudbWmeZWhPU+NWoctpun4nvFyuld4vXlAAJOPp/
	 7mLij9160YizCqmO68m8zqK/DuXLCzOAklEhKZGpvIQH4IZR/a/eMJLnpkfNnYHYKJ
	 owhj4FVDMbo/JQhRs5lNKhOJ15TOFGN900mNu0kzZZGh5msGIlSsrBDn1rZGLXSgn3
	 jkJhp/9bPdoMg==
Date: Mon, 20 Mar 2023 12:22:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-toolchains@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: Linux 6.3-rc3
Message-ID: <20230320192215.GA617563@dev-arch.thelio-3990X>
References: <CAHk-=wiPd8R8-zSqTOtJ9KYeZLBByHug7ny3rgP-ZqzpP_KELg@mail.gmail.com>
 <20230320180501.GA598084@dev-arch.thelio-3990X>
 <CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com>
 <20230320185337.GA615556@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230320185337.GA615556@dev-arch.thelio-3990X>

On Mon, Mar 20, 2023 at 11:53:37AM -0700, Nathan Chancellor wrote:
> On Mon, Mar 20, 2023 at 11:26:17AM -0700, Linus Torvalds wrote:
> > On Mon, Mar 20, 2023 at 11:05 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > On the clang front, I am still seeing the following warning turned error
> > > for arm64 allmodconfig at least:
> > >
> > >   drivers/gpu/host1x/dev.c:520:6: error: variable 'syncpt_irq' is uninitialized when used here [-Werror,-Wuninitialized]
> > >           if (syncpt_irq < 0)
> > >               ^~~~~~~~~~
> > 
> > Hmm. I do my arm64 allmodconfig builds with gcc, and I'm surprised
> > that gcc doesn't warn about this.
> 
> Perhaps these would make doing allmodconfig builds with clang more
> frequently less painful for you?
> 
> https://lore.kernel.org/llvm/20230319235619.GA18547@dev-arch.thelio-3990X/
> 
> > That syncpt_irq thing isn't written to anywhere, so that's pretty egregious.
> > 
> > We use -Wno-maybe-uninitialized because gcc gets it so wrong, but
> > that's different from the "-Wuninitialized" thing (without the
> > "maybe").
> > 
> > I've seen gcc mess this up when there is one single assignment,
> > because then the SSA format makes it *so* easy to just use that
> > assignment out-of-order (or unconditionally), but this case looks
> > unusually clear-cut.
> > 
> > So the fact that gcc doesn't warn about it is outright odd.
> > 
> > > If that does not come to you through other means before -rc4, could you
> > > just apply it directly so that I can stop applying it to our CI? :)
> > 
> > Bah. I took it now, there's no excuse for that thing.
> 
> Thanks!
> 
> > Do we have any gcc people around that could explain why gcc failed so
> > miserably at this trivial case?
> 
> Cc'ing linux-toolchains. The start of the thread is here:
> 
> https://lore.kernel.org/CAHk-=wgSqpdkeJBb92M37JNTdRQJRnRUApraHKE8uGHTqQuu2Q@mail.gmail.com/
> 
> The problematic function before the fix is here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/host1x/dev.c?id=3d3699bde4b043eea17993e4e76804a8128f0fdb#n487
> 
> I will see if I have some cycles to try and reduce something out for the
> GCC folks.

While setting up the reduction, I noticed that there is an instance of
-Wmaybe-uninitialized at this site. Seems odd that it is not sure, I will
reduce on that.

  ../drivers/gpu/host1x/dev.c: In function 'host1x_probe':
  ../drivers/gpu/host1x/dev.c:520:12: error: 'syncpt_irq' may be used uninitialized [-Werror=maybe-uninitialized]
    520 |         if (syncpt_irq < 0)
        |            ^
  ../drivers/gpu/host1x/dev.c:490:13: note: 'syncpt_irq' was declared here
    490 |         int syncpt_irq;
        |             ^~~~~~~~~~
  cc1: all warnings being treated as errors

Cheers,
Nathan
