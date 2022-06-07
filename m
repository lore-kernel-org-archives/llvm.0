Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8298E17C6
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 10:15:46 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id x5so17241710edi.2
        for <llvm@lists.linux.dev>; Tue, 07 Jun 2022 03:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U+awy/jtO8AUSyEBXiUnjG28q5KgwJhjAtwiUMCK/4w=;
        b=L3g0r5og4iLcJkkaEnjJHC/fhgX0jgWCgjdPwNSjvuL4JmDM2PWcq+cK6d7tvMwngt
         rk4aq2qJmnK6TrGT6S3H5o+TSva2V00FG4u6C09YxTViVZMaP/mXJpeI4hFUjdX3AMTD
         BZXZQeJA5f2MF1rFLU3FqEyOof9t+9zhtl88KuxHRQr9+WwSKSYTv6i2RL3epictTjND
         SSIwrFpntInEwrtWc+5RW1ry6f0lI9fAHDzt2J0LHugPhrdxaKu++qyiccv+C2Q5Z1Wk
         3r/gxSK2dBPaHhzxasbLsBbsvvaYCLsJAZAZmDYEK6LY+sbv6f0U9X0G9mAoucthsmvj
         qktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U+awy/jtO8AUSyEBXiUnjG28q5KgwJhjAtwiUMCK/4w=;
        b=YA6EaSV1dHvAdRgDF6FxahOSm+wptwijtsT+vQTm4Iub8nCZ1BReAaoI+Pz1xYRwG0
         szTkIfcKnjFhFkASsTa2m4IPgIFgMGuR93rcBiNTLaVtBUEN/kHgNrWWkzMEuZxXhjGw
         MhufsNKzhkN1Zqoyu3DgdvLgEf8NRUbIYns2eABbRqy9zDJaoILNG1GTAEBP48iMmBrD
         nlAp4rawr53cOwWGMzp81oO3KZNFqYzzjdR3BAS67OJ9ILpBC8Iifxnje8VD/Sr8E0t+
         gmu8lEAihvkFaBo+S4aM4/nC2hTyl/RKZb1gf8RKxlFv0jady7RVsm5hcu5mrIcqfWxk
         tlSA==
X-Gm-Message-State: AOAM531PHEZTdh+a6H5D2SHZ6+5VR54L/Hb05FwCVnzofAXdZfmhe7kw
	g3T21zHJXffVb0sv++7zqi7YByar5AqHZCWy3fM=
X-Google-Smtp-Source: ABdhPJyHYBcSP5L+e+/lCSODW1yjbbo+X5QJlKf3rSU0nvX/kDIYub8oTpUy0R8kwHX6UVI3UHMZpAE4KZY3EUJ7Iio=
X-Received: by 2002:a05:6402:4390:b0:42e:b7e:e9ac with SMTP id
 o16-20020a056402439000b0042e0b7ee9acmr31240221edc.97.1654596944770; Tue, 07
 Jun 2022 03:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220529134605.12881-1-trix@redhat.com>
In-Reply-To: <20220529134605.12881-1-trix@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 7 Jun 2022 12:15:08 +0200
Message-ID: <CAHp75VeZSU5i1k6W1dgE4kOW5wfRM-jJvmPvi8wCdqQeFVtRbQ@mail.gmail.com>
Subject: Re: [PATCH] serial: core: check if uart_get_info succeeds before using
To: Tom Rix <trix@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Peter Hurley <peter@hurleysoftware.com>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, May 29, 2022 at 4:09 PM Tom Rix <trix@redhat.com> wrote:
>
> clang static analysis reports this representative issue
> drivers/tty/serial/serial_core.c:2818:9: warning: 3rd function call argument is an uninitialized value [core.CallAndMessage]
>         return sprintf(buf, "%d\n", tmp.iomem_reg_shift);
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> uart_get_info() is used the *show() functions.  When uart_get_info() fails, what is reported

in the ?

> is garbage.  So check if uart_get_info() succeeded.

...

> -       uart_get_info(port, &tmp);
> +       if (uart_get_info(port, &tmp))
> +               return 0;

I don't think this is correct. If something fails we need to inform the caller.

I think more about

int ret;

ret = uart_get_info(...);
if (ret)
  return ret;

But I haven't looked at the uart_get_info() implementation, so the
above might be wrong.

>         return sprintf(buf, "%d\n", tmp.baud_base * 16);

Ditto for the rest.

-- 
With Best Regards,
Andy Shevchenko
