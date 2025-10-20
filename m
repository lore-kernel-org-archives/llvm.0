Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688A52ED86E
	for <llvm@lists.linux.dev>; Mon, 20 Oct 2025 22:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760999693; cv=none; b=NjSMkpcx30un7/pNAgjNfRdjxXABH4WFnfFDX+P6Zq3buTDrsGIhN1G9dZAUZL7Bb8c5IjzHZ/98S2bnSjNHiTTscSOrl5/337uQv+XpUbsCFT26wj+djih4jNaRgZBpqQnmyCv/lNNyc9j0ukxfbCwZa9Qpx0DrPWDhLaTf8fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760999693; c=relaxed/simple;
	bh=74Q6x+bJcEsRztGkWgWfg/ykh5QxUxY/0VrF2XbBMIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9r4oFHOGS7BvAevsWB5ILyQd7rwSik6SYO5laTp1MkmTfubblvjeRoFjVfL8VLd9+nn9ogWANzhue3fpiVyJ3cIHTx3vyEayxYdk9GgHeSyhH1RJa5EQT5uIADws75DjXjJS8PQob7BuqdHxTltuiPhHhMlglUzDbS1YYn7AfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nrh/1s3G; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nrh/1s3G"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso3376751a12.3
        for <llvm@lists.linux.dev>; Mon, 20 Oct 2025 15:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760999690; x=1761604490; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ko/1a73sGAvwsMkHkL1bH1/SjWbFFlE1DZy/jiDhtz0=;
        b=nrh/1s3Gl2P5NwWTzAzV+7eRKb7xt12r5KykFex6IcRCgTRsyJEnvi+vrR6C/TqzMb
         Sz4bMec50/Y0fVmaVlF/SbPr+Kdp2Sin+j5tCiSNNNW/ntOIPix6YPPN57RHQsoY6Lsi
         0bKB9SNwQ+HeKan2lzTQH0tsQ+zwJhTAtgKEW5krI3ej0CVBNITUImwLn9F6LNpGwxZm
         p/ITgV99LXnrfspBWJuCysjyd5WBp65MLkjjuMACYwYYOFrmelEDo/qhdEVeajFJtdwf
         W70gG+n6wVRKAoZfK2BFxPXFcbQP31AzXWB/WhYdvShd3beEL+H86Acc/qwgcIOSTBJf
         XMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760999690; x=1761604490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ko/1a73sGAvwsMkHkL1bH1/SjWbFFlE1DZy/jiDhtz0=;
        b=PKcybdKtOt3dAKIkPBOlIa+Yq6Byfl5AylnIBmiIr530l2wUWSUEvs/ImwgFCePubI
         huwpD+Ui3llD/NIJzX/dHmKD7DwYIx3c4Ek2vWJpaL9yj4TOnOPE4NCEc8eDjTglPh81
         Y6y3mCguiercXjx6FrCGcbIooeDRNKeeBC9t3yN1hYiO9SBehakGxdBDTqpcAf6puP1z
         BVqmsNv7wKoh09eQ1VLPrQ5GxgkHWvqW9G9Wf788A693NXowyuH2wKPnwM+aTF7e6umP
         ScrOo6QPWk7vOSOAYzYsJxjy4SeT4IpVRKXhFM7PAMXkglQE/kQqS/JQXUHZm2wx45kc
         Be+g==
X-Forwarded-Encrypted: i=1; AJvYcCV/choKYdZfQD+5fKdt8oDWO071bai4zJ+mCz/qEZjE5aI2IjLCgsKbpOQmGuEMwx6GmGAA@lists.linux.dev
X-Gm-Message-State: AOJu0YzN+C/u+Fn/K3fMOH9fDhpjuGpoiS9ya+RnbXzQ+gE3REJ7oeNi
	ggqYUbHJKIJAEG0huRIIMw7gJ0PPYQcbZOgNvRFKp0L3kIiM3rCqljGIGh/Y+M+6W+ECZFaWLZI
	y/ndYHfIFHCjh0v5ya2qiLA9tEK9ZBe3gSPpb+9bU
X-Gm-Gg: ASbGncvF/SYV6oeOdcCF/TzFyFvj6koTLaoyaB+LbLhPMMlSNu+jnjuk8U093KRms2O
	73S3IdOmwN4NK5sR6r7jCQF4iGuY777w09tHT4Xpc3/nHrx2RpIHb1D1D72xrNHw5ViKD/+3NJG
	x/NkBsroczkrC7Mc0A+DAidbjCRj3Si6bKjohCVVaJQapprFzZcd9WJnmKhlaN1LBiKcKc4TSQp
	exkADybCAAQgimZUS56u/BzW6+dauMWpDdHcgVio1ha/OlrxuMSBitqH+mzZyu1s1L4brZv+ch5
	q5PcIWo/CvVBdJcA
X-Google-Smtp-Source: AGHT+IFa/TzVHbhwXh93pxwrZM7OK/xk0Udg77zKNa2zFNicGFQ/cT75OCD3XBzSyaXIG/c667qFcOzxptzp0oNm8KA=
X-Received: by 2002:a17:902:cec7:b0:269:8edf:67f8 with SMTP id
 d9443c01a7336-290cb27f40emr183263105ad.52.1760999689188; Mon, 20 Oct 2025
 15:34:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251020220005.work.095-kees@kernel.org> <20251020220118.1226740-1-kees@kernel.org>
In-Reply-To: <20251020220118.1226740-1-kees@kernel.org>
From: Marco Elver <elver@google.com>
Date: Tue, 21 Oct 2025 00:34:12 +0200
X-Gm-Features: AS18NWDeK3RnQHoHi9zm4g_o86NT3rb4x9tx65bWGsiSrbqNn-6xGHB5ZiOdtHM
Message-ID: <CANpmjNOvgorQ=pZBu3kUa5vjwAENO21s6Gdm1TU3SqOowsuiBw@mail.gmail.com>
Subject: Re: [PATCH 1/3] compiler_types: Introduce __counted_by_ptr()
To: Kees Cook <kees@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Johannes Weiner <hannes@cmpxchg.org>, llvm@lists.linux.dev, 
	Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Tamir Duberstein <tamird@gmail.com>, Michael Kelley <mhklinux@outlook.com>, 
	kernel test robot <lkp@intel.com>, Heiko Carstens <hca@linux.ibm.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Yafang Shao <laoar.shao@gmail.com>, 
	Marc Herbert <Marc.Herbert@linux.intel.com>, Christopher Ferris <cferris@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Paolo Abeni <pabeni@redhat.com>, Tejun Heo <tj@kernel.org>, Jeff Xu <jeffxu@chromium.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Randy Dunlap <rdunlap@infradead.org>, 
	Brian Gerst <brgerst@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Oct 2025 at 00:01, Kees Cook <kees@kernel.org> wrote:
>
> Introduce __counted_by_ptr(), which works like __counted_by(), but for
> pointer struct members:
>
> struct foo {
>         int a, b, c;
>         char *buffer __counted_by_ptr(bytes);
>         short nr_bars;
>         struct bar *bars __counted_by_ptr(nr_bars);
>         size_t bytes;
> };
>
> Since "counted_by" can only be applied to pointer members in very recent
> compiler versions, its application ends up needing to be distinct from
> flexible array "counted_by" annotations, hence a separate macro.
>
> Unfortunately, this annotation cannot be used for "void *" members
> (since such a member is considered a pointer to an incomplete type,
> and neither Clang nor GCC developers could be convinced otherwise[1],
> even in the face of the GNU extension that "void *" has size "1 byte"
> for pointer arithmetic). For "void *" members, we must use the coming
> "sized_by" attribute.
>
> Link: https://gcc.gnu.org/pipermail/gcc-patches/2025-May/683136.html [1]
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> Cc: Bill Wendling <morbo@google.com>
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Marco Elver <elver@google.com>
> Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: <llvm@lists.linux.dev>
> ---
>  init/Kconfig                   | 11 +++++++++++
>  Makefile                       |  4 ++++
>  include/linux/compiler_types.h | 21 ++++++++++++++++++++-
>  include/uapi/linux/stddef.h    |  4 ++++
>  4 files changed, 39 insertions(+), 1 deletion(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index cab3ad28ca49..54691b086bc6 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -139,6 +139,17 @@ config CC_HAS_COUNTED_BY
>         # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108896
>         default y if CC_IS_GCC && GCC_VERSION >= 150100
>
> +config CC_HAS_COUNTED_BY_PTR_BARE
> +       def_bool $(success,echo 'struct foo { int *ptr __attribute__((__counted_by__(count))); int count; };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
> +
> +config CC_HAS_COUNTED_BY_PTR_EXP
> +       def_bool $(success,echo 'struct foo { int *ptr __attribute__((__counted_by__(count))); int count; };' | $(CC) $(CLANG_FLAGS) -fexperimental-late-parse-attributes -x c - -c -o /dev/null -Werror)
> +       depends on !CC_HAS_COUNTED_BY_PTR_BARE

Do these still require an unreleased Clang version? Otherwise a
version check will be faster.

> +config CC_HAS_COUNTED_BY_PTR
> +       def_bool y
> +       depends on CC_HAS_COUNTED_BY_PTR_BARE || CC_HAS_COUNTED_BY_PTR_EXP
> +
>  config CC_HAS_MULTIDIMENSIONAL_NONSTRING
>         def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__)) = { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
>
> diff --git a/Makefile b/Makefile
> index d14824792227..1b297dcbb0df 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -933,6 +933,10 @@ KBUILD_CFLAGS      += $(CC_AUTO_VAR_INIT_ZERO_ENABLER)
>  endif
>  endif
>
> +ifdef CONFIG_CC_HAS_COUNTED_BY_PTR_EXP
> +KBUILD_CFLAGS  += -fexperimental-late-parse-attributes
> +endif
> +
>  # Explicitly clear padding bits during variable initialization
>  KBUILD_CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
>
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index 59288a2c1ad2..f197ea03b593 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -353,11 +353,14 @@ struct ftrace_likely_data {
>  #endif
>
>  /*
> + * Runtime track number of flexible array member elements for use by
> + * CONFIG_FORTIFY_SOURCE and CONFIG_UBSAN_BOUNDS.
> + *
>   * Optional: only supported since gcc >= 15
>   * Optional: only supported since clang >= 18
>   *
>   *   gcc: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108896
> - * clang: https://github.com/llvm/llvm-project/pull/76348
> + * clang: https://clang.llvm.org/docs/AttributeReference.html#counted-by-counted-by-or-null-sized-by-sized-by-or-null
>   *
>   * __bdos on clang < 19.1.2 can erroneously return 0:
>   * https://github.com/llvm/llvm-project/pull/110497
> @@ -371,6 +374,22 @@ struct ftrace_likely_data {
>  # define __counted_by(member)
>  #endif
>
> +/*
> + * Runtime track number of objects pointed to by a pointer member for
> + * use by CONFIG_FORTIFY_SOURCE and CONFIG_UBSAN_BOUNDS.
> + *
> + * Optional: only supported since gcc >= 16
> + * Optional: only supported since clang >= 20
> + *
> + *   gcc: https://gcc.gnu.org/pipermail/gcc-patches/2025-April/681727.html
> + * clang: ...
> + */
> +#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> +# define __counted_by_ptr(member)      __attribute__((__counted_by__(member)))
> +#else
> +# define __counted_by_ptr(member)
> +#endif
> +
>  /*
>   * Optional: only supported since gcc >= 15
>   * Optional: not supported by Clang
> diff --git a/include/uapi/linux/stddef.h b/include/uapi/linux/stddef.h
> index 9a28f7d9a334..111b097ec00b 100644
> --- a/include/uapi/linux/stddef.h
> +++ b/include/uapi/linux/stddef.h
> @@ -72,6 +72,10 @@
>  #define __counted_by_be(m)
>  #endif
>
> +#ifndef __counted_by_ptr
> +#define __counted_by_ptr(m)
> +#endif
> +
>  #ifdef __KERNEL__
>  #define __kernel_nonstring     __nonstring
>  #else
> --
> 2.34.1
>
