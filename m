Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098D51DE2B7
	for <llvm@lists.linux.dev>; Fri,  7 Feb 2025 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920755; cv=none; b=dFsyApCMDETXPDxGSeorrrJDAIGYa5bfuduRO6EcM0uLLCWjhAWL3jbR0kSEyrilmN3Og6Tsu5nHxRvBL08U9fj3UBW0iFAIgVZyFHupS7tNVo9nZl41blX483urlsV5obCZakrg3L1WUFBTwMrwBCtSc8l8bNO+po18F3Dku40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920755; c=relaxed/simple;
	bh=U5K/bmzzMNTyixCzS6tI8UaoaljUYYEAWu8cFv9t0pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSNPhjTzU2iG8uIHWMDYtYEop6GlfLQaZVvBlD/do7TAjPBL4IKs0FilV9rnlQtamPoOcOgyJ7CaoEGlhCodZHSXpsd/470HRAIdQ2ivSfx3s+CJz6OKv42R/rdOfsceAyuvqW2SMpmY6XMO8j6SEIGmtra8GHOxtd0K+Fj4HmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YHEXLlfq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YHEXLlfq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so18304175e9.1
        for <llvm@lists.linux.dev>; Fri, 07 Feb 2025 01:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738920752; x=1739525552; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8aNJoNQ8/KZ3zGcS/1S9RhAv2oCaPXrYb2HHOjsrgw=;
        b=YHEXLlfqsiBEa9Nf0czGs6dFWpAwaqMSdnmnW/9D2QBTwAXJ1wDlnz2PuVIi/PaHLP
         mwHo7FmdBzzjFuOtZFbMwApkGAmzteNiAYl3RwbVJPCIXnGMrU75XLSoQrGV2lY1xes4
         gFnWXxG47CnaUoTh7GEFFbQfIidJA3UjdSXvdPNYba2KZY5/v8iLyLr5VJo2xcm4h3r2
         M/2zs4AtU12n/KR6QpDDyldG4jrsbK0HJAlgZt9dbhohUUmTxd9H5v4m+1IoyWhx1pBa
         Fai+OUa0RWf1+N1AeA7VCnKG5fjqgA/V9PZCVcbEsAvh8Ko8EDjDoVb2dIRcvdeUwfEW
         LeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920752; x=1739525552;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8aNJoNQ8/KZ3zGcS/1S9RhAv2oCaPXrYb2HHOjsrgw=;
        b=Iu6PmQHDIbFdBbrNrYcHe2uZRunnX6ryDBZhLuM6GdlWU4a3/050ueGUmCmZfUuhT9
         oErV3uiwTDSZ3Z3CmtDJmUVGC2+zn3uE6hwIalYR5DxScVY8NKf1+jnN8YYIdRQnjQL0
         peduxEKGkzYP61fvH2eZ2ny1Sb1hbAfkfq78TLvS5YRp0qYNCXOzYfAD4UB41u4Sd5qj
         yzEM4uVinTYzgy/S8UPWUbYZUN7CxfbGOuxIb9z4zBxqVXx2lR/BHPuZzK1vpyC/laeI
         ma2oanopE4APhvnCo0RjKEDQlyNbhf/tDerT4ZUWkWmyFc63u5m7/cmTypYVJJ/UgN9E
         uH8w==
X-Forwarded-Encrypted: i=1; AJvYcCWVU4iA44pAZ9jpW6AWbi7vW+kAP9HCsTM+Hv+EjQ2VR2ZgmPOkOt/4BHMfP1qiwSvdJS3g@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8RhUCxudsyRHjgnzhZSVYZQs8zklhV93QCmCLOHcDefRLX84A
	RPZl9dmD/Go0F3q+ncWg1hRfF/dhw0lJ05NVrOqZhtUmW5BF1lKaVmneP/W+7w==
X-Gm-Gg: ASbGnct236HI2uQ0TIQCuj6H1xbgQlgihyevcXZeqFB5v9rLu6yH2O1XkTKpJJiOnkT
	oKYDUk7oq5pApIbHwbwJoir0qgRzigd+UcFKOJi9B0VxjA1byRy98iX7CW8NpbPPUrZNd7m77jB
	Vc+TGK7fkHfCCh27gZ5dqcuTB7++aM5SIsChcxjDCViGYgnai69c1JulIhHLpMTwRPm/iIMmO1C
	rSgxTCuiO7Xsg89xAIY1SUMx1OrDOHE/ptoC5rc+eCeU3Ih+vNNK2uBxl0ZaDk8ZhOrBG/Aq50o
	IF/eAAfEq0CNrJ3O
X-Google-Smtp-Source: AGHT+IFjez7z/oMyp8FZ4MzUt+FHIKHXHPa3EjEklv71c4Z6v/8R41o727c+Gb8EycHsA7aojSutXg==
X-Received: by 2002:a05:600c:19c9:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-4392498c08cmr20059475e9.9.1738920752144;
        Fri, 07 Feb 2025 01:32:32 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:9c:201:fad3:ca37:9540:5c99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfdc1acsm48592775e9.40.2025.02.07.01.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 01:32:31 -0800 (PST)
Date: Fri, 7 Feb 2025 10:32:25 +0100
From: Marco Elver <elver@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@kernel.org>, Jann Horn <jannh@google.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Triplett <josh@joshtriplett.org>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, rcu@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH RFC 02/24] compiler-capability-analysis: Rename
 __cond_lock() to __cond_acquire()
Message-ID: <Z6XTKTo_LMj9KmbY@elver.google.com>
References: <20250206181711.1902989-1-elver@google.com>
 <20250206181711.1902989-3-elver@google.com>
 <20250207082832.GU7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207082832.GU7145@noisy.programming.kicks-ass.net>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Fri, Feb 07, 2025 at 09:28AM +0100, Peter Zijlstra wrote:
> On Thu, Feb 06, 2025 at 07:09:56PM +0100, Marco Elver wrote:
> > Just like the pairing of attribute __acquires() with a matching
> > function-like macro __acquire(), the attribute __cond_acquires() should
> > have a matching function-like macro __cond_acquire().
> > 
> > To be consistent, rename __cond_lock() to __cond_acquire().
> 
> So I hate this __cond_lock() thing we have with a passion. I think it is
> one of the very worst annotations possible since it makes a trainwreck
> of the trylock code.
> 
> It is a major reason why mutex is not annotated with this nonsense.
> 
> Also, I think very dim of sparse in general -- I don't think I've ever
> managed to get a useful warning from between all the noise it generates.

Happy to reduce the use of __cond_lock(). :-)
Though one problem I found is it's still needed for those complex
statement-expression *_trylock that spinlock.h/rwlock.h has, where we
e.g. have (with my changes):

	#define raw_spin_trylock_irqsave(lock, flags)		\
		__cond_acquire(lock, ({				\
			local_irq_save(flags);			\
			_raw_spin_trylock(lock) ?		\
			1 : ({ local_irq_restore(flags); 0; }); \
		}))

Because there's an inner condition using _raw_spin_trylock() and the
result of _raw_spin_trylock() is no longer directly used in a branch
that also does the unlock, Clang becomes unhappy and complains. I.e.
annotating _raw_spin_trylock with __cond_acquires(1, lock) doesn't work
for this case because it's in a complex statement-expression. The only
way to make it work was to wrap it into a function that has attribute
__cond_acquires(1, lock) which is what I made __cond_lock/acquire do.

For some of the trivial uses, like e.g.

	#define raw_spin_trylock(lock)	__cond_acquire(lock, _raw_spin_trylock(lock))

it's easy enough to remove the outer __cond_lock/acquire if e.g. the
_raw_spin_trylock has the attribute __cond_acquires. I kept these around
for Sparse compatibility, but if we want to get rid of Sparse
compatibility, some of those can be simplified.
