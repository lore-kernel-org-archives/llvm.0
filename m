Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929D1522D
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 18:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XU9axK6uJmgJQSoRJwESZ2YBCmhPiMFjehu8M/bt6Oc=; b=oEZpxMsPxgp77AwTg3jdZUFpU8
	btsEePZBm/Ugf5WVKugSk/fB4d1+Bi75EVmGymAR5JC4BYjUzSClgVUmQSPrLyTmhX12YE//NEAj2
	HzorzGh3uEi0gkKzG2nCK62lmKIUt9Tv3fC7YRx00Y5lW6O75GkEg7u9fD2c8jiXCnfrB1PckCkDw
	xLNrRMYnXshPnoGOEAKHvjl0SjAGvuHy9JhJt1IsHPYtYLvOqIme3WFVlCNdssQm92iIIGFGyooln
	vuTwUduRy8s7d/cDJBoMY+dswQ7AxTvrGSj20qdaZvOin2xWq2DgwH5TXknK3glDrGOwf59J5Og7V
	LpG/bPGA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q8mhI-008ybZ-1O;
	Mon, 12 Jun 2023 18:55:24 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 69F8C300195;
	Mon, 12 Jun 2023 20:55:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4D4B320D70605; Mon, 12 Jun 2023 20:55:22 +0200 (CEST)
Date: Mon, 12 Jun 2023 20:55:22 +0200
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
Subject: Re: [PATCH v3 56/57] perf: Simplify perf_pmu_output_stop()
Message-ID: <20230612185522.GF83892@hirez.programming.kicks-ass.net>
References: <20230612090713.652690195@infradead.org>
 <20230612093541.598260416@infradead.org>
 <CAHk-=wh6JEk7wYECcMdbXHf5ST8PAkOyUXhE8x2kqT6to+Gn9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh6JEk7wYECcMdbXHf5ST8PAkOyUXhE8x2kqT6to+Gn9Q@mail.gmail.com>

On Mon, Jun 12, 2023 at 09:19:19AM -0700, Linus Torvalds wrote:
> This patch looks completely broken to me.
> 
> You now do
> 
>                 if (err == -EAGAIN)
>                         goto restart;
> 
> *within* the RCU-guarded section, and the "goto restart" will guard it again.

restart:
	guard(rcu)();
	list_for_each_entry_rcu(iter, &head, rb_entry) {
		...
		if (err == -EAGAIN)
			goto restart;
	}

So the restart is *before* the variable exists, eg. it's out-of-scope.

per the last email's guard.c, if changed like so:

void main(void)
{
	int done = 0;
restart:
	lock_guard(spin, moo, &lock);
	for (;!done;) {
		done = 1;
		goto restart;
	}
}

$ gcc -O2 -o guard guard.c && ./guard
spin_lock
spin_unlock
spin_lock
spin_unlock

Which is exactly the expected result.




