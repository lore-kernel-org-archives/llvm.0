Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EEE8BE0
	for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 07:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=taRVbZGY7eAXHJhyY2OAnvNRfmEw/YGDeNE955RAneg=; b=k4xtU11ThlaltSx7EZ6bcj9NVM
	jy2pArA60NPwrh9HNHBpuN7tipRcFFa6LF0Ho5HJ09urAyeEeo9x+tHuTRLQqI4jmmpIfvFGeA+R3
	GgE8ltvsU2jxQCspcV88ZdKNCNe5LkviACAE5b0QDSE+YGW+sX4G+Bd0dTXPRRZ8pUBdmDOWkDer6
	o5eblE26lIHMvBDtTSc6etUPEDdl5sPeHfwJTN9dG09IEHDr9TS9JtQIjNNy+TzVwQDP/eXFDNj8x
	09Q+1O03XzlZv8euV6/8o4g4uLsiRie4O/r+QkPfTCGMXevL2+dRtykPrih20ct5YufDXQUdYKMmN
	2U3jdLTA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q8ycW-003fAJ-IC; Tue, 13 Jun 2023 07:39:16 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DF59F300188;
	Tue, 13 Jun 2023 09:39:14 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id C5A342C8E889C; Tue, 13 Jun 2023 09:39:14 +0200 (CEST)
Date: Tue, 13 Jun 2023 09:39:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Namhyung Kim <namhyung@kernel.org>
Cc: torvalds@linux-foundation.org, keescook@chromium.org,
	gregkh@linuxfoundation.org, pbonzini@redhat.com,
	masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
	nicolas@fjasle.eu, catalin.marinas@arm.com, will@kernel.org,
	vkoul@kernel.org, trix@redhat.com, ojeda@kernel.org,
	mingo@redhat.com, longman@redhat.com, boqun.feng@gmail.com,
	dennis@kernel.org, tj@kernel.org, cl@linux.com, acme@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	paulmck@kernel.org, frederic@kernel.org, quic_neeraju@quicinc.com,
	joel@joelfernandes.org, josh@joshtriplett.org,
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
	rientjes@google.com, vbabka@suse.cz, roman.gushchin@linux.dev,
	42.hyeyoo@gmail.com, apw@canonical.com, joe@perches.com,
	dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
	serge@hallyn.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	llvm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	rcu@vger.kernel.org, linux-security-module@vger.kernel.org,
	tglx@linutronix.de, ravi.bangoria@amd.com, error27@gmail.com,
	luc.vanoostenryck@gmail.com
Subject: Re: [PATCH v3 26/57] perf: Simplify event_function*()
Message-ID: <20230613073914.GQ4253@hirez.programming.kicks-ass.net>
References: <20230612090713.652690195@infradead.org>
 <20230612093539.371360635@infradead.org>
 <CAM9d7cjz4cnEgV_oAnTOqyCWXDeD3ECYQFc=Uksct2-HKuFmiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM9d7cjz4cnEgV_oAnTOqyCWXDeD3ECYQFc=Uksct2-HKuFmiQ@mail.gmail.com>

On Mon, Jun 12, 2023 at 10:56:06PM -0700, Namhyung Kim wrote:
> Hi Peter,
> 
> On Mon, Jun 12, 2023 at 2:39 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Use guards to reduce gotos and simplify control flow.
> >
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >  kernel/events/core.c |   39 ++++++++++++++++++++++++++-------------
> >  1 file changed, 26 insertions(+), 13 deletions(-)
> >
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -214,6 +214,25 @@ struct event_function_struct {
> >         void *data;
> >  };
> >
> > +typedef struct {
> > +       struct perf_cpu_context *cpuctx;
> > +       struct perf_event_context *ctx;
> > +} class_perf_ctx_lock_t;
> > +
> > +static inline void class_perf_ctx_lock_destructor(class_perf_ctx_lock_t *_T)
> > +{
> > +       if (_T->cpuctx)
> > +               perf_ctx_unlock(_T->cpuctx, _T->ctx);
> 
> Shouldn't it be called unconditionally?

In all surviving cases it will be, so yeah, I can remove that condition.
