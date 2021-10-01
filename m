Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F4A3FDF
	for <llvm@lists.linux.dev>; Fri,  1 Oct 2021 20:05:56 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id 71so22936121ybe.6
        for <llvm@lists.linux.dev>; Fri, 01 Oct 2021 13:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PdFXlcsu+q5PMWiIL1iA2KClzAwbqwOYsJ/gtANfFRs=;
        b=cR21OGSdve69DJVzs3bLwJbNpbviyrtvh5SHvUA75uIGvbwwzg5ZlUE7ZiX8bkY40F
         3CVG89ht27RG9kFscqYNVzoDKjCWtQd70NYNNJrwPlQTPEz81e+bBT6J0puZGcyQ31Sy
         cTyDH1wOJ/Pc8+hLtgbDT9jp8yXJIFZhul2p3uvy7IS4RsWwj+CoekPAwkhwoQnVCwdx
         mNHm7CC3QFgqiroT5AZJceaPkuYCkykDUTCQG3U1rx8/8RidF/WMbupSpLFXp3F7JKfa
         Ik/NPH6YEKT2W4q2idd1op5XTt8NiXNUntu8mzNL6tMehkbNtbHUmSVsRBnNsvIyZ9kS
         +rQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PdFXlcsu+q5PMWiIL1iA2KClzAwbqwOYsJ/gtANfFRs=;
        b=JG3jROnPgJlkl+VRN18KjLCWVJfDhWHOYkSsSk+qI3B3j5EgAlwy3/wLmRhVhNhQB5
         Ir+mXGxW1xiKVY9SKzmLzgerAWpi8onLWlOcSOXLmGqAom0xngJnFnwdiyTlE1O7duAy
         VMVfIKzZfN+Rc5d/tRCbz+hp0EcDRxy2d/4Bv37LFP8a1DaBvsPllpZKgbLuVzHgDneO
         JKBJOKgDyWIFU1sTw0jN4ijxdg48A/tGQX+Xw7sst+CsImoQkSUbZf6n2VIGR9wMxogT
         KA0aTPla1tTFAaOr5/pxljFNXy3d1hSdKT5mgkCyyviGVjO1VPIBJzV2Wys9QLJeaAax
         n0Sg==
X-Gm-Message-State: AOAM533QvrYYwS+NCiuTE9UDpFV6pLtkSLawWb2JQNQkfIJEE7bJdult
	vVfdv+SvKSA2dWS1o55iNRWbQsaqrwY28O/GAdf6oA==
X-Google-Smtp-Source: ABdhPJydMYw8ZAYxAI4G6A2ql6xISjcGxBNkaxgzF7zZvXJEeD8dwytGPBWYAmJEinbOzlykNZjmVPNU/QZ7z322eOk=
X-Received: by 2002:a25:5b8b:: with SMTP id p133mr3519496ybb.273.1633118755112;
 Fri, 01 Oct 2021 13:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABCJKue5Ay6_+8sibzh5wRh3gPzV1g72gJ9m2ot4E1ezj8bpHA@mail.gmail.com>
 <20211001195823.581937-1-ndesaulniers@google.com>
In-Reply-To: <20211001195823.581937-1-ndesaulniers@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 1 Oct 2021 13:05:44 -0700
Message-ID: <CABCJKufdncRjVLy9iq6fk8VbZrhyfr_rw0DiNwdJXkJrzxxGNg@mail.gmail.com>
Subject: Re: [PATCH v5] kallsyms: strip LTO suffixes from static functions
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Kees Cook <keescook@chromium.org>, "KE . LI" <like1@oppo.com>, 
	Fangrui Song <maskray@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Padmanabha Srinivasaiah <treasure4paddy@gmail.com>, Miroslav Benes <mbenes@suse.cz>, Jessica Yu <jeyu@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Stephen Boyd <swboyd@chromium.org>, Joe Perches <joe@perches.com>, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 1, 2021 at 12:58 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Similar to:
> commit 8b8e6b5d3b01 ("kallsyms: strip ThinLTO hashes from static
> functions")
>
> It's very common for compilers to modify the symbol name for static
> functions as part of optimizing transformations. That makes hooking
> static functions (that weren't inlined or DCE'd) with kprobes difficult.
>
> LLVM has yet another name mangling scheme used by thin LTO.
>
> Combine handling of the various schemes by truncating after the first
> '.'.  Strip off these suffixes so that we can continue to hook such
> static functions.  Clang releases prior to clang-13 would use '$'
> instead of '.'
>
> Link: https://reviews.llvm.org/rGc6e5c4654bd5045fe22a1a52779e48e2038a404c
> Reported-by: KE.LI(Lieke) <like1@oppo.com>
> Suggested-by: Fangrui Song <maskray@google.com>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Padmanabha Srinivasaiah <treasure4paddy@gmail.com>
> Suggested-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes v4 -> v5:
> * Absorb Padmanabha Srinivasaiah's patch from
>   https://lore.kernel.org/lkml/20210814124224.8551-1-treasure4paddy@gmail.com/.
> * Add Padmanabha's Suggested-by tag.
> * Rewrite the patch to truncate after first '.', as per Sami's comment
>   from
>   https://lore.kernel.org/lkml/CABCJKue5Ay6_+8sibzh5wRh3gPzV1g72gJ9m2ot4E1ezj8bpHA@mail.gmail.com/.
> * Add Sami's Suggested-by tag.
> * Verify that the '$' delimiter only appears for
>   thin LTO + CFI + clang <= 12, use __clang_minor__ to check.
> * Update comments as per Nathan + Fangrui, add their Suggested-by tags.
> * While Nathan + Fangrui did review v4, v5 is too different IMO to carry
>   those tags forward.
>
> Changes v3 -> v4:
> * Convert this function to use IS_ENABLED rather than provide multiple
>   definitions based on preprocessor checks.
> * Add Nathan's suggested-by.
>
> Changes v2 -> v3:
> * Un-nest preprocessor checks, as per Nathan.
>
> Changes v1 -> v2:
> * Both mangling schemes can occur for thinLTO + CFI, this new scheme can
>   also occur for thinLTO without CFI. Split cleanup_symbol_name() into
>   two function calls.
> * Drop KE.LI's tested by tag.
> * Do not carry Fangrui's Reviewed by tag.
> * Drop the inline keyword; it is meaningless.
>
>  kernel/kallsyms.c | 45 ++++++++++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 13 deletions(-)
>
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index 0ba87982d017..3e4766204b07 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -164,26 +164,45 @@ static unsigned long kallsyms_sym_address(int idx)
>         return kallsyms_relative_base - 1 - kallsyms_offsets[idx];
>  }
>
> -#if defined(CONFIG_CFI_CLANG) && defined(CONFIG_LTO_CLANG_THIN)
> -/*
> - * LLVM appends a hash to static function names when ThinLTO and CFI are
> - * both enabled, i.e. foo() becomes foo$707af9a22804d33c81801f27dcfe489b.
> - * This causes confusion and potentially breaks user space tools, so we
> - * strip the suffix from expanded symbol names.
> - */
> -static inline bool cleanup_symbol_name(char *s)
> +static bool cleanup_symbol_name(char *s)
>  {
>         char *res;
>
> +       if (!IS_ENABLED(CONFIG_LTO_CLANG))
> +               return false;
> +
> +       /*
> +        * LLVM appends various suffixes for local functions and variables that must
> +        * be promoted to global scope as part of LTO.  This can break hooking of
> +        * static functions with kprobes. '.' is not a valid character in an
> +        * identifier in C. Suffixes observed:
> +        * - foo.llvm.[0-9a-f]+
> +        * - foo.[0-9a-f]+
> +        * - foo.[0-9a-f]+.cfi_jt
> +        */
> +       res = strchr(s, '.');
> +       if (res) {
> +               *res = '\0';
> +               return true;
> +       }
> +
> +       if (!IS_ENABLED(CONFIG_CFI_CLANG) || !IS_ENABLED(CONFIG_LTO_CLANG_THIN) ||
> +           __clang_major__ >= 13)
> +               return false;
> +
> +       /*
> +        * Prior to LLVM 13, the following suffixes were observed when thinLTO
> +        * and CFI are both enabled:
> +        * - foo$[0-9]+
> +        */
>         res = strrchr(s, '$');
> -       if (res)
> +       if (res) {
>                 *res = '\0';
> +               return true;
> +       }
>
> -       return res != NULL;
> +       return false;
>  }
> -#else
> -static inline bool cleanup_symbol_name(char *s) { return false; }
> -#endif

Thanks for sending the patch, Nick. This looks correct to me.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
