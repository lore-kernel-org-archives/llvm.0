Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096A83FF0
	for <llvm@lists.linux.dev>; Thu,  9 Sep 2021 16:52:15 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id h16so4942034lfk.10
        for <llvm@lists.linux.dev>; Thu, 09 Sep 2021 09:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6u9UXBJqq0DvpwbwzhX2UgLgOMc73mPLE0iuNkQUyLg=;
        b=c3sO1BQBDxCW8APZUbAlW9nwWGjPxn+LQp0JgfliDLXRZzDRVo3j7/1R4pPWKE+xNx
         UbgmU4XAmaM891Bx14LElamvax9VI3JEUCFywjuYbWwv0nvT93I+fRhltOoT4VSe8vnz
         QPRBUEbBxEv21a9fqhAw650AWuxptlmMiPwqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6u9UXBJqq0DvpwbwzhX2UgLgOMc73mPLE0iuNkQUyLg=;
        b=5idJCEuWgHX5qOHIYGa6PCl0o4Dzx9NiD7mFQ8FBO+n4If1Ag3o2aXvXLinj1R+mg4
         30btXM4bDGQbsRUBbo0gtCLzBDFdJolF5yXtvfZRPCzxC19hp3gfkaORY32jRK/8HEeZ
         u825bmM/Gw2cLdnTCpUvpmtGe5SiCkPq+3CtF4IAt4L9qwOPSELDpsMB26PJ/AsTChc4
         IuPTDspgBXwAhgD/JuuI9bEseh5BDtMi7wbRTXEEWY8J2kqBp79e8kStQq3ebqUR+N6M
         dZOWWN15CW2Zf4REM8SVCLdxlMqH16qNVck7Zei5Bt85zaM3TA+YzKj1DKFGVG7QfgYR
         p15A==
X-Gm-Message-State: AOAM532awl05LLs9P3PLCNwb9TI2A4p6KnoPy71oZduGB4EqJzw5NMPP
	6dohEACAJZQtKtzffvOWtg9Clxeg5LI6yeFCqYg=
X-Google-Smtp-Source: ABdhPJylNWI6l3vIf1L6HsOCE4qvqDHmV3H2uo9Yc3Ak/vVshF1YPvInZ15SdzfYuwQxaRrLuKsarA==
X-Received: by 2002:ac2:551a:: with SMTP id j26mr646273lfk.354.1631206333505;
        Thu, 09 Sep 2021 09:52:13 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id e18sm253716ljo.105.2021.09.09.09.52.12
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Sep 2021 09:52:13 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id p15so4033533ljn.3
        for <llvm@lists.linux.dev>; Thu, 09 Sep 2021 09:52:12 -0700 (PDT)
X-Received: by 2002:a05:6512:1112:: with SMTP id l18mr609222lfg.402.1631206001151;
 Thu, 09 Sep 2021 09:46:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210906142615.GA1917503@roeck-us.net> <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain> <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
 <YTkjJPCdR1VGaaVm@archlinux-ax161> <75a10e8b-9f11-64c4-460b-9f3ac09965e2@roeck-us.net>
 <YTkyIAevt7XOd+8j@elver.google.com> <YTmidYBdchAv/vpS@infradead.org>
In-Reply-To: <YTmidYBdchAv/vpS@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 Sep 2021 09:46:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=whsicuPaicXWh5je6unQYRKwoazuNLzB-9PRXpSY3CZ-g@mail.gmail.com>
Message-ID: <CAHk-=whsicuPaicXWh5je6unQYRKwoazuNLzB-9PRXpSY3CZ-g@mail.gmail.com>
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
To: Christoph Hellwig <hch@infradead.org>
Cc: Marco Elver <elver@google.com>, Guenter Roeck <linux@roeck-us.net>, 
	Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev <kasan-dev@googlegroups.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 8, 2021 at 10:59 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> While we're at it, with -Werror something like this is really futile:

Yeah, I'm thinking we could do

 -Wno-error=cpp

to at least allow the cpp warnings to come through without being fatal.

Because while they can be annoying too, they are most definitely under
our direct control, so..

I didn't actually test that, but I think it should work.

That said, maybe they should just be removed. They might be better off
just as Kconfig rules, rather than as a "hey, you screwed up your
Kconfig" warning after the fact.

             Linus
