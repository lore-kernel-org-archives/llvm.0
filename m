Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A832E1993A3
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 05:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741238268; cv=none; b=h1Fb5gwd8Oi3ZQgiY970wnjoMgy8Mnuy4aotnB9qLHebmL/TWkLKD/5TGzqbigToAuBaLwIW6zeDLCw1aPaZAkIOuEqf4RHeg7/eLOHtEMBifC/3+nmBfMpk4vJPEGf7L7KrnYKIlnXHFPXY8cG3aB4yQsfdSQOqC4R+BDw/j08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741238268; c=relaxed/simple;
	bh=WYFWuMsvQGQ7/YrFeFoyl61Xj9FhjYRgqlpD086BI+I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K0tdjwE3xWJ/7vYUJNLPH+fkUb3MKfhoPgDsn859CjfHicDyyoRVx60W826j2UhPm6yh1sOpvUYFkFkP7DgYazARXh7Fk9HV1OFe7O3zAGfJrw4DWXcUmHpY6/APoMGEFtemFsp1sh7xIrO4WQ5+vamwC77EpwAgYgy41rtTHZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYSkMmqX; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYSkMmqX"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-390e88caa4dso104953f8f.1
        for <llvm@lists.linux.dev>; Wed, 05 Mar 2025 21:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741238265; x=1741843065; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XTve7yZUkpJ6I7Ayk3GGXKo8U7zE5G1KYgy4s9AqZw=;
        b=JYSkMmqXyYSdBVbLl4KZZPowuFoHkzhFmAUyWTEPmViCjTVblbga6nU3m4dsylhXwk
         AhgCbl6e1RWlQ++lsh8hWun2zu0xWkX5PQGN3o1DMoZO6GY+Cuhx0Ow5Als46xZ23uUf
         IAtKwRyfuNBWfVfTNzmK1wDmT5f896m6bAq4hRdqohdEW9C4PkZHi04OiPVqy43/s1hf
         +GWIA7pO6rMAKLlXMGMb9uz1qp+mP8IqcmcrYuKeQ+IBquByuhs3dIsyAz+7GlxtvJXi
         O7zl8wFeWfZ+aCW6MOibIp75nTc/wNANyQx7Lp/Go6OL8NilKRRwZcPEXY8oP9vyg+Xw
         1vFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741238265; x=1741843065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XTve7yZUkpJ6I7Ayk3GGXKo8U7zE5G1KYgy4s9AqZw=;
        b=mNs4mKfOM5ori42RPZRSJI98G4GfaAROdwrfN5gPHtkOR1e1OCvkecz8QrtaJRkJIz
         8SHz9+pMVP+u84G+AXQMbiNX+Yx8qZoqw3dRWdMW5XkYQ9UP0ML9nCxsFsGzlC3YuxqA
         aNq6vpTAdLgq33ZH3Na89v/K3xuPhKFY05h6hGfrrdvG0osmDv/ymWEezzSynF2ovWBn
         QxHkxZXM8Dq19IjVy9nbpDnKtHggpbs3eVzXxxgT9YxEDwr7fJ4IZVzbQrfAr7VmqhfW
         R6yTZjY2oYQ2kbvjg4hYYe67E3j+k/c2iiZyaqKSv7Enp7WGB91XL8b8YVsCkAns+SNe
         v92A==
X-Forwarded-Encrypted: i=1; AJvYcCV/sV/S8fyNqU0oR5EZilACmfI/L0T1eTdYX0+MfNmJ7w+DZklXrwSouEKgoYAZTCEXeYBK@lists.linux.dev
X-Gm-Message-State: AOJu0YxURybPc7DTs/tC3q+8azQf7n+QSaN0LD2/es918/W2RuWxQH1x
	egYxidNHaFYItP2g7Aw2SkXQgsvmQb31kwNXjpj3M1wI8I6XLWOR
X-Gm-Gg: ASbGncvRxidTI9QKYR2ssEgF+el4vFPYEgFdGWoO/RepB4h5K91zSAkLMONOXyiCgSo
	20Sw5FWQM32n9lHNKoaYJYl8DgNVsyJjJthkr/ztzXnntc8SuGT9QvXQsDVVLTJGsLRe3aorWaO
	vtK30jeEKTLuwuwdrbFJ6+y7nzIjmIQOB2KlElR7DYIYnw6Ul4dp78tc+oypwQ/j04TD/to9mYA
	Cvhlqfe379Mmea8osNBBwDaB9cQhWtzDrK9fsEzOQEywz4nJm4qGBefsHeYmM7RjXk8JGbpsTjR
	cNEZ+I80Ur8uqTDj1ybxmOp0I1Kmxj0XkgjqZHYFGwVmt6v/E/BzOrdXIGB7fCfjV8qRqw1n0ug
	F8KYLUeo=
X-Google-Smtp-Source: AGHT+IHpz5lBCH2fwxlrTq59pWzTqiDyJY2lKmLmc1eX8A6erOeXEL+wiJGEzur2GcgaqjZkCdZM0g==
X-Received: by 2002:a5d:5984:0:b0:391:1f9:c59a with SMTP id ffacd0b85a97d-3911f7c4cf6mr4482893f8f.46.1741238264481;
        Wed, 05 Mar 2025 21:17:44 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4352eccsm37431535e9.27.2025.03.05.21.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 21:17:43 -0800 (PST)
Date: Thu, 6 Mar 2025 05:17:40 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel
 <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>,
 linux-crypto@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] x86/crc32: optimize tail handling for crc32c short
 inputs
Message-ID: <20250306051740.6f454cac@pumpkin>
In-Reply-To: <20250306025643.GA1592@sol.localdomain>
References: <20250304213216.108925-1-ebiggers@kernel.org>
	<20250305142653.751d9840@pumpkin>
	<20250305191608.GA19889@sol.localdomain>
	<20250305220739.1cb4b61e@pumpkin>
	<20250306025643.GA1592@sol.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 5 Mar 2025 18:56:43 -0800
Eric Biggers <ebiggers@kernel.org> wrote:

> On Wed, Mar 05, 2025 at 10:07:39PM +0000, David Laight wrote:
> > On Wed, 5 Mar 2025 11:16:08 -0800
> > Eric Biggers <ebiggers@kernel.org> wrote:
> >   
> > > On Wed, Mar 05, 2025 at 02:26:53PM +0000, David Laight wrote:  
> > > > On Tue,  4 Mar 2025 13:32:16 -0800
> > > > Eric Biggers <ebiggers@kernel.org> wrote:
> > > >     
> > > > > From: Eric Biggers <ebiggers@google.com>
> > > > > 
> > > > > For handling the 0 <= len < sizeof(unsigned long) bytes left at the end,
> > > > > do a 4-2-1 step-down instead of a byte-at-a-time loop.  This allows
> > > > > taking advantage of wider CRC instructions.  Note that crc32c-3way.S
> > > > > already uses this same optimization too.    
> > > > 
> > > > An alternative is to add extra zero bytes at the start of the buffer.
> > > > They don't affect the crc and just need the first 8 bytes shifted left.
> > > > 
> > > > I think any non-zero 'crc-in' just needs to be xor'ed over the first
> > > > 4 actual data bytes.
> > > > (It's over 40 years since I did the maths of CRC.)  
> > ...  
> > > > 	David    
> > > 
> > > Sure, but that only works when len >= sizeof(unsigned long).  Also, the initial
> > > CRC sometimes has to be divided between two unsigned longs.  
> > 
> > Yes, I was thinking that might make it a bit more tricky.
> > I need to find some spare time :-)
> > 
> > I wasn't taught anything about using non-carry multiplies either.
> > And I can't remember the relevant 'number field' stuff either.
> > But (with no-carry maths) I think you have:
> > 	crc(n + 1) = (crc(n) + data(n)) * poly
> > If data(n+1) and data(n+2) are zero (handled elsewhere) you have:
> > 	crc(n + 3) = (((crc(n) + data(n)) * poly) * poly) * poly
> > I think that because it is a field this is the same as
> > 	crc(n + 3) = (crc(n) + data(n)) * (poly * poly * poly)
> > which is just a different crc polynomial.
> > If true your '3-way' cpu doesn't have to use big blocks.  
> 
> Well, to extend by some constant number of bits 'n', you can carryless-multiply
> by the polynomial x^n, pre-reduced by the CRC's generator polynomial.  That's
> basically how all the CRC implementations using carryless multiplication work.
> Take a look at the x86 and riscv optimized code, for example -- especially my
> new versions in the crc-next tree at
> https://web.git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next.
> 
> But x86 does not have a scalar carryless multiplication instruction, only vector
> (PCLMULQDQ).  It does have a scalar CRC instruction, for crc32c *specifically*,
> and that is what the code we're discussing is taking advantage of.  Given that
> there is overhead associated with using kernel-mode FPU (i.e. vector), it makes
> sense to do that, at least on short messages.
> 
> On longer messages a PCLMULQDQ-only implementation would work well, but so does
> interleaving the crc32c scalar instruction on multiple chunks, which is what is
> currently wired up in the kernel via crc32c-3way.S.  And yes, the chunks for
> that do not *have* to be long, but you still need to use pclmulqdq instructions
> to combine them

You should be able to use lookup tables to jump over the other chunks
(so processing a block of zero bytes).
Possibly 8 lookup tables of 16 entries each for each nibble (512 bytes).
Not nice for the d-cache though.

> (unless you do a really slow bit-at-a-time carryless
> multiplication), and you have to enter a kernel-mode FPU section to do that.

That pseudo-code is probably completely wrong.
I suspect that since it is 'just' doing 'data % poly' it relies on the fact that
	327 % 7 == 3 * (100 % 7) + 27
and reduces the length by one digit.
(Where a 'digit' could be 64 bits)
I need to look up pclmulqdq.
Trying to do anything with the simd instructions makes my head hurt.

	David
