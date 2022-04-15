Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E6A7A
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 20:36:26 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id k5so15549394lfg.9
        for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 13:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iML8Mie/Nqg8Eomsb3XE4GR9y61geIeA+48E13l7q/U=;
        b=c1afuenBbtQ0z/0Q9oKLfXT0N4IwC/1BJsqGRXLcviWYSuXEjYQfAevoaVByrfGiBl
         aNxpDqetB0Q+BfaCtC+SOcv+6fbEq/1JJpcnjHdsLf8sidATEQx0NazYeN+wWm4nHOOV
         U7yCDX/VgZ1hx/Gj3ah5XSB72tZbTv+5BOpDwsfKC8wiz1Wes2vBCGCOsggLONGttZVG
         pARO7UUb6a7SSLEms42sfZtWExpAKS6GD+CabQI2oG1Goz3qcBEBq/I75Yg/QOly+vHo
         RTmhqf2GVyHmasaokpGT4J8X/IVi/z9d/kDaPWsXVikyKShjR0TqaeM1PiEegRUdFf7u
         F29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iML8Mie/Nqg8Eomsb3XE4GR9y61geIeA+48E13l7q/U=;
        b=4GFfevf0e9KfsZ4/Fb404dia4G0B8uRE5GP+u0r3dK57hibyocRRgz+nc8IUFKIu1p
         qizIJTd+6m1INSO8YanhznVptJLShD6vD+hrbvt2RMBhPK+vkRT4qdQXJjW/xKNnp7KK
         Ra8yWJL41EYPvYNlVrOF9G1WOyOkwtMqPV600xI9v4tUdP7YfCb9lFnWjkNaOUxJl4oU
         DgzWOKPhZh7YJP9JFliwQ55ixa2S0K7jODfrPo9siHgWWkNF1eEQxm8b1Cqr63XX+W24
         FzlYBlXJ0tt6YwjmQ/YxhJjms8lLW2BZnCEDr+xDpUdPSFFxgxh6z0ErDfkOiXudbXWI
         rESQ==
X-Gm-Message-State: AOAM532rpP00KQhyOw9x842vuLKafY6HLzsbt6m1FF6rCDwfSlOwDFll
	Bv7AkUhcOhySMvh8p5ezx2r0ltGdcFb7wS9NZZTRZQ==
X-Google-Smtp-Source: ABdhPJwVnP16uLBu7hJE8jMuOoPikF48adhxwO2GSmNoGfZgOckqnrHfTd3QR8eLanL4p3kBVNj+OtT+i1oYTmuRN5c=
X-Received: by 2002:ac2:5313:0:b0:46d:ef7:c2db with SMTP id
 c19-20020ac25313000000b0046d0ef7c2dbmr452615lfh.392.1650054984211; Fri, 15
 Apr 2022 13:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YllUqPK4CWZeHku8@hirez.programming.kicks-ass.net>
 <20220415152633.GA2731@worktop.programming.kicks-ass.net> <CAKwvOdn1JVxxithobr=15hkumoQ51CjnPSbrq8hYBRm=A3L5kQ@mail.gmail.com>
 <20220415182130.iltk2uxnubeaa4nk@treble>
In-Reply-To: <20220415182130.iltk2uxnubeaa4nk@treble>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 15 Apr 2022 13:36:12 -0700
Message-ID: <CAKwvOdkn-JMRzYhgEP=sQK9oqL7SJmdo_Dp+-5ZthQv6m1=jcA@mail.gmail.com>
Subject: Re: The trouble with __weak and objtool got worse
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, hjl.tools@gmail.com, 
	mbenes@suse.cz, rostedt@goodmis.org, linux-toolchains@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>, Fangrui Song <maskray@google.com>, 
	Segher Boessenkool <segher@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 15, 2022 at 11:21 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Fri, Apr 15, 2022 at 10:40:22AM -0700, Nick Desaulniers wrote:
> > On Fri, Apr 15, 2022 at 8:26 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Fri, Apr 15, 2022 at 01:19:04PM +0200, Peter Zijlstra wrote:
> > > > Alternatively:
> > > >
> > > >   https://sourceware.org/pipermail/binutils/2020-December/114671.html
> > > >
> > > > seems to suggest: -Wa,--generate-unused-section-symbols=yes, ought to
> > > > work, except I'm getting:
> > > >
> > > > $ gcc -O2 -fcf-protection=none -fno-asynchronous-unwind-tables -Wa,--generate-unused-section-symbols=yes -c foo*.c
> > > > as: unrecognized option '--generate-unused-section-symbols=yes'
> > > > as: unrecognized option '--generate-unused-section-symbols=yes'
> > >
> > > Reading so hard...
> > >
> > >  $ gcc -O2 -fcf-protection=none -fno-asynchronous-unwind-tables -Wa,-generate-unused-section-symbols=yes -c foo*.c
> > >
> > > seems to actually work.
> >
> > $ clang hello.c -Wa,-generate-unused-section-symbols=yes
> > clang-15: error: unsupported argument
> > '-generate-unused-section-symbols=yes' to option '-Wa,'
> >
> > :)
> >
> > I recall LLVM not emitting STT_SECTION symbols being problematic for
> > objtool in the past.
> > Old pre-lore archive:
> > https://groups.google.com/g/clang-built-linux/c/1C6YoJKBsQQ/m/a8IS1NjGAgAJ
> > via https://github.com/ClangBuiltLinux/linux/issues/1209.
> > (It doesn't look too bad for me to implement)

https://reviews.llvm.org/D123874

>
> Right, and that objtool "fix" -- silently falling back to
> non-section-symbol relocations instead of erroring out -- is causing
> this issue, when it's done for weak symbols.
>
> If LLVM assembler doesn't support this option then we may have to go
> with something like this?  I can't seem to recreate so I'm not able to
> test.

FWIW, I found this note that retaining STT_SECTION will have adverse
binary size effects for LTO.
https://reviews.llvm.org/D93783#2470728
Perhaps food for thought here.
--
Thanks,
~Nick Desaulniers
