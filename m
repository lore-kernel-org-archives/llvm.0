Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F6C7E3
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 08:38:18 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id s10so344255ljp.5
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 01:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=BQBhZcEfl6T9p1U34zgQ/JzWRYaK36lx1DLrHB7PYZQ=;
        b=j09QxsNsiS6ScV7OwpSKQmeohH2DKbk8MbRDvGLQqmFFj3+o0zQSiT8fi+lgn0VfZS
         oOZOz34KyZ8NMQRv9iQ4lVxa5lqYz2FcGB971Cz4/3uiyh5opfc43F3u30kDXOz2vbHn
         XGkJ95fRoYADZy99hd8d0cTEF3oThzAUFDqK0k4GKjP7b5zxPSU8qwi2tghumha15dJy
         wuGILdiH48QfezIT9wAx2qblM6SKGhI6eZag9/mlHTfvuFJwYOoRw+GfawubrnLmpCxL
         CgkwutO4hNTkkSNUNU/qCkXG8jqKS8cZ529W44ybltGfRLaGYMFMikbpQ9Av5rw4xWYg
         aj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=BQBhZcEfl6T9p1U34zgQ/JzWRYaK36lx1DLrHB7PYZQ=;
        b=acJIjqG7VZO56Ew1+3+FvS8CM3uWPZPJcXA1QmllszwkauqxdoMbcKr/fXlOIntH9R
         xJ5bBGUx2RiQE8JhpxsAhNPi+8OTufO/R7aCwNMMnPpkizYbppTZw3ritrIBOzoZVsaC
         jqDGijmU5PuXyIMnLxZQPcyE7/OwTnkFMLpVLUWJmfHi9epmx27uFOBMUdbIMVWY3oJq
         K4c8C1+aJhKicv7qXgS+nuocQ02VJyNAc2ZhBZzs3RWERCqx5zqFKtH/18irpyvuhm/4
         got5LTiVWkgVblYjhQXjCgi7G2yajD/OovmQV+76mFSewYOj+l2QhZeZ5VCFmvmtdq5w
         zYvA==
X-Gm-Message-State: ACgBeo01S3bdikI+3y5g23+78P3RnfaWbFli/naF7dVEbl67iv7990N6
	uCtfuGNzIlCc0/FmyycZuqQm3GjVCaUUT39s6C1mnA==
X-Google-Smtp-Source: AA6agR6RJr6eTkMa6PU0QWPPFxYYwmaaxaNYjGWefoTfZlImxv5iZJCWz/Amdxg7tYqmq+XELjddohxZwdle5nSJeDs=
X-Received: by 2002:a2e:bf07:0:b0:261:cafb:d4a8 with SMTP id
 c7-20020a2ebf07000000b00261cafbd4a8mr3459885ljr.268.1662712696564; Fri, 09
 Sep 2022 01:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220909073840.45349-1-elver@google.com> <20220909073840.45349-2-elver@google.com>
In-Reply-To: <20220909073840.45349-2-elver@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 9 Sep 2022 10:38:04 +0200
Message-ID: <CACT4Y+Zuf+ynzSbboTAN0_VLedeVErO6qm49H4YzuR1e8EgJUQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] kcsan: Instrument memcpy/memset/memmove with newer Clang
To: Marco Elver <elver@google.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, linux-s390@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Sept 2022 at 09:38, Marco Elver <elver@google.com> wrote:
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
> v2:
> * Fix for architectures which do not provide their own
>   memcpy/memset/memmove and instead use the generic versions in
>   lib/string. In this case we'll just alias the __tsan_ variants.
> ---
>  kernel/kcsan/core.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
> index fe12dfe254ec..4015f2a3e7f6 100644
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
> @@ -1308,3 +1309,41 @@ noinline void __tsan_atomic_signal_fence(int memorder)
>         }
>  }
>  EXPORT_SYMBOL(__tsan_atomic_signal_fence);
> +
> +#ifdef __HAVE_ARCH_MEMSET
> +void *__tsan_memset(void *s, int c, size_t count);
> +noinline void *__tsan_memset(void *s, int c, size_t count)
> +{
> +       check_access(s, count, KCSAN_ACCESS_WRITE, _RET_IP_);

These can use large sizes, does it make sense to truncate it to
MAX_ENCODABLE_SIZE?


> +       return __memset(s, c, count);
> +}
> +#else
> +void *__tsan_memset(void *s, int c, size_t count) __alias(memset);
> +#endif
> +EXPORT_SYMBOL(__tsan_memset);
> +
> +#ifdef __HAVE_ARCH_MEMMOVE
> +void *__tsan_memmove(void *dst, const void *src, size_t len);
> +noinline void *__tsan_memmove(void *dst, const void *src, size_t len)
> +{
> +       check_access(dst, len, KCSAN_ACCESS_WRITE, _RET_IP_);
> +       check_access(src, len, 0, _RET_IP_);
> +       return __memmove(dst, src, len);
> +}
> +#else
> +void *__tsan_memmove(void *dst, const void *src, size_t len) __alias(memmove);
> +#endif
> +EXPORT_SYMBOL(__tsan_memmove);
> +
> +#ifdef __HAVE_ARCH_MEMCPY
> +void *__tsan_memcpy(void *dst, const void *src, size_t len);
> +noinline void *__tsan_memcpy(void *dst, const void *src, size_t len)
> +{
> +       check_access(dst, len, KCSAN_ACCESS_WRITE, _RET_IP_);
> +       check_access(src, len, 0, _RET_IP_);
> +       return __memcpy(dst, src, len);
> +}
> +#else
> +void *__tsan_memcpy(void *dst, const void *src, size_t len) __alias(memcpy);
> +#endif
> +EXPORT_SYMBOL(__tsan_memcpy);
> --
> 2.37.2.789.g6183377224-goog
>
