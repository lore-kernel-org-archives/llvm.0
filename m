Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646273;
	b=ruogJF13bhH1baZ6wihe11xeoMdduk/I2JQcAkL8y/t6b50VgZLhwCWqNdHZBhj6GWnq
	 U2GwB7WyDnT0K6IV/HpDXfNDuMkmqFn/BfiKlMq77QeHlfXpgW6qGz06PlLSK0npyaNlT
	 b4xcZpqKcoteZgZzBXODjGI75lAo+bIHl9kbTKhq4km7J56of5LcXIkrSOOFevfJBYGgg
	 smMCRBTN6Pdo55Y5PQgXz7u+fWNRNm/XtDMEVzO0t3i9SwKnmW9EfCrdn1lE980wrBr0q
	 HRQnEx8a1swFfzdI4DwB4ZQd8NZOkAOGMqsBqXjUHptLEZLgzZea7dEEJbBVf3IPqWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s8aI8a3P6Aq6+tBvBYl4aRZbjZMBmTJC4bYbBQam67c=;
	b=d8SeWSTp2Bw+GIyqc6xQgRdmHGwAm0pkVn9boZkaf5EELClUsqrXWF9JKBGg17G5o1Fh
	 4uVfa1eq/nAYsu9pt+4luoBgvh3rgtIKcZQ5bIAeLaa1kAROMnVVh54Ml9wKuqiv9xro8
	 6GdMjmgcecrTp5+1ns9sgWVlD8P1N8EvlGWDlnRWIceYnExUsyHq/lKdVxDmZo5CeY+do
	 FWVQaWKjKs4ZtIPm4pHXnnwH6m3c/WAnv+4VAF/AnP4x91SpDmFevJyJBYxdQb5hiWLLf
	 p8vVNVuloO7LgzMwEvDL9qwnzx8PsHFSIKYzgpxl7MQs0S3GnVa1u0p1HdbubzieSZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bDgz3Da+;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A7F60A2601
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 05:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32A7F60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bDgz3Da+
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so11794725e9.3
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646272; x=1793251072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8aI8a3P6Aq6+tBvBYl4aRZbjZMBmTJC4bYbBQam67c=;
        b=bDgz3Da+Ke7ybh9+QrhQUgC7dA6zslNEj7vqevxZ0mOqV55PiFZO3QD4N1vI6Bsn/+
         haJLOHcOxf5072AhXbbs7XQoOp+FGBrO6Fn0LV+wM0/Kwbx5OvY663FPtg6Ob5/aMF9b
         F16pYnN3V6GgFXv1Da7T1PS7JQBReM/euWRG60QWYMduIaf+J+xhaya/xscFB5gTVYJk
         8/PCb6yZfG+kSFG0bs8QW4ZNNa318x3aV6CnSo/bzHp4ZSxY+ZfaPADQYVN50rZ3Oay1
         ix8f6vlhURBD4Um7MBhq0LmhC7MVsdL7km42yDOtjfC3zdoYcpMyyN0oDgtugDBMzqJf
         4DDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646272; x=1793251072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s8aI8a3P6Aq6+tBvBYl4aRZbjZMBmTJC4bYbBQam67c=;
        b=lmz32DQIyeZwigFcJyZZunI51TzMfW4V7Qm46j74DttbBmBGHkaq/9CId9vjRJW4ek
         dmS+VgvnFKDF0rSZv3B9Yaw7IcBopIjGCUSkyMXM5Fjen3a6vZp+2i+IJyEcjHVssIoU
         KiaZCApU1MEOmgwx1S/pLBr/tzx5pFWDvFr0sPNZvjc1t7lPK06hBwCBJkyQH8GCR1Ik
         pZ2FS+b11B9KnIupXiz9z4Vf3iYJvnvJZcdhIG3PzYgh+PHfD65RtlWNKeWkd4oW9ccg
         KyqlXhtOOu+T1XZ/XqsEHWrJq1Z6RBPRGGkJTkyCz+foXAptxcn9wNqBFOA1BkeABqM3
         87vA==
X-Forwarded-Encrypted: i=1; AKwUvBwEZVH54NUXrZgEcz5otIHkDZQDGGBDG7iXM8ilXdZphzh80bh2iAHQawioND5Sg12B3gR9@lists.linux.dev
X-Gm-Message-State: AFq9FYLYs2lDkbQVnjXOZOtsBrdiEd4+aHdFRum9hRznQnQoDVMqpDaE
	TAZzlOB0v457hsBc4SaC+RPBoWV9gYKaU4twa9JqZ9gxZE/HwmdthlsV
X-Gm-Gg: AYBFou3jr9gl0r0hcvQqX/EC3zU5qRo0RAFtmbNXhPP2Lx56Hi/mGCYlYIIHUmcg2DZ
	anqr9QovNFBpqsQc3KLko8VftFvlK1zZ40GrckYcUw03M88WQsdoKwozqqn6CjMRZ3anKxMWOKt
	daeoyepzx+J9AEnxb6eAbhpLWrZxSsfvBPEZfE/yrpZbVMlbNAQ+WHJreV5bwdHx8sReRNY2FSo
	aWysKOM5NicF346sp1hSkpA1PVHrw/eRB6Ki8NOyUwS9WAJZQV+Ub44q1fj1jep8TTsn7IQIql5
	BHJCJZcbNenoP1c7aPW/iBXh3DxPdYjBr07EtFXHA8yiZO4hsJoGwz12fbgz+3sbFkEz2Zu/Enw
	OX9Td6GgSNCRD8JDEwg44Qxbb2pvJW7dtsCWIgoLvxbgKue+hbMRxBoSX7IXlsBx+X2KQIUyl9u
	lblT0ZU1Y9wG9n0QEG4i6beOmCq/ljZju/czque0JBntuNmIZMFZ4jurjBS1yHHSbieYNSeoaIA
	/oJtpJJjRSgLDLvFwe9suU7jicDJ0JH8D/Ih9TuxF/PhDomVwzNqO85f48sLAjQ17S8QyqiWV+K
	y/5EevWbe9H/F0fUprJhbtLqw5NyANBZWkt+p8o8c58mhKw4mD/ZzRMhcC0nr6rHmWhNdQI8HuT
	SlBXjdEwdP8M337uUMW7Mn4BBLKJI0EKjsrXQeLlPw/Jwi02RYu6sbTzrhNGOjE73ckPjV/E+UC
	lranC1
X-Received: by 2002:a05:600c:4715:b0:4a1:e46d:1bd4 with SMTP id 5b1f17b1804b1-4a1fdd574dcmr76596295e9.29.1792646271519;
        Wed, 21 Oct 2026 22:17:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:50 -0700 (PDT)
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
Subject: [RFC PATCH 11/12] locking/selftest: Exercise hardirq return-tail preparation
Date: Thu, 22 Oct 2026 07:16:53 +0200
Message-Id: <20261022051654.79224-12-kmehltretter@gmail.com>
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

The return-tail lockdep preparation must accept exactly one live
hardirq context. Zero and nested contexts must fail, and the ordinary
preparation helper must continue to reject a live hardirq context.

Add focused boot-time lockdep cases for those four states. Skip the
final IRQ-state transition after an expected preparation failure so
that each failure remains attributable to the preparation invariant.

Assisted-by: LLM
---
 lib/locking-selftest.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
index c3d976c801bb4..1575a04f65d46 100644
--- a/lib/locking-selftest.c
+++ b/lib/locking-selftest.c
@@ -222,6 +222,55 @@ static void init_shared_classes(void)
 		local_irq_enable();		\
 		local_bh_enable();
 
+static void irqtail_prepare_test_enter(unsigned int nr)
+{
+	unsigned int i;
+
+	local_irq_disable();
+	for (i = 0; i < nr; i++)
+		__irq_enter_raw();
+	trace_hardirqs_on_prepare();
+}
+
+static void irqtail_prepare_test_exit(unsigned int nr)
+{
+	unsigned int i;
+
+	for (i = 0; i < nr; i++)
+		__irq_exit_raw();
+	if (debug_locks)
+		lockdep_hardirqs_on(_THIS_IP_);
+	raw_local_irq_enable();
+}
+
+static void prepare_irqtail_0(void)
+{
+	irqtail_prepare_test_enter(0);
+	lockdep_hardirqs_on_prepare_irqtail();
+	irqtail_prepare_test_exit(0);
+}
+
+static void prepare_irqtail_1(void)
+{
+	irqtail_prepare_test_enter(1);
+	lockdep_hardirqs_on_prepare_irqtail();
+	irqtail_prepare_test_exit(1);
+}
+
+static void prepare_irqtail_2(void)
+{
+	irqtail_prepare_test_enter(2);
+	lockdep_hardirqs_on_prepare_irqtail();
+	irqtail_prepare_test_exit(2);
+}
+
+static void prepare_regular_1(void)
+{
+	irqtail_prepare_test_enter(1);
+	lockdep_hardirqs_on_prepare();
+	irqtail_prepare_test_exit(1);
+}
+
 /*
  * Shortcuts for lock/unlock API variants, to keep
  * the testcases compact:
@@ -2934,6 +2983,10 @@ void locking_selftest(void)
 	DO_TESTCASE_6x2x2RW("irq read-recursion", irq_read_recursion);
 	DO_TESTCASE_6x2x2RW("irq read-recursion #2", irq_read_recursion2);
 	DO_TESTCASE_6x2x2RW("irq read-recursion #3", irq_read_recursion3);
+	DO_TESTCASE_1B("IRQ tail prepare", prepare_irqtail, 0);
+	DO_TESTCASE_1("IRQ tail prepare", prepare_irqtail, 1);
+	DO_TESTCASE_1B("IRQ tail prepare", prepare_irqtail, 2);
+	DO_TESTCASE_1B("regular IRQ prepare", prepare_regular, 1);
 
 	ww_tests();
 
-- 
2.39.5 (Apple Git-154)

