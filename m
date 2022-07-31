Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBF25C97
	for <llvm@lists.linux.dev>; Sun, 31 Jul 2022 10:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB85EC433C1;
	Sun, 31 Jul 2022 10:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1659262397;
	bh=l1KcgsyDNOlbE9gZMQjdsaDZuWLLdpPFaAzH+3qqmhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vDz/7PtrR9YpZzsEM75UVFsCsdhLffknxIjX1sjuGSMlM+yhFj6GArpfkDewN0dFD
	 tCgscT5N/MZ2Pr1RDwkZdCkmn2W9snudd2KDGG7wWSjGpYA3FPi/UJ2uQPCcIf5UoV
	 JD/n67t3X8x0Z4VqAVr2T8dlkpGT9STHWtYdzYTs=
Date: Sun, 31 Jul 2022 12:13:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	kernel test robot <lkp@intel.com>,
	"Justin M. Forbes" <jforbes@fedoraproject.org>,
	clang-built-linux <llvm@lists.linux.dev>, kbuild-all@lists.01.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Jason A. Donenfeld" <zx2c4@kernel.org>
Subject: Re: [linux-stable-rc:linux-5.15.y 6874/8723]
 arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least version
 4.6 of GCC
Message-ID: <YuZVuutjt9HcJuGh@kroah.com>
References: <202207250449.BYMZbIA2-lkp@intel.com>
 <Yt3KObFVIUI2mFGt@zx2c4.com>
 <CAMj1kXHTf4f+onREnWhYk-vYXkPaQtPpZz+SqFCP+Ey7+bOXkQ@mail.gmail.com>
 <Yt5Y/cIKIDlyFWMQ@kroah.com>
 <CAMj1kXGPjFAY0y-SPZv64CRhpo9s1+__z4bya86aMcTs9=f8pw@mail.gmail.com>
 <CAK8P3a0g4NT1oDW5gq7YO540Eo0UDoqbK1tmtb8QHteiDNXj5Q@mail.gmail.com>
 <CAK8P3a2ZfEr+4OWWteZHpDYGw8U0dQgMfF_OFwQDEtY=GaTfQA@mail.gmail.com>
 <YuVBOOrdoBDUhRxJ@kroah.com>
 <YuW7r1pyBAeNKlPG@zx2c4.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuW7r1pyBAeNKlPG@zx2c4.com>

On Sun, Jul 31, 2022 at 01:15:59AM +0200, Jason A. Donenfeld wrote:
> On Sat, Jul 30, 2022 at 04:33:28PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Jul 25, 2022 at 04:35:38PM +0200, Arnd Bergmann wrote:
> > > On Mon, Jul 25, 2022 at 2:55 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > 
> > > > The other easy workaround would be to just turn off the xor-neon code
> > > > when building with clang, e.g. using this Makefile hack:
> > > >
> > > > diff --git a/arch/arm/lib/Makefile b/arch/arm/lib/Makefile
> > > > index 6d2ba454f25b..8e4fe6421dd2 100644
> > > > --- a/arch/arm/lib/Makefile
> > > > +++ b/arch/arm/lib/Makefile
> > > > @@ -43,8 +43,10 @@ endif
> > > >  $(obj)/csumpartialcopy.o:      $(obj)/csumpartialcopygeneric.S
> > > >  $(obj)/csumpartialcopyuser.o:  $(obj)/csumpartialcopygeneric.S
> > > >
> > > > +ifdef CONFIG_CC_IS_CLANG
> > > >  ifeq ($(CONFIG_KERNEL_MODE_NEON),y)
> > > >    NEON_FLAGS                   := -march=armv7-a -mfloat-abi=softfp -mfpu=neon
> > > >    CFLAGS_xor-neon.o            += $(NEON_FLAGS)
> > > >    obj-$(CONFIG_XOR_BLOCKS)     += xor-neon.o
> > > >  endif
> > > > +endif
> > > 
> > > Nevermind, this does not actually work. Just turning off the warning
> > > is probably best then, as actually disabling this code would still
> > > be invasive not do much beyond saving a little bit of kernel .text size.
> > 
> > Ok, if it triggers again, and I get annoyed, I'll write a patch,
> > otherwise I'll just leave it alone unless someone else wants to send it
> > to me...
> 
> The patch is trivial, if your idea is just to remove the #warning,
> right? Might as well just do it now and get it over with.

Fine, I was being lazy :)

Now sent out:
	https://lore.kernel.org/all/20220731100551.3679874-1-gregkh@linuxfoundation.org/
