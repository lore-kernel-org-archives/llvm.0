Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D041772E
	for <llvm@lists.linux.dev>; Tue, 18 Jul 2023 22:27:44 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-3fbca8935bfso57520915e9.3
        for <llvm@lists.linux.dev>; Tue, 18 Jul 2023 15:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689719262; x=1692311262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ajkfGuHhWpyZf4wu1m1A2uRjY+ABbhyWp254o966/Jg=;
        b=T7QRmJuPvcGZ8PVIDDAbn9AvEMPEY8z8KIqJyfvvgvc5pAx8H+VtP6XClKhl/hcEyF
         0qO0Uea4czIYX+IOget+3tJGOQVCryyJ8tY00HSJX3LYiFxPoAuG+cEHVZWvAeUqH6hw
         XUoGxdQqp36byq7k4M9LnIdMwf8t4gzYh7LdZl4pDwvUW2YqaLN6EKsAjoGQGMut6ueR
         3s++xdL1yjLZJbdHGU4rg6XFh+cr35IO5HYok9oX2W2Q16UnZ5rjeeL2YFCSEy6czV3U
         AHShCzLBvOYyHFiY8AxXt5MLlUawGqw0eLstO5GbJwnmh5Kv3+Mf452iMJeFRudAg/8m
         CChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689719262; x=1692311262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ajkfGuHhWpyZf4wu1m1A2uRjY+ABbhyWp254o966/Jg=;
        b=D8K41BxYp8n91G2MegSWVKAYhGFkiUWJVp0otkvkt8pp3vEbv/K/KwlY8K/d/kYR06
         O/47AIrLJncgls1yeOPeb6LB7rjKCHgFQg/0HqQXBBLhptSXXDhiL9/IxjuT3i6jYWF3
         JGLJcre9Mr4JfsV/m3UglrQN3PxFEAraH2TCqCugMphke2eFmwnssW6D1+cBdsZ+QwKF
         +6LVSsQZURXRpA3YH88w4z2bXs0KwoC7ckZOEg7OtkuwPv5jDY3vkA5Jsg8OYoeX9L+O
         6HWvCsAADueCz/hyU/D4bOoLfMdsLgwz8iMOk1T+33Aafhg5mUv1+cVJWVCcsWJbB+Ba
         7afw==
X-Gm-Message-State: ABy/qLbmIVMddcdVJrOSd92wEB7x5BI63+Ciz/cxcJF5PwxukvU21HIa
	AFRnL4g5MKEiKnP8NyPcRmg=
X-Google-Smtp-Source: APBJJlEAI9Kmu85UEcfJlq5D3NwOQqcQUJLDJDupZmqSB2I5O91rnE1uuJgqENXkSeTBAoS5AqI8Qw==
X-Received: by 2002:a05:600c:2256:b0:3fa:99d6:47a4 with SMTP id a22-20020a05600c225600b003fa99d647a4mr3238810wmm.22.1689719262017;
        Tue, 18 Jul 2023 15:27:42 -0700 (PDT)
Received: from localhost (226.195.40.145.ftth.as8758.net. [145.40.195.226])
        by smtp.gmail.com with ESMTPSA id p1-20020a05600c204100b003fc17e8a1efsm159286wmg.45.2023.07.18.15.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 15:27:41 -0700 (PDT)
Date: Wed, 19 Jul 2023 00:27:40 +0200
From: Jakob Koschel <jkl820.git@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, Kees Cook <keescook@chromium.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] arch: enable HAS_LTO_CLANG with KASAN and KCOV
Message-ID: <F65B8613-D747-457D-8E23-D553D727B4E1@jkl820.local>
References: <20230717-enable-kasan-lto1-v2-1-d47bf182f5c6@gmail.com>
 <CAKwvOdmjzgPF9g2e5fXtM=_bkGdYdhK21iuwR7EdZJUnCxRc_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdmjzgPF9g2e5fXtM=_bkGdYdhK21iuwR7EdZJUnCxRc_w@mail.gmail.com>

On 23/07/18 10:50AM, Nick Desaulniers wrote:
> On Mon, Jul 17, 2023 at 11:49 PM Jakob Koschel <jkl820.git@gmail.com> wrote:
> >
> > Both KASAN and KCOV had issues with LTO_CLANG if DEBUG_INFO is enabled.
> > With LTO inlinable function calls are required to have debug info if
> > they are inlined into a function that has debug info.
> >
> > Starting with LLVM 17 this will be fixed ([1],[2]) and enabling LTO with
> > KASAN/KCOV and DEBUG_INFO doesn't cause linker errors anymore.
> >
> > Link: https://github.com/llvm/llvm-project/commit/913f7e93dac67ecff47bade862ba42f27cb68ca9
> > Link: https://github.com/llvm/llvm-project/commit/4a8b1249306ff11f229320abdeadf0c215a00400
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>
> > ---
> > Changes in v2:
> > - Added correct To:/Cc:
> > - Added comment about required LLVM 17 version dependency
> > - Link to v1: https://lore.kernel.org/r/20230717-enable-kasan-lto1-v1-1-471e706a5c4e@gmail.com
> > ---
> >  arch/Kconfig | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index aff2746c8af2..d722bcfcc870 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -745,7 +745,10 @@ config HAS_LTO_CLANG
> >         depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
> >         depends on ARCH_SUPPORTS_LTO_CLANG
> >         depends on !FTRACE_MCOUNT_USE_RECORDMCOUNT
> > -       depends on !KASAN || KASAN_HW_TAGS
> > +       # KASAN & KCOV were missing necessary debug information prior to LLVM 17
> > +       # which are required with LTO.
> 
> Hi Jakob,
> Thanks for follow up with a v2.  I think Nathan meant he was literally
> looking for a link here in the comment, like:
> 
> # https://github.com/ClangBuiltLinux/linux/issues/1721
> 
> Mind sending a v3 with that? You can replace the comment you added to
> arch/Kconfig in v2 outright with that link.
> 
> If folks need to know more they can follow that link or run git blame on it.

Ha, that's on me when copying from the other email I shamelessly forgot the
most important line.

Will make a v3, sorry about that.

> 
> > +       depends on (!KASAN || KASAN_HW_TAGS || CLANG_VERSION >= 170000) || !DEBUG_INFO
> > +       depends on (!KCOV || CLANG_VERSION >= 170000) || !DEBUG_INFO
> >         depends on !GCOV_KERNEL
> >         help
> >           The compiler and Kconfig options support building with Clang's
> >
> > ---
> > base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
> > change-id: 20230717-enable-kasan-lto1-656754c76241
> >
> > Best regards,
> > --
> > Jakob Koschel <jkl820.git@gmail.com>
> >
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
