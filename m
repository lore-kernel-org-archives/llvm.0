Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ED93816F7
	for <llvm@lists.linux.dev>; Thu, 29 Jan 2026 10:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769683151; cv=none; b=sGvDBBD2aHpFj1C35fg3vRSB1TN6Pqf5z7jKUdcwopQMSssTUOCcihpR9NqdIV8vkOwadRBNoH0Jt/N1f3Ix8HO2nOMKDp45LnnAeRNq75Vwyj8LzvQdIi0msUONxmxUdW1ZBcU7fDWJHLj285LnVkGMfGfSLpys5M6kMDpyIcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769683151; c=relaxed/simple;
	bh=o9foS2IrmMNecTUof0S1oRA9RznnhkN8kaEES0D85QM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vbb+5nRbHlaZeb+oGhcnfoSl4rRnAy0mZrTzzuAOcNsPLjm0atFdwNYDpB5N8Ai6sL9YKisLwTEhMNScA/2h7c4aM0lIB98dBTVlsKvRbqhdLkcrOgUUU3zQ7fyqJEcJJxsIHbTMWzn7Fur5Nf6+0t+DLMB9lC/JTRpFXZW16y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5ZM/6+r; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5ZM/6+r"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fbc305882so590288f8f.0
        for <llvm@lists.linux.dev>; Thu, 29 Jan 2026 02:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769683148; x=1770287948; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqrjSrhQ16zu5YN2qHtHKezDN8iCLmAO7xkrZmYMFLg=;
        b=N5ZM/6+raINdO5zUzHJvR3deZAYmKVCZCP9B9AlR2nBJolLvJAiBfy4nnjxgY3vVfr
         to7gvxZXB2SUgc9O4/erOKtp+aMRT6aH0z3iVZ7QY91kJrXk/pNmmeP+MtM4uXNonDNO
         Fvjf7ot1cL13ZA+dzdum5Om6tp3Y8OzIwxx73zYfoyidigSUpGe8yuOZptgiGOwYJUkK
         usT1P2rYVULDNK+sMojRDDZAbUCnDefRhqFBJK/oXqtEIEz6L1ceWJTencs/ERWHDUbj
         3+S3ZuwV3CcLwPvr62ZBk2gNx8FnDha0WjfVLa6HPDm+H8BgblodihxXo2tlmClSq3GJ
         iPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769683148; x=1770287948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rqrjSrhQ16zu5YN2qHtHKezDN8iCLmAO7xkrZmYMFLg=;
        b=tTJLvUAcN3Ad9fmNz0ABUqJrKoD2VnGSCsrP3OOfG9VfFs0l6qA0c+/yKFKx9EBD6l
         MMBptUzL3l+FsGg61NcpHACPtP14oT6J7uNDFFVm3VdfKi84cOvWa7uENkhDQOrpOWCl
         MGOPlWWMuZFD3E5sAKWM8h4O8zECY5u9r+KSEULOSehhVYH+3iAc7fr6SbnOZgdUxaSL
         Hql+BuBRpc02h+7oeD5wCCSLfWWfI23FEUboRJQeJovrPL1gG+jm/X/dFQmU+IJG1u4q
         xMlJ3+oX92Rmyq8ygeJ5sBFTVbY/VIcrx2OzeVMlJjdJhai2/7uFomPWqw1gMxSfARRt
         GlBg==
X-Forwarded-Encrypted: i=1; AJvYcCVsmiE1eqft948lrwns7mB+u8AasMOJzagrIwHrA5JGqMHh8n/1k/Y8M/Br8obdnzY4jibw@lists.linux.dev
X-Gm-Message-State: AOJu0YwwShpwUMIBzeAIyNCgYM8PvZWMJ278ga0zTpes2CTCybpTtFB6
	Yr99+O6ClHJBTrFGycnzPWIQxxy7IkpzTqfuwBRNwukascMz9QOeC/qG
X-Gm-Gg: AZuq6aIbAxCOMRzgKBAvHiSUYYPUrXYRXOxhi0qlh9E+GeHj1Vx2tD7VRZHB0S0QWHO
	UAV1hld1FmrpbP5IlGXVQ3o/ebfeQeuSqBTLLQKQ47VkFx4raN7KATo9j7vUcuPMKoH6hNFgTSc
	I72npwAVNU8+glGaVqIwNjtj49cL5Z5gx5xTkoMH8rB1JZ2C9gdh+3PD27EFzH+1TLcoL2Wf1Mk
	8Z/IY+lMTfZdKXBwuiGS6dyvthVrHeZmzYtm/0OHgS8Pa3EWkySEZHufCprdXsdtSXiym+fNTbe
	IMCp5zOw8UadA1PCEG2QFTGaKC02VhU9fPJLI+lQwPD29Z86pZTdkCS9z/QfSRc9T0qbhMt0rB3
	uh1BXw8mzliVnm/AxNuFaXSJTKTFbyu2kvYGkgiaFnaYYlFjmCBq8EqL+IHGsVwGGH+jWTuI+GX
	RNncEREFTBbxoABL8GD0gqAIq4VPfEryBWHmvN0J1OpVT9tcACKca9
X-Received: by 2002:a05:6000:1b0b:b0:435:e436:7fb with SMTP id ffacd0b85a97d-435e4360896mr5882981f8f.50.1769683147650;
        Thu, 29 Jan 2026 02:39:07 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1048a54sm12773016f8f.0.2026.01.29.02.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:39:07 -0800 (PST)
Date: Thu, 29 Jan 2026 10:39:05 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260129103905.5b04ba90@pumpkin>
In-Reply-To: <CANpmjNPL662LMLw9o-fqQCBkhD=oG-UTHSQb8XeXtXduhh1dQQ@mail.gmail.com>
References: <20260129005645.747680-1-elver@google.com>
	<20260129005645.747680-3-elver@google.com>
	<20260129100332.500248d3@pumpkin>
	<CANpmjNPL662LMLw9o-fqQCBkhD=oG-UTHSQb8XeXtXduhh1dQQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Jan 2026 11:12:49 +0100
Marco Elver <elver@google.com> wrote:

> On Thu, 29 Jan 2026 at 11:03, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > On Thu, 29 Jan 2026 01:52:33 +0100
> > Marco Elver <elver@google.com> wrote:
> >  
> > > Rework arm64 LTO __READ_ONCE() to improve code generation as follows:
> > >
> > > 1. Replace _Generic-based __unqual_scalar_typeof() with more complete
> > >    __rwonce_typeof_unqual(). This strips qualifiers from all types, not
> > >    just integer types, which is required to be able to assign (must be
> > >    non-const) to __u.__val in the non-atomic case (required for #2).
> > >
> > > Once our minimum compiler versions are bumped, this just becomes
> > > TYPEOF_UNQUAL() (or typeof_unqual() should we decide to adopt C23
> > > naming).  Sadly the fallback version of __rwonce_typeof_unqual() cannot
> > > be used as a general TYPEOF_UNQUAL() fallback (see code comments).
> > >
> > > One subtle point here is that non-integer types of __val could be const
> > > or volatile within the union with the old __unqual_scalar_typeof(), if
> > > the passed variable is const or volatile. This would then result in a
> > > forced load from the stack if __u.__val is volatile; in the case of
> > > const, it does look odd if the underlying storage changes, but the
> > > compiler is told said member is "const" -- it smells like UB.
> > >
> > > 2. Eliminate the atomic flag and ternary conditional expression. Move
> > >    the fallback volatile load into the default case of the switch,
> > >    ensuring __u is unconditionally initialized across all paths.
> > >    The statement expression now unconditionally returns __u.__val.
> > >  
> > ...  
> > > Signed-off-by: Marco Elver <elver@google.com>
> > > ---
> > > v2:
> > > * Add __rwonce_typeof_unqual() as fallback for old compilers.
> > > ---
> > >  arch/arm64/include/asm/rwonce.h | 24 ++++++++++++++++++++----
> > >  1 file changed, 20 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> > > index fc0fb42b0b64..712de3238f9a 100644
> > > --- a/arch/arm64/include/asm/rwonce.h
> > > +++ b/arch/arm64/include/asm/rwonce.h
> > > @@ -19,6 +19,23 @@
> > >               "ldapr" #sfx "\t" #regs,                                \
> > >       ARM64_HAS_LDAPR)
> > >
> > > +#ifdef USE_TYPEOF_UNQUAL
> > > +#define __rwonce_typeof_unqual(x) TYPEOF_UNQUAL(x)
> > > +#else
> > > +/*
> > > + * Fallback for older compilers to infer an unqualified type.
> > > + *
> > > + * Uses the fact that auto is supposed to drop qualifiers. Unlike  
> >
> > Maybe:
> >         In all versions of clang 'auto' correctly drops qualifiers.
> > A reminder in here that this is clang only might also clarify things.  
> 
> Will add.
> 
> > > + * typeof_unqual(), the type must be complete (defines an unevaluated local
> > > + * variable); this must trivially hold because __READ_ONCE() returns a value.  
> >
> > Not sure that is needed.  
> 
> Trying to warn against someone copy-pasting this as a TYPEOF_UNQUAL
> fallback implementation. typeof() and typeof_unqual() do happily take
> incomplete struct declarations. E.g. this works:
> 
> struct foo;
> ...
> struct foo *f;
> typeof_unqual(*f) *x = f;
> 
> Whereas with the __rwonce_typeof_unqual() fallback this doesn't work.
> I can try to make it clearer.

It fails to compile - they'll find out soon enough :-)
gcc < 11 and the array/pointer decay are probably more relevant.
Could catch out the unwary.

	David

> 
> > > + *
> > > + * Another caveat is that because of array-to-pointer decay, an array is
> > > + * inferred as a pointer type; this is fine for __READ_ONCE usage, but is
> > > + * unsuitable as a general fallback implementation for TYPEOF_UNQUAL.  
> >
> > gcc < 11.0 stops it being used elsewhere.
> > Something shorter?
> >         The array-to-pointer decay doesn't matter here.  
> 
> Ack.
> 
> Thanks!

