Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D377C
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 06:05:54 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-3321c2a8d4cso152583847b3.5
        for <llvm@lists.linux.dev>; Wed, 07 Sep 2022 23:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=lJYRFzwH4JLePemhbCSx0zq48/URDmByv8p7ogaW1eM=;
        b=dxgOW659IivH6ld+oycZtkdr3gYSMaf5uDZRsDYUvQ185actGdsTWmmMsrrWLgybri
         AkY83nwjwwlVNWRdb6P3iQ1jcISGCuuCYVVz8tORRQuLq3P7H30d8+3dUx8chekDvaUX
         1q/Lv+J0p7TDE5qNJqtLPLTyPlKRaaQ2XoOkT0bbM1dsym6ePdy8yT6jrpVR/ad6kBJI
         lQIwyjMS1rQb8G2PPW+xSuI8oH532YZCPnArrFpBAV8ZBgin2MSD2kyMxHGMUd9c/+vt
         iUraNSxXT2Mckc/uF3lJbsywOxUJB3MFM2DelphAU4bEt9wrs7twwgyEglRDr4Be+N4K
         bAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=lJYRFzwH4JLePemhbCSx0zq48/URDmByv8p7ogaW1eM=;
        b=pWXUPqq8Y8Hi/lab+gn+013baXGEm1EXvPzxQRF9Hyk3EyhzSf5m5ftrlFbU8X7iuH
         kI2XBxBVYNhts+OJ0bPSrYslAzKFqb4XwvLSjlf8TqKHgi/4PqRyFIMWhzIbOCYAKYnA
         38hMRNUJV0ssqXkAVNZ2AmvDv6sof36VX74jFnQqtVDXAsDb5DDQzTTQrbsp9Z1SasNQ
         ShF4GEQx9y4i0aVQX+o/IVjPmXo0nfWh7gSGKB3a2lrdDR0DB9HtHq1cEvmCbj3zBw/m
         LDAwyrRtpp1yfzwrJKXMnz/92wvqv24AIqtGFgRzetNMbQtplD5L0zk+QlY7PbixzoUd
         Z+VQ==
X-Gm-Message-State: ACgBeo2MdFYDiCfszDfyyva0wTG3NBHKSY+xV1l3hgGeBvxA3QJUpRBD
	Oo4scwaOw0hCPWpNqXuJESPcT1sg0ILYUZKhQeKuDA==
X-Google-Smtp-Source: AA6agR7fk9QsTUWXLvr/tdr0+4a/qUd4BukcHMTp6u6ZV71YqzuR6ZHkzBSwnnqHEGFvGdP6PzzI7Orsef6bMbxf/8M=
X-Received: by 2002:a81:bb41:0:b0:328:fd1b:5713 with SMTP id
 a1-20020a81bb41000000b00328fd1b5713mr6423586ywl.238.1662617153642; Wed, 07
 Sep 2022 23:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220907173903.2268161-1-elver@google.com>
In-Reply-To: <20220907173903.2268161-1-elver@google.com>
From: Marco Elver <elver@google.com>
Date: Thu, 8 Sep 2022 08:05:17 +0200
Message-ID: <CANpmjNMH4_H75Z_aQ63C52TDma7PnjWWjmyv+MtXt2W522UAQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kcsan: Instrument memcpy/memset/memmove with newer Clang
To: elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Sept 2022 at 19:39, Marco Elver <elver@google.com> wrote:
>
> With Clang version 16+, -fsanitize=thread will turn
> memcpy/memset/memmove calls in instrumented functions into
> __tsan_memcpy/__tsan_memset/__tsan_memmove calls respectively.
>
> Add these functions to the core KCSAN runtime, so that we (a) catch data
> races with mem* functions, and (b) won't run into linker errors with
> such newer compilers.
>
> Cc: stable@vger.kernel.org # v5.10+
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  kernel/kcsan/core.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
> index fe12dfe254ec..66ef48aa86e0 100644
> --- a/kernel/kcsan/core.c
> +++ b/kernel/kcsan/core.c
> @@ -18,6 +18,7 @@
>  #include <linux/percpu.h>
>  #include <linux/preempt.h>
>  #include <linux/sched.h>
> +#include <linux/string.h>
>  #include <linux/uaccess.h>
>
>  #include "encoding.h"
> @@ -1308,3 +1309,29 @@ noinline void __tsan_atomic_signal_fence(int memorder)
>         }
>  }
>  EXPORT_SYMBOL(__tsan_atomic_signal_fence);
> +
> +void *__tsan_memset(void *s, int c, size_t count);
> +noinline void *__tsan_memset(void *s, int c, size_t count)
> +{
> +       check_access(s, count, KCSAN_ACCESS_WRITE, _RET_IP_);
> +       return __memset(s, c, count);
> +}
> +EXPORT_SYMBOL(__tsan_memset);
> +
> +void *__tsan_memmove(void *dst, const void *src, size_t len);
> +noinline void *__tsan_memmove(void *dst, const void *src, size_t len)
> +{
> +       check_access(dst, len, KCSAN_ACCESS_WRITE, _RET_IP_);
> +       check_access(src, len, 0, _RET_IP_);
> +       return __memmove(dst, src, len);
> +}
> +EXPORT_SYMBOL(__tsan_memmove);
> +
> +void *__tsan_memcpy(void *dst, const void *src, size_t len);
> +noinline void *__tsan_memcpy(void *dst, const void *src, size_t len)
> +{
> +       check_access(dst, len, KCSAN_ACCESS_WRITE, _RET_IP_);
> +       check_access(src, len, 0, _RET_IP_);
> +       return __memcpy(dst, src, len);
> +}
> +EXPORT_SYMBOL(__tsan_memcpy);

I missed that s390 doesn't have arch memcpy variants, so this fails:

>> kernel/kcsan/core.c:1316:16: error: implicit declaration of function '__memset'; did you mean '__memset64'? [-Werror=implicit-function-declaration]

I'll send a v2 where __tsan_mem* is aliased to generic versions if the
arch doesn't have mem*() functions.




> --
> 2.37.2.789.g6183377224-goog
>
