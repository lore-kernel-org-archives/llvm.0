Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AF435C696
	for <llvm@lists.linux.dev>; Wed, 22 Jul 2026 21:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754227; cv=pass; b=toylbJfPaBIFqNLZI0y6sjlmWeLFh7nTTvRkvccu9+hGxENkcC44WYRmUE1fw+q8fiQJmR+WjfUv3ksr95iHfIwZeCn8h8Rmk59MW8Eu+qhuZ2UAd/7/ynXCb8G0XUtpR6PPlJWgE9EkdyeK4khKfsDgaMvOVQp/pFf7nAgrVUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754227; c=relaxed/simple;
	bh=pqw+4F5UxMsZ+Gmhe/bd3XKvqXdh+gUmrlvL4jHSYEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHLw/hbc48GBu8OHl3STdUZuW/RojqN6qOXgFCMBnLM+uhrPdT/aNroTegKIV86OLARCcKs7xyhdM0vgsea4n0XRkE0DkmvYXoY3gwPS3CrJTDGlsQQllfdnQy+gE/BUH6xnrpSW+m76hyYxX20prCYqGXj80oX4zA73TLhU2t4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lxd0yakq; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lxd0yakq"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so15982706a12.3
        for <llvm@lists.linux.dev>; Wed, 22 Jul 2026 14:03:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784754224; cv=none;
        d=google.com; s=arc-20260327;
        b=aRoGBGN3WKri0JWXkNdCRxZvNvadGo8ztZgE091Y4/Q480H8bDtZvPaKz7roy1pYFi
         vRi6bwF1Z3/kZZLawgHqKI3f8zHTgTvI37l74Oae+g184A9uY7K6CYgAW/vUlsWOpgd2
         3353uGITUg2Wr8tGVaMVyf6+3fiwQXGN3YgC0uOMheFYByIVEr3a3Jsb/oCCSyU6cIXx
         8k2Wrv8YE9BL891vmhXvWUHmATSqXYYc78n3xRndPD6D/gF4J6F3Yw26PK3TtKFMpTjE
         G56KUNjv6gGGWNWb9FYIXXiDiKXwfW7BeL3x4OiW7yFEWODgMqMyfW/BtAI780vzkeQr
         nvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iDk9GJaFBzM0ar9MYB8RB/ZFgtMZjf2y1b5NLaLr2MU=;
        fh=ImInda5L/hRR5weX/3GZGShVixE33pDu3xSUAW3YcKQ=;
        b=hL4qAGo2N3+u/1kbfolXpalF7wm+k6h6/vEptfi+MjqP54YFc2mriyxKQO0aZyKPN3
         nK4rcv77ZsTXZl1NJKHBrSMk3+e72f3Ip+8QqMVWp54Ayvn6MLoYJiAnqQr8imQqGsmq
         miSt+UwSQPrNH+OLNQ714gDHl73sDQczzKMGWMjK6gsarH8qITpFH2eAjBsR4EKaIutk
         8gmfOaGd4FF5MQOeRnB4ZuAh9xH6NGFuzhrDK0Grnnqu9JMEactJeeLijj0uT3Kc7gj1
         ok12qsKGd3SPcRIe0pKndESkEf6fAFJb+BP2kHmQNAr6sCFaB891jROUasXsXP2rFpI3
         4kEQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784754224; x=1785359024; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iDk9GJaFBzM0ar9MYB8RB/ZFgtMZjf2y1b5NLaLr2MU=;
        b=Lxd0yakqP4RkC0pWhb5XbaoxE3K12xPy9IPVw9EuOiwEDpH+5330CzUsuLy6jmeDTl
         MHpl32U9OUq8uOocN9Ot3iXyhjRVCkOgjTcxh/Ugrfk55YrO6A2eAY28ryLCRgOSSGAa
         j3zPfdHm/Ko/7kV5JJ/EW9i1oqQhB11rJ8u+pn02M8AajCBV+FZLLfaRwWZ2krLMO38J
         mYkuyySb77l+KVNkx6APjqc+r9VmdhnZ2JtF0S42D0GNZnfhEHJdSowuDQL/LloVoual
         2s2a/vUvbyoPm4FcnX8QcVjH7nEg9NFPH5tLnwX6ESVrJ245enqlgHKBpAZcPUoonkqC
         8z8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784754224; x=1785359024;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDk9GJaFBzM0ar9MYB8RB/ZFgtMZjf2y1b5NLaLr2MU=;
        b=VLgU7EuCUmVaOWZQPq5bXOwbBpy74nhSzDSN2kFDPOQuTvsH86heeXPfnMyj3kDaFZ
         DpYMlLi2/bKdWAhqOgi3kmZ8JQmJoZnV3YDQuYnkTwsugihEhcKN3+NDmP9pz75CdEgy
         xyfYIi++inJGerRnRWSyLIEfQPAWThVqVV/ZD5SxBSnnBcr/kek/x/gijbsOhBy2OhRp
         0oJ9JEicSFT0uH0aYxc5VnYiYE4eblvBtqk29M2ZneRyKWwzeZHnkpWgelogVfV+rm3k
         fqGAMN7f54xFmtwgQAoGbZgKdjhQKXtAAq388Dv/VZ2scX7hAIetguzm1ZJaM9Jv8snb
         PyXw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5eiOfCwf6TFvDeK+SQK9S3zwSwRMFo1EkXQkgYjlA0MwjAnEbf/+ZvOahW9pLBlqhZYD4@lists.linux.dev
X-Gm-Message-State: AOJu0YxbbjDxRZScNs92OoVttYY86+Q7hVoeYCv+Z/pSmxMyyhE5+iyH
	WbyzucOrmjZM966627BEDJGaKjnMCU9xX4YyO7DZGQ20tqIvsG8h2VP2HDwn4saR6avezkkfowq
	XAvz3ZkDGTpvPvfVD61Zsy7P1Zd6otAoOXVlSqQhx
X-Gm-Gg: AR+sD10mxMu6jY01JInqgEklD1URzEaxFKNQiOOeCl26LIlAGtZTTEjqSQhghc2DrhX
	iXYXfBkVJZVxwiOV7MDHIH/q/YXfHMmWc0rQrJVkscsWzNhOnEoEMzTPonVyUV4GGDs27X6W2ig
	b4OnYw4zioQ05MCE+yYVyjhjv9umA4kh9Ooh3a7818bk3zykgMls3g3R5asAMKw4voh7VfkIdK/
	sx0MqYSlMlXmKIk9cV1/QcMFgJnGOD2z73tbPAZoL/WhUKBL9wxlTmSsuwSNmf6IjGiBmvyU/qb
	3VStNcIdMNtSCB4f1wzvozNishLL4Iad9F/gcXHeLS8lA3E+1XAQCloGP+tGPAPFWgRm18s=
X-Received: by 2002:a17:907:7245:b0:c12:b227:614b with SMTP id
 a640c23a62f3a-c1c507c5992mr22090766b.27.1784754223030; Wed, 22 Jul 2026
 14:03:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260722172443.534251-1-akkun11.open@gmail.com>
In-Reply-To: <20260722172443.534251-1-akkun11.open@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 22 Jul 2026 14:03:31 -0700
X-Gm-Features: AUfX_mzKunA_ErzQZrqRUgnl5wCMQPxyOcP43n29TIvcYdToB-p2ggVGLa6Vk7o
Message-ID: <CAKwvOdnbPKoTy72EvfpKtT9Ne-r+O0j99KFX8OvjGk8ZxsuEGw@mail.gmail.com>
Subject: Re: [PATCH] arm: mediatek: fix secondary CPU boot on Thumb-2 kernels
 with Clang
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Russell King <linux@armlinux.org.uk>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Yingjoe Chen <yingjoe.chen@mediatek.com>, 
	"moderated list:ARM SUB-ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>, stable@vger.kernel.org, 
	Arnd Bergmann <arnd@kernel.org>, Ard Biesheuvel <ardb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 10:25=E2=80=AFAM Akari Tsuyukusa <akkun11.open@gmai=
l.com> wrote:
>
> When building with CONFIG_THUMB2_KERNEL=3Dy and Clang, secondary CPUs

Specifically, was LLVM=3D1 or CC=3Dclang or something else used?

> fail to come online with "CPU1: failed to come online". The address
> written to the jump register has bit 0 set, causing the secondary CPU
> to start in Thumb mode.

Ah, yeah missing those is going to be a noticeable perf hit!

>
> secondary_startup_arm is ARM-mode code (.arm) and, on a Thumb-2 kernel,
> expects to be entered in ARM mode in order to switch to Thumb via the
> standard sequence at that label. Starting in Thumb mode causes the CPU
> to execute ARM instructions as Thumb, resulting in an immediate crash.
>
> Clear bit 0 of the entry address so the CPU always starts in ARM mode.

Thanks for the patch. Any idea why this isn't an issue for
GCC+GAS+BFD? Perhaps there's a difference in the LLVM tools that we
need to address?

There's definitely some difference between clang and GAS here.
https://github.com/llvm/llvm-project/issues/211376

I wonder if perhaps a better machine-agnostic assembler-agnostic
assembler-version-agnostic patch would be something like:

```
diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
index f22c50d4bd41..687ee7063a73 100644
--- a/arch/arm/kernel/head.S
+++ b/arch/arm/kernel/head.S
@@ -383,6 +383,7 @@ ENDPROC(__create_page_tables)
 ENTRY(secondary_startup_arm)
  THUMB(        badr    r9, 1f          )       @ Kernel is entered in ARM.
  THUMB(        bx      r9              )       @ If this is a Thumb-2 kern=
el,
+ENDPROC(secondary_startup_arm)
  THUMB(        .thumb                  )       @ switch to Thumb now.
  THUMB(1:                      )
 ENTRY(secondary_startup)
@@ -429,7 +430,6 @@ ARM_BE8(eor r4, r4, r5)                     @
without using a temp reg.
                                                @ (return control reg)
        ret     r12
 ENDPROC(secondary_startup)
-ENDPROC(secondary_startup_arm)

 ENTRY(__secondary_switched)
 #if defined(CONFIG_VMAP_STACK) && !defined(CONFIG_ARM_LPAE)

```

Can you perhaps help test/verify that Akari?


>
> Tested on Lenovo YOGA Tablet 10 (Wi-Fi).
>
> Fixes: 0cda07001a94 ("ARM: mediatek: add smp bringup code")
> Assisted-by: DeepSeek:deepseek-v4-pro
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  arch/arm/mach-mediatek/platsmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-mediatek/platsmp.c b/arch/arm/mach-mediatek/pl=
atsmp.c
> index 6b0943d95555..9a7c65fc3ae1 100644
> --- a/arch/arm/mach-mediatek/platsmp.c
> +++ b/arch/arm/mach-mediatek/platsmp.c
> @@ -124,7 +124,7 @@ static void __init __mtk_smp_prepare_cpus(unsigned in=
t max_cpus, int trustzone)
>          * write the address of slave startup address into the system-wid=
e
>          * jump register
>          */
> -       writel_relaxed(__pa_symbol(secondary_startup_arm),
> +       writel_relaxed(__pa_symbol(secondary_startup_arm) & ~1,
>                         mtk_smp_base + mtk_smp_info->jump_reg);
>  }
>
> --
> 2.54.0
>


--=20
Thanks,
~Nick Desaulniers
