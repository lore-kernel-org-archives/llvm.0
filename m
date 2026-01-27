Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6654233C1B9
	for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508825; cv=none; b=GGrFGeiEBDFJ9ju1kTiONUtc69etCJX83vCrP6GwhdeQv7LEy5OvgCbT9JeyxL3kurCOWPqHkaDJW+fvAZfK62+UEDJ2Djji2+KjkdY0EuytZtiIuoENhZtrsVTM9mnrZf80Jhp+Z6g3lDxjqH3Y4r6QKBFWJlfPk9AQSl7Gp/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508825; c=relaxed/simple;
	bh=Hddp8EH1yXGPY9z/p4cAF0itGV0OTB2M/8Fb3IcnAGY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=STm2VWNvxOFC1B524cnUFK7hN1HmGBvCF3xNjvYy+PuY4UEFR2J85pvNWaqr17WanmgJ8bEdUCUaaAjHFB0Xw1OwX83sA3ikJYK/8nJtKtDaxpF33zB6sSQyCh1vi5Lmf8DMP98twWA5igLsqsXKN0YFbaoNQbjezv7TTM/vw0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NS4M4lr0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NS4M4lr0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4801d98cf39so40863685e9.1
        for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 02:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769508820; x=1770113620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOVCHa5FK0FHzhkRB3PH07haTP2XM7pEmD3OPviuoK0=;
        b=NS4M4lr0xPBN25WIGcmuiUXjbYZNAm2yZMjFhSUfKEojTbr1QfOJntAObdhS+/c3x3
         Gl2pVhWSOl+hK0GDPsjMUwPBM15azoEibsMpEk5GGBJRRj0wGzxsMSnMPeXgnIs3UYJo
         wjXb2+QXRUKnrJDtdd35LpHFfEVsrfGRUOIDefJfLA1nUi5nJkxZJirY9+qrym6Irr7y
         Sxrre/eJgJNaGFCnubNrM3bpd9cNoW4C9fI+yUOcu64nQuT+BnVAEFI6u83sbGZJYwV7
         1RCO9BUdYXTkOe5uFTsTkCDy76xEwstfHHDbj8b6n1vJlwfa11ANT0p52HwmolP6RP4Y
         s0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769508820; x=1770113620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hOVCHa5FK0FHzhkRB3PH07haTP2XM7pEmD3OPviuoK0=;
        b=NQdOrIgHjue/jArU2ZjgTnwizzbrftKc8ccilAgVzuMAby3oBc0YQx8DFSRreqOVIk
         7Bm1JqlJiZS+upAdukE0PM4vp6K+pZGUFpsXOqoF/7sy+0Cyqy1I5ow8lE5IZNg5+ob3
         UL4fD3fI+vIOf6UqUDfe5SzSiz9Xoq5kqrSJKfOhhwk8Hl1Dknocb1hYLVXe2nG+f/b+
         M0C6bwpsv8fCW1E/7j0w2GB29Rw03IoUf/l2kmB8DC0RYTNF+76/AuL6W+pJ3YfKkvmv
         fDTohHETCyrcq2ZaADrNRROlsge6+IGcvO8s+03u9hzkMSFR0+W+VCcgP8d4znwR5uF8
         eoaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvOvdnB2KNsxPdVEa34r518lo69LU5lMPRauyXf7/IG6FAZZ6fkE05bOOcIwouDryVmMwy@lists.linux.dev
X-Gm-Message-State: AOJu0YxP75XP3YGN2tEPC5xdpmdFWI64iZ0YN5Ldv14V/6v384YxpTle
	Kjl/ucTEYw1NJaGC704YIbVM7dgbs2HN73JaEspgyNv3CIY0gVanAUXl
X-Gm-Gg: AZuq6aIsjz7tIoQb1xEiRlckWKkVkYjB1QhzOYrhRhdlCnfJtF0eogcnX0XQ5UUgtub
	c5WbDJODrBEryfRT6ydgPw34rBJkztO3FzXZWQCi1hjDhb4BoDOlHCe75tMSgLYhT0JB/wu+xG8
	idvHoI4DaFhM5iZZ6mAs+qYgqNV3rmpDvL3fEtj6JZLfsHmb58VBHMz9w9k6TzK5q6CFauY4tAs
	LayUVsfs1VJZ++2qyTtyp1+AXAGyp9gfJyt8oblxu76/VuGSTdRVVYOmWuhRYBlh7udAepJsGub
	flW6Qf9l545sNhBQ1CMHsazKT/exckzZLl5ScIneco/lRLAL/fMdr9TS9PojcW2F0n8qoQNhSRy
	wu1djz+D/hrt+qwz8hbKlWL6Rt2tXO8xYnXOjDAV2usEM02fqZQM1c/m5J8PWVl8exB8IOOKBRR
	KffXTBfWkHqErwfUNbPydGrRP1EfgnKefzXK9DJ9neCanCXx3XzhJ/
X-Received: by 2002:a05:600c:450b:b0:480:426e:9d38 with SMTP id 5b1f17b1804b1-48069c96b8amr12421685e9.27.1769508819768;
        Tue, 27 Jan 2026 02:13:39 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bfb59asm47613355e9.7.2026.01.27.02.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 02:13:39 -0800 (PST)
Date: Tue, 27 Jan 2026 10:13:34 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260127101334.352794d1@pumpkin>
In-Reply-To: <CANpmjNNUGzgLxSj78ptW-t5ux7WL7sq3q-h9acGEfJxC2u==hQ@mail.gmail.com>
References: <20260126002936.2676435-1-elver@google.com>
	<20260126002936.2676435-3-elver@google.com>
	<20260126111643.534c8274@pumpkin>
	<CANpmjNNUGzgLxSj78ptW-t5ux7WL7sq3q-h9acGEfJxC2u==hQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Jan 2026 00:15:38 +0100
Marco Elver <elver@google.com> wrote:

> On Mon, 26 Jan 2026 at 12:16, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > On Mon, 26 Jan 2026 01:25:11 +0100
> > Marco Elver <elver@google.com> wrote:
...
> > Also is the 'default' branch even needed?
> > READ_ONCE() rejects sizes other than 1, 2, 4 and 8.
> > A quick search only found one oversize read - for 'struct vcpu_runstate_info'
> > in arch/x86/kvm/xen.c
> > Requiring that code use a different define might make sense.
> >
> > I also did some x86-64 build timings with compiletime_assert_rwonce_type()
> > commented out.
> > Expanding and compiling that check seems to add just over 1% to the
> > build time.
> > So anything to shrink that define is likely to be noticeable.  
> 
> The compiletime_assert_rwonce_type() is for the benefit of the
> asm-generic variant, which is implemented like the 'default' case here
> by default.

True, but compiletime_assert_rwonce_type() stops you getting to the
'default' case in this version - unless code uses __READ_ONCE() and
I couldn't find any examples.
So the 'default' could probably just be a BUILD_BUG_ON().

Although part of the 'bloat' from compiletime_assert_rwonce_type() is
the repeated definition of the error function.

A few places define an 'error function' rather than using
compiletime_assert(), perhaps there should be:
#define compiletime_error_fn(name, msg) \
	__noreturn extern void name __compiletime_error(msg)
for consistency.
If compiletime_assert_rwonce_type() used a named function this code
could just call the same one.

> This here is only the arm64 override of all that with LTO.

I keep missing that conditional (and that it means clang) ...
It also explains why only a few builds get a signedness error from min()
because the 'atomic ? x : y' causes integer promotion to happen.

	David
