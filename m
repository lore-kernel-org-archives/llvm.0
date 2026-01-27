Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50DA35B63F
	for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 14:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524234; cv=none; b=jQhLYAmqvxKiq7zGRtCXqAsl6OAaJxRI3261TNeOlOVc4RH5ryIBdiz/e8fC5UZnP2d5kAfEVaR1J1m8VfPm+s/0XqrScKAtL1iwx+b3xcYYD2fzJeAUJB648SrRO+AvOSaw0L8pUHNkYf56UTO4MjeZ/WSlq5FmQ8gt99SdGVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524234; c=relaxed/simple;
	bh=q2XFkv3k1e6ui7Ak1rh2fCMB9+jqFgzgbk8wV3/jOiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OMyrD7U9KgT+u97+3hplg5Lw+u5+Zj63DcEeMb37BsTfXQEWvF/VsrWm+0lc3ty7WOJd1bDZ+RDhBKUNwzMShAujCS4mHt/VQq97xbO/YfToAyyHk0kUnjsgd4YarcbvRXrZggdxprjHDv0+CoVgKPc5yIDxPtprq1vCROkF5Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LH2cy7D4; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LH2cy7D4"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so4821516f8f.2
        for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 06:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769524231; x=1770129031; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhshd5OZQ3rINSAnt7Pm+c6X8anVL8a4fk783Hki388=;
        b=LH2cy7D4s6Khl8EHGFJM6/VHrdr4ECY0hOzL5wjFUSVn+Opf47t3xtdkgk2B7s+sbU
         S23XpRd79X5lRGq9RLZYXjHGFg8LYq/+f5Dxvc8KP2JeJ6QpzCGQRUkSdrNlMZfo1cDW
         sk8f4ru38X8NYiSY/jARcFuu4ACb+b8PVkPGX3L9FG8Y7Qo0e+Fzcne6tzk+goCPSKfz
         CejpYVqhxrgk+VeF1NE/dxBTjWSdXZ9jeCZfrYXjRe0L3WBMvxXqOTuWlNs9DA2q1st+
         u/bBBvUdCUpfLC/1TuYvbCo/3k7Y/oJPt7gUFmBbgqnK/VpVMQ15R2DwoGnMdNGZs2ir
         KWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524231; x=1770129031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vhshd5OZQ3rINSAnt7Pm+c6X8anVL8a4fk783Hki388=;
        b=q2+oBd3SyPJU4d2qHVqS8Vw8NBCmKb7G1IsxrUnRRl7w7t2cyjvykZBc+qbRrVvTXy
         0d6CTTObOGezYdmcq9LK/L3vaNwbwV/GSBun5Vw75pBmmjX6yqCXxBV4GMnWr2hCb9ok
         exIeJMkzqgLQQ6Baug4UcGpmKLW35uZAywYtCFkTMzvJWpY1NRYPfT9Zl++ybxmHLVj2
         1Ryu47k9lu2/U7Cs6iOzKfsLKZFUuYpkFufO3I7OTDFsFxR+NL6bG+XhDI0V+GbdP/Ym
         IfHPRcnWkZS7/JsfoccwrKFsV4rwT+gHCqOFnip47wCR20HS/HFUZM6UiPZ0xtdKUaCk
         yHfA==
X-Forwarded-Encrypted: i=1; AJvYcCW/9zDpPmU9+TheWJUP3dWYFKxaeRTX85wJpoLY3SXhMdA5uAq7nrW+Z83CpCCG0h8ODCYE@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5P1E0L8ZcmW+A4estClbBX/8Vh1/T/Cschv/FHSc9xSzmfLRS
	JYhtyAJ6aZHGWKFl2LHxRLhOGdfVB7RR69fINq8x75ey2fJEfVb2e44D
X-Gm-Gg: AZuq6aKAIOkWdKMdqLrYj4fMCmKPwprUoIUJIHT9BWPBkSO70IIxKsdluEdgLzPqkSz
	SuNz01+m+qaKhRhyWYmPWRQFT2vvYjnKpoIQgtgQ1TmxzkWTFC7P5oHm4f//GmticiAPbKYdNdB
	45ZpUq2aVGsJLWZESV+f0THHFex3OjOZPnVIu9E15SMFVZCDDLRTpAfd8JZugUg1YDxxjB36aQ5
	zSygDYvZPg1Pe7/LVBgewmhjzDm51385LNsL0ZWoPXCpW7yoG+5gl0hJs7yThrdOf51dk1fjZbM
	j5Mr8NUThu0PHmLrVnZ7rF6ZLqb4szkXx1gnjIuf2iFkxrujVT3jejviFUy+ePNvOUl+adVMD2J
	KXwUMrfTv7AZEuaygXVCV6RZzZHbVruZqZ62/2HRVkakonzIbgioXIDSQNPWs5mkB5onz4GZi5O
	x7tZFuvDgUQ/DnV9fY5AmgCSrJea9U6eWL8WYtZ0uf+k4n38gK4VIl
X-Received: by 2002:a05:6000:3102:b0:435:97fc:6f1c with SMTP id ffacd0b85a97d-435dd08fbe9mr3025222f8f.25.1769524230765;
        Tue, 27 Jan 2026 06:30:30 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm39449626f8f.10.2026.01.27.06.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:30:30 -0800 (PST)
Date: Tue, 27 Jan 2026 14:30:26 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, Waiman
 Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>,
 llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260127143026.32429f32@pumpkin>
In-Reply-To: <CANpmjNNWoSdE_Lo9CJV3sAR+j8qz3_sq7LoaqYO6cVuOtdTBzA@mail.gmail.com>
References: <20260126002936.2676435-1-elver@google.com>
	<20260126002936.2676435-3-elver@google.com>
	<d3295c84-da15-4695-8110-7e04cfaf1419@app.fastmail.com>
	<aXfGcIpeXQNRUI-A@elver.google.com>
	<7478d2cf-9636-45c8-8ffa-8e3a3ba9baf8@app.fastmail.com>
	<CANpmjNNWoSdE_Lo9CJV3sAR+j8qz3_sq7LoaqYO6cVuOtdTBzA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Jan 2026 13:01:22 +0100
Marco Elver <elver@google.com> wrote:

> On Mon, 26 Jan 2026 at 23:24, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Mon, Jan 26, 2026, at 20:54, Marco Elver wrote:  
> > > On Mon, Jan 26, 2026 at 08:56AM +0100, Arnd Bergmann wrote:  
> > >> On Mon, Jan 26, 2026, at 01:25, Marco Elver wrote:
> > >>
> > >> How does this work with CC_HAS_TYPEOF_UNQUAL=false?
> > >>
> > >> As far as I can tell, TYPEOF_UNQUAL() falls back to __typeof__
> > >> on gcc-13, clang-18 and earlier, and not strip out qualifiers.  
> > >
> > > I think we only need to worry about Clang for LTO builds. But yeah, our
> > > minimum supported Clang is 15, so between 15-18 it'd be broken.  
> >
> > Right, I missed the #ifdef CONFIG_LTO check, so indeed gcc is
> > fine here.
> >  
> > >> With fd69b2f7d5f4 ("compiler: Use __typeof_unqual__() for
> > >> __unqual_scalar_typeof()"), I would expect __unqual_scalar_typeof()
> > >> to do the right thing already.  
> > >
> > > It'd still be broken for Clang 15-18, so it won't help much. We need
> > > this to work for more than "scalar", so even though it'll work for Clang
> > > 19+ given the redefinition to __typeof_unqual__, we should deprecate the
> > > _Generic-based __unqual_scalar_typeof() sooner than later.
> > >
> > > I was able to make this work for older compilers:
> > >  
> > ...  
> > >  #define __READ_ONCE(x)                                                       \
> > >  ({                                                                   \
> > >       auto __x = &(x);                                                \
> > > -     auto __ret = (TYPEOF_UNQUAL(*__x) *)__x, *__retp = &__ret;      \
> > > -     union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;          \
> > > +     auto __ret = (__read_once_typeof(*__x) *)__x, *__retp = &__ret; \
> > > +     union { __read_once_typeof(*__x) __val; char __c[1]; } __u;     \
> > >       *__retp = &__u.__val;                                           \  
> >  
> > >
> > > Thoughts?  
> >
> > Looks better than __unqual_scalar_typeof() to me. Would it make
> > sense to do the same __read_once_typeof() in the asm-generic
> > version of __READ_ONCE()? I don't remember if we discussed it
> > in the thread leading up to dee081bf8f82 ("READ_ONCE: Drop
> > pointer qualifiers when reading from scalar types").
> > We probably didn't have __auto_type back then.  
> 
> I don't see the point for the asm-generic __READ_ONCE(): it's not
> wrong to cast to 'const volatile volatile T*' nor 'const volatile
> const T*' etc., which is dereferenced directly and not stored in any
> temporary variable when used in READ_ONCE(). I actually don't know why
> __unqual_scalar_typeof() is used in the asm-generic __READ_ONCE(),
> which just adds 'const volatile' right back.

That looks historic, once upon a time the code was:
	typeof(x) __x = __READ_ONCE(x);
	smp_read_barrier_depends();
	__x;
but const needed stripping and someone decided to cast the result back
to the original type.
Of course that is pointless since the qualifiers aren't relevant on an
'rvalue' so are then discarded.
Then the barrier and temporary variable got removed.
(The barrier was only needed for alpha - which has its own __READ_ONCE()).

In the arm LTO version the ?: will also remove the qualifiers.

> 
> And __READ_ONCE_SCALAR() appears to be gone, where the
> qualifier-stripping resulted in better code-gen.

The qualifier stripping was needed to read a 'const' variable.
Looks to me like the 'better code gen' happened earlier.
The 'earlier' version took the address of the on-stack volatile
variable.

So you may not need to remove the const/volatile qualifiers at all.

	David



