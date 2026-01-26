Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2606F23C51D
	for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 18:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769452546; cv=none; b=iz2I1bKEQ9a+5yw98m/AP4SZD7QELNmWoQlE+NrKxqECqL1P5Ojux/lkE4wBgawNjznBNFor09VCA7qNJ2Cl8bPGguYtZC7oOTToS2VgW122wqKxMQpGINt0nZfxFkpL0Ze6kAtQaLo1gQYk73hv2UMwIW2exi/fso4voKkxqK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769452546; c=relaxed/simple;
	bh=3akyaakir9OAMjeT8WvM8HDWBZfX+8duXF5SLqJafO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idWgLVk1+xJF+tUPoTUw+56u2fyIHqksAZXT906f0RV4Ndzz3v8bBZY6xwuNH83d0pBndl5V3Lzz9z7pOgJB57UNV79O3krsmMxOEi38O8l+MZj/1YvvwRhTjhqnkRgddGIgdzBFvvCRBANnxePrNX1mVC51hfckdwHJUmB69S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tw3hU+4e; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tw3hU+4e"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-432755545fcso3568420f8f.1
        for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 10:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769452542; x=1770057342; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wtupvaEvwne0Vq+SODEHB1y4+FGimHGUXOjd7XL3Zo=;
        b=tw3hU+4eHqUrqAxL4uxD/s43O/vRPX38WclQ4MpIkZgnYDLi6D127jMJ7R6dUsikZ+
         UZVwAAoSSyw2yLjQCAn6thGnKTIpYOx38WQH+BIQQm35U8hW/3KC9+al3mVOpYLxv500
         699wDpbF8qikcWS9zy6jtEVWK7PFB971Ex/HtqbSlgE1OWaCpOGqsMqc3+UnJpNNsWln
         sJx/uwOn15DXyhVz/hZZiFf1ELLZWKs8pE24XQKT0GDZJZ49P/EtRR3SfHfF/q9fYikw
         W5k8yr/fYYn/WUNzQU4lOq1PYbgxHzU5UPuR32nlTxBd2wWHMdEv2438ThQwHEXtm3mt
         RISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769452542; x=1770057342;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wtupvaEvwne0Vq+SODEHB1y4+FGimHGUXOjd7XL3Zo=;
        b=gOAVrb0t1bM6c4RkDtELjPUnRJj3ECt58Oog4oCP9URvXjIVTc4ssO6J3bMNnnl/sQ
         cQdnHcubiUFRvEApjNNejOxXiDyWRntjnx6z2BK5Ku1e1WrOLQiC8Nt5z6Wq+M1tiqXf
         vwX6JGrGuvIquZ8dN695p7YDfl+6ve/NyeCSrAJ2XKA8yNt9X0vvhsup5fcuoMQk9Lg3
         I8dkKtGXnTR/ZhdHNuTKhwjaX4V7VJo58WsepQmK/+htpB5lY8rOB1mx7rJT+pQU0TNT
         U9Q3DM8TV+oYs1FTJSdsPZ3rOU8pa962dR2ZqHl8TI4Yoee1tBKIjqSqat5NoxZ2gJzy
         L8bA==
X-Forwarded-Encrypted: i=1; AJvYcCURvD/zQ8obilG5RtqWJJLCPAFSRl9C9vM8CsdJ8opXfp/Ubohpuul00Vlt1lMVxIZySKer@lists.linux.dev
X-Gm-Message-State: AOJu0YxkFO41lDbSi9NXBRypFcMws/0NKEWGAbMEZ/Ko9n7lA5q6L19D
	gDLf0A+Uh/EuOTH8rTjea41JvWms0w2rP5GHd61jvvO1HBh08+IBZO7xtQVg4+irDA==
X-Gm-Gg: AZuq6aKY3PmB0AJlIRUNnTCxL663y3ldlHh0S9DBkVfjtb5+6tiTJX8GjfEJRVj3Q3E
	WShy+QlEZJakLaCt5W/w3c0TUT9uo4gy81ybhPeP4wBECLaNhbYBNowTYln57dmCGCrudHDf90c
	3KHYB2WVAHQJPU9k+PP3e6jZWeJcrqzeqDu3XV9V4BchMvMX2lyccCjP4S/TXU83fTvyayYB7+n
	Ish7pSMphQF78Zc95Wjl8U5baxZxPZ/HUaK73qMVx1s9KW9ueRZO4t4xiIPM/MYS7Pws9s2tP3M
	0+2w/0Lhph9LvlAzNQuj+poZYoWftZFSVFVGI0zRD59L5FWecl2zoRJl1tKPjlHVNNhGqCltzut
	TUWniwgOnL3PEb7tgZ20pwMsqudvHjtUOY7UfleLTpyKjXuT5We2KryB+h4ptqBCJRuzTNEyDO3
	nc9x9JXA8+AbJvo4o6P1iZfApw2NF9TTBsZ1SjkvsYjBp0w5pGLxcRxeLA7z4=
X-Received: by 2002:a5d:5d06:0:b0:429:c14f:5f7d with SMTP id ffacd0b85a97d-435ca18f3cbmr9441304f8f.29.1769452542172;
        Mon, 26 Jan 2026 10:35:42 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:c598:7cce:ca6b:8ab7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1b6e2besm32040119f8f.0.2026.01.26.10.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 10:35:41 -0800 (PST)
Date: Mon, 26 Jan 2026 19:35:33 +0100
From: Marco Elver <elver@google.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	Chris Li <sparse@chrisli.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>,
	Dmitry Vyukov <dvyukov@google.com>,
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
Subject: Re: [PATCH v5 15/36] srcu: Support Clang's context analysis
Message-ID: <aXez9fSxdfu5-Boo@elver.google.com>
References: <20251219154418.3592607-1-elver@google.com>
 <20251219154418.3592607-16-elver@google.com>
 <dd65bb7b-0dac-437a-a370-38efeb4737ba@acm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd65bb7b-0dac-437a-a370-38efeb4737ba@acm.org>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Mon, Jan 26, 2026 at 09:31AM -0800, Bart Van Assche wrote:
> On 12/19/25 7:40 AM, Marco Elver wrote:
> > +/*
> > + * No-op helper to denote that ssp must be held. Because SRCU-protected pointers
> > + * should still be marked with __rcu_guarded, and we do not want to mark them
> > + * with __guarded_by(ssp) as it would complicate annotations for writers, we
> > + * choose the following strategy: srcu_dereference_check() calls this helper
> > + * that checks that the passed ssp is held, and then fake-acquires 'RCU'.
> > + */
> > +static inline void __srcu_read_lock_must_hold(const struct srcu_struct *ssp) __must_hold_shared(ssp) { }
> >   /**
> >    * srcu_dereference_check - fetch SRCU-protected pointer for later dereferencing
> > @@ -223,9 +233,15 @@ static inline int srcu_read_lock_held(const struct srcu_struct *ssp)
> >    * to 1.  The @c argument will normally be a logical expression containing
> >    * lockdep_is_held() calls.
> >    */
> > -#define srcu_dereference_check(p, ssp, c) \
> > -	__rcu_dereference_check((p), __UNIQUE_ID(rcu), \
> > -				(c) || srcu_read_lock_held(ssp), __rcu)
> > +#define srcu_dereference_check(p, ssp, c)					\
> > +({										\
> > +	__srcu_read_lock_must_hold(ssp);					\
> > +	__acquire_shared_ctx_lock(RCU);					\
> > +	__auto_type __v = __rcu_dereference_check((p), __UNIQUE_ID(rcu),	\
> > +				(c) || srcu_read_lock_held(ssp), __rcu);	\
> > +	__release_shared_ctx_lock(RCU);					\
> > +	__v;									\
> > +})
> 
> Hi Marco,
> 
> The above change is something I'm not happy about. The original
> implementation of the srcu_dereference_check() macro shows that it is
> sufficient to either hold an SRCU reader lock or the updater lock ('c').
> The addition of "__srcu_read_lock_must_hold()" will cause compilation to
> fail if the caller doesn't hold an SRCU reader lock. I'm concerned that
> this will either lead to adding __no_context_analysis to SRCU updater
> code that uses srcu_dereference_check() or to adding misleading
> __assume_ctx_lock(ssp) annotations in SRCU updater code.

Right, and it doesn't help 'c' is an arbitrary condition. But it's
fundamentally difficult to say "hold either this or that lock".

That being said, I don't think it's wrong to write e.g.:

	spin_lock(&updater_lock);
	__acquire_shared(ssp);
	...
	// writes happen through rcu_assign_pointer()
	// reads can happen through srcu_dereference_check()
	...
	__release_shared(ssp);
	spin_unlock(&updater_lock);

, given holding the updater lock implies reader access.

And given the analysis is opt-in (CONTEXT_ANALYSIS := y), I think
it's a manageable problem.

If you have a different idea how we can solve this, please let us know.

One final note, usage of srcu_dereference_check() is rare enough:

	arch/x86/kvm/hyperv.c:	irq_rt = srcu_dereference_check(kvm->irq_routing, &kvm->irq_srcu,
	arch/x86/kvm/x86.c:	kvm_free_msr_filter(srcu_dereference_check(kvm->arch.msr_filter, &kvm->srcu, 1));
	arch/x86/kvm/x86.c:	kfree(srcu_dereference_check(kvm->arch.pmu_event_filter, &kvm->srcu, 1));
	drivers/gpio/gpiolib.c:	label = srcu_dereference_check(desc->label, &desc->gdev->desc_srcu,
	drivers/hv/mshv_irq.c:	girq_tbl = srcu_dereference_check(partition->pt_girq_tbl,
	drivers/hwtracing/stm/core.c:	link = srcu_dereference_check(src->link, &stm_source_srcu, 1);
	drivers/infiniband/hw/hfi1/user_sdma.c:	pq = srcu_dereference_check(fd->pq, &fd->pq_srcu,
	fs/quota/dquot.c:			struct dquot *dquot = srcu_dereference_check(
	fs/quota/dquot.c:				struct dquot *dquot = srcu_dereference_check(
	fs/quota/dquot.c:		put[cnt] = srcu_dereference_check(dquots[cnt], &dquot_srcu,
	fs/quota/dquot.c:		transfer_from[cnt] = srcu_dereference_check(dquots[cnt],
	include/linux/kvm_host.h:	return srcu_dereference_check(kvm->memslots[as_id], &kvm->srcu,
	virt/kvm/irqchip.c:	irq_rt = srcu_dereference_check(kvm->irq_routing, &kvm->irq_srcu,

, that I think it's easy enough to annotate these places with the above
suggestions in case you're trying out global enablement.
