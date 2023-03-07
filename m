Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F82613D
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 12:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BVGCRdlhXoJzmQdf8XCmE7+QIsrubV9w+1i9PXTee9Q=; b=AtCcCdOUx85ga5lHlCmY0z81qz
	2tmPFeofVlDLYKOOg/L8sNg9UjNMazGTqOBNu1Wb/hnLZwth8w08sMGf9PKN/bsltVpCyiKZpsGkZ
	01AdlAKXcSQAJtgmXrfbgE4cm1FkFd2EtIx6Do9mmhCPTl3/lvnIooUlaROXxvOLOiPSjPNKKDNaH
	56j7TAwdl2hA28zqjHt/oyyHidVbLh2Pfz9Z3Hsk09SaJOMrVDX3wPx9UO2qBLIDsrNLKo6C5pVsu
	Gqbm1k00C0tM5lvmzMb7rtadzTYT0ehEHEISdsDRwhNgCLmJ/zBQcsWZWQ57eKT4xGB4oQZrNJejc
	UaRQxNLw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pZVbf-00H1sR-25;
	Tue, 07 Mar 2023 11:35:47 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8966830031E;
	Tue,  7 Mar 2023 12:35:45 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 629FA23A1D2ED; Tue,  7 Mar 2023 12:35:45 +0100 (CET)
Date: Tue, 7 Mar 2023 12:35:45 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org,
	tony.luck@intel.com, reinette.chatre@intel.com,
	fenghua.yu@intel.com, peternewman@google.com, james.morse@arm.com,
	babu.moger@amd.com, ananth.narayan@amd.com, vschneid@redhat.com,
	Nathan Chancellor <nathan@kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	Borislav Petkov <bp@alien8.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>, linux-toolchains@vger.kernel.org
Subject: Re: [PATCH] x86/resctrl: avoid compiler optimization in
 __resctrl_sched_in
Message-ID: <20230307113545.GB2017917@hirez.programming.kicks-ass.net>
References: <20230303231133.1486085-1-eranian@google.com>
 <20230306120106.GE1267364@hirez.programming.kicks-ass.net>
 <CAKwvOdnRvd5KK01awAyeyt5S36TPPW4_8Z6YL1r4gB-pBrHTbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdnRvd5KK01awAyeyt5S36TPPW4_8Z6YL1r4gB-pBrHTbg@mail.gmail.com>

On Mon, Mar 06, 2023 at 04:16:52PM -0800, Nick Desaulniers wrote:
> Start of Lore thread:
> https://lore.kernel.org/lkml/20230303231133.1486085-1-eranian@google.com/
> 
> On Mon, Mar 6, 2023 at 4:01 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Fri, Mar 03, 2023 at 03:11:33PM -0800, Stephane Eranian wrote:
> >
> > > The problem is located in the __resctrl_sched_in() routine which rewrites
> > > the active closid via the PQR_ASSOC register. Because this is an expensive
> > > operation, the kernel only does it when the context switch involves tasks
> > > with different CLOSID. And to check that, it needs to access the current
> > > task's closid field using current->closid. current is actually a macro
> > > that reads the per-cpu variable pcpu_hot.current_task.
> > >
> > > After an investigation by compiler experts, the problem has been tracked down
> > > to the usage of the get_current() macro in the __resctrl_sched_in() code and
> > > in particular the per-cpu macro:
> > >
> > > static __always_inline struct task_struct *get_current(void)
> > > {
> > >         return this_cpu_read_stable(pcpu_hot.current_task);
> > > }
> > >
> > > And as per percpu.h:
> > >
> > > /*
> > >  * this_cpu_read() makes gcc load the percpu variable every time it is
> > >  * accessed while this_cpu_read_stable() allows the value to be cached.
> > >  * this_cpu_read_stable() is more efficient and can be used if its value
> > >  * is guaranteed to be valid across cpus.  The current users include
> > >  * get_current() and get_thread_info() both of which are actually
> > >  * per-thread variables implemented as per-cpu variables and thus
> > >  * stable for the duration of the respective task.
> > >  */
> > >
> > > The _stable version of the macro allows the value to be cached, meaning it
> > > does not force a reload.
> >
> > Right, so afaict the difference between this_cpu_read() and
> > this_cpu_read_stable() is the volatile qualifier.
> >
> > this_cpu_read() is asm volatile(), while this_cpu_read_stable() and
> > raw_cpu_read() are both an unqualified asm().
> >
> > Now, afaiu we're inlining all of this into __switch_to(), which has
> > raw_cpu_write(pcpu_hot.current_task, next_p).
> >
> > And I suppose what the compiler is doing is lifting the 'current' load
> > over that store, but how is it allowed that? I thought C was supposed to
> > have PO consistency, That raw_cpu_write() should be seen as a store to
> > to pcpu_hot.current_task, why can it lift a load over the store?
> >
> > Specifically, percpu_to_op() has a "+m" output constaint while
> > percpu_stable_op() has a "p" input constraint on the same address.
> 
> I definitely think the issue is specific to "p" constraints.
> https://godbolt.org/z/34YeG6WbY is the test case I reduced which I
> think demonstrates the issue.
> 
> https://reviews.llvm.org/D145416
> -> click "Show Older Changes" for the ongoing discussion.

So per that summary, I'm going to nit-pick and state we very much want
CSE. CSE good. What we don't want it violating store-load ordering.

> I don't have a satisfactory answer yet, but am looking into this.

Oh, geez, what a twisty tale that... So Linus knew back in '09 that "p"
was icky, but it sorta was the only thing and it 'worked' -- until now
:/

Is there a way to explicitly order these things? barrier() obviously
isn't going to help here.

So ideally we'd get something that respects the whole store-load
ordering but still allows agressive CSE. And works for both toolchains.
Small ask, I know :-)
