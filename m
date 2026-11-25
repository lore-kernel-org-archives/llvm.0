Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795633533;
	b=4oTTqtVj/a7RYmvCJduPPaydc4/TUpRcMTG4GuH/NqI02e+vn2HxPmul0DXRKOKefC9J
	 M/ZPdy5U6XBCP8BB0bXj9r9DYId+gvaoUi3HgTOa+hafOxYnAxylvex3GCF8AipsihwM0
	 Wmpr8rEOO9bvaIQ2zRVcjeDyozyxbw1HDWd2wrYd+/3zaIX+5NznXENOO3rcyCXkvYb1U
	 5pHAOw/tookfEq5TKz3tK5ALmGFXb85mayJUhWn8wvw3Squyzn6bOJsNHb1weOHuSxyBV
	 dBxEHyTzr/JcEdtrowzpqhJNp5/Jvljxp1sQD6CvswpXnJVTwgwGt4ATjrPS6xg72rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Y4MXJUZftqeBpcJ4VHagm5DzlkCdJPUcBe7w/9/n0sU=;
	b=NtmIBMjDXQuF7RhCqIhklqC3jDvu5PN+rChvKgkJiX10Xl2ncgr8J6Y6V78SmItPleEt
	 W2sdkkTwBDIwtL4VECkNAPklgqupLbmeHitEQQ5MNXAC6lrkHTY/og1iJHZFt0yIz/Y8v
	 5S9P4POdYybdcsWFhkgby/PCTJ0TZSZdPYWaJQfLQpygnrXweC7HbgIigroqYAxub/OuZ
	 a711DAtt4Xfmakwm9m7cTHrXvOP5dyyUdC2KmaHYT0XDm440aNIxEVPLwFavI+Pi7CZ1O
	 9w9Qk4OQrLgLzBcuVUjlFJ421X0lAjnESqTD8fO8sziXYjtsHwA5oOoaWQ+7CqFRtIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z5f0DJBQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FB8606A32C
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 19:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08FB8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z5f0DJBQ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so62639965e9.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 11:05:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795633531; cv=none;
        d=google.com; s=arc-20260327;
        b=Ql0b+v31o87V3AwcNP6RJUE5FDLjkZz/IN+cDouQ2vYZiHZl3eUwJLmOEMFxqreaj4
         RFbHEoobYfDhGtQjdZTNlaPwqsXAL0IGUEztratopEkrWIRatRFM5BgoI2CTZC+VfkOi
         S1IFq5PEUoHAgKVnDsk76/l6yHc3oP9JRFyAMUuklkLPhWNMhkkIZmTafccesezAg4q0
         tr76F0/Xblch95tPpcrBkyzZwGh0NgW1EVXRM3ESOmQSf5Z7zedWBpdXisPtKcPyBY+U
         rSbUWJEqBKTX7ZFSEJg3x0/lnNRFbiSzt7J+gBnWInNuC+bZhRjOiOE7PhHQmCAixWdu
         wgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y4MXJUZftqeBpcJ4VHagm5DzlkCdJPUcBe7w/9/n0sU=;
        fh=0e2qmv9VhaNXRwcosVUWbRvhg3GAfsMJo15eGemdB6A=;
        b=ca4Pc2XHiUeDiyHcyWY/D7jja8j9x5Ic03eam/KjahmVDnXfrvNsudqh1fawh5koNK
         rAdzeIvlRf+9csOmzaAsQmv5tljAQd0k0yH/EhHGEL/LaWD2cmbECQSLsP5+1imFAWxC
         Ft+NFlB1c1QMn9d7S5R70c6xD7OJhXEUW0ZEu/k5NaVNaUXvZdamnNI/Rj6z0XfCyx+f
         84eQFhxpCV9gOSzeMQd3288bOfbnpSfMh7umCYgfzVGlGsG2B0HsVFOYIWcbjrSKT9jy
         v9CHoDtbi+M5TrpC09u32j6yCmOHaTflMS7tT1ucUOircWep/VZJMr67PMUeBpgsG9jX
         1VpQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795633531; x=1796238331; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y4MXJUZftqeBpcJ4VHagm5DzlkCdJPUcBe7w/9/n0sU=;
        b=Z5f0DJBQSZIf8yorZpwIk2t7kwgNoFjgeGRIHMItrKVuUYhDRiFwxk6UMEwzVQ6zlv
         aSG+tjpywhV0atfw45zYQwB3Z6GQCTRIT/bUynLP+q70W5mXqhi0PXgVjuR+pywSpWjI
         M5dMA+rsmQVEWFcO+ZL2u7euGLorE3rX02naL39od21o56uFXvBP7a+UqWQDrXq1QVv/
         1H4dTFsZnJ/ENb9n4t/lVS0prQEHzlSBSBUORQp3sQ7vhiDnD+9UA4XFWTpomXcU/h7s
         fHG1Qo9ZV/mtmfat5Qk37vyAWPNgYm/HGVvTCU3S3bhVuF2/ahtdm0Y/WnJOUe+Dnthy
         02cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633531; x=1796238331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4MXJUZftqeBpcJ4VHagm5DzlkCdJPUcBe7w/9/n0sU=;
        b=zYLTRJ5MQVqsKbQKgT8dm4WemR8x9pOoF+nBb5GwYW0Io1AqSPJTaT20t+X62XXi/s
         CGDD5cLCYQkU/vFL1hchIH37IDrPCiZFeurZEJqfjf4doqjFRGQzf7vsGAbJl2XeVD9P
         bOr4owXG/3Kt9sqj/q+xeS0xGe6t7mHeoTXqrvoc9wwVA23AncAJXCcGQEXgP6Ck4MCb
         kAg084dwC6nwaBdc5h4yP7RCQvHVA5Hq5xw9l0VAdug2nvubF8w1AMpydJ1lNgNpJNcV
         1cPQ1t5rc7mhk5Kr95fBA+pVQ8gnlovKdzncy/wsoSEajV+YlHU3ANkx3iUaF6cnlwCs
         +/WA==
X-Forwarded-Encrypted: i=1; AL+hErFbPf0zK8kUHjMTeFTyiJbjLO0P5xsmnCABMTHHXTD3+bxeg1Zaa2GC2LlCEQ6J9tH+W2Ns@lists.linux.dev
X-Gm-Message-State: APuU4Z+d/rXhrrYAQ1wsxMQHfT4np4OiYYGsloYlBpBJRx8q9JCThj3l
	NyXACi2mzbnviJFp1IuyeF/l2QkTkcF8F+6XJvxqxYLoykJHDxhOUm6N2blWn8pQpWjOw+KV+bG
	hnBndAak/wChs41I2SqCwpKFFdqeD4Ui4PMv/zsaI
X-Gm-Gg: AZFdTZdevJYvXOTCskhTbnU608Mq46myCnZ9bVbOf10Hh7tbPKBlIOZIicWXMn2NUMX
	cnjICiOZupqzpgDGnDhbOWoTa6T5fZEIFhHXRJI/iFInQ1sjOp/j2/lDOSQA8uYbPsO6kVVoh94
	NK9AisOvMq920nUycdYbxrJnbLX9gockLtZMuZ3g4G5xnLW6NoDSadPrMfgqS035xM4x6pPvV0c
	qGahaIi3K9E7UUTCvx1nZDkboCo30EWYD3NhegxtKHv4WyZ5lGDNrC8HPFIAehKFxVVAYYKxxEF
	Ufyv76v75x8QQCcX3g/ZMeDjZbQfdFeS9zZ7cDNqtp+tRW6FdqCGyENxD4MVDv8ebLNTyUlSubS
	+bmA0IIcfbrzhBPK2uJ/9r823Zqo00WjMq3IhSFFrMEs5KoGrEl7hM/mRIbCRFA1a3qWUjcP8s0
	EI9oYbLrlrntwXvuiXzx+pXnXfv3QReF8qTICBEhwml+cQIOYKxHaQLclVAWSPE43MB+oPZnbMm
	eIOR6AWxSUDOxzxnu2H9Og+JJdqKDFUELL+YA==
X-Received: by 2002:a05:600c:3ac9:b0:4a2:a3b:7aa8 with SMTP id
 5b1f17b1804b1-4bb887e068emr399468375e9.3.1795633530828; Wed, 25 Nov 2026
 11:05:30 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125104953.381561-2-ardb+git@google.com>
In-Reply-To: <20261125104953.381561-2-ardb+git@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 25 Nov 2026 11:05:19 -0800
X-Gm-Features: Aa3M54oQa-n6hX_dmNQu1dR69V5rK8706NS8asd4OdWsFAnXmMx7BavZiXUkbsQ
Message-ID: <CAKwvOd=1u6d2Epp8MgkesknixWcB+JLKfAQq8g9kqYw5sDoLow@mail.gmail.com>
Subject: Re: [PATCH] x86/percpu: Use address space loads for per-CPU reads
 when using Clang
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, x86@kernel.org, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Uros Bizjak <ubizjak@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 2:50=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Clang never discards inline asm with memory operands, even if its result
> is unused [0]. This means unused per-CPU reads are always emitted,

Ack on this missed optimization.  I _just_ got beers with Bill last
night, and forgot to bring this up!

> including the load of this_cpu_off by this_cpu_ptr() in cases where the
> resulting pointer is never dereferenced.
>
> Clang's support for the __seg_gs/__seg_fs named address space qualifiers
> is insufficient for full CONFIG_USE_X86_SEG_SUPPORT, but works well
> enough [1] for plain loads, and is present in all versions of Clang that
> Linux still cares about. So use those to implement __raw_cpu_read() on
> SMP, permitting the compiler to elide them when the result is unused.
>
> On a v7.4-rc1 defconfig build, this gets rid of 174 spurious per-CPU
> loads, 136 of which are loads of this_cpu_off from this_cpu_ptr().
>
> [0] https://github.com/llvm/llvm-project/issues/245738
> [1] Exclude KMSAN, which ignores the segment base when instrumenting
>     such loads.

+ Maintainers of KMSAN. Ard, can we get a formal bug report about that?
https://github.com/llvm/llvm-project/issues
With the report in hand, it would be handy to reference it below.

+ Uros for good measure.

>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Bill Wendling <morbo@google.com>
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: llvm@lists.linux.dev
> Cc: x86@kernel.org
>
> This supersedes "locking/local_lock: Don't evaluate the per-CPU lock
> pointer if unused"
>
> https://lore.kernel.org/all/20261122105646.2223131-2-ardb+git@google.com/
>
>  arch/x86/include/asm/percpu.h | 25 ++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.=
h
> index cef9a4ca9841..40262edef878 100644
> --- a/arch/x86/include/asm/percpu.h
> +++ b/arch/x86/include/asm/percpu.h
> @@ -32,13 +32,13 @@
>
>  #define __force_percpu_prefix  "%%"__stringify(__percpu_seg)":"
>
> -#ifdef CONFIG_CC_HAS_NAMED_AS
> -
>  #ifdef __CHECKER__
>  # define __seg_gs              __attribute__((address_space(__seg_gs)))
>  # define __seg_fs              __attribute__((address_space(__seg_fs)))
>  #endif
>
> +#ifdef CONFIG_CC_HAS_NAMED_AS
> +
>  #define __percpu_prefix
>
>  #else /* !CONFIG_CC_HAS_NAMED_AS: */
> @@ -144,6 +144,25 @@ do {                                                =
                               \
>
>  #else /* !CONFIG_USE_X86_SEG_SUPPORT: */
>
> +#if defined(CONFIG_SMP) && defined(CONFIG_CC_IS_CLANG) && !defined(CONFI=
G_KMSAN)
> +
> +/*
> + * Clang never discards inline asm with memory operands, even if its res=
ult is
> + * unused. Its named address space support is sufficient for plain loads=
, so

After the first sentence, I'd link to
https://github.com/llvm/llvm-project/issues/245738. Since this code is
meant to be temporary until that is fixed in clang, a future traveler
may simply open the link, see it's closed, then see what they can do
about cleaning up this code.  It's handy for Nathan or myself to use
`grep` to find links to llvm issues, then verify if they're stale and
can be cleaned up (once we have newer toolchains).

> + * use those instead, allowing unused per-CPU reads to be elided. KMSAN =
is
> + * excluded as it ignores the segment base when instrumenting such loads=
.

Then I'd link to your to be filed bug report, for the same reason.

> + *
> + * Once CONFIG_USE_X86_SEG_SUPPORT is fully implemented in Clang, this v=
ersion
> + * can be dropped.

And finally here I'd link to the final issue.  That way it's clear
there's 3 different issues on the toolchain side conspiring here.

> + */
> +#define __raw_cpu_read(size, qual, _var)                               \
> +({                                                                     \
> +       *(qual TYPEOF_UNQUAL(_var) CONCATENATE(__seg_, __percpu_seg) * __=
force) \
> +               (__force uintptr_t)&(_var);                             \

Beautiful.

> +})
> +
> +#else
> +
>  #define __raw_cpu_read(size, qual, _var)                               \
>  ({                                                                     \
>         __pcpu_type_##size pfo_val__;                                   \
> @@ -156,6 +175,8 @@ do {                                                 =
                               \
>         (typeof(_var))(unsigned long) pfo_val__;                        \
>  })
>
> +#endif
> +
>  #define __raw_cpu_write(size, qual, _var, _val)                         =
       \
>  do {                                                                   \
>         __pcpu_type_##size pto_val__ =3D __pcpu_cast_##size(_val);       =
 \
> --
> 2.56.1.831.g720f3f5937-goog
>


--=20
Thanks,
~Nick Desaulniers
