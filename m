Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D68618C00
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=ZQvmg1eOC4ujP8jeHKMUa0GcDNPOQum0WTJAKmNFtGA=; b=LPWnimpJNpLZAm9lAEc9/THe/4
	L17U+Uvk/IrPGFLBwGSRewqcM4EG3AHAJ0JNDl0MCKyM49V4OoY1gcgT3tGs6IQwyi+zWYkIA/x5n
	e9OIIbDmUiJQWpPFwqC+kJCVOEw/Jj8WMAAQcCCnT/9I80sTpkArIdTpzmw+gX5XtO2srpXfBixaW
	SsP8pAuR1zdJrNJ7b4JAofN3opgCSHW1FfpRE0M6GQjVwiKIUqL/X25uTaFzLPdcUW2hsoDiXKfRf
	6iMaLNLdSNAx4MUk+7WYDbOpD1drZrQV2g7rFKO3wkyvuWgjibIrNULJfmQtiqD+E/UxDE+bOjznW
	a6a3xmpw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q8e0t-002NGr-1J; Mon, 12 Jun 2023 09:39:03 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4881E3033CC;
	Mon, 12 Jun 2023 11:38:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id DC80030A77B72; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093540.407316252@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:53 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: torvalds@linux-foundation.org,
 keescook@chromium.org,
 gregkh@linuxfoundation.org,
 pbonzini@redhat.com
Cc: masahiroy@kernel.org,
 nathan@kernel.org,
 ndesaulniers@google.com,
 nicolas@fjasle.eu,
 catalin.marinas@arm.com,
 will@kernel.org,
 vkoul@kernel.org,
 trix@redhat.com,
 ojeda@kernel.org,
 peterz@infradead.org,
 mingo@redhat.com,
 longman@redhat.com,
 boqun.feng@gmail.com,
 dennis@kernel.org,
 tj@kernel.org,
 cl@linux.com,
 acme@kernel.org,
 mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com,
 jolsa@kernel.org,
 namhyung@kernel.org,
 irogers@google.com,
 adrian.hunter@intel.com,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 bristot@redhat.com,
 vschneid@redhat.com,
 paulmck@kernel.org,
 frederic@kernel.org,
 quic_neeraju@quicinc.com,
 joel@joelfernandes.org,
 josh@joshtriplett.org,
 mathieu.desnoyers@efficios.com,
 jiangshanlai@gmail.com,
 rientjes@google.com,
 vbabka@suse.cz,
 roman.gushchin@linux.dev,
 42.hyeyoo@gmail.com,
 apw@canonical.com,
 joe@perches.com,
 dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com,
 john.johansen@canonical.com,
 paul@paul-moore.com,
 jmorris@namei.org,
 serge@hallyn.com,
 linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org,
 llvm@lists.linux.dev,
 linux-perf-users@vger.kernel.org,
 rcu@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 tglx@linutronix.de,
 ravi.bangoria@amd.com,
 error27@gmail.com,
 luc.vanoostenryck@gmail.com
Subject: [PATCH v3 40/57] perf: Simplify perf_mmap_close()/perf_aux_sample_output()
References: <20230612090713.652690195@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8


Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6179,6 +6179,9 @@ void ring_buffer_put(struct perf_buffer
 	call_rcu(&rb->rcu_head, rb_free_rcu);
 }
 
+DEFINE_CLASS(ring_buffer_get, struct perf_buffer *, ring_buffer_put(_T),
+	     ring_buffer_get(event), struct perf_event *event)
+
 static void perf_mmap_open(struct vm_area_struct *vma)
 {
 	struct perf_event *event = vma->vm_file->private_data;
@@ -6206,7 +6209,7 @@ static void perf_pmu_output_stop(struct
 static void perf_mmap_close(struct vm_area_struct *vma)
 {
 	struct perf_event *event = vma->vm_file->private_data;
-	struct perf_buffer *rb = ring_buffer_get(event);
+	CLASS(ring_buffer_get, rb)(event);
 	struct user_struct *mmap_user = rb->mmap_user;
 	int mmap_locked = rb->mmap_locked;
 	unsigned long size = perf_data_size(rb);
@@ -6245,14 +6248,14 @@ static void perf_mmap_close(struct vm_ar
 		detach_rest = true;
 
 	if (!atomic_dec_and_mutex_lock(&event->mmap_count, &event->mmap_mutex))
-		goto out_put;
+		return;
 
 	ring_buffer_attach(event, NULL);
 	mutex_unlock(&event->mmap_mutex);
 
 	/* If there's still other mmap()s of this buffer, we're done. */
 	if (!detach_rest)
-		goto out_put;
+		return;
 
 	/*
 	 * No other mmap()s, detach from all other events that might redirect
@@ -6309,9 +6312,6 @@ static void perf_mmap_close(struct vm_ar
 			&mmap_user->locked_vm);
 	atomic64_sub(mmap_locked, &vma->vm_mm->pinned_vm);
 	free_uid(mmap_user);
-
-out_put:
-	ring_buffer_put(rb); /* could be last */
 }
 
 static const struct vm_operations_struct perf_mmap_vmops = {
@@ -6962,14 +6962,13 @@ static void perf_aux_sample_output(struc
 				   struct perf_sample_data *data)
 {
 	struct perf_event *sampler = event->aux_event;
-	struct perf_buffer *rb;
 	unsigned long pad;
 	long size;
 
 	if (WARN_ON_ONCE(!sampler || !data->aux_size))
 		return;
 
-	rb = ring_buffer_get(sampler);
+	CLASS(ring_buffer_get, rb)(sampler);
 	if (!rb)
 		return;
 
@@ -6982,7 +6981,7 @@ static void perf_aux_sample_output(struc
 	 * like to know.
 	 */
 	if (WARN_ON_ONCE(size < 0))
-		goto out_put;
+		return;
 
 	/*
 	 * The pad comes from ALIGN()ing data->aux_size up to u64 in
@@ -6996,9 +6995,6 @@ static void perf_aux_sample_output(struc
 		u64 zero = 0;
 		perf_output_copy(handle, &zero, pad);
 	}
-
-out_put:
-	ring_buffer_put(rb);
 }
 
 /*


