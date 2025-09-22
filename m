Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99DC2236E5
	for <llvm@lists.linux.dev>; Mon, 22 Sep 2025 06:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758522724; cv=none; b=g6vgsnAVqOnGN5PehzNraPtpzBgCef2qNzmASq5Xcw8T/IsIwk4WB0xM7wA+qwFywoEPQFDLB+lNYJn6nhE4KJmEnQRCgohGfAJF5BSykoQQzyllKjF3plboO97/bxian9cmUXVRI56/UCms75P5PfzHH0ozL5KyYt/9LEaKyug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758522724; c=relaxed/simple;
	bh=GcxGZtlcvANM4ISN0vX5FgQ46FyXpsKP4aF2UdyoWm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmBNc8itQK4Uu/sZnULbSueFLEgUpbfTAhqq1ZFbkG3/cfVHw9Etn7Vk7/2mZX8PyaZkzKfPFYM/fMpfD2pjZZnRlioJ+suIbgbqZh1X6oUjdaD5+VD+2BW0d41Bc0ZHLukT0T+lNYA5F1eI0Ygz1ISPKVxzJ3nN8+YrN1OBhQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-51d14932f27so1208295137.2
        for <llvm@lists.linux.dev>; Sun, 21 Sep 2025 23:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522722; x=1759127522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9Xa9qt87OWMrii0JP5Zzn4osjNDUYE7qcLRx8KQ3iQ=;
        b=iteThV8uQ/j3T3DCdD45GKVM1klWXLBtA3ScI47l4rWX4IuulSbIR0kE0LARQs+/we
         Bsj3ag8PUXx5Oq2/28SB/8eXdB/Rdbzijw2sQpSyiN0hB3UcM24AAT27FkLz4USAJul3
         eMzDknU86FSWgGQ99Q5/MP5DRgQ0PGATlEMWi1Q8JzEfkQ388Rq1KIGmQFwyExOs91pd
         B7wzPqjNDhtZfd0tp7qvtJRsddriEXyl2TeYpxOHFmc5ybF4X/PV0aOG8bFrYISysdGh
         brY1jdqpINx7jRDNGCaEwogwE+el4NPTUqApJSLlULA22xXn2IrAyJwaS2JKyHDQM370
         7n3g==
X-Forwarded-Encrypted: i=1; AJvYcCWpFETFG6yXcB0AIAg9q2gtdjtmW68lPzU7D0PPDusTc6YW7HIO1P6YGuxktOFn3GyNptAL@lists.linux.dev
X-Gm-Message-State: AOJu0YwQg2JPOl4ztmkvR16zwQjYkAU5TPHno8AVhNWodk9+Wx8GxAna
	x+Mp1hMkZzhy/fsfTjiLskdtYRBKDOiKOzfzONTLdP+rRNc85g5DPLazTGGlRLvH
X-Gm-Gg: ASbGncsH1hMJOrfw0z58s52QuNJVoxTbInFeLoND0e8/F+x90CPMIi3F7WhqJJMafJw
	M5QOj3+UiGnmrCxdrID40WV9F+e3aiK3xZDH7EmdLl6zA3qiPXUchFrrFv2GXj58eDR9Or077hZ
	nLIJN/JdhsCsYSBhjtedkLDUitaIulobDU9fr0tKvqg2M8oCGr2cqjpH2BL3M2SB9zzIA1VYdio
	Ja7LbTk2XueGiP0u7NKi32LosGcfCWGhwrRkQ0Lk94VF8EU6xzeWYNcXz7QMRp8zd86QA40oLMd
	XsFPSF7lJ1aMkbw9SGgSc6xeuf3MwQjcpaq4ichtzfU1oqouI5ETHHYYOQbvrFgUatn9Lkewo7y
	xaLA7/IqF3/U8eTnp4z/i2CP/7NlDMaE83h5OT8Wj4YFYWZKJsSR0snS/bwmG
X-Google-Smtp-Source: AGHT+IH9feUmAbgOKmVRVsCSlNXsUBgxhb1k3IuyQ4P1w9QnlKFQpGz9jNIhlXcN1+sssCDOMtludw==
X-Received: by 2002:a05:6102:d8c:b0:524:89c1:7788 with SMTP id ada2fe7eead31-588d96903dfmr3187021137.7.1758522721548;
        Sun, 21 Sep 2025 23:32:01 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e3e58e81d8sm1963680241.4.2025.09.21.23.32.00
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 23:32:00 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8a967f3a873so1548511241.0
        for <llvm@lists.linux.dev>; Sun, 21 Sep 2025 23:32:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDiZgUjiV6bbPK1oR8e/vb2HqtBrb6C1jSf+fq34a3rEx5YzjOtuUwdPOs+19fBucX4mdr@lists.linux.dev
X-Received: by 2002:a05:6102:449a:b0:59d:6be4:5b87 with SMTP id
 ada2fe7eead31-59d6be45e33mr1180465137.12.1758522720412; Sun, 21 Sep 2025
 23:32:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202509212320.yCuqvnVn-lkp@intel.com> <202509212148052be5ea9d@mail.local>
 <aNCVl06r95XVn80G@rli9-mobl>
In-Reply-To: <aNCVl06r95XVn80G@rli9-mobl>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 08:31:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXD_pBmMXB9AtBKXYzpvSwedCx=rQ45BN3J7EHB8aw=jQ@mail.gmail.com>
X-Gm-Features: AS18NWDJ1T0UMfydU9Ibm_gReDWXEJQCvT6Rk0CJxMCHwZSA2VY1VEA5R2-Wtso
Message-ID: <CAMuHMdXD_pBmMXB9AtBKXYzpvSwedCx=rQ45BN3J7EHB8aw=jQ@mail.gmail.com>
Subject: Re: drivers/i3c/internals.h:54:9: error: passing 'const void *' to
 parameter of type 'void *' discards qualifiers
To: Philip Li <philip.li@intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, kernel test robot <lkp@intel.com>, 
	Wolfram Sang <wsa-dev@sang-engineering.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Sept 2025 at 02:17, Philip Li <philip.li@intel.com> wrote:
> On Sun, Sep 21, 2025 at 11:48:05PM +0200, Alexandre Belloni wrote:
> > On 21/09/2025 23:54:32+0800, kernel test robot wrote:
> > > FYI, the error/warning still remains.
> >
> > As replied multiple times, the error is in the sparc64 code, not i3c.
>
> Sorry about this, the bot will be configured to ignore this issue to
> avoid further reports.

It is expected to be fixed shortly:
https://lore.kernel.org/all/fbb1a96c-d913-4bdf-b40c-c8981601bbf9@gaisler.com/

> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   f975f08c2e899ae2484407d7bba6bb7f8b6d9d40
> > > commit: 3b661ca549b9e5bb11d0bc97ada6110aac3282d2 i3c: add missing include to internal header
> > > date:   8 weeks ago
> > > config: sparc64-randconfig-001-20250921 (https://download.01.org/0day-ci/archive/20250921/202509212320.yCuqvnVn-lkp@intel.com/config)
> > > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509212320.yCuqvnVn-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202509212320.yCuqvnVn-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    In file included from drivers/i3c/master.c:21:
> > > >> drivers/i3c/internals.h:54:9: error: passing 'const void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
> > >       54 |         readsl(addr, buf, nbytes / 4);
> > >          |                ^~~~
> > >    arch/sparc/include/asm/io_64.h:265:41: note: passing argument to parameter 'port' here
> > >      265 | static inline void readsl(void __iomem *port, void *buf, unsigned long count)
> > >          |                                         ^
> > >    1 error generated.


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
