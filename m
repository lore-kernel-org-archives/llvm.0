Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730F52F21
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 08:04:36 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id p26so3676828uaa.11
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 00:04:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tQv5LD/cgbiE7FIrokd4eJrbJYiLRJK3S6XRnywILyw=;
        b=tTAtz6BQ5sclTzLUJ1HZn6jlmuWokvUAxOvYFgvDuKDoZgiy+tNi05t/UhBKNy5JL5
         YW+Lc4uVUT46/P4PDnomTNo+AuU56ERB9wNNjVovoYdHS4YcbUTnA+Qj/Ditm+L+g+OC
         c0SKPWPEYPSNbh3VXq3k7GbhRBOOSh6UO8JNx+qX+jzhDl9wJuR0zvzBPYhFnGsRRdfM
         SnLTT0h2N4wP2vTpIrzDLl2dMj4oE+iw3U2tkTTXIMAUS/HA+L6eSj+/Furpxyhbj5xE
         5vM6NyLxMQA6w6AINSdmmBHan8ni9e0f1/NTNV7C45Jc5XuPL4X828Mj0g2MvDl7fFWU
         UYtw==
X-Gm-Message-State: AOAM530syOiQyOixw+1H7xRSDACiEWlPVa5ElocT3i7AkxI3Dmxi3W1f
	yhWTNzpKn7KyqR/lmSPUKwXuNAJIm50rWg==
X-Google-Smtp-Source: ABdhPJx7kzXKceKH2Phdpn/+VebnEiP7pQXNvlYX8fWk0ET9EQvZ51b9CKpmj9qhHDYO2RqJCAu6+w==
X-Received: by 2002:a67:b708:: with SMTP id h8mr12045524vsf.52.1643875475075;
        Thu, 03 Feb 2022 00:04:35 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id n67sm6412192vkf.41.2022.02.03.00.04.34
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 00:04:34 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id e17so3699352uad.9
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 00:04:34 -0800 (PST)
X-Received: by 2002:ab0:6f0d:: with SMTP id r13mr11231577uah.114.1643875473946;
 Thu, 03 Feb 2022 00:04:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220130183653.491292-1-keescook@chromium.org>
 <20220202160149.GA2322037@roeck-us.net> <202202021237.487D3DE73@keescook> <5ff18cff-6cfd-1f85-da74-1e5660a1a250@roeck-us.net>
In-Reply-To: <5ff18cff-6cfd-1f85-da74-1e5660a1a250@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Feb 2022 09:04:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWssK2=NFc6NO-inQg5dWxZP4Wv41K3J3RqRXThXatovw@mail.gmail.com>
Message-ID: <CAMuHMdWssK2=NFc6NO-inQg5dWxZP4Wv41K3J3RqRXThXatovw@mail.gmail.com>
Subject: Re: [PATCH] lib/test_string.c: Add test for strlen()
To: Guenter Roeck <linux@roeck-us.net>
Cc: Kees Cook <keescook@chromium.org>, Peter Rosin <peda@axentia.se>, 
	Andy Shevchenko <andy@kernel.org>, Matteo Croce <mcroce@microsoft.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi G=C3=BCnter,

On Thu, Feb 3, 2022 at 12:12 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On 2/2/22 12:52, Kees Cook wrote:
> > On Wed, Feb 02, 2022 at 08:01:49AM -0800, Guenter Roeck wrote:
> >> On Sun, Jan 30, 2022 at 10:36:53AM -0800, Kees Cook wrote:
> >>> Add a simple test for strlen() functionality, including using it as a
> >>> constant expression.
> >>>
> >>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> >>> Cc: Peter Rosin <peda@axentia.se>
> >>> Signed-off-by: Kees Cook <keescook@chromium.org>
> >>> ---
> >>> I'll be taking this as part of my Clang FORTIFY_SOURCE series.
> >>> ---
> >>>   lib/test_string.c | 37 +++++++++++++++++++++++++++++++++++++
> >>>   1 file changed, 37 insertions(+)
> >>>
> >>> diff --git a/lib/test_string.c b/lib/test_string.c
> >>> index 9dfd6f52de92..59994f552c48 100644
> >>> --- a/lib/test_string.c
> >>> +++ b/lib/test_string.c
> >>> @@ -179,6 +179,38 @@ static __init int strnchr_selftest(void)
> >>>     return 0;
> >>>   }
> >>>
> >>> +/*
> >>> + * Unlike many other string functions, strlen() can be used in
> >>> + * static initializers when string lengths are known at compile
> >>> + * time. (i.e. Under these conditions, strlen() is a constant
> >>> + * expression.) Make sure it can be used this way.
> >>> + */
> >>> +static const int strlen_ce =3D strlen("tada, a constant expression")=
;
> >>> +
> >>
> >> This results in:
> >>
> >> lib/test_string.c:188:30: error: initializer element is not constant
> >>    188 | static const int strlen_ce =3D strlen("tada, a constant expre=
ssion");
> >>
> >> for several of my tests. I don't think you can mandate that a compiler
> >> implements this.
> >
> > Which tests?
> >
>
> Some examples:
>
> Build reference: next-20220202
> Compiler version: m68k-linux-gcc (GCC) 11.2.0
>
> Building m68k:defconfig ... failed
> --------------
> Error log:
> lib/test_string.c:188:30: error: initializer element is not constant
>    188 | static const int strlen_ce =3D strlen("tada, a constant expressi=
on");
>
> Building mips:malta_defconfig:nocd:smp:net,e1000:initrd ... failed
> ------------
> Error log:
> lib/test_string.c:188:30: error: initializer element is not constant
>   static const int strlen_ce =3D strlen("tada, a constant expression");
>
> Building i386:q35:Broadwell:defconfig:smp:ata:net,rtl8139:hd ... failed
> ------------
> Error log:
> lib/test_string.c:188:30: error: initializer element is not constant
>    188 | static const int strlen_ce =3D strlen("tada, a constant expressi=
on");
>
> i386 and is defconfig + CONFIG_STRING_SELFTEST=3Dy; mips is
> malta_defconfig + CONFIG_STRING_SELFTEST=3Dy. All use gcc 11.2.
>
> There may be more, but there are so many failures in -next right now
> that I may be missing some.
>
> > This property of strlen() is already required by our builds (this is ho=
w
> > I tripped over it). For example:
> >
> > drivers/firmware/xilinx/zynqmp-debug.c:
> >
> > #define PM_API(id)               {id, #id, strlen(#id)}
> > static struct pm_api_info pm_api_list[] =3D {
> >          PM_API(PM_GET_API_VERSION),
> >          PM_API(PM_QUERY_DATA),
> > };
>
> I do not think that it is a C standard that strlen() on a constant string
> must be compile-time evaluated and result in a constant.

Not if -ffreestanding, which is what several architectures are
using nowadays, to a.o. prevent gcc from replacing calls to stdlib
functions to other stdlib functions (e.g. strncat() -> strlen() +
store, strncmp() -> strcmp()), which breaks linking if the latter is
only provided inline.

> Anyway, key difference, I think, is the presence of an architecture-speci=
fic
> version of strlen(), or the maybe non-presence of __HAVE_ARCH_STRLEN,
> or the definition of strlen() in include/linux/fortify-string.h.

It works after dropping -ffreestanding.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
