Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71603EC2
	for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 07:33:38 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-58df8cab1f2so33113527b3.3
        for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 00:33:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693208017; x=1693812817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twwg7V6K5h5vu0zZiNn8PwZ/O/DRHer4vjbsqZJL+Zo=;
        b=ESFkwWv6Pqm0Sdj5DG4jlPcL5GkmVj9CkR8A3ETRNEHo3VeJI2LIn3CD5/WawaXbsK
         858no+xSOC3WZEGmnbApcMwmxUlgpxb+xx3dpO9TPbZ3FFkfHqgNSvsgbdUb2o00FwT7
         sfJXw22YxkHatV1HNCWxQAT1C7BGIcZ+160hAiQrVZTn6iyDvXK5PftNb9PTh532hFle
         ajzUYkUG1gxr680T8Q+glUJC19UXeZ4pvHREg5EoQxoqX7bFypHWu6Zqn8FiNrvuKm8Y
         0sh72FpeNt3lkRZ1yalq0LUy4y0u856027lf2xScBvHIPt9fVumHQqpJsb4aCPYO/Fo2
         mqJA==
X-Gm-Message-State: AOJu0Yy17gsdwTPz1BCpbmMVSF+MZD0APMg7hiyWqY03HXwKJbzm8gKu
	tiCFadldE5pL0L2qPCFeveO/gScXOlJDfw==
X-Google-Smtp-Source: AGHT+IETpSlJwSNkzzrcXoF2s9AzNRBqF1hYWzcj12jtEn2tDvu0ptSymuYhFolJbI5LEoozqDudmA==
X-Received: by 2002:a81:914f:0:b0:586:9c8b:ae7 with SMTP id i76-20020a81914f000000b005869c8b0ae7mr26568411ywg.46.1693208017046;
        Mon, 28 Aug 2023 00:33:37 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id c19-20020a81df13000000b0058442f46fbfsm1982836ywn.44.2023.08.28.00.33.36
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 00:33:36 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-58df8cab1f2so33113117b3.3
        for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 00:33:36 -0700 (PDT)
X-Received: by 2002:a25:9cc3:0:b0:d09:a51:8e7a with SMTP id
 z3-20020a259cc3000000b00d090a518e7amr23396808ybo.47.1693208016589; Mon, 28
 Aug 2023 00:33:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZOkGCSNr0VN2VIJJ@p100> <CAHk-=wjZwSymfuGvf7TX3UQLU1OMN1FZMnEA-Hja0ruqyhMK4A@mail.gmail.com>
 <CAHk-=whVvD05T0yD5DQj803uETLD6qDq-Vx-SiLPcrL=eO77LQ@mail.gmail.com>
 <CAKwvOdnYauyrzz7-ceH-MP_KZ5ED8oYxjRx_Xei68=tUOSeKyA@mail.gmail.com>
 <CAGG=3QWcZPYqHMcjwuYDz1+OQhzS40hmhdOvSBZBQOkhs8YAQQ@mail.gmail.com>
 <CAGG=3QX8AaTedPy-joWm6yp+TFHBVXm59OcvxkdLGsSuDjem5g@mail.gmail.com>
 <CAHk-=wjQpXpnGAwvv-oBi+cQ0g+D9rTK5STkXSSV4a90FPR+EQ@mail.gmail.com>
 <CAKwvOdm_y6UOnxFrAiDxou2jc8CRUvyhfH9kAdc3PG0=bEvduw@mail.gmail.com> <CAHk-=wgJzMzPFTCzejWs1WM4=74z2VENyOzySnucrXG3i=ajrw@mail.gmail.com>
In-Reply-To: <CAHk-=wgJzMzPFTCzejWs1WM4=74z2VENyOzySnucrXG3i=ajrw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Aug 2023 09:33:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZ4fGjjXguftvrB69rt7dR6ngFA46YB8oGpk2_issJzA@mail.gmail.com>
Message-ID: <CAMuHMdXZ4fGjjXguftvrB69rt7dR6ngFA46YB8oGpk2_issJzA@mail.gmail.com>
Subject: Re: [PATCH] lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-bit kernels
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Helge Deller <deller@gmx.de>, Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Chanho Min <chanho.min@lge.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <keescook@chromium.org>, clang-built-linux <llvm@lists.linux.dev>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Sat, Aug 26, 2023 at 3:08=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Fri, 25 Aug 2023 at 17:52, Nick Desaulniers <ndesaulniers@google.com> =
wrote:
> And quite often we simply use other names - but then we also do *not*
> build with -freestanding, because -freestanding has at least
> traditionally meant that the compiler won't optimize the simple and
> obvious cases (typically things like "memcpy with a constant size").

Several architectures (incl. x86, but excl. amd64) do build the kernel with
-freestanding.

IIRC, the issue was that without that, gcc was "optimizing" calls
to standard functions (implemented as inline optimized assembler
functions) by replacing them with calls to other standard functions
(also implemented as inline optimized assembler functions).  As the
latter became external calls, this defeated the optimized assembler
implementation, and could even cause build failures if no external
implementation was available.

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
