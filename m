Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84E6C2E6
	for <llvm@lists.linux.dev>; Thu, 21 Mar 2024 08:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711009971; cv=none; b=rKLKVIQnm7Ad4dR71Ytvws7nadsmEu4WWRHEGicuYRdjQsgUBPWxbWWYvXPo3yCRQhisyzFeNrYKfpj4ofbXgf8i4+ehvevSdFDfep+WgOJ7L1xbdbrhO56Nu/SfBbQf3E9ECr8bGqJuus3KEVx/BKQ41W2Jbga13QK4REBr5DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711009971; c=relaxed/simple;
	bh=2SeI0KLkQK8keeZfc3uwhguEk/P0UYOP26RJRbCSQS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMpNyBdCw78otFYTtKhCFEyRKWUbyu5GR7jpPESi0uJVeYNvlFDR+Gd7fUZqJ6zUh+yKBm3f0hViT+tDq3CFBWp/rHipnwtk//+mWQUWywnZu0d/ufuZghsJyNsJjoDsy6JskDu/6TegwmLoiSqI0X0bGfeo1TFv2OecAVJoGwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-609f359b7b1so7568627b3.1
        for <llvm@lists.linux.dev>; Thu, 21 Mar 2024 01:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711009968; x=1711614768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mUmrGrAX3Duzs64PPgK1QzuxSOry2pd/+ceHDEcKUU=;
        b=tOBXmRQXWm1spcUWATMJs6EwVpvM6h2sUQ4acCF4wjeVmm4jKinedlD6P9Crp3UMPu
         l8u0Y55+eXHt401sqg6WqdiOsoP33FCLQYrNKoBV7ZP8Gpw4rQQHSZibNWek74xbS6cM
         LhtH6Ig/DZ5pNptRZOgh3qhscG7SzDrbbPxEH6FOS7uV/qjYrrwFhQGpOhA+RXonwTxi
         20mRPRwqOuXraLg8OFsJkppizax90RzmivVbhaSnCcCMndD8f1yzjM6ozfecIbT/gFwI
         //TgebIlcyG7+zH8jxjYTZMKvA8t2mfs1kP6QBpD9bQmRHajjweYIJMGv56zuQOS9uOJ
         2Ekw==
X-Forwarded-Encrypted: i=1; AJvYcCXtZDdG6HrWg2hO1m2oQxg9Kigxvr+GOU76q6X4d+OMmFexHFkhsOuGhMXdubLJFTgJozGoZvu09QlDZmdxpF3dnKu7MA==
X-Gm-Message-State: AOJu0Yy/PQl2+BmZ+WRXLufl/UKuVpxugbAjBqCFCp/NLLAqe3pE+JQj
	+L6MkwRIokz8JCzQ0u5XIJX3CWPRTbsbvE6NTNDtgw6bIt//FABDLtdai4n6PSI=
X-Google-Smtp-Source: AGHT+IHay+dNgh6QPL+kW21RN8XjcGUsJnZ2HDMjyMPxeEv0cKHjhUupjQxmMXiKd1uUxatNFjfBKA==
X-Received: by 2002:a81:6f44:0:b0:60a:3ef4:29b4 with SMTP id k65-20020a816f44000000b0060a3ef429b4mr8195381ywc.38.1711009966206;
        Thu, 21 Mar 2024 01:32:46 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id p186-20020a0de6c3000000b0060ccac7cae1sm3164271ywe.47.2024.03.21.01.32.45
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 01:32:45 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso495125276.1
        for <llvm@lists.linux.dev>; Thu, 21 Mar 2024 01:32:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNYBKk6XEE3hyA22Mq1cZsCSpuuPXFjt9XXd2au7jDrXZD7CtPX2SS/K8bOLfdglYXMVyWaW8WpW/O5P2dcZx8CtGInw==
X-Received: by 2002:a5b:ecc:0:b0:dc6:be64:cfd1 with SMTP id
 a12-20020a5b0ecc000000b00dc6be64cfd1mr7256066ybs.36.1711009965385; Thu, 21
 Mar 2024 01:32:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240320180333.151043-1-arnd@kernel.org>
In-Reply-To: <20240320180333.151043-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Mar 2024 09:32:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW41e+DSBKBgugTkjoLy6bXfji-KWmB_d9EstEv01eC6w@mail.gmail.com>
Message-ID: <CAMuHMdW41e+DSBKBgugTkjoLy6bXfji-KWmB_d9EstEv01eC6w@mail.gmail.com>
Subject: Re: [PATCH] powerpc: ps3: mark ps3_notification_device static for
 stack usage
To: Arnd Bergmann <arnd@kernel.org>
Cc: Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nathan Chancellor <nathan@kernel.org>, Paul Mackerras <paulus@ozlabs.org>, 
	Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kevin Hao <haokexin@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Wed, Mar 20, 2024 at 7:03=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The device is way too large to be on the stack, causing a warning for
> an allmodconfig build with clang:
>
> arch/powerpc/platforms/ps3/device-init.c:771:12: error: stack frame size =
(2064) exceeds limit (2048) in 'ps3_probe_thread' [-Werror,-Wframe-larger-t=
han]
>   771 | static int ps3_probe_thread(void *data)
>
> There is only a single thread that ever accesses this, so it's fine to
> make it static, which avoids the warning.
>
> Fixes: b4cb2941f855 ("[POWERPC] PS3: Use the HVs storage device notificat=
ion mechanism properly")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/arch/powerpc/platforms/ps3/device-init.c
> +++ b/arch/powerpc/platforms/ps3/device-init.c
> @@ -770,7 +770,7 @@ static struct task_struct *probe_task;
>
>  static int ps3_probe_thread(void *data)
>  {
> -       struct ps3_notification_device dev;
> +       static struct ps3_notification_device dev;
>         int res;
>         unsigned int irq;
>         u64 lpar;

Making it static increases kernel size for everyone.  So I'd rather
allocate it dynamically. The thread already allocates a buffer, which
can be replaced at no cost by allocating a structure containing both
the ps3_notification_device and the buffer.

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
