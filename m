Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA02F22F77E
	for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 17:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766079800; cv=none; b=SiBWL4E0sWRgali45UhyqBMIe/B7m8GH0fjiN+Ork+UfSjoBA+i6wA8LDwqhgFADkU9AFi1m9FSQLAQ9yBqSRTHbxElM5A8gxOCz/48qQHveve7AUfCrSErhtXVDGPo3IOi1/oPx2sjXLwKHRDC/VLPj2G5JJQQQcTRVPH6e0CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766079800; c=relaxed/simple;
	bh=wETgaVi/4Srcrvn11NsykVRNrUKwSV1mN9QfsLJ8b7M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GUASwW2HG35GHOXovnF9uZZ3rA5Sp3FTJNO1seNj04LP67SrrhbLfdSGWCMvPevJjAAz/5yS7FAdQkFR5bJnsDhIH1lcq154epWdcBl2ea795C0xfr6dNOtpeeuQu2AZxBEXKtszmrdbQQeaK2/lPmLbsKgLaaqsR18ZaMUkdMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVA0gPSX; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVA0gPSX"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b713c7096f9so153939466b.3
        for <llvm@lists.linux.dev>; Thu, 18 Dec 2025 09:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766079794; x=1766684594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAT4NIB50wSSQJ2eRS7sx9I/iK0vGJNZ4n3UlMbS9UY=;
        b=MVA0gPSXlYbgdI0dF9r9JzOX+roVEdbowKwMVteOKXFDcUQtTIK6BCJ2VtiLcvfufZ
         7Omum9Ml8xO9eOY5IbQo+5oLV6hAivS6vjVv6bFuz24XsNSMeVzw+jIOCMbsU5dA4UB/
         bjX7stcfTqDFod7apc1H04TR7OdX2R/6IJ8tPh/+V1fLzPGosp8jozthjRWh2EuIFZu6
         LCndlsmiBIJVtf0Q6qErhAKA9BekYNmHaGQ7O4rEmpVpD81UktZc/oIY1dixDtot8XpC
         4F2y9NXZzu7EUA6OPQJy3jgdkG3eGoBiXjT0C1f7pZPv5HxgEYyOWO+LLqBT3k1H84rk
         qtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766079794; x=1766684594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CAT4NIB50wSSQJ2eRS7sx9I/iK0vGJNZ4n3UlMbS9UY=;
        b=RDFaoOzLjeDKmo2rWBzoJQj9m9A1wHzmw07Lh0fdYwTHR0wOPIP2g/R6gUarYWBYvC
         4nOfk6BkFU/VlQQ0CnUiedtXRf1Pvl6cKHh6cdfZyszdvi2TunuO4b7y+Crt5WGO+Hje
         vco9mb2MEE5kjWCNVxiQ7BrdHuTLC8sgVGIcdzH3xMfHLiMiETtnbEF5WRic6pVQ/3Tp
         FJJGbbDBK5L2TNZWxmZkzh/55ODpiRbj/aA8eY5JG0mKMiMQ66lFaxILTqnH3LXr0lyP
         r/5d/y3ALOb/16r6dT5ms7Ipd80LYB6Ql/oER5IrOoyYzQ4gPmXJXvSOKpnsHYUNgJRe
         JXSg==
X-Forwarded-Encrypted: i=1; AJvYcCUVNr+QJ1CkwnxZTuuxF8YtYE1btN4WlUd4cqX+9PKd2DAMXKjd3wty4g5FkKR1otF31NIy@lists.linux.dev
X-Gm-Message-State: AOJu0YyPf3Dgyu2FztfR8fvCKxSX8PkSRW9cGAEH23doT37Y9mcCebae
	PQykify4eX4QfOGsBqlKZJhdrpE8K0iMPc1IVtlI437i9shUIDz1t7y424h90g==
X-Gm-Gg: AY/fxX7gUBicyhXUTcEUsh/lnrLlxmoepDvTauFeqZ9NS0RJrOjsYoYYDe9Dg3h6Cds
	7VU6HsiJTArcLqomb3tZN7JpNuFdhaBXjQoz77fLG/YRbBKMrIRW61zd8zQtkoIGNbGy0Xund/U
	F8qP8fzz2YqrykHTjKwA1fe9IV3lFqVHiOh0DvLaWQfDsTO7VI8CDVTWeg8jPum2ufzEP7/Y39u
	dINjBxUGp+S88EB9xSqwy0LNR2Wh5Prh+4FEABL4XUlVYwEzMYF7VnMABpvElKuCdbnpZ6IW0jf
	wok09xwCf/a6iSdIRHUrn74VBZuEO/xwJn6UMJ/lHkdMQpcBZUEzCxOXTNMs/URRScxLHKaD+7j
	FQyQ61Y/5qB95mxJSwlBfg/vArmfEIEp/Zome0b3Q9kjv74ewU8myHamFsrIz0kMY7Eo/6yBwBW
	tWvYgQKpL6JWoFjdtUmA1xXvP5b7/cMFHjCi5UU2mFho+Hop6WWio3
X-Google-Smtp-Source: AGHT+IEX3LAgYnT5Lo93smJLzWDPMc1uQ4Aj1gMjYO0ty7+7jdOdeZ5GXQKimSTh9jzRGuiit8vdow==
X-Received: by 2002:a05:600d:1b:b0:477:a219:cdb7 with SMTP id 5b1f17b1804b1-47a8fa81e14mr202186375e9.0.1766073295465;
        Thu, 18 Dec 2025 07:54:55 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b749esm48092275e9.14.2025.12.18.07.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:54:55 -0800 (PST)
Date: Thu, 18 Dec 2025 15:54:52 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Joel Fernandes
 <joel@joelfernandes.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, John Stultz
 <jstultz@google.com>, Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Frederic Weisbecker <frederic@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, Ingo Molnar
 <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Mark Rutland
 <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil
 Babka <vbabka@suse.cz>, maged.michael@gmail.com, Mateusz Guzik
 <mjguzik@gmail.com>, Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
 rcu@vger.kernel.org, linux-mm@kvack.org, lkmm@lists.linux.dev, Gary Guo
 <gary@garyguo.net>, Nikita Popov <github@npopov.com>, llvm@lists.linux.dev
Subject: Re: [RFC PATCH v4 1/4] compiler.h: Introduce ptr_eq() to preserve
 address dependency
Message-ID: <20251218155452.6ae47481@pumpkin>
In-Reply-To: <cb55e583-395f-4b83-925f-c341c95903c1@efficios.com>
References: <20251218014531.3793471-1-mathieu.desnoyers@efficios.com>
	<20251218014531.3793471-2-mathieu.desnoyers@efficios.com>
	<20251218090313.33923750@pumpkin>
	<cb55e583-395f-4b83-925f-c341c95903c1@efficios.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 18 Dec 2025 08:51:02 -0500
Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:

> On 2025-12-18 04:03, David Laight wrote:
> [...]
> >> + *
> >> + * The compiler barrier() is ineffective at fixing this issue. It does
> >> + * not prevent the compiler CSE from losing the address dependency:
> >> + *
> >> + * int fct_2_volatile_barriers(void)
> >> + * {
> >> + *     int *a, *b;
> >> + *
> >> + *     do {
> >> + *         a = READ_ONCE(p);
> >> + *         asm volatile ("" : : : "memory");
> >> + *         b = READ_ONCE(p);
> >> + *     } while (a != b);
> >> + *     asm volatile ("" : : : "memory");  <-- barrier()
> >> + *     return *b;
> >> + * }
> >> + *
> >> + * With gcc 14.2 (arm64):
> >> + *
> >> + * fct_2_volatile_barriers:
> >> + *         adrp    x0, .LANCHOR0
> >> + *         add     x0, x0, :lo12:.LANCHOR0
> >> + * .L2:
> >> + *         ldr     x1, [x0]  <-- x1 populated by first load.
> >> + *         ldr     x2, [x0]
> >> + *         cmp     x1, x2
> >> + *         bne     .L2
> >> + *         ldr     w0, [x1]  <-- x1 is used for access which should depend on b.
> >> + *         ret
> >> + *
> >> + * On weakly-ordered architectures, this lets CPU speculation use the
> >> + * result from the first load to speculate "ldr w0, [x1]" before
> >> + * "ldr x2, [x0]".
> >> + * Based on the RCU documentation, the control dependency does not
> >> + * prevent the CPU from speculating loads.  
> > 
> > I'm not sure that example (of something that doesn't work) is really necessary.
> > The simple example of, given:
> > 	return a == b ? *a : 0;
> > the generated code might speculatively dereference 'b' (not a) before returning
> > zero when the pointers are different.  
> 
> In the past discussion that led to this new API, AFAIU, Linus made it
> clear that this counter example needs to be in a comment:

I might remember that...

But if you read the proposed comment it starts looking like an example.
It is also very long for the file it is in - even if clearly marked as why
the same effect can't be achieved with barrier().
Maybe the long gory comment belongs in the rst file?

I do wonder if some places need this:
#define OPTIMISER_HIDE_VAL(x) ({ auto _x = x; OPTIMISER_HIDE_VAR(_x); _x; })

Then you could do:
#define ptr_eq(x, y) (OPTIMISER_HIDE_VAL(x) == OPTIMISER_HIDE_VAL(y))
which includes the check that the pointers are the same type.

But it would be more generally useful for hiding constants from the optimiser.

	David

> 
> https://lore.kernel.org/lkml/CAHk-=wgBgh5U+dyNaN=+XCdcm2OmgSRbcH4Vbtk8i5ZDGwStSA@mail.gmail.com/
> 
> This counter-example is what convinced him that this addresses a real
> issue.
> 
> Thanks,
> 
> Mathieu
> 
> 

