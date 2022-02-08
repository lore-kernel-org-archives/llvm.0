Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC392F2C
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 23:00:39 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id i17so769286lfg.11
        for <llvm@lists.linux.dev>; Tue, 08 Feb 2022 15:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MQGz6t0law5MVgqGGrzII5NWEt2DOl/FdzL0iPkOG9k=;
        b=E9TiYK6DZsY1U5F0Tz/ZT9q4LEvVWT6mkphsbB6E0Y1n5Dlkxhz4SP8L5DIe0g0vw0
         TBjFERjJM/SoPlnnskAFnDAxXbaaA/VBkK3AwKQZZQoeH0aXbtWhAa4ckS8Msfw9sMt/
         L/hwgWpDqGuZ26Xz3UnMuQ0f1DPRvr8rAwZpmJYC3SezqbcKajn15tKuUHb/A4Kq6NtJ
         I8jIqfhBUMKDLr0ovEbwGyHpY7X8wJB35ug8ElrKLDs/jIZGeIop6uAXzkxw3U0KSBRP
         HRW0PcDbqGlJDKpseICjPdFOfuyB2wOlgkYr3/iFjOdIE6/GrzEpdpJLM2ZvF146Jr3D
         ToMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MQGz6t0law5MVgqGGrzII5NWEt2DOl/FdzL0iPkOG9k=;
        b=pLVt6KZQpbQfZmxuwxUb/9SgAjh9OvJQWG2N+LlYKy+xZJFfJ9jla67RVKuE0OKce2
         ukes15bouSbqjmqgBq/xBOr7z1CGDAfwF0dYWe1WWikWe9hB5OE1fQzdtFfKcPgXkse0
         K+EfGC4vdZNasEqKhyGPo5QkC53P6x/QZGp+yVnwamE4347nDLtNjI82djsJh++bdo2D
         5iL5dbfrIe6J4i/Mf+yoMYHoanV0FR059VLMEtfqgY2DLxscN6OVolu5LF5MfjsXvG3V
         FpCMQlVPRf/Gl4e+u6Wni6lJcfQZUN4bvEqPamEdyWqHNlDGK36OWNRZAftS/BQoW8In
         cQMw==
X-Gm-Message-State: AOAM5306VdrwJh9FduQExH2kdghTU3DI2y6CCpTx3wwvVMJ1GTXqhzLe
	UYNGk43cjtnKrKRxvJZwkWpfphu2Wre3WD6vrh6IPSKdI9o=
X-Google-Smtp-Source: ABdhPJx8HIMe+XoTHDDgW/Bf8ZuBvIj0tal1BRdAYtu9iAQbllOd6YD7uh/lhTuv7ckF9ZyKCebOEGMWskDEAM7zE8g=
X-Received: by 2002:a05:6512:3f97:: with SMTP id x23mr2035026lfa.550.1644361237277;
 Tue, 08 Feb 2022 15:00:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220208225350.1331628-1-keescook@chromium.org> <20220208225350.1331628-3-keescook@chromium.org>
In-Reply-To: <20220208225350.1331628-3-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Feb 2022 15:00:25 -0800
Message-ID: <CAKwvOdn0huB+HYMCkO9VEryg0AwPA2gpwaUJHGEvV+4846ytSw@mail.gmail.com>
Subject: Re: [PATCH v7 2/8] Compiler Attributes: Add __pass_object_size for Clang
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, George Burgess IV <gbiv@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 8, 2022 at 2:53 PM Kees Cook <keescook@chromium.org> wrote:
>
> In order to gain greater visibility to type information when using
> __builtin_object_size(), Clang has a function attribute "pass_object_size"
> that will make size information available for marked arguments in
> a function by way of implicit additional function arguments that are
> then wired up the __builtin_object_size().
>
> This is needed to implement FORTIFY_SOURCE in Clang, as a workaround
> to Clang's __builtin_object_size() having limited visibility[1] into types
> across function calls (even inlines).
>
> This attribute has an additional benefit that it can be used even on
> non-inline functions to gain argument size information.
>
> [1] https://github.com/llvm/llvm-project/issues/53516

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: llvm@lists.linux.dev
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/linux/compiler_attributes.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
> index 37e260020221..d0c503772061 100644
> --- a/include/linux/compiler_attributes.h
> +++ b/include/linux/compiler_attributes.h
> @@ -263,6 +263,20 @@
>   */
>  #define __packed                        __attribute__((__packed__))
>
> +/*
> + * Note: the "type" argument should match any __builtin_object_size(p, type) usage.
> + *
> + * Optional: not supported by gcc.
> + * Optional: not supported by icc.
> + *
> + * clang: https://clang.llvm.org/docs/AttributeReference.html#pass-object-size-pass-dynamic-object-size
> + */
> +#if __has_attribute(__pass_object_size__)
> +# define __pass_object_size(type)      __attribute__((__pass_object_size__(type)))
> +#else
> +# define __pass_object_size(type)
> +#endif
> +
>  /*
>   *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-pure-function-attribute
>   */
> --
> 2.30.2
>
>


-- 
Thanks,
~Nick Desaulniers
