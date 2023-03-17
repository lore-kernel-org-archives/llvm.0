Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0B93212
	for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 20:31:36 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id u32so7057149ybi.6
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 13:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679085095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAOavDnRCoSnVP+J06YC2/4u8vunh0Z+T3beJB56tGs=;
        b=k+EG32PX1ks8+ifXvbd81Om1X7/ouU/fclSmvOJQ6z8d4A6BhoFcR2hmyn0VZcZpvN
         4BcY253DsV872KX7/Kl0FOFevZo708obZXDpwJa9PTfrgTD9Sd6OhYi2T9HUPcQqpn5L
         gcStPAaLdZ3v4xIb1toioU5nnc/lrFSRDu7Gk0x6OJYBniOascUkYHSALyL88KBT6K0V
         gDQCqjTxDfVppLvIAQjw+x5qkPmA9cwvr62NCfwFDGb3m87FE9OoioXhs3DBARJbBeE4
         t6uMnQEILgooKqjurhy58mcUi/pFqOlG/OocDFsjtsVFodAq60elK4rbquPFR3C8TFr1
         8ryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679085095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAOavDnRCoSnVP+J06YC2/4u8vunh0Z+T3beJB56tGs=;
        b=leG4g/jW164iP4R/bVvLPcPokDiqzhO4xN4ijh8vuM7yVkGCYLroQys65W0xpH6uzv
         3Bug4lwsVCC/emJ4rVyoycl2QS90vKeavEIM1rBTiue+jZlTB5OeOxcF5V/970P9YvPT
         6Ep6QnCfqhpNM9JfxaeHAyrrOmcs77FsBAgfqk8RY03ETQcCYTWqF+WUbr7lRRW9YaLq
         GllR8m6HiEUzEvm1zmkCavdd2NMb4Y2QjK8/BXZoC0Z+S2nkV0kbHCWftTp761zumOpq
         L2KXKnnEhSPv7WsHdsju58Ljnh0pMHCm9Nk/66h3PPJmINsXazR7tTINrWzFrnesZHdI
         h6SA==
X-Gm-Message-State: AO0yUKWTxLzCImBB0jMarRykyAzz/3Xf/Nl9R+VDqigObq5nLEvl7TJd
	4tDl46YyO+l4nZcXPiKj3WmCR1N9lqn5hEOsvLo=
X-Google-Smtp-Source: AK7set8lugLqGHowHkdXeIrEFyz+BTJvhQtaUcRiKKfFq6PTMzogHg2zvMvP7eBqclL95hiTyI6xGRcA0qPJTZRMXEg=
X-Received: by 2002:a25:e90b:0:b0:b21:5fb4:c6e6 with SMTP id
 n11-20020a25e90b000000b00b215fb4c6e6mr465188ybd.11.1679085095448; Fri, 17 Mar
 2023 13:31:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9d0ef355-f430-e8e2-c844-b34cfcf60d88@kernel.dk>
 <CAHk-=wgcYvgJ5YWJPy6PA-B_yRtPfpw01fmCqtvqGN9jouc_8w@mail.gmail.com> <CAHk-=wj1wYh_2d8Y1Vm6YjPTh4yMqWc++aWVY2LpX7n_atc2hA@mail.gmail.com>
In-Reply-To: <CAHk-=wj1wYh_2d8Y1Vm6YjPTh4yMqWc++aWVY2LpX7n_atc2hA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 Mar 2023 21:31:24 +0100
Message-ID: <CANiq72kjd+NES2mSthLKZduFm_KrwLShngs6jLqhoQPSb+1d-g@mail.gmail.com>
Subject: Re: [GIT PULL] Block fixes for 6.3-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 17, 2023 at 7:50=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Debug support *MUST* have an option to just continue. Sure, make "this
> is fatal" be an option *too*, because if you are a developer, maybe
> you really want the "fail hard, fail quickly" behavior.

At least for userspace it has different modes -- the default is to
report and continue:

    -fsanitize=3D...: print a verbose error report and continue
execution (default);
    -fno-sanitize-recover=3D...: print a verbose error report and exit
the program;
    -fsanitize-trap=3D...: execute a trap instruction (doesn=E2=80=99t requ=
ire
UBSan run-time support).
    -fno-sanitize=3D...: disable any check, e.g., -fno-sanitize=3Dalignment=
.

    (https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html#usage)

For the kernel I assume it is meant to work due to `UBSAN_TRAP`, but
the optimizer may be getting in the way.

From a quick look, it seems that `__find_restype` (which gets inlined
into `m5mols_set_fmt` via `__find_resolution`) has a small loop:

    do {
        if (code =3D=3D m5mols_default_ffmt[type].code)
            return type;
    } while (type++ !=3D SIZE_DEFAULT_FFMT);

that I guess gets simplified into something like:

    if (code =3D=3D first code)
        yield 0;
    if (code =3D=3D second code)
        yield 1;
    out of bounds;

When UBSAN is disabled, it may be assuming:

    if (code =3D=3D first code)
        yield 0;
    yield 1;

Thus no issue.

Though even with UBSAN disabled, if I add a dummy opaque call inside
the loop, it goes back to something like before, except the jump goes
nowhere and then `objtool` complains again:

    .LBB24_20:
        callq    dummydummydummy
    .Lfunc_end24:

So it is reproducible even without UBSAN getting involved:
https://godbolt.org/z/hTe91b3eG

Cheers,
Miguel
