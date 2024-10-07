Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CCB1662E4;
	Mon,  7 Oct 2024 07:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728286171; cv=none; b=B5VDXr3W2m4JW0/SQUK+gdzoo1zOCXL4daBvD/q778BD0uVSKPvxkvtMAr11yGRxVW78Zd7GOy3mdy33L/7olCHIjoxjQZ3lBExRC54JcDctJ5LihNQl33EKfbAzKc0NTJRcaxIOm4oC4+d+oA3AZk0xL1SYerD7pfAIl1BkP+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728286171; c=relaxed/simple;
	bh=Ww9eYYS5jNTwBgRSIu11cA4dJXd4vFLZIt3gb/03VJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fG64FhIx41E6KoCLcgGQgqPDrH/7PsnNQQ6FDSQtJEbiAHHPj0BjLsYWMk+JSUk4APOW/yR+jnQZR7iCI57muXSpz/0CiNmAVakxCM2V3j4pYX4RcZ2WjTJ9nwEaDxLRLK52mDbTPQyP9SfJ0lwfnJCioCA4T3fEltKrNk8baDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6dbb24ee2ebso39360567b3.1;
        Mon, 07 Oct 2024 00:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728286168; x=1728890968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbQbgTs30umbo122cljMmYM3mtmZNI72eKTLia8qsig=;
        b=xGXIa65leNTJcWURwD9S+bRUmFN0xVUtswn9hW+T5ZHeuXhnEyK3F7DHR9x7CNpmWM
         a8wZ4gHAnaxGfqyHXTfsRb2I9JgtpOQXclDnxiq1ay3Z9OW5ZfXrX5dee3xVWZGgMZj0
         ePpkXK603CHc4pua40oNWVFNCn7ii999ct79AbAVAovE0mncpcfKQ7U5xa/w8Yj1VKnY
         +8/sJK+Qqa3emP98JP+EpM29zi1PbQbbkGYfxrR9fiHBgEAws+FVc/EFw0uGs0b4NBMv
         pWciExZLEoj3EizxmDiBdvvSaQqSm0VOF1xD1zVXz5ej4fbUVZJxfTEH1t22cOSt35q8
         t35w==
X-Forwarded-Encrypted: i=1; AJvYcCUTXm8cOiRnz5NioY64mvY7s+WAlAxbrM/MjwKHMdtM7Hw4VwcL1Tkmte/drpJaZNgiQp+aUTDCnKrM39QU6Q==@lists.linux.dev, AJvYcCVhH28axzQe0CGM38uqbiSzchcBkntdlUX2FvJdI93Y9XDx6wWM06rGuY08alPdB6BikBAd@lists.linux.dev
X-Gm-Message-State: AOJu0YxA3PZca+jmRh1peZ0eOuG/8T7LM9Ku5v+uHoZg8KiZKL3/kMyh
	7tiioCnYS54gagNo9iiMrAjV3UzYw/aLKfPWA07ontYNIE0BflPN0F9IE9bF
X-Google-Smtp-Source: AGHT+IFd6OBBp3igPtQET/0AF26dFsyH1QR3rZmp2H0fwRvsBuGoSUeLJ9rEJ7BbF3B9N8oymdo7vg==
X-Received: by 2002:a05:690c:89:b0:64b:5cc7:bcbc with SMTP id 00721157ae682-6e2c72968a0mr92968407b3.32.1728286167827;
        Mon, 07 Oct 2024 00:29:27 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2d926af43sm9515587b3.19.2024.10.07.00.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 00:29:27 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e262c652f99so3331570276.0;
        Mon, 07 Oct 2024 00:29:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCfSyyUEVmVwwW1PgfWDSfOSV8Lr0NG6uB9PJZdfWlOKk37/Axeq4J90GAyA1TLaCOWVc16JIWf0ZsW65bDQ==@lists.linux.dev, AJvYcCWZZCHFQn5H9sN6FULqmwOdZbrDSuwdDQ1Oy9xLTEg742lGhyP4iqBXCt38LB/I7kZz0m4s@lists.linux.dev
X-Received: by 2002:a05:6902:154e:b0:e25:abb9:ad5a with SMTP id
 3f1490d57ef6-e28937dfc0dmr8193336276.34.1728286166869; Mon, 07 Oct 2024
 00:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202410061908.Lm8VNLVk-lkp@intel.com>
In-Reply-To: <202410061908.Lm8VNLVk-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Oct 2024 09:29:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWHubSB3snuX8kqFsuGjs7uhytaHRsStoL9+4rEs7tX7g@mail.gmail.com>
Message-ID: <CAMuHMdWHubSB3snuX8kqFsuGjs7uhytaHRsStoL9+4rEs7tX7g@mail.gmail.com>
Subject: Re: [morimoto:renesas-bsp/v6.6.53-2024-10-02 164/306] ERROR: Input
 tree has errors, aborting (use -f to force output)
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Sun, Oct 6, 2024 at 1:44=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
> tree:   https://github.com/morimoto/linux renesas-bsp/v6.6.53-2024-10-02
> head:   ff705f5bf8a9ed4ebcfed1a104896aba101f914e
> commit: 98986fae4eeddc6ec59408071ba7a579dee12655 [164/306] arm64: dts: re=
nesas: r9a07g043: Move interrupt-parent property to common DTSI
> config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20241=
006/202410061908.Lm8VNLVk-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f=
ef3566a25ff0e34fb87339ba5e13eca17cec00f)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241006/202410061908.Lm8VNLVk-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410061908.Lm8VNLVk-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    also defined at scripts/dtc/include-prefixes/arm64/renesas/rzg2ul-smar=
c-som.dtsi:139.10-231.3
>    also defined at scripts/dtc/include-prefixes/arm64/renesas/rzg2ul-smar=
c-pinfunction.dtsi:11.10-132.3
> >> ERROR: Input tree has errors, aborting (use -f to force output)

Backporting commit 808852fa3a5e11c8 ("riscv: dts: renesas: r9a07g043f:
Add IRQC node to RZ/Five SoC DTSI") from v6.10 should fix that.

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
