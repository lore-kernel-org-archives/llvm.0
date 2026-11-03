Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793726644;
	b=39AYWnhAQIDJyBCR8vLJ5MKfi7V3ckRxQstq0UEhMa4KBeJYJ7eH+uLX4GIvr/aNy6AT
	 e8G3CCAm+gTENYI6sqD1odRwMb/6rBQheWmj79Be/vji9klL6riV38J8eq8TuBJ8JIow7
	 S8jPjr4JuPf0GfWu2V4VsLC1Tj5aaxaItEMZr5p4W9uOXKWKTzxZNjQsG+F/3W5bOM5Z1
	 GMWzgKBOGQBDI9oxW+/2Y1n4eH3hfZYPErvOhdeMI0D/zG+sEEn1Xthv61eEsWxPK77hG
	 UMaluuaR51SH//P6tm/KnNqEtPlzX8MVBadVbRcSCDtfYhrGZMaR0gpwkCVMx3UoeUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793726644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KH5rnR50iDzpBeli+MkfX7fiAl3GikgWrgJ0zxm2Avw=;
	b=MaBUXwNVmlQhyP3f7z39YZEhdf9XB2jlZdU6gCgfLONO44/eX6fVwsPvu3tGEOV67R4n
	 V4ZamghKecLVxKL26voBgyxochCL2ad78bGZg24cLv/LgU3YVav5jFRSqMKwKFGoUrxW9
	 IToOwGTodlhmTAf7ajcQ66WWgWyOs836EpJ4HN1WaigC47HRJgJfSnFdkFdoLOObc7+T+
	 k948Fi2RCzGkLiGAm98SoNdb8/Ku8X5eFA7jZpwXCEiLiS8yj8TXZsRUQasuL8n5ZkqT5
	 /wZIWmXelL5OlDc/eWOg+/lEq08nkrsem57HRJNzMKrNxyHVofBZjQI1wDbuwyloNpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p2J1Quwx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3FC606A328
	for <llvm@lists.linux.dev>; Tue,  3 Nov 2026 17:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B3FC606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p2J1Quwx
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b042c0759so2430374f8f.2
        for <llvm@lists.linux.dev>; Tue, 03 Nov 2026 09:24:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793726642; cv=none;
        d=google.com; s=arc-20260327;
        b=U9MsFgkiDMOiNIlv/3bVgOcnJBHRX9GVRaC93RQMNNTvGSUIMwVKU6MqmcI8fQ3IzZ
         /jtyxCYOeOziVbri8NigJqec+/zJfMwFnQXW6fupq2VtLN1XOH7G3BdzJEO/rjSHMB3z
         tZLGiTrEtQcCS3R2mkRUcVLLJnJgHYQKVtDihQ/XwIuCK/PQJlsJs+qJuFPIksdU5p7x
         1vHxwEQUHQz/YfDJtWMaOaCjvDkP8WQqNAPZyWTEANHyVn4ioRaT2HbKRCh9/gNH6gQ0
         U4JKJ5onXIuY+UzGeNEYr7v2C8b+UyURC9l2N+IR2MHbbGCUMWbe4D62nlnp9LAL0ekZ
         Pu9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KH5rnR50iDzpBeli+MkfX7fiAl3GikgWrgJ0zxm2Avw=;
        fh=q9Bjh5QM9KXHzQxn91Nds4DDKv0angs/NPqfvVg390U=;
        b=VvDgFh1DwwS8AGXmrrI6ujCLbg4Yt1DFvJcALoQUAISi1C8fcmFDUV+a+nl+KUv5tm
         ZYep8qRyCvT5CYiybNllOIRsfV/ZLQVT85QT3RD6mdPLDiSupfMZMdFD7XZ1QUTydowc
         /kIqt34fvHdWrcl8MNYegyy6m4jFW+rhsgCrIhvZ4vRtJMhzSd10qiImE1cSXGaBejze
         5nz38frMY99Vy3rZDHdbcYKcaTBxynkw5zfeFBoIjCSiwD5c+wYYKwmTRwOgTxDk0rma
         l5X3ynBY1PpKKc7gAyxxOoEZFALQyyC6Rd5+WHfur16ZXhYLnQscg8Y1fzOvx/8WhYuz
         KsGQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793726642; x=1794331442; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KH5rnR50iDzpBeli+MkfX7fiAl3GikgWrgJ0zxm2Avw=;
        b=p2J1Quwx+/euenNlbYYKL9LVDos938SIBlQINEPScLN8RleW3kbL1w2iAfL4YwRDBA
         U/a/occf9EpNQKqKYiUFAjepBfH5ejPrq3qspYEAgpA7eyXQSmakDEMt6g8GinGi8jWv
         xxq+KWYzGGH2fi+ujG0+9HzwqeIsAvIbML7xWGHhGrwd9JwbI/NVv6xvU3Hjq0NL0ED3
         4DlckPXnk6otYOAhAOguZFMgSacYt8NEPfhuVVNeMeC+dxTCjbrIWVtwj2yuLaSW3xsi
         xZVhNMQzVlRC7cgvhR6e73REZuJMNP6/FDMMzkg98yr25bW3efW2Yvt5L9l2ySmpnYdq
         OXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726642; x=1794331442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KH5rnR50iDzpBeli+MkfX7fiAl3GikgWrgJ0zxm2Avw=;
        b=ybIp4yMzFRCzt4On7FlC/5UXkCLlEpEbBYKxAlQZ9cimf7uAEu21EHLdbB4EEoQe5W
         MZ60p691fAWkGbs/bz6RSw4ilBfTYj3ISpduYOgHix7TkPIRxuCrquaPcuRALCYqBJZg
         6YmiIr05vou66WYsg/eNefyiiuHFlGu7mz1Azspe9oBedoh1sJ9nzJCoUWia3IvRk5U0
         KsWuWPlAzfbvw4TxdauVz/TkfZefWsTpgYWglaOrrCX+Oe60aHR6W75W3nKMQUB9O1Vc
         kNzxrG2rHijFii7aGEdO2ZjkUU+CChgx+7rrmHj6ap+2k+WmgdJ8TGaicz7gZcrXLue4
         Vsbw==
X-Forwarded-Encrypted: i=1; AKwUvBxBDkt9dHjU0oB4vcNdj/JjzS7ChfAA875A06L8MIgaI6HpH5SMC0xunBi3otHC1UfcYgDg@lists.linux.dev
X-Gm-Message-State: APuU4Z+kPlf8ZVA4VV3vYEyhjm93Bi1iZAbEXwBh/0qpxVlFpJfr2pK0
	qreF2y31pmwFLqnZL8Uwod4rQtq1WihLqBPaqpj+Zy9vJd5DLNk8OFmnIJzUf95HcXGNBcYzNRI
	ooXALw6o11bDB/6zWCLPaSAcjsk/930+qQWnEzIu3
X-Gm-Gg: AYBFou3avB6YOyWY+z2/FhX7u6pLk1Mg/16NrdVR5jcLzKR/gFKv97ToLKv/OXaKiAU
	kiFcxDGCJSrSJBkNRBvYsEffAjFt7Y1Utj07+f350iDuUqVVT6+oleut/6ubwfUAcp5l0J1nCoj
	h3v/Fy9cIABop7+NLjmK+/qv1E7JL+iGGYm6v6GahfcyB7PIyHQPsDxNsK2DH4Q37wOGBkQ05Wb
	g95yCbRiJHic0yNVxwxIAQYCXajNdM6AsorrG3CbXQlj9mSoFa0WfDsft+VEyeX4vBd1YxUla3A
	WgBP+eQRxStRwmOkuRxloZY9KU6gy6hdt6K72WLntQto3xPEOUZlEN8rUg1rCBkNEsNdnzX4yMm
	U96XtfpY+0GnNhRXjL/PJB1YeQhncWeWB4v+IjYGqsLJcLumpPLtGw9s2ih44FkEgT7H/OnoA/m
	4qFvK3ae1oE5jXMfOjieUyMyG5/NJs54oricfiHo4ZeUsmvt4tD98XCuEBU8l1NtRmla1d6Y69N
	upkHgpTUT0WDGuITH5OKUmzAtqaqn2uZGUdkcKK
X-Received: by 2002:a5d:64c4:0:b0:48c:6fa4:fc89 with SMTP id
 ffacd0b85a97d-48e6e3072d7mr33054677f8f.12.1793726641939; Tue, 03 Nov 2026
 09:24:01 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103060658.696994-1-martin.ankerl@gmail.com>
In-Reply-To: <20261103060658.696994-1-martin.ankerl@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 3 Nov 2026 09:23:49 -0800
X-Gm-Features: AclHuK-McbrGplTAZCIwqXxNNWb4QkQhAciv2_yCizkKvvgWNxpSELNrt8SaikY
Message-ID: <CAKwvOdmXSH2W0evc6XF+2yjr1qg3oUExiy-pF+LAx4_iHycu7g@mail.gmail.com>
Subject: Re: [PATCH] x86/cpu: Use prefetcht0 for prefetch() on 64-bit
To: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Andi Kleen <ak@linux.intel.com>, 
	Youling Tang <youling.tang@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>, 
	Nikolay Borisov <nik.borisov@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 10:08=E2=80=AFPM Martin Leitner-Ankerl
<martin.ankerl@gmail.com> wrote:
>
> x86-64 does not define ARCH_HAS_PREFETCH, so prefetch() from
> <linux/prefetch.h> is just __builtin_prefetch(). The kernel builds with
> -mno-sse, and clang then drops __builtin_prefetch() without a warning,
> while gcc emits prefetcht0. An x86-64 defconfig vmlinux has 8
> prefetcht0 with clang 22.1.8, all from inline assembly, and 62 with gcc
> 16.2.1. Also prefetch_range() is empty on x86-64 with any compiler, it
> needs ARCH_HAS_PREFETCH.
>
> Give x86-64 its own prefetch(), a prefetcht0 in inline assembly, which
> every x86-64 CPU has, and define ARCH_HAS_PREFETCH for 64-bit too. Not
> the 32-bit alternative: it becomes prefetchnta on CPUs with SSE, a
> non-temporal prefetch, which would change what gcc builds emit today.
>
> Afterwards clang's vmlinux has 57 prefetcht0, the new ones in 34
> functions, e.g. __blk_mq_alloc_requests(), prepend_path(),
> __alloc_skb(), tcp_ack() and the receive paths of e1000, tg3, sky2,
> r8169 and forcedeth. gcc's stay at 62. With gcc 16.2.1, prefetch_range()
> adds 16 to hfi1's receive functions and 8 to scsi_debug, which a
> defconfig does not build. Youling Tang proposed to define
> ARCH_HAS_PREFETCH in <linux/prefetch.h> instead [1].
>
> KVM guest with one CPU on a Ryzen 9 7950X at a fixed 4.5 GHz, clang
> 22.1.8, 6 boots per kernel in turns, ns per call, median (range):
>
>                     before                 after
>   io_uring IOPOLL   680.1 (679.6..684.6)   664.9 (663.1..668.4)   -2.3%
>   getcwd()          912.9 (912.0..1019.4)  901.4 (900.1..907.3)   -1.3%
>
> IOPOLL reads 4 KiB from null_blk, 32 per submit; getcwd() is 40
> directories deep. Built with gcc, where both kernels have the same
> prefetches, the two differ by +0.4% and 0.0%. pread() with O_DIRECT, UDP
> and TCP over loopback, times() and clock_gettime() change no more than
> that. Unfortunately the NIC receive paths need real hardware, so they
> are not measured.
>
> Fixes: ab483570a13b ("x86 & generic: change to __builtin_prefetch()")
> Link: https://lore.kernel.org/20240529032059.899347-2-youling.tang@linux.=
dev/ # [1]
> Cc: Youling Tang <tangyouling@kylinos.cn>
> Cc: Nikolay Borisov <nik.borisov@suse.com>
> Signed-off-by: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
> ---
>
> Notes:
>     Code generation, testing, compiling, analysis, measurements, etc. wer=
e
>     all driven by an AI agent (Claude Code). I have reviewed the results =
and
>     supervised the process.
>
>     A few minutes ago this went to the x86 maintainers only, without the
>     lists, by mistake. Sorry for the duplicate.
>
>  arch/x86/include/asm/processor.h | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/proc=
essor.h
> index 77488ff5eb8c..64748b8705e3 100644
> --- a/arch/x86/include/asm/processor.h
> +++ b/arch/x86/include/asm/processor.h
> @@ -624,15 +624,25 @@ extern int                        bootloader_versio=
n;
>  extern char                    ignore_fpu_irq;
>
>  #define HAVE_ARCH_PICK_MMAP_LAYOUT 1
> +#define ARCH_HAS_PREFETCH
>  #define ARCH_HAS_PREFETCHW
>
>  #ifdef CONFIG_X86_32
>  # define BASE_PREFETCH         ""
> -# define ARCH_HAS_PREFETCH
>  #else
>  # define BASE_PREFETCH         "prefetcht0 %1"
>  #endif
>
> +#ifdef CONFIG_X86_64
> +/*
> + * Every x86-64 CPU has prefetcht0. Not __builtin_prefetch(): the kernel
> + * builds with -mno-sse, and clang then drops the builtin without a warn=
ing.
> + */
> +static inline void prefetch(const void *x)
> +{
> +       asm("prefetcht0 %0" : : "m" (*(const char *)x));

Thanks for the patch!
Is there a reason to have the cast vs simply use "r" constraint and
deref in the inline asm?
asm("prefetcht0 (%0)" : : "r" (x));
https://godbolt.org/z/xezh15oMe

Either way:
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> +}
> +#else
>  /*
>   * Prefetch instructions for Pentium III (+) and AMD Athlon (+)
>   *
> @@ -645,6 +655,7 @@ static inline void prefetch(const void *x)
>                           X86_FEATURE_XMM,
>                           "m" (*(const char *)x));
>  }
> +#endif /* CONFIG_X86_64 */
>
>  /*
>   * 3dnow prefetch to get an exclusive cache line.
>
> base-commit: 2305edc99ef7bbc11a8dcebf78853bc1b6a761bc
> --
> 2.56.0
>


--=20
Thanks,
~Nick Desaulniers
