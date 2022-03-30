Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85A529A2
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 17:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946C4C34112
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 17:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648662163;
	bh=I2nwMsi0ASZuANmFO4D1q4EQjpFm+YKdWDV/S1qQdgI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FZ2l9bRDejt84c449bQ8hFmBugEh4ngaORwyNebdds5Vjs+hO4eIfYlYJldqQ3nNK
	 QCwl50twfPNO3ziojiuMerBKvGxxIub990HcMr86mBlfRm1aBkVZiM2NPYYYOLhVBW
	 aS8YJiKmZZTer9XXLLNYxigFLQRgD0PhyiC+4EcWIKcdCQUmTPtDpxcGKkEkEVcH5a
	 TzLAsk//ijZ6Aa4F+8YixhuqkQJvq2/gCYnJfU2UhK7IAlBBJmk2w+5VxL5M2gKlUs
	 n94ZlOCC2mcah6c0U0vFQ6di2PkqooUItM2L1jYnyokumZ/C4EhpE41PH9iZDL8mkS
	 ZqBQAfZ3rjTkQ==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-df26ea5bfbso5188518fac.1
        for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 10:42:43 -0700 (PDT)
X-Gm-Message-State: AOAM533ArbUa1Q2TA6sdVNzo8HEVrxz9T9C3Wtedb4AiLJRp7i0WX4T7
	77Djk9kue4/hoFhtbOmOtT3x3NZmVTSBtd/z+8I=
X-Google-Smtp-Source: ABdhPJxVwc1vcsNmifyLf6iCDsIRT/4G7CdnAH+8eeTpR1xBYRGvRayW8V+k/WnefL7MglY1+3MBxoJgQt3zkfQEiW8=
X-Received: by 2002:a05:6870:b027:b0:de:7fcd:fabf with SMTP id
 y39-20020a056870b02700b000de7fcdfabfmr431384oae.126.1648662162730; Wed, 30
 Mar 2022 10:42:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YipOoAaBIHjeCKOq@dev-arch.thelio-3990X> <YkSHJ65qGHO4bonJ@shell.armlinux.org.uk>
 <CAMj1kXFcrG6TrSU+KcmXCVM7ZWZ2fMjiN8c_dtEwxBugJS_UAQ@mail.gmail.com> <10062923.nUPlyArG6x@localhost.localdomain>
In-Reply-To: <10062923.nUPlyArG6x@localhost.localdomain>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 30 Mar 2022 19:42:31 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGbNtJPEowha8=vFgjdv_m2viHJ2Q7AqtJeqOPLa8-1Sg@mail.gmail.com>
Message-ID: <CAMj1kXGbNtJPEowha8=vFgjdv_m2viHJ2Q7AqtJeqOPLa8-1Sg@mail.gmail.com>
Subject: Re: CONFIG_THUMB2_KERNEL=y boot failure after Spectre BHB fixes
To: Christian Eggers <ceggers@arri.de>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Mar 2022 at 19:33, Christian Eggers <ceggers@arri.de> wrote:
>
> On Wednesday, 30 March 2022, 18:45:18 CEST, Ard Biesheuvel wrote:
> >
> On Wed, 30 Mar 2022 at 18:37, Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Wed, Mar 30, 2022 at 06:34:25PM +0200, Ard Biesheuvel wrote:
> > > > On Wed, 30 Mar 2022 at 18:12, Russell King (Oracle)
> > > > <linux@armlinux.org.uk> wrote:
> > > > >
> > > > > On Tue, Mar 22, 2022 at 06:49:17PM +0100, Christian Eggers wrote:
> > > > > > Hi Nathan, hi Russel,
> > > > > >
> > > > > > I stumbled today over the same problem (no output on serial console
> > > > > > with v5.15.28-rt36). During `git bisect`, I had also some commits
> > > > > > where a few lines of output were visible.
> > > > > >
> > > > > > At commit 8d9d651ff227 ("ARM: use LOADADDR() to get load address of
> > > > > > sections"), the system boots up to here:
> > > > > >
> > > > > > start_kernel()
> > > > > > +--setup_arch()
> > > > > > +--paging_init()
> > > > > > +--devicemaps_init()
> > > > > > +--eary_trap_init(vectors_base = 0xC7FFE000)
> > > > > > +--copy_from_lma(vectors_base = 0xC7FFE000, __vectors_start=0x0, __vectors_end=0x20)
> > > > > > +--__memcpy()
> > > > > >
> > > > > > copy_template.S:113
> > > > > > ldr8w r1, r3, r4, r5, r6, r7, r8, ip, lr, abort=20f
> > > > > > r1 = 0
> > > > > >
> > > > > >
> > > > > > With the final v5.15.28-rt36 I found out that the system boots fine
> > > > > > after disabling CONFIG_HARDEN_BRANCH_HISTORY.
> > > > > >
> > > > > > Is there anything else I could analyze? My SoC system is a NXP i.MX6LL
> > > > > > with a ARMv7 core. I have access to a JTAG debugger.
> > > > >
> > > > > I think this is already fixed in mainline. Commit:
> > > > >
> > > > > 6c7cb60bff7a ("ARM: fix Thumb2 regression")
> > > > >
> > > >
> > > > It's still broken - I sent a couple of patches on Monday, among which
> > > > one to fix the boot issue with loop8 on Thumb2. The problem is 'b . +
> > > > 4', which produces a narrow encoding, and so it skips the subsequent
> > > > subs instruction and loops forever.
> > >
> > > And what's the current status? Sorry, I've way too much email from the
> > > last 2.5 weeks to find it myself.
> > >
> >
> > https://lore.kernel.org/linux-arm-kernel/20220328134714.205342-1-ardb@kernel.org/
> >
> > Nobody bothered to respond yet, I can drop the first two in the patch
> > tracker if you like.
>
> I just switched to v5.15.31-rt38 which already includes
> 6c7cb60bff7a ("ARM: fix Thumb2 regression")
>
> This kernel boots fine now, even with CONFIG_HARDEN_BRANCH_HISTORY=y. After
> applying the patch series from Ard, the system still boots fine.
>
> I haven't any understanding what these patches do. Is there anything I shall
> test?
>

Thanks for confirming. The first fix affects all Thumb2
configurations, my patch only affects Thumb2 configurations that
actually enable the loop8 mitigation for Spectre-BHB.

What type of CPU are you booting on?
