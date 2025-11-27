Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF2D18FDDE
	for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 13:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251572; cv=none; b=lbVUTwQipxlqwX0zU+5wBuPbHvc7Y39nFiW5AnDoEVf09VcL6ozbaZb+6ubC+ZroGudieae69HoxY+9IjyZpbw7+Te/zL7TL7VnUaCnwDKvA35LSbQfDGa6nXO1uz84Sicu6dzSmU95zRweAgn7D+AxfcRldakfQXsiIZnf7lrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251572; c=relaxed/simple;
	bh=AA0eyjIx0yehNxo/E/5axe4dWMJkeEgXsy6bX1rofAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VD+Gz+JzalPqbW57FVMfEYSMn2vuNmbnuNznzrB6LuzNlaeSHURU7A1vBkUtpwnTAXcInAB5fUWYGR1D+2dFMS8myZJNcGt4wrPUvwwNy5yQa1D2CKgb3FYXZcfepXBZJdHwit7WS4t9LEBSkau7VkdTGu5ZuwXa1S4aupMJor0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-657a6028fbbso333566eaf.3
        for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 05:52:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764251569; x=1764856369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/HhN7PweXDCoHADbAO01OSEGdFHLn6AnoNvGrA1vak=;
        b=pZd1fPzUB972q1w6P9GxnvfZ/5EuI1XvxNm8J7bUrAZfmDxhRXfDtn3fXnKROvP+c5
         d10OhMPmpU0YSsgEPl97aXep/Am6Dfc3a6VrtoWzZiCyyM0hEQEv3dihUHUNzZINoZAZ
         FgT0W1qNyb6iJaO/o9d5lOeFC3KQR8O45PlydxehQ6PGkFvU3wXJbt/ocUFeK7gCYDK7
         T1nkycul/WJGjjoTVOhaGWcAQkiEtrxocJt+ZtujnTU+dLLQyqDVta6Z+nn49H4Q72jN
         pio2qdS0vwFc3jFRYWDv3HSY6Yc3K6Fat8ipGX1ane9zs4pHh63ipiQ30bezse67xxOP
         C9bw==
X-Forwarded-Encrypted: i=1; AJvYcCVh7bzxn4R7AJdNPl2YCLBJ9kqH767eCOafA0j2aHUp0VCrR+tpYG8nWaWqUQU6zhBX6JV3@lists.linux.dev
X-Gm-Message-State: AOJu0YyRwn0tx6K6otLMiblzb7x8uRwl5HkS/Y97+dhxMUMLHjK0L9tx
	rnwaI2mvrPd0ddsQP0IHPCNkmchqnH1i82KvTlAWDyv2wKfo+nqfqCUDCKZ5MhTp
X-Gm-Gg: ASbGncsp/XxXGd1AUZQp5sC3dY6CmlTl3OOcm/E/mCzOztzKllmbCMLwGRslU38pQRE
	L84z51gFlJk1rZlBCy9DXNA4O/CnFnuH+6weRNJCHcuzq9ItaWggTxrxatnVO96+eVnh/UxGtGN
	uIpb/8D1T0u9nTuVPhJv2owEQ/sP1jGIt5hjdJECq7wLDE1cQh9xoctDULkvsYHDzCkkH5KahNE
	9pCvZyPWW2v/oNqJqSQLbj7hkPn8qwEIdIxPOZaNZYZRa+po/1q9rQ/CvL6adxIHEkT20R4/7TJ
	76epHTxXl/5gAawnAXfwUfX9oXKpMqitkiXO+yNjYNiZkrwQY47RrcZH/ekIr2haxzfoj43tMyl
	L82Q64korLDYivKwgsZygS1n7xAYcNpypz3RrOGojIWdBYwe0uUQSNHutlAiNVL9inoyBLD/AZf
	09FcEFZEkSOCChubeTmgYL4K8wTxYn1aO+Q8Wy/3dlHuI3VQQiHZ6O
X-Google-Smtp-Source: AGHT+IEY1PcNA5Xw3Y9Hd1YrGuOnlrcshpILLGpuars23nwp2xyeZY1ZKcUIc6Q94Fmfsrj0gol+9A==
X-Received: by 2002:a05:6808:3448:b0:450:4628:e3f2 with SMTP id 5614622812f47-4514e7a4293mr4385452b6e.42.1764251569410;
        Thu, 27 Nov 2025 05:52:49 -0800 (PST)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com. [209.85.167.175])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-659332cdb20sm290612eaf.2.2025.11.27.05.52.48
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 05:52:49 -0800 (PST)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-450154aa53fso334475b6e.2
        for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 05:52:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3gYH41jGqj/hV9UOaqvIxTzY7ch5mMibxMZi3+CTd9PLlhls0WTlFQcu9P3/kzhojhVLC@lists.linux.dev
X-Received: by 2002:a05:6102:291f:b0:5db:ebb4:fde3 with SMTP id
 ada2fe7eead31-5e224274604mr3094319137.16.1764251214244; Thu, 27 Nov 2025
 05:46:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
 <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
 <dbb94fb1-2f78-4bd2-9254-c435ab3325c0@oss.qualcomm.com> <0e90817e-1c05-4fa3-a6fd-8e755608a2c9@oss.qualcomm.com>
 <CAMuHMdX2qv2YBbvkM8tkSTWDPe-paMp5=fdv=4tGKheTseK9Pw@mail.gmail.com> <ebb0d41c-1836-42d1-8406-ead97c4d6886@oss.qualcomm.com>
In-Reply-To: <ebb0d41c-1836-42d1-8406-ead97c4d6886@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 14:46:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUF9nTRkOOi+KnH2ATsFdTWMCtohWZQ1T_vhB=cf_42Yg@mail.gmail.com>
X-Gm-Features: AWmQ_bmuZJ1L1xbNpDXxY3ptFDbRDwAIihpcjmcYa3Px9900l5_objftbJng000
Message-ID: <CAMuHMdUF9nTRkOOi+KnH2ATsFdTWMCtohWZQ1T_vhB=cf_42Yg@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 27 Nov 2025 at 14:42, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> On 27/11/2025 13:52, Geert Uytterhoeven wrote:
> > On Thu, 27 Nov 2025 at 12:48, Krzysztof Kozlowski
> > <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> >> On 27/11/2025 12:42, Krzysztof Kozlowski wrote:
> >>>>> --- a/drivers/i2c/busses/i2c-rcar.c
> >>>>> +++ b/drivers/i2c/busses/i2c-rcar.c
> >>>>> @@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
> >>>>>         if (IS_ERR(priv->io))
> >>>>>                 return PTR_ERR(priv->io);
> >>>>>
> >>>>> -       priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
> >>>>> +       priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
> >>>>
> >>>> Any specific reason you picked "kernel_ulong_t" instead of "unsigned long"?
> >>>> The former seems to be the least common option.
> >>>
> >>> As I wrote in the first patch, because to my knowledge it is the
> >
> > I don't see that written in the first patch; it has the same patch description
> > as the other patches in the series (mutatis mutandis)?
>
> https://lore.kernel.org/all/20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com/
>
> I meant that brief statement in the patch changelog.

Sorry, I had missed that, as I don't read patches for foreign hardware,
and had just b4-am'ed the series, and compared the two commits.

> >>> preferred form for holding driver data which are in general pointers. We
> >>> do not store pointers as unsigned long. It is also already used for the
> >>> driver data types - see include/linux/mod_devicetable.h.
> >>
> >> ... and in case it is still not obvious: I do not cast here to final
> >> type, because that cast is the reason for the warning.
> >>
> >> I cast to an intermediary type to help compiler suppressing the warning
> >
> > I know...
> >
> >> - to integer representing the pointer. Unsigned long is not representing
> >> pointers in the kernel. Integer type representing the pointer is
> >
> > "unsigned long" indeed does not represent a pointer, but in the Linux
> > kernel, it is guaranteed to be the same size as a pointer.
> >
> > '"unsigned long" is superior'
> > https://lore.kernel.org/CAHk-=wj2OHy-5e+srG1fy+ZU00TmZ1NFp6kFLbVLMXHe7A1d-g@mail.gmail.com
> > (he doesn't seem to have said anything about kernel_ulong_t)
>
> Yes, that was again comparing to uintptr_t, so we both agree.
>
> >> kernel_ulong_t, I think.
> >
> > include/linux/mod_devicetable.h:typedef unsigned long kernel_ulong_t;
> >
> > IIRC, it was introduced originally because "unsigned long" might have
> > a different size in userspace.  Nowadays (for x32), uapi uses
> > __kernel_ulong_t, though.
>
> Maybe, but if you look at the data structures all have kernel_ulong_t,
> so this fits the logic I was following here - I cast to the type which
> is both representing pointer and is already used for driver data,
> because this match data serves similar purpose as mentioned driver data.
>
> I don't mind casting via unsigned long, but:
> 1. these are old and trivial issues,
> 2. they are quite annoying when people want to compile test with W=1,
> 3. I was trying to fix them (although not sure if for I2C) already,
> 4. and some others probably as well were trying to fix them,
> so how many people need to send them and debate before we fix them finally?
>
> unsigned long vs kernel_ulong_t is a nit-style discussion IMO, unless we
> have here more concrete arguments, e.g. statement from Linus that
> kernel_ulong_t is wrong.
>
> If maintainers of this code want unsigned long, please apply the patch
> and fix directly, but for the sake, let's get it merged...

Sure, let's get it fixed!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
