Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183325;
	b=M+KD6LHY0+WeSY9g57xitKPsDN6bk2GxN+LhejWLv6AlmmNKeq6cBhGrTkb7vPlv1A2S
	 LhSGjbf1SKnpO7z3LUxRrvcDTWdZIPm/FmVy+1uhTmrIF6cliWZ85Pg6n2EUNfLlzPMRl
	 9t38Wclkyuql7viqK3owGTYFb0Pg72DuNm0qoyBnSh6Svb3zPXc0RNTtnReFqCC3AxoDj
	 025S51UoL/csEknLgF+zg/jdT3XCUeBWhI6V82QERke6qDSMR2hWaEjjN5yMk/YkKb6zj
	 CeMpspph9l9uTpQG0IcahN+w6r0cLbKkB3nwjhWnafRFun5IA+JzYX+W/ng9nsWnLxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qjFQvOSN/xEWYiaNWNXazpqWkeGzMcxSM7MbYU6r+yA=;
	b=Mrcf3gvLpr8Y/P3K0f4iQbcfZ14oNlUIRmQb9Dpx2Mc9DljN7gqHH9oOVFi/UYSLrHrr
	 0KU8m5NcwDAQhS2zgv3lw944HDgR0RDpPNhYhmE9acZTMZANcd+lFmKtSjatsBHtp4X8C
	 KMxMt76+6vcab3aadd/v2pYOYbCttqA71Zw6zV9xpQ5YjykKkygEY0ULMZCbp1w4uRRbX
	 97EWivhYA3c/z7B6F2nk/0LUZMLVW34pwUdYh8EVCnwkq4gckj+4YUtBua4SMygrAhCNq
	 HYQRHOmzYTWkINbVOTDzMhLoPrWcVhLm3oaBI4RJCxSKCbBLbEFa4dnR6A2bjGlfhbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lhXAp/JL";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C939F606A33C
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 14:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C939F606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lhXAp/JL
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so8216295e9.3
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 06:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795183323; x=1795788123; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qjFQvOSN/xEWYiaNWNXazpqWkeGzMcxSM7MbYU6r+yA=;
        b=lhXAp/JL8zBx9/K/mjgVzORwaWvw4UvGKNp4g9XF+LuUTRWGI6qx4OFeOlzrR+LhwB
         aCKBc3onisJAr5tDXyePsrPW2wCT3+Ww0gpvejrw5wFHy5osDVESN0WZrQJjFJ2mIl3m
         xVZb6tjPlIPeYkq6pcR6NMHoSUTy3vUpcdR8mKN66fuOE1XNwNCHaNVBYuFdMbIrkWiw
         Xi4vp/6vkgZ3Tkuoy1S6M0+jRDq1kdYBrbKtF1lM3ubzYuhuLTXWw/ZfuMG0ukjlH8Ee
         E3HC8cc0ekjGrhzTRaY3VEctzu+SJR9Kg2QA0K/N8XqBtl0unjqNSkIzuAaFj3m/GVT9
         sLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183323; x=1795788123;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjFQvOSN/xEWYiaNWNXazpqWkeGzMcxSM7MbYU6r+yA=;
        b=aKGnyX0a/zl7AsWGYJt7Gp9q0gV4iH1wS6+pkQHu7gQ4bfHAm84iPgqtQ7YaDMkntA
         xnLFEG/U+m/44sXJ/Hcq08VQsUrt6v2KuJ608GxxUwGFA9ccPDQtrEUzSbH7rf0mEeRj
         xhhNAwtjnhYcCNQIeZ4TGOu8mP4dXKewCjJoRw+mWZVHFbSQiQlqP1FSk/C+1y4Jury5
         W5jp5iLjBQgeNydpsc6CHEnaXcdKSC6OWHXNqTJpKQffjr+3SeiNmbQCwDE+D1+zXhYN
         cbubqnbWV27LQT9ovslMuXPVDSke1wra4wz7GOTJ0FSfLKy+ZW6fZnRIa2DeqxP+1ZZI
         KGjw==
X-Forwarded-Encrypted: i=1; AL+hErGL5AyR+Lo90VeGVEelytkLs5ZqXYwYj2Z8183pq2twlhBuV0cCcoiZnKrrPHsSfyzmTWZf@lists.linux.dev
X-Gm-Message-State: APuU4Z9Wz/8ywGtjIq0MMNgxTSeGrsZkfw426Uise9PblFezBHDhVaQT
	egdeWRsLBBfGiybAsQTLH6f9c0+2zufmYLXoUJTUkdmrEyT3wBcE7akt
X-Gm-Gg: AYBFou2FsK6creQ1fHYYBxuQ4uHl/rZMCrIFexX+EJI9lp7PmyXOgHbcVa1+sS7lyBw
	EPRnxBVSHxTeKalxIQvXdmVITK8bjzy5SkC99h9I2MfFEtSLqwNAOtFsMGgW5YR/daPVMhN155W
	uRqoqEo5X1VSXbvHwIf4hZPSOPbFM4h41UMP1tq23A9aJvhjZvFRhyMy7J0wg2L4FSY7Kve48jN
	+BihOjSBVks/nVo71e3Z7lwfsOqlUCOxZMwq4mgtitbhhmgS1eK/bwziQSYetmVtM8eoltN0Xpa
	da58g6TzeFr5T04nDwGxtJSWx1adZsIdDHfQtieaN2FVCgbE1FwYwRGBrHE37m39jK1nKcs+GsN
	nOJdpojEeGvLnNj9S4C7lVXnUcPyHB3pnG+S6/quCrE6vFbiFdRcbiy89i5VbIE5pPr4X6NYbm3
	nwwcPJXXzqjGgN/5RB4cyTmMzMe+nTAaMchsgO+Kyhoe4kVLFpRVSp9aP5sfGUYq22w6g3cEnLY
	5MHZXek8nCA9wc+iPFzfxeqQwR90k5dfoeiWM4uWjD7bsolLF2lfmXk5h5VdeEyCoCM+iG8DgG6
	xd1igifgcYvyvvG8nd/tIP4mYiOkC7OFzcndCLI20f/ro1SzM8tLVyxJGVGIiMwfGA==
X-Received: by 2002:a05:600c:b8a:b0:4bb:7007:4a5a with SMTP id 5b1f17b1804b1-4bb88817772mr71755705e9.23.1795183322969;
        Fri, 20 Nov 2026 06:02:02 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c248b75sm6021278f8f.54.2026.11.20.06.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:02:02 -0800 (PST)
Date: Fri, 20 Nov 2026 14:02:00 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Usama Arif <usama.arif@linux.dev>, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, kees@kernel.org,
 hpa@zytor.com, gustavoars@kernel.org, ardb@kernel.org, hca@linux.ibm.com,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, riel@surriel.com,
 shakeel.butt@linux.dev, kernel-team@meta.com, rkeilty@meta.com,
 atish.patra@linux.dev, dgreid@meta.com
Subject: Re: [PATCH 2/2] x86/kstack_erase: Use REP STOSQ for large stack
 fills
Message-ID: <20261120140200.53ec2557@pumpkin>
In-Reply-To: <20261120104534.GO2668564@noisy.programming.kicks-ass.net>
References: <20261119213147.1094488-1-usama.arif@linux.dev>
	<20261119213147.1094488-3-usama.arif@linux.dev>
	<20261120104534.GO2668564@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Nov 2026 11:45:34 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> On Thu, Nov 19, 2026 at 01:31:08PM -0800, Usama Arif wrote:
> > +#ifdef CONFIG_X86_64
> > +#define __stackleak_poison __stackleak_poison
> > +static __always_inline void __stackleak_poison(unsigned long erase_low,
> > +					       unsigned long erase_high,
> > +					       unsigned long poison)
> > +{
> > +	unsigned long count;
> > +
> > +	/* Short spans do not amortize the startup cost of REP STOSQ. */
> > +	if (erase_high <= erase_low + 512) {
> > +		while (erase_low < erase_high) {
> > +			*(unsigned long *)erase_low = poison;
> > +			erase_low += sizeof(unsigned long);
> > +		}
> > +		return;
> > +	}
> > +
> > +	count = (erase_high - erase_low) / sizeof(unsigned long);
> > +	asm volatile("rep stosq"
> > +		     : "+D" (erase_low), "+c" (count)
> > +		     : "a" (poison)
> > +		     : "memory");
> > +}
> > +#endif  
> 
> Gemini seems to suggest 16-32 words would be sufficient to amortize the
> REP STOS setup.

That really does sound like wishful thinking.
Especially if you go back a few generations on the cpu architecture.

> It was also adamant I try and unroll that earlier loop.
> 
> How about something like so, does that make sense? Also, I suppose we
> should make memset64() __always_inline if we use it here. I'm not at all
> sold on the unroll here, the asm is pretty horrid for what it does.
> 
> ---
> --- a/arch/x86/include/asm/processor.h
> +++ b/arch/x86/include/asm/processor.h
> @@ -28,6 +28,7 @@ struct vm86;
>  #include <asm/vmxfeatures.h>
>  #include <asm/vdso/processor.h>
>  #include <asm/shstk.h>
> +#include <asm/string.h>
>  
>  #include <linux/personality.h>
>  #include <linux/cache.h>
> @@ -580,6 +581,33 @@ static __always_inline bool on_thread_st
>  			       current_stack_pointer) < THREAD_SIZE;
>  }
>  
> +#ifdef CONFIG_X86_64
> +#define __stackleak_poison __stackleak_poison
> +static __always_inline void __stackleak_poison(unsigned long erase_low,
> +					       unsigned long erase_high,
> +					       unsigned long poison)
> +{
> +	unsigned long count = (erase_high - erase_low) / sizeof(unsigned long);
> +
> +	/* Amortize the startup cost of REP STOSQ. */
> +	if (count < 32) {
> +		unsigned long *ptr = (unsigned long *)erase_low;
> +
> +		while (count) {
> +			switch ((count-1) % 4) {
> +			case 3: ptr[--count] = poison; fallthrough;
> +			case 2: ptr[--count] = poison; fallthrough;
> +			case 1: ptr[--count] = poison; fallthrough;
> +			case 0: ptr[--count] = poison; break;
> +			}
> +		}

That looks horrid to me.
You want as few instructions (especially conditionals) inside the
loop as possible.
The Intel cpu will execute a two clock loop and the later ones will
do two writes per clock
(zen5 will execute a one clock loop and do two writes/clock).
So you want a loop with just 4 writes and the loop control code.
The 'pointer add' just needs to execute at the same time as some
of the stores - to avoid lengthening the register dependency chain.

For this code, can the length be a multiple of 32?
Also on some cpu the 'rep stos' might be twice as fast (per byte) if
the destination in 64 byte aligned - true for 'rep movsb'.

David


> +		return;
> +	}
> +
> +	memset64((void *)erase_low, poison, count);
> +}
> +#endif
> +
>  #ifdef CONFIG_PARAVIRT_XXL
>  #include <asm/paravirt.h>
>  #else
> 

