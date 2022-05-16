Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C35010E0
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 16:05:21 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-2f863469afbso159317137b3.0
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 09:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pH8gn2feqHbJT1VIR+CqAKz2Vm1OI4IAH3XiEx/1r0M=;
        b=hxtlRvOYZfHTAJg87WazheoK+1Jp+3wCYPv/qQPT0w3Xc4g1MVT1EAxaMJwHK/p+C5
         n195YFtxr4dxqu/Ys7B5KxlCbsy5yIzGJs9tu7jy7SNu1kZ2JX9oLdZBYQUPptmKqazj
         KBMYT+1WYxUqZpoWveDxLGR/M5mOnI6k4zzkfRDzYsS9KUKHLC0FQoQAKI53lhQb6EYD
         VcFQ2h3buNKerCfHxbL/MfYeLCG/XK25UGojTz62VrxqXP9lPEUYxJksD81vTAtuacJC
         OBrXFPw3moxQx+QrTme3d7VCEv4n4HJA5S3h3SDkHHYHLdwCbsqQdCPnYLdqZ9KUhBvu
         +hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pH8gn2feqHbJT1VIR+CqAKz2Vm1OI4IAH3XiEx/1r0M=;
        b=OWSPNhoiolXij//4gLJGnXwRuuE9Z8dhE28gd8exdRIok/hAhWMb9TqAUJNBthJ2FG
         k6GkxNks+43Q6f3PpAeFEuI5gsgLfgUVvJ5Kf8TsooEX18emg46ZotO0os6CciO1AecG
         nMnz0Y8VFnGKOyHajP01B3q3zpC7G3K5Pm3fyeSKHDWyac1R9xzPtI+y6UNJANqaKdqB
         YgK6LEkSvCOVc+XOyMg6ZzQhPSQGM8AjhywOvJmhJW49rj3fL6zO7UD0gLK/JOVCdPZ5
         YMYeHiNGO7S2liEeGde+FMBX3LPAlEhICmAzUqKAvSqFkR5Ue3OtKW/0BCNl9+WgMJlq
         JNaw==
X-Gm-Message-State: AOAM532D5FSPOmxdJlkWD+wgEBIU9QQcGVm7A7T96Iu4SbOzYGEudars
	42SIcBdxh4YqWlwJZD2ybm6E76cZ31m+HNhh1qX0vQ==
X-Google-Smtp-Source: ABdhPJxkNuFXhIjn2K2LehjJwRBe1s4mUIoU6C5Borv7+HLjg5MoQxKsHWIgoJh9hK6EYijZjjwv/zmdLvdC5pna+W0=
X-Received: by 2002:a81:4ecf:0:b0:2fe:d9f2:15b3 with SMTP id
 c198-20020a814ecf000000b002fed9f215b3mr10858246ywb.305.1652717120280; Mon, 16
 May 2022 09:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-8-samitolvanen@google.com> <202205141447.E3B5A29@keescook>
In-Reply-To: <202205141447.E3B5A29@keescook>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 16 May 2022 09:04:44 -0700
Message-ID: <CABCJKudrY2b4ZXUaXOmKEB-LG192u2PSfsT-=Vc1bcg3QwY6aw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 07/21] cfi: Add type helper macros
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, May 14, 2022 at 2:49 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, May 13, 2022 at 01:21:45PM -0700, Sami Tolvanen wrote:
> > With CONFIG_CFI_CLANG, assembly functions called indirectly
> > from C code must be annotated with type identifiers to pass CFI
> > checking. The compiler emits a __kcfi_typeid_<function> symbol for
> > each address-taken function declaration in C, which contains the
> > expected type identifier. Add typed versions of SYM_FUNC_START and
> > SYM_FUNC_START_ALIAS, which emit the type identifier before the
> > function.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
>
> And the reason to not make this change universally (i.e. directly in
> SYM_FUNC_START) is to minimize how many of these symbol annotations get
> emitted? (And to more directly indicate which asm is called indirectly?)

The reason not to add this to SYM_FUNC_START is that the compiler
doesn't emit the type symbols for all functions. It currently emits
them for all address-taken function declarations in each translation
unit. We could potentially further limit this by emitting them only
for function declarations with a specific attribute, for example, but
that's something we can optimize later.

> What happens if an asm function is called indirectly and it doesn't have
> this annotation?

It will fail the CFI check.

> (Is this case detectable at compile-time?)

It's not. I'll update the commit message in the next version to
clarify these points.

Sami
