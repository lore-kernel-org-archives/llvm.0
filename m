Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AA7331A46
	for <llvm@lists.linux.dev>; Mon, 15 Dec 2025 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765805945; cv=none; b=hTVMPMXwXyHIfqGOIhJ08LBPBBPk6l5zQTkXdDbkNe6EX7+vVjehANWsfuhKmp39rLIyORLsGz637tzTf2cSszUSCYKvVx3nkWCn95ksHI8k8PLHDUVFxXvsKGszkEBZwcSBRYOm0r1q9+Pki8cT1QTPacVmF465aKjIn0h8L3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765805945; c=relaxed/simple;
	bh=0RJ8hn5UA+jBMKgL2vexCP4P2w3UyioHPbHfmWoCqpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJjiJ516mVNJNCWSXON2wCIySApmi60ETSumIkZJQTrE0iwJuaSykD6a3oAGbnRSthddMwXjQyAsLVRre+OPBfHhmnUQW6pF+FQCxNu6Z6kJWbXi+m/S+Bkkb7R/JiAbcX7yaGqNntGcYjwGy3jG1tEDC3iHKT/oHEbZ34VJ95U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FJHxOKqv; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FJHxOKqv"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fbc305882so1250666f8f.0
        for <llvm@lists.linux.dev>; Mon, 15 Dec 2025 05:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765805940; x=1766410740; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HP7wXZoAxj3YG64MFXhffqc9TkW1sld9ucKsb/6ZFh4=;
        b=FJHxOKqvjRnJk3dWXCFQRbASFEV2WOLtLslLiyZZdA5FV+JojWkk4BzcQtS16pfjgw
         dZqPfXma/uZOQ769qSoGqZUt2axk+pXxfEomrbngISeAGl3LMcrnl8fgelNQD0m0lr7b
         b1nLK3ILbuwzw+mPrOlLllKuieqiYe7nJkI1MebqvzjqLQ+Xeg61gUBlQU+ev6jgGMR1
         3U3id1+mjGQ09h9NqiPIbkIJc1ZKuClYnOOQ3ZI/fkEKFLsKQOoC/0hNiDwHHiasF7ms
         mPuwjxbzg194lwOq/F/xPKf25EV5p1jfXT1I3JvVD1avi5p169ZTB2VcdIqbqmIY+CjO
         irhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765805940; x=1766410740;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HP7wXZoAxj3YG64MFXhffqc9TkW1sld9ucKsb/6ZFh4=;
        b=AQTebH1pCfkoGxfASkbZC/sUF3cLwQZe6ZnWedfdP1AiWVYXMNWfdPKkKdFXATymCV
         gfSV/0pTiorpTcjW4Arua+C1SVxXwzBnAe+AYSsxzwS2061dCuVsVFXqpPLDoFUQooqA
         jWyBRm5H4Z6Dl4mUBtX2LW7Tabvzz9VfQplGHKBRcBL5TDyjkHvKIdHSXdObqWHj9k3S
         GWlYZg6iIDdbGersp2QypraorhqYIqzZym3TiRkXl4fQxGwUfltedHdmW0lnENCA70WC
         42n3VcGH9xmDG1j8Dlqkr6yzmO3zO+P5tksjwhP+qIgrXH2nbas7m9xy5FUvI24rgj0i
         WjCw==
X-Forwarded-Encrypted: i=1; AJvYcCWHbm/AjbE7SnWFFU4RyuKxjBxm5i1F5EEvof3Deq8oZOI4Hjad0Eo/IADbevjt/vXbusrW@lists.linux.dev
X-Gm-Message-State: AOJu0YxYGwFUU0/IYfOSXzh5r6DFfsKuJeib2Np+DQ6XEcwQT2S4IFB4
	KIiKln6994+L66quLwySCu3ivioUakgXQzCh6gbbhVUUVhLscyksyoLzoBzHXFJu9A==
X-Gm-Gg: AY/fxX7dIv66Pt948w32pHH2gSaY9XsOtjDaWSNwW62NFj0Wzx/9ey0Tq0zOvfn5k5P
	P/Fp7mROIcqeDj9QZZfbhZRcnTci6Y9gwiGQ4C8XpM05PfMqcfEpkQTj1z6FbyQJ6lTiCuquWuq
	8MfQDk1flpW+JnjvKNhNdJMf2mCXXEpDGPEWW+03VM4ExkJ5kuXfAU9t10DXKBRtUNh9LJX38hB
	ZzOB4j35ltRHe3eUNb0Ubb+n2ZjBXI1xEy7wroswItcS4/dxX88AnU9Sx88D+97hq1oRU3hDnCH
	WJOyOGRckuunp8Whl0mvb6CYtg1gPKb7GOqUn4/+jJ9Evg2MX1OY/lfJtkOrzklWyrNlOE7AEMx
	4+b4XjxqHS9dwyAAiYe+9Oba87mt9IopsQ7DFoP6dvv0MnLt2gLJpCxxbqzWG/gkHh8yIM5xmSt
	RJkhL/vg9HTZtT5XN5lsO0Gv79Ff0cCHBvRz04QagUJl+X7Sqz
X-Google-Smtp-Source: AGHT+IH6RRE6qce8+BKlIh2iGfXIIE/0drfAuueOfe5s5dH/DcFdShyJ99GxaUFmEfIgshY9jhag6g==
X-Received: by 2002:a05:6000:310f:b0:430:f7dc:7e8e with SMTP id ffacd0b85a97d-430f7dc809cmr4594614f8f.34.1765805939977;
        Mon, 15 Dec 2025 05:38:59 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:5741:4422:4d1d:b335])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fb68866f3sm21319081f8f.36.2025.12.15.05.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 05:38:59 -0800 (PST)
Date: Mon, 15 Dec 2025 14:38:52 +0100
From: Marco Elver <elver@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
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
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
	Uladzislau Rezki <urezki@gmail.com>,
	Waiman Long <longman@redhat.com>, kasan-dev@googlegroups.com,
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-security-module@vger.kernel.org,
	linux-sparse@vger.kernel.org, linux-wireless@vger.kernel.org,
	llvm@lists.linux.dev, rcu@vger.kernel.org
Subject: Re: [PATCH v4 06/35] cleanup: Basic compatibility with context
 analysis
Message-ID: <aUAPbFJSv0alh_ix@elver.google.com>
References: <20251120145835.3833031-2-elver@google.com>
 <20251120151033.3840508-7-elver@google.com>
 <20251211121659.GH3911114@noisy.programming.kicks-ass.net>
 <CANpmjNOmAYFj518rH0FdPp=cqK8EeKEgh1ok_zFUwHU5Fu92=w@mail.gmail.com>
 <20251212094352.GL3911114@noisy.programming.kicks-ass.net>
 <CANpmjNP=s33L6LgYWHygEuLtWTq-s2n4yFDvvGcF3HjbGH+hqw@mail.gmail.com>
 <20251212110928.GP3911114@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212110928.GP3911114@noisy.programming.kicks-ass.net>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Fri, Dec 12, 2025 at 12:09PM +0100, Peter Zijlstra wrote:
> On Fri, Dec 12, 2025 at 11:15:29AM +0100, Marco Elver wrote:
> > On Fri, 12 Dec 2025 at 10:43, Peter Zijlstra <peterz@infradead.org> wrote:
> > [..]
> > > > Correct. We're trading false negatives over false positives at this
> > > > point, just to get things to compile cleanly.
> > >
> > > Right, and this all 'works' right up to the point someone sticks a
> > > must_not_hold somewhere.
> > >
> > > > > > Better support for Linux's scoped guard design could be added in
> > > > > > future if deemed critical.
> > > > >
> > > > > I would think so, per the above I don't think this is 'right'.
> > > >
> > > > It's not sound, but we'll avoid false positives for the time being.
> > > > Maybe we can wrangle the jigsaw of macros to let it correctly acquire
> > > > and then release (via a 2nd cleanup function), it might be as simple
> > > > as marking the 'constructor' with the right __acquires(..), and then
> > > > have a 2nd __attribute__((cleanup)) variable that just does a no-op
> > > > release via __release(..) so we get the already supported pattern
> > > > above.
> > >
> > > Right, like I mentioned in my previous email; it would be lovely if at
> > > the very least __always_inline would get a *very* early pass such that
> > > the above could be resolved without inter-procedural bits. I really
> > > don't consider an __always_inline as another procedure.
> > >
> > > Because as I already noted yesterday, cleanup is now all
> > > __always_inline, and as such *should* all end up in the one function.
> > >
> > > But yes, if we can get a magical mash-up of __cleanup and __release (let
> > > it be knows as __release_on_cleanup ?) that might also work I suppose.
> > > But I vastly prefer __always_inline actually 'working' ;-)
> > 
> > The truth is that __always_inline working in this way is currently
> > infeasible. Clang and LLVM's architecture simply disallow this today:
> > the semantic analysis that -Wthread-safety does happens over the AST,
> > whereas always_inline is processed by early passes in the middle-end
> > already within LLVM's pipeline, well after semantic analysis. There's
> > a complexity budget limit for semantic analysis (type checking,
> > warnings, assorted other errors), and path-sensitive &
> > intra-procedural analysis over the plain AST is outside that budget.
> > Which is why tools like clang-analyzer exist (symbolic execution),
> > where it's possible to afford that complexity since that's not
> > something that runs for a normal compile.
> > 
> > I think I've pushed the current version of Clang's -Wthread-safety
> > already far beyond what folks were thinking is possible (a variant of
> > alias analysis), but even my healthy disregard for the impossible
> > tells me that making path-sensitive intra-procedural analysis even if
> > just for __always_inline functions is quite possibly a fool's errand.
> 
> Well, I had to propose it. Gotta push the envelope :-)
> 
> > So either we get it to work with what we have, or give up.
> 
> So I think as is, we can start. But I really do want the cleanup thing
> sorted, even if just with that __release_on_cleanup mashup or so.

Working on rebasing this to v6.19-rc1 and saw this new scoped seqlock
abstraction. For that one I was able to make it work like I thought we
could (below). Some awkwardness is required to make it work in
for-loops, which only let you define variables with the same type.

For <linux/cleanup.h> it needs some more thought due to extra levels of
indirection.

------ >8 ------

diff --git a/include/linux/seqlock.h b/include/linux/seqlock.h
index b5563dc83aba..5162962b4b26 100644
--- a/include/linux/seqlock.h
+++ b/include/linux/seqlock.h
@@ -1249,6 +1249,7 @@ struct ss_tmp {
 };
 
 static __always_inline void __scoped_seqlock_cleanup(struct ss_tmp *sst)
+	__no_context_analysis
 {
 	if (sst->lock)
 		spin_unlock(sst->lock);
@@ -1278,6 +1279,7 @@ extern void __scoped_seqlock_bug(void);
 
 static __always_inline void
 __scoped_seqlock_next(struct ss_tmp *sst, seqlock_t *lock, enum ss_state target)
+	__no_context_analysis
 {
 	switch (sst->state) {
 	case ss_done:
@@ -1320,9 +1322,18 @@ __scoped_seqlock_next(struct ss_tmp *sst, seqlock_t *lock, enum ss_state target)
 	}
 }
 
+/*
+ * Context analysis helper to release seqlock at the end of the for-scope; the
+ * alias analysis of the compiler will recognize that the pointer @s is is an
+ * alias to @_seqlock passed to read_seqbegin(_seqlock) below.
+ */
+static __always_inline void __scoped_seqlock_cleanup_ctx(struct ss_tmp **s)
+	__releases_shared(*((seqlock_t **)s)) __no_context_analysis {}
+
 #define __scoped_seqlock_read(_seqlock, _target, _s)			\
 	for (struct ss_tmp _s __cleanup(__scoped_seqlock_cleanup) =	\
-	     { .state = ss_lockless, .data = read_seqbegin(_seqlock) };	\
+	     { .state = ss_lockless, .data = read_seqbegin(_seqlock) }, \
+	     *__UNIQUE_ID(ctx) __cleanup(__scoped_seqlock_cleanup_ctx) = (struct ss_tmp *)_seqlock; \
 	     _s.state != ss_done;					\
 	     __scoped_seqlock_next(&_s, _seqlock, _target))
 
diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
index 4612025a1065..3f72b1ab2300 100644
--- a/lib/test_context-analysis.c
+++ b/lib/test_context-analysis.c
@@ -261,6 +261,13 @@ static void __used test_seqlock_writer(struct test_seqlock_data *d)
 	write_sequnlock_irqrestore(&d->sl, flags);
 }
 
+static void __used test_seqlock_scoped(struct test_seqlock_data *d)
+{
+	scoped_seqlock_read (&d->sl, ss_lockless) {
+		(void)d->counter;
+	}
+}
+
 struct test_rwsem_data {
 	struct rw_semaphore sem;
 	int counter __guarded_by(&sem);
