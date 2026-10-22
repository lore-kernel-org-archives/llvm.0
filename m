Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646236;
	b=VoU92e7ye5ZYRJ1lnCYAlGN5fuM6NgLWYBXQVpjL3aFgZjtOfOuBLN0JSBZF45aLHv4R
	 Nth9GYb5971RF8T24AMsxpwSSul3kKem9koYwJDYyaibEZ2tT26hh2tbP7AnP7PyELJZ6
	 PixVYlFzmaccwB0sHuOQpeGsiql9EV5a5LZGcKQFOJmTk1x0xIaXGXMQ0AKvt22gO138X
	 rfsrLrw8HV6CDlpS5tD3wYMVDcDa8c5vMcyCN1ym4CxgjQAWE7l0+n3tVPZ3QQAzyxEdR
	 aW+EzQ25hRJx5QtzyBlN69goHUxlXEXnl9fb8e0UlE9daVsR+XZmqfJTeYPUi6T9kiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H/SXDgdhEaQ9Leps7ngp4tdnFYLEJykx5g1h92ea+nY=;
	b=sv/GSfNn1N+lWL/fZijW5a0po1f0G8S+VZ4nOM0z5bb8vfzOWVqEIUY5+5MW+BIeCZc9
	 rTDcxm3Mh8/N0Xs8B89JHBmMKlAq9gqGJF6NPyKdWdhOpHlbfNMgGAu3Gb52mLflwzoqQ
	 8zO00qfrDg+LUW6SlNEc8jWNCBWmPjfdRcs9qyC1S06VeTh8VTotbpTlIroJczo+5eS0O
	 QX4nUue7F1sNWlSDFmzvaEeKjLSzpeu75CAJlu4kZI5MmnWHlU/VjU6ZID2TsDbrIurlH
	 /VrIcN/Kq4RO8XL23+L/yO1AuzBk5YBoxKQuMqGi7+v74j3N8QbxH35GavSz8uEXKZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mxU3S65y;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACC2606A31E
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 05:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ACC2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mxU3S65y
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so16288815e9.0
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646234; x=1793251034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H/SXDgdhEaQ9Leps7ngp4tdnFYLEJykx5g1h92ea+nY=;
        b=mxU3S65ysHFnzJyu5iLRSi2q4TjecPrRo78DiXM81UCXZUK4viIX4KucKU+X31375P
         TXE927VPRscPO9UWTtoeKeIEFQOH9H81b/caIleJw0VRraEIIpD7Iw21TwgcITFMUTZp
         dKOrhpg2uSkR8vGHAZgzYmBaqM/swYn9+4oGaXkJlZf1MIb3YfnbqJHWhfz74Rc7rDPG
         9wkacKhO8qYoDlriPbx+LuTBU5syS+dXJkRDakQcrxZSzaPGJ+nQdg2Ks03MtSmf19qj
         q5Z34k8g0q96vbcWDGuNpYephKvWkB1MZUN2+fwX8T5xRzhxhpxwrmjCkFDReSDID8/9
         6UEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646234; x=1793251034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/SXDgdhEaQ9Leps7ngp4tdnFYLEJykx5g1h92ea+nY=;
        b=0AKKzJRhEgmn8NiND7sp9eOB7dgUf+xlMYYfm6ARI39einD5tx1g0IhjyNUmael3EB
         9az1o9YeULuv2ysncs4vmwFDYvZRyuDy7X28tDMkmPdxLmhDg+z/wWX5OY2VXU7Fe3JW
         9H6GiSQedEfXkBdnfCDARozr4ppam6pB1Eslx9kMQSf/jgxexNf1HbG8g9JxDI8Jn6f4
         rd/dOc5M/unsjoxWc+IbLZomotS7g/3Hlu5Iz2Loja+tq79qTEyHKGVhszCJyICBOje9
         /BLI/MtNctC4wC2Kvv9aduKybZHHiCpy+PGGaLLEY0+QOAMIAcGvzXDbXPAdoFvrHBd5
         IRRA==
X-Forwarded-Encrypted: i=1; AKwUvBwAxpXrpqLshf7cFdRxO4dsYfGYz6iQNcO8R2YP9xwEXR2KmMg+uUGkmy74puMhZRdGmch3@lists.linux.dev
X-Gm-Message-State: AFq9FYLmks5Tx0aXMcuXk1gHc1rG37Pyh9ZOSxbEgELYe5PSMZPgpEBG
	EfXg/8EIiM3qNxcIhFf40JrRMEe9/QbIh3hTIVD7jwT2w7ltaBKb8lQ0
X-Gm-Gg: AYBFou0k4LlA/XD4/Mb5X1EBqTaJszJfnFBs10FEsZbcknzn/e1OB+Fn6ISyKx8+EF5
	IK5ImM7xePPDSfocVjgNo3KGYZd0o6/R1LEJmHjtXaAa5TIniP+dmufUJArytCyYEZGxG4bpI6M
	eJlEadK0M6+uUQ7tFEpIfhkvHRd61arbFSetw2tFY5OYdlYVRcwpo75jLjZ8RMrcP9ZFPbfNnZO
	zigINMCZ44VdF3puix+25vyzFsFPYgVmfDujjqNXWhbCG3P5YIA75IipUT6Gqjnhs8KErSj/Mmq
	xqoQ5ktnf3jBad2qCrtesMiLsUuZsac4YndwnqhAjlk3JCYGhS6ztU2aUDP+DPdDOY6tUPx5x0c
	YXUWIFK6w0ikt7Mx6Vix16vmManxGHN4o/5Dpk/Nl97s0sfUjfT3Y2YQ6mLKpJunyjg7Co3WieC
	p9zcxZjbVj80mJDc2TBfy3eF3K4hXxIwhxN+YhnfGHxTKeQpk/aI1Nsl8m9KET8Hab6Z8p61oeT
	NL8Rde6NaqlUzRfP8cs6l8o6RyqsrWF+/j68V1HoAf8jI0AI6XM9tiNV0YCUCVNbxyV2Oa3gJV1
	ZjUN+OcvlHmpSzaySyxTQL2G7t3FA+8ZK4gjkAdM14UHX2WdAVf4br0PB+yIgjPdbh+Zq0Z/Qa4
	NkobeIwE5NKLGdLtMxGn79LRYLQf76zohYkvOAJcQ2LYHdNe+fTizt++in4o=
X-Received: by 2002:a05:600c:3513:b0:4a1:cedc:ab49 with SMTP id 5b1f17b1804b1-4a1fdd1e97emr87433205e9.31.1792646233938;
        Wed, 21 Oct 2026 22:17:13 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:12 -0700 (PDT)
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
Subject: [RFC PATCH 00/12] entry, tracing: Classify early hardirq entry and return tails
Date: Thu, 22 Oct 2026 07:16:42 +0200
Message-Id: <20261022051654.79224-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

Tracing's transition recursion slot exists because a callback can run after
architectural hardirq entry but before generic entry increments
preempt_count(). Steve asked whether the count could be updated soon enough
to remove that slot. This RFC establishes that entry contract on arm64 and
closes a separate recursion window exposed by the same tests.

This is a design RFC, not a merge-ready proposal. I am looking for
feedback on the entry contract before extending it to other architectures
or removing TRACE_CTX_TRANSITION.

Clang can outline raw preempt-count updates and
__kern_my_cpu_offset() from noinstr entry code. This series applies to a
tree with the following two patches added:

  - Hongyan Xia, "arm64: Always inline raw preempt count updates"
    https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
  - Will Deacon, "arm64: percpu: Annotate __kern_my_cpu_offset() as
    '__always_inline'"
    https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org

Those patches are external prerequisites and are not included in this
RFC.

Patches 1 through 11 split raw preempt-count updates from generic IRQ
bookkeeping. On arm64, ordinary interrupts add HARDIRQ_OFFSET after the
pseudo-NMI decision but before instrumentable generic entry work. The
remaining accounting still happens in irq_enter_rcu().

The exit side has a similar gap. Function-graph and MTE callbacks can run
after the real hardirq state has been removed, and kernel return may
schedule before them. The series records ordinary-hardirq provenance and
restores a synthetic hardirq classification after the preemption decision.
That tail changes only preempt-count and lockdep state. It does not repeat
interrupt accounting, RCU, or tick entry.

Patch 12 keeps tracing's recursion state inside one preemption-disabled
interval. It closes the transition collision reproduced at the IRQ-exit
reschedule boundary. TRACE_CTX_TRANSITION remains unchanged because
unconverted architecture entry intervals can still run before
preempt_count() reflects hardirq context. An x86-64 no-transition control
still recorded recursion at system-vector entry and exit and in the
deferred hrtimer return tail.

The base includes "entry: Account the deferred hrtimer rearm as hardirq
context for lockdep" and "softirq: Preserve interrupt context on return
from interrupt".

The main questions are:

  - Should generic entry expose separate raw-update and bookkeeping phases?
  - Are preempt count and lockdep state sufficient for the return tail?
  - Is arm64 a suitable first user of this contract?
  - Should the recursion-lifetime fix travel with the entry conversion?

Karl Mehltretter (12):
  sched: Split preempt-count bookkeeping from raw updates
  lockdep: Use raw access for pinned hardirq state
  entry: Add the pre-counted ordinary-hardirq entry/exit contract
  entry: Skip inactive IRQ-return reschedule calls
  context_tracking: Split IRQ-exit preparation from the EQS transition
  lockdep: Prepare IRQ-on state from a hardirq return tail
  entry: Carry ordinary-hardirq provenance through kernel return
  entry: Classify ordinary hardirq return-tail work as hardirq context
  arm64: Use the pre-counted hardirq lifecycle
  docs: entry: Describe the pre-counted hardirq lifecycle
  locking/selftest: Exercise hardirq return-tail preparation
  tracing: Pin recursion state for its complete lifetime

 Documentation/core-api/entry.rst     |  75 ++++++++++--
 arch/arm64/include/asm/preempt.h     |   2 +-
 arch/arm64/kernel/entry-common.c     |  25 ++--
 include/linux/context_tracking_irq.h |  32 +++++-
 include/linux/hardirq.h              |  29 +++++
 include/linux/interrupt.h            |   2 +-
 include/linux/irq-entry-common.h     |  96 ++++++++++++++--
 include/linux/irqflags.h             |  14 ++-
 include/linux/preempt.h              |   9 ++
 include/linux/trace_recursion.h      |  14 ++-
 kernel/context_tracking.c            |  78 ++++++++++---
 kernel/entry/common.c                |  38 +++++-
 kernel/locking/lockdep.c             |  48 +++++---
 kernel/sched/core.c                  |  68 +++++++++--
 kernel/softirq.c                     | 166 +++++++++++++++++++++++----
 lib/locking-selftest.c               |  53 +++++++++
 16 files changed, 648 insertions(+), 101 deletions(-)


base-commit: 779ab5d73a22c798d1273b4aaf50cf5b8d750be9
prerequisite-patch-id: 9c009809614854fbff979d65aad6732757d006d5
prerequisite-patch-id: 764fd197db36a3889548bbc41890dd5b3d902f99
-- 
2.39.5 (Apple Git-154)

