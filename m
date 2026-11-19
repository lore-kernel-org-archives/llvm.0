Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068340;
	b=BoTyzfUoKiBT0XIAr06G1x7V+k1niL0zsLLjPDR1YGGXEdGjF7TGuEjZ1pWFdD16RFUW
	 5931EsgBFRmU1r49b347r3RCimTqNtKJ26R97BqOIhiWLH30fyxlHLQo6URaQ81etGgxF
	 07/0Ujw3zfsvMVv15pCEObUypZh0E6pvpxkuaHz2bLjkibfQ7T2Lc2mWFPT6e0HR2o2Of
	 D8w+QrjUbsOmYCcDgKgfufwo27cxKYvuvS7PTP1mfwjoDhnzZuHawyPSLTl1zp8AihBjD
	 UixTDworOz0XEngmGUuBpL/bTd3/dy61W4KhFj6sdssiYr1QdSUP2jh20fIL1buMvww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vMc4aruOSkVK8zcMilxIlqFWJpw0QUrvo9/nbFQ3Vc4=;
	b=zYMyrJLvhEBM69cxQOMh2Ir25k3X483htNS5+lYBoClm3CoG6qhZa3hHDQ2sw4r4S3ik
	 XXJKyZzSgfKz2E42Vmq4uJaW9XJ29IbWRk2RwhK6NfwRK2/Uiu1+w8zV0y8zyl6TABbeq
	 zzVfvgF8mU6XgdS+euM/nPC1lto4Z8ug4S4tim1K27RXTLk4IY+Awt2eQOcQClykP2qt4
	 Jnd1ppZUhVdOKe1XoS0+f5QeWKmegOJX3R+ZZa4cPrlZzq2rPW52inTrRfEhTAXGLxtW1
	 PoXJf0r36v+myPUzPuVW4Ce8dnaGfQoIu172ZfAxAH0axy0iAOB9zGgNw9aILcJYUwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rXgYYzsT;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D6A606A326
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 06:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93D6A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rXgYYzsT
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so15591185e9.1
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 22:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795068338; x=1795673138; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vMc4aruOSkVK8zcMilxIlqFWJpw0QUrvo9/nbFQ3Vc4=;
        b=rXgYYzsT4egivFlkWMF1w8SVra6QYt8udMReGTFpi94RCRI896LRQcyXCLTTPLjfpT
         lgLg9F/k3pa7GRtvuJSbmKKMu8N3oqwLm8zHP/o6YeNH6yVGsKF/dQ7JnBD1FBiHJCfd
         v2DpGbwNLKPGDQLGSKz8CePUxl6U1B6rU+sXo0VDIrIf/EZSvMXNc9Ec/+DwdIHtDEFJ
         hpF69rRbza9OlrPWiJgxkKmGeUxR5CTUYuq0N7HKhCOz0GK3g0gINn8u9ZRt3TT013an
         QqcwFGoaWAxQ3JMy+8zbMWFxvsT6mK1Y/ZZd/8bek/UD5w/FeoXtwVNuZQdFi7eYFDdo
         Yr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795068338; x=1795673138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMc4aruOSkVK8zcMilxIlqFWJpw0QUrvo9/nbFQ3Vc4=;
        b=wJOgivQdi5ZmXpFymPxpGs08jKU6SczHJxdtaS1LdUowXMX7+OiggOZA0zYTw/Y18K
         Silj5vkc/i9dMD+pvBfvX9LgoJ3u6BUdKSVfhlelHoO3mznSGTnzn1JUjwRBzwspy6vR
         CygpVfK4bnhlsOKCpFGxZiH195i4tkNz71V/cgYcsfU22CQkhbbeVzkiLHcQDUc5cvjb
         0VfcAPdd75VA+gk2GUoPC3j4HqAfSbk0cDiiPHh4A/ltmmsmMn6cBlsAiYtoWa+rLI63
         It9PcCgZSpUMvcaRRKOEU70bKNsEzdurzwJ7UTElxSLtqfcWFyfWvXs3mmpkLuJTWEkS
         wZDw==
X-Forwarded-Encrypted: i=1; AL+hErEk8QxPAgQyUhqVWFbG+WyjpJJb0Bioc3yZqi1HQOeEsRL7t2z+q1IDmzfSDMj6mit8UVBQ@lists.linux.dev
X-Gm-Message-State: APuU4Z/IlmnK7b6BWtSDGsVHZv3GfZ1dJHMbw5Oe7vSyAZpTS37Q0fMz
	heF2QjdKwKxxxStIDO8+a03Ae3W87DeH0J86iZX/FsakOZ0N+3phzVBd
X-Gm-Gg: AYBFou32PY3AgC6khfeGQwQ1adhSZx+MD2r9QeBiSAaHPYE42VhJu6hoYikLUSbPtEi
	xca/JLkv7d6BYfHnYaToPh4ZaXhQAJo8iDnHcxdSQ4fAXue/t6/KMvIbAR5DSyNnSfHGIAEueye
	ovY4BOZPYprU74rsQyIO0fZ5cpbApC3cV1k6JV1eNcb3aYzc4gC5Z/+6/X9MFZ0ZA7h2Qq8Vwqm
	bHydR/E191/DDwAQ973CT8zptyXxv3DKzWkpkdmVkgts+54z+wabn2vLhOYauOkucwtB8763MVb
	u9VrGEx/3HspTLAoSq8NTITm/T5FEbEmL4v/TtbgJ2FDBCcE5zjHc0v1nMV69IOE10owTdF+Bf5
	5VHtMPU5e2Db69Q6vO+UR3uoOObS12R0H8mjEH5jIqdYwm8dbJDWoe3g1nNDk60dj8NLK4IIA9V
	hoeWC6TH8mr131S0ionJKJnFhKWfZkW04XSA22+hIleXBMrw7T9WfE1cKYURSxNSwr2+LwPrJ5f
	F0RgLqK7RlTq8PJT9XLFiwvwa3WisByf0HxiCHfO+HcYIv/9P0nu63GQTl0O8MOEZuNqpJDFxsR
	KIXgy0GLSolrI6QVISLDCoP2IA7rLaCiICjoUfVbzbIYHmuyHy5x1u6et2ELQ/AUWERAjgpA0sC
	5G4iGMA/1+g==
X-Received: by 2002:a05:600c:1f84:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4bb7da236c3mr89793525e9.24.1795068337735;
        Wed, 18 Nov 2026 22:05:37 -0800 (PST)
Received: from localhost ([77.237.186.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2ecd0sm9324322f8f.8.2026.11.18.22.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 22:05:37 -0800 (PST)
Date: Thu, 19 Nov 2026 09:35:30 +0330
From: Ali Nasrollahi <a.nasrolahi01@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kees@kernel.org, nathan@kernel.org
Subject: Re: [PATCH] x86/cfi: mark cfi_debug as __maybe_unused
Message-ID: <av6OwOx3psCYzS4L@zephyr>
References: <20261116173027.229752-1-A.Nasrolahi01@gmail.com>
 <20261117183505.GL1813469@noisy.programming.kicks-ass.net>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117183505.GL1813469@noisy.programming.kicks-ass.net>

On 26/11/17 07:35PM, Peter Zijlstra wrote:
> On Mon, Nov 16, 2026 at 09:00:27PM +0330, Ali Nasrollahi wrote:
> >     When CONFIG_FINEIBT is disabled, cfi_debug is never read, but
> >     alternative_instructions() still resets it after calling
> >     __apply_fineibt(). Clang 23 diagnoses this as -Wunused-but-set-global
> >     with W=1, causing a build failure when CONFIG_WERROR=y. Mark cfi_debug
> >     as __maybe_unused to account for configurations without FineIBT.
> > 
> > Signed-off-by: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
> 
> Does something like so also work?
> 
> ---
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index efbc11f8c336..9bfc36566e17 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -1195,9 +1195,9 @@ void __init_or_module apply_seal_endbr(s32 *start, s32 *end) { }
>  #endif
>  
>  enum cfi_mode cfi_mode __ro_after_init = __CFI_DEFAULT;
> -static bool cfi_debug __ro_after_init;
>  
>  #ifdef CONFIG_FINEIBT_BHI
> +static bool cfi_debug __ro_after_init;
>  bool cfi_bhi __ro_after_init = false;
>  #endif
>  
> @@ -1894,6 +1894,7 @@ static void __init_or_module __apply_fineibt(s32 *start_retpoline, s32 *end_retp
>  		break;
>  	}
>  
> +	cfi_debug = false;
>  err:
>  	pr_err("Something went horribly wrong trying to rewrite the CFI implementation.\n");
>  }
> @@ -2281,7 +2282,6 @@ void __init alternative_instructions(void)
>  
>  	__apply_fineibt(__retpoline_sites, __retpoline_sites_end,
>  			__cfi_sites, __cfi_sites_end, true);
> -	cfi_debug = false;
>  
>  	/*
>  	 * Rewrite the retpolines, must be done before alternatives since

Thank you for your review.

Regarding this:

>  #ifdef CONFIG_FINEIBT_BHI
> +static bool cfi_debug __ro_after_init;
>  bool cfi_bhi __ro_after_init = false;
>  #endif

FINEIBT can be enabled while FINEIBT_BHI is disabled, for example when
rust is enabled. In that case, the declaration is compiled out while
the uses remain, which naturally caused my build to fail with an
undeclared cfi_debug. Maybe you meant to put it under under
CONFIG_FINEIBT instead?

Additionally, I kept my original patch limited to the warning fix
because I wasn't sure about the effects of changing the reset. With your
change the CFI_OFF, CFI_KCFI and CFI_FINEIBT cases return before
reaching the new assignment. Wouldn't this change the behviour? or
perhaps that is expected.

Cheers,
    -- Ali
