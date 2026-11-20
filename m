Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200918;
	b=IcexLcPLqqVmyd/A57F3uDpM/LLODQjlPKwuJHspBm4GSyhxnKaKtHcR2g2jJGtDflW7
	 EPkF5F5+BC813o24BNLkqWi5neCeynQP6kzAp38hKPFAIiqvzZHIe8ShNbuC//acqJSab
	 SDH0xzHNx6IcH+Hu5afBgYMtFWnEmgDywIWB/zIG70VYrBnAd0xlE70+sTq0vkfnR9Skr
	 pNgMdZhauZ5eBMu8x6bs7Hppo9aXpnOQnx6Jaxj2RrNu4PS0G8SnQfGeLR0I9f43PazN2
	 jm6uZduDX26QJFZKI7PkFPG4Cp78OZyUTNGyZKk6WgDoD6+eQFy0A1uzKzzL6G0kIZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Wuk00b9eLmhHzHLvGG3EJliaZoNXCpQANQ1QWK+whx4=;
	b=dlMYKJn5eI7gk9qZrdOoV47xcSDXoSXlEMD7+2zghdDjWj08lJhBcGTrh1XHSsIwNfo8
	 x0EyhOY8xItq5iuPeR/Lb0qzGcy9fa4L1/0dkoe1n5pUSYjfjpuPuHfZj6GBF05qK4o5V
	 oJmrNiuo20XopX710y0gJKrtF8Yh6wbjzUOAZBEPFvWo43s5DM/WI+fuAkvYTDvA/3WMC
	 dlDtbKjJN9QhI0gbwfEwBF+y01iXgz67iTwpLLFoeno7s64RpX8vkQKgKox1TJktxNuI8
	 eIRRD3OVt7hc5qNiE84norTsqv4ZWEsv6Lyb6H8kTzH67YLXYBzfm9KaeLJEC+WF+ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FAxaUyGj;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE97E60A2623
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 18:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE97E60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FAxaUyGj
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b467581b98so12805885e9.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 10:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795200915; x=1795805715; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wuk00b9eLmhHzHLvGG3EJliaZoNXCpQANQ1QWK+whx4=;
        b=FAxaUyGj95rPQQgCYx8z/+3buWtbyRmhqs2elA0L/d318Of8HgwCn6gEkcbAMXnxN2
         aA97ICBAX9dFNH9j4sVuThnabAHZQRQGpNondOXeYTz3rGMESOUBak8KpC5O1ujuTK8p
         zTTfdKixN4gJ9T5HVZtRJxJn8MeGIchVuYO1FgDCZgRjBYUSRTShIrV0SQItrfPqpxoj
         0r0ageWeEqatb9Bqt4Ax5DT88A1PVrpUvHKMZRKeHFG1i/zVaZaByCiB9y0qa+T3wbQx
         I+/EMmLr8uTRAcz6f6miIdqtr5aIZmP00dnTLpchnjqAnjipOKHIbmN5OFOFAHOWM4Bv
         Yukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200915; x=1795805715;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wuk00b9eLmhHzHLvGG3EJliaZoNXCpQANQ1QWK+whx4=;
        b=IkvWjjQA7Bjsj/OqmHb+hxIlTufUADcs+Eawvwwsmpy9EKmFpfhZODlCNtlPGk7sdT
         IKKhRxHWXu28gSjhpAItMvK9pYCfzVv5/vhKe96HieCQhezi0nhQiO5mx5uuyOA6rWcB
         cIvYBI97NhGgDcsx+BEbNx51ePW/Yp1r457ea+WB3y2eGCXSJdAxFpHwQgKu8KoHSspZ
         FdNnAD6SfUbh6a23ejP2Y89yoOyzZ9KRPnWRk5QEld8AzDcnFZ7Gn2OXFUwK+sFeoEk8
         V4yGFfojeQWk7hHqtrP5zuZb3hc05TjgVqy9MhgExHQUKqjtxmPB0pWzGolE1CmrQJsg
         RhUg==
X-Forwarded-Encrypted: i=1; AL+hErE3RNKFY9EJ+IO96b/qzBjyQkYum7NnSnE0gY0rb6uG3D8UgyuQoFY6deBROLt9uOhq/OVJ@lists.linux.dev
X-Gm-Message-State: APuU4Z9bltAFtt3jrBIrTHAm7X72AnXDVnC4hfZcnEuV0ipk6wMtR2C9
	dzMUB/LpbruU5fNBc+J6F35eyG9jNEthTdGyNQWzNY3kD9kGKhZFY+S3
X-Gm-Gg: AYBFou0KUZd/p7EiSxOBm+PacRgJTxoYaJo8mISO638Qeuzm3AfX44M0jWfP17ymwE9
	W9ZLY4qLHkI51fm8AAGrOjqSFGpGTZC/SmtivKjDgZXKI9NaGyey27gW/pSzlFXhuJ8Su93jnCd
	XFBOV6ij9/KXgafEqBWi6cBUoE7l/4ZvHnNKU6//EWSF8XEE4zduyx0TRMEdxlbirH2apaNIcxZ
	ARJ+1Ul7V1JIXo1uoDAjt1q1yHQCOlE4Z19Y1xo+gz0+CiZtWSxN86l+bC8/qbyVNsIwnYRzKx9
	7NYswmyN/ncf43/MTGgPCAgNRCR8hel3sFqxxLUbQ0XFhcLN18ZDfj74NUoY0MHwsME4l3M0oJE
	6MJbpuw7clopSMuc9uk+K2h3/zG9k4mFeAnf3rJYMmY99yhJqry6GXUjrij3pqZOxeUSKW2e10l
	7YmjsDzzManKYYwre2k01BJFECJ9jzmt3L8AYweiVYK+rBc2c1XqdaZjJ8V7kSfETYYB7ts/7rN
	qZzqfmE7tDL1qc+NH+uzu6fAo9h+QhNTy4ajB45OVoiCAjD3dIMcNWQa+HXgYyJGO01vYHZ+FaH
	4iAAc6b89Y8yIgjeIPu3oD81BDVqGPim0u1jhaf6/OcheVHQ6BCLpzKuss4gj46s6w==
X-Received: by 2002:a05:600c:6708:b0:4ba:7e6:53d6 with SMTP id 5b1f17b1804b1-4bb88940848mr77734805e9.33.1795200914798;
        Fri, 20 Nov 2026 10:55:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm173162855e9.0.2026.11.20.10.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:55:14 -0800 (PST)
Date: Fri, 20 Nov 2026 18:55:13 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, kees@kernel.org,
 hpa@zytor.com, gustavoars@kernel.org, ardb@kernel.org, hca@linux.ibm.com,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, riel@surriel.com,
 shakeel.butt@linux.dev, kernel-team@meta.com, rkeilty@meta.com,
 atish.patra@linux.dev, dgreid@meta.com
Subject: Re: [PATCH 2/2] x86/kstack_erase: Use REP STOSQ for large stack
 fills
Message-ID: <20261120185513.0445f0b1@pumpkin>
In-Reply-To: <20261119213147.1094488-3-usama.arif@linux.dev>
References: <20261119213147.1094488-1-usama.arif@linux.dev>
	<20261119213147.1094488-3-usama.arif@linux.dev>
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

On Thu, 19 Nov 2026 13:31:08 -0800
Usama Arif <usama.arif@linux.dev> wrote:

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

As a matter of interest (and separately from the exact code) how did you
measure the performance to get the 300-400 byte gain point?

If the count is variable - likely in real life, you'll get a branch
misprediction penalty (about 20 clocks on zen5) every time you change
between the two choices.
The copy loop will have another mispredict penalty for the loop itself.

So you are likely to get an overall improvement if you use 'rep stos'
for all lengths - even the ones for with it is slightly slower.
Unless, that is, you know at compile time that most of the length
will be short.

David

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
> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
> index 77488ff5eb8c7c..049231d484ad0e 100644
> --- a/arch/x86/include/asm/processor.h
> +++ b/arch/x86/include/asm/processor.h
> @@ -580,6 +580,31 @@ static __always_inline bool on_thread_stack(void)
>  			       current_stack_pointer) < THREAD_SIZE;
>  }
>  
> +#ifdef CONFIG_X86_64
> +#define __stackleak_poison __stackleak_poison
> +static __always_inline void __stackleak_poison(unsigned long erase_low,
> +					       unsigned long erase_high,
> +					       unsigned long poison)
> +{
> +	unsigned long count;
> +
> +	/* Short spans do not amortize the startup cost of REP STOSQ. */
> +	if (erase_high <= erase_low + 512) {
> +		while (erase_low < erase_high) {
> +			*(unsigned long *)erase_low = poison;
> +			erase_low += sizeof(unsigned long);
> +		}
> +		return;
> +	}
> +
> +	count = (erase_high - erase_low) / sizeof(unsigned long);
> +	asm volatile("rep stosq"
> +		     : "+D" (erase_low), "+c" (count)
> +		     : "a" (poison)
> +		     : "memory");
> +}
> +#endif
> +
>  #ifdef CONFIG_PARAVIRT_XXL
>  #include <asm/paravirt.h>
>  #else

