Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E6286250
	for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 22:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769468156; cv=none; b=PVEtVMB5EHqFpESOBd9cLWhMBWnqXzqqLiQBQPC6eWo3MV+JYEglqcdGF5wQAp952kZ3PVDFVVwI/0rQmrJIgfQUPEyl1V9gSBZqJgK1lJ0PkNhdaLwUUV8Ymj1SdGpzgWwa4S+B1Wof30w1ez1A3uILoqKrCaVAl62a1cRgztM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769468156; c=relaxed/simple;
	bh=YO6I+oOwPvpy+5QZq0erhp7w5mJ6l7+UXtplL2rDHIE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NCYpT/kX+zafBdt/9dSjA0HFsEqq6pfkg8qBa5J/0G/pBNc47FCpc0suUoePhY/Ts3EpojCqW9WsRQNb+xjssTggvSscOu/GRFyRNJ1Ynf5rQudalS/wOxsd8S3fL2xgCRL0MndF9TLjv5drJAp3/usJbaSEoraiIT0O6FuUO8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsyQu6sT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsyQu6sT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4359a16a400so4517467f8f.1
        for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 14:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769468154; x=1770072954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IjqB7GheMfendzLAj5XKvDdIe71cAYrEVZFcl0Ddts=;
        b=TsyQu6sTx6KxNkP1zlebJ9y3/tFC+PTTDq4G0f0+2QT5L8cAj+ULH0Cnz5ZMFu0Mkc
         czrbuj8unMC6hT30hppqw0a24AtGdHb+UTgNudlYKDYEIt0wJg+xqqk2nSf85k4NrDjL
         FlvplbqKYIcBGj7FMUvPzpMFbylyKq6JM15dtS+ubclOgTt9Jd7IjXKaCRIOL2W7NtGq
         lGbnpaSGr/SXFe7YtdrkrmCYidD/cWA3L8K0zYSQYjwu92wlwTzOGYbipg3wRrQzcpAa
         OEEUDaB+6ETjBfniJJ0+i5cDg/f9eSA3KxSCvJiRDH1d3vKm4H4HRl/HQW4hY1AGGjAy
         0zTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769468154; x=1770072954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4IjqB7GheMfendzLAj5XKvDdIe71cAYrEVZFcl0Ddts=;
        b=OAEGEXYUjUzkANu+ExHSC+/Lqzv0v4sAs1vXQWJR73OnihGehK75PutvaNVlhfamm+
         Dc2distYVmAdlsc5wSqpaULhNzoIP5r+/jBW1ojhmD0ox/qa6ssfjAdpd7RRfpEOzJ2W
         sk3QMU8iVDViB+zpXxDBwhiiiCX3h3/xVNx27BnB35ng7g1k/6inKnot4MgFmrlMcZdD
         hyh5ecex5bCugLWENIXI2kwMLrtZ4iGYv6Mn86eoTFrsPTPmYZyvdofVzf7BM+ywXZOo
         pcAFIXRUvw8cuCRgs4VVdJewZoWQllAA3GgjWUNfNe7wE//H/3jrOnl6LWyhbNwUp1jp
         qB9g==
X-Forwarded-Encrypted: i=1; AJvYcCU9YF2oHZY4VByDusribB4h16uixT2Qwf44RfysKVn8rd7POkQ/qVtywhXHJOBCP+OtG13U@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn749FbSiocvmHQoGSsUaTdIroXa5gs+PA9W5ODVKHaZ8OlNVo
	9qZnmYyjkaqMMUHLtbO+XRQmoy1yGVB8lhRGSO5GPZa23kZ9qM/76Vo5
X-Gm-Gg: AZuq6aJ+f96B9y6O7HRObAVcGkN49lMoJLZ1vZscU9beROfnFk1zFJEqK5Nse/B78sm
	HNk9JiCo1eqCg2A07eGLbB9Crqq4vcllmRPrObgpbvS6pSeFDSJuKWcabKNDw37GzfVcvgdhqjq
	SENQhuZgqTqoQ7O8Qf8bMJEqlOFN0hEdKk0fLnrLVVwoFYglk0NaHVPNHECgJdgOK8JE1by0Wjy
	4Tpgkf7s+ZTP/8WjuNLIeS0XKjmQzXTs7XU0ilHA6R9YHErEHkQqzNuVsHDHGHt3AxBYV4GsRRG
	ZLyFHjTUYw9NJVjtH8jtSP8NVp3b6wzyCOMglppKzLYisxgCS0R4MnKIqqUUgJkOJBo9i2XteGf
	CROIuUxfVLL6H3N1b2S2jcWni/lWblJrh+wVrRydXrC0it7FVZk3U89kJGzhbVTkpu+cV8rC0Xm
	2TO/WrGDoE21Tv++IuAF7ZRsf9aTfWMUO8urYKxoE/A70qvZX2vItY
X-Received: by 2002:a05:6000:2483:b0:430:fd0f:28fe with SMTP id ffacd0b85a97d-435ca1ac717mr8971008f8f.31.1769468153426;
        Mon, 26 Jan 2026 14:55:53 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02c91sm33226100f8f.9.2026.01.26.14.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 14:55:53 -0800 (PST)
Date: Mon, 26 Jan 2026 22:55:46 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, Waiman
 Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>,
 llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260126225546.30d96049@pumpkin>
In-Reply-To: <aXfGcIpeXQNRUI-A@elver.google.com>
References: <20260126002936.2676435-1-elver@google.com>
	<20260126002936.2676435-3-elver@google.com>
	<d3295c84-da15-4695-8110-7e04cfaf1419@app.fastmail.com>
	<aXfGcIpeXQNRUI-A@elver.google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Jan 2026 20:54:24 +0100
Marco Elver <elver@google.com> wrote:

> On Mon, Jan 26, 2026 at 08:56AM +0100, Arnd Bergmann wrote:
> > On Mon, Jan 26, 2026, at 01:25, Marco Elver wrote:  
> > > diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> > > index fc0fb42b0b64..9963948f4b44 100644
> > > --- a/arch/arm64/include/asm/rwonce.h
> > > +++ b/arch/arm64/include/asm/rwonce.h
> > > @@ -32,8 +32,7 @@
> > >  #define __READ_ONCE(x)							\
> > >  ({									\
> > >  	typeof(&(x)) __x = &(x);					\
> > > -	int atomic = 1;							\
> > > -	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
> > > +	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
> > >  	switch (sizeof(x)) {						\
> > >  	case 1:								\
> > >  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\  
> > 
> > How does this work with CC_HAS_TYPEOF_UNQUAL=false?
> > 
> > As far as I can tell, TYPEOF_UNQUAL() falls back to __typeof__
> > on gcc-13, clang-18 and earlier, and not strip out qualifiers.  
> 
> I think we only need to worry about Clang for LTO builds. But yeah, our
> minimum supported Clang is 15, so between 15-18 it'd be broken.
> 
> > With fd69b2f7d5f4 ("compiler: Use __typeof_unqual__() for
> > __unqual_scalar_typeof()"), I would expect __unqual_scalar_typeof()
> > to do the right thing already.  
> 
> It'd still be broken for Clang 15-18, so it won't help much. We need
> this to work for more than "scalar", so even though it'll work for Clang
> 19+ given the redefinition to __typeof_unqual__, we should deprecate the
> _Generic-based __unqual_scalar_typeof() sooner than later.
> 
> I was able to make this work for older compilers:
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index 85b1dd7b0274..d6c808cc01be 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -19,6 +19,18 @@
>  		"ldapr"	#sfx "\t" #regs,				\
>  	ARM64_HAS_LDAPR)
>  
> +#ifdef USE_TYPEOF_UNQUAL
> +#define __read_once_typeof(x) TYPEOF_UNQUAL(x)
> +#else
> +/*
> + * Fallback for older compilers to infer an unqualified type, using the fact
> + * that __auto_type is supposed to drop qualifiers. Unlike typeof_unqual(), the
> + * type must be complete (defines an unevaluated local variable). This must
> + * already be guaranteed because sizeof(x) is used in the __READ_ONCE macro.
> + */
> +#define __read_once_typeof(x) typeof(({ __auto_type ____t = (x); ____t; }))

Did you try old versions of gcc?
gcc before 11.0 don't drop qualifiers.

Even const int y=0; __auto_type x = +y; generates a 'const' x (same for - and ~).
You need to do '0+y' to lose the const.
None of them help here because you don't want the integer promotion.

Can you use:
	union { u8 u8v, u16, u16v, u32 u32v, u64 u64v } u;
Then get the asm to write to the correct sized u.unn, then finish with:
	*(typeof(*x))&u;
or does that spill to stack for 'ptr to volatile'?

It doesn't solve the problem for other sized items, but I'm not sure
how many there really are.
If a handful changing them to READ_BIG_STRUCT_ONCE() shouldn't be a
real problem.

	David

> +#endif
> +
>  /*
>   * When building with LTO, there is an increased risk of the compiler
>   * converting an address dependency headed by a READ_ONCE() invocation
> @@ -32,8 +44,8 @@
>  #define __READ_ONCE(x)							\
>  ({									\
>  	auto __x = &(x);						\
> -	auto __ret = (TYPEOF_UNQUAL(*__x) *)__x, *__retp = &__ret;	\
> -	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
> +	auto __ret = (__read_once_typeof(*__x) *)__x, *__retp = &__ret;	\
> +	union { __read_once_typeof(*__x) __val; char __c[1]; } __u;	\
>  	*__retp = &__u.__val;						\
>  	switch (sizeof(x)) {						\
>  	case 1:								\
> 
> 
> Thoughts?
> 

