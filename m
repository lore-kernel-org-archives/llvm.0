Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F202B2DEA95
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 18:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771526198; cv=none; b=mv/j5AzCQcY4jmgRahUlCXhtGMAJYeqyBNGqtP4FwcW9FRwTbLEzLp3KxYNP9tESUbnVrxIn9mtzqekvZQ0EX4VeWMyGEF8T3Y9a/sBFRVVC1VofBAhZtEAA17DVTUmnHB64GDEzolJDzMKnDq8j+M0dt1j/ifgWCxQgaSKYmno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771526198; c=relaxed/simple;
	bh=1I90A4JfY1uH02YnKbi0+/ezCYxk2PO0i8QHjbYmLRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BV7wYiecrCL1uTgW62OcvZkBI4BkCt1f10JHeCvVN/y8R9Wju4bvMmGFEP2kB9/dLLGt2QozTxFlfB5wCaFu7O580NrW5XS0+ce/Pimkb/oJB6Sqj9Dto+lKQSDUcH9E4FXXEDlyihkSTnOn+E1NqRhi8OzgDHCGmMUDO3B6eaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IH+kLrTL; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IH+kLrTL"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-65c0d2f5fe1so2009437a12.3
        for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 10:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771526195; x=1772130995; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r6J64nrxbONTCCmeNdQEVG1FOv3pNfoDRs5IqMpfOIM=;
        b=IH+kLrTLp4i89qC2uIGhSpWF7nI/mzYnf3HEZ+90It77QH+eSHBNqercqRQh3pnRUO
         PWQdgMs/tTlLWYKPsci8DiMhdgL1AC7QNBgY1SkfrasSaDI/9HVRBRBdKYZv/gMdwevp
         oV/NRxBLonYKamSR3+S4Wc1DNuM5gZpfjinPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771526195; x=1772130995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6J64nrxbONTCCmeNdQEVG1FOv3pNfoDRs5IqMpfOIM=;
        b=XmaVgTLgUWkt5hbPm+PLykOfjX3g3I+ZZuQid0D/Zheum9vfevMYM+zii5H+8GzA/L
         wVpOiC03KSFCUD0vVo2CcOe7aB7RJm4QP3DXJyYwZrX8w8YFRg5gMgnfdq6Ehvva7cEb
         a/HtnYWgXgEVXSHhnSbp/IJY5+XlH9BW2tUDAT+4CgkIRnWVj1By9HbwASi03baVSnHw
         okZetElz0k68LUf7Ge9TEyDU/R6mgR8pDPGpgYF1Sos5rdX7mquYR29GnVFbMVYSeFvF
         G25NiZ7wrwFysCnG9rwK9wYJnVCDTV39cMzMB5Y19k/dJaFb6rCPH8GBpkjbVB6TXyMw
         cSWg==
X-Forwarded-Encrypted: i=1; AJvYcCXibdrX+Z4K3Jb5nAnUeH2jHS9L57WpITUicdX2Q8UGu3h3Fm1N7IUEA8zNvY9wZM7CJHrp@lists.linux.dev
X-Gm-Message-State: AOJu0Yyccqbuaa/rwLuUQWTUe9UfKjvKe1eGpBM0Cw746nm7mxs9E0JS
	15yEkd+5CpAO5L2aF+O7uIrdGgKJK661NfR494UGs97NCEafrWyfAawMGRvMutzS4NxqXJuN0Mc
	6LAxAs6evKJ9M
X-Gm-Gg: AZuq6aIto6QFSk/IKP+/rXzCKr+fCrev2lI7BNw58sR1aefEp4qfZJyTrcOsIWZLpVB
	sILyvctqXIdA6vOx6LHhTemjcUMPA3zafwktARLo+xTmfM1PVmeCa8vSyqr2ar9QxbDbcSN0dH2
	qBgcYTY6tGLCUM94j9a4jLkwzGIA5i8a76QsbAAq4igjIdB+zcHPEIIdxumgdZbUnYHJ3IQ2zO1
	BhX3mF/YQUf7wrQf/MAzTS5xc9ljtdPU4W3sOez99v2NWbHjrenG6sdGGiRt27Qw5DrpsfIilMh
	F64EFeORETKgxd7oit+t6uhmU93sc76tJhxCcTmqy0Er+UJw5T/dd3aA63mrMgFLn+MUFfAZLnq
	NegV7MGR04AOJROkt58HtbFyYtQSNsnHsmyk2GVuTQGHlF+mHQKtfzP3IkBQ3pq4B9nR29CJxLl
	q3USIeBF7Zm5eEl9uHF8krpe3mEX9GwjZ4cHpa5Vq7bYjLttjfQeXwpHriAAmskTfXDPCjJ/2i
X-Received: by 2002:a17:907:720a:b0:b88:5953:2f14 with SMTP id a640c23a62f3a-b903da93c4cmr416073066b.16.1771526195047;
        Thu, 19 Feb 2026 10:36:35 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735e4cbsm605429566b.13.2026.02.19.10.36.33
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 10:36:33 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65c0d2f5fe1so2009385a12.3
        for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 10:36:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUq7KRvYRCXXQTgb+QGC4XpRmQ/OK+uQHRqcn7DwWaf0+wVhDUGANF4NtDaxJqSSrqbPQl8@lists.linux.dev
X-Received: by 2002:a17:907:6ea7:b0:b88:716a:e4ae with SMTP id
 a640c23a62f3a-b903dcd017fmr367534466b.61.1771526192836; Thu, 19 Feb 2026
 10:36:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com> <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck> <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck> <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
 <20260204131400.GI2995752@noisy.programming.kicks-ass.net>
 <aYNUmEfDzq7lTFFr@willie-the-truck> <CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
 <20260206182650.6c21b0ff@pumpkin> <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
 <20260215221656.68b2fc1d@pumpkin> <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
 <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
 <20260216110915.4f0d5490@pumpkin> <CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
 <20260216174324.75d47e37@pumpkin> <CAHk-=wgQ8DOxaNY5cBWg+sUkM5Kk6rKYGRHXsZQLtknO_UX+QA@mail.gmail.com>
 <CAHk-=whFGxN0nUffzCsR_NZnQ5TTu+8QFGSfca1j42kDK1a1tw@mail.gmail.com> <DGJ1H1TJVYBF.PA8G6HMJ0V6W@garyguo.net>
In-Reply-To: <DGJ1H1TJVYBF.PA8G6HMJ0V6W@garyguo.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 19 Feb 2026 10:36:16 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi7W4oeKP-1T-jhJSuVETtsNWxXCxczaepiPM8cy_Cm0Q@mail.gmail.com>
X-Gm-Features: AaiRm53E-2ixouS_a13WNQ7MnkuMrpdZYTKGOBvavd2yyU4R5GBexVg9Sn5kI5c
Message-ID: <CAHk-=wi7W4oeKP-1T-jhJSuVETtsNWxXCxczaepiPM8cy_Cm0Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: Gary Guo <gary@garyguo.net>
Cc: David Laight <david.laight.linux@gmail.com>, Marco Elver <elver@google.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Feb 2026 at 07:21, Gary Guo <gary@garyguo.net> wrote:
>
> However there is some limited optimizations being done to fences, at least I
> know in LLVM multiple fences do get merged.

I don't think we have any real use for that, in that we typically have
no real need for combining fences.

Yes, we have hacks for "I did an atomic op, so now I'm using a special
fence that turns into a nop on x86 because the atomic already acted as
a fence" (ie "smp_mb__after_atomic()" etc). So we have some pain
points, but it's pain points we've dealt with.

Having the compiler reliably deal with that would have been great - 25
years ago.

But we have the code, and we have to use our own architecture-specific
atomics anyway because the compiler built-ins aren't reliable or good
enough.

The thing is, inline asm is *reliable*. It's reliable exactly because
it isn't a thousand different cases that the compiler has to get
right. It's *one* case - admittedly a complicated one - that the
compiler has to get right, but then you can do pretty much anything.

And having seen the process - and read the language - of the C memory
ordering standard, I do not believe anybody can ever understand that
thing. Memory ordering is very subtle and hard to understand even when
well documented. The C standard documentation for it is definitely not
helping.

I'm not surprised that compilers don't do better at atomics, because
if I was a compiler writer, I'd have long since given up trying to
figure out the meaning of the standards language and just gone "yeah,
it's an atomic, I won't do anything fancy".

(Which is obviously exactly what happens to volatile too, but at least
there you can *understand* the rules, at least unless you got confused
by the C++ horrors, at which point you throw your hands up again).

             Linus
