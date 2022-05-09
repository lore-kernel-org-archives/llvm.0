Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70C83D92
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 23:26:36 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id h29so26445608lfj.2
        for <llvm@lists.linux.dev>; Mon, 09 May 2022 16:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tmpHn2BifttucGqVA2pQs88xKMtymtLvsGI+R2fbwOs=;
        b=cOKhyOqtfZHFU1rIBufqPH++gfALfVaWS9hxxxqHxcJiWSnSp+3UesqltlLsWmilqJ
         LlkskAOKr4q0eUh9MVTjgmBO8LuItY4gEAlICuo9yVPcX94q0pnPU7UOgPkUpAEp1VE0
         xu03M5t7EV3GgUxEYIBjchesd0kgyDXAldI/citHwCv1vEM7uqe80cimWhI52YLoGNJ4
         ji2mqCPweXbJzrlz5rmEXpaWyqWIjpd5HDOfKuprKgt7GIoAAoGjftXnTD+8Dp5dlZEP
         iHB+w9HkAu/jwIIDm/xQ/H/xMOFESUdcH7+hekIFuPCJBfyw9HW7eQUR4YNnjRpCf/PI
         2QrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tmpHn2BifttucGqVA2pQs88xKMtymtLvsGI+R2fbwOs=;
        b=qA5o0WJUNOyc8HKfEqTbJD2cMcDR6Q4oPIBQji+v5kQj4j5nt65bnf+mCNmnPx3PKQ
         AsvBf9gBoEH8lItrSAgmtDwMfqnI7olkYgLrjhj/TmNaRX3pfjQo9z311WuHJIR6z5NS
         qDjltFQYxr4T0ooPqFVi8dZjdN0+9Mt8twQHHLYW/xExamDHUpRsloloUBRvIcTFolD5
         smgGuJdJu4nlOWPnfCKmXqr92UT211qBTCGGOzDTJltEIKChDgOYP+DrlGCLeWJvnFFI
         nr9rDJ3pIEFhmcfT2VCM4DkPCJc5t7/b5pIrYG9/T1BbNCmzVhireYVx2Mt6ijlaKDO5
         uGuQ==
X-Gm-Message-State: AOAM530HQan4dDjN1j825zZv+oi+H4vY4rGxo7+lo7ZUF1NGNHnSA63n
	53nGVWxKYhHUqfYPbjHPKZ5+0KsBfu1wzrtdBxX3Wg==
X-Google-Smtp-Source: ABdhPJymMNS66JLXGGCR+OLOK0DR4DpjHCz8PaaZEoPhRhnszwx+FlHC/8/jhTqfJxnqXWGdYF1kceupZleASshkevA=
X-Received: by 2002:a05:6512:48f:b0:472:3c47:94a0 with SMTP id
 v15-20020a056512048f00b004723c4794a0mr14343921lfq.579.1652138794681; Mon, 09
 May 2022 16:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220306171009.1973074-1-mailhol.vincent@wanadoo.fr>
 <20220508100907.61231-1-mailhol.vincent@wanadoo.fr> <CAK8P3a3Fw2T0WSkxv4DiTG2wGkKcs24StPx-BG_vi=ffa9OLVA@mail.gmail.com>
 <CAMZ6RqK9d0hFwYebaArKjod4LJVGQgfDygpbGdBu-4BCDUR_SA@mail.gmail.com>
 <YnhXgzhghfi17vMX@dev-arch.thelio-3990X> <CAMZ6RqL7543LFU7ywbr-FV9A3n+m7zNy-J00j=ZrNMkDonq2aw@mail.gmail.com>
 <CAKwvOdniSVMOwkBke2EcgONn_Vmv88M+B2FTYL_BKtWawCSLAw@mail.gmail.com> <CAMZ6Rq+q44vAeqa7HN8mfoNXzv9GndnQDm1e4_kyMXf_+oADdQ@mail.gmail.com>
In-Reply-To: <CAMZ6Rq+q44vAeqa7HN8mfoNXzv9GndnQDm1e4_kyMXf_+oADdQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 May 2022 16:26:22 -0700
Message-ID: <CAKwvOdnf5f_eNz0FTiYfUf=TtEqWTZTFNN7UpmH3qCcKQGkkHg@mail.gmail.com>
Subject: Re: [RESEND PATCH v1] x86/build: add -fno-builtin flag to prevent shadowing
To: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Tom Rix <trix@redhat.com>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 9, 2022 at 4:12 PM Vincent MAILHOL
<mailhol.vincent@wanadoo.fr> wrote:
>
> Hi Nick,
>
> On Tue. 10 May 2022 at 04:50, Nick Desaulniers <ndesaulniers@google.com> wrote:
> > On Mon, May 9, 2022 at 8:01 AM Vincent MAILHOL
> > <mailhol.vincent@wanadoo.fr> wrote:
> > >
> > > Instead, I am thinking of just using -fno-builtin-ffs to remove
> > > the annoying -Wshadow warning. Would that make more sense?
> >
> > Perhaps a pragma would be the best tool to silence this instance of
> > -Wshadow?  I understand what GCC is trying to express, but the kernel
> > does straddle a weird place between -ffreestanding and a "hosted" env.
>
> I was a bit reluctant to propose the use of pragma because I received
> negative feedback in another patch for using the __diag_ignore()
> c.f.:
> https://lore.kernel.org/all/YmhZSZWg9YZZLRHA@yury-laptop/
>
> But the context here is a bit different, I guess. If I receive your support, I
> am fully OK to silence this with some #pragma.
>
> The patch would look as below (I just need to test with clang
> before submitting).

Do you have a sense for how many other functions trigger -Wshadow? For
example, one question I have is:
Why does ffs() trigger this, but not any of the functions defined in
lib/string.c (or declared in include/linux/string.h) which surely also
shadow existing builtins?  I can't see your example being sprinkled
all over include/linux/string.h as being ok.

If it's more than just ffs(), perhaps the GCC developers can split the
shadowing of builtins into a sub flag under -Wshadow that can then be
disabled; we do want to shadow these functions, but -Wno-shadow would
miss warnings on variables being shadowed due to scope.

We've done this in the past with various flags in clang. Rather than
having semantic analysis trigger the same warning flag for different
concerns, we split the flag into distinct concerns, and reuse the
original flag as a group that enables the new flags. This gives
developers fine grain control over enabling/disabling distinct
concerns.

>
> diff --git a/arch/x86/include/asm/bitops.h b/arch/x86/include/asm/bitops.h
> index a288ecd230ab..e44911253bdf 100644
> --- a/arch/x86/include/asm/bitops.h
> +++ b/arch/x86/include/asm/bitops.h
> @@ -269,6 +269,9 @@ static __always_inline unsigned long
> __fls(unsigned long word)
>  #undef ADDR
>
>  #ifdef __KERNEL__
> +__diag_push();
> +__diag_ignore_all("-Wshadow",
> +                  "-fno-builtin-foo would remove optimization, just
> silence it instead");
>  /**
>   * ffs - find first set bit in word
>   * @x: the word to search
> @@ -309,6 +312,7 @@ static __always_inline int ffs(int x)
>  #endif
>         return r + 1;
>  }
> +__diag_pop(); /* ignore -Wshadow */
>
>  /**
>   * fls - find last set bit in word



-- 
Thanks,
~Nick Desaulniers
