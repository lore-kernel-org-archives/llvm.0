Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5E12C86
	for <llvm@lists.linux.dev>; Tue,  5 Oct 2021 15:20:15 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id h2so46293891ybi.13
        for <llvm@lists.linux.dev>; Tue, 05 Oct 2021 08:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6U3A2TkKi5u+zlp1bWUocfIN/kiEDVADM7cYHhDKH6Y=;
        b=eJfEToxllcMDKYkRz5XmfBYFWtUufSPRxIkRc0G3EqqeQz+rMrMSKeNNSmZNs9XyOA
         lPxl5yo30pjEhGgxLaN4fOv4Yea59SH9vSmi6ZugnCX0zJzSVHOjY3lD8UkOq+vvNJ41
         cSqKBq0e0CMhutTpR6Xl+IoqBUndWfbEGN/aWJab0ZnD/8tHDGTMpcVp9THPMrZd/RXN
         c31AD1wONPCBJ9sz/QALIlueDa9jhMVq4xt6eg38hhhN47+hO2211RIUtACfmAdmmpfg
         nPuH5B4YvMNj5sKwlnVyhQokK+2ogeE+2zj4R1i9H6P94oSHBcqEjLEiZiKQlBvGK505
         BCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6U3A2TkKi5u+zlp1bWUocfIN/kiEDVADM7cYHhDKH6Y=;
        b=BpvhHcPUT7XxPh/SOtrF3e1i5tEYFe3GPkmf6SWEHv4f8XqtlqEr4lGiZ9hYuYNle/
         pOl4b9Eli4Mmc649sidIIee8GnDxo8SYftlxXPugIfKpYUaE49tIFmX6eRydtnJ1hRKS
         lm5+WyaNG4W1vK5HMEW/jO4FWl/fFeSmo71/yINSaXPvIKhQJzX542X5kIDMRDC7R9l3
         b3rUqea+UMnT+jNIlsvPMkWMULg1rxq8dk+TofrPlFT6Cv6dE3oafhz/FM2u8tTICidX
         E9j1S3Hel9XFRHCbBtireU7eUDwutlPYthxi/9JQ+UOq3Z8zyJCvtFyYaIruEQuw1D5I
         ngVA==
X-Gm-Message-State: AOAM532RO19TN6BU4/QQRoirVm2238dQ/0PWeFblpUoTTj/xvOrJqSep
	plxd36jDkb0Qp+lirqfOUUbmoQMhcuOGI+PmiofxBQ==
X-Google-Smtp-Source: ABdhPJw50Kehp0YzYo8ni/ZcFuH0xfJPfEwkq0tDG/rca4iUXWkwwLZ8rjn4afptZgPUf2AmMQoAZXXl0rJ2NgOaWug=
X-Received: by 2002:a25:cf8f:: with SMTP id f137mr24344842ybg.338.1633447214002;
 Tue, 05 Oct 2021 08:20:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211005123645.2766258-1-sumit.garg@linaro.org>
In-Reply-To: <20211005123645.2766258-1-sumit.garg@linaro.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 5 Oct 2021 08:20:02 -0700
Message-ID: <CABCJKuesYcGdKLi1YqHP3PU5n6vf-3Q-A+UNyCLzsoJ+0oiKmw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: ftrace: use function_nocfi for _mcount as well
To: Sumit Garg <sumit.garg@linaro.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, ben.dai@unisoc.com, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	daniel.thompson@linaro.org, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Sumit,

On Tue, Oct 5, 2021 at 5:37 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Commit 800618f955a9 ("arm64: ftrace: use function_nocfi for ftrace_call")
> only fixed address of ftrace_call but address of _mcount needs to be
> fixed as well. Use function_nocfi() to get the actual address of _mcount
> function as with CONFIG_CFI_CLANG, the compiler replaces function pointers
> with jump table addresses which breaks dynamic ftrace as the address of
> _mcount is replaced with the address of _mcount.cfi_jt.
>
> This problem won't apply where the toolchain implements
> -fpatchable-function-entry as we'll use that in preference to regular -pg,
> i.e. this won't show up with recent versions of clang.
>
> Fixes: 9186ad8e66bab6a1 ("arm64: allow CONFIG_CFI_CLANG to be selected")
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> ---
>
> Changes in v2:
> - Added fixes tag.
> - Extended commit description.
> - Picked up Mark's ack.
>
>  arch/arm64/include/asm/ftrace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
> index 91fa4baa1a93..347b0cc68f07 100644
> --- a/arch/arm64/include/asm/ftrace.h
> +++ b/arch/arm64/include/asm/ftrace.h
> @@ -15,7 +15,7 @@
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>  #define ARCH_SUPPORTS_FTRACE_OPS 1
>  #else
> -#define MCOUNT_ADDR            ((unsigned long)_mcount)
> +#define MCOUNT_ADDR            ((unsigned long)function_nocfi(_mcount))
>  #endif
>
>  /* The BL at the callsite's adjusted rec->ip */
> --
> 2.17.1
>

Clang >= 10 supports -fpatchable-function-entry and CFI requires Clang
12, so I assume this is only an issue if
CONFIG_DYNAMIC_FTRACE_WITH_REGS is explicitly disabled?

Nevertheless, the patch looks good to me.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
