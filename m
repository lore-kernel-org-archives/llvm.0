Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AE55395
	for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 23:21:29 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id k21so2879026lfe.4
        for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 16:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rxIG59hWE7fTLM08POLwmSdeNPdfOcqzklKto3ZaqJc=;
        b=XnkMxz93PO3rdLFMI2lfYthrx7Lhicsol4Os8Fj8YenRH3QMiQ9WWxjUZSSXfu1bCA
         Zu4bWFkMfbjR+kCRc6DeIxpawOp55NhpZN2blZQ3VrbtvmdZrekC3NuWFiV+OFJG0yiT
         KyGpY+qQqYk6OKrG/+Gvp83pCOZpDRi2uUqfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rxIG59hWE7fTLM08POLwmSdeNPdfOcqzklKto3ZaqJc=;
        b=HB90zTzaOX4kJfMKv0aIUR1zcr+7+8fzhBMD4kpHIz3ytEEB5pNMRTrR3mGPHJ6QO9
         vjJxeTj72Zg8116IucBzgYo3Nph8NxvswJHBBXFuizmvWHMrxw6FCk3WL3yFqK2qI96e
         qqy+0lQQ6TPMDfD0rw/DhyXNj4R58qXWwIpmoMuluKhOaoRqmVJH9AbUKQE8eIcCKgeO
         zBKgdyLGFCbaEF6ZD3BBuPp+v25S9SVuOrMUi/NQ0wezFwb9KgOSt8i+/rSiGoUakpHd
         E7cdalXkoLc/jxzJn9FJemC6Ow+D1gtKI+QKjERsTU5OVLU04/5rrevzGHFh8EMC18tN
         uvvg==
X-Gm-Message-State: AOAM530vxQ039SMrLHbPC7pYc4Ze+f+oLYNcYQpdS9qPFT1T1fxVPkM9
	VZL09x/CHPSdZA0Xofw62LFcKEDCXVEoix0WNiM=
X-Google-Smtp-Source: ABdhPJysb451tngVAnnr34e1fvPiaUR1yzIDsN9duhx9aA47Ffe8c/XLi4c5NOVoyxxETsowFUjvjQ==
X-Received: by 2002:ac2:5504:0:b0:44a:2117:e6bb with SMTP id j4-20020ac25504000000b0044a2117e6bbmr2051694lfk.388.1647732087879;
        Sat, 19 Mar 2022 16:21:27 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id t5-20020ac25485000000b0044833ffc127sm1400298lfk.185.2022.03.19.16.21.25
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Mar 2022 16:21:26 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id c15so15608218ljr.9
        for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 16:21:25 -0700 (PDT)
X-Received: by 2002:a2e:9b10:0:b0:247:f28c:ffd3 with SMTP id
 u16-20020a2e9b10000000b00247f28cffd3mr10548961lji.152.1647732085458; Sat, 19
 Mar 2022 16:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <20220319222228.4160598-1-morbo@google.com>
 <CAHk-=wh4B42bYZmGoY8=UsqHDuq_th2KN7TmXuTnhwyYWzQ5pg@mail.gmail.com>
In-Reply-To: <CAHk-=wh4B42bYZmGoY8=UsqHDuq_th2KN7TmXuTnhwyYWzQ5pg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 19 Mar 2022 16:21:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgH3kbKcNwBO7os3BuU523Gd2aqdu0dVvf50bJbLKrLJg@mail.gmail.com>
Message-ID: <CAHk-=wgH3kbKcNwBO7os3BuU523Gd2aqdu0dVvf50bJbLKrLJg@mail.gmail.com>
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

On Sat, Mar 19, 2022 at 3:54 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So warning that '%hhX' is paired with an 'int' is all just completely
> mindless and wrong.

Sadly, I can see a different bogus warning reason why people would
want to use '%02hhX'.

Again, the *sane* thing from a human perspective is to use '%02X. But
if the compiler doesn't do any range analysis at all, it could decide
that "Oh, that print format could need up to 8 bytes of space in the
result". Using '%02hhX' would cut that down to two.

And since we use

        char ev_name[5];

and currently use "_%c%02hhX" as the format string, even a compiler
that doesn't notice that "pin <= 255" test that guards this all will
go "ok, that's at most 4 bytes and the final NUL termination, so it's
fine".

While a compiler - like gcc - that only sees that the original source
of the 'pin' value is a 'unsigned short' array, and then doesn't take
the "pin <= 255" into account, will warn like this:

    drivers/gpio/gpiolib-acpi.c: In function 'acpi_gpiochip_request_interrupt':
    drivers/gpio/gpiolib-acpi.c:206:24: warning: '%02X' directive
writing between 2 and 4 bytes into a region of size 3
[-Wformat-overflow=]
       sprintf(ev_name, "_%c%02X",
                            ^~~~
    drivers/gpio/gpiolib-acpi.c:206:20: note: directive argument in
the range [0, 65535]

because gcc isn't being very good at that argument range analysis either.

In other words, the original use of 'hhx' was bogus to begin with, and
due to *another* compiler warning being bad, and we had that bad code
being written back in 2016 to work around _that_ compiler warning
(commit e40a3ae1f794: "gpio: acpi: work around false-positive
-Wstring-overflow warning").

Sadly, two different bad compiler warnings together does not make for
one good one.

It just makes for even more pain.

End result: I think the simplest and cleanest option is simply this:

  --- a/drivers/gpio/gpiolib-acpi.c
  +++ b/drivers/gpio/gpiolib-acpi.c
  @@ -387,8 +387,8 @@ static acpi_status
acpi_gpiochip_alloc_event(struct acpi_resource *ares,
        pin = agpio->pin_table[0];

        if (pin <= 255) {
  -             char ev_name[5];
  -             sprintf(ev_name, "_%c%02hhX",
  +             char ev_name[8];
  +             sprintf(ev_name, "_%c%02X",
                        agpio->triggering == ACPI_EDGE_SENSITIVE ? 'E' : 'L',
                        pin);
                if (ACPI_SUCCESS(acpi_get_handle(handle, ev_name, &evt_handle)))

which undoes that '%hhX' change for gcc, and replaces it with just
using a slightly bigger stack allocation. It's not like a 5-byte
allocation is in any way likely to have saved any actual stack, since
all the other variables in that function are 'int' or bigger.

False-positive compiler warnings really do make people write worse
code, and that's a problem. But on a scale of bad code, I feel that
extending the buffer trivially is better than adding a pointless cast
that literally makes no sense.

At least in this case the end result isn't unreadable or buggy. We've
had several cases of bad compiler warnings that caused changes that
were actually horrendously wrong.

                  Linus
