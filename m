Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9832F320F
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 18:32:17 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id w12so15388327lfr.9
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 11:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wBLfX2LSEiNhJ8oDOcJh1B00fiK59ApOZekhfSkPFtY=;
        b=VgZXaPqAaC3YW4N9oST8PmjWXw0TSZNWDVRh8fM9EjToU+Zs/ed98dGuNHb/i54YHp
         AYZS5QAWDzP3m1ZAGhm9kZ/lei9v44xXn7DxGd1XRyak5cRbMtaIBXH9w8ldrNz+3B83
         rir2bjRH/je3U8IBwnnIN+TvsEsyS5i2lN6a4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wBLfX2LSEiNhJ8oDOcJh1B00fiK59ApOZekhfSkPFtY=;
        b=Yqlx+dZhaiHkcxPBh2OsgyyPTnCLyLeNqqcubvAPG5VSdqU60D/f45E/CshItTtaWY
         0qK7RcmSsxMgcgAURL71xyO+JQI56+qcG3bUBaMmBzqd3NQ08pcjq22tivzMj/MAISJf
         SuxEbZ1NI08//p7vnoTLBZqUE9rPCtrtMFupT91XUypUpApDJrnmRdcBRD5Mfdz3tC2H
         lWDt3d5wUDBhtgSL+yGRSAFlLm66y9aF3W/ihk1BzFfwIVCytnUGTsBNGraKTszLFfpg
         4UC7tiALtDaeZoibIJSMwozDuBJFZbQZ/AuCC9CTuHWq23Ek2TSmW7C2lkXOV5J7WjWB
         a3oA==
X-Gm-Message-State: AOAM532rDoAUba18JU9VZzesM1N6gAFZr9tH0/+uMrviXh5b9OTqSUkJ
	zgk5tWVMKaXkgwp76D1yWd0xA+/66e1CIzSTeuk=
X-Google-Smtp-Source: ABdhPJzdZoPE+wkE++n9ww1OGorqjyItwU5Jx/2cmYF2+SDRZLTYLdgiRXi/4b0Mq5X3ajeJSV8FgA==
X-Received: by 2002:a05:6512:1150:b0:449:f433:8b0c with SMTP id m16-20020a056512115000b00449f4338b0cmr6182421lfg.403.1647628335312;
        Fri, 18 Mar 2022 11:32:15 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id b13-20020a056512304d00b0044839225289sm954240lfb.218.2022.03.18.11.32.11
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 11:32:12 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id y17so12314865ljd.12
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 11:32:11 -0700 (PDT)
X-Received: by 2002:a2e:9904:0:b0:247:ec95:fdee with SMTP id
 v4-20020a2e9904000000b00247ec95fdeemr6818296lji.291.1647628330932; Fri, 18
 Mar 2022 11:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <YjL6K49CkH+YC4FQ@smile.fi.intel.com>
 <CAKwvOdkjb3uR+kqjfdKL5gqA8R+00c5=3E7uGGW+mGZ3QRsjqg@mail.gmail.com>
 <YjSROmYwwGhpsXMl@smile.fi.intel.com> <CAKwvOdkEjrPUL4HuO3UKaUZAzVw=XV1bEOSj6HR5R1WTUSSZ4w@mail.gmail.com>
In-Reply-To: <CAKwvOdkEjrPUL4HuO3UKaUZAzVw=XV1bEOSj6HR5R1WTUSSZ4w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 18 Mar 2022 11:31:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjKiemDQXKCGztokhw_A-8SnE+7Q9Queb-rXUTbHPNedA@mail.gmail.com>
Message-ID: <CAHk-=wjKiemDQXKCGztokhw_A-8SnE+7Q9Queb-rXUTbHPNedA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: use correct format characters
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bill Wendling <morbo@google.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Nathan Chancellor <nathan@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 18, 2022 at 11:01 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Maybe we should reconsider our recommendations for signed types?

For 'hhx' is probably does make sense in some cases.

That said, for kernel work, if you work on byte values, I would
seriously suggest not using 'char' at all, which has badly defined
sign.

And 'signed char' makes no sense either.

So while 'hhx' makes sense in the general case, for kernel work I'd
much rather see "don't use stupid types".

So why not just use 'unsigned char' (or 'u8' if you think typing is boring).

                 Linus
