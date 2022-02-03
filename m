Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BAB2F29
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 20:28:54 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id z7so5597394ljj.4
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 12:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dE4PlMp2a1dru6Yvr00TjP4LGifoJOnJbdvY7D0qQXE=;
        b=izHSx7DC4nrqxIgxZRJkLP9jOC0nX6OfOCw+aiU4VxfU9p5iz1d7bXgrw5YhlDziGm
         AD6Zm0kby2e8DxyVhgQ8XNP0oOpOYLl92qCaXWrYGTPukz9i49rNYFd/t1e9gR5SlE2y
         uS3F4L4tKzV42KA7Lr2MPHcS4xw2HI0EFg3MQJhbiqQMYaGbpq0jCm0tKZSM+Zx+tHCg
         Zof8dEsghHqoIZUdw92oCH5W9rejr813ucYe6ddVV715SkDVYUCHFkc3wiPfJ9BsfsHv
         X9Xu+5i6cAArxarL7kIkWKLSBOQ9zY3kePqnlfv/rOjQEjQTdjukJLT+Kb+RjMtUptJu
         uyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dE4PlMp2a1dru6Yvr00TjP4LGifoJOnJbdvY7D0qQXE=;
        b=PB3Do//kYm9VnbbmPSZzy6phyJU7c8SQT0voo0Iq12+HS+iDv0g+Mo8k0B9rGxEGRj
         fa6FV4tbR8aksdjsijcuzJXn+FXpbo0diAaxm70/xuuOd2ZSdWUfIb5S3G+45GGxcQt3
         k6lRYM67/TGNB78w/rSkIGuq734jSZ1ALINxGcrTNaG84mttCLEJSXZYqICieyqoEHfY
         9fE/QH1ddW+JBA72FPekSA+4zP6AuyzcQj9ygCwE/QnraOQ7+nVYsS2zBvM04EmLt/aD
         KH8kjiDBjTeptkvgbnLQPL6eIrJW8AyfXbtF4cG7JHUerseP43j9Tint2vwfSRbd1Nw6
         alVQ==
X-Gm-Message-State: AOAM532XuouLMldI+XyvojGUPgTV2u8425ojKKpbnRkKkaa97BFqqGTI
	kJERe8PXZpU10hcXTyO1UrFqlsRMjpyAbxjpDmsn2A==
X-Google-Smtp-Source: ABdhPJy0aTO74XJaMQm8cnUoj9YZULLzzNoEu5Fotpi4riNes6buUASDKHj9PbVaIvqx9IzWIEvDToQ7m/JIp7ytPXg=
X-Received: by 2002:a05:651c:3c7:: with SMTP id f7mr19348599ljp.62.1643920132893;
 Thu, 03 Feb 2022 12:28:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220203173307.1033257-1-keescook@chromium.org> <20220203173307.1033257-4-keescook@chromium.org>
In-Reply-To: <20220203173307.1033257-4-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Feb 2022 12:28:41 -0800
Message-ID: <CAKwvOdm7LUUotbk+mQbzXR6=UC+oEBNtq_mQbCUt0arqAbw43Q@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] Compiler Attributes: Add __diagnose_as for Clang
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	George Burgess IV <gbiv@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 3, 2022 at 9:33 AM Kees Cook <keescook@chromium.org> wrote:
>
> Clang will perform various compile-time diagnostics on uses of various
> functions (e.g. simple bounds-checking on strcpy(), etc). These
> diagnostics can be assigned to other functions (for example, new
> implementations of the string functions under CONFIG_FORTIFY_SOURCE)
> using the "diagnose_as_builtin" attribute. This allows those functions
> to retain their compile-time diagnostic warnings.
>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: llvm@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  include/linux/compiler_attributes.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
> index dc3bf2a6e1c9..df9c7e5e8818 100644
> --- a/include/linux/compiler_attributes.h
> +++ b/include/linux/compiler_attributes.h
> @@ -100,6 +100,19 @@
>  # define __copy(symbol)
>  #endif
>
> +/*
> + * Optional: not supported by gcc
> + * Optional: only supported since clang >= 14.0
> + * Optional: not supported by icc
> + *
> + * clang: https://clang.llvm.org/docs/AttributeReference.html#diagnose_as_builtin
> + */
> +#if __has_attribute(__diagnose_as_builtin__)
> +# define __diagnose_as(builtin...)     __attribute__((__diagnose_as_builtin__(builtin)))
> +#else
> +# define __diagnose_as(builtin...)
> +#endif
> +
>  /*
>   * Don't. Just don't. See commit 771c035372a0 ("deprecate the '__deprecated'
>   * attribute warnings entirely and for good") for more information.
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
