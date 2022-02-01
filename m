Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EDB2F24
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 20:17:06 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id e9so25790834ljq.1
        for <llvm@lists.linux.dev>; Tue, 01 Feb 2022 12:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f3bcsAklugUA8X5S8eqHouC9oaHAaVuRIrrTe+rJW24=;
        b=Kyj6Bc9QCO+JV2e2BYCdvw63ME+XVX7mD1L0xBJ/nJR7GpK9LZTXleDRaKPB68Hxqf
         NF3WNVeqUx6R8F54VtcOKlozz9fWtsQTPFA/AD1Pn0jyl7Lj1dKaXDHiOb1YWkjeoGoJ
         MtGMRnHvg7Z5dGCMlqb/pWt0QVDxwvRARjEk0xuXalkpvBZpFsZDM3SWTGZT17z6jwOS
         lh3I5vIbaqNcWcZoxrH1NQILkUplY21IAs+EM9cLeg2p5s25+9obBeljDVfK+Hws4w3J
         hK5/clJiK6Qu5YhvtVndyA1SEURtS0GIwvwz9ztDT22zdvvM/9IxjtIRXHGgvTG8fflo
         UsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f3bcsAklugUA8X5S8eqHouC9oaHAaVuRIrrTe+rJW24=;
        b=Ym+3T+jXwzzsQG+UnjDx0NYO4VWzXM4OYy2x07V+2fvvigW8EH2tRpQ1WZUM9lT5WP
         1amPC5PJYJwq2UkXvNogXErW0CRdKoQyJfRwuGsV2XQQHSs8WGLXZXAx2giuEK5EfbqC
         X3DGEuIgYsrrNVQQFFpB2tk/jcrpFGQiHOVp33Kj8awlfUiC+K6D5jwFxRHErD1CGPM4
         Vu7AG7IWgp1pO7aHUtfm+taeRL2m9L/wa0xy6HRurlRx9kd0wGmnXJnHAZag4kaJwTdg
         uP8gFN2Y3cOlMj2RKpU9UiAg/OfeYD6NyzcS038PSAd6YWwvKeBf/SKr2DTB5eo5e256
         3Ixg==
X-Gm-Message-State: AOAM53004KWUvXcMLtEWIuY4m3bjkE4jRGlEI0vFJDWB+xtcEnNpSMYn
	SI41ph6n0f2F4QME5MARpQYykYzAgD1hakr31yv1dQ==
X-Google-Smtp-Source: ABdhPJyjkIdvcR7h9sTh/jFdfLCfqLgmMdmefPijoRUk1ZPBatDBaznmuG2+rrSk2e+yl8Dtm+jGInhyLkuUyY9YRjA=
X-Received: by 2002:a2e:954:: with SMTP id 81mr8682225ljj.198.1643746624322;
 Tue, 01 Feb 2022 12:17:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220201010838.1494405-1-seanjc@google.com> <20220201010838.1494405-2-seanjc@google.com>
In-Reply-To: <20220201010838.1494405-2-seanjc@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Feb 2022 12:16:52 -0800
Message-ID: <CAKwvOd=9nwR7z7wn50SU=mf5AywFLd95ZMH-EbYdHfbeHVvq1A@mail.gmail.com>
Subject: Re: [PATCH 1/5] Kconfig: Add option for asm goto w/ tied outputs to
 workaround clang-13 bug
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, 
	syzbot+6cde2282daa792c49ab8@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 31, 2022 at 5:08 PM Sean Christopherson <seanjc@google.com> wrote:
>
> Add a config option to guard (future) usage of asm_volatile_goto() that
> includes "tied outputs", i.e. "+" constraints that specify both an input
> and output parameter.  clang-13 has a bug[1] that causes compilation of
> such inline asm to fail, and KVM wants to use a "+m" constraint to
> implement a uaccess form of CMPXCHG[2].  E.g. the test code fails with
>
>   <stdin>:1:29: error: invalid operand in inline asm: '.long (${1:l}) - .'
>   int foo(int *x) { asm goto (".long (%l[bar]) - .\n": "+m"(*x) ::: bar); return *x; bar: return 0; }
>                             ^
>   <stdin>:1:29: error: unknown token in expression
>   <inline asm>:1:9: note: instantiated into assembly here
>           .long () - .
>                  ^
>   2 errors generated.
>
> on clang-13, but passes on gcc (with appropriate asm goto support).  The
> bug is fixed in clang-14, but won't be backported to clang-13 as the
> changes are too invasive/risky.

LGTM.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

If you're going to respin the series, consider adding a comment in the
source along the lines of:
```
clang-14 and gcc-11 fixed this.
```
or w/e. This helps us find (via grep) and remove cruft when the
minimum supported compiler versions are updated.

Note: gcc-10 had a bug with the symbolic references to labels when
using tied constraints.
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98096

Both compilers had bugs here, and it may be worth mentioning that in
the commit message.

>
> [1] https://github.com/ClangBuiltLinux/linux/issues/1512
> [2] https://lore.kernel.org/all/YfMruK8%2F1izZ2VHS@google.com
>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  init/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index e9119bf54b1f..a206b21703be 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -77,6 +77,10 @@ config CC_HAS_ASM_GOTO_OUTPUT
>         depends on CC_HAS_ASM_GOTO
>         def_bool $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
>
> +config CC_HAS_ASM_GOTO_TIED_OUTPUT
> +       depends on CC_HAS_ASM_GOTO_OUTPUT
> +       def_bool $(success,echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .\n": "+m"(*x) ::: bar); return *x; bar: return 0; }' | $CC -x c - -c -o /dev/null)
> +
>  config TOOLS_SUPPORT_RELR
>         def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "NM=$(NM)" "OBJCOPY=$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
>
> --
> 2.35.0.rc2.247.g8bbb082509-goog
>


-- 
Thanks,
~Nick Desaulniers
