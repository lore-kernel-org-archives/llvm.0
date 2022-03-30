Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84F739B
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 16:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C4AC34113
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 16:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648658077;
	bh=XxksR6VYfpVoCvd6RFZQQ4LAgDvEsQYSq1TNcOzLoUs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fu+2gLX21a8OwVa/+N7C35Y49yttDoosDiB88ncyF2EJRJq1Y1Lm1QmWZYUjYPDWB
	 LI4c3qy/o8BDQwI3IMF0/BgekvEW6O+eYkafiwwEwNZGYFVZBiuPTILQfhbXRDS4ZX
	 5bmSFzBTHiBsFIQmMsqNijGUYmQx12q0ACpwfkKpK7l1tgtZrxPfTCrnxg023PGp23
	 BV1vVlOtAX/+ZXz7Xo7iJqqUkB55ywTr1Fw6gTFtSaQ76Uu5Se9yVcLTVl9+AaV8tU
	 xuWb3/vi/i8li2xwKeGaIs7LcvMj3y579WIIl0FuBH6UmnJ82b9TeJQa1rgj8C0oVu
	 4q5yvWdb1fsIQ==
Received: by mail-oi1-f169.google.com with SMTP id b188so22544495oia.13
        for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 09:34:37 -0700 (PDT)
X-Gm-Message-State: AOAM533kyT02TnCwnUY7dyZSx/7BVKGT3RMynQeV+VEPtlIFaW7QgBx4
	cWND/KWlOw6dWDhmBgLNRPOLNLYQpyjAYRIJhLM=
X-Google-Smtp-Source: ABdhPJwKJbONlsIybRQcq1GD0q/R2aFe3FxVy2bnvSOqPe2G9QX4krl3/ZC9ysACYk9ULdhpxmWojW5ClA/EpSLmp7o=
X-Received: by 2002:aca:674c:0:b0:2d9:c460:707c with SMTP id
 b12-20020aca674c000000b002d9c460707cmr291303oiy.126.1648658076649; Wed, 30
 Mar 2022 09:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YipOoAaBIHjeCKOq@dev-arch.thelio-3990X> <2109354.irdbgypaU6@localhost.localdomain>
 <YkSBJD0oA7zxHS+B@shell.armlinux.org.uk>
In-Reply-To: <YkSBJD0oA7zxHS+B@shell.armlinux.org.uk>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 30 Mar 2022 18:34:25 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGLehBkaG7-t5PZqN+32MS-5BDX-QGOe6ftZnPuNDKicg@mail.gmail.com>
Message-ID: <CAMj1kXGLehBkaG7-t5PZqN+32MS-5BDX-QGOe6ftZnPuNDKicg@mail.gmail.com>
Subject: Re: CONFIG_THUMB2_KERNEL=y boot failure after Spectre BHB fixes
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Christian Eggers <ceggers@arri.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Mar 2022 at 18:12, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, Mar 22, 2022 at 06:49:17PM +0100, Christian Eggers wrote:
> > Hi Nathan, hi Russel,
> >
> > I stumbled today over the same problem (no output on serial console
> > with v5.15.28-rt36). During `git bisect`, I had also some commits
> > where a few lines of output were visible.
> >
> > At commit 8d9d651ff227 ("ARM: use LOADADDR() to get load address of
> > sections"), the system boots up to here:
> >
> > start_kernel()
> > +--setup_arch()
> >    +--paging_init()
> >       +--devicemaps_init()
> >          +--eary_trap_init(vectors_base = 0xC7FFE000)
> >             +--copy_from_lma(vectors_base = 0xC7FFE000, __vectors_start=0x0, __vectors_end=0x20)
> >                +--__memcpy()
> >
> >                copy_template.S:113
> >                ldr8w   r1, r3, r4, r5, r6, r7, r8, ip, lr, abort=20f
> >                r1 = 0
> >
> >
> > With the final v5.15.28-rt36 I found out that the system boots fine
> > after disabling CONFIG_HARDEN_BRANCH_HISTORY.
> >
> > Is there anything else I could analyze? My SoC system is a NXP i.MX6LL
> > with a ARMv7 core. I have access to a JTAG debugger.
>
> I think this is already fixed in mainline. Commit:
>
> 6c7cb60bff7a ("ARM: fix Thumb2 regression")
>

It's still broken - I sent a couple of patches on Monday, among which
one to fix the boot issue with loop8 on Thumb2. The problem is 'b . +
4', which produces a narrow encoding, and so it skips the subsequent
subs instruction and loops forever.
