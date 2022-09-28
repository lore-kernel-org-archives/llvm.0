Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077A2A40
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 07:24:16 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id t16so9359324ljh.3
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 00:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=n0yYYWWOm3FM1VkJi0JdAR/s0E5nigR1hAoYI8h0YF0=;
        b=FK7YeUM2hM+3XPSYwmg/icglrYf9VcytTb705GT7JOTIsY/vfzZ0B163zJRG5LmnAY
         yKzg0VzUT8eyLc3tHgXOjQrn6e7882ApK2BuUG3C0muhqwi3F5Rw21f7dOQP8gGrcgTN
         Zs/Lx5u/g7wEbjiRktiE/AzZT3Fzo3pb9BbKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=n0yYYWWOm3FM1VkJi0JdAR/s0E5nigR1hAoYI8h0YF0=;
        b=I8QevkyetLuUNc0oJDMEQ9x1KAS7S/XrvCwAYFFO/iXLqXUhQLWE8UuFZKXqjJom6c
         knLQVBjoYNPZW40oGFN0L9gCxXHyJByzYlRgViHEzpMXcHRY1ArgLaQXTQ6zY8X45oQs
         FS6qt6thKeenEy7jhtNMDF/zaoesnA4tk7eT817sVOXOekHhRZ1OMSpWxApQpHFDMXTn
         fJfyZUeTh1DDBYjZF0+inUybBoTuOSHgAUiiILssVWDtraYc5C29pmFDj35ZBuRPWDo5
         sRgaUDge+1WqmYb+3hxCKCk7xhGI0xgyFQYpIi+G2IIK4jiYzaDtUbBCVURh7wjv7u0D
         wQqw==
X-Gm-Message-State: ACrzQf0v24Ipi34RHu2iHMMN23QxCAI39wgIWcMkKzhT+mO/aV0Dcphb
	A8A0Se+6Vmlf/rlgmGHWdgW2NA==
X-Google-Smtp-Source: AMsMyM63GFfUWLx+WswRe/My7Oxb+Hk6CQOOXW0M1Do/mXBE2dXH2Bo+83G+sKA0q9y5j21iM8jZyA==
X-Received: by 2002:a05:651c:94:b0:26c:6678:7d2e with SMTP id 20-20020a05651c009400b0026c66787d2emr11389575ljq.135.1664349854960;
        Wed, 28 Sep 2022 00:24:14 -0700 (PDT)
Received: from [172.16.11.74] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id o22-20020ac25e36000000b004946c99e78asm390685lfg.277.2022.09.28.00.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 00:24:14 -0700 (PDT)
Message-ID: <a753c608-813a-f880-67ca-f16fe503b152@rasmusvillemoes.dk>
Date: Wed, 28 Sep 2022 09:24:04 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] x86, mem: move memmove to out of line assembler
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, llvm@lists.linux.dev,
 Andy Lutomirski <luto@kernel.org>
References: <202209271333.10AE3E1D@keescook>
 <20220927210248.3950201-1-ndesaulniers@google.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20220927210248.3950201-1-ndesaulniers@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/09/2022 23.02, Nick Desaulniers wrote:

> +	/* Decide forward/backward copy mode */
> +	cmpl	dest, src
> +	jb	.Lbackwards_header

I know you're mostly just moving existing code, but for my own education
I'd like to understand this.

> +	/*
> +	 * movs instruction have many startup latency
> +	 * so we handle small size by general register.
> +	 */
> +	cmpl	$680, n
> +	jb	.Ltoo_small_forwards

OK, this I get, there's some overhead, and hence we need _some_ cutoff
value; 680 is probably chosen by some trial-and-error, but the exact
value likely doesn't matter too much.

> +	/*
> +	 * movs instruction is only good for aligned case.
> +	 */
> +	movl	src, tmp0
> +	xorl	dest, tmp0
> +	andl	$0xff, tmp0
> +	jz	.Lforward_movs

But this part I don't understand at all. This checks that the src and
dest have the same %256 value, which is a rather odd thing, and very
unlikely to ever be hit in practice. I could understand if it checked
that they were both 4 or 8 or 16-byte aligned (i.e., (src|dest)&FOO)),
or if it checked that they had the same offset within a cacheline [say
(src^dest)&0x3f].

Any idea where that comes from? Or am I just incapable of reading x86 asm?

> +.Ltoo_small_forwards:
> +	subl	$0x10, n
> +
> +	/*
> +	 * We gobble 16 bytes forward in each loop.
> +	 */
> +.L16_byteswap_forwards_loop:
> +	subl	$0x10, n
> +	movl	0*4(src), tmp0
> +	movl	1*4(src), tmp1
> +	movl	tmp0, 0*4(dest)
> +	movl	tmp1, 1*4(dest)
> +	movl	2*4(src), tmp0
> +	movl	3*4(src), tmp1
> +	movl	tmp0, 2*4(dest)
> +	movl	tmp1, 3*4(dest)
> +	leal	0x10(src), src
> +	leal	0x10(dest), dest
> +	jae	.L16_byteswap_forwards_loop
> +	addl	$0x10, n
> +	jmp	.L16_byteswap
> +
> +	/*
> +	 * Handle data forward by movs.
> +	 */
> +.p2align 4
> +.Lforward_movs:
> +	movl	-4(src, n), tmp0
> +	leal	-4(dest, n), tmp1
> +	shrl	$2, n
> +	rep	movsl
> +	movl	tmp0, (tmp1)
> +	jmp	.Ldone

So in the original code, %1 was forced to be %esi and %2 was forced to
be %edi and they were initialized by src and dest. But here I fail to
see how those registers have been properly set up before the rep movs;
your names for those are tmp0 and tmp2. You have just loaded the last
word of the source to %edi, and AFAICT %esi aka tmp2 is entirely
uninitialized at this point (the only use is in L16_byteswap).

I must be missing something. Please enlighten me.

Rasmus
