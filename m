Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A679120E6
	for <llvm@lists.linux.dev>; Sat, 12 Feb 2022 00:11:06 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id j14so14563744lja.3
        for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 16:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B+YNFIwiPxLTkItYxer4dG/fpwVBfSqMZccPHFp7vxg=;
        b=NZmpYtE1ZxGwyElBafNkR5Vh4aJ8GXSp8VaQeOCOYBp1VwWwJJUiMoqzK17BW/4uj3
         O/Bjb64AuEPECbQVWeqjuSaFrC0YdyNmezhrG4nROa2GQvx2EneQQg2wnNtoRgPp1ggN
         OFSD6+ETUvQm77IU1jJ+pT4dmpbrhfgADQIrss1BP9ugdFCm7lg/JiZVjTz9NG/Pj3Cz
         1Xu9zzyYdkDQFd263M2qwapK2JYXj3dfI35qkOLskaoX/OMxefQkduSQcLWXVFV8MlWH
         kOMlWq2vcq2kECVxwdpy7QxIR/dDz58R3lpLYrUI7u9ER9fOo293JUoB6eEvKJeb+N4p
         WcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B+YNFIwiPxLTkItYxer4dG/fpwVBfSqMZccPHFp7vxg=;
        b=IOcA3AiYF2G4ebDAtMdeAJmjqjCv2BmuxbSS8aSf0fXjviinoZxgEctW4G0YI7zhZ/
         uyvPy8WXPY6bf2uaUIXXPq0IZgGkFLmki9x62YTnOidbbMCjCsc1C5gFI0Z2cxKLARYr
         Sq3Kjw61Jn9aMvTXZerDgcqaxF8iU3T2E/YMuvnSlHPXh8KReVwNxVm4JpNoAuJxtjK8
         VCBVm7rJ6iszemnaaE5LnE1Va75d1KQWL1owrMhrSLDVLLQCDstsnScDWszWtqZZ0cJT
         2RkJAay3qHXO1/lA+iJsBphJ55PDAmVSjZORhDh4aP/cwH4sA3qoLbOlbH3Gmd6xz0lr
         Lcrw==
X-Gm-Message-State: AOAM533a0yGwbCEyPelmSxUftWYfc32iDfnJN68qzhK/fjxngnxytDFM
	zapGk8YZD+NEEUVG883Yftfdii0/UWUhAOQ89JzSSg==
X-Google-Smtp-Source: ABdhPJxOrcM/KH1/6FO4cPzkkOj/gwwGf25IRof3rUjEqWDzpbM8wMR1DaoWZd5wnEo9gwL91nU/CwzRAJEj0PcTDv0=
X-Received: by 2002:a05:651c:2121:: with SMTP id a33mr2450328ljq.220.1644624664475;
 Fri, 11 Feb 2022 16:11:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220211014313.1790140-1-aik@ozlabs.ru>
In-Reply-To: <20220211014313.1790140-1-aik@ozlabs.ru>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 11 Feb 2022 16:10:52 -0800
Message-ID: <CAKwvOdkKsoYw9KOfwdHYg7OkTz0TQ6YgZZcqQ5PNg+_O1Q5bgg@mail.gmail.com>
Subject: Re: [RFC PATCH kernel] trace: Make FTRACE_MCOUNT_USE_RECORDMCOUNT configurable
To: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org, 
	Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"

+ Sami, Kees

Do you guys remember why we don't support
FTRACE_MCOUNT_USE_RECORDMCOUNT with LTO?
https://patchwork.kernel.org/project/linux-kbuild/patch/20201013003203.4168817-12-samitolvanen@google.com/?

On Thu, Feb 10, 2022 at 5:43 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> For whatever reason LLVM does not allow LTO (Link Time Optimization) if
> FTRACE_MCOUNT_USE_RECORDMCOUNT is enabled.
>
> This allows disabling just this option instead of disabling all FTRACE
> options.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>
> Or disabling FTRACE is the right thing to do if HAS_LTO_CLANG=y?
>
> Came from arch/Kconfig:
>
> config HAS_LTO_CLANG
>         def_bool y
>         depends on CC_IS_CLANG && LD_IS_LLD && AS_IS_LLVM
>         depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
>         depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
>         depends on ARCH_SUPPORTS_LTO_CLANG
>         depends on !FTRACE_MCOUNT_USE_RECORDMCOUNT  <======
>         depends on !KASAN || KASAN_HW_TAGS
>         depends on !GCOV_KERNEL
>
>
> ---
>  kernel/trace/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index a5eb5e7fd624..87d82d2b0b0b 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -704,7 +704,8 @@ config FTRACE_MCOUNT_USE_OBJTOOL
>         depends on FTRACE_MCOUNT_RECORD
>
>  config FTRACE_MCOUNT_USE_RECORDMCOUNT
> -       def_bool y
> +       bool "Enable FTRACE_MCOUNT_USE_RECORDMCOUNT"
> +       default y
>         depends on !FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
>         depends on !FTRACE_MCOUNT_USE_CC
>         depends on !FTRACE_MCOUNT_USE_OBJTOOL
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
