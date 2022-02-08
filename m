Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3483F2F2C
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 23:02:32 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id a25so959953lji.9
        for <llvm@lists.linux.dev>; Tue, 08 Feb 2022 15:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GEsbRiSDfsbD08TUlr9Z9ZV0yPbDrnJpWGkjQS1Hjis=;
        b=fWn1x1uIGbgBehFQOAadciehWIRQAbIRPopVuxyMs9DoCbcqhnCA5/ghNcgY5tNMDf
         5GhwA9+vHcBJjP6gawOB7m0zKDAFRMLpTd9K54bIWrjJ6IGoAARtOuEQktyCGmFTcGDn
         uhHTEI/YL3/Qf8gwXd9Wj05PprcljXGcb7flKid1B26xBvyY8sPHXBZbfavh8BBh4l60
         MSC0SrCyOssFTR0HzR68YTTTPNzwROKwnegujpJX0lzrXUHdXjDEPiXvezq8Nmzja98E
         +G8RsjsCuEEXbGhRjRFsVQMhqA+Q32LX9Wv9l13OY729iqCi4MeD8oaP+xZJlh08LRcE
         mvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GEsbRiSDfsbD08TUlr9Z9ZV0yPbDrnJpWGkjQS1Hjis=;
        b=DAbvDuBiv9pz6oNfwXtR4x+J4bOndPlJEMgor9onqWoQzcLRxmbfmFgeuTkiWo1OZT
         HhIfGz5bnoHoX/P3kRv561zCzTnozhhKUxQFvJCo+9uE5h5dXZcglJWbByLF5SeBfOlI
         vwhSrcZGOyUS8SyIBJnq5bf+iOmZhL9EFv5kF0vyENl/S2UHaGqCvHFmUJfDQDrPnQEf
         0kQhNkUbeQ42qU1Bdq1f8BlqZBhkbscZAsDSaPZ9LbfBBsWuabEAUgENyIF1LNGqLCKe
         qXMuEI7WEFF7mhtLcqJ5oeg+MkB4EAIdCYGuAsiec31zVlOo1jOwaGmrWFivUy7/vEYx
         psXQ==
X-Gm-Message-State: AOAM530bbdLRH/Xram1XQ37Z8cUafO1jW/B2AuAlRY0zuHNXbYHueO1x
	qW6ZU6E4CaWzs71ciFEeg9dvaGP7inn1Wo4Zk6Ii4g==
X-Google-Smtp-Source: ABdhPJwzIGQpMo3FcDX4EZrWbf35chAhH6w3p/Ql4U+GgaY0Z8qelHtmHkjrihldVSKa+BJDZ2pVxD1WaoGAx0umA5c=
X-Received: by 2002:a2e:980e:: with SMTP id a14mr4296399ljj.220.1644361350015;
 Tue, 08 Feb 2022 15:02:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220208225350.1331628-1-keescook@chromium.org> <20220208225350.1331628-6-keescook@chromium.org>
In-Reply-To: <20220208225350.1331628-6-keescook@chromium.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Feb 2022 15:02:18 -0800
Message-ID: <CAKwvOdn2zQSGjMp=CqJSaMWaUyRXH8EtT++wAfb+QqzzbwLocA@mail.gmail.com>
Subject: Re: [PATCH v7 5/8] fortify: Make pointer arguments const
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	George Burgess IV <gbiv@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 8, 2022 at 2:53 PM Kees Cook <keescook@chromium.org> wrote:
>
> In preparation for using Clang's __pass_object_size attribute, make all
> the pointer arguments to the fortified string functions const. Nothing
> was changing their values anyway, so this added requirement (needed by
> __pass_object_size) requires no code changes and has no impact on
> the binary instruction output.

Gracias Se=C3=B1or!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/linux/fortify-string.h | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/include/linux/fortify-string.h b/include/linux/fortify-strin=
g.h
> index 439aad24ab3b..f874ada4b9af 100644
> --- a/include/linux/fortify-string.h
> +++ b/include/linux/fortify-string.h
> @@ -50,7 +50,7 @@ extern char *__underlying_strncpy(char *p, const char *=
q, __kernel_size_t size)
>  #define __underlying_strncpy   __builtin_strncpy
>  #endif
>
> -__FORTIFY_INLINE char *strncpy(char *p, const char *q, __kernel_size_t s=
ize)
> +__FORTIFY_INLINE char *strncpy(char * const p, const char *q, __kernel_s=
ize_t size)
>  {
>         size_t p_size =3D __builtin_object_size(p, 1);
>
> @@ -61,7 +61,7 @@ __FORTIFY_INLINE char *strncpy(char *p, const char *q, =
__kernel_size_t size)
>         return __underlying_strncpy(p, q, size);
>  }
>
> -__FORTIFY_INLINE char *strcat(char *p, const char *q)
> +__FORTIFY_INLINE char *strcat(char * const p, const char *q)
>  {
>         size_t p_size =3D __builtin_object_size(p, 1);
>
> @@ -73,7 +73,7 @@ __FORTIFY_INLINE char *strcat(char *p, const char *q)
>  }
>
>  extern __kernel_size_t __real_strnlen(const char *, __kernel_size_t) __R=
ENAME(strnlen);
> -__FORTIFY_INLINE __kernel_size_t strnlen(const char *p, __kernel_size_t =
maxlen)
> +__FORTIFY_INLINE __kernel_size_t strnlen(const char * const p, __kernel_=
size_t maxlen)
>  {
>         size_t p_size =3D __builtin_object_size(p, 1);
>         size_t p_len =3D __compiletime_strlen(p);
> @@ -94,7 +94,7 @@ __FORTIFY_INLINE __kernel_size_t strnlen(const char *p,=
 __kernel_size_t maxlen)
>  }
>
>  /* defined after fortified strnlen to reuse it. */
> -__FORTIFY_INLINE __kernel_size_t strlen(const char *p)
> +__FORTIFY_INLINE __kernel_size_t strlen(const char * const p)
>  {
>         __kernel_size_t ret;
>         size_t p_size =3D __builtin_object_size(p, 1);
> @@ -110,7 +110,7 @@ __FORTIFY_INLINE __kernel_size_t strlen(const char *p=
)
>
>  /* defined after fortified strlen to reuse it */
>  extern size_t __real_strlcpy(char *, const char *, size_t) __RENAME(strl=
cpy);
> -__FORTIFY_INLINE size_t strlcpy(char *p, const char *q, size_t size)
> +__FORTIFY_INLINE size_t strlcpy(char * const p, const char * const q, si=
ze_t size)
>  {
>         size_t p_size =3D __builtin_object_size(p, 1);
>         size_t q_size =3D __builtin_object_size(q, 1);
> @@ -137,7 +137,7 @@ __FORTIFY_INLINE size_t strlcpy(char *p, const char *=
q, size_t size)
>
>  /* defined after fortified strnlen to reuse it */
>  extern ssize_t __real_strscpy(char *, const char *, size_t) __RENAME(str=
scpy);
> -__FORTIFY_INLINE ssize_t strscpy(char *p, const char *q, size_t size)
> +__FORTIFY_INLINE ssize_t strscpy(char * const p, const char * const q, s=
ize_t size)
>  {
>         size_t len;
>         /* Use string size rather than possible enclosing struct size. */
> @@ -183,7 +183,7 @@ __FORTIFY_INLINE ssize_t strscpy(char *p, const char =
*q, size_t size)
>  }
>
>  /* defined after fortified strlen and strnlen to reuse them */
> -__FORTIFY_INLINE char *strncat(char *p, const char *q, __kernel_size_t c=
ount)
> +__FORTIFY_INLINE char *strncat(char * const p, const char * const q, __k=
ernel_size_t count)
>  {
>         size_t p_len, copy_len;
>         size_t p_size =3D __builtin_object_size(p, 1);
> @@ -354,7 +354,7 @@ __FORTIFY_INLINE void fortify_memcpy_chk(__kernel_siz=
e_t size,
>                 memmove)
>
>  extern void *__real_memscan(void *, int, __kernel_size_t) __RENAME(memsc=
an);
> -__FORTIFY_INLINE void *memscan(void *p, int c, __kernel_size_t size)
> +__FORTIFY_INLINE void *memscan(void * const p, int c, __kernel_size_t si=
ze)
>  {
>         size_t p_size =3D __builtin_object_size(p, 0);
>
> @@ -365,7 +365,7 @@ __FORTIFY_INLINE void *memscan(void *p, int c, __kern=
el_size_t size)
>         return __real_memscan(p, c, size);
>  }
>
> -__FORTIFY_INLINE int memcmp(const void *p, const void *q, __kernel_size_=
t size)
> +__FORTIFY_INLINE int memcmp(const void * const p, const void * const q, =
__kernel_size_t size)
>  {
>         size_t p_size =3D __builtin_object_size(p, 0);
>         size_t q_size =3D __builtin_object_size(q, 0);
> @@ -381,7 +381,7 @@ __FORTIFY_INLINE int memcmp(const void *p, const void=
 *q, __kernel_size_t size)
>         return __underlying_memcmp(p, q, size);
>  }
>
> -__FORTIFY_INLINE void *memchr(const void *p, int c, __kernel_size_t size=
)
> +__FORTIFY_INLINE void *memchr(const void * const p, int c, __kernel_size=
_t size)
>  {
>         size_t p_size =3D __builtin_object_size(p, 0);
>
> @@ -393,7 +393,7 @@ __FORTIFY_INLINE void *memchr(const void *p, int c, _=
_kernel_size_t size)
>  }
>
>  void *__real_memchr_inv(const void *s, int c, size_t n) __RENAME(memchr_=
inv);
> -__FORTIFY_INLINE void *memchr_inv(const void *p, int c, size_t size)
> +__FORTIFY_INLINE void *memchr_inv(const void * const p, int c, size_t si=
ze)
>  {
>         size_t p_size =3D __builtin_object_size(p, 0);
>
> @@ -405,7 +405,7 @@ __FORTIFY_INLINE void *memchr_inv(const void *p, int =
c, size_t size)
>  }
>
>  extern void *__real_kmemdup(const void *src, size_t len, gfp_t gfp) __RE=
NAME(kmemdup);
> -__FORTIFY_INLINE void *kmemdup(const void *p, size_t size, gfp_t gfp)
> +__FORTIFY_INLINE void *kmemdup(const void * const p, size_t size, gfp_t =
gfp)
>  {
>         size_t p_size =3D __builtin_object_size(p, 0);
>
> @@ -417,7 +417,7 @@ __FORTIFY_INLINE void *kmemdup(const void *p, size_t =
size, gfp_t gfp)
>  }
>
>  /* Defined after fortified strlen to reuse it. */
> -__FORTIFY_INLINE char *strcpy(char *p, const char *q)
> +__FORTIFY_INLINE char *strcpy(char * const p, const char * const q)
>  {
>         size_t p_size =3D __builtin_object_size(p, 1);
>         size_t q_size =3D __builtin_object_size(q, 1);
> --
> 2.30.2
>
>


--=20
Thanks,
~Nick Desaulniers
