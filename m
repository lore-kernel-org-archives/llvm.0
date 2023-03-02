Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480DDD53B
	for <llvm@lists.linux.dev>; Thu,  2 Mar 2023 23:21:24 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id fa28so465353pfb.12
        for <llvm@lists.linux.dev>; Thu, 02 Mar 2023 15:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677799283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=082LUY0d8Eopzcy4HsqQ/cvuG1sMALYt+tDo/7tRiEg=;
        b=JUxNC5dd8BzWXIMyJcLxuH+je8q4wPsjtwhI1IBXNTyz7d+1ZXu88uBCy+NzL4of80
         IG4EAqkKZt45UAW3SXWsXLfFbbicj+mipklyKhLAhJUrcH0r8PZ7DT4kAWWJd2UNhD5o
         VBk3LsSZZjIjSKHI6vgIaerbFSCPgZs3lG89/mFbN71YUv4dmk32UQOHqsaUIXnSddLx
         eI2pdYFgweQR6DpFXp0lrmUbvCOkEIeBIPUizCykVtlrOsHYPlO+HfkF7DFNcfyNblmV
         qI8od94Dns1q2uiXDaYEyOGaHiQXgCP6U+u2hK3Ok8GKcqLSUXOHfW12dewOGM/iXy/K
         pK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677799283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=082LUY0d8Eopzcy4HsqQ/cvuG1sMALYt+tDo/7tRiEg=;
        b=7qC4zTmXPdGSkFaEoGvNvNOqj9g/7FZRplmHH62rtUx04r+YHtBnBedgJn6aHEGICc
         pG0s4AYGcWcKxq9YvUHETFkPn6Y43YkCC14dYC9ruH3Eb+WGT4KPYTyIE1F9+yTRtW8J
         ibICo2Wxvzan34H5ogECgqy6OyQVTH6ePq8L4hWVZy5z+oIdO9RMgsxMkfOwxhbkJO3g
         wy6pzmF6k6OSP01xufXifp8DbucJFJZcSAABN9+NvFmCaVtn+/CitxvFXDC3wruiu5Pp
         NAKUEH2WH2LNOaVYV/2TIBKs0NmmMD5WS+AqN8VBk/R+En+5N2K9jlsE5jpjw2xf2bng
         kYIw==
X-Gm-Message-State: AO0yUKUNtjooZSaT+dUz4Lo3Ki6c/HzFwhtCRGjuMPlT647WMf+XA0QX
	Z7kHDOtnFf73Xd+JqkERyFuROSLeJmI0uPLi+kwkMA==
X-Google-Smtp-Source: AK7set8iB3KANP+kYk+SGxaYxkYPCRds4Vjh8f58Fhemsjcq4jdOxoSVFN/P9NJZTZyMLLIAKWJrPBZsssAVygHnkrQ=
X-Received: by 2002:a62:8782:0:b0:60f:b143:8e09 with SMTP id
 i124-20020a628782000000b0060fb1438e09mr81303pfe.1.1677799283268; Thu, 02 Mar
 2023 15:21:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230302225808.never.375-kees@kernel.org>
In-Reply-To: <20230302225808.never.375-kees@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 2 Mar 2023 15:21:11 -0800
Message-ID: <CAKwvOdkfCQJcpx3zh0pwHfnBP2v2ieqxqTUzOUyW14s3Xsaf-w@mail.gmail.com>
Subject: Re: [PATCH] fortify: Improve buffer overflow reporting
To: Kees Cook <keescook@chromium.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Marco Elver <elver@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>, 
	Puyou Lu <puyou.lu@gmail.com>, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 2, 2023 at 2:58=E2=80=AFPM Kees Cook <keescook@chromium.org> wr=
ote:
>
> diff --git a/include/linux/fortify-string.h b/include/linux/fortify-strin=
g.h
> index c9de1f59ee80..981e2838f99a 100644
> --- a/include/linux/fortify-string.h
> +++ b/include/linux/fortify-string.h
> @@ -170,11 +170,13 @@ __FORTIFY_INLINE __diagnose_as(__builtin_strcat, 1,=
 2)
>  char *strcat(char * const POS p, const char *q)
>  {
>         size_t p_size =3D __member_size(p);
> +       size_t size;
>
>         if (p_size =3D=3D SIZE_MAX)
>                 return __underlying_strcat(p, q);
> -       if (strlcat(p, q, p_size) >=3D p_size)
> -               fortify_panic(__func__);
> +       size =3D strlcat(p, q, p_size);
> +       if (p_size < size)

What happens when they're equal? I think this patch changes
behavior...? Intentional?

Did flipping this conditional drop what should be `<=3D`?

Was there an off by one, or is this version of this patch potentially
introducing one? Or am I misremembering my boolean algebra?

> +               fortify_panic(__func__, 1, p_size, size);
>         return p;
>  }
>
> @@ -205,7 +207,7 @@ __FORTIFY_INLINE __kernel_size_t strnlen(const char *=
 const POS p, __kernel_size
>         /* Do not check characters beyond the end of p. */
>         ret =3D __real_strnlen(p, maxlen < p_size ? maxlen : p_size);
>         if (p_size <=3D ret && maxlen !=3D ret)
> -               fortify_panic(__func__);
> +               fortify_panic(__func__, 1, p_size, ret);
>         return ret;
>  }
>
> @@ -241,7 +243,7 @@ __kernel_size_t __fortify_strlen(const char * const P=
OS p)
>                 return __underlying_strlen(p);
>         ret =3D strnlen(p, p_size);
>         if (p_size <=3D ret)
> -               fortify_panic(__func__);
> +               fortify_panic(__func__, 1, p_size, ret);
>         return ret;
>  }
>
> @@ -282,8 +284,8 @@ __FORTIFY_INLINE size_t strlcpy(char * const POS p, c=
onst char * const POS q, si
>                         __write_overflow();
>         }
>         if (size) {
> -               if (len >=3D p_size)
> -                       fortify_panic(__func__);
> +               if (p_size < len)

`<=3D` ? (This used to panic when they were equal)

> +                       fortify_panic(__func__, 1, p_size, len);
>                 __underlying_memcpy(p, q, len);
>                 p[len] =3D '\0';
>         }


--=20
Thanks,
~Nick Desaulniers
