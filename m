Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634991B271
	for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 19:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5a7d9d357faso90200067b3.0
        for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 12:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697656361; x=1698261161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bm/QitVoXGxf3ERCz3VJAvR9l7hSVdW0OvjmYyP6n1s=;
        b=BVbRM4HYjpwvvfcAkwiFrBe+pAB6dG/fCw2xh+U53wn/laRP0hsJEov4yTRUBR7we7
         VtujUDPsHXK6rv7cvp32s8ErweBBATDSql8NzP/ZMu8CPLYMP0qUm0mWIDxgbIJkh1ce
         /nMNYMldP7E1SV6QfHwHoBhwkXq5KH+v1QskEAm6S1G1fsLRm6NoI2yFyXuD7hxy7Ff7
         BVprlzVKndUVM/biALAG1UHcSi/FVrL1SYRuXeWC0HSQsT+PhjrF84c5Ni0ZjMR84pxX
         HtYku1LPYkYK0uxFnoPnOrdo6ATgOrEOPWt2/xObIqEcE84cFqJTwCIlU8KN4U0lDJ+g
         lSiQ==
X-Gm-Message-State: AOJu0YxZ/l0C/No0XiLwPfHQ3Qae8x3WV6rxm0O+hzsf6LHws6caYpR5
	Jh9IefV8fKW6x73Z5z9vLxR95HHHbBZpRw==
X-Google-Smtp-Source: AGHT+IH6TntERzVLymahHdFpEo8FIYVOzoaYdqw1LwEUotuwl0j8h5RXwcEjDuzuAa6f9O3+8Vgz3Q==
X-Received: by 2002:a0d:fc06:0:b0:586:a684:e7ba with SMTP id m6-20020a0dfc06000000b00586a684e7bamr183521ywf.39.1697656361280;
        Wed, 18 Oct 2023 12:12:41 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id v196-20020a8148cd000000b005928ba6806dsm1750089ywa.97.2023.10.18.12.12.40
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 12:12:41 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d84f18e908aso8157339276.1
        for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 12:12:40 -0700 (PDT)
X-Received: by 2002:a25:d7c7:0:b0:d80:1604:f6e9 with SMTP id
 o190-20020a25d7c7000000b00d801604f6e9mr285943ybg.44.1697656360583; Wed, 18
 Oct 2023 12:12:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231018182412.80291-1-hamza.mahfooz@amd.com> <CAMuHMdXSzMJe1zyJu1HkxWggTKJj_sxkPOejjbdRjg3FeFTVHQ@mail.gmail.com>
 <d764242f-cde0-47c0-ae2c-f94b199c93df@amd.com>
In-Reply-To: <d764242f-cde0-47c0-ae2c-f94b199c93df@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Oct 2023 21:12:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYDQi5+x1KxMG0wnjSfa=A547B9tgAbgbHbV42bbRu8Q@mail.gmail.com>
Message-ID: <CAMuHMdXYDQi5+x1KxMG0wnjSfa=A547B9tgAbgbHbV42bbRu8Q@mail.gmail.com>
Subject: Re: [PATCH] lib/Kconfig.debug: disable FRAME_WARN for kasan and kcsan
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: linux-kernel@vger.kernel.org, Rodrigo Siqueira <rodrigo.siqueira@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, stable@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Nick Terrell <terrelln@fb.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Kees Cook <keescook@chromium.org>, Zhaoyang Huang <zhaoyang.huang@unisoc.com>, 
	Li Hua <hucool.lihua@huawei.com>, Alexander Potapenko <glider@google.com>, Rae Moar <rmoar@google.com>, 
	rust-for-linux@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hamza,

On Wed, Oct 18, 2023 at 8:39=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.co=
m> wrote:
> On 10/18/23 14:29, Geert Uytterhoeven wrote:
> > On Wed, Oct 18, 2023 at 8:24=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@am=
d.com> wrote:
> >> With every release of LLVM, both of these sanitizers eat up more and
> >> more of the stack. So, set FRAME_WARN to 0 if either of them is enable=
d
> >> for a given build.
> >>
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> >
> > Thanks for your patch!
> >
> >> --- a/lib/Kconfig.debug
> >> +++ b/lib/Kconfig.debug
> >> @@ -429,11 +429,10 @@ endif # DEBUG_INFO
> >>   config FRAME_WARN
> >>          int "Warn for stack frames larger than"
> >>          range 0 8192
> >> -       default 0 if KMSAN
> >> +       default 0 if KASAN || KCSAN || KMSAN
> >
> > Are kernels with KASAN || KCSAN || KMSAN enabled supposed to be bootabl=
e?
>
> They are all intended to be used for runtime debugging, so I'd imagine so=
.

Then I strongly suggest putting a nonzero value here.  As you write
that "with every release of LLVM, both of these sanitizers eat up more and =
more
of the stack", don't you want to have at least some canary to detect
when "more and more" is guaranteed to run into problems?

> > Stack overflows do cause crashes.
>
> It is worth noting that FRAME_WARN has been disabled for KMSAN for quite
> a while and as far as I can tell no one has complained.

ROTFL...

> >>          default 2048 if GCC_PLUGIN_LATENT_ENTROPY
> >>          default 2048 if PARISC
> >>          default 1536 if (!64BIT && XTENSA)
> >> -       default 1280 if KASAN && !64BIT
> >>          default 1024 if !64BIT
> >>          default 2048 if 64BIT
> >>          help

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
