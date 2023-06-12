Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E8C881F
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 20:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hbUr7IqiQ3CwOQutnN3C5mnCnB3Aa1KO/Z6mvwxhaXQ=; b=Rp7djgU5nkaEOZ74z2JQg1BkKV
	MbwriGvIvAGQGuMggl/ypweoO/NNk8efTr8x6R8disYov6A5jt6mGgOm2UPvgjSWJ9Vs1yXdan2sz
	L0GGtK1SfcJrwPCUyXbfWE1Gi4ZfRF6Lv+ib5G3qarEYIn/EPYO5rjyfLm4Y7TxvGqJLY1fcGGFqQ
	M7TpSrH9HDhMZmX24Fet2hKD8ciljCaI6ApPqLRE04I5ua8XoOhpVDTY12azUVz2z6fy3sAHVmpG9
	vbe6BAuENNC7VAIeglhe+ctBtENVW/y/zq29Rhb8OjR5lfusHBV9Uxx+QVs9GO0PQP79LV1GCrX2/
	hGH4sbZA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q8nn4-008zsz-0g;
	Mon, 12 Jun 2023 20:05:28 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 961D7300188;
	Mon, 12 Jun 2023 22:05:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 782692460EAE4; Mon, 12 Jun 2023 22:05:25 +0200 (CEST)
Date: Mon, 12 Jun 2023 22:05:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: keescook@chromium.org, gregkh@linuxfoundation.org, pbonzini@redhat.com,
	masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
	nicolas@fjasle.eu, catalin.marinas@arm.com, will@kernel.org,
	vkoul@kernel.org, trix@redhat.com, ojeda@kernel.org,
	mingo@redhat.com, longman@redhat.com, boqun.feng@gmail.com,
	dennis@kernel.org, tj@kernel.org, cl@linux.com, acme@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, namhyung@kernel.org, irogers@google.com,
	adrian.hunter@intel.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, paulmck@kernel.org,
	frederic@kernel.org, quic_neeraju@quicinc.com,
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
Subject: Re: [PATCH v3 33/57] perf: Simplify perf_adjust_freq_unthr_context()
Message-ID: <20230612200525.GO4253@hirez.programming.kicks-ass.net>
References: <20230612090713.652690195@infradead.org>
 <20230612093539.895253662@infradead.org>
 <CAHk-=wgPtj9Y+nkMe+s20sntBPoadKL7GLxTr=mhfdONMR=iZg@mail.gmail.com>
 <20230612184403.GE83892@hirez.programming.kicks-ass.net>
 <CAHk-=wgaSkM4fjdP9dcdXQpLLjxW43ykgLA=FgzyHpyHayz8ww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgaSkM4fjdP9dcdXQpLLjxW43ykgLA=FgzyHpyHayz8ww@mail.gmail.com>

On Mon, Jun 12, 2023 at 11:55:57AM -0700, Linus Torvalds wrote:

> So while it might not be the horrible bug I thought it was, I'd
> _really_ like us to not do those things just from a sanity angle.

OK, let me go see if there's another way to sanely write those.


Is this less offensive?

restart:
	scoped_guard (rcu) {
		list_for_each_entry_rcu(..) {
			...
			if (err == -EAGAIN)
				goto restart;
		}
	}


That has the explicit scope on the rcu and now the goto explicitly exist
it.

Gonna have to think what to do about the continue ...
