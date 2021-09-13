Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D2E3FC3
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 19:53:31 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id i7so7313538lfr.13
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 12:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IuIV1pMgtSTFHYB/MlE6n0ObQf+QrwwyHfpeOlhLGV4=;
        b=KtLYMNSMN0Y5c8c4r4J0ZLqCJXsRLL29VR5uX/2Yu4BVj5zwY2hNGlKuYA+6nTpKM1
         ivocdJ+TW1l885Sq1gNrjIVMJ8HXJuAGqEkh92ycGBDRf1c2rfkZRpvYFsy3oAxFDGUW
         qaxOOWivMUORLVhuNZz2TQd6lccTVM0cm2bUF0QCL00suayRvj14i4d67X8frC65ox1j
         m4MFscHPBjjXUEqDTQ356k+5sssUHbTvpg7sBwdXEvNlH8GkYqhFp8bud6Yi44KxE8hi
         48knGdoWzMrFo1fqqE/HDdhaxB9RXcCee9xpP7vflu05cgMvZkTEo0YYwmoB7vRUkjGt
         G8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IuIV1pMgtSTFHYB/MlE6n0ObQf+QrwwyHfpeOlhLGV4=;
        b=rAPgUQb3y7dG89dgWHFiyMLfwbRK5Ab/J8fBXe00CbNwInEgsAKDDOdTSxhZvkZBZa
         ELkmeG32YT1rcA+4jqqpsuxcaWX0ju3VB1+sR7HPFK7tAnlLOzKdmdC9w3DQoKaelI7A
         uc8TcCcYMganqJ2QV99jVdgfxY1P8/2SkCp8laNtn9ouMY8DdnSITMsipbJx8pxZfs21
         Whsuan8b2/ZNCq7y1B+WPVK/V5VfNOB0iAxWTm/CVro9jbSky43zJO23jE1Nn/LqCBxZ
         2YmTAoRoAL0wEiRwR1K49AMHTCCdAnHNzh5HEJbnVhriuVYfJnJMIpEq/mYteljlpZTR
         0EkQ==
X-Gm-Message-State: AOAM533Ba39l1FWRICxaZijmyJS26YS8HKRbqUs0D50vePPhQCtD3kcC
	q5ZkNmM5dgwCiOFlGSX4TIyLrz8reIYRcoXWM+Yh5A==
X-Google-Smtp-Source: ABdhPJxUVIrSRPA+S6grlctRP94ZAZIBKy5defr5w6yBJRo3gzNh1hyZtfPLM5hyf7YELNj1ADse+/Ttsx8GxAJU0Tc=
X-Received: by 2002:ac2:4c46:: with SMTP id o6mr10039958lfk.240.1631562809064;
 Mon, 13 Sep 2021 12:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210913131113.390368911@linuxfoundation.org> <20210913131114.028340332@linuxfoundation.org>
 <CA+G9fYtdPnwf+fi4Oyxng65pWjW9ujZ7dd2Z-EEEHyJimNHN6g@mail.gmail.com>
 <YT+RKemKfg6GFq0S@kroah.com> <CAKwvOdmOAKTkgFK4Oke1SFGR_NxNqXe-buj1uyDgwZ4JdnP2Vg@mail.gmail.com>
In-Reply-To: <CAKwvOdmOAKTkgFK4Oke1SFGR_NxNqXe-buj1uyDgwZ4JdnP2Vg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 13 Sep 2021 12:53:17 -0700
Message-ID: <CAKwvOdmCS5Q7AzUL5nziYVU7RrtRjoE9JjOXfVBWagO1Bzbsew@mail.gmail.com>
Subject: Re: [PATCH 5.14 018/334] nbd: add the check to prevent overflow in __nbd_ioctl()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, Nathan Chancellor <natechancellor@gmail.com>, 
	Baokun Li <libaokun1@huawei.com>, open list <linux-kernel@vger.kernel.org>, 
	linux-stable <stable@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>, 
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, lkft-triage@lists.linaro.org, 
	llvm@lists.linux.dev, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 11:39 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Sep 13, 2021 at 10:58 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Sep 13, 2021 at 09:52:33PM +0530, Naresh Kamboju wrote:
> > > [PATCH 00/10] raise minimum GCC version to 5.1
> > > https://lore.kernel.org/lkml/20210910234047.1019925-1-ndesaulniers@google.com/
> >
> > Has anyone submitted a fix for this upstream yet?  I can't seem to find
> > one :(
>
> That lore link has a series to address this, though that's maybe
> something we don't want to backport to stable.
>
> I thought about this all weekend; I think I might be able to work
> around the one concern I had with my other approach, using
> __builtin_choose_expr().
>
> There's an issue with my alternative approach
> (https://gist.github.com/nickdesaulniers/2479818f4983bbf2d688cebbab435863)
> with declaring the local variable z in div_64() since either operand
> could be 64b, which result in an unwanted truncation if the dividend
> is 32b (or less, and divisor is 64b). I think (what I realized this
> weekend) is that we might be able to replace the `if` with
> `__builtin_choose_expr`, then have that whole expression be the final
> statement and thus the "return value" of the statement expression.

Christ...that...works? Though, did Linus just merge my patches for gcc 5.1?

Anyways, I'll send something like this for stable:
---

diff --git a/include/linux/math64.h b/include/linux/math64.h
index 2928f03d6d46..e9ab8c25f8d3 100644
--- a/include/linux/math64.h
+++ b/include/linux/math64.h
@@ -11,6 +11,9 @@

 #define div64_long(x, y) div64_s64((x), (y))
 #define div64_ul(x, y)   div64_u64((x), (y))
+#ifndef is_signed_type
+#define is_signed_type(type)       (((type)(-1)) < (type)1)
+#endif

 /**
  * div_u64_rem - unsigned 64bit divide with 32bit divisor with remainder
@@ -112,6 +115,15 @@ extern s64 div64_s64(s64 dividend, s64 divisor);

 #endif /* BITS_PER_LONG */

+#define div64_x64(dividend, divisor) ({                        \
+       BUILD_BUG_ON_MSG(sizeof(dividend) < sizeof(u64),\
+                        "prefer div_x64");             \
+       __builtin_choose_expr(                          \
+               is_signed_type(typeof(dividend)),       \
+               div64_s64(dividend, divisor),           \
+               div64_u64(dividend, divisor));          \
+})
+
 /**
  * div_u64 - unsigned 64bit divide with 32bit divisor
  * @dividend: unsigned 64bit dividend
@@ -142,6 +154,28 @@ static inline s64 div_s64(s64 dividend, s32 divisor)
 }
 #endif

+#define div_x64(dividend, divisor) ({                  \
+       BUILD_BUG_ON_MSG(sizeof(dividend) > sizeof(u32),\
+                        "prefer div64_x64");           \
+       __builtin_choose_expr(                          \
+               is_signed_type(typeof(dividend)),       \
+               div_s64(dividend, divisor),             \
+               div_u64(dividend, divisor));            \
+})
+
+// TODO: what if divisor is 128b?
+#define div_64(dividend, divisor) ({
         \
+       __builtin_choose_expr(
         \
+               __builtin_types_compatible_p(typeof(dividend), s64) ||
         \
+               __builtin_types_compatible_p(typeof(dividend), u64),
         \
+               __builtin_choose_expr(
         \
+                       __builtin_types_compatible_p(typeof(divisor),
s64) ||   \
+                       __builtin_types_compatible_p(typeof(divisor),
u64),     \
+                       div64_x64(dividend, divisor),
         \
+                       div_x64(dividend, divisor)),
         \
+               dividend / divisor);
         \
+})
+
 u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder);

 #ifndef mul_u32_u32
---
-- 
Thanks,
~Nick Desaulniers
