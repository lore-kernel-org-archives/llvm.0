Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8272BE032
	for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 09:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764234161; cv=none; b=E1TTXi2MNozPRCx9+SioAaZCDIcNhtCXeW70Z07FNWyYh0c2bUJ94sgQp+n3O77drY+WDLaAPZfSmSUOL9qopfwtXZaUsfFzeyuBue+uPxCd/Ha1AxTEWHwXmyXurpGb5SP8ek6BOCIl9WXJY3h640JbWdhHoePyXzgm9CpXhUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764234161; c=relaxed/simple;
	bh=wBnN8Y419gYK57sA8+xqXwDBtmsISzDIBeFML/t6rWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITtRkbj1wRbtt95LzePTNYb6YVtaGptHo4ut/em2zJutmizRotdCZCFATdwDkje8o2nIgxaBT4/fbnzfzhOtpcAjCbIun7rAQ2ANBxkbrSYLp9u75seZHkkzpcQZFPL0HXvBk+8JpCoXU4votZTuOQyYdtlGP7MfTcTANWjs3nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-935134ef989so381516241.3
        for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 01:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764234158; x=1764838958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSY12wujyQqkN0s0ZCmyYYswJOo3iF7QtRvGpJcpmMY=;
        b=bEg0w7cEs7NQD+WHxw+JJCdtrzRigbVROc37Jf/mKxB9pqKoyRGFi2CnlQqCsEROO+
         dvsBpomQwTOyIqN7aCTIM7MwYTQ6bFI7gUrDFyVkAzuNY6E01SOZLCjwqKfuBZioSXwn
         qrUJobWVv7C8wsmy45WwXK4ezU9GcpIujQz7j3zNOxsXZdp3zvZEI8rm1wl3sE6+U/+M
         MAXID482PJ+4LR1wGF+CG2q206xfgI6sf9J6uBhzAl7qefyolbhXf4WCV+dvHDI53OvE
         ogPdKnDrNtk1lPkQmB95TZzSi7TJbAVQBVBKCh7beFxreJEvYYNDSJ+7xO0lVw5jdhJD
         +llg==
X-Forwarded-Encrypted: i=1; AJvYcCVtWYJAHB8BULjEz+old6Pj3OHL+4e2j6Ijk7gm17aUIn2aFmCvsrI7zivZfD+EtKsDmV7g@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ7K5tHnF8DICuj0Ri3/iEDjfLIofvuQC9eInvCdoyi/iciWwk
	8BTV/lJijQKPvoG+M7Efce5WwDjPQLE3bfObZbmKGhmdTaNWkN2W2lVQ2lFnQKMq
X-Gm-Gg: ASbGnctKwvyVCwGPMPgK/PZQ4LK13iQt51MtblHT/rSRTn7EDIao6TF7NZ0w5MCrG9L
	sGBZvJOKAQXsb1vGJDLvG2bvbIJR4hrp65qJ1EH6lhpqvGy2qgrUymSvmD3q9UKKD08fUqgixsl
	Mq1AcO5r43bZHxVCkE/8yg55XLaSRzHmK66uPxDIDyn1pIIqoxC4ITgZ6uwcMzjiuMlgNaBBVz1
	g5ec3x2DMj5LIEOg0clEo9QgppQ9cbYPNLbDH4ezywF9OxSfyroR49P7F2Iubuck26sMh8oxW/g
	zLtpA5oWbjqaCF31iYIBYRRADIT6Frf95k1heNKbEVxzA0Z2QBqib+P2JKMu0PQ0MEZNjtjh9Ni
	2m180oZ1PjXzQMQr/gUl53TjuLkwRsxMEWADQ2Gw179T+XUei1LxCGPtavj2Owi0OYboPxK5pCO
	Iaweze8IA21HskJBFH5CVwsdzXl2WY4u/St0Xirw/zIBuArMWaBxQtfWaZKpo=
X-Google-Smtp-Source: AGHT+IFEQPUJhr75mrIT8d/AUV94DcjdDMD4vnqWVIp4nBBlDcydWfr74ksL3UWrZlmoNUl5sj/+gQ==
X-Received: by 2002:a05:6102:b06:b0:5df:ae62:fc25 with SMTP id ada2fe7eead31-5e1de00dcbemr7573780137.8.1764234158043;
        Thu, 27 Nov 2025 01:02:38 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e24d94f2d2sm296441137.8.2025.11.27.01.02.37
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 01:02:37 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5e18598b9b1so448401137.0
        for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 01:02:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWpdkebiVgObrXwepSDRTg/lFdqlOPAQBXxYfosOiYXUD/KvJlSgYsy5a6DVthVhF1kMp2@lists.linux.dev
X-Received: by 2002:a67:e108:0:b0:5df:c33d:6e54 with SMTP id
 ada2fe7eead31-5e1de0099d7mr8404976137.3.1764234157141; Thu, 27 Nov 2025
 01:02:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com> <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Nov 2025 10:02:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
X-Gm-Features: AWmQ_bmLgGar4dfe4FpC2atA-pkz10WbT4MOeIioGse4jPHnHaBNPYet7pQnslE
Message-ID: <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
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

On Wed, 26 Nov 2025 at 19:23, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 'i2c_types' is an enum, thus cast of pointer on 64-bit compile test with
> clang and W=1 causes:
>
>   i2c-rcar.c:1144:18: error: cast to smaller integer type 'enum rcar_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
>
> One of the discussions in 2023 on LKML suggested warning is not suitable
> for kernel.  Nothing changed in this regard since that time, so assume
> the warning will stay and we want to have warnings-free builds.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for your patch!

=
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>         if (IS_ERR(priv->io))
>                 return PTR_ERR(priv->io);
>
> -       priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
> +       priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);

Any specific reason you picked "kernel_ulong_t" instead of "unsigned long"?
The former seems to be the least common option.
FWIW, the most common option is "uintptr_t", which torvalds doesn't like...

>         init_waitqueue_head(&priv->wait);
>
>         adap = &priv->adap;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
