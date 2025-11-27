Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006C81C54A9
	for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 12:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764247937; cv=none; b=FJFgsDTNb/PBWWVZT6uVePYRm96kGjNEM2QfVym58HJahF9yD8XCqglGY3mekPbWyMgTiWklUftyDWEQ9SeBnMNMT9aH44bDvMwtUoVnMFwWpdcSTFKuKKd7nEsXXsz+gvoQOhaV8oUJA9fDNn0b3e20DNpjr5qY8+n3J3eI1g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764247937; c=relaxed/simple;
	bh=FJM1n7JsAk9/dOgmQTcvpABhbLk73QPoGdPDbWfqDIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9+HPaghvy29TR6q/2/30DS3z9+5WNpXeuK0m37fWnoJ5LbtWRO7vNppxp6MtGIpq7e2gTVagGafBHAfIo4iFfIBkvZVnwSLE0XlCxFkd4MK/bsLXZ7fO4bHy87C89QULm1zCYjjoCAZyIPaqrB/lPCmPigYLZUJfsMNqi4BHCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-55b0d4b560aso1285041e0c.0
        for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 04:52:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764247934; x=1764852734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjYT7JRJe3Gqrk9ZtGCdcYVgPeOXASFBXLgUHTdPheE=;
        b=kfkJ68Yvtb7OapmStVkAC15+TQsnYDB52fw1syfN/wtJRvg52MBUVOZPM3umVJepVY
         5/tRsBaB8R14kgBLdHVUJpwT5ASq4sCx+Ws/y7/hWUH+uaOLOGPuo+BIpenLqLNaNE22
         tb4jX/5VErPz5prU826K6qfccHNwtP7wQg+jyn07Wrt+wNUr8dSPEnRQQSiYNdcFthep
         Tb7dc/PUmR7zBA3QctCACtWQdUQ1v2u3sxR7Hddb/5nXLkz5hUJgB/8g9xYrYez/JXOz
         L4+FUZ+7h7DuzX9kYOp33kc3d0Bres2u0dU81TUcqO1CFP9kh1jYGdGKxDwJmG71Pq+X
         fV3A==
X-Forwarded-Encrypted: i=1; AJvYcCX6FOImYr8UF2XlYHdNSG0PmtsEYWxIWmvir3oT6t1RewhIQBPKOh8lBM11ME4ThpX7Tf8w@lists.linux.dev
X-Gm-Message-State: AOJu0YxRBZiuHXZamft+564xgUgfPulb0BOX12QpJVdzmAW8xMPf3KGD
	zmOP7S5kIMfVITM/RXmYZjCLCY/4fV8xZYYbdOG/R1h6Q643Vboov+bLUckOYApK
X-Gm-Gg: ASbGncvAmmGQQsTZUnPRvSz9E0Xlj5wMZSCh2rkYMmO7yMliINqZQMeOHvAR57pQjr3
	XzU6q2oGQwJzqYNpxhQa8x3yym5UG/L+40yImcIwCHzKki/3s0wIPtTGoCVSXSiZ6j61SbJmoZS
	l/k77OMzFLqMhmg8UcnnBPEqJ9DSKY1lSbWIOAA6gKO5f53kBtUb/gHn9VRGUEf60vEctHNQYrR
	xGmusVqDRHDjm+Lr7mv+UuirGptXA8YC6BB3WLiJJ4NSU11f3o30H6lDNykJsJ0mrXLr3mOThXx
	NyC0dzN222jWMJ/tXSToZOwMu1C5nsr3w2oYMpAUfQFLonIARkDr3HnqhFrNkryoIwqUaC0LSG0
	Puzo1b/fU/K8dl2ke5YMWdyBGXkdmo7Re+oRrrjnJnpLFGJLAEG3TS8x7wy+HWWnYheibFxZfR8
	Hrz3yEx3x31SrMzhwkMyoW1UdObsDEUH/+6uU2A0karaOwym+R3hev
X-Google-Smtp-Source: AGHT+IGrLV+1PaDz+4wJUPKNmAyeWGGPeLMj58hzS2naFZu/w1Gpwg0u1sElGS+mvVWNIXraYILyag==
X-Received: by 2002:a05:6122:2c07:b0:559:83e9:290 with SMTP id 71dfb90a1353d-55b81923b82mr7828427e0c.1.1764247933836;
        Thu, 27 Nov 2025 04:52:13 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55cf5141987sm495488e0c.11.2025.11.27.04.52.13
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 04:52:13 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-55b4dafb425so1267741e0c.1
        for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 04:52:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnDRN3AwwEXOAU9b+oi4P7lI9NlFsp75zE+EZvqvkGxnuzC4+cq7T+pUOR0DOJx+JFID3K@lists.linux.dev
X-Received: by 2002:a05:6102:4492:b0:5db:dad4:840 with SMTP id
 ada2fe7eead31-5e1c40dc2ffmr11440563137.12.1764247933503; Thu, 27 Nov 2025
 04:52:13 -0800 (PST)
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
In-Reply-To: <0e90817e-1c05-4fa3-a6fd-8e755608a2c9@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 13:52:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX2qv2YBbvkM8tkSTWDPe-paMp5=fdv=4tGKheTseK9Pw@mail.gmail.com>
X-Gm-Features: AWmQ_bkZiOzXPS0HFic3DjDBZhimEkCswEaupj15K-zH3plFs36PgNAI9kUlDvg
Message-ID: <CAMuHMdX2qv2YBbvkM8tkSTWDPe-paMp5=fdv=4tGKheTseK9Pw@mail.gmail.com>
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

On Thu, 27 Nov 2025 at 12:48, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> On 27/11/2025 12:42, Krzysztof Kozlowski wrote:
> >>> --- a/drivers/i2c/busses/i2c-rcar.c
> >>> +++ b/drivers/i2c/busses/i2c-rcar.c
> >>> @@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
> >>>         if (IS_ERR(priv->io))
> >>>                 return PTR_ERR(priv->io);
> >>>
> >>> -       priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
> >>> +       priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
> >>
> >> Any specific reason you picked "kernel_ulong_t" instead of "unsigned long"?
> >> The former seems to be the least common option.
> >
> > As I wrote in the first patch, because to my knowledge it is the

I don't see that written in the first patch; it has the same patch description
as the other patches in the series (mutatis mutandis)?

> > preferred form for holding driver data which are in general pointers. We
> > do not store pointers as unsigned long. It is also already used for the
> > driver data types - see include/linux/mod_devicetable.h.
>
> ... and in case it is still not obvious: I do not cast here to final
> type, because that cast is the reason for the warning.
>
> I cast to an intermediary type to help compiler suppressing the warning

I know...

> - to integer representing the pointer. Unsigned long is not representing
> pointers in the kernel. Integer type representing the pointer is

"unsigned long" indeed does not represent a pointer, but in the Linux
kernel, it is guaranteed to be the same size as a pointer.

'"unsigned long" is superior'
https://lore.kernel.org/CAHk-=wj2OHy-5e+srG1fy+ZU00TmZ1NFp6kFLbVLMXHe7A1d-g@mail.gmail.com
(he doesn't seem to have said anything about kernel_ulong_t)

> kernel_ulong_t, I think.

include/linux/mod_devicetable.h:typedef unsigned long kernel_ulong_t;

IIRC, it was introduced originally because "unsigned long" might have
a different size in userspace.  Nowadays (for x32), uapi uses
__kernel_ulong_t, though.

> Once you have integer type representing the pointer, you do not need
> further casts to enum.

True.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
