Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A12C2D7;
	Mon, 17 Jul 2023 21:31:32 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b8a44ee159so30412415ad.3;
        Mon, 17 Jul 2023 14:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689629492; x=1692221492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/shnMI8ItryjTJrs8VRlzMOR+uoHpxLd3090WJLPPd4=;
        b=KS26rpGuWkjO9/8Iz965pv7SQpWXR8WR3U/qjdU6ha5Rdbga0ext24a/pgt4qiIIXq
         jxe0RMoFE+lTtD710kGm2SNlSOZOc8PjL2OWwi4AoxpbiYTEfUoKgRoApUR2oJi74Pky
         Vrfq1k/2UJRcGfojj4OKYWBjFFWkso9B8wijSkRLlMJ/HSM3RTPcTkYsOJdUfBakNeFv
         Z1J6WcrpovZs9Y6eRI7K55dNdcRFdZFQvHPjPAn/Uc5/4YRorQc8R/Brda4KgWfJ8FVi
         YDiKivCDy51HqlwqWIVsCIDHLLMrbk3KlX8zx9CjmK9/Qu9gslFwbB58v5KTQglaEqBr
         bP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689629492; x=1692221492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/shnMI8ItryjTJrs8VRlzMOR+uoHpxLd3090WJLPPd4=;
        b=a6JmfKTtTaqAk0+A4J1L/p09m77R6tU+qY0LEyV/z6rFa7oInPpw4x1oU3Yw5uxvxf
         J8git7oD2EZOfGGweyvtcAxjCOjL2Zz1gq6Ds7MOPogPfdTFUjLxjLLdMT9Oi7DbwCqz
         9fc2Uwq/5DuJLD/ehT9rHb/fJpdZCpbt+cscb+zC3lXXNJXyXoJeaecONENp0WxXZ6gf
         J9pTJbT5qFv34F2obJa3RhrI6WN7tUHdjocQ7NCn9QHUZlC2cn0cvXcj3s5VhMsreYfV
         Q4zlXWumilk2U/KLdciCiQk2zv+uf7YO7T4J4S/xdZdFy9dmsJdldKfso9EU7SrDGcpj
         5Irw==
X-Gm-Message-State: ABy/qLaASvyfcsp84xo0KAMgeJmN1T4JbqSjMLdNxLWAqzGyGGEguJp9
	zBkiQrlJRYMJ5fckg5GH2fk=
X-Google-Smtp-Source: APBJJlEQ+6sZCrOnH74M/QIgGWhQ0QArU/S1q6/IiWa+T2eLFIal9wuo0KpvqaIeniJBUVX+JQznFA==
X-Received: by 2002:a17:902:ea05:b0:1b3:9d13:34b3 with SMTP id s5-20020a170902ea0500b001b39d1334b3mr14862778plg.37.1689629491636;
        Mon, 17 Jul 2023 14:31:31 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id e9-20020a170902744900b001b86deba2f9sm294217plt.284.2023.07.17.14.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 14:31:31 -0700 (PDT)
Date: Mon, 17 Jul 2023 14:31:24 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alexander Lobakin <alexandr.lobakin@intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Tom Rix <trix@redhat.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] lib/bitmap: waive const_eval test as it breaks the build
Message-ID: <ZLWzLHsGmRxpylxN@yury-ThinkPad>
References: <20230717195813.29059-1-yury.norov@gmail.com>
 <20230717203105.GA2212488@dev-arch.thelio-3990X>
 <CAKwvOdmUb=JgigcHxOR2trAx+fSxsKu9nNbpAhN1hC8_RBNXeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdmUb=JgigcHxOR2trAx+fSxsKu9nNbpAhN1hC8_RBNXeQ@mail.gmail.com>

On Mon, Jul 17, 2023 at 01:57:40PM -0700, Nick Desaulniers wrote:
> On Mon, Jul 17, 2023 at 1:31 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Hi Yury,
> >
> > On Mon, Jul 17, 2023 at 12:58:13PM -0700, Yury Norov wrote:
> > > When building with clang, and when KASAN and GCOV_PROFILE_ALL are both
> > > enabled, the test fails to build [1]:
> > >
> > > >> lib/test_bitmap.c:920:2: error: call to '__compiletime_assert_239' declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(res)
> > >            BUILD_BUG_ON(!__builtin_constant_p(res));
> > >            ^
> > >    include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
> > >            BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
> > >            ^
> > >    include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
> > >    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
> > >                                        ^
> > >    include/linux/compiler_types.h:352:2: note: expanded from macro 'compiletime_assert'
> > >            _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> > >            ^
> > >    include/linux/compiler_types.h:340:2: note: expanded from macro '_compiletime_assert'
> > >            __compiletime_assert(condition, msg, prefix, suffix)
> > >            ^
> > >    include/linux/compiler_types.h:333:4: note: expanded from macro '__compiletime_assert'
> > >                            prefix ## suffix();                             \
> > >                            ^
> > >    <scratch space>:185:1: note: expanded from here
> > >    __compiletime_assert_239
> > >
> > > Originally it was attributed to s390, which now looks seemingly wrong. The
> > > issue is also not related to bitmap code itself, but it breaks build for
> > > a given configuration. So, disabling the test unless the compiler will
> > > get fixed.
> > >
> > > [1] https://github.com/ClangBuiltLinux/linux/issues/1874
> > >
> > > Fixes: dc34d5036692 ("lib: test_bitmap: add compile-time optimization/evaluations assertions")
> > > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > > ---
> > >  lib/test_bitmap.c | 17 +++++------------
> > >  1 file changed, 5 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
> > > index 187f5b2db4cf..a791fdb7a8c9 100644
> > > --- a/lib/test_bitmap.c
> > > +++ b/lib/test_bitmap.c
> > > @@ -1163,6 +1163,9 @@ static void __init test_bitmap_print_buf(void)
> > >
> > >  static void __init test_bitmap_const_eval(void)
> > >  {
> > > +#if defined(CONFIG_CC_IS_CLANG) && defined(CONFIG_KASAN) && defined(CONFIG_GCOV_PROFILE_ALL)
> > > +#warning "FIXME: Clang breaks compile time evaluations when KASAN and GCOV are enabled"
> >
> > Making this a '#warning' will basically just replace the current error
> > with a different one in the face of CONFIG_WERROR, which seems pointless
> > to me:
> >
> >   lib/test_bitmap.c:1167:2: error: "FIXME: Clang breaks compile time evaluations when KASAN and GCOV are enabled" [-Werror,-W#warnings]
> >    1167 | #warning "FIXME: Clang breaks compile time evaluations when KASAN and GCOV are enabled"
> >         |  ^
> >   1 error generated.
> >
> > Could we just opt out of GCOV for test_bitmap.c if KASAN is enabled with
> > clang? That does not seem too bad of a workaround. I highly doubt there
> > are many people who are interested in debugging test_bitmap.c with KASAN
> > while profiling it with GCOV when building with clang, since they would
> > have hit this already and reported it already; as far as I can tell,
> > only the Intel robot has reported this with a randconfig.
> 
> Yury, Nathan,
> Thanks for the patches and discussion.  Yes, I think a combo of:
> 
> 1. Nathan's lib/Makefile change plus
> 2. Yury's removal of the current preprocessor guards in lib/test_bitmap.c
> 
> make most sense.

OK, then I'll send a v2 shortly. Nathan, don't you mind if I add your
co-developed-by for this?
