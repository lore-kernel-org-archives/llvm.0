Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336E22F2B
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 18:10:11 +0000 (UTC)
Received: by mail-ua1-f44.google.com with SMTP id m90so6722414uam.2
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 10:10:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C/hgS+ERDNLODK1leRfRhcIAV22csg/2nDjF16o/r6Y=;
        b=6QLNxLk7nDF4gB/Fbd3S9S0l5qnBRcn1vdUMkB+0TSleWlaiW1skh3LOwnX/IhtlM4
         AmRq7ZGSZ7NnyXIPvS5WJPo1gqKbfKCTYc2aG9CNsp/l73yCjNycLB83xiRz829lmmwN
         gXhYKE3qHCg49HXJz8E0ZiRzGL1XAq1SlRRuGPYPvaf8RhfxPNS0rPA+hkZj7sj8XjyU
         SdakW5bBFL10Fo4/PFK9ZEXUZb0H9b4bHaSwX2Xb77eN0ZsBFSjHc6mX9s0XY+fnMuq9
         lI1pGHjSCIDlqiqHTrGU0hvnE9c3ZlYlX/zo/tCxTwZ6lhHWLPuDDLj7ffzSnkCI8+5Q
         BttA==
X-Gm-Message-State: AOAM5329y8XShdZHiJx8smzJ56ZEUVkd77bwNVHyvzPx2/FE6iw16ncE
	7dhMUMLx5qhDcxsIU1U3A7qYPsk2AFUO+A==
X-Google-Smtp-Source: ABdhPJxOv2oyduA3px+cRglpA/yAOIrg4r24bZvfRDhDuq9RZ56NKaASpkYFA3YqDoSA2gHe9DefkQ==
X-Received: by 2002:a67:f70f:: with SMTP id m15mr13879900vso.61.1643911809909;
        Thu, 03 Feb 2022 10:10:09 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id k16sm5842440vsr.8.2022.02.03.10.10.09
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 10:10:09 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id r8so6819710uaj.0
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 10:10:09 -0800 (PST)
X-Received: by 2002:a67:a401:: with SMTP id n1mr13230708vse.38.1643911809441;
 Thu, 03 Feb 2022 10:10:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220130183653.491292-1-keescook@chromium.org>
 <20220202160149.GA2322037@roeck-us.net> <202202021237.487D3DE73@keescook>
 <5ff18cff-6cfd-1f85-da74-1e5660a1a250@roeck-us.net> <CAMuHMdWssK2=NFc6NO-inQg5dWxZP4Wv41K3J3RqRXThXatovw@mail.gmail.com>
 <202202030911.4914709E@keescook>
In-Reply-To: <202202030911.4914709E@keescook>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Feb 2022 19:09:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBKofPP-6EofE3B7d6k0zv0nPJ7e4pjsznPF==ApJ6qg@mail.gmail.com>
Message-ID: <CAMuHMdUBKofPP-6EofE3B7d6k0zv0nPJ7e4pjsznPF==ApJ6qg@mail.gmail.com>
Subject: Re: [PATCH] lib/test_string.c: Add test for strlen()
To: Kees Cook <keescook@chromium.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Peter Rosin <peda@axentia.se>, 
	Andy Shevchenko <andy@kernel.org>, Matteo Croce <mcroce@microsoft.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kees,

On Thu, Feb 3, 2022 at 6:15 PM Kees Cook <keescook@chromium.org> wrote:
> On Thu, Feb 03, 2022 at 09:04:22AM +0100, Geert Uytterhoeven wrote:
> > Not if -ffreestanding, which is what several architectures are
> > using nowadays, to a.o. prevent gcc from replacing calls to stdlib
> > functions to other stdlib functions (e.g. strncat() -> strlen() +
> > store, strncmp() -> strcmp()), which breaks linking if the latter is
> > only provided inline.
>
> Hah, for i386:
>
> arch/x86/Makefile
>         # temporary until string.h is fixed
>         KBUILD_CFLAGS += -ffreestanding
>
> This "temporary" is from 2006. ;)

And before that, we had it in the main Makefile.

> 6edfba1b33c7 ("[PATCH] x86_64: Don't define string functions to builtin")
>
> Removing that appears to solve it, and appears to build correctly. I'll
> continue testing.
>
> > It works after dropping -ffreestanding.
>
> I wonder if the other architectures were just copying x86?

At least on m68k it was added because gcc added new optimizations
that broke if an architecture provides some functions as inline.
As the kernel is not supposed to be linked with the standard C
library, -ffreestanding should be correct, isn't it?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
