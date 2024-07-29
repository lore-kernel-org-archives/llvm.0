Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD95384DFE;
	Mon, 29 Jul 2024 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722243805; cv=none; b=iJft+19gL9AckeqU1DugjNBLTly9hJkgdIxSwqeHzyIfU7IesnnddOi1y8wVFJi6qahBPwOgqBvSsPhdSVc+zs4kOkDwGfUE6f+SlU68yKFBDO4ArsVy9yrn0X80UDci5xhhuZtru6H5xsCmWL8x6iWJ189+A1jIWFDbQKGAjnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722243805; c=relaxed/simple;
	bh=/WnGTgdKzi9/ZXuEBxo7lVNZmweCt0UgfSEBUF84shE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGJf0MfeP3rTw5xjribLe+Ocv/FUbNytetvaI6qGY6a3ZDZJp/+lKGUyvKLvjNrs2mQdQFkMJatvF0FVHSxnw0GmboPY9CudySMUUvX70bppgmwaMqhkJ5WuqVDuGOoJA6slQbiipU8OFFwWw9rvJwF9VntVJrlSJ6epokEAtOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6694b50a937so20898917b3.0;
        Mon, 29 Jul 2024 02:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722243802; x=1722848602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLbqaqEOtB/B4lpRQBFvyP19U97Nn5fGO/VXyIeHdqM=;
        b=wcL0kwAXyYqKOeTR2NBpruv9LlM4x/9kqRNkOuo9RkY1RrqbRUw/7qkskfRpZZJd+C
         dPCMtTnfPNgj7bwF+Q/xBsQ5FeuMjbEYdBFITSfWtvvRSMobdQDC4RFqLfLIicloPmBQ
         biSGCxnWJMjvQRJKv8X1gtLjKpUKLYNJ5kq8EFuB9x7w+dVRjK4y8MCR3267Q5iBjZ0r
         uKoRdMXpWzLxBDygyRyuvfF78HB6gV8HdD694UQb7JFZTsiecsoLZLAT4NmVRF2tOi/B
         YkwTZ+UdTuHB8hbHZAJebBkF5YLOKNW6ZPKoZW4n/y2+RmD3JGNUQCMJqyYpM/+8X7YO
         +vgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYitq81HIB7OQdorLM0nZBCTP5MbfwmkkHaqGl+txJGagpcMH87xS9Mg5/8Mpz+ywXuJ9wmITBj0USe7zc6SOC+kQ5luEcnMz6B/A7pCSUnFoPOWB/n/gl9rw1ElvkcU4QFtc=
X-Gm-Message-State: AOJu0YxNWQmbPnJZDta8vp6Bww5kgBwMBFMtMZ6vpXcvLEIPa/5pVjY8
	pLJyrxucphtx/wt/FBqA0Afxq43Wb5GMF36M67Dms8Or2coyfVxq8SdCCV39
X-Google-Smtp-Source: AGHT+IH0ErQ8bb5kNowzqVbqOBSWXabhnfce07XjYmKcJh+ShwNbSwR3uVX5cFo9lvKY2d8js6EzAA==
X-Received: by 2002:a0d:e744:0:b0:650:f7a4:c70d with SMTP id 00721157ae682-67a0a3239aemr76198487b3.41.1722243801954;
        Mon, 29 Jul 2024 02:03:21 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-67568112216sm19864077b3.59.2024.07.29.02.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 02:03:21 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6694b50a937so20898667b3.0;
        Mon, 29 Jul 2024 02:03:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdQ4Z8maZUeY/zMWC5cDXXsrXA3KlpaiymUtDKZE/UKszZQBjW6ruV5MGrOpcpnJo9VPXLJZ7BR89dR3nopb0MtbUwvBUnkJiUp+yGJ/Xj7GKXFfZO2Mt6B61cjPAMVvxn4ls=
X-Received: by 2002:a0d:ef42:0:b0:664:ad61:a487 with SMTP id
 00721157ae682-67a0672a653mr79228637b3.13.1722243801317; Mon, 29 Jul 2024
 02:03:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407290414.8wyOYC9H-lkp@intel.com>
In-Reply-To: <202407290414.8wyOYC9H-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jul 2024 11:03:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgo3-LmF8-BMAL_f4xCws4EW2krYDuvAZEO0LUqb2jrQ@mail.gmail.com>
Message-ID: <CAMuHMdUgo3-LmF8-BMAL_f4xCws4EW2krYDuvAZEO0LUqb2jrQ@mail.gmail.com>
Subject: Re: [morimoto:renesas-bsp/v6.6-dev 282/297] ERROR: Input tree has
 errors, aborting (use -f to force output)
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Sun, Jul 28, 2024 at 10:47=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
> tree:   https://github.com/morimoto/linux renesas-bsp/v6.6-dev
> head:   89c2aab123595625ced4d7e7b1c66822d503ee2c
> commit: 370689558ac9370ca8ad49fa143da77c8aba4ef4 [282/297] arm64: dts: re=
nesas: r9a07g043: Move interrupt-parent property to common DTSI
> config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240=
729/202407290414.8wyOYC9H-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c=
cae7b461be339e717d02f99ac857cf0bc7d17fc)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240729/202407290414.8wyOYC9H-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407290414.8wyOYC9H-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    also defined at scripts/dtc/include-prefixes/arm64/renesas/rzg2ul-smar=
c-som.dtsi:139.10-231.3
>    also defined at scripts/dtc/include-prefixes/arm64/renesas/rzg2ul-smar=
c-pinfunction.dtsi:11.10-132.3
> >> ERROR: Input tree has errors, aborting (use -f to force output)

Missing backport of commit 808852fa3a5e11c8 ("riscv: dts: renesas:
r9a07g043f: Add IRQC node to RZ/Five SoC DTSI") in v6.10.

To make it actually work, you also need (from  v6.8 and v6.9):

1cf0697a24ef60b3 dt-bindings: interrupt-controller:
renesas,rzg2l-irqc: Document RZ/G3S
392703b6a18bbecb dt-bindings: interrupt-controller:
renesas,rzg2l-irqc: Update interrupts
372487b295557b6c dt-bindings: interrupt-controller:
renesas,rzg2l-irqc: Document RZ/Five SoC

+ many more recent changes to drivers/irqchip/irq-renesas-rzg2l.c.

Happy backporting! ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
