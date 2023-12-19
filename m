Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35253B198
	for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 21:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRokQp45"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-67f645f2e3fso4646846d6.1
        for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 13:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703022498; x=1703627298; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1JR2619YMG5mo1u6s9CGtT+m7a20YcNHq4R9VhkzMY=;
        b=RRokQp4539MD0NJaaBrPp4s0yXBUqQe+V0lMISR1KZQ9KqML2CRvLzw6WAsFAHZCtY
         m8qVBtSQ2bpAUFQdASHQV2+LbpVbdRfyXVgqGjkUR2BIFzSKtGqF0DWoi6yf4cHiBmPO
         O7YTR4/NhIgDpt11ivI+xoywiV70hJmhFnM8ViA1mYDFL5R+af2LK60uY8mj2Q6gzlrO
         miDHRiMKg0BtBLLxU8Bva+NTPeb1R5wOCf4TK/aUBwfs4SVN6JOwVXryrDZYvi2lAKAS
         YzjsAWD/U4Sl5WbS3zff5xrZgpcfhwo8bTqTs2OZ456yF2xwn2sx1qi6ybL4DfTj6sWb
         lL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703022498; x=1703627298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1JR2619YMG5mo1u6s9CGtT+m7a20YcNHq4R9VhkzMY=;
        b=h+wkahvjd4lpyfozWMS4cvWTHe/yjT9yOyubmgc/ysNR9Gv2t9vnUFhOKQMQ9U/qDn
         HTlsd7/a8geiCg7bdw0ReIkDpjydJcLvcHG/qnq9EzrZp9w3obotG9U44udQKHyPuRmm
         ag+r/W9eqofhFo3UvQrJLyoLEtkQ+imnw0eOboH1HEPojr6Yof8sMOQSIjdu9I0iSoSY
         oi5sUmcVxbPTwHCPWezc5G9uDPDZYJVGhbA/O6lt8BxBaxu4sHgGLIioupH9Xj6P91Ub
         wkMrpE1V2ZoK0Kf18sAKNqkzFG6Q0rGI3fJj7X4QRZk/pBAgzxxt11QtzRAloMOlBS1j
         bz/w==
X-Gm-Message-State: AOJu0Yyfio/PD3LpgHgL7ORVQr1etBtpjScgBx74uRfu13hrVnOoVMjI
	L9zzES4APrFqDT+jSAGyeH2BU8B354UKLJgVX58=
X-Google-Smtp-Source: AGHT+IEuvOxivrGVKXoBh8W4o6i+lQHNJN5ZZNaEp5+HZ5Cw1Mu1UB3uQjBUlayK5Rax9O7HaOG6biGrh8l54QSI5PE=
X-Received: by 2002:a05:6214:1c09:b0:67f:30ad:26c0 with SMTP id
 u9-20020a0562141c0900b0067f30ad26c0mr7483675qvc.55.1703022498521; Tue, 19 Dec
 2023 13:48:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231219-libstringheader-v4-0-aaeb26495d2f@google.com> <20231219-libstringheader-v4-1-aaeb26495d2f@google.com>
In-Reply-To: <20231219-libstringheader-v4-1-aaeb26495d2f@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 19 Dec 2023 23:47:42 +0200
Message-ID: <CAHp75VdCb7FX31LkaJg3+a6mttvRGECPt6JS9fNp0SCxqbuqJQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] kernel.h: removed REPEAT_BYTE from kernel.h
To: Tanzir Hasan <tanzirh@google.com>
Cc: Kees Cook <keescook@chromium.org>, Nick DeSaulniers <nnn@google.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	llvm@lists.linux.dev, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 8:10=E2=80=AFPM Tanzir Hasan <tanzirh@google.com> w=
rote:
>
> This patch creates wordpart.h and includes it in asm/word-at-a-time.h
> for the all architectures. WORD_AT_A_TIME_CONSTANTS depends on kernel.h

for all

("all" doesn't go with article)

> because of REPEAT_BYTE. Moving this to another header and including it
> where necessary allows us to not include the bloated kernel.h. Making
> this implicit dependency on REPEAT_BYTE explicit allows for later
> improvements in the lib/string.c inclusion list.

...

> --- a/arch/arm/include/asm/word-at-a-time.h
> +++ b/arch/arm/include/asm/word-at-a-time.h

> -#include <linux/kernel.h>
> +#include <linux/wordpart.h>

No, please, read what I told you carefully.

...

> --- a/arch/x86/include/asm/word-at-a-time.h
> +++ b/arch/x86/include/asm/word-at-a-time.h
> @@ -3,6 +3,7 @@
>  #define _ASM_WORD_AT_A_TIME_H
>
>  #include <linux/kernel.h>

No, the macros used in this file doesn't require (after your patch)
the kernel.h, these are in particular in asm/asm.h and
asm/extable_fixup_types.h. I haven't looked at this closely to find a
common header that kinda guarantees those two to be included.
Otherwise we can use them directly.

> +#include <linux/wordpart.h>

...

>  #include <linux/init.h>
>  #include <linux/export.h>
> -#include <linux/kernel.h>
> +#include <linux/wordpart.h>

Try to keep it more or less ordered. At list with given context it
goes either after the slab.h or below (after those starting with 'f').

>  #include <linux/slab.h>
>  #include <linux/fs.h>
>  #include <linux/filelock.h>

...

> --- a/include/asm-generic/word-at-a-time.h
> +++ b/include/asm-generic/word-at-a-time.h
> @@ -2,7 +2,7 @@
>  #ifndef _ASM_WORD_AT_A_TIME_H
>  #define _ASM_WORD_AT_A_TIME_H
>
> -#include <linux/kernel.h>
> +#include <linux/wordpart.h>
>  #include <asm/byteorder.h>

Same as in the above remark, read what I said in the previous round of revi=
ews.

--=20
With Best Regards,
Andy Shevchenko
