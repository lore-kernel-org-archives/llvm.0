Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E264A3FC4
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 21:14:09 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id g1so12443576lfj.12
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 14:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h6laIf/b4mPqz9ieIo0BoLxfadBv/pBLzz57FwMCWS8=;
        b=SEu7xaZSAjVMKNw5hjypkoLJ+5JYwWZcOY2BABqYuBro/CZPK17EczUQuLCrutTPGL
         16Qz1HYIlWBLiIz9fuIN+11uBldPo/W5AePdN6GsQEA+SUtc8P+uASAYS6tS0ldHx07E
         2lonLGUWd9SBbHuElL3JERelxOI/WCQiYZQMZ+cnIB22lorehJTp1jfpHpUXPGwAVLsr
         iug/4lH2iw/Q756RGmEMyqecg2b3vt+REqwODu74njL+3uIRYmD7FhCYQoWZA7S/e7X4
         zbL4RRw54fmrJ/xhPMXQuEF33NXAg8H1490G0IrDnCzFSwlQt8KLs4uiBLXAehRStlz0
         T9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h6laIf/b4mPqz9ieIo0BoLxfadBv/pBLzz57FwMCWS8=;
        b=LLhaWydW3HI0M9aQPdQGfzY7LRSrhykd/3mlTNFDCVzHDGF+ebGN2uQaZKvDBPiUit
         6OTOzXz8jZy5/krHxGwOY1haStdQsRcLwx8TkFCGwhJG2KEIvE7mTZso4pCDOsxkpJgA
         zvSPSQ2KpXmY3AoCGghoiPIYCC1R4xFHdVFnxD3JkRAQN42FQa7v+Xx8LsBGViMxM5VW
         fjWEhOftOy6NddLtiGznSpjlD2ZeuZC9vQfWFzRqCiMmeUks3KIjKjJ+VRiy74irtHu+
         NkmXaDbsaU1ljgHnnaLpVjoJaZc4SexyhK9FYJLGebtl/5hSq1R3/q5gRV1bXV0QmtKZ
         DTEg==
X-Gm-Message-State: AOAM531J+htXmCp0f4xj3KmI52w0JYCd2Wu+mQ1NwItGWGVmCYUNEpTl
	6viniKVTcDu6107FcssxDx2t0xNI5c7EF16A6YebuA==
X-Google-Smtp-Source: ABdhPJxkLmqkKxedt4K1O1ibv9lFvdfqJ+fiA/MxD/66QbtZI4YNO+29iajeZ9ssOU5ujtimoPSmNKGFx6XRwVjLntg=
X-Received: by 2002:a05:6512:3b9e:: with SMTP id g30mr10188187lfv.651.1631567647760;
 Mon, 13 Sep 2021 14:14:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210913131113.390368911@linuxfoundation.org> <20210913131114.028340332@linuxfoundation.org>
 <CA+G9fYtdPnwf+fi4Oyxng65pWjW9ujZ7dd2Z-EEEHyJimNHN6g@mail.gmail.com>
 <YT+RKemKfg6GFq0S@kroah.com> <CAKwvOdmOAKTkgFK4Oke1SFGR_NxNqXe-buj1uyDgwZ4JdnP2Vg@mail.gmail.com>
 <CAKwvOdmCS5Q7AzUL5nziYVU7RrtRjoE9JjOXfVBWagO1Bzbsew@mail.gmail.com>
 <CA+icZUVuRaMs=bx775gDF88_xzy8LFkBA5xaK21hFDeYvgo12A@mail.gmail.com>
 <CAKwvOdmN3nQe8aL=jUwi0nGXzYQGic=NA2o40Q=yeHeafSsS3g@mail.gmail.com>
 <CAHk-=whwREzjT7=OSi5=qqOkQsvMkCOYVhyKQ5t8Rdq4bBEzuw@mail.gmail.com>
 <CAKwvOdkf3B41RRe8FDkw1H-0hBt1_PhZtZxBZ5pj0pyh7vDLmA@mail.gmail.com>
 <CAHk-=wjP2ijctPt2Hw3DagSZ-KgdRsO6zWTTKQNnSk0MajtJgA@mail.gmail.com> <CAKwvOd=ZG8sf1ZOkuidX_49VGkQE+BJDa19_vR4gh2FNQ2F_9Q@mail.gmail.com>
In-Reply-To: <CAKwvOd=ZG8sf1ZOkuidX_49VGkQE+BJDa19_vR4gh2FNQ2F_9Q@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 13 Sep 2021 14:13:56 -0700
Message-ID: <CAKwvOdkz4e3HdNKFvOdDDWVijB7AKaeP14_vAEbxWXD1AviVhA@mail.gmail.com>
Subject: Re: [PATCH 5.14 018/334] nbd: add the check to prevent overflow in __nbd_ioctl()
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Nathan Chancellor <natechancellor@gmail.com>, Baokun Li <libaokun1@huawei.com>, 
	open list <linux-kernel@vger.kernel.org>, linux-stable <stable@vger.kernel.org>, 
	Hulk Robot <hulkci@huawei.com>, Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	Sasha Levin <sashal@kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, 
	lkft-triage@lists.linaro.org, llvm@lists.linux.dev, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 1:50 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Sep 13, 2021 at 1:42 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Mon, Sep 13, 2021 at 1:16 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > Do we have access to _Generic in GCC 4.9?
> >
> > We've ended up using it unconditionally since last year, so yes.
>
> Sorry, grepping would have taken < 1s. I'm very lazy.
> http://threevirtues.com/
>
> >
> > In fact, the compiler version tests got removed when we raised the gcc
> > version requirement to 4.9 in commit 6ec4476ac825 ("Raise gcc version
> > requirement to 4.9"):
> >
> >    "In particular, raising the minimum to 4.9 means that we can now just
> >     assume _Generic() exists, which is likely the much better replacement
> >     for a lot of very convoluted built-time magic with conditionals on
> >     sizeof and/or __builtin_choose_expr() with same_type() etc"
> >
> > but we haven't used it much since.
> >
> > The "seqprop" code for picking the right lock for seqlock is perhaps
> > the main example, and staring at that code will make you go blind, so
> > look away.
>
> Looking at my patch:
> https://lore.kernel.org/stable/20210913203201.1844253-1-ndesaulniers@google.com/
> I don't think _Generic helps us in the case of dispatching based on
> the result of is_signed_type() (the operands could undergo type
> promotion, so we'd need lots of cases that are more concisely covered
> by is_signed_type()). It could replace the nested checks in div_64
> with nested _Generics, I think. Not sure it's a huge win for
> readability.  Maybe cut the number of expansions of the parameters in
> half though. Let me give it a try just to see what it looks like.

Is this more readable? Same line count.  I'm not sure if there's such
a thing as "fallthrough" between the "cases" of _Generic to minimize
duplication, or whether this could be factored further.  Needs lots
more () around macro param use and tab'ed out line endings...






diff --git a/include/linux/math64.h b/include/linux/math64.h
index 8652a8a35d70..8fc4d56a45b9 100644
--- a/include/linux/math64.h
+++ b/include/linux/math64.h
@@ -162,17 +162,17 @@ static inline s64 div_s64(s64 dividend, s32 divisor)
                div_u64(dividend, divisor));            \
 })

-#define __div_64(dividend) _Generic((divisor), \
-  s64: div64_x64,      \
-  u64: div64_x64,      \
-  default: div_x64)
+#define __div_64(dividend, divisor) _Generic((divisor),        \
+  s64: div64_x64(dividend, divisor),   \
+  u64: div64_x64(dividend, divisor),   \
+  default: div_x64(dividend, divisor))

 #define div_64(dividend, divisor) ({
         \
        BUILD_BUG_ON_MSG(sizeof(dividend) > sizeof(u64),
         \
                         "128b div unsupported");
         \
        _Generic((dividend),    \
-               s64: __div_64(dividend)(dividend, divisor),     \
-               u64: __div_64(dividend)(dividend, divisor),     \
+               s64: __div_64(dividend, divisor),       \
+               u64: __div_64(dividend, divisor),       \
                default: dividend / divisor);   \
 })

-- 
Thanks,
~Nick Desaulniers
