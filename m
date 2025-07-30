Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D4729A9D3;
	Wed, 30 Jul 2025 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753883830; cv=none; b=HdNxJMz1gYemtLA13+RxfPiFzynTLSkob8WhQANMFCB6lHi0jsjcXInHSbBtxEWVIRU5xA0gOokCI4Po7h3UlKGGLHJyJyh/MCcTZYDMneQkzOrSjL++vci7LYxaeSuUT/vA4ugt3fgBtwVnFOePQhug7H6QdZMWVuY6Z7H4QEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753883830; c=relaxed/simple;
	bh=pnXS+ZeQrAV806NHxF70MyvcJe+ytbXZbl1EeUCQArQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GNnS4Ua0hbPYXsoUZ7LAKHGiinyccPi8toJi+6oFNbbofcqGHzrYFzBfet+RwdJp7Wva4aVj0/Ri1tgo3xFy3JcF29gtHqfdzPL9J0roWHsGtrLOjkL10EHKYSWbi0YN6/EG8jN//0mW8AASd/7L8HhXTa9/dQLp+rHKyqSeRIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4f2f2f22c1aso606817137.0;
        Wed, 30 Jul 2025 06:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753883827; x=1754488627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tXb90Hs6p9aqwd3uCfNog+BrrHi7uqFWUQ414hzBWg=;
        b=lbQsjnJaoBdX0CMBOx7aLlKx+R5/Zt34OGolrlKvMSWQO1ipLdtwrx/Q7kT0fROOUl
         Ng5nBf2SbN1xYHncLLoVfUsPi5rzu5tZShWcoIuJPKgGohMWk2g0Vat35uAFZ6qboQF/
         FqatL9+RuWRVDDd04IBjzQkYEfqYBX0GhWYIILniek9yXhxrxCbj8FvC0KKaGzB8lMNh
         0JnvdHZhfBMHP18C4GvD4iI79Qoi2i2hl+6PqqmXhm5Lx91taf1okjWRuRShB1juDlMV
         PcRpUBXa4ISeztuTUxE5b1cBMaV1L+Ys5nFOMgri2npi+bAy525/PwU6sctbGYYBAAIS
         WMlg==
X-Forwarded-Encrypted: i=1; AJvYcCU9tBOaWm5CVHwQscEivjk/aS/rM+0p2OHpkvsxN++PZjWl5qmdgJtaGGD/JOLlRMyCJByi@lists.linux.dev, AJvYcCUDNTKAFPgqpcmNgMf4SGq/8Pkn1BABJ/30GEtggxH08R0qJUXZ63OGsQ+0iBNjHyGYPkjt7CeirRCBOPyAZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqNXzYivJ1NX7/d9MHqU9ElWrVKa7eci8mplpx6XG/W4ptIruA
	rZwQOvxmvzZKYrKMXV75+DrAEbpiMisvDHT6Ha/bS+abZ8ZM6ZlEDtg0HdUot9nd
X-Gm-Gg: ASbGncv6VQyGRCqC5jxeg5WOKckBFJKD+yv29L5O8DrDhLXAiMNaQPjWsHb19OfKIbW
	iK7/glCu+7JaR9oWS2JmJF/3PfTHvMoNfRAtca/1NI9hCIt8JUoWn2+eWf7vig563q5VDN0x7ff
	bJpA8tLHd4IZdxpJZFzPSug7v0dqfiCkoEnz7JcP7eU0NmY/Ix7ZAGE3zJhhnStwY8Eu0Ymnfl3
	D9v9wKavvnN37YGRi/dFxPVymqQf1auH+0lz3b51wLrdVrOId+DAB683U7173Y3MjD8FWnx4i2J
	nPZa+HoLWhcUkBZrTxdK/vJ3ndbl21fA9+6uJBHRszbSiVjgtByzTNR1qY2Bjhncl0NoCvPKESf
	w9m01n0Zd1Oy5LDE00DhB7WobNp5oenx07irKv8DtDco8MrXyn3BVTyczl/Xa
X-Google-Smtp-Source: AGHT+IEmCP8vfe8FzieXSeKuESymPwSblDYK/CTnBeA3W9/qgFEfJoOQ1F3KhGst4+oMNOGEu3C6lg==
X-Received: by 2002:a05:6102:83c3:20b0:4fb:f559:116a with SMTP id ada2fe7eead31-4fbf5591345mr526396137.7.1753883826553;
        Wed, 30 Jul 2025 06:57:06 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88b8d8c5696sm2337780241.5.2025.07.30.06.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 06:57:05 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-88ba493e984so431920241.1;
        Wed, 30 Jul 2025 06:57:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgS2y98PY0S5aMUjKX7VQ3wkg11tDSmo6uQQrGrGVjNU3WyZftb+uhKquoTaKHcLFOrTon@lists.linux.dev, AJvYcCUmhk8WFlO+EnOHRYYu9f5Nf8WosLHnCdVDt0ZVw0+xXXX9D61WXV7O+VD3fF/PIqPtZVDyQezOLV2XydKXkw==@lists.linux.dev
X-Received: by 2002:a05:6102:30dc:10b0:4ef:a46d:dcaa with SMTP id
 ada2fe7eead31-4fa77918e19mr2727446137.6.1753883825406; Wed, 30 Jul 2025
 06:57:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250727160731.106312-2-biju.das.jz@bp.renesas.com>
 <202507301421.AmWhOZBk-lkp@intel.com> <aInjE-sduVbBRmJx@shikoro>
In-Reply-To: <aInjE-sduVbBRmJx@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 15:56:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHog6rehPFu9t99N0F-69sr1fQGWmX1sBR40=kDvD=Bg@mail.gmail.com>
X-Gm-Features: Ac12FXxXrlohX7L8lLksOtpqFo1L0Wc-yLeqGDDQ2dNNpRDdPIsNf4pmzEDKaN4
Message-ID: <CAMuHMdUHog6rehPFu9t99N0F-69sr1fQGWmX1sBR40=kDvD=Bg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mmc: tmio: Add 64-bit read/write support for
 SD_BUF0 in polling mode
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: kernel test robot <lkp@intel.com>, Biju <biju.das.au@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 30 Jul 2025 at 11:17, Wolfram Sang <wsa-dev@sang-engineering.com> wrote:
> >    In file included from drivers/mmc/host/uniphier-sd.c:21:
> > >> drivers/mmc/host/tmio_mmc.h:249:2: error: call to undeclared function 'ioread64_rep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> >      249 |         ioread64_rep(host->ctl + (addr << host->bus_shift), buf, count);
> >          |         ^
> > >> drivers/mmc/host/tmio_mmc.h:255:2: error: call to undeclared function 'iowrite64_rep'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> >      255 |         iowrite64_rep(host->ctl + (addr << host->bus_shift), buf, count);
> >          |         ^
>
> Sigh, then the guard seems to be ARM64 after all :(

ioread64_rep() is defined in include/asm-generic/io.h, and powerpc does
include that.

Perhaps drivers/mmc/host/tmio_mmc.h should just include <linux/io.h>?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
