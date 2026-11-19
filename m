Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795127297;
	b=iHRGB1NY+7DT/RxjJydWx6XB5DVnnJSpqC2NhW2M/LpBwFXPjyvxUmzm+/BX23GCBdQG
	 EO4whVCkzNt9dfVdwqevDZPy/b5VUfKVJr06TEmhES6TfENO4/VPVTWkn3fOs2cT22z9a
	 /yy3HZHqQGFkurCPEW1eOhNDHu4+JOEUhMqLDz5/QlVqJoFE9uL/nHb8c+nRP7ll9EW5K
	 z2dNl8INqaw0LcAMtvZyI9dGYKAMMZafzPAbzdCBqBv7o/9PYxweWxwdPveN8WHkVg41i
	 HFuzta1ywKSlxrlO1qfCnx7Vp9wT2NYkp7D29QWL8tYWe+ooxqu/u2Th0O4ocLXNY9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PqOM/IVleeod7A0pYm+8MQSeW6D2IecEyUtYHLW5mL4=;
	b=erduB6T3Qw8pjHd5FGXjghgqcrlXQkr8QQXMo3Pxm1fZ1VZW5Fq7rraiT20VHA/zobXL
	 KVS4SAM7wTEN159r/qb8ved1lBDYqUsDJ5Tz/I4IALbhFROOwJPkRqUTTNO61U/N5ITH1
	 MVQwa0kvFQ4SGhhi6a5B2W8bxFh579FwRLeGIvqfNKNqY2SqHfGqJo4l6uZSWJsgDYxb3
	 KiWrAnCtbzk6fOzRs6KTG9cyhwTIP2Ba4IEQh1C7LNA5H41kB0/Acm4k25MyIogu36JaF
	 EVQF7o6hvSInjzmBbq32ZGFS4KpqpySDENuetAGpYAOLl7qOzKVvwp55DpiVy2n8EAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QA3VvN8J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6F7606A336
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 22:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F6F7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QA3VvN8J
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so2884805e9.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 14:28:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795127296; cv=none;
        d=google.com; s=arc-20260327;
        b=ENYlsakTwLd/xNh5nYAL4Y1Oj5bXb84qKJN1NaIijbrZiFxQN5UBACzy/Diuyhq/JX
         0rPJf1i0ckUj5Gp1/hPM5S1/3wlGZCJrP+FLkztCJghcraLD9JSxl/crfSV0ry++cIOE
         OAD83F2o9poCckpe45AaIeYxIqYfhkUt7GMS5Ytt1TtVmHU/ke6pZ32XUdpAqOCFHjct
         awUJXmNAROkLIPn8R0Dcnnk3qSz8T/P73xsGQppm6FtvMiHOIH+9NXdDQmk0zVaoL8pq
         H1h6MzTvwPFAAye3f4sebYFrYtEutgUDvJOqpKNwhW/75U39LQgT1rcgoHy1tzq6rQZu
         uvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PqOM/IVleeod7A0pYm+8MQSeW6D2IecEyUtYHLW5mL4=;
        fh=k9PV6RIG+ON0Ky9lT6tqaG5vuZPUdf1sSUfEA4qVqCI=;
        b=PRocFkZhlkjqqo/+b3PRpTvbCAkaWZp/z0ewRpxH79UmKAFx2jQxOibAXav6ziiKCB
         YRb2+YU8s51VFM7TVJOqvEqeVW/V9KOVmu1k0yDjajVfltbQgVoaBDGsl4LAkXoCrUDI
         P4eJHA5TfMoisEK1rZHyEEfnvwWfI920tsWtdAn2ZWwXfB6v8mY66o1lv3T6GYbG5nUC
         x4/lsGVccsM2f9nXmhNrT6KJnsdRZAVLtRHTOr4T/TYL4XL305wQnpDmoVj2XL+ku/7Y
         tCHaQCSZrr24deg2l1TOvfIAAsoXb1VwxoHuXBTtcZJAWuyxcePbQKCLW5QGuDx8nWuQ
         Z20A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795127296; x=1795732096; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PqOM/IVleeod7A0pYm+8MQSeW6D2IecEyUtYHLW5mL4=;
        b=QA3VvN8J9Kx35OFgRIFdEWtrXzYebCvhLzUCbpUSnuiWY8Ifi340UcEdBum4kDXILJ
         7iEa8r0TbXX+SAhBALZNhCXQLl3WQXuklRi/jmCw2dtWT8Vm6BuOUk+ZjlgVlDWD/nyD
         2vjbqZdZgGcYhhYe9yn/eGeFpuVmYIvhPhfFmrJLGJNwmIh/JStocBdQqpfAFY7GkexA
         FCNDxWFlo41Ov9rm43N99z+4OMTGAMtMfxfaBznEv0aCVqKNUyq/mFjwjlmfimpWyYx6
         beyy+YGKXiRVY09TmXI5n/yYzRM5aGyU1HVHEnol++/e9ctlCKwwdS1WtwnGCC4Swpz8
         gk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795127296; x=1795732096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqOM/IVleeod7A0pYm+8MQSeW6D2IecEyUtYHLW5mL4=;
        b=DIssLORawptzcT1xXIoUJTkrhuz2RxIsQ1ynakZbuqSx89xdCnlsUtK31L9HsS39ys
         wlp+fCWS/H8R/Wwr38enAgW35EGW8VtoTkP2rTZrzSBXO/oIa1vc7IIQw9fHaJdOelfu
         0ahkCxGxmhOEVTwXIqm9OpUkE58cFHiE3g0GyD5Uuj7qUpmzrjz83I9+Zgezo47Q35Wa
         qyjPgF73Ngfb5LrM/2Yl36bwFr4AfZJ1i5ZCtGQwIuLRfsSZVgkmCBS1wNaIgnGoKehl
         T5y1ugr924/PuGGaXQB6i1XOI0ewFRAKLDOttW7a47y7486sLA5Q9tJC03O/s4qcLCdv
         6KRQ==
X-Forwarded-Encrypted: i=1; AL+hErHw9JsUOzPHdTyeHTQIBClUZiJ47WPBbeSmUzbfeOpjVnWZPy6UdaGwydzYIcBcOpoKDrwD@lists.linux.dev
X-Gm-Message-State: APuU4Z9mRCs/A7mlFRzyVNW8KtL7ajwjkxzIv6SQ8LcfQP4rjoR1MWB7
	fQjcam7WaWypZFOGGgwcCCIEWvUhU2ey+08SdBV5mA6jzeGp7PWpE6c2jlP1ehSRA6cfk5o0uhH
	S2erbBZVoP0pRaFHnTGqvUpnviksHzl2x+qDoqbBo
X-Gm-Gg: AYBFou21EkFF+cV6SdDm4PAB4DI7Fvy4IEBex5QHAz65Uz2bMVIC9/SC4pIv7WvDKj9
	K+PsBxRIpYeqGQN4LDYr8ttvyb1e+wDXN6W2BQXaQFutsE3w/ZwIyTsFaJLUqRGcSwlGajT9H+r
	16Qjnd38dWWlz1cSLykbGYc1P5JRRiOgk3xUnRhR6VAL3p5b0JHhE6YwykXoZ7eR+jfVPKUTXYl
	IhKj3/Ps0M2GDkODWhtfFcUQ8s0Qc/tei56r/9HmYRBTn12kowLi9WsQ4FbwEVoOTPq502PvH9F
	HyIwqHwsRChtkmD5vN+65+6WdNhrMewZGX0RYAvfOnxNKj5YcHDMYnce0OARIuq18lOLovvw78n
	w1Y6ytsvoDboA93rbZAuYJTtUYEOA/+C8Nif0Ul5ARC7x+HIGgz/fhwvPmaI4sXqt5Zlyi/GrBm
	Ree8HUXO9FyKyoSYdLoYM9FzFhQpGiltTfyIvOqct/KU0PtykIY5ondbf8Fj53qh2/P2doC+MqV
	k2VK9/3jbyePFXrIAQiK5YjRH49RGoEKRbj
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id
 5b1f17b1804b1-4bb88809950mr22312695e9.17.1795127295355; Thu, 19 Nov 2026
 14:28:15 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119213147.1094488-1-usama.arif@linux.dev> <20261119213147.1094488-3-usama.arif@linux.dev>
In-Reply-To: <20261119213147.1094488-3-usama.arif@linux.dev>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 19 Nov 2026 14:28:04 -0800
X-Gm-Features: Aa3M54rGe2WhCo8NjeyvCl13h6yYFCLQD9z1s09DtfOo7EUnkavEum06rHONXb8
Message-ID: <CAKwvOdnzNU_xtLeb4vXSFe3DLN9QmdNSSReUmQahsLX+1pZxCw@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/kstack_erase: Use REP STOSQ for large stack fills
To: Usama Arif <usama.arif@linux.dev>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, kees@kernel.org, hpa@zytor.com, 
	gustavoars@kernel.org, ardb@kernel.org, hca@linux.ibm.com, nathan@kernel.org, 
	morbo@google.com, justinstitt@google.com, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, riel@surriel.com, 
	shakeel.butt@linux.dev, kernel-team@meta.com, rkeilty@meta.com, 
	atish.patra@linux.dev, dgreid@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 1:32=E2=80=AFPM Usama Arif <usama.arif@linux.dev> w=
rote:
>
> With KSTACK_ERASE, every return to user space poisons the part of the
> task stack that was used since the previous return. The generic
> __stackleak_poison() does that one word per loop iteration, so a syscall
> that went 1-2 KiB deep pays for 128-256 separate stores. On Meta hosts
> running many small VMs, stackleak_erase() accounts for about 1.5% of
> non-idle host kernel cycles.
>
> Override __stackleak_poison() on x86-64, as s390 already does, through
> the hook added by commit 491a78663e03 ("stackleak: allow to specify arch
> specific stackleak poison function"). Fill spans larger than 512 bytes
> with REP STOSQ and keep the word loop for shorter ones, where the fixed
> startup cost of REP STOSQ does not pay off. REP STOSQ starts to win at
> about 300-400 bytes on Zen 5c and Cooper Lake, so on both no span gets
> slower.
>
> The fill is inline asm, so the noinstr function still makes no calls.
> memset64() would be the same instruction, but it is only static inline,
> and with KMSAN it is an out-of-line function.
>
> In a Zen 5c KVM guest, stackleak_erase() got about 35% cheaper per return
> to user space (71 ns to 46 ns, scan included) over a futex, epoll, procfs
> and Unix socket syscall mix. Same-vCPU futex wake/wait and Unix socket
> sendmsg()/recvmsg() ping-pong round trips got 5-8% faster.
>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  arch/x86/include/asm/processor.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/proc=
essor.h
> index 77488ff5eb8c7c..049231d484ad0e 100644
> --- a/arch/x86/include/asm/processor.h
> +++ b/arch/x86/include/asm/processor.h
> @@ -580,6 +580,31 @@ static __always_inline bool on_thread_stack(void)
>                                current_stack_pointer) < THREAD_SIZE;
>  }
>
> +#ifdef CONFIG_X86_64
> +#define __stackleak_poison __stackleak_poison
> +static __always_inline void __stackleak_poison(unsigned long erase_low,
> +                                              unsigned long erase_high,
> +                                              unsigned long poison)
> +{
> +       unsigned long count;
> +
> +       /* Short spans do not amortize the startup cost of REP STOSQ. */
> +       if (erase_high <=3D erase_low + 512) {
> +               while (erase_low < erase_high) {
> +                       *(unsigned long *)erase_low =3D poison;
> +                       erase_low +=3D sizeof(unsigned long);
> +               }
> +               return;
> +       }
> +
> +       count =3D (erase_high - erase_low) / sizeof(unsigned long);
> +       asm volatile("rep stosq"
> +                    : "+D" (erase_low), "+c" (count)
> +                    : "a" (poison)
> +                    : "memory");

Surely this isn't the only place using `rep stosq` in the tree, right?
It's not, see memset64 in arch/x86/include/asm/string_64.h.

> +}
> +#endif
> +
>  #ifdef CONFIG_PARAVIRT_XXL
>  #include <asm/paravirt.h>
>  #else
> --
> 2.53.1-Meta
>


--=20
Thanks,
~Nick Desaulniers
