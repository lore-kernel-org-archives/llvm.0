Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CB62882B7
	for <llvm@lists.linux.dev>; Mon,  2 Feb 2026 19:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770060569; cv=none; b=lph3NfSbXPY7hvZpIwkysNZbCrZzHdtmxL84mZpjbUFoPDprFjn16QQtzj2yYIG+ip21tTZtj7YOvffl1LILPKssPbG3D/JspvOKPmJqiwVhRssJYf5rTdFGMcl/cMbYqqL/+n5D0N8WPR2bculbVWD+5AYkQXWh/Igr3hidarU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770060569; c=relaxed/simple;
	bh=frZ9EwnF41UwE05JKAdE+N2X85q0Wy9krJRH9SZYZ5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EtXE1x4ykF2SeApejOr1HhWKONKhf9Qp9J5ORTc9vO3WYEX8nmUf3VwNEamdf64tZPyOfhOba+hE3ehMYqXu7SgFUgy3nxW4suKI2MDPall8aN543drd6Es/IjSVn4WBER+sRw5Aj9B6+zATVt9QsC7jzY2Lrb5SnJe0bXu1ers=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dx6VD/cD; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dx6VD/cD"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4801bc32725so36805875e9.0
        for <llvm@lists.linux.dev>; Mon, 02 Feb 2026 11:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770060566; x=1770665366; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hfuro15FK7ZMNo95mSwjrDaX9JD681ZAOPgzp/YRA90=;
        b=dx6VD/cDdeLsEVgVY7RO2SJC0BBzSk8t7SVnxxZXp9dTSz36jbHBVvJZsh7fxVrXjP
         1QthQvUKfZJ0NIOXpR/YVfhjCsYSCMfstxAGL8nYecTsGcbjXWdXkku/qIAvkgAWdCrZ
         3cYEwrWQo7CtJgimFA+by75lqEaP6302VrjJxOq78xG9/kMK3L30xQxbbSiPprHWwdCJ
         V2UoocH6KS7EdlQ/Th8R5djsUjECTg02ngqrxf6fFWZOlGzKMm9WUuT0XzbLIRCr5tLd
         ZGGn8jn0DyA1JyxiByfwqCUBk+mbymgmvcq8pHwJGyxyIqqlD4PPZnOHYxqGC4hmj/5Z
         BUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770060566; x=1770665366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hfuro15FK7ZMNo95mSwjrDaX9JD681ZAOPgzp/YRA90=;
        b=da17ADTNbi91RM6kvyr/aKOuU/FSYi5xj7wMf61wS701spXTAvGDMBCI0ty+JUz4r2
         3VUMik7k8WF7aq8j3D3cFWAIvemNbl4SxFuo/m6PxJbfNxqjeu1gxH35jaiino8ZlpEz
         wS4ix2Vffmbi3tFQbE2JiVgMbE5Veig6zuvSAy1E/QZw6awm+JCehsdgfRuVN5Y4YVfp
         0vtnZjitzOKUGOzjv8rDUGkrHd5LtQvGKaaBKTOMwGChzf0xluNov10MbqhTlkLieP/w
         M6bchl5N129HdpBd5g+Ndwl/uXhh8OzkbdJMREgV0ai2ebo79Ma45rPv5UX9T76djVUh
         I6ng==
X-Forwarded-Encrypted: i=1; AJvYcCVuURaIL4gxewWGMwbnlJ4WglngRRrEB3Vbao5WhxZHbnLv97oUBjMyyu61ZV1sJvhdz0Cu@lists.linux.dev
X-Gm-Message-State: AOJu0YzMG9Bc2jPGZ0/2rEkP4xYqolqzUhiAXLeJuq0ZH08/iz7UAdRf
	uRO+BFpvFz2zD94rjbB3ocjDda/m3+8ne2WVB8z0CqrGC/IXvPL/TXvd
X-Gm-Gg: AZuq6aJtNYDyAWqQaeHVwnNQOXv3A+vP5xjsP+61MqpVflzRlBCvBYpU6pUNSFwhaEo
	KLJNV+8VwAAkYU/LbjFq/97JBoCwhKbb1qaJiMTq7cQBaIiVnNBRXdFzxDBRRAXlZO7+/ApTve8
	dxQw592grF3H7wIV4abAAu5M3/RDFhErLt4fMvUHWZHGj88GVxku0LcbrHxtJzi/CUWx1LK3P1y
	z0FfKOX+hace7B2xJEqzpRNWlfGxYTFrsD0gz/pYewQcen8WnyBPLrEzmIxVtpmKFipCbPW0xIB
	BuKYvbqtqo2t+90p1c0htNpoq87BEeTsa66BnEE+ure63ER0JhlV2f+7u+kCMlCvqDQgAlp7/xB
	ErCNkG2QYZfC/WZ3pkC6m5SRnkqULxnm3MALjLlLvDXBCpMBZD28nVIEeBoTzvvfQIXRO0jUX1A
	mL+OBde2ZCBf+OjOIsSgTYaMuL1huaugqNo4L4kOB/ItNAwF/kY1Pt
X-Received: by 2002:a05:600c:190d:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-482db452371mr173238135e9.5.1770060565481;
        Mon, 02 Feb 2026 11:29:25 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830511bfc6sm20203095e9.2.2026.02.02.11.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:29:25 -0800 (PST)
Date: Mon, 2 Feb 2026 19:29:23 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Will Deacon <will@kernel.org>
Cc: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260202192923.0707e463@pumpkin>
In-Reply-To: <aYDFOIskB20CbztD@willie-the-truck>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-4-elver@google.com>
	<aYDFOIskB20CbztD@willie-the-truck>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 2 Feb 2026 15:39:36 +0000
Will Deacon <will@kernel.org> wrote:

> On Fri, Jan 30, 2026 at 02:28:26PM +0100, Marco Elver wrote:
> > When enabling Clang's Context Analysis (aka. Thread Safety Analysis) on
> > kernel/futex/core.o (see Peter's changes at [1]), in arm64 LTO builds we
> > could see:
> > 
> > | kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
> > |      982 | }
> > |          | ^
> > |    kernel/futex/core.c:976:2: note: spinlock acquired here
> > |      976 |         spin_lock(lock_ptr);
> > |          |         ^
> > | kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
> > |      982 | }
> > |          | ^
> > |    kernel/futex/core.c:966:6: note: spinlock acquired here
> > |      966 | void futex_q_lockptr_lock(struct futex_q *q)
> > |          |      ^
> > |    2 warnings generated.
> > 
> > Where we have:
> > 
> > 	extern void futex_q_lockptr_lock(struct futex_q *q) __acquires(q->lock_ptr);
> > 	..
> > 	void futex_q_lockptr_lock(struct futex_q *q)
> > 	{
> > 		spinlock_t *lock_ptr;
> > 
> > 		/*
> > 		 * See futex_unqueue() why lock_ptr can change.
> > 		 */
> > 		guard(rcu)();
> > 	retry:  
> > >>		lock_ptr = READ_ONCE(q->lock_ptr);  
> > 		spin_lock(lock_ptr);
> > 	...
> > 	}
> > 
> > At the time of the above report (prior to removal of the 'atomic' flag),
> > Clang Thread Safety Analysis's alias analysis resolved 'lock_ptr' to
> > 'atomic ?  __u.__val : q->lock_ptr' (now just '__u.__val'), and used
> > this as the identity of the context lock given it cannot "see through"
> > the inline assembly; however, we want 'q->lock_ptr' as the canonical
> > context lock.
> > 
> > While for code generation the compiler simplified to '__u.__val' for
> > pointers (8 byte case -> 'atomic' was set), TSA's analysis (a) happens
> > much earlier on the AST, and (b) would be the wrong deduction.
> > 
> > Now that we've gotten rid of the 'atomic' ternary comparison, we can
> > return '__u.__val' through a pointer that we initialize with '&x', but
> > then update via a pointer-to-pointer. When READ_ONCE()'ing a context
> > lock pointer, TSA's alias analysis does not invalidate the initial alias
> > when updated through the pointer-to-pointer, and we make it effectively
> > "see through" the __READ_ONCE().
> > 
> > Code generation is unchanged.
> > 
> > Link: https://lkml.kernel.org/r/20260121110704.221498346@infradead.org [1]
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Tested-by: Boqun Feng <boqun@kernel.org>
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> > v3:
> > * Use 'typeof(*__ret)'.
> > * Commit message.
> > 
> > v2:
> > * Rebase.
> > ---
> >  arch/arm64/include/asm/rwonce.h | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> > index 42c9e8429274..b7de74d4bf07 100644
> > --- a/arch/arm64/include/asm/rwonce.h
> > +++ b/arch/arm64/include/asm/rwonce.h
> > @@ -45,8 +45,12 @@
> >   */
> >  #define __READ_ONCE(x)							\
> >  ({									\
> > -	typeof(&(x)) __x = &(x);					\
> > -	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
> > +	auto __x = &(x);						\
> > +	auto __ret = (__rwonce_typeof_unqual(*__x) *)__x;		\
> > +	/* Hides alias reassignment from Clang's -Wthread-safety. */	\
> > +	auto __retp = &__ret;						\
> > +	union { typeof(*__ret) __val; char __c[1]; } __u;		\
> > +	*__retp = &__u.__val;						\
> >  	switch (sizeof(x)) {						\
> >  	case 1:								\
> >  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> > @@ -71,7 +75,7 @@
> >  	default:							\
> >  		__u.__val = *(volatile typeof(*__x) *)__x;		\
> >  	}								\
> > -	__u.__val;							\
> > +	*__ret;								\
> >  })  
> 
> What does GCC do with this? :/

GCC currently doesn't see it, LTO is clang only.

	David

> 
> Will

