Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1402E3373
	for <llvm@lists.linux.dev>; Wed,  5 Mar 2025 22:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741212465; cv=none; b=ion2bJnKMgXW7GwheFG61I72nWKNMRyf4CtOcneuCIH/T0KHvb4TXPg5iR+APZ38Ikf6N7yaAKa1FSR/L1VzovjLaKcs4guQ13wuFduXhGwQdnIQIaYIl/4CfgTbD0bAvyx5QjiZuDYKoFuQwAlvGkvXttVffNZA97KV6g8HVag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741212465; c=relaxed/simple;
	bh=+BXq03mrlLCePqP/pG5Wur4pQiq/lOWh+H61RCV87xY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fJth7hb7wPVrlVIgAsqEUCAOB85LdyygNEEASxlNZ2MfqHY6wea8+kLpqnqwFqLJJrVnySAiapUaR41CbBqmhZlt58P9okg/y8aqWYUCPuwKCnKQ/EDM1YLiQOSGUu3WNBJdTQBTSm/dNislu8MKJl8zEc1Vja/FPeSA1ZT8m3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+A4OhDZ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+A4OhDZ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-390f69e71c8so28807f8f.0
        for <llvm@lists.linux.dev>; Wed, 05 Mar 2025 14:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741212462; x=1741817262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ4RXyP2ObVyUAS7GvxgV7NKCHNu99kLZisTNWnNyX8=;
        b=P+A4OhDZMCcZhdB70bVrB+p3dgsXfc6JmZFhpH5x94TU2jqq9mRWxUJcYl35X24Szp
         cUP4fTO65Ksxos/dFsncAkhGhO/wmgPzamv2GDX1cyV0OZTVlK4+9zcDXd0qGtzUPowh
         nm6Z1pObHOr/uAZoKWqY1g4/2g50L9RdmJlPHoqxfgap+oZxS3OJ/UPa+TjFANHNFvMt
         Hau5x491utliTmkIy0F3NxkL9sS8bsS4k0ONY4JBM6RDhZVHioWv3J9bq3F4mVtpM7Re
         sx/lUyMIl7aIwrvEGRDDtfUJL//DSQEKt0ydCBocNB3ETw3ZgXfBV7TcbRZ4o16XIqdr
         oZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212462; x=1741817262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJ4RXyP2ObVyUAS7GvxgV7NKCHNu99kLZisTNWnNyX8=;
        b=lBavhw6WkPgLGOvo/2hzX1TsZaRxxoVvxMBnpAuApjg1sXeWQFRpCdsNMNdBGPCqTh
         ROfP2Qkr7hnOc0Shr1Ohxj9jQC6cETY/wSANocQRyDRx/qNqmJi9wJXIB/OcrF2toPdV
         lFXkLkOezVCdcUt25gRbvTCZ1eJJMw9AGME1RfZnOGbVHoep+FuY8QymuYmrkdWjGv8H
         H8G3LHXdNbwUAetr4fHCxvNhXSO7zJFkw3y8jDn9xmBem62gt0+nHggHLjrH0d6nAbsM
         kAcP/86GqbZEWGyTeB97RfXkD5KlJ7h0BxGKTe3bDdDsJSPwN4ayZu8sHP2CHITISwZF
         Qngg==
X-Forwarded-Encrypted: i=1; AJvYcCV+93F4i+I982Wbk6j/9ZfeL433qPPwNd4gwUY0Wbdy+AsE89E6IKx9G804d6wEPYBjXaD5@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3E58tka0u9cwyjx8z1gAOQUilSpYQBVmGlCyX53sZkir7b2SS
	g0C4saXuoi0KwxNBVtM0Fc1ELvjXMmz4HEiq/ZyIqpgodS5RNrn/
X-Gm-Gg: ASbGncsZEpxlI93hvciBVs/CxEv8YzQAe9Mf2Rio7mY0Wq/84tzHuMde6MF0pPBtW9h
	Sl2ANPNQ5JkmIB8gg2hLeqdFJZGyygSD5RbPfovLB0pvC/G+CaGYfSLG4g9utGE1v4C58xfk/HE
	jy+DAG+vfya2yHD8AIDwsvV7zVzoPiAjpcIh6LqniQsRkUHKCgkHFJPoJ+txYFfSu8tX/0tgJcq
	tbSqVkjlBtCSGU3YkbXi5RSgh8WyHuQ3+l6yTqRjRp+XVH0BPzRxpy7XYeo2Z6ndzJnVB3e4cH4
	4fCtvFSn48u9HnIpyDHya+F7BunTVumHmQ2oFcmTRcjHIGPbCy1sUDhC1Bwvo9evnUtLWG5Rb0X
	ER80aZd4=
X-Google-Smtp-Source: AGHT+IFOaAhKCQu7aLZUn/BnXQ8EJArByokwuaJFV+rvT5UJHaY5/C85XY3GI5k6+jjciy4ajP43tA==
X-Received: by 2002:a05:6000:4006:b0:391:23e6:f0ac with SMTP id ffacd0b85a97d-391297db9c0mr853400f8f.11.1741212461562;
        Wed, 05 Mar 2025 14:07:41 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd426d34csm30380965e9.5.2025.03.05.14.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:07:41 -0800 (PST)
Date: Wed, 5 Mar 2025 22:07:39 +0000
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
Message-ID: <20250305220739.1cb4b61e@pumpkin>
In-Reply-To: <20250305191608.GA19889@sol.localdomain>
References: <20250304213216.108925-1-ebiggers@kernel.org>
	<20250305142653.751d9840@pumpkin>
	<20250305191608.GA19889@sol.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 5 Mar 2025 11:16:08 -0800
Eric Biggers <ebiggers@kernel.org> wrote:

> On Wed, Mar 05, 2025 at 02:26:53PM +0000, David Laight wrote:
> > On Tue,  4 Mar 2025 13:32:16 -0800
> > Eric Biggers <ebiggers@kernel.org> wrote:
> >   
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > For handling the 0 <= len < sizeof(unsigned long) bytes left at the end,
> > > do a 4-2-1 step-down instead of a byte-at-a-time loop.  This allows
> > > taking advantage of wider CRC instructions.  Note that crc32c-3way.S
> > > already uses this same optimization too.  
> > 
> > An alternative is to add extra zero bytes at the start of the buffer.
> > They don't affect the crc and just need the first 8 bytes shifted left.
> > 
> > I think any non-zero 'crc-in' just needs to be xor'ed over the first
> > 4 actual data bytes.
> > (It's over 40 years since I did the maths of CRC.)
...
> > 	David  
> 
> Sure, but that only works when len >= sizeof(unsigned long).  Also, the initial
> CRC sometimes has to be divided between two unsigned longs.

Yes, I was thinking that might make it a bit more tricky.
I need to find some spare time :-)

I wasn't taught anything about using non-carry multiplies either.
And I can't remember the relevant 'number field' stuff either.
But (with no-carry maths) I think you have:
	crc(n + 1) = (crc(n) + data(n)) * poly
If data(n+1) and data(n+2) are zero (handled elsewhere) you have:
	crc(n + 3) = (((crc(n) + data(n)) * poly) * poly) * poly
I think that because it is a field this is the same as
	crc(n + 3) = (crc(n) + data(n)) * (poly * poly * poly)
which is just a different crc polynomial.
If true your '3-way' cpu doesn't have to use big blocks.

I guess I'm missing something.

	David
