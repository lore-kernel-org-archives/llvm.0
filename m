Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461186;
	b=NSuFj3emFx81SuVB6O131eEIXpBrsgqnBQU6RHdEnkN+Z4IY+SMAUa24y7WdYtUpBkf9
	 AE4FUkL9QyBZvPaKDvhG3EJso+Me+Si1LdDch8CqD1D42nCrRhZkg8Qr2Z17Mbw0m1d3p
	 h/jnTsqWhvbl5ldVM3D2YuF0oFN0Ug4L0rIPRW3M3/0jCVtAwJNfzV2Be5IPbd3v5uGwd
	 FcpHoX20UErDXZw05+1vleVJu9CVGzRXwB70zkDp7XnJAweonxeiRAvRRpf55zfKIwDdy
	 s1iSTDiOWNe9B5o6nbTxq5MloK2rTHjd/nX/jFMXuPzyKFUtDRJAJhxvCdq+lFEidwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SFo6AVw97R2wCBIFYeT75YVKRSh5N0fKfYv/Pz+bvSk=;
	b=vqYPb2ANB8ag+yzobIROyMuEVt3b0yafqqDCS57nWLMD+q8ZGaOM9DJ4QFra7+X4b4BV
	 1/PV/aWJHZVRu5OxhfoNtm2BFuB31Vgqbo1X7c8s9TS75LmOETWRKU4H34wiclHQ6KNA5
	 2YX8c+63aZVRfirjzM/oAiqN1Nd+/M6LfMCznJcz2OVSpC4op2G0xN/bDChfoQq08U/Qd
	 2f4AJwuM1H9oGYuQA+wbE/aDZsLi+Onzj3F2fLSFECneXKtPW6cG+ntR4CHGLugSMqo4G
	 ShcSLxc7Xy5sFWmwZ+n4oetjCZCnlotd2MxMU5+w8T6k4Bw7Eoid+Im+WwGsaGzTStA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SCEEoBV6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75887606A31E
	for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 19:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75887606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SCEEoBV6
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so3072287f8f.1
        for <llvm@lists.linux.dev>; Mon, 23 Nov 2026 11:13:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795461184; cv=none;
        d=google.com; s=arc-20260327;
        b=JqYu2T6LrNj0zm4RJGPAg7rvCfKo0mrKMeQX5rbqYRSePFNrEMany1Z+CnkBFCIQOl
         5d8lSGBl9g8vazskFjH4msfnf2GfSrhc0ArJWsQR8uu55esdAxRia9QrLC4jGSzxsNWg
         YJGliuTGR2WHCcUb4rXudVYyXbpbvtGjVxrW5IE6vi6adZ/p2U2yGNNVlR5X2EWwd22+
         H9nOQt0yj+lk6sfH+vQtngB6OGoJ6mwqFIGGaoEqhOfVxrgB6qwe829u0vWl5N1IX+Zu
         Leqb//Itup7Cjv1EpPckWBY2Spn72o00llVZp8pXKKRGcWKjEfhAYNb1enA03hP9TY1H
         4cpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SFo6AVw97R2wCBIFYeT75YVKRSh5N0fKfYv/Pz+bvSk=;
        fh=KT6CPgjHoNFD17YDqeh1p1lBSkVop7phyMR5XxqA6kM=;
        b=JYWmJi8wkGV+tPOmJYTCYyg9Mqv57MjR96Yn45bz/eFFq2DLNoTlpKILlxyQKSM7Kb
         n+CbOVsE+902bVBLoqfPclDgf+6rQdSRq7bPxqZAIlsp01mYZtYZ3LEnZWLRq1tORKxU
         mQ7NkmuKjBQV3tXsntrOYGqPczX5G9J0kwuho4yEDLSZ5hngFGqSaTPU6SFxu4cRGZrl
         POHZrK8xZyHAl/KYXB8J4Opb/h7IjsTPcgi/qN4ip9c3Qnqws5b50MrAsfw1z3oIUtg8
         ZEBKRMl9F1zl/QGHmLWCuvEmJ1mSPXHaAXnNEuDO9tTLf5GU1feYp88Kk/J3niWxLCKE
         Gk/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795461184; x=1796065984; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SFo6AVw97R2wCBIFYeT75YVKRSh5N0fKfYv/Pz+bvSk=;
        b=SCEEoBV6/rhJhp01Ma+R7nWPESF61xVlcZ4ZLvubiVEWKlYhZLkuZugdm04uP3N+Yb
         09AniyD8N+aEi/1i2gXsPookBumeubTiY6vkrLTsGzOMUSXTvzmCP2EBU3m8T33xDvRc
         lFDK/hcV+MpFSpl1Qc+nJRIhAAsczZa6tx5S4TzoPS5ftLiBUWt6cvi7q77wLyM/aZw4
         NMO7Ep3MFJ14v1K0R4uI745J43Lmz2fLpWGukwVFjontOc3GhnVNXyn4CA2ENwflj4uw
         zuogGIKcxtVEibASyU89YJZDZSQ247Dn8RLks11pGKoW+Yvu1582iCiswD42gylBTCpO
         xPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461184; x=1796065984;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SFo6AVw97R2wCBIFYeT75YVKRSh5N0fKfYv/Pz+bvSk=;
        b=2S+Ue6O8OGArsGyryOgpnNCYZxnYmSTet5G6z/zr/yD01Dug/JiesgBYNhfwmVHUhW
         GmzGxMRGY19eIqhdZkBGtPDGlgcv18fTJ7bUAT2udketyEpKlSKWjTElL/AW2o+eX2tm
         MsQrVNs/FJj8zjtM0+Xv/5V7oK+jpcLyqSVOAcWi+j88zyoY7TFFw9tBO+G0o/NMr2eO
         MzUVqh8mqdXbZD65+kSCg4p54YrXa6YBhSTQvalUrxO08H8MO2aJ5n6sl5UGIzBo5+0y
         j8k/VYVXbhRq563jRVl8kTdnV7dUz6tV/UQQ3g2xot33H636JOpKy8GnY4BtPUTJvSIw
         56QA==
X-Forwarded-Encrypted: i=1; AL+hErFpStupIGX5d+VhaVSyhRFzRdTK9CMfF8GxEi0wykJRM4w4t9PBrKKAQVi1tLzDDNsBlujh@lists.linux.dev
X-Gm-Message-State: APuU4Z9/pbr0SZUgDqECMB/wnj9p8ZONA8I2E3LRUjeBQSYn2gg484RL
	jgmlE/xIbqpDftAb9bvIl+sy0h5CsClazbeOe+YZRHPsUgNU3JCga5PljdiILIlLsEHGFYG+jYq
	LUqf+1xSUT3DD5OEDiKRh1yY5teEUZ1675UfKws5K
X-Gm-Gg: AZFdTZcqTQTqVYIBiFxE63rlAPwZXBEu0Vbz8z/Mf02Uq301PEiM4RFOrsYpB/OrYyl
	Iv3YHeJpLe3jDQfy+k6cE2Bwqoj6FgzduyYlH5Jt5xg6lQeOUimeEBfEG+zNXo6HpBam+mv9k4N
	xGWeChnFsx9A7TW2E+TbQ6T8C+aJJrlHIQVbnkOoG/+plTPdIfw26R5tAdU6fzc23GdFR0x36vP
	sorNig2inUAg3ysDfPALyXI9isbBLRD8sEdT/bJ9/37ztxUaGN/Sbb/zOQ8aQ6kRjYKPDys3gz4
	waQnB+3zZXGekBUp/CD8QMYZuwQtEcCapc020rxcUgwBMcZmd1t53Hm2ffubk3Kq1oAwPYnp46H
	iy3RrUJS55D3N1fn3XfGqCehG+c6Fggfl70AmyjqttlsS6++Ndjr0XRWBfRttTar6OJC8xbYK6Y
	ae5V30FgWA79tDFal+0sSXlH217tFHjA+YYf/E7002uE3kxvYYwhmUmc2GQbVwi/m0z+fycwczi
	k1Wi0AHPfNEOR1/7wsDGvhwlQkH7wekBPUwmQ==
X-Received: by 2002:a05:6000:2082:b0:4aa:ba0f:c24 with SMTP id
 ffacd0b85a97d-4abb3956754mr24614079f8f.40.1795461183189; Mon, 23 Nov 2026
 11:13:03 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122105646.2223131-2-ardb+git@google.com>
In-Reply-To: <20261122105646.2223131-2-ardb+git@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 23 Nov 2026 11:12:52 -0800
X-Gm-Features: Aa3M54r6JmUuoccFpePkZck7gBy4-XWk5fve6pPNHXm6KMQa4IK8PAKHdQcHNY8
Message-ID: <CAKwvOdkOjGkGajGMKtqcHpRSrpXC9UZrH9XPsiv5Rpcdte5tJQ@mail.gmail.com>
Subject: Re: [PATCH] locking/local_lock: Don't evaluate the per-CPU lock
 pointer if unused
To: Ard Biesheuvel <ardb+git@google.com>, Bill Wendling <morbo@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 2:56=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> When lock debugging is disabled, local_lock_acquire() and friends are
> empty, and so the per-CPU lock pointer that is passed to them, which is
> usually computed using this_cpu_ptr(), is not used at all.
>
> However, on x86, when the compiler does not support named address spaces
> (i.e., Clang), this_cpu_ptr() is based on inline asm with a memory

I had to look this one up ("named address spaces").

https://gcc.gnu.org/onlinedocs/gcc/Named-Address-Spaces.html#x86-Named-Addr=
ess-Spaces

So __seg_fs / __seg_gs ?

CC_HAS_NAMED_AS : arch/x86/Kconfig#2331

Weird, clang _does_ seem to support these, since clang-11 (clang-17 is
the current minimum supported default).
https://godbolt.org/z/cfhj8r69E

commit 47ff30cc1be7 ("x86/percpu: Enable named address spaces for all
capable GCC versions")
added a

depends on CC_IS_GCC

What happens if you turn that off?

Ah, a week after that commit was authored, the same author filed
https://github.com/llvm/llvm-project/issues/93449

(currently assigned to Bill; Bill, can you PTAL?)

They also filed
https://github.com/llvm/llvm-project/issues/93449

https://github.com/llvm/llvm-project/issues/187893 looks like possible
a dup of one of the above.  Bill, can you please take a look at those
3?

> operand, and Clang does not discard such inline asm even if its result
> is unused. So the computation of the per-CPU address of the lock is
> emitted regardless, e.g., on every local_lock_nested_bh() in
> process_backlog() and on every local_lock() in the folio batching code.

I'm more so curious how you even noticed this problem? Was there a
thread? Were you looking at some assembler and wondering what was
going on here? Or was there another thread about this?

Very detailed commit message, but you kind of bury the lede here on
what the actual problem this patch is fixing *is*.

>
> This was addressed before by commit
>
>   9983a9d577db ("locking/local_lock: Make the empty local_lock_*() functi=
on a macro.")
>
> but that change was reverted by commit
>
>   2d2f8f083ef2 ("Revert "locking/local_lock: Make the empty local_lock_*(=
) function a macro."")
>
> once commit
>
>   1c1e7e3c23dd ("x86/percpu: Remove volatile from arch_raw_cpu_ptr().")
>
> had dropped the volatile qualifier from the inline asm, on the basis that
> the compiler no longer emits the unused per-CPU reference in that case.
> This is true for GCC, but not for Clang.
>
> So implement the !CONFIG_DEBUG_LOCK_ALLOC versions of these helpers as
> macros that only reference their argument in dead code, so that it is
> type checked but never evaluated. Referencing it only in an unevaluated
> context instead, as the typecheck() in the original macros did, makes
> Clang complain about per-CPU locks that are only used via these helpers
> (-Wunneeded-internal-declaration), which is what commit
>
>   a4812d47deff ("mm/page_alloc: mark pagesets as __maybe_unused")
>
> had to work around at the time.
>
> Also, only evaluate the lock pointer in __local_lock_acquire() and
> __local_lock_release() when it is actually needed, i.e., for
> local_trylock_t.
>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Boqun Feng <boqun@kernel.org>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Bill Wendling <morbo@google.com>
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: llvm@lists.linux.dev
> Fixes: 2d2f8f083ef2 ("Revert "locking/local_lock: Make the empty local_lo=
ck_*() function a macro."")
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  include/linux/local_lock_internal.h | 47 +++++++++++++-------
>  1 file changed, 30 insertions(+), 17 deletions(-)
>
> diff --git a/include/linux/local_lock_internal.h b/include/linux/local_lo=
ck_internal.h
> index 234be7f12c15..7c3191438c90 100644
> --- a/include/linux/local_lock_internal.h
> +++ b/include/linux/local_lock_internal.h
> @@ -69,10 +69,21 @@ static inline void local_lock_debug_init(local_lock_t=
 *l)
>  #else /* CONFIG_DEBUG_LOCK_ALLOC */
>  # define LOCAL_LOCK_DEBUG_INIT(lockname)
>  # define LOCAL_TRYLOCK_DEBUG_INIT(lockname)
> -static inline void local_lock_acquire(local_lock_t *l) { }
> -static inline void local_trylock_acquire(local_lock_t *l) { }
> -static inline void local_lock_release(local_lock_t *l) { }
>  static inline void local_lock_debug_init(local_lock_t *l) { }
> +
> +/*
> + * The argument passed to these is usually a this_cpu_ptr() expression, =
which
> + * is implemented using inline asm when the compiler lacks support for n=
amed
> + * address spaces (e.g., Clang). Clang may fail to discard such inline a=
sm
> + * even if its result is never used, so only reference the argument in d=
ead
> + * code, which type checks it without evaluating it. (Referencing it onl=
y in an
> + * unevaluated context such as sizeof() would make Clang complain about =
per-CPU
> + * locks that are only used via these helpers being unneeded.)
> + */
> +static inline void __local_lock_typecheck(local_lock_t *l) { }
> +# define local_lock_acquire(l)         ({ if (0) __local_lock_typecheck(=
l); })
> +# define local_trylock_acquire(l)      ({ if (0) __local_lock_typecheck(=
l); })
> +# define local_lock_release(l)         ({ if (0) __local_lock_typecheck(=
l); })
>  #endif /* !CONFIG_DEBUG_LOCK_ALLOC */
>
>  #define INIT_LOCAL_LOCK(lockname)      { LOCAL_LOCK_DEBUG_INIT(lockname)=
 }
> @@ -105,20 +116,23 @@ do {                                               =
               \
>         local_lock_debug_init(lock);                            \
>  } while (0)
>
> +/*
> + * Only evaluate @lock if it is actually used, i.e., for local_trylock_t=
, or
> + * when lock debugging is enabled (see local_lock_acquire() above).
> + */
>  #define __local_lock_acquire(lock)                                     \
>         do {                                                            \
> -               local_trylock_t *__tl;                                  \
> -               local_lock_t *__l;                                      \
> -                                                                       \
> -               __l =3D (local_lock_t *)(lock);                          =
 \
> -               __tl =3D (local_trylock_t *)__l;                         =
 \
>                 _Generic((lock),                                        \
>                         local_trylock_t *: ({                           \
> +                               local_trylock_t *__tl =3D (local_trylock_=
t *)(lock); \
> +                                                                       \

Why do we need the temporary?

>                                 lockdep_assert(__tl->acquired =3D=3D 0); =
   \
>                                 WRITE_ONCE(__tl->acquired, 1);          \
> +                               local_lock_acquire((local_lock_t *)__tl);=
 \
>                         }),                                             \
> -                       local_lock_t *: (void)0);                       \
> -               local_lock_acquire(__l);                                \
> +                       local_lock_t *: ({                              \
> +                               local_lock_acquire((local_lock_t *)(lock)=
); \

Is this cast necessary?

> +                       }));                                            \
>         } while (0)
>
>  #define __local_lock(lock)                                     \
> @@ -181,18 +195,17 @@ do {                                               =
               \
>
>  #define __local_lock_release(lock)                                     \
>         do {                                                            \
> -               local_trylock_t *__tl;                                  \
> -               local_lock_t *__l;                                      \
> -                                                                       \
> -               __l =3D (local_lock_t *)(lock);                          =
 \
> -               __tl =3D (local_trylock_t *)__l;                         =
 \
> -               local_lock_release(__l);                                \
>                 _Generic((lock),                                        \
>                         local_trylock_t *: ({                           \
> +                               local_trylock_t *__tl =3D (local_trylock_=
t *)(lock); \
> +                                                                       \
> +                               local_lock_release((local_lock_t *)__tl);=
 \
>                                 lockdep_assert(__tl->acquired =3D=3D 1); =
   \
>                                 WRITE_ONCE(__tl->acquired, 0);          \
>                         }),                                             \
> -                       local_lock_t *: (void)0);                       \
> +                       local_lock_t *: ({                              \
> +                               local_lock_release((local_lock_t *)(lock)=
); \
> +                       }));                                            \
>         } while (0)
>
>  #define __local_unlock(lock)                                   \
> --
> 2.56.1.750.gf70dc682cf-goog
>


--=20
Thanks,
~Nick Desaulniers
