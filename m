Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196172F2C
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 23:17:27 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id o2so929334lfd.1
        for <llvm@lists.linux.dev>; Tue, 08 Feb 2022 15:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uV9MHzT3yqaSJ8VvyobC0sdXGQe9fB58ozgnu6xiqyY=;
        b=o9cIyt5bY7tBJycqX+8faJX72GU6lGkN/ohJfrqEdo0bZnpl6VntHVjHKLxO6fpEeS
         iLf8pFroVszcKHeVggFtDlA+/ahQl3iX1R9v4sYDnfrhyannRYLCftIoDkTkZ4LWdZ8e
         eTTW3/lWIDj82yqfzAs6m33+pXHmp+1TZM6C5KQ3xixSli3TEnfD9bLpdm+Ayj3FoQgG
         SA5BZBXbeirjsZcyi7cw5gEhLmJvfNhrSqTn8AVDVcHxUN6yKrr/cwPpVdE+tUgSOeZ5
         eOi3DyPC6N0NZbjqqScdyo/fT+aS95PhLxpARudPtka+wNBCsaFXjp7qXE/MZCXgcaXz
         Yyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uV9MHzT3yqaSJ8VvyobC0sdXGQe9fB58ozgnu6xiqyY=;
        b=7T6v2f6VqKP0FhdHc4+XcB9oibSvHaGG7+fcHWIWf/KrwZOPxXj+IKpN03TXPo/h90
         juHOpJ/LOLeaQLxfySMd29EIob1umMi0XTf0sTLU8FBBQ5WIti8zEK4eOuWxooFctCH7
         9SJFvTS0UotfSoKnxGt+S1BsgXQYb+XeIyEkhCOhpw3XTCBy2NHMtOqj+QDCsSE/eqVh
         7MVMLrLa5yG7gAe8rVxMkWWPtVcab8EMtgbWYvIaLe+4pyngv7QIntf7AtjLG6eghoI1
         ItnJkG8GoPe9aBf/mG8oLsfoRftm0Yxq7DlsvbXj3gXsl2VgWtDl3cihgVECj61rU8HO
         CNjg==
X-Gm-Message-State: AOAM530P59WUkAfF8rS9XnfiX6M3CHvrP1UZgOw4IFq3e/63ypx+P+VU
	tYV/LwdvUVf2PXZVTylBGSd7ZMVE0YtH99aXv5UlSb0/aGLXVQ==
X-Google-Smtp-Source: ABdhPJzEdVmqLDi7X6N3Z46Ig8r2EtxJrWgkjU4z9gBLfTsztBj2W7LYuSaUTleZLNiFoJLMfZzFlIFwEMqAL3kJPUI=
X-Received: by 2002:ac2:4c4c:: with SMTP id o12mr4287394lfk.523.1644362244992;
 Tue, 08 Feb 2022 15:17:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220208225350.1331628-1-keescook@chromium.org> <20220208225350.1331628-8-keescook@chromium.org>
In-Reply-To: <20220208225350.1331628-8-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Feb 2022 15:17:13 -0800
Message-ID: <CAKwvOd=wre3uzFVBFaOs4Oud+SobxiW_BwKXMsa5p0tEy6BsiA@mail.gmail.com>
Subject: Re: [PATCH v7 7/8] fortify: Make sure strlen() may still be used as a
 constant expression
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	George Burgess IV <gbiv@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 8, 2022 at 2:53 PM Kees Cook <keescook@chromium.org> wrote:
>
> In preparation for enabling Clang FORTIFY_SOURCE support, redefine
> strlen() as a macro that tests for being a constant expression
> so that strlen() can still be used in static initializers, which is
> lost when adding __pass_object_size and __overloadable.
>
> An example of this usage can be seen here:
>         https://lore.kernel.org/all/202201252321.dRmWZ8wW-lkp@intel.com/
>
> Notably, this constant expression feature of strlen() is not available
> for architectures that build with -ffreestanding. This means the kernel
> currently does not universally expect strlen() to be used this way, but
> since there _are_ some build configurations that depend on it, retain
> the characteristic for Clang FORTIFY_SOURCE builds too.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/linux/fortify-string.h | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
> index db1ad1c1c79a..f77cf22e2d60 100644
> --- a/include/linux/fortify-string.h
> +++ b/include/linux/fortify-string.h
> @@ -2,6 +2,8 @@
>  #ifndef _LINUX_FORTIFY_STRING_H_
>  #define _LINUX_FORTIFY_STRING_H_
>
> +#include <linux/const.h>
> +
>  #define __FORTIFY_INLINE extern __always_inline __gnu_inline
>  #define __RENAME(x) __asm__(#x)
>
> @@ -95,9 +97,16 @@ __FORTIFY_INLINE __kernel_size_t strnlen(const char * const p, __kernel_size_t m
>         return ret;
>  }
>
> -/* defined after fortified strnlen to reuse it. */
> +/*
> + * Defined after fortified strnlen to reuse it. However, it must still be
> + * possible for strlen() to be used on compile-time strings for use in
> + * static initializers (i.e. as a constant expression).
> + */
> +#define strlen(p)                                                      \
> +       __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \

Is `__is_constexpr(p) == __is_constexpr(__builtin_strlen(p))`? i.e.
can we drop the first `__builtin_strlen`? It seems redundant.

So instead, we'd have:

#define strlen(p) __builtin_choose_expr(__is_constexpr(p),
__builtin_strlen(p), __fortify_strlen(p))

Or is there some funny business where p isn't constexpr but strlen(p)
somehow is? I doubt that.  (Or is it that p is constexpr, but
strlen(p) is not?)

(Guess I'm wrong: https://godbolt.org/z/19ffz7vjx)

Ok then.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> +               __builtin_strlen(p), __fortify_strlen(p))
>  __FORTIFY_INLINE __diagnose_as(__builtin_strlen, 1)
> -__kernel_size_t strlen(const char * const p)
> +__kernel_size_t __fortify_strlen(const char * const p)
>  {
>         __kernel_size_t ret;
>         size_t p_size = __builtin_object_size(p, 1);
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
