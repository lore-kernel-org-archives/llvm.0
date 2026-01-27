Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC992D9EE7
	for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 15:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526324; cv=pass; b=mJ9yR9TWI6uTHUEMzMA1/jW6/FJHUh5MAvM35Gjvj8dItJhO990Sozm6GqamvNn/YQWr/zyCXefXxjVszINVh6WGWY+wTvnz67bE2QMD9NjulijAaCvkcRJShEwzHiPYbsMK2QsHmHOOt2TkwCMbrXZSow2+Gka5NnkF9NNuj04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526324; c=relaxed/simple;
	bh=ToSe60BO5nyHCL0adPsk1M6LBLUSZ5SVlISu1wwO/eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K2Jp3BRDKQkod1+8I+wi6zqCdF4QY2vH5Qb2+fyYHRn9BqSr6f8ObUCMXzrSobA2jMAllgus0tLB883b+gUz86vMkuV/xktHCk89hE0yKO7Cuh5cTBH0eS9l0MxpP/u5XY5CSxSFTDJucEY/qDd3ZH8yGnPn0+JUw1pP5cS0UT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nqXHrZJt; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nqXHrZJt"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1248d27f293so925344c88.0
        for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 07:05:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769526322; cv=none;
        d=google.com; s=arc-20240605;
        b=bpAdRRDmaDZKEbG7hpvNjq5vPxD0+KwJtzeFVnaBdwIlHhlo98GCLl3rEMM6i/PbmN
         qKQGM253DAYHe78sJbusy2fuv7uHzPYX86MwvTeWmOHmBSmEaCEh/42yB4TfHWmDQGb1
         UL8mHmxJEkDUwwbA/T5AbDoFRnOU1Q+f3EMzJHyCdALuJIbc21mRN0L467E1toAQ7zeI
         PoRbfDRF1FTalkAdqTv9I1rU7sahpCIDoBLC9+6DO6G9FKP7iZwCJMVJdMaSvOgRXVC2
         39zk61hS3Z9kH4rLJkAmFFi3NM9gP+74VC4iQqZ/YQq0qq1REcXGq77QSzTMCWK0bDVT
         OunQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZojKbYgn1eECXdcNapnzyuqfvAMY57q50RdG9AWWOW0=;
        fh=P22fYLDZT+ARjbP5WWeJJGlpiJva3qxM71P2bFL07AA=;
        b=VURJnWkhTM9THfmCyiYJA6apNyD1vSEmfGw+Ct7sUnpFFF4/Ne67UlGRi5/jURfpjU
         psEurWQckKd6Aeh0qpX0hr5v7ZliOEY50xXqXCMhhoklkhO7FCnoKeq7B3Vy5MjnHrTo
         kYNU4zfRo0f/SRdT69GtmHUa+8xTReqQjUVjnTYqBblGGWjCXSv5Wg4v6kAzsgDU6WSn
         sdneWCAQgliMtvuh39WGOSj5lbvLa6JRrddzHFDQJ9RX3aEzlsOEZCfJezDRt3nLQBQg
         z59O1mtxMwUjvWzwGBjWtjQWQOVy6AD2nvUMbT+LownRbAWMkZFbihxEQNyqnYd0IqVd
         1Fvg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769526322; x=1770131122; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZojKbYgn1eECXdcNapnzyuqfvAMY57q50RdG9AWWOW0=;
        b=nqXHrZJtYUwZnc1QW9vJht4fnkN4sjSUGKldkXwSJVeqbexoxod8gP0U3tpZ6eyTeF
         ZM6cb5lxtgT//dJ0HRN7mFeQpl9AXSuuN7Z/LOzXAnAyPo9PpU2UMtIo6rPcvl4M6ULc
         6TDDSrewBHUwU2OjJwqdKbjcQfHBLEkvMTSxW+v5YFbB/XbSWSiLgSi+sNgASMAPxeYu
         8zm16VG4q4CeR+RQDjFaIPwRaPZwPRSYnD4H5olMY5ZeGqBkOLq4tGz/52zfVTERH4Cy
         0OrXl+oA4LYCHfNRCvVYd2iuK2odTfxiXNr1fDsbo2dIqE7R/DUCnoVlTDZCKzlj00f8
         I7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526322; x=1770131122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZojKbYgn1eECXdcNapnzyuqfvAMY57q50RdG9AWWOW0=;
        b=eatfpdibZCYxdMnsrpi2d6fbeIfhk4SJm9+Xe3iXjwvOs1WqpJEhsXspQyudMWzKrt
         AJgxyLx4HkJ+CUsYZSXK3ZPkPDDTfS0YgxpNvneoxveFj8+D7XdRaSsp8T0X7dZhZPTE
         eYE4+8yCyF48/4BMwc8zYPg+ocdTkF0lyKxeol8szuEV7YEcPnowyzFtY/0mxxjf8Gqz
         2YM9vRUwXYHyOtx0F/xGoPAlTLFixCoUgAKERXWpbwAZxL2ykVR+QShTDzZVGTXspbUd
         kOiD0nyM78DL39UDseS64q9qZvHSWwijZNy0fgr/aUKesFCGXjLxhGvVceLvkIAK2oSS
         1u5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWY70g2S4etycG7izDyG2E4xmBk7vbPX24DFUlQMYNXWtLcSjjWwuXG+scgz1wos01n7r1y@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8lxljQE4MUNaTCzn7c4zbi2Wj4+d2ttMf72MqNUhRmq5/BS6O
	oQHtxj7bVre23yp5ampbkfazeOqT3+7CUvMH2tKikbJZjqUMOgdnW+lUFDXaO6C4geEMTG5Su38
	GspWmE7areqz/653gDUikYft0k1v0epYYVwklpFn9
X-Gm-Gg: AZuq6aK9ahuengpDGjKGkHMt7At4RrtAs6mJPRfeLnizCCB/GJHOa4lBJoMkTKS7M1Z
	MWm35nSeXl7F2/NZiiJEO5RN3tbsvohbHpA6blqAA9IU5Tkp8MiMsCiknhQU2Z0mfWGf4zqMu9W
	m6iB6a9g53Ox7ffUb2s3KhUp7PI/DcGP/DBR6fZtjBniG9yoi3i5+yMQpWPmoEmRPaTIqlwzg3j
	zI0LiDiYt8ZvuIVxHeRudkZvG46iPUDlveB7sg+Z6gVaQDCD9Ol/Hsh6j7rpS4etudfLrgxnIHF
	GOzVu05Gqg277/YA2j5OUOY8JLDYbAf02jiH
X-Received: by 2002:a05:7022:6889:b0:119:e56b:c74b with SMTP id
 a92af1059eb24-124a0078feemr1167440c88.16.1769526321283; Tue, 27 Jan 2026
 07:05:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260126002936.2676435-1-elver@google.com> <20260126002936.2676435-3-elver@google.com>
 <d3295c84-da15-4695-8110-7e04cfaf1419@app.fastmail.com> <aXfGcIpeXQNRUI-A@elver.google.com>
 <7478d2cf-9636-45c8-8ffa-8e3a3ba9baf8@app.fastmail.com> <CANpmjNNWoSdE_Lo9CJV3sAR+j8qz3_sq7LoaqYO6cVuOtdTBzA@mail.gmail.com>
 <20260127143026.32429f32@pumpkin>
In-Reply-To: <20260127143026.32429f32@pumpkin>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Jan 2026 16:04:45 +0100
X-Gm-Features: AZwV_QjkVcqcin6Gi2JYj2B3wWNoUiG-N9J56-PyOvmC4Ux7-7iPyngI5z7-NvM
Message-ID: <CANpmjNP6qRm0M9Za-=Lm8N87o-GukO5nQeAVpW=bbXRnip4Fvg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Jan 2026 at 15:30, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Tue, 27 Jan 2026 13:01:22 +0100
> Marco Elver <elver@google.com> wrote:
>
> > On Mon, 26 Jan 2026 at 23:24, Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Mon, Jan 26, 2026, at 20:54, Marco Elver wrote:
> > > > On Mon, Jan 26, 2026 at 08:56AM +0100, Arnd Bergmann wrote:
> > > >> On Mon, Jan 26, 2026, at 01:25, Marco Elver wrote:
> > > >>
> > > >> How does this work with CC_HAS_TYPEOF_UNQUAL=false?
> > > >>
> > > >> As far as I can tell, TYPEOF_UNQUAL() falls back to __typeof__
> > > >> on gcc-13, clang-18 and earlier, and not strip out qualifiers.
> > > >
> > > > I think we only need to worry about Clang for LTO builds. But yeah, our
> > > > minimum supported Clang is 15, so between 15-18 it'd be broken.
> > >
> > > Right, I missed the #ifdef CONFIG_LTO check, so indeed gcc is
> > > fine here.
> > >
> > > >> With fd69b2f7d5f4 ("compiler: Use __typeof_unqual__() for
> > > >> __unqual_scalar_typeof()"), I would expect __unqual_scalar_typeof()
> > > >> to do the right thing already.
> > > >
> > > > It'd still be broken for Clang 15-18, so it won't help much. We need
> > > > this to work for more than "scalar", so even though it'll work for Clang
> > > > 19+ given the redefinition to __typeof_unqual__, we should deprecate the
> > > > _Generic-based __unqual_scalar_typeof() sooner than later.
> > > >
> > > > I was able to make this work for older compilers:
> > > >
> > > ...
> > > >  #define __READ_ONCE(x)                                                       \
> > > >  ({                                                                   \
> > > >       auto __x = &(x);                                                \
> > > > -     auto __ret = (TYPEOF_UNQUAL(*__x) *)__x, *__retp = &__ret;      \
> > > > -     union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;          \
> > > > +     auto __ret = (__read_once_typeof(*__x) *)__x, *__retp = &__ret; \
> > > > +     union { __read_once_typeof(*__x) __val; char __c[1]; } __u;     \
> > > >       *__retp = &__u.__val;                                           \
> > >
> > > >
> > > > Thoughts?
> > >
> > > Looks better than __unqual_scalar_typeof() to me. Would it make
> > > sense to do the same __read_once_typeof() in the asm-generic
> > > version of __READ_ONCE()? I don't remember if we discussed it
> > > in the thread leading up to dee081bf8f82 ("READ_ONCE: Drop
> > > pointer qualifiers when reading from scalar types").
> > > We probably didn't have __auto_type back then.
> >
> > I don't see the point for the asm-generic __READ_ONCE(): it's not
> > wrong to cast to 'const volatile volatile T*' nor 'const volatile
> > const T*' etc., which is dereferenced directly and not stored in any
> > temporary variable when used in READ_ONCE(). I actually don't know why
> > __unqual_scalar_typeof() is used in the asm-generic __READ_ONCE(),
> > which just adds 'const volatile' right back.
>
> That looks historic, once upon a time the code was:
>         typeof(x) __x = __READ_ONCE(x);
>         smp_read_barrier_depends();
>         __x;
> but const needed stripping and someone decided to cast the result back
> to the original type.

I think the bigger issue was 'volatile': "Passing a volatile-qualified
pointer to READ_ONCE() is an absolute
trainwreck for code generation [...]" per dee081bf8f82.

While the above with the temporary is gone for the asm-generic
version, the arm64 LTO still has the temporary and we need some
qualifier-stripping helper.

And a similar pattern also still exists for the asm-generic variant of
__smp_load_acquire() and friends.

> Of course that is pointless since the qualifiers aren't relevant on an
> 'rvalue' so are then discarded.
> Then the barrier and temporary variable got removed.
> (The barrier was only needed for alpha - which has its own __READ_ONCE()).
>
> In the arm LTO version the ?: will also remove the qualifiers.
>
> > And __READ_ONCE_SCALAR() appears to be gone, where the
> > qualifier-stripping resulted in better code-gen.
>
> The qualifier stripping was needed to read a 'const' variable.
> Looks to me like the 'better code gen' happened earlier.
> The 'earlier' version took the address of the on-stack volatile
> variable.
>
> So you may not need to remove the const/volatile qualifiers at all.

Yeah, I think so too (for the asm-generic variant that is). But I
won't mix up the arm64 fixes with possible asm-generic ones to avoid
this blowing up too much. I don't see a dependency on the asm-generic
cleanup, so we can clean it up separately; but I think it's purely
cosmetic unlike this arm64 LTO version.
