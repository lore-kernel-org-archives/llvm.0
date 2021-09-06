Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7527B72
	for <llvm@lists.linux.dev>; Mon,  6 Sep 2021 16:30:22 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id h1so12158877ljl.9
        for <llvm@lists.linux.dev>; Mon, 06 Sep 2021 09:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8IrmItaVABpTCCV1GTBCmSGs8mDxg06CHACTL5Qkb7w=;
        b=R2wRvIZ5fztexmU3w2tyRYRDA1Rg0puldwTR9y4HA3UlQ/qnMC08DRaXlPDdqtri+Q
         fAFEd+j22NAvQfMj3ireP0Bgf1gZNxEMJl31x2rd6p84iAF4Z4IsEEKwIkc2JxJLl4T5
         f6z/63UOWwOUtQoNqw8I23oboEBdueZySRELo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8IrmItaVABpTCCV1GTBCmSGs8mDxg06CHACTL5Qkb7w=;
        b=UuqYU86w3zKon6dYF0VpnUSr8DuHt0/6J3Rsd46gae5YzWgjVqbP/K2bJ9asCBphKf
         F87M6cIGpn91/emg+JO3hEzuEiikImfnMgmSSotY7ulUKZB0BITktExZdATECDo0D7rp
         HNJnONujlee+qRSASDQQRX2Vn/qJ5AaNADEx8u2w1c7EtJyzUT3B6DamZj5hTGErAJBx
         LTfrRnb/E+KuXx8b7fXNF2NzQOvD70nupNHONtMpVICL2TRO4Npku98RVHa5fkdLXgx2
         hStbkuTMsAI1e8I+7yRWTEuX4ep8hanltWMBeVjzzD2VrOXgy0EvDNT0DpDdcOcba+iT
         BUaQ==
X-Gm-Message-State: AOAM530ZohEFq7bGdShY/mmpqkh1vR8uQKWK8dvzBF5dFtwwZofhehL0
	eydsMBjHfioJT6LC3fxqUhOKNk2Plffv4ScBWDA=
X-Google-Smtp-Source: ABdhPJxaHinDAclVvf8Xw/5crT4RwbdzIqKNF2KgPvzjfXE3Dt+Gi8YQxKC/9XfbfVveNyoU+XUIqA==
X-Received: by 2002:a2e:6a03:: with SMTP id f3mr11383854ljc.487.1630945820166;
        Mon, 06 Sep 2021 09:30:20 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id a6sm841358lfs.160.2021.09.06.09.30.18
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 09:30:18 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id f18so14317718lfk.12
        for <llvm@lists.linux.dev>; Mon, 06 Sep 2021 09:30:18 -0700 (PDT)
X-Received: by 2002:a05:6512:2611:: with SMTP id bt17mr10258695lfb.141.1630945817827;
 Mon, 06 Sep 2021 09:30:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK7LNAQ0Q6CdXaD-dVGj_e3O3JYs_crpejWKpXHYQJYxyk-1VQ@mail.gmail.com>
 <CAHk-=wgoX0pVqNMMOcrhq=nuOfoZB_3qihyHB3y1S8qo=MDs6w@mail.gmail.com>
 <3b461878-a4a0-2f84-e177-9daf8fe285e7@kernel.org> <878s0c4vng.fsf@oldenburg.str.redhat.com>
 <20210904131911.GP1583@gate.crashing.org> <871r644bd2.fsf@oldenburg.str.redhat.com>
 <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
 <20210904191531.GS1583@gate.crashing.org> <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com>
 <20210906154642.GV1583@gate.crashing.org>
In-Reply-To: <20210906154642.GV1583@gate.crashing.org>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Mon, 6 Sep 2021 09:30:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com>
Message-ID: <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com>
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Florian Weimer <fweimer@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, llvm@lists.linux.dev, 
	linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 6, 2021 at 8:50 AM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
>
> Yes they are.  It is the single standard way to get the functionality
> you want.

Sorry, but 'standard' is the part that the kernel simply doesn't do.

Just face it. The kernel isn't written with all those standards that
are designed for entirely different things in mind.

> I don't know why you think you can separate that.  Take <stdarg.h> --
> there is no other (portable, standard) way to implement receiving
> variadic arguments.

You clearly haven't actually read the thread.

That was my whole argument.  For the _historical_ situation.

           Linus
