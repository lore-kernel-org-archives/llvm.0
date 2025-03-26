Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA3424E4A8
	for <llvm@lists.linux.dev>; Wed, 26 Mar 2025 18:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743014417; cv=none; b=EQ+v4Cr74gRH/MfWAqjZ8AT/pjBhyMXZzaozh4Bjnfe/wLvqNE8pz0sV8Jnb9+233ENHjQGfNq1+whz3OLkX4V3enT+tiV1H1h9xF8omGIjw4FG4t/WJgsH/VmZriqa7oZwzoDzRnmtZaNbhrt1DDIgQTP/vCvBOW5VO7DxUdEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743014417; c=relaxed/simple;
	bh=F5Y3RF0ndf8/9azcsuLfDmtYTAz9gCrDPqNMbnYLM/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iW1MaRX1lPV3oPCjwNX5o/R5nafaUmqrkDKnEXQAPbjGx/EvsjtOkeuo1ksZHSQjWFHPVOXUx+XAyn2PswCgPRpyndarTISvCRql68426IqEOc2oRPWm5I4l770ezWlDgbEk1T1aeuOUO091AzSAKpe8cITIm3q3YQkbga+O7no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHK3CMjS; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHK3CMjS"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso235379a12.3
        for <llvm@lists.linux.dev>; Wed, 26 Mar 2025 11:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743014414; x=1743619214; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOrtiNV+oGhM+385d+TAFbT9mzLoUCEIKut5q82hzIo=;
        b=dHK3CMjSZrtfKf+SlMb1wqjEsRzdGpYbRtqrU5Cyar6pnyVQ0BroqL7U7F8XZ+4vna
         oc82kF6qil4sOfqG4jgl4Y3pzX36Ifz8vWgMI8BpPYwxnTjUR+UgLPasthBclJJNJyTM
         rgG/uvhFAlBmDQfcov1XcpKnODcw5pMuvoLryZTkI9js/mE47dLb7+d6BysbuhfJwRgX
         Tg7w9tbNYz18pYyKdmM7bjxpVP8sGgb8SBIlQKklNA2JLWMWPJYJG2YV2csIeCvk50vO
         gGadMcwyjU/z/bHaPRKWFF5OncCe6AGKdFkdvlSpv0OvnbnZs9cjklfrX/4NeodF45fw
         Bdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743014414; x=1743619214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOrtiNV+oGhM+385d+TAFbT9mzLoUCEIKut5q82hzIo=;
        b=HKtZk87ev8ooxDZXY2fhhm/bBjY/O4mjQIvRXUGFIrGd3HTQe6HkieNyfMVQ8WYWax
         q6HkAELWU9ff4YbJf+wETOUN1zguHgMrYuO5r6fvg0aRd6RAsfSn1iJgbg0D1+/a160/
         /mIPGNbWm2cFd4e3dJR7/LRf9YVfXSU+8rUB4I7H9hnujPGM277IR0S6ziJ1jCfTQosE
         FDfCuSq/JaDt3Q7uohHMVv8HSZpmE0lRpzVELSDaMBYv2vID9J93BfxYRjG8GRLLQoXY
         rcKbDQDaBrIp9q0Id/kM0nvky56GJeviqbo0uBkc/atV1KKl5NHWprwGkRiUbcXO/yzm
         XFqA==
X-Forwarded-Encrypted: i=1; AJvYcCUKvBjcg0dMtcFw4UnETOEp5RcXAijceXZn9FCUBfs/sTWOccrwqVhSkEDGXiu6ZHTqpzIJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+E9sJW1gjTDXbWi02c78sTST3SHMswWNuW2ihAgyRsrjvqeUL
	ri2MmMc0259n2GTjmo1nRXsrI+bik17XCfTOHTO9Ywy4bXp/qM1FNz6Trz0lkUnC9xBeTVKtvYC
	nNxS70V+XbbG2l+6QSLgqMEeknmqdY3jn1Jw=
X-Gm-Gg: ASbGnctf+cKbWK/fwlCeBBT3o9oHPs+0GVfnxP2hU6PHG6ovuq3Xj2+SZsvkVbfisih
	v2kkXTb0jB8xkmdU/gBb0WvQGWAnD/JXTMbFxqJBQmM7CfBRPLKU22XxHpoGoX2fM3q8OofkdUq
	ib51hTqqa/+wEuc4d0aYCjx1RQAQ==
X-Google-Smtp-Source: AGHT+IG/c8A09fmH4Hvi2r2iNvibbo0gF+QCVgYY3qZ1UUFDvGnHQ5yFC2x9sm4XWN8Ulm3xGBe6lcMopbawOHcqDlo=
X-Received: by 2002:a17:907:3da1:b0:ac2:6bb5:413c with SMTP id
 a640c23a62f3a-ac6faf45fbcmr48841566b.31.1743014413852; Wed, 26 Mar 2025
 11:40:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250326-string-add-wcslen-for-llvm-opt-v2-0-d864ab2cbfe4@kernel.org>
 <20250326-string-add-wcslen-for-llvm-opt-v2-2-d864ab2cbfe4@kernel.org>
In-Reply-To: <20250326-string-add-wcslen-for-llvm-opt-v2-2-d864ab2cbfe4@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 26 Mar 2025 20:39:37 +0200
X-Gm-Features: AQ5f1JqlCAtx3V-rK5Wv2QTv2YVgCmrK0MvTDzYhi8EajWnLgB-2pLN4PzLaYE0
Message-ID: <CAHp75Vd_mJggRRLfziWUf0tgr3K125uVBNh9VdSo9LHVJz2r_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] lib/string.c: Add wcslen()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 7:19=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> A recent optimization change in LLVM [1] aims to transform certain loop
> idioms into calls to strlen() or wcslen(). This change transforms the
> first while loop in UniStrcat() into a call to wcslen(), breaking the
> build when UniStrcat() gets inlined into alloc_path_with_tree_prefix():
>
>   ld.lld: error: undefined symbol: wcslen
>   >>> referenced by nls_ucs2_utils.h:54 (fs/smb/client/../../nls/nls_ucs2=
_utils.h:54)
>   >>>               vmlinux.o:(alloc_path_with_tree_prefix)
>   >>> referenced by nls_ucs2_utils.h:54 (fs/smb/client/../../nls/nls_ucs2=
_utils.h:54)
>   >>>               vmlinux.o:(alloc_path_with_tree_prefix)
>
> The kernel does not build with '-ffreestanding' (which would avoid this
> transformation) because it does want libcall optimizations in general
> and turning on '-ffreestanding' disables the majority of them. While
> '-fno-builtin-wcslen' would be more targeted at the problem, it does not
> work with LTO.
>
> Add a basic wcslen() to avoid this linkage failure. While no
> architecture or FORTIFY_SOURCE overrides this, add it to string.c
> instead of string_helpers.c so that it is built with '-ffreestanding',
> otherwise the compiler might transform it into a call to itself.

...

> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -7,6 +7,7 @@
>  #include <linux/cleanup.h>     /* for DEFINE_FREE() */
>  #include <linux/compiler.h>    /* for inline */
>  #include <linux/types.h>       /* for size_t */

> +#include <linux/nls_types.h>   /* for wchar_t */

I know it's not ordered, but can we at least not make it worse, i.e.
squeeze this to be after the compiler.h? Or even somewhere after below
the err*.h? Whatever gives a better (sparsely) ordered overall
result...

>  #include <linux/stddef.h>      /* for NULL */
>  #include <linux/err.h>         /* for ERR_PTR() */

...

>  #ifndef __HAVE_ARCH_STRNLEN
>  extern __kernel_size_t strnlen(const char *,__kernel_size_t);
>  #endif
> +extern __kernel_size_t wcslen(const wchar_t *s);

I'm wondering why we still continue putting this 'extern' keyword.
Yes, I see that the rest is like this, but for new code do we really
need it?

>  #ifndef __HAVE_ARCH_STRPBRK
>  extern char * strpbrk(const char *,const char *);
>  #endif


--=20
With Best Regards,
Andy Shevchenko
