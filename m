Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427FDA35
	for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 08:14:12 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id h187so30198357ybg.0
        for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 01:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JyqY8NPtV9nOL1byOGe85YhLGexT/CIt+eGWlU/GS7w=;
        b=gtCO1D7K21fpP2koBzksoVqeK5N/i3XuU/FtvL9LJvFqBndv4zYelVakK0FunbBVsx
         1g3Ve7RZ3KJUqLIbAx0dqXu4TcDjYyby/FaiY3l9VOe4lROlHNERL3MBJ2E4vdJy5141
         ueeVtn0H7YalFqEDNjvDXVfsJ+Baxtu7f2KM1q0nzmmtbdsmFBfdwCMQ7XiUo0GBPjOp
         0zACGrthsQNzPR0xTEmD/SbklKts+a+JSjuHO6ExOmpdum/qyF9G/I7j2yN5Mz1CbtMY
         4geL9OFqyELW7UJS7cUbclR+t/WHOYZQwD1Q+UDn+ty7iCh6dtLkxaEOuW1XxqJslO83
         09qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JyqY8NPtV9nOL1byOGe85YhLGexT/CIt+eGWlU/GS7w=;
        b=qw8oEeHB4atlTb670RU3+L//IB4YH44Z7+ulME72rrcBxlpP64fZledai+c61I9GEr
         aG2U193095IUVPbJNtRIRMBE/umeE7BQEXfKQcLvOaWfc5z7ShbcGaXIz9ql9SSoMTSp
         zP4X7bOWN98wbf5SJaxbiv8ULityj9TO3NPwJHC3MGxYjUXpJMCc2FnVH3d5cJcWIUJC
         cSBAlU1/RpEbJyxzfkH/+7GL8sK7zntriietd1gOG/hPx+5AKwTrHmun1eAqA5LPJYba
         6uMvD7gTNfGEuSDtHhXae1WOVrbEHdMMir2uUUYvNFD/ueFpjP+zN/UYkd477zWVOpJB
         1taQ==
X-Gm-Message-State: AJIora/781zVDSafr4evAYtynLET+3oP/7G4SRu4gO9PW+99zw0hEURe
	apHNLYPbFycAJeEM1WXFx3z8e+PicxSIAw9xZ/o=
X-Google-Smtp-Source: AGRyM1vYw60ly77s93AhHQO3cVlf5Ysj40C4HYQ4R7/0OxJ4IsWrYnJPFVfbGwCnFfBBVeWTuTIcndvwUrcPCOu1muU=
X-Received: by 2002:a05:6902:c4:b0:64b:4677:331b with SMTP id
 i4-20020a05690200c400b0064b4677331bmr7976423ybs.93.1656576851143; Thu, 30 Jun
 2022 01:14:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220629235326.480858-1-justinstitt@google.com>
In-Reply-To: <20220629235326.480858-1-justinstitt@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 30 Jun 2022 10:13:34 +0200
Message-ID: <CAHp75VdQws+Q8aoh0BZkq1K4Grw0ugo_=NZ1uYO0g38xFjT9Lw@mail.gmail.com>
Subject: Re: [PATCH] lib/test_printf.c: fix clang -Wformat warnings
To: Justin Stitt <justinstitt@google.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 30, 2022 at 2:11 AM Justin Stitt <justinstitt@google.com> wrote:
>
> see warnings:
> | lib/test_printf.c:157:52: error: format specifies type 'unsigned char'
> | but the argument has type 'int' [-Werror,-Wformat] test("0|1|1|128|255",
> | "%hhu|%hhu|%hhu|%hhu|%hhu", 0, 1, 257, 128, -1);
> -
> | lib/test_printf.c:158:55: error: format specifies type 'char' but the
> | argument has type 'int' [-Werror,-Wformat] test("0|1|1|-128|-1",
> | "%hhd|%hhd|%hhd|%hhd|%hhd", 0, 1, 257, 128, -1);
> -
> | lib/test_printf.c:159:41: error: format specifies type 'unsigned short'
> | but the argument has type 'int' [-Werror,-Wformat]
> | test("2015122420151225", "%ho%ho%#ho", 1037, 5282, -11627);
>
> There's an ongoing movement to eventually enable the -Wformat flag for
> clang. Previous patches have targeted incorrect usage of
> format specifiers. In this case, however, the "incorrect" format
> specifiers are intrinsically part of the test cases. Hence, fixing them
> would be misaligned with their intended purpose. My proposed fix is to
> simply disable the warnings so that one day a clean build of the kernel
> with clang (and -Wformat enabled) would be possible. It would also keep
> us in the green for alot of the CI bots.

a lot

...

>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

+ blank line

> +#define DO_PRAGMA(x) _Pragma(#x)
> +#define NOWARN(warnoption, ...)
> +           DO_PRAGMA(GCC diagnostic push)
> +                   DO_PRAGMA(GCC diagnostic ignored #warnoption)
> +                           __VA_ARGS__
> +                                   DO_PRAGMA(GCC diagnostic pop)

Is it deliberately a broken indentation here?

...

> +       /* disable -Wformat for this chunk */
> +       NOWARN(-Wformat,
>         test("0|1|1|128|255", "%hhu|%hhu|%hhu|%hhu|%hhu", 0, 1, 257, 128, -1);
>         test("0|1|1|-128|-1", "%hhd|%hhd|%hhd|%hhd|%hhd", 0, 1, 257, 128, -1);
>         test("2015122420151225", "%ho%ho%#ho", 1037, 5282, -11627);

Perhaps shift right the lines as well?

> +       )
> +       /* end chunk */

-- 
With Best Regards,
Andy Shevchenko
