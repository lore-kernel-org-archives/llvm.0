Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EB663E
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 17:06:15 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id b5so2170221ljf.13
        for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 10:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R/7FJJ7qSAHgZRJnHXKO5tZ1Hgqiu2AMH/REX+ZRS18=;
        b=CcgHOId2RyMEcxGfJARNzZUbdlGCM1utZBV6z2njMf4aotZ5ZdYT92P6HnVd9xeSDn
         6SKI9lq8krPDyV7w1W69qTqXWW/ZdAWa6Mrom2kCjhCKYZp8s9hila6IncLMwIkz1Ozv
         Oq53zzxlEASFXHt6+NFvB+ficHM9zDUPGzfao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R/7FJJ7qSAHgZRJnHXKO5tZ1Hgqiu2AMH/REX+ZRS18=;
        b=UNpyMBzg3lu6k4Eze6ujxf8iFF+i7lGeeQz5zokH7s8vSSsjji9VladeDmMwooZN+V
         HJhnnXpOvg4werTYow6kqg75QgArdxo0VFZpRCTAdjOh3D40JmxuPPpLSIL0HDSHagDk
         73+UatKk1bMSOmpIyDcWpGcLfo/AV9JY7lwOxz2EnivG53LHAC4MFcGTwH2GC+CkEcnD
         TzR7JKF5mMdQLgDURO/YQpK7Ci6bpgHx1QJDUUmOY+PmRnUAHW9lgOyQ9aB/LPZjvQD/
         NCkgJhlDuBc6phiSPlgEDeuKL/VchPmoipXYIXZLGG47mbFb1sNE705ThXJva4ePvzwE
         Y7nA==
X-Gm-Message-State: AOAM531VhWU0jlNna7JU9SWYP5lSAARd/09r6MwAEeZ4Ls+3ynjFTECC
	GXgycatXN6s6KpL2LHipPioYkgscYNruJm0D48E=
X-Google-Smtp-Source: ABdhPJw/BLSTIvRphwDahUgeawA2hg/O4P9KQ37txElc7qO4wQMpoH4STWz0FFxmqp5wjmUuYVp3LQ==
X-Received: by 2002:a05:651c:b07:b0:247:e06d:8943 with SMTP id b7-20020a05651c0b0700b00247e06d8943mr16200238ljr.426.1647882372972;
        Mon, 21 Mar 2022 10:06:12 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id j16-20020a05651231d000b0044a01d1ee94sm1436250lfe.306.2022.03.21.10.06.11
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 10:06:12 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id w7so25643992lfd.6
        for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 10:06:11 -0700 (PDT)
X-Received: by 2002:a05:6512:b13:b0:448:90c6:dc49 with SMTP id
 w19-20020a0565120b1300b0044890c6dc49mr15823991lfu.542.1647882371543; Mon, 21
 Mar 2022 10:06:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220316213055.2351342-1-morbo@google.com> <20220319222228.4160598-1-morbo@google.com>
 <CAHk-=wh4B42bYZmGoY8=UsqHDuq_th2KN7TmXuTnhwyYWzQ5pg@mail.gmail.com>
 <CAHk-=wgH3kbKcNwBO7os3BuU523Gd2aqdu0dVvf50bJbLKrLJg@mail.gmail.com> <CAHp75Vc+T3eM9=yu9XccXKmf1ZnR6dz1ZP_eL4faPnM8ZNbbnQ@mail.gmail.com>
In-Reply-To: <CAHp75Vc+T3eM9=yu9XccXKmf1ZnR6dz1ZP_eL4faPnM8ZNbbnQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 21 Mar 2022 10:05:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi0zxgKyHn1F_K6o-uxvPmdKA0njcyD3PDSAvVZgdk4OA@mail.gmail.com>
Message-ID: <CAHk-=wi0zxgKyHn1F_K6o-uxvPmdKA0njcyD3PDSAvVZgdk4OA@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: acpi: use correct format characters
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bill Wendling <morbo@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 21, 2022 at 3:09 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Would you sign off on this? I will then replace the original patch
> with your version.

Sure. Note that I (intentionally) do bogus indentation of my inline
patches, because that thing wasn't actually _tested_. It's obvious
enough and should fix the issue, but I just wanted to point that out.

With that said, it's _so_ obviously correct (famous last words) that
I'll happily add my sign-off to it:

    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

and I suspect the explanations in the email could probably be used as
much of a commit message.

> And for the record I have a follow up patch to clearly show that pin
> is always unsigned, induced by this discussion.

Yeah, that sounds like a good idea - for a compiler it was obvious due
to the load from a 'u16' array, but a human would actually have to go
and check what that pin_table[] array was to see that "yup, that can't
be negative in 'int'".

                Linus
