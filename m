Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD29A134D4
	for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 20:13:41 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-64f383be0d4so22268416d6.3
        for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 13:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693253620; x=1693858420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPlx3ixDZIyJnbVh1BXs5jAUX+MLuQTLGqaMbx/eBOE=;
        b=I6BL5BJo8rpiMQo7XBz8CqFcWk0omwpKUrB5OqgGz8+kIPPaPJzF6nouz33xUZoaUP
         Jz0N4fYzCRVFhsnSeLBxlWou72tQOyfL5RnUQJSxeIYQge3y6lzb/sJwoDJVw3exIw1t
         vKBCFB06m7HN81GljhVq+tZyQvzevKDSt5vgfLXdYbq3ZGkG11VS5JJ+IfZHLyZ1YpyZ
         pj2Y0xgGwTE6k64rbwOy0Ve5zrN/8IqRsyVXvHys5aWavfctD3dZVWM4WZQhOA9u0iKl
         AFjF7pHA/oElKR6c0q3Sk7keEoj6T7II/HwmydSgWXvNf5cCeNjwGdss1AcoiKcpxfBT
         xHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693253620; x=1693858420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPlx3ixDZIyJnbVh1BXs5jAUX+MLuQTLGqaMbx/eBOE=;
        b=cZAa8ue9EaTjRNyWf70s3W5qE/EeIqrKSri/dP5NsOy3VlkZFtB3phps5pJdRPd6mp
         cVBDO+B3tudz4cHSfwcGd9PzALOFIHRU9z0DxRnQZtU2LvPQZihKWb8uPrabakT8doVd
         DzMY59wrvfSWn16o457+xFztGZSabTbTj2RpcXVLmu4ImhNfSaC1Mhz6eqq4/Blr3VWF
         cPCLD6eoJp2hgOfTxkHc/eXpL8+8ilv7dcEbgVckCVvW1BYn0QMC6GW8FXZXOqgnCN4G
         01CuC/cCjS2KB8x+HAyJUJWy6rIDA5La2p56BZkluomlz0CpSi3sGmNHPUfXn1RvQaEt
         PUNQ==
X-Gm-Message-State: AOJu0Ywy7KREhj4JgLseFCqT6Fo23UBkjeuSuEufsYOBDr+PGqisylCP
	QCNWtY1FLH4QA1nnqa+IvHMqaWFhXOxr2tXBL0CYOA==
X-Google-Smtp-Source: AGHT+IH+a4xXxSWRIXzFZiXI1vjuHKVktsasFxFyvyPHbSnDpJ806vs4iN2e/8Qo00cv0Qn5LOK6cRLB5Ri8cboGlyw=
X-Received: by 2002:a0c:e413:0:b0:64b:997f:5a7e with SMTP id
 o19-20020a0ce413000000b0064b997f5a7emr30979975qvl.8.1693253620349; Mon, 28
 Aug 2023 13:13:40 -0700 (PDT)
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
 <CAKwvOdm_y6UOnxFrAiDxou2jc8CRUvyhfH9kAdc3PG0=bEvduw@mail.gmail.com>
 <CAHk-=wgJzMzPFTCzejWs1WM4=74z2VENyOzySnucrXG3i=ajrw@mail.gmail.com>
 <CAMuHMdXZ4fGjjXguftvrB69rt7dR6ngFA46YB8oGpk2_issJzA@mail.gmail.com> <CAHk-=wgefVmehW7oFrXLYYogqfoBQaku8Qm4o3+95Xwv=he+iQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgefVmehW7oFrXLYYogqfoBQaku8Qm4o3+95Xwv=he+iQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 28 Aug 2023 13:13:29 -0700
Message-ID: <CAKwvOdmmMHRtLG5447KhLMTFD=1AjZeu1m3ZKdy=jHHkG16qUw@mail.gmail.com>
Subject: Re: [PATCH] lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-bit kernels
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Bill Wendling <morbo@google.com>, Helge Deller <deller@gmx.de>, 
	Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Chanho Min <chanho.min@lge.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <keescook@chromium.org>, clang-built-linux <llvm@lists.linux.dev>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 9:25=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, 28 Aug 2023 at 00:33, Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
> >
> > Several architectures (incl. x86, but excl. amd64) do build the kernel =
with
> > -freestanding.
> >
> > IIRC, the issue was that without that, gcc was "optimizing" calls
> > to standard functions (implemented as inline optimized assembler
> > functions) by replacing them with calls to other standard functions
> > (also implemented as inline optimized assembler functions).
>
> So using -ffreestanding is definitely the right thing to do for a
> kernel in theory. It's very much supposed to tell the compiler to not

-ffreestanding is probably a good suggestion for any embedded
platform.  But given the size of the kernel, and similarities of
symbols and their semantics expected by the compiler and provided by
the kernel, I think -ffreestanding should not be set at this point for
the Linux kernel.

> assume a standard libc, and without that gcc will do various
> transformations that make sense when you "know" what libc does, but
> may not make sense in the limited library model of a kernel.
>
> So without it, gcc will do things like converting a 'printf()' call
> without any conversion characters to a much cheaper 'puts()' etc. Now,
> we often avoid that issue entirely by having our own function names
> (ie printk()), but we do tend to use the *really* core C library
> names.
>
> Anyway, it turns out that some of the things you miss out on with
> -ffreestanding are kind of important. In particular, at least gcc will
> stop some 'memcpy()' optimizations too, which ends up being pretty
> horrendous.
>
> So while -ffreestanding would be the right thing to do in theory, in
> practice it's actually pretty horrible. It's a big hammer that affects
> a lot of things, and while many of them make sense for a kernel, some
> of them are really bad. Which is why x86-64 no longer uses it.

I agree.

>
> I would actually suggest other architectures take a look if they care
> at all about code generation. In particular, look at the x86-64
> version of 'string.h' in
>
>   arch/x86/include/asm/string_64.h
>
> and note the difference with the 32-bit one. The 32-bit one is the
> "this is how we used to do it" that nobody cared enough to change. The
> 64-bit one is much simpler and actually generates better code simply
> because gcc recognizes memcpy() and friends, and will then inline it
> when small etc.
>
> The *downside* is that now you have to trust the compiler to do the
> right thing. And that will depend on compiler version etc. There's a
> reason why 32-bit x86 does everything by hand: when your compiler
> history starts at gcc-1.40, things are simply *very* different from
> when you now rely on gcc-5.1 and newer...
>
> Put another way: gcc has changed, and what used to make sense probably
> doesn't make sense any more.

Yep, I think it's time to review the use of -ffreestanding in the linux ker=
nel.
--=20
Thanks,
~Nick Desaulniers
