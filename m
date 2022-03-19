Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3125395
	for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 22:55:04 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id h7so1896782lfl.2
        for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 15:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2RcfPrB/V6uUl/QMOUTM8niNIWsvBXQJjvqEWbLTeEM=;
        b=KFXZqangAD/YFTarQejH6BpymNsRw63gr0TokRCxZVPSQGhHCuRkX1gEKlnnSt3JXI
         AJ18NWnU4U+DEIWZqAZWnrEOrWu/femC+tgbzZKWiHdJXmpM0TAyJZzVAdCucZoCKym2
         Gx8C5V/POiGMWGGwUJvnHQF7WQzLZJCrhqA2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2RcfPrB/V6uUl/QMOUTM8niNIWsvBXQJjvqEWbLTeEM=;
        b=wAkTvsE32AYmmozn8XvoIVz96/IZICiZ7bTeLQALijzgoIWg2D7b0oBEpxq1IsY6AC
         610wOnZRMPV3te9p7WW1h71ByUm7E6+/hQShbs/ycNq4V9rFk5DRjycJqWghPGx3txOu
         HenLhfpoJmfEr6gLvzDVb6Cnqq0ZZjpv7RvYL0NQrcrDys4f7vnxESfWNlhjJGzkMrBd
         rJAwvc3UcXZfWHq6zqYiJW5n8BRRG4vUWGiJiCRJ1mdBgoPwC49klbRkP7Yby1NuQgJx
         +xDtVJLgSSbRvnYWqSL8b5cOwsBO4tSbT/NPluBOyqH4xJrpGdf/7yl46DWD/Yl5K2SK
         DLiA==
X-Gm-Message-State: AOAM5305KvwsmXJDhC8o+pIz+Ef32DaijY9dRypTRuoOW/QbM2kr3bIq
	5ARsh9J2Bs8YYG+dQ/4U5P41s66Aysw9Vp7Zfzk=
X-Google-Smtp-Source: ABdhPJyF6BENzvrdSe4dsKO9jme5pPaYsviHdOfIpamNyffpiNCz8vf1XuEAoY11/M/CaYigtSRauQ==
X-Received: by 2002:ac2:58f8:0:b0:448:3218:2e33 with SMTP id v24-20020ac258f8000000b0044832182e33mr9786932lfo.103.1647730502032;
        Sat, 19 Mar 2022 15:55:02 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id s27-20020ac2465b000000b00449fa1cb427sm1098420lfo.193.2022.03.19.15.55.00
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Mar 2022 15:55:00 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id l20so19295489lfg.12
        for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 15:55:00 -0700 (PDT)
X-Received: by 2002:a05:6512:2294:b0:448:6c86:3c78 with SMTP id
 f20-20020a056512229400b004486c863c78mr9683258lfu.531.1647730500067; Sat, 19
 Mar 2022 15:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <20220319222228.4160598-1-morbo@google.com>
In-Reply-To: <20220319222228.4160598-1-morbo@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 19 Mar 2022 15:54:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh4B42bYZmGoY8=UsqHDuq_th2KN7TmXuTnhwyYWzQ5pg@mail.gmail.com>
Message-ID: <CAHk-=wh4B42bYZmGoY8=UsqHDuq_th2KN7TmXuTnhwyYWzQ5pg@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: acpi: use correct format characters
To: Bill Wendling <morbo@google.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

So I think that clang warning is only annoying, not helpful, but:

On Sat, Mar 19, 2022 at 3:22 PM Bill Wendling <morbo@google.com> wrote:
>
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index a5495ad31c9c..92dd9b8784f2 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -388,9 +388,9 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
>
>         if (pin <= 255) {
>                 char ev_name[5];
> -               sprintf(ev_name, "_%c%02hhX",
> +               sprintf(ev_name, "_%c%02X",

This part I approve of.

>                         agpio->triggering == ACPI_EDGE_SENSITIVE ? 'E' : 'L',
> -                       pin);
> +                       (unsigned char)pin);

But this cast seems pointless and wrong.

Casts in general are bad, and should be avoided unless there's a real
reason for them. And that reason doesn't seem to exist. We don't
actually want to truncate the value of 'pin', and just a few lines
earlier actually checked that it is in range.

And if 'pin' can't be negative - it comes from a 'u16' table
dereference - but even if it could have been that would have been a
different bug here anyway (and should have been fixed by tightening
the check).

So the cast doesn't add anything - not for humans, and not for a
compiler that could just optimize it away because it saw the range
check.

End result: just fix the pointless 'hh' in the print specifier. It
doesn't add anything, and only causes problems. Anybody who uses '%02X
to print a byte should only use it for byte values - and the code
already does.

Of course, the _reason_ for this all was a warning that was pointless
to begin with, and should never have existed. Clang was not smart
enough to take the range knowledge that it _could_ have taken into
account, and instead wrote out a completely bogus warning.

It's completely bogus not just because clang didn't do a sufficiently
good job of range analysis - it's completely bogus because a 'varargs'
function DOES NOT TAKE arguments of type 'char'.

So the *only* reason to use '%hhX' in the first place is that you
*want* the sprintf() to actually limit the value to a byte for you
(possibly because you have a signed char, know it will sign-extend to
'int', and want to limit it back to 8 bits).

If you *actually* had a 'unsigned char' to begin with, you'd be
completely insane to use %hhX. It's just pointless.

So warning that '%hhX' is paired with an 'int' is all just completely
mindless and wrong.

              Linus
