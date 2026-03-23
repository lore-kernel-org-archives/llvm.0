Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34616242D60
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 15:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280420; cv=pass; b=qeYUJkTsPYRtDC4YsMcDBkQirlXNzCX7EZbCcxq4XcHX8UZtosvQ5/atF1ns/PMfXMhFk4aY79cSGk4k2g0I8H2wEUy+loCgQ6zLThPqOpR5LVLGeMV0yIn/358o993zD4NvFYggyjVeu4vw74m+RcUmkeJ4dk4FBG1/qZstlLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280420; c=relaxed/simple;
	bh=XgPnYvpLJ1DoLHHtfk4j0zSTh0OWt1KtMjFYDMzNhKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=odsjh6LyGzzi/iAISyqgWU9FgweS223Xlhj43ZYOsVqX0rICnS5A2Tj70rYMpBGj/3eL4IJ2D5ZSOQafxAP94z7dfToGMfMYHGcE+bP8EbHDqVyDdT1Le/Igf5ti8/BQOSjykaqSbwNe0/GfVZjGus4pQHv+oj7mpkK4ljNxSgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gNbFdfbK; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gNbFdfbK"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b6b0500e06so4963274eec.1
        for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 08:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774280418; cv=none;
        d=google.com; s=arc-20240605;
        b=lWp5xbg0k7dKqKin6GYmQT0HwkMrtEak1y2PKS9SZfPmWrepOZKAIege4Jtdh6UQvt
         AEQjOr19CukwN7n8Fz0An/k0qf+2mqpw8/oPMHmEm/zePq5Q1PzLAQvC/nN7JzDyRbZk
         4jTx0uUsDntgMJC/T9IWV+aDDP24pE8PgI4OqaKAtuEKd7hiBeEShKp4V3mfEAOPl9cN
         +693cdtNAQD3gzOzaaFWH0Fu9nncfGB+eCfmQ+icuHtm6CK9KyseSDIipVLK9jdD8bdi
         SfgTV2DxKSqPDTEDNBdQkJ0JCW8BfiTSAttrmKJoJwUD/XfTBSGgTBYBvtTzKwOsZ1Vk
         jplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QEOcupDY5kFniYF1yNGC1OH8BcWT0fwEGPEOgx7hasY=;
        fh=Q0kQlYIRjsOge9xhosiUNjpCip7gOV2zfEyywcUw0as=;
        b=eLPLj3jS930tJAF1iKSlPGjbCkZPEjs4R9Tkng/VHAHIYbcCv9md7tZQmiyI+PFjoT
         8w5EZeEClKhSRfcRcXUygqq5vULGa8EkrOiN2lAF3SzZoIJw6bdbW8vJkxkeysUz7w8m
         m7UsZvQ0zbErd5MJ5PX6jKFTqJ3nfeHi1Oq/CAKvGriSkcCHJzSwjIhJlF2n/FvwxLd7
         6di0YoFMsySxCIPXJtpBe2CYlWkcRQghoeMY4MQ5uNxEZqlJTtvYu/UOCUQHqX0ZQqK4
         VufU5ny7PDG9ZrRAozVelkuH8O4ws+VZE9C4YWQkBIH2hF1XfPcZ4Dj8vqo2sAYQXaZR
         JjSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774280418; x=1774885218; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QEOcupDY5kFniYF1yNGC1OH8BcWT0fwEGPEOgx7hasY=;
        b=gNbFdfbKeOu16Oa1QwMB3T8E00bShkQxRjQXH6VQi1hMCAES10wTWCt0Txuvn5GOa5
         AKHDko+d8HoSbNhnQMF4xy5mLL8+rORhrInSl97Sg60Hj+lQ5nVzg0HzJQanE7uE11V/
         kmw/u+SMeyaCMGpS/OXlWQJKt1lHWnNFBTUMwhorWOIEeuFoNSNuhruwxyVqqTTI+bvZ
         gZT55ERdC3FND54YC1/GNgv4iH8VxFfsrQA6IAmcDG2XU8LhYQuMqJb9ep2DnYWsxk4h
         OctEYPTBX6K0cXeB2DZxsUkiC4RTID5niS9y6Jpqptspy5cFpBE8Dbeoj7SyUT5dn7iC
         EEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774280418; x=1774885218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEOcupDY5kFniYF1yNGC1OH8BcWT0fwEGPEOgx7hasY=;
        b=pu7rIAkNIayA4+On6mj1Jg98rbgFgGOaMu8uBA9/XpKytNFXPaxKo6iiyWyFBMi3pS
         QjVK2xIH6N29vayHskq6ASaaoCB0B/2EtTh5V4mwxf1PPrrUev93ppo/LN39mp0e57Ok
         S8hTjUhh2sTyl83mT1qySTq/h/4l3hF3L8DFY/pSel+JkAcrTAzO2BqdJWTjcSd+T6+M
         66Wv7PbvPm5JZ0g1B2ZryzYcnlNq38SQvFDIi2HX16JXtIvxENlPKueLiL6dm7dNM36J
         crOoUykFBwPRyaisyRaEgndlssHDVSAePSPOskEHB49KvKLoHTXKaTo0OoFR7gKLHfDn
         Toyw==
X-Forwarded-Encrypted: i=1; AJvYcCUlm/euZd2rw4AOGvMs3i2ALnnIi5WacMHhzXJw2yMDaGB7QpJmCc8PpWDVDyZloYEFseTk@lists.linux.dev
X-Gm-Message-State: AOJu0YxURdGCs3pTt8O8poepMwNTWs6UQ3Pi6vs1yqASox5KefC1ZP2/
	0dQiZDYxPKKqL2+4kKGt2uK8MaZGOyeVqKM84r5QJSoiI2+7CI62e3MOhjdgz3zWha1cK0Fkti9
	olNJVkDgAlN5QOxNJXIX1yKhbGdUsy3X9P2IFQzt4
X-Gm-Gg: ATEYQzzpujahrdqt/uoDiqXyaaqzuppsLwUcUE35FSEMWjE/g/37KRp1gZeWUdnRHgQ
	b7lwRHrFKRXVwGQx7wZ0YbxIS0Z+gUbcWZNVd/GYUe/bjYA+84eLMoaJlpgalk38ztWp6P3Gl4V
	vEBAU1003fB95A0S285KDOfTSwG6KOEILScvkYc5ZgvuPsZkWtTh8VpPMO/Zvkn2uO9Ap3YDM9g
	R+REsdRXAMVAp3BWaF/J15ICWGetC6a5pWM88B2DGwuARX9AdbHOrcRvhWrahsNsOv/AUDB7NJe
	CGbNHVUo+XBjAYKiU/RTO3WGTgshOO2frS6X
X-Received: by 2002:a05:7022:2216:b0:124:9fd8:4ba9 with SMTP id
 a92af1059eb24-12a726749b4mr5347642c88.12.1774280417777; Mon, 23 Mar 2026
 08:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260323153351.1412355-1-elver@google.com>
In-Reply-To: <20260323153351.1412355-1-elver@google.com>
From: Marco Elver <elver@google.com>
Date: Mon, 23 Mar 2026 16:39:41 +0100
X-Gm-Features: AaiRm53Ua0vsbOxvtE556ObQJr5cZ4PhbEoFvc2upwr6oKjF9jHpFTLHg3u2uZQ
Message-ID: <CANpmjNMo5kX=2B7UTo-gbiBSTAF0JPwWRZNf=KWpRP4tRA2FAg@mail.gmail.com>
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Add support
 for multi-argument guarded_by
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	Bart Van Assche <bvanassche@acm.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Mar 2026 at 16:33, Marco Elver <elver@google.com> wrote:
>
> Clang 23 introduces support for multiple arguments in the `guarded_by`
> and `pt_guarded_by` attributes [1]. This allows defining variables
> protected by multiple context locks, where read access requires holding
> at least one lock (shared or exclusive), and write access requires
> holding all of them exclusively.
>
> To use the feature while maintaining compatibility with Clang 22, add
> the `__guarded_by_any()` and `__pt_guarded_by_any()` macros. On Clang 23
> and newer, these expand to the underlying attributes; with older Clang
> versions, they fall back to a no-op (false negatives possible).
>
> Link: https://github.com/llvm/llvm-project/pull/186838 [1]
> Requested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Marco Elver <elver@google.com>

If we want to retain compatibility with Clang 22, we need
__guarded_by_any, which ultimately maps to 'guarded_by' as well if we
have Clang 23+.

The alternative would be to wait a few weeks and then require Context
Analysis to have a Clang 23 compiler. That'd avoid adding the new
__guarded_by_any variant and we can just use __guarded_by as-is.

We likely want to do that when Clang 23.1 is released anyway, because
there were some other fixes (arrays of lock fix:
https://github.com/llvm/llvm-project/pull/148551).

Preferences?

> ---
>  include/linux/compiler-context-analysis.h | 66 ++++++++++++++++++++---
>  init/Kconfig                              |  5 ++
>  lib/test_context-analysis.c               | 24 +++++++++
>  3 files changed, 87 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
> index 00c074a2ccb0..a0d135e500dd 100644
> --- a/include/linux/compiler-context-analysis.h
> +++ b/include/linux/compiler-context-analysis.h
> @@ -39,8 +39,9 @@
>  # define __assumes_shared_ctx_lock(...)        __attribute__((assert_shared_capability(__VA_ARGS__)))
>
>  /**
> - * __guarded_by - struct member and globals attribute, declares variable
> - *                only accessible within active context
> + * __guarded_by() - struct member and globals attribute, declares variable
> + *                  only accessible within active context
> + * @x: context lock instance pointer
>   *
>   * Declares that the struct member or global variable is only accessible within
>   * the context entered by the given context lock. Read operations on the data
> @@ -53,11 +54,12 @@
>   *             long counter __guarded_by(&lock);
>   *     };
>   */
> -# define __guarded_by(...)             __attribute__((guarded_by(__VA_ARGS__)))
> +# define __guarded_by(x)               __attribute__((guarded_by(x)))
>
>  /**
> - * __pt_guarded_by - struct member and globals attribute, declares pointed-to
> - *                   data only accessible within active context
> + * __pt_guarded_by() - struct member and globals attribute, declares pointed-to
> + *                     data only accessible within active context
> + * @x: context lock instance pointer
>   *
>   * Declares that the data pointed to by the struct member pointer or global
>   * pointer is only accessible within the context entered by the given context
> @@ -71,7 +73,53 @@
>   *             long *counter __pt_guarded_by(&lock);
>   *     };
>   */
> -# define __pt_guarded_by(...)          __attribute__((pt_guarded_by(__VA_ARGS__)))
> +# define __pt_guarded_by(x)            __attribute__((pt_guarded_by(x)))
> +
> +/**
> + * __guarded_by_any() - struct member and globals attribute, declares variable
> + *                      only accessible within active contexts
> + * @...: context lock instance pointers
> + *
> + * Declares that the struct member or global variable is protected by multiple
> + * context locks. Write access requires all listed context locks to be held
> + * exclusively; read access requires at least one of them to be held (shared or
> + * exclusive).
> + *
> + * .. code-block:: c
> + *
> + *     struct some_state {
> + *             spinlock_t lock1, lock2;
> + *             long counter __guarded_by_any(&lock1, &lock2);
> + *     };
> + */
> +# ifdef CONFIG_CC_HAS_MULTI_ARG_GUARDED_BY_ATTR
> +#  define __guarded_by_any(...)                __attribute__((guarded_by(__VA_ARGS__)))
> +# else
> +#  define __guarded_by_any(...)
> +# endif
> +
> +/**
> + * __pt_guarded_by_any() - struct member and globals attribute, declares pointed-to
> + *                         data only accessible within active contexts
> + * @...: context lock instance pointers
> + *
> + * Declares that the data pointed to by the struct member pointer or global
> + * pointer is protected by multiple context locks. Write access requires all
> + * listed context locks to be held exclusively; read access requires at least
> + * one of them to be held (shared or exclusive).
> + *
> + * .. code-block:: c
> + *
> + *     struct some_state {
> + *             spinlock_t lock1, lock2;
> + *             long *counter __pt_guarded_by_any(&lock1, &lock2);
> + *     };
> + */
> +# ifdef CONFIG_CC_HAS_MULTI_ARG_GUARDED_BY_ATTR
> +#  define __pt_guarded_by_any(...)             __attribute__((pt_guarded_by(__VA_ARGS__)))
> +# else
> +#  define __pt_guarded_by_any(...)
> +# endif
>
>  /**
>   * context_lock_struct() - declare or define a context lock struct
> @@ -158,8 +206,10 @@
>  # define __assumes_ctx_lock(...)
>  # define __assumes_shared_ctx_lock(...)
>  # define __returns_ctx_lock(var)
> -# define __guarded_by(...)
> -# define __pt_guarded_by(...)
> +# define __guarded_by(x)
> +# define __pt_guarded_by(x)
> +# define __guarded_by_any(...)
> +# define __pt_guarded_by_any(...)
>  # define __excludes_ctx_lock(...)
>  # define __requires_ctx_lock(...)
>  # define __requires_shared_ctx_lock(...)
> diff --git a/init/Kconfig b/init/Kconfig
> index 444ce811ea67..9f9a800822ff 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -158,6 +158,11 @@ config CC_HAS_BROKEN_COUNTED_BY_REF
>  config CC_HAS_MULTIDIMENSIONAL_NONSTRING
>         def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__)) = { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
>
> +config CC_HAS_MULTI_ARG_GUARDED_BY_ATTR
> +       # supported since clang 23
> +       depends on CC_IS_CLANG
> +       def_bool $(success,echo 'typedef int __attribute__((capability("l"))) L; L l1; L l2; int __attribute__((guarded_by(&l1, &l2))) x;' | $(CC) -x c - -c -o /dev/null -Werror)
> +
>  config LD_CAN_USE_KEEP_IN_OVERLAY
>         # ld.lld prior to 21.0.0 did not support KEEP within an overlay description
>         # https://github.com/llvm/llvm-project/pull/130661
> diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
> index 06b4a6a028e0..691fb2d6fc45 100644
> --- a/lib/test_context-analysis.c
> +++ b/lib/test_context-analysis.c
> @@ -159,6 +159,10 @@ TEST_SPINLOCK_COMMON(read_lock,
>  struct test_mutex_data {
>         struct mutex mtx;
>         int counter __guarded_by(&mtx);
> +
> +       struct mutex mtx2;
> +       int anyread __guarded_by_any(&mtx, &mtx2);
> +       int *anyptr __pt_guarded_by_any(&mtx, &mtx2);
>  };
>
>  static void __used test_mutex_init(struct test_mutex_data *d)
> @@ -219,6 +223,26 @@ static void __used test_mutex_cond_guard(struct test_mutex_data *d)
>         }
>  }
>
> +static void __used test_mutex_multiguard(struct test_mutex_data *d)
> +{
> +       mutex_lock(&d->mtx);
> +       (void)d->anyread;
> +       (void)*d->anyptr;
> +       mutex_unlock(&d->mtx);
> +
> +       mutex_lock(&d->mtx2);
> +       (void)d->anyread;
> +       (void)*d->anyptr;
> +       mutex_unlock(&d->mtx2);
> +
> +       mutex_lock(&d->mtx);
> +       mutex_lock(&d->mtx2);
> +       d->anyread++;
> +       (*d->anyptr)++;
> +       mutex_unlock(&d->mtx2);
> +       mutex_unlock(&d->mtx);
> +}
> +
>  struct test_seqlock_data {
>         seqlock_t sl;
>         int counter __guarded_by(&sl);
> --
> 2.53.0.1018.g2bb0e51243-goog
>
