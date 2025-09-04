Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178D72BCF4D
	for <llvm@lists.linux.dev>; Thu,  4 Sep 2025 07:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756971516; cv=none; b=USo+JoFMeelUOt1ofwbdo9QcRYgh9ofQ/of3Okvotnl87nlsVsGtn37tudzTp68pD9NOREXUWMkWhg0PxcI19OkwVqmwnVnKZYUVJBzJvmev94woTQuSpRGeU+pvP39PfqsR6Gxr4pHERXJ/uHvfEMvlpusSblyzHFzL2zB6sc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756971516; c=relaxed/simple;
	bh=FbWK51zuCaG8lucEmAI2mMSW2LMRM66FMsNCbZr0bsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jG1NH0c2xCipx8fJEyZbukvFhNs5SfWqZaFEiS7OMivKxuhPZ8sWoG6eB7hi5piV+ZrlSCAlrw0s1FL4LwnwuvRCClRGRfRpfKf7d/p2rgNG2ufqAYNU5fa8+9gmZwO9RparifLL33u18LzRqj9eDicuPAfkRYma0TYlPofWv8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=s86tH8ui; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="s86tH8ui"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e970599004aso787989276.0
        for <llvm@lists.linux.dev>; Thu, 04 Sep 2025 00:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756971513; x=1757576313; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgZhEVyr6juMKHl8gJtC0+SUexeCcUE2zJAQWjvjjYs=;
        b=s86tH8uiU75i5QwtmhoPUeQNccjBgZZmcZtm/CCa/gR4TfDf1KMIQZDGJpIvOeg81N
         SUJdwniU7EiqWFW8UKwUAq9CogkBDzyh1b5gn9/YnnyhfPV1LTubjkkgnekfvklRjBwz
         W4QFHamBCCR/smjTaTG0KtjX5dOAoOCWej6UVSRxo3cEwE45mFF9Q4voYcDshWlvkDh2
         B2gPB5ahBwME5qsQl+380u5gcCqQxjjlbcjuBzzAm/zMy0xUMXui+Iq6gwaJfJkpWdLA
         z7ijpoRpii+D1QANNFwLAX8yfuEzlXbaXozgakt35XH+OZMjEdUFaNI3o0mjjGKckB3u
         0PqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756971513; x=1757576313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgZhEVyr6juMKHl8gJtC0+SUexeCcUE2zJAQWjvjjYs=;
        b=A0ltAt7XHEqu0Qd1DntFYLKMz5TIac70IbBBhngUftM1+ch4p7s9yKtiF4p7IWFxS/
         xg6fwe8Dn0dON78R2Ek9hdmJ9+C1Cl+2OIHyHzmwwgjVwBzvMt51XYlsEO7WEJAPs/HS
         8/TLfmXIn73ZLd658JHCvaXjXudzGDcD8d24k3Q402B0t1AHPpvKu9F6QtsJJS1JlXaD
         ILNtz2feGzPVVPyPRDtHhsor/0+ADjYRL5vEOLeb2rae9dDi5DbZDFegKWU0O+wkQF1G
         7mutCKjPjl1uv+7SpqmaRoujJnd7fl+Q7ouYGEmyheEdC6F8NXpB7Z1nZv6BjEFZ5fw5
         imsg==
X-Forwarded-Encrypted: i=1; AJvYcCXEEYjT5Y3LwOsXpC5ipBerAEc19+47DPadnMRaZKAoUmEVNtCDYil86G1D2vPL0QVFQWvT@lists.linux.dev
X-Gm-Message-State: AOJu0Yw95rroLiGq527y4ySDgWABnHvy4DHZGbnnr9PzruSYTwleDz+I
	5ucwXZ34WeCxKjUKW5iVv28vsH6QROHcYSH63Op0kCZqW8InM0/dI2P7Ve1j0w0YPG1xfHfTQK8
	dJ2WCB1ynk6Lx01/ziGt1dglXEJBE8nql/Fh9c5T+tA==
X-Gm-Gg: ASbGncs/+eHEef/h9kVFoON2ioHfhLLTv5R+uiM9P6ujS4KUG6yvfwrZgR//jZmk0tG
	ynXq/eO6I1b+pjs1ea0eoeLp5iOp+0/1RyXuaEtCSY5F6DtGKNOjAD3gqzvGg6QCNrmSTIPatt2
	KtjT+PaYnJz8Wmv9YzYOrRXUXZkedoCHVvnCmvnkYL4FpTwRf7N9E79dLw47r97+XLyO34ts6sd
	U47y3LECZM=
X-Google-Smtp-Source: AGHT+IHAqMzaONaSYMHfHIGLX6FXI5tM+wIyElctL+Mo7Yefx4I8BbosB/7EjveV6AmnpmC/MA9KKw31I0NQom67AQc=
X-Received: by 2002:a05:690c:312:b0:723:8ccd:6898 with SMTP id
 00721157ae682-7238ccd7709mr174479327b3.10.1756971512980; Thu, 04 Sep 2025
 00:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYsPcMfW-e_0_TRqu4cnwqOqYF3aJOeKUYk6Z4qRStdFvg@mail.gmail.com>
 <a07b0ebf-25e7-48ba-a1da-2c04fc0e027f@app.fastmail.com> <20250903165931.GA3288670@ax162>
In-Reply-To: <20250903165931.GA3288670@ax162>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 4 Sep 2025 15:38:21 +0800
X-Gm-Features: Ac12FXwiXF9IvfBYbe4zzNOtF-jes20CBabfcX8-C-vzxRaxmAjm9PLipHmDVBM
Message-ID: <CAH1PCMYWWkThMosDMW=wZZWZ8d_c4_zQWhJOJPKe354LPiV1bA@mail.gmail.com>
Subject: Re: next-20250903 x86_64 clang-20 allyesconfig mmp_pdma.c:1188:14:
 error: shift count >= width of type [-Werror,-Wshift-count-overflow]
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	dmaengine@vger.kernel.org, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Vinod Koul <vkoul@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Benjamin Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 12:59=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, Sep 03, 2025 at 02:04:10PM +0200, Arnd Bergmann wrote:
> > On Wed, Sep 3, 2025, at 12:08, Naresh Kamboju wrote:
> >
> > > Build error:
> > > drivers/dma/mmp_pdma.c:1188:14: error: shift count >=3D width of type
> > > [-Werror,-Wshift-count-overflow]
> > >  1188 |         .dma_mask =3D DMA_BIT_MASK(64),   /* force 64-bit DMA
> > > addr capability */
> > >       |                     ^~~~~~~~~~~~~~~~
> > > include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT=
_MASK'
> > >    73 | #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n=
))-1))
> > >       |                                                      ^ ~~~
> >
> > I see two separate issues:
> >
> > 1. The current DMA_BIT_MASK() definition seems unfortunate, as the
> > '(n) =3D=3D 64' check is meant to avoid this problem, but I think this
> > only works inside of a function, not in a static structure definition.
>
> Right, this is one of our longest outstanding issues :/
>
> https://github.com/ClangBuiltLinux/linux/issues/92
> https://github.com/llvm/llvm-project/issues/38137
>
> This only happens at global scope.
>
> > This could perhaps be avoided by replacing the ?: operator with
> > __builtin_choose_expr(), but that likely causes other build failures.
>
> Yeah, that makes the problem worse somehow even though GCC says the
> non-taken option should not be evaluated...
>
>   drivers/dma/mmp_pdma.c:1188:14: error: shift count >=3D width of type [=
-Werror,-Wshift-count-overflow]
>    1188 |         .dma_mask =3D DMA_BIT_MASK(64),   /* force 64-bit DMA a=
ddr capability */
>         |                     ^~~~~~~~~~~~~~~~
>   include/linux/dma-mapping.h:73:70: note: expanded from macro 'DMA_BIT_M=
ASK'
>      73 | #define DMA_BIT_MASK(n) __builtin_choose_expr((n) =3D=3D 64, ~0=
ULL, (1ULL<<(n))-1)
>         |                                                                =
      ^ ~~~
>   drivers/dma/mmp_pdma.c:1323:27: error: shift count >=3D width of type [=
-Werror,-Wshift-count-overflow]
>    1323 |                 dma_set_mask(pdev->dev, DMA_BIT_MASK(64));
>         |                                         ^~~~~~~~~~~~~~~~
>   include/linux/dma-mapping.h:73:70: note: expanded from macro 'DMA_BIT_M=
ASK'
>      73 | #define DMA_BIT_MASK(n) __builtin_choose_expr((n) =3D=3D 64, ~0=
ULL, (1ULL<<(n))-1)
>         |                                                                =
      ^ ~~~
>

Thanks Nathan for the information here and above.

> > Guodong, how about a patch to drop all the custom dma_mask handling
> > and instead just use dma_set_mask_and_coherent(DMA_BIT_MASK(64))
> > or dma_set_mask_and_coherent(DMA_BIT_MASK(32)) here? Instead of
> > passing the mask in the mmp_pdma_ops, you can replace it e.g. with
> > a 'bool addr64' flag, or an 'int dma_width' number that
> > gets passed into the DMA_MASK_MASK().
>

Thanks, Arnd. I'll send a patch to clean up and simplify the logic.

> If this works, I think it is worth pursuing to avoid this bogus
> warning/error.
>
> Cheers,
> Nathan
