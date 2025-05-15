Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B9D18A6AE;
	Thu, 15 May 2025 16:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747325449; cv=none; b=skCknWW87RIQzHXVYACtJHOVVxD3qc3WY4exf4gfF/hpgz+84u5vzeXzpRqmNOnmC4iXA/ItV4p9B5liniMQ+FfHGKhuplIV1KG0VxrQYNnEzNtXPV2yRe77rCxbuz0HSgx7ZZ+H4cyviT+SYWvTz+Q/QTiDimsXwOj12QfkmOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747325449; c=relaxed/simple;
	bh=af9vxyEjUFLXkXblE0fNKzVVCZxvU4UnA/BPCTRi0Ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPgQB7shBwHo0WmOC7pfs5DaqQLxBF0waBxj+d7/vrDH02An3u3AorLYQImLfMDfK1Jba2+FwkEp96T7Za0xQdx7x23oCAFdn34ij0ckTknzL8Lpas+0yOwd9S4IbNZ+Cqt5eANU/maOD486mfLTor5DHTGNAM9LsdpKIk/IdnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pb+RWEoo; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pb+RWEoo"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso12100605e9.0;
        Thu, 15 May 2025 09:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747325446; x=1747930246; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2RUuqM7j77YiC7O2/E2sWiPYfT3vLPzw6aLspbrJ9A=;
        b=Pb+RWEoow5xJlOLgKGMcn+BqQ/5HgV7YGe4m5jAAs6YkgZtyY4gQmk+GI2uMaur59L
         nlfZQ+jj/OLGyeSEuaqZoMJvVFYGUOrqrhVnr46BHbzSRDAFLmDlL8FPiYIPAP1stSt6
         muGABgFkORlR18nSEDUzCKol9CvGPvF8gTQThplNH2QKxt4xhZ5YVJCuC3tPFgG5+9qs
         2GCqD9ejfJ9sjnqIDvXJ+9twkPaawczWRSuaQnqP0nj0EkBF1jnUwgtxNd392qagTC3Z
         gS8lTiy6Ye/AN3GeFa2jPvObyxvzp5Xi8sLG77Gdqrv+xWBGei9qPexI8fMWFf2n2Tkk
         yUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747325446; x=1747930246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2RUuqM7j77YiC7O2/E2sWiPYfT3vLPzw6aLspbrJ9A=;
        b=WKEz81R30jXtkEtwOx87tLSZAsA8gDss2F9+rZiICQtvm71fiW29iuDmLWFDuCJhPb
         5qLbfTJR5wO9mLpgW79ebzQtOYFkrLTocCDs1w5ElHsz1hQ2BM5LWZAoh5WVW7cbP7Xm
         laS9fbmUobVRybyXKsHOOYUhxdktiIbIFSU4IfSR8txnwApjDPcnpcmuKYkhLb6cNvha
         Kp6uSMTDRawgRZ8GoUDWyZ+/oRHnNiHouGsE7zVaQoEpaqbeBzsg1KmeRYh1dPDq3ERT
         kbm3Q+U04vSxI9ab0dMeKTq54mv3xOBt/5wPY+Pg9U11LXOdDACc8uxgD1T/P1GvCsp+
         NNWg==
X-Forwarded-Encrypted: i=1; AJvYcCUmLo06mvZmBW56Mby6/tUSxCMj14bsV1g7ke5pCJKyfZjU0QC4EKGYbTm+Cb6C5JBV2X/M@lists.linux.dev, AJvYcCWlgMrMP+Pz8FynPG6bZb8mtWygetPpkryWqT+A42C5u4tXPDao/LtVoyR5pBYUrmwT37BCcGrAxRp6FUq/Gg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ9gc95OoSk27OQQeIrHNbTX0O2GXtm7cqVVxCnSs5tVnFuvo+
	wTG22bHa75ZgqISv3x6v5FYh+Ikecc39iDpj/1dNg1h9uu1PAaGQ+SlLfDd+1tPJXJuEWguAm2J
	KsGMiaDPTg2U+1vf+KY1ASpSS9pXLwAw=
X-Gm-Gg: ASbGncsTVSqLVWtkb0ldXok0+cZxOMpNTLeQzs53h/txdxnC+XK3JxvWYrLyBIJQKj7
	0L/xGuj3YVQ9dTimu1wH7PsOZF4G5LE1vbhPW8dnrhavgIWPREjZXsGPLFYT2qSCN1aO4S6Cfd+
	DcIYVbNaWtCZi9o//YVdBBPXiFnsNt6wM=
X-Google-Smtp-Source: AGHT+IFZbUVdPwHyT0Clm2bKqbykU6Hoz0divy6kyYfkhV2fc4IbIeu9yY9VFI6isbO+t3Jgv72E5GlEP9c/n5Vmv4I=
X-Received: by 2002:a05:6000:2dc8:b0:3a0:8325:8090 with SMTP id
 ffacd0b85a97d-3a35c825b99mr373886f8f.18.1747325445358; Thu, 15 May 2025
 09:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <202505151255.rCHp8Bvu-lkp@intel.com> <CAMuHMdUh3oXniR3b_g+SuqXXeB=3YRFSVOONOth7XRNpHC=a8A@mail.gmail.com>
In-Reply-To: <CAMuHMdUh3oXniR3b_g+SuqXXeB=3YRFSVOONOth7XRNpHC=a8A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 15 May 2025 17:10:19 +0100
X-Gm-Features: AX0GCFutHTsXdF6X-UzPCdROzCLoI3M2MdWC6VhMZtfwaAYxbEp32opOSVRegW4
Message-ID: <CA+V-a8vrLyWDprGMcnbPQ5Skt=+zcRA6nJ6APOQ2V0d17pfMog@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally
 enable reprobe support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Chris Brandt <chris.brandt@renesas.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, May 15, 2025 at 6:59=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> On Thu, 15 May 2025 at 07:04, kernel test robot <lkp@intel.com> wrote:
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on tip/timers/core]
> > [also build test WARNING on robh/for-next linus/master v6.15-rc6 next-2=
0250514]
> > [cannot apply to daniel-lezcano/clockevents/next]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bin=
dings-timer-renesas-ostm-Document-RZ-V2N-R9A09G056-support/20250506-223636
> > base:   tip/timers/core
> > patch link:    https://lore.kernel.org/r/20250506103152.109525-3-prabha=
kar.mahadev-lad.rj%40bp.renesas.com
> > patch subject: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Uncondi=
tionally enable reprobe support
> > config: hexagon-randconfig-001-20250513 (https://download.01.org/0day-c=
i/archive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/config)
> > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project=
 f819f46284f2a79790038e1f6649172789734ae8)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202505151255.rCHp8Bvu-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/clocksource/renesas-ostm.c:235:34: warning: unused variable =
'ostm_of_table' [-Wunused-const-variable]
> >      235 | static const struct of_device_id ostm_of_table[] =3D {
> >          |                                  ^~~~~~~~~~~~~
> >    1 warning generated.
> >
> >
> > vim +/ostm_of_table +235 drivers/clocksource/renesas-ostm.c
> >
> > 3a3e9f23c2cae9 Biju Das 2021-11-12  234
> > 3a3e9f23c2cae9 Biju Das 2021-11-12 @235  static const struct of_device_=
id ostm_of_table[] =3D {
> > 3a3e9f23c2cae9 Biju Das 2021-11-12  236         { .compatible =3D "rene=
sas,ostm", },
> > 3a3e9f23c2cae9 Biju Das 2021-11-12  237         { /* sentinel */ }
> > 3a3e9f23c2cae9 Biju Das 2021-11-12  238  };
> > 3a3e9f23c2cae9 Biju Das 2021-11-12  239
>
> The table is unused if CONFIG_OF=3Dn due to
>
>                 .of_match_table =3D of_match_ptr(ostm_of_table),
>
Thanks for the pointer, I'll add a __maybe_unused compiler attribute
and send a new version.

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
