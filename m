Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D861F7E
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 19:47:03 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id w19so33764958lfu.11
        for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 12:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yu7FAxuUHL5OGfbOLZmlJq7WriCq5/6A3eHY+LKJ9Q4=;
        b=P4ASvHpLX+6wGTeMFgYCY4PFA1ZamXYe3Ld7190C96bfVuHKMMVLCoHRI4TufEKgbo
         84dvnmJaBU7/NtY2cqObDFXKhuYUMZh44u1jjY0BgGg6ngyxFG6+bSMku6+8jLWT7U+w
         uU4w7OzalEKia2NNAiyRdz4tsSDgUrb9xBWBMmDlo1/3HKmQw8jmy8Kx6MgPZc1CBHzu
         JVtYWrLwIJlxmiyxg6iv/NEpvC2b+/JsKN63h+rN3rIOMzUElgXLyY478p8ryymEeR48
         +N44oAf3tRYucMtMXOUJxm6O2nKEf5kFu8NnsnafpPbLuMqDjXIO+KJnaZZpSXVEoTMk
         /rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yu7FAxuUHL5OGfbOLZmlJq7WriCq5/6A3eHY+LKJ9Q4=;
        b=oeDIEKTUoGDp/JiYDVOPaUz2FHzD9DIOMBf81GN5cEMNhClxL8zvyDd9Vi3I5IexOT
         BR26tRLMooxqT85ZSM7RCoFpUEforOZvQdq95830iaXJEJC+9xxmq/0gtVldd58beJkA
         NpRV0c4zEE7H03tIFo/rS/0eslThyuCC8/VHOGhGuFNk/yMy/qtqeeJ1CH1i6ByL4O2m
         EkTsDRJzY1YO1Kj8f3mpZ5QPydO+qCdgEu8b+1UyDHZjFaSHGtHouw2m3bqgk5M50ASg
         vA6cJbYKEniD8vlmanXJV4tJl5CQ69oxb97B51SQYRrr9452D5SaSVhtMd3sj/RVjZ6p
         fK1A==
X-Gm-Message-State: AOAM5323GucvWH30tYopSGYQ5JYCQ6juJJbbyjCs0F6pvaRhddYYkn+6
	vELtC2ASpzv+sLFcDN7m00KjwnPxKj7I0EhZXNzdwkVv8P/FMg==
X-Google-Smtp-Source: ABdhPJx3yY02dFqXWoZwxtNqxt8TDPvQ/b0nc46ilsOuF27gvQkoxWFi/ZHfOcnMXsQHddfx9lnLVWRcnNHoi3Ilh3U=
X-Received: by 2002:a05:6512:3052:b0:472:7f8:f344 with SMTP id
 b18-20020a056512305200b0047207f8f344mr8190729lfb.380.1651002421695; Tue, 26
 Apr 2022 12:47:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEQFVGb2aXVu7eys5PM=xZ7gtzdap_QyRrzi3WzY83ka=heOwQ@mail.gmail.com>
 <CAK8P3a0Lwtm86wYH+0yFtr=Luc6g3OLu_+vzZaJqxDxNHFmQDQ@mail.gmail.com>
 <CAKwvOdmfHS8UwZhEL-tLMJSzCXQEZZZhEMpDXuJHtP5s9yePBw@mail.gmail.com>
 <CAEQFVGYpPaE3cCxUBaiT97GU1i4Nr6yJdv6mU1kiCxqkLSMfBQ@mail.gmail.com>
 <CAK8P3a2vHuRB1vkjVkKaNxr3Ptfv3UBS0scsShQPxY46_xh9kA@mail.gmail.com>
 <Ymg43Ed/Sg8szdKq@dev-arch.thelio-3990X> <CAKwvOdkvg+jKVqetfrNPn5yNCxfZYHAhu2Cvc+dGLFG3+kOGUg@mail.gmail.com>
 <CAKwvOd=gdtxWgJTMYMT5NpFwGH8vwH8NbL3HursoAXvQJ7yydA@mail.gmail.com>
In-Reply-To: <CAKwvOd=gdtxWgJTMYMT5NpFwGH8vwH8NbL3HursoAXvQJ7yydA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 26 Apr 2022 12:46:49 -0700
Message-ID: <CAKwvOdn1Li3+_b7M8pdJ+-J=PZ_B6PVZ2o3QSbYXtvJ=B6eOXw@mail.gmail.com>
Subject: Re: Android 11 clang toochain: kernel 5.18 build error with 32 bit target
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Mauro Rossi <issor.oruam@gmail.com>, 
	Chih-Wei Huang <cwhuang@android-x86.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Mark Brown <broonie@kernel.org>, Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 26, 2022 at 12:31 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Apr 26, 2022 at 12:23 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Tue, Apr 26, 2022 at 11:24 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > On Tue, Apr 26, 2022 at 02:21:16PM +0200, Arnd Bergmann wrote:
> > > > On Mon, Apr 25, 2022 at 9:13 PM Mauro Rossi <issor.oruam@gmail.com> wrote:
> > > > > I have checked also with kernel-5.17 and the same build error is
> > > > > happening also there, so it is not due to commit 34737e2698 ("uaccess: add generic
> > > > > __{get,put}_kernel_nofault")
> > > >
> > > > Ok, that's good to know, thanks for checking! I suspect the problem is
> > > > using a slightly too-old prerelease build of clang, where the released
> > > > clang-11 build had the asm-goto-with-output feature enabled.
> > >
> > > Correct, the build failure can be reproduced with tip of tree LLVM if
> > > CONFIG_CC_HAS_ASM_GOTO_OUTPUT is manually disabled, such as:
> >
> > That begs the question though; not all supported versions of GCC have
> > asm goto w/ outputs. Why is this not an issue for older gcc versions?
> > Perhaps it's because clang is validating inline asm constraints in
> > dead code again? I thought I had fixed that in
> > commit 158807de5822 ("x86/uaccess: Make __get_user_size() Clang
> > compliant on 32-bit")
> > in v5.9-rc1.
> >
> > I don't know why `=a` can't be used, yet.
> > void foo(void *a) {
> >     asm("":"=a"(*((unsigned long*)a)));
> > }
> > Compiles w/ -m32 just fine.  Perhaps creduce is needed.
>
> Cvise converged on:
> void copy_from_kernel_nofault(void) {
>   asm("" : "=a"(*(long long *)0));
> }
> which is weird. Neither compiler accepts 0 for -m32, but they do for
> -m64. Ah, it's the cast to long long*.
>
> Let me see if this is fixable in the kernel sources.

I should clean this up, but the approach seems to work, yeah?

diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index f78e2b3501a1..8d4978abff41 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -346,6 +346,8 @@ do {
                                \
 #define __get_user_size(x, ptr, size, retval)                          \
 do {                                                                   \
        unsigned char x_u8__;                                           \
+       unsigned short x_u16__; \
+       unsigned int x_u32__; \
                                                                        \
        retval = 0;                                                     \
        __chk_user_ptr(ptr);                                            \
@@ -355,10 +357,12 @@ do {
                                \
                (x) = x_u8__;                                           \
                break;                                                  \
        case 2:                                                         \
-               __get_user_asm(x, ptr, retval, "w");                    \
+               __get_user_asm(x_u16__, ptr, retval, "w");              \
+               (x) = x_u16__;                                          \
                break;                                                  \
        case 4:                                                         \
-               __get_user_asm(x, ptr, retval, "l");                    \
+               __get_user_asm(x_u32__, ptr, retval, "l");              \
+               (x) = x_u32__; \
                break;                                                  \
        case 8:                                                         \
                __get_user_asm_u64(x, ptr, retval);                     \
-- 
Thanks,
~Nick Desaulniers
