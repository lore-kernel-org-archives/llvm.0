Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45CF2CA0
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 19:15:08 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id v67so14120415oie.9
        for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 11:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7jg3x9AtL/f6z9LGi2iYoNteBrHSWn1nyhxat7ZXxLM=;
        b=H85h2T7hcgJ2PVmA5frj0F4m8+z7kNMHjwITaB/vigmhWxha7poMjo9y+uuVPbOqvP
         pYg3DgnEkdAMSVgFnKWl2x/bSWXSYvlEnM/PEy6m2B9e0YpDQMX0i1M7M2npQvw13M0+
         YxdgD7A621HLrQEYVB+Nph4jfPiQzxD7CmB3Jfv5q+v1xtLmk+g1LpJId3gYGm0izucq
         biMCOz2/RlknQ/QFb38dvuAhVPY8aK/qpmg+JGzV3wAHKDf5LZxfFQOW1iGVHZ51KAmC
         hwDSp2Lz8zfQ53VwsOzXFSRfGpR88fxRR9BEul/+84zn0Elc+Lx8csnk3dQDSj2Xl22a
         E90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7jg3x9AtL/f6z9LGi2iYoNteBrHSWn1nyhxat7ZXxLM=;
        b=E4tqNCmMlEC4XFFrFkAJmeJ0bDtC5zLC7VvJrQtJo5+rFVdqmYe5KTm+oAFpVIyLdg
         q3JUM11AREhBrwAd8MghH4RgpmRPjEY7IS32wUlrIW6X1y4ovIGnHFYvg0I/qb+jIWkx
         wINLbs3Q1FlTxNL5+qMsznex4Q9jEysqnsMXOWFZEHx+ED+N8S+McVesg/Lpo0LrZpPn
         QgqSuktpPFWWCC8OA9JV3xxTg1XrRu+A5GiCgZc2dGieFmYrxWdxskQWxeIWQyD820DS
         1SKQ/3qYkRUaLg8khOphhp4jorhuFCExSoxAFuYQ073EX9Pu+VQ2NqCKa2vF/EjiSUoe
         AcoQ==
X-Gm-Message-State: AOAM532hx5R/bKqUQY9AQuVWuFXIeUdyoTfYWBfAOqgR2EQGx52w1kDu
	lPuHxCPknnMsOin41u8S/FU6XN6h12bINIDFS4vPiA==
X-Google-Smtp-Source: ABdhPJziHaXrYHt+PYKYiMAEu501P49cMI9eqaDGMeh+Kt5aygRqLCedT1zNRdwqNB7W+x0cRAPLUqnBVrGh4Zl7yE0=
X-Received: by 2002:aca:2b16:: with SMTP id i22mr9743887oik.128.1643397307599;
 Fri, 28 Jan 2022 11:15:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220128114446.740575-1-elver@google.com> <20220128114446.740575-2-elver@google.com>
 <YfQ8IwCSzbtAhC3B@dev-arch.archlinux-ax161>
In-Reply-To: <YfQ8IwCSzbtAhC3B@dev-arch.archlinux-ax161>
From: Marco Elver <elver@google.com>
Date: Fri, 28 Jan 2022 20:14:55 +0100
Message-ID: <CANpmjNOVWx_Vpy6kuSzR9E0m=xJqbsF6ypCyfdzGZsGzgUfccQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] stack: Constrain stack offset randomization with
 Clang builds
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Elena Reshetova <elena.reshetova@intel.com>, 
	Alexander Potapenko <glider@google.com>, llvm@lists.linux.dev, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Jan 2022 at 19:55, Nathan Chancellor <nathan@kernel.org> wrote:
[...]
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> One comment below.

Thanks!

Though with Kees's requested changes I'll probably let you re-review it.

> > ---
> >  arch/Kconfig                     |  1 +
> >  include/linux/randomize_kstack.h | 14 ++++++++++++--
> >  2 files changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index 2cde48d9b77c..c5b50bfe31c1 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -1163,6 +1163,7 @@ config RANDOMIZE_KSTACK_OFFSET
> >       bool "Support for randomizing kernel stack offset on syscall entry" if EXPERT
> >       default y
> >       depends on HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
> > +     depends on INIT_STACK_NONE || !CC_IS_CLANG || CLANG_VERSION >= 140000
> >       help
> >         The kernel stack offset can be randomized (after pt_regs) by
> >         roughly 5 bits of entropy, frustrating memory corruption
> > diff --git a/include/linux/randomize_kstack.h b/include/linux/randomize_kstack.h
> > index 91f1b990a3c3..5c711d73ed10 100644
> > --- a/include/linux/randomize_kstack.h
> > +++ b/include/linux/randomize_kstack.h
> > @@ -17,8 +17,18 @@ DECLARE_PER_CPU(u32, kstack_offset);
> >   * alignment. Also, since this use is being explicitly masked to a max of
> >   * 10 bits, stack-clash style attacks are unlikely. For more details see
> >   * "VLAs" in Documentation/process/deprecated.rst
> > + *
> > + * The normal alloca() can be initialized with INIT_STACK_ALL. Initializing the
> > + * unused area on each syscall entry is expensive, and generating an implicit
> > + * call to memset() may also be problematic (such as in noinstr functions).
> > + * Therefore, if the compiler provides it, use the "uninitialized" variant.
> >   */
> > -void *__builtin_alloca(size_t size);
>
> Is it okay to remove the declaration? Why was it even added in the first
> place (Kees)?

Declaring __builtins is redundant for as long as I remember.
