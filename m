Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D3A320395
	for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755696556; cv=none; b=kHWf9N84JG1o3VwH8Yg1wmzDIXNRZRwpzi00owDH9ecKHJI9caWIew7spspfvTWStNGtxfhLlG7BC1+fiiz6G44phQ5wM+6MARaiA7khm/Q9KJaU07YGy8jXezaGM2FYkgKSX3c57/6OOCu7yPtZCnhmExtoQShU29yS54BD0D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755696556; c=relaxed/simple;
	bh=jcAhPAgzkLaVyfYJ6HVDIU6MyZqCUM3ppV4rWifv/Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aoXtYyniJ+BMZGpMYFdQLn2I7yPfRwZcVYYKmKNDdPJrq5JV5cb2SFIdCN2S+nOKNmhAMFFFXD+2eVpTvw27HbE3jT+7F29/+0nZCjzHFeU9vUTVCHw8qHBc07GwZENEZKUKrFiDxfVFkcD8lrpSzPxDj93elP3OL/tDVedB3bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dlx2rg8Z; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dlx2rg8Z"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-618b62dbb21so9458122a12.2
        for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 06:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755696553; x=1756301353; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jcAhPAgzkLaVyfYJ6HVDIU6MyZqCUM3ppV4rWifv/Jk=;
        b=Dlx2rg8ZyJpecNCOI7N7PYkeOdcpiL/rOf2pl2tYpuAC2L806x05466ml/bnN21GUR
         n0qOe6/8e6SLjvNHWgy8t9JTYVn5xwp5uKlNKwqsRqK3kETzV35mzd3v7WwDA4eCxsf3
         /3nQMkIrXkHMNTcJoHQD7EcJTKSKYFe6cLWRvdNd7buCiIXPArZ9kCEQHoNpnkmxiK37
         1A/JJNYb1dI/zR0T1uXKz6xXBlfFndvoPsUIRfTOqY3V9MRPuEmcfAX0aYJIznWKdE+e
         g4wxglC6fxOZ6JqYqjzbZnV29wJiduW1rGNw6lHmnS7UX5LO9WRRQr2BEC0p+eU4rqnl
         THFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755696553; x=1756301353;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcAhPAgzkLaVyfYJ6HVDIU6MyZqCUM3ppV4rWifv/Jk=;
        b=K6YgpdFnKpPdWQVU8x73B/rhtEZn4Q90CnA6xkA0UBnPcThfbVBEeeakg4hWAaVjgZ
         zubSx3jK3Q8EKLUvrtdJ3EnahvKBGSlKDu9MDRIm/p1TOVBBqVxTskixO5EEt6HhGAxl
         bZ9I/c5r7CEqcoQDmaKba7D7oxE0TwtJxa6knKJ/IjbMDbaLNicVbsEYy7/y+EjJ8x+U
         m8+0b67JHzT2LqK4FzZ0TbALgP9Wp1+X/hDRvpCuOS2Nnlt0tRM6ti72/jPjqV0FzkYe
         BD7QM9L0iuv/nyYLGkBoVeou6y/YRYRRWZop0Km/GFx8LPF4/aJtkKi1T0xQs4XrHExF
         k/mg==
X-Forwarded-Encrypted: i=1; AJvYcCVY+5s7u8W/a8d7jVI5/jFz3nzKooz7EFcgEyHfcJgMrMUGm2I+ZYgDMbowMGoiCMD/3eXh@lists.linux.dev
X-Gm-Message-State: AOJu0YwLffpsweqUxiJI4C/TRfEHoaWcYlQNOjcVgaQvimYhsA9b/+8D
	U31F77S+chlCF7jJyHvxGgJ8rgk7ORCoQes/+TG0i/OZfzApV3oqEPkjFaRcEoJpTgMStZlg9yH
	bFBcxBflpUAWhWhHZp9M31a9zCZYzR3E=
X-Gm-Gg: ASbGncvIK03z5U+el23+YpCWuOucbZ+uSuZyAdQLY4N3wULLMPn0jhXWgkVqz0Eg5uW
	nIFG821Rk5w1oKseA3OoO8NS2+YB6p9Nld2srz1kq9CB7CTBYbrfTRSIzbAawItoYgINIMGV3AK
	syoRPkNulJDps8Tdfph06qmVJhr915vu5KPw1bv2BkBupNP1pvSbYppKFZR/hBW0UhYi+t2xbQ7
	bnQbLuewXJSuWFt
X-Google-Smtp-Source: AGHT+IHFi3UnZfTw+Hv/V/cy2pIQVkpT2x65dTknRglGXAcVRAIsoET4c6TvnkcXRx3Ti2/3OD7ZQ+iy7/fDDxqGtI8=
X-Received: by 2002:a05:6402:510e:b0:617:e4ba:30aa with SMTP id
 4fb4d7f45d1cf-61a9786a600mr2311059a12.32.1755696553444; Wed, 20 Aug 2025
 06:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CGME20250819131814eucas1p2c57ccc084cf6736fed01a8a5c0b35fab@eucas1p2.samsung.com>
 <20250813131007.343402-8-linux.amoon@gmail.com> <20250819131803.23296-1-m.majewski2@samsung.com>
In-Reply-To: <20250819131803.23296-1-m.majewski2@samsung.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 20 Aug 2025 18:58:56 +0530
X-Gm-Features: Ac12FXxN9zWO5PU4nqi_PrX_I2ZcRMkaURhXBeEwISjFg2LiE8-GfoSiC8m4kiU
Message-ID: <CANAwSgTW7qZiSKRJuW-AqW9BKBrjsUMm8qqa1VKrxjUJFDG6zw@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] thermal/drivers/exynos: Refactor IRQ clear logic
 using SoC-specific config
To: Mateusz Majewski <m.majewski2@samsung.com>
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org, 
	justinstitt@google.com, krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, llvm@lists.linux.dev, lukasz.luba@arm.com, 
	morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	rafael@kernel.org, rui.zhang@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Mateusz

Thanks for your review comments..
On Tue, 19 Aug 2025 at 18:48, Mateusz Majewski <m.majewski2@samsung.com> wrote:
>
> > A unified
> > exynos4210_tmu_clear_irqs() implementation now replaces the previous
> > reliance on SoC-specific functions and hardcoded register mappings.
>
> Well, right now we actually add exynos{4412,5420,5433}_tmu_clear_irqs :)
> But those are quite similar except irq_map values, so maybe they can be
> unified into one?
>
No, the BIT fields for RISE and FALL are a bit different for SoC
So that's the reason for splitting, the IRQ handle should be clean and compact.
So make them simple.

> Kind regards,
> Mateusz Majewski
Thanks
-Anand
