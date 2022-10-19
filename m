Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEB73C0A
	for <llvm@lists.linux.dev>; Wed, 19 Oct 2022 16:49:05 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id o70so2294460yba.7
        for <llvm@lists.linux.dev>; Wed, 19 Oct 2022 09:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9ZfzDpEuznz7JDO0MpUy4J66NH5NE0QVJuq6p+mpt0=;
        b=epFsZjbPDXKs/uJnbEHMuvJD+hZrSt9FzMgYqd/mH8LtXPiGaV8psQumxCoXK9sgfO
         L10JN3dev2bKHCRDrs3OjqjHjqP+DmJmalTXZ/su3aO/i+eyVaXECZfyIQagOIxt5D9b
         5SMvlmwAs0H2C1TBNV5QcfBY6uZ2M0NEkjIiSlRkS27+uMxADwcXQZixVJer/7fwovPQ
         ZfrzPQWM4yMQgVuEHHVrJyL9JPYOZXe11yu6u3AsOtQ30CyqlON+fSkmFmmN/wcOhnVO
         uujO7oXtYYA6V+oMiT56WCpR+V6Ust2lrtV8qJlCpv3uTmIoH2wx3iECkgQDsZokbFQC
         ZDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9ZfzDpEuznz7JDO0MpUy4J66NH5NE0QVJuq6p+mpt0=;
        b=tzPZ9YbyQZ6OSMQR/6Tx4mS/T3Nuv9Uik6PnApPSxF9CsZ2r1E57Oi4B0rdcDhfr6S
         cTkVzAnpGJ0hOOdTxIqEh8r5taHGa3997U+hYXuOltJYIOub7pViGcn96Fu3sXjsl0pn
         AiEalAfk0D03WW28C/BX/IYzX0c/czwgE1dyNNW0ytN0yvw5IOytV/VK/qNw127Bp8OD
         RfdPD9qdwaW/xObHkXX5fNgnsQOoETckZ7peS+8EZC2Q182ycBVqFKC6H/5S3Qd2vmaZ
         JyqsGmTWerySjlf9/A0vniMogmXx5Qz3nsBnaLngF8MiENVCWTlaowA62XtpePS1T5WT
         FTRQ==
X-Gm-Message-State: ACrzQf3ldA4nJiUb65glqIn6N8ZsB9p9bKH+Hmj/OMVRcgNAaiDqOCJO
	X4d1hABRAX3TGq7wKKNfSp7992Vzv5wW0xuho8159A==
X-Google-Smtp-Source: AMsMyM5DkZinQHHC8pb/NksD2sLlylIK7q22Q/wf+HODW9dDpNq5xVtkobYW8TyJsJPErzcCHHgIw66b+HW2AA9mmCI=
X-Received: by 2002:a25:9d0a:0:b0:6bc:2641:19d4 with SMTP id
 i10-20020a259d0a000000b006bc264119d4mr7252756ybp.388.1666198143952; Wed, 19
 Oct 2022 09:49:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y1AZr01X1wvg5Klu@dev-arch.thelio-3990X>
In-Reply-To: <Y1AZr01X1wvg5Klu@dev-arch.thelio-3990X>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 19 Oct 2022 09:48:27 -0700
Message-ID: <CAG_fn=WYnfNHC3S1S=mCTKTnzL=UuH7Oz4W3HjsTXEQUtjrxtw@mail.gmail.com>
Subject: Re: -Wmacro-redefined in include/linux/fortify-string.h
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 8:37 AM Nathan Chancellor <nathan@kernel.org> wrote=
:
>
> Hi all,
>
> I am seeing the following set of warnings when building an x86_64
> configuration that has CONFIG_FORTIFY_SOURCE=3Dy and CONFIG_KMSAN=3Dy:

I was also looking into this issue recently, because people start
running into it: https://github.com/google/kmsan/issues/89

I have a solution that redefines __underlying_memXXX to __msan_memXXX
under __SANITIZE_MEMORY__ in fortify-string.h and skips `#define
memXXX __msan_memXXX` in string_64.h, making KMSAN kinda work with
FORTIFY_SOURCE.
Dunno if that's necessary though: KMSAN is a debugging tool anyway,
and supporting it in fortify-string.h sounds excessive.

So I'm fine with disabling FORTIFY_STRING under KMSAN, unless someone objec=
ts.

>   In file included from scripts/mod/devicetable-offsets.c:3:
>   In file included from ./include/linux/mod_devicetable.h:13:
>   In file included from ./include/linux/uuid.h:12:
>   In file included from ./include/linux/string.h:253:
>   ./include/linux/fortify-string.h:496:9: error: 'memcpy' macro redefined=
 [-Werror,-Wmacro-redefined]
>   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                 =
 \
>           ^
>   ./arch/x86/include/asm/string_64.h:17:9: note: previous definition is h=
ere
>   #define memcpy __msan_memcpy
>           ^
>   In file included from scripts/mod/devicetable-offsets.c:3:
>   In file included from ./include/linux/mod_devicetable.h:13:
>   In file included from ./include/linux/uuid.h:12:
>   In file included from ./include/linux/string.h:253:
>   ./include/linux/fortify-string.h:500:9: error: 'memmove' macro redefine=
d [-Werror,-Wmacro-redefined]
>   #define memmove(p, q, s)  __fortify_memcpy_chk(p, q, s,                =
 \
>           ^
>   ./arch/x86/include/asm/string_64.h:73:9: note: previous definition is h=
ere
>   #define memmove __msan_memmove
>           ^
>   2 errors generated.
>
> I can see that commit ff901d80fff6 ("x86: kmsan: use __msan_ string
> functions where possible.") appears to include a fix up for this warning
> with memset() but not memcpy() or memmove(). If I apply a similar fix up
> like so:
>
> diff --git a/include/linux/fortify-string.h b/include/linux/fortify-strin=
g.h
> index 4029fe368a4f..718ee17b31e3 100644
> --- a/include/linux/fortify-string.h
> +++ b/include/linux/fortify-string.h
> @@ -493,6 +493,7 @@ __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel_siz=
e_t size,
>   * __struct_size() vs __member_size() must be captured here to avoid
>   * evaluating argument side-effects further into the macro layers.
>   */
> +#ifndef CONFIG_KMSAN
>  #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                 \
>                 __struct_size(p), __struct_size(q),                     \
>                 __member_size(p), __member_size(q),                     \
> @@ -501,6 +502,7 @@ __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel_siz=
e_t size,
>                 __struct_size(p), __struct_size(q),                     \
>                 __member_size(p), __member_size(q),                     \
>                 memmove)
> +#endif
>
>  extern void *__real_memscan(void *, int, __kernel_size_t) __RENAME(memsc=
an);
>  __FORTIFY_INLINE void *memscan(void * const POS0 p, int c, __kernel_size=
_t size)
>
> Then the instances of -Wmacro-redefined disappear but the fortify tests
> no longer pass for somewhat obvious reasons:
>
>   warning: unsafe memcpy() usage lacked '__read_overflow2' symbol in lib/=
test_fortify/read_overflow2-memcpy.c
>   warning: unsafe memmove() usage lacked '__read_overflow2' symbol in lib=
/test_fortify/read_overflow2-memmove.c
>   warning: unsafe memcpy() usage lacked '__read_overflow2_field' symbol i=
n lib/test_fortify/read_overflow2_field-memcpy.c
>   warning: unsafe memmove() usage lacked '__read_overflow2_field' symbol =
in lib/test_fortify/read_overflow2_field-memmove.c
>   warning: unsafe memcpy() usage lacked '__write_overflow' symbol in lib/=
test_fortify/write_overflow-memcpy.c
>   warning: unsafe memmove() usage lacked '__write_overflow' symbol in lib=
/test_fortify/write_overflow-memmove.c
>   warning: unsafe memset() usage lacked '__write_overflow' symbol in lib/=
test_fortify/write_overflow-memset.c
>   warning: unsafe memcpy() usage lacked '__write_overflow_field' symbol i=
n lib/test_fortify/write_overflow_field-memcpy.c
>   warning: unsafe memmove() usage lacked '__write_overflow_field' symbol =
in lib/test_fortify/write_overflow_field-memmove.c
>   warning: unsafe memset() usage lacked '__write_overflow_field' symbol i=
n lib/test_fortify/write_overflow_field-memset.c
>
> Should CONFIG_KMSAN depend on CONFIG_FORTIFY_SOURCE=3Dn like so? It seems
> like the two features are incompatible if I am reading ff901d80fff6
> correctly.
>
> diff --git a/lib/Kconfig.kmsan b/lib/Kconfig.kmsan
> index b2489dd6503f..6a681621e3c5 100644
> --- a/lib/Kconfig.kmsan
> +++ b/lib/Kconfig.kmsan
> @@ -11,7 +11,7 @@ config HAVE_KMSAN_COMPILER
>  config KMSAN
>         bool "KMSAN: detector of uninitialized values use"
>         depends on HAVE_ARCH_KMSAN && HAVE_KMSAN_COMPILER
> -       depends on SLUB && DEBUG_KERNEL && !KASAN && !KCSAN
> +       depends on SLUB && DEBUG_KERNEL && !KASAN && !KCSAN && !FORTIFY_S=
OURCE
>         select STACKDEPOT
>         select STACKDEPOT_ALWAYS_INIT
>         help
>
> or is there a different obvious fix that I am missing?
>
> Cheers,
> Nathan



--
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
