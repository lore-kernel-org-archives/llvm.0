Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646270;
	b=FSwerxNjSWZe42KekGQTxQxsHsGzpXHREi4TObco7PYKZN3GsljNTa06pw7YWs3OVxbV
	 lIYhKwUmeqpfbA3iDDVTlpX/FYtQ6NhkwWHLjwHQkzX6SZMm9jTkPAoJnD+ybn+GrFlro
	 9HO9kUe/uDqx6eZ34ERLHFrMHzDX24QVPn8xP/FEBTfhaXs/kSWgruwNZOu7w0ktcXcmC
	 6ln51bxYP7hIn6pImXqXyiO926m2WhJRgP0xDrP4RP9dJDgosHoS207ZOpFgxi4SY+R9+
	 A9Q6c/GQCeuPfHv4g37nmIEde5Wg8iY3qjoQxhRLb5g5BhOenSsP61DiFwHi3H3VGAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B5VpfkiruZaKFMNAXJdCzQrQfGZBIQ5E4hTuwKkgO4o=;
	b=TxBCzjybb8226D+8/3UL74tmfL88/i6T7YSFlX5DPy2mOQ4m6L6Hlx8CBmB158ukcR0h
	 eiUk+KWUcb6PifTzC9/GZU7Z+rm+6vfWnfY3k9jig++fuunlD4Me0NPiZ5seY9JUdABX+
	 B1NBPpZiRlx8ULYxo+nvD7YBP7rocT6YIjlWJziZd0nTmyjzGc49xFwQXfk/VQEz6/LUr
	 8qSaSDmTx6Fo+VlUu/GfLJaMaPqOnrQ+8h7bCHtJWziIpKO9W4aQ+np0lV/sIcEUGSBHl
	 xsgOwfkTpmrZLKJRVIbfVwzPhScO10zdpvwELdRTvn9XzzNICnA1PSdyHhelQrDfhBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CHGVUuUh;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC20F606A321
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 05:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC20F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CHGVUuUh
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso15956975e9.2
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646268; x=1793251068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5VpfkiruZaKFMNAXJdCzQrQfGZBIQ5E4hTuwKkgO4o=;
        b=CHGVUuUh+6BQBiSkNntXh1S7ABBsDA/V7I/tIVryrfMhBm1e+i51BA4Gc/CtHE4+QG
         IjlY64bAAYm8f0dY7Gp0MzF5ZRjNzHK1nw57Eq7IZMtF0kdhto4YedY8p0mQS1aSNT1J
         5HnDe/gdpQUQNPKs6+k766M5A5NUruhj5cz5Kuf79x6uP0lsDOcyb805v9EAzPug0Knv
         Bs7IUvthGN2sfnnInytMrapj2NzhH6/43PFb+b4W8Mhc51+JMtdG6xB9K3nbEBiQV8ft
         UWnW/adGGH9gC6LXt3hclw7A9BuM0muwhcVGETHuyx2t089s6iS/P4CyAYHtMje3mo6V
         F2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646268; x=1793251068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5VpfkiruZaKFMNAXJdCzQrQfGZBIQ5E4hTuwKkgO4o=;
        b=ts7yV+XNSaQ728rS7/gKfKg0QtiRv4S1pb15zw6hj60lfrDoBqRoNm3SIgKE7tFacj
         B49C6pss4CFYHOczgBFYTnVRbXA4zpXN/ZZ0lUx5Sa2oDmxmmFrLtTO02K0qHz4y6rrn
         cMPQS7BUrr0Ygud+HgFjc2Q/krvW7B+Rn+HRIYNrsxLZIczEwKpLsx29GK4coAQ2ggdE
         2qx9gRj3mBPFMmPeAF6kXQqPgZiBJkQrzy6fHnXxZK5VPh3nb4lWNEXZt8ukCYtTH7Mn
         78/ZlzT6GJEngiHzjPmIKWRX5x1t6qEsgBxMXtSrIRJklQTC+JBGOkCMbdQwnh/gCIMI
         jyYg==
X-Forwarded-Encrypted: i=1; AKwUvBwTGxR2Re60mMuR0GMeTvdq1MbH3MHPytUi5qdDToj9LV4W+3vU9lC7d2TE82uHWB+t5/0O@lists.linux.dev
X-Gm-Message-State: AFq9FYLrsE9iT/7Da5seNYJtZD7bAGx0gtvt4fdwZM+Yj0oWbXsZJe5W
	ZHJIt2a+ayXKwIPRhOQLRFH7DSbenP2kaokYjsBFARC+WU3g4TogYEOy
X-Gm-Gg: AYBFou15DatVGSayCBplqDIzVYOvBvEbT9BIRCRlloeWQmV0D6E1I1nI7UuOqp8VxHj
	hJuRdTuqOVVkmpgU7Fjco5c7TBvDa8DnlIeB8naHIouaa6VTPE/VdCOZp3u9Mq/jN/Nr0z14tSY
	mhwgr1+WJbBC/NF586TRIW2WYBF2Cimi0nf61cg7cW0uFRlrBVmq2uAM1s4R2Q5S79hPeXk2Qzd
	tmgbRkV/qWOn2hUJkFNZoiaJEd7Oes7REt7VXRpXs1t+gRc/3ui7WRqS/X3RHimWlMDAjyh2Qt6
	MQLWIsSWcye3G1XSkCeW4oQwEmE7LsM4oW5UdiQxooYPr6rijf7HNVHQut93ovZHXz4XE/BxZlY
	rbOQ/H3KPwklozr3+PCVOv+ynaZQRtpBCCWVsswesn2a/WFE8gnDKvKzqFiyDH3+U6zyxsnYKr+
	yMhXzi+8cOo946Xf8/JHbvrVnw0rHmBIoaJMukn5JW7jmkqEW8ivhcZmcimlFKk5R8Mh+EH4BnE
	q2SX1uYuzo7V2Ae/UuV2bNI3F8qmzY7we/0BKOTHQQfIvMtLKwAqSery5gNC71kXHd0lP7N0mSD
	jEAIqNz5vAyrx1Ye84CtSm7pfDW5QNA+gNiCjF/Alth3SCJf13DzI7uqqorz0Ungh6PRCbwFtGa
	0ScjHrmPY775vMbQrWalIvMX6AAT3lGpSMpshOiZR06TX1GM85NmshZ6xFbE=
X-Received: by 2002:a05:600c:34c9:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4a1fdd09bebmr74736715e9.26.1792646268101;
        Wed, 21 Oct 2026 22:17:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:47 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 10/12] docs: entry: Describe the pre-counted hardirq lifecycle
Date: Thu, 22 Oct 2026 07:16:52 +0200
Message-Id: <20261022051654.79224-11-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The entry documentation covers only the traditional irq_enter_rcu()
path. It does not explain the early-counted entry contract or the retained
and synthetic hardirq exit phases.

Document the raw count and lockdep entry, delayed traceable bookkeeping,
hardirq accounting, hardirq-to-softirq count swap, retained real IRQ exit,
possible preemption and migration, and the classification-only return tail.
Also cover late worker closure, raw teardown and context-tracking order.

Record that arm64 excludes pseudo-NMIs from this lifecycle and identify its
external noinstr inlining prerequisites.

Assisted-by: LLM
---
 Documentation/core-api/entry.rst | 75 +++++++++++++++++++++++++++-----
 1 file changed, 65 insertions(+), 10 deletions(-)

diff --git a/Documentation/core-api/entry.rst b/Documentation/core-api/entry.rst
index 09942135aad18..e02c463dcb08f 100644
--- a/Documentation/core-api/entry.rst
+++ b/Documentation/core-api/entry.rst
@@ -193,21 +193,14 @@ Note that the invocation of the actual interrupt handler is within a
 irq_enter_rcu() and irq_exit_rcu() pair.
 
 irq_enter_rcu() updates the preemption count which makes in_hardirq()
-return true, handles NOHZ tick state and interrupt time accounting. This
-means that up to the point where irq_enter_rcu() is invoked in_hardirq()
-returns false.
+return true, handles NOHZ tick state and interrupt time accounting. On this
+entry path, in_hardirq() therefore returns false until irq_enter_rcu() is
+invoked.
 
 irq_exit_rcu() handles interrupt time accounting, handles soft interrupts if
 possible, handles the NOHZ tick state and finally undoes the preemption count
 update.
 
-In theory, the preemption count could be updated in irqentry_enter(). In
-practice, deferring this update to irq_enter_rcu() allows the preemption-count
-code to be traced, while also maintaining symmetry with irq_exit_rcu() and
-irqentry_exit(), which are described in the next paragraph. The only downside
-is that the early entry code up to irq_enter_rcu() must be aware that the
-preemption count has not yet been updated with the HARDIRQ_OFFSET state.
-
 Note that soft interrupt handlers must run in BH context rather than in hard
 interrupt context. irq_exit_rcu() therefore replaces HARDIRQ_OFFSET with
 SOFTIRQ_OFFSET in the preemption count while it handles soft interrupts and
@@ -216,6 +209,68 @@ is still attributed to the interrupt. HARDIRQ_OFFSET is removed before
 irq_exit_rcu() returns because irqentry_exit() might schedule, which requires
 that HARDIRQ_OFFSET has been removed from the preemption count.
 
+Pre-counted hardirq lifecycle
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Architectures which need hardirq state before early context-tracking or
+tracing callbacks can use the pre-counted lifecycle. It applies only to an
+ordinary hard interrupt after the architecture has distinguished it from an
+NMI-like event:
+
+  * irqentry_hardirq_enter() adds HARDIRQ_OFFSET with a raw update and
+    establishes IRQ-disabled and lockdep hardirq state before instrumentable
+    entry work. It then runs the generic entry and context-tracking path,
+    including any required transition out of an RCU extended quiescent state.
+
+  * irq_enter_rcu_preempt_counted() later performs the traceable debug and
+    latency bookkeeping for that raw update. It also performs the deferred
+    timer repair, NOHZ tick handling and interrupt accounting from
+    irq_enter_rcu().
+
+  * irq_exit_rcu_preempt_counted_prepare() performs interrupt accounting,
+    softirq handling and NOHZ tick handling while retaining the hardirq count
+    and lockdep nesting through every traceable exit callback. Softirq
+    handling uses the same temporary HARDIRQ_OFFSET to SOFTIRQ_OFFSET and back
+    transition described above. The architecture immediately follows the
+    preparation with irqentry_hardirq_exit_finish(), which applies the raw
+    count and lockdep teardown.
+
+The real interrupt is complete after that teardown. Return-to-kernel
+preemption can schedule and migrate the task before the architecture-specific
+tail runs, so the current preemption count cannot identify the original entry
+class. irqentry_state_t retains that provenance instead.
+
+For an ordinary hardirq returning to kernel mode,
+irqentry_hardirq_tail_enter() restores only HARDIRQ_OFFSET and lockdep hardirq
+nesting after the preemption decision. This synthetic classification covers
+traceable architecture tail work, deferred timer rearming, IRQ-on preparation
+and context-tracking preparation. It does not repeat interrupt accounting,
+RCU or tick entry. IRQ-on preparation accepts exactly this one synthetic
+lockdep nesting level.
+
+irqentry_hardirq_tail_exit() performs the final traceable teardown preparation
+and then removes the raw synthetic state. Both retained exit points recheck
+regular softirq work and forced-thread timer work raised by late callbacks and
+wake the corresponding workers before dropping hardirq state. If the
+interrupted context was in an RCU extended quiescent state,
+ct_irq_exit_prepare() runs before the raw tail teardown and
+ct_irq_exit_finish() completes the transition afterwards.
+
+On arm64 the ordinary lifecycle is selected only after the pseudo-NMI
+decision. Pseudo-NMIs continue to use irqentry_nmi_enter() and
+irqentry_nmi_exit(). All raw transitions are in noinstr paths, so
+preempt_count(), the raw preempt-count update helpers and
+__kern_my_cpu_offset() must remain inline. The arm64 conversion includes the
+first requirement and depends on the `arm64 raw preempt-count inlining
+prerequisite`_ and `arm64 per-CPU offset inlining prerequisite`_ for the
+others.
+
+.. _`arm64 raw preempt-count inlining prerequisite`:
+   https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
+
+.. _`arm64 per-CPU offset inlining prerequisite`:
+   https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org
+
 Even though interrupt handlers are expected to run with local interrupts
 disabled, interrupt nesting is common from an entry/exit perspective. For
 example, softirq handling happens within an irqentry_{enter,exit}() block with
-- 
2.39.5 (Apple Git-154)

