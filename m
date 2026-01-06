Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A382FC86B
	for <llvm@lists.linux.dev>; Tue,  6 Jan 2026 17:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767720892; cv=none; b=rbLNfLtUknM6J3dJvnhTiJYyFjKqsNreYK6Xk4xCowNUCQggYiM9WISj4r81ztSkxMCY5QXGlFRMCnGYvyRGtkQQgykZSLygWX4UH4aAUAsRwOnzV3l8ILWWEPD2ihhrq1G5n0LAv0UCkmSmf3KR0X8hoEHFnizXwa3Fx6krVkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767720892; c=relaxed/simple;
	bh=vbg/4Kuy8+wEtCaTdI808rOQJV/eEI0U33FeZ9sxcno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfPI6Omo0bwUZ3m4IQYlskjEBzocwwIvwtI28PtSfJ6eqxawaJH7Rh4snWe9LhjzjNLT86iTME+IH6+ZzC9L8jQYtAzTLtTqo6Ia3tab+2hvwauZMNzmAwmbW971aRA++sQmFeAejRhsnemQs43jLgCZOCVJmjwcWoYh/yYP6tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M65MvuV2; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M65MvuV2"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so12763275e9.2
        for <llvm@lists.linux.dev>; Tue, 06 Jan 2026 09:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767720888; x=1768325688; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXcHtzljW/LEwcnvhUw7B+CYy+kN5WC/pk6M+qEtNI0=;
        b=M65MvuV2ulg25bK8utnuu7Bu3SjSwHFmHl28d4760UG2Sbdd1MA4VXrsnARynIUzVD
         nvnnGZeOhN4aG88Bocl6q9FrAKBrZuwRV1HDS3jxyMj9XBOp4b+MKM6hxSrl1TcJD0T0
         /7I81m2yB5YZ2YRKjFBTNwtjy1Kaw036mVHDWVqT+0T2bZRhQk2zwkitJ1u7/UuEfhDc
         OLQI8/BK6nWDA3mtU6+8Q4KTvDiYwrI1LYn7++dHGyVYyyckrVQPXBRCSWJOsZz57cOB
         zwQaBV/OwJ2MrQpgyieddnac9ZExlOr8KM1L1gk1EtHiOy92R7f2qk4CaiD9O9pFBe6s
         q9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767720888; x=1768325688;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RXcHtzljW/LEwcnvhUw7B+CYy+kN5WC/pk6M+qEtNI0=;
        b=TBqM8wOXhv/ezRrBO+HX14IYz5UYLnJpQSGDOutW4/Z6HrgoSS8E3GMet+pfoWVRsh
         qp/XaCN5HkBrpgFL1C0Cno5F1Q5CeaqGHzmrdHrym9QURiAd3pjH/rLPClVE1jlR/IL4
         RWNQWHnyzRvas/g8LP0ztDgtKjjea9SMn7W4DZ5LU05IoK66BBNPQ3F15nvsoui7p+am
         XVV0msQXG89ETyvYbHVhbzEjq+vT/5Z4FoIIxRo5EywKK+svbATAYzmvkobd4K0YTg8x
         SC4rcVrjPtr8zEaW+H3u7OL3pzatGpXTXP6Tm2R+DLyTqmNJWfWIdC/TEcNnO6xDS/SY
         0imA==
X-Forwarded-Encrypted: i=1; AJvYcCVmB1sanKXIQIR3WVkPlWv+OXLAgfmWuEG3lX5xu9Phei9OQ9/2jGRw7mOgOTHiQlInkN15@lists.linux.dev
X-Gm-Message-State: AOJu0YxjxGo4px4H9DU7vVqcLNqxUE3jteNUEks9grsUuff5tlWFtHpa
	Ua0VXQcpSKTe5hHQAzZqwQVBldXYp+RVFMhd63zFalDHbREZZWRQwl01ZsriyD67BA==
X-Gm-Gg: AY/fxX5XZFkOQ/rA66MtWj8XUheISs03KQ9TdbisNXul0vMy+PTNAAiuEVStKefSWl/
	DBbJDdt8DyXCS9j5fgTGTB+J9Fwl6DejYP2rDrBKK4BfhsKk0cspf7EZe7wrq4H6K0/cBpxSPFq
	zvEbInPy36S8518w6/XgbvZa4sKxFmodLgERs86eIX53ZrVEjOv0QfcmaYRBq2XsNwdrH1lriSW
	NCVIDF87Mkt9BlEe7rOonPtojCJOTroiolalvAzahkZ7o8/P3MvSHJ5Y73Kp74oBwWSKJ4lh5h2
	6c1R/6MtyjIvF3TrdGjaS+MGSrD/GoY3l/ypLVgXAfvhBHBAhXUlAGxkWqzkGJEhfsAwJLmEiPM
	B5/vNx4E+S3JfwThrYiZ9P57rDwrAdB09Hu576EmTw30E4kKQNE1XGIFoSKChui4+rAeEEp+lox
	Q9eACKytZc/QBemGie7HKoPgpDSSu/XX0sqAcA2eQJzLKhtXU8
X-Google-Smtp-Source: AGHT+IHmVK6EqE14VH+HPUL16Zk51harYxsBJJheKVL1BeqXTS/M31ba8unH1eaK7+ALdSr4nMxyjw==
X-Received: by 2002:a05:600c:46ca:b0:477:7a53:f493 with SMTP id 5b1f17b1804b1-47d7f0980e2mr44046495e9.23.1767720888108;
        Tue, 06 Jan 2026 09:34:48 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:4477:8df2:f516:1bd3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7fb4b3c5sm21868415e9.15.2026.01.06.09.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:34:47 -0800 (PST)
Date: Tue, 6 Jan 2026 18:34:39 +0100
From: Marco Elver <elver@google.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	Chris Li <sparse@chrisli.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>,
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>,
	Eric Dumazet <edumazet@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ian Rogers <irogers@google.com>, Jann Horn <jannh@google.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Triplett <josh@joshtriplett.org>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Kentaro Takeda <takedakn@nttdata.co.jp>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
	Uladzislau Rezki <urezki@gmail.com>,
	Waiman Long <longman@redhat.com>, kasan-dev@googlegroups.com,
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-security-module@vger.kernel.org,
	linux-sparse@vger.kernel.org, linux-wireless@vger.kernel.org,
	llvm@lists.linux.dev, rcu@vger.kernel.org
Subject: Re: [PATCH v5 06/36] cleanup: Basic compatibility with context
 analysis
Message-ID: <aV1HrwZm6xg8PnRU@elver.google.com>
References: <20251219154418.3592607-1-elver@google.com>
 <20251219154418.3592607-7-elver@google.com>
 <993d381a-c24e-41d2-a0be-c1b0b5d8cbe9@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <993d381a-c24e-41d2-a0be-c1b0b5d8cbe9@I-love.SAKURA.ne.jp>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Tue, Jan 06, 2026 at 10:21PM +0900, Tetsuo Handa wrote:
> On 2025/12/20 0:39, Marco Elver wrote:
> > Introduce basic compatibility with cleanup.h infrastructure.
> 
> Can Compiler-Based Context- and Locking-Analysis work with conditional guards
> (unlock only if lock succeeded) ?
> 
> I consider that replacing mutex_lock() with mutex_lock_killable() helps reducing
> frequency of hung tasks under heavy load where many processes are preempted waiting
> for the same mutex to become available (e.g.
> https://syzkaller.appspot.com/bug?extid=8f41dccfb6c03cc36fd6 ).
> 
> But e.g. commit f49573f2f53e ("tty: use lock guard()s in tty_io") already replaced
> plain mutex_lock()/mutex_unlock() with plain guard(mutex). If I propose a patch for
> replacing mutex_lock() with mutex_lock_killable(), can I use conditional guards?
> (Would be yes if Compiler-Based Context- and Locking-Analysis can work, would be no
>  if Compiler-Based Context- and Locking-Analysis cannot work) ?

It works for cond guards, so yes. But, only if support for
mutex_lock_killable() is added. At the moment mutex.h only has:

	...
	DEFINE_LOCK_GUARD_1(mutex, struct mutex, mutex_lock(_T->lock), mutex_unlock(_T->lock))
	DEFINE_LOCK_GUARD_1_COND(mutex, _try, mutex_trylock(_T->lock))
	DEFINE_LOCK_GUARD_1_COND(mutex, _intr, mutex_lock_interruptible(_T->lock), _RET == 0)

	DECLARE_LOCK_GUARD_1_ATTRS(mutex,	__acquires(_T), __releases(*(struct mutex **)_T))
	#define class_mutex_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(mutex, _T)
	DECLARE_LOCK_GUARD_1_ATTRS(mutex_try,	__acquires(_T), __releases(*(struct mutex **)_T))
	#define class_mutex_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(mutex_try, _T)
	DECLARE_LOCK_GUARD_1_ATTRS(mutex_intr,	__acquires(_T), __releases(*(struct mutex **)_T))
	#define class_mutex_intr_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(mutex_intr, _T)
	...

And we also have a test in lib/test_context-analysis.c checking it
actually works:

	...
	scoped_cond_guard(mutex_try, return, &d->mtx) {
		d->counter++;
	}
	scoped_cond_guard(mutex_intr, return, &d->mtx) {
		d->counter++;
	}
	...

What's missing is a variant for mutex_lock_killable(), but that should
be similar to the mutex_lock_interruptible() variant.
