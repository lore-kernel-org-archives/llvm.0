Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646276;
	b=TWodcQUyHA7ZESo+XZUnxIKq4Alxga4wIwjByAyZj3iCOhRPpsxgIXv/Yy8+uLjfBUSh
	 v8LQdGgmjWyzYVoVuHub7itEYahOZ4uB3MEGuR0ZGuk1DKhfqZ5s2sPyxMgeq9IKd48Jg
	 o1rMgsWZjvnU8PzciDQ4VAxas+75Q/EOe/lqCyb6CmPO1+7vzUsx8tPCYicYPdv9Mtiac
	 4wDMNWXj3oipkvmoJif1IfHSj4Gi7wyAa+m29XzTJeqNoiaG9oa7eR2s5If7Wx/Dp/AAg
	 VwH5EIofZAy5FFQitzu4Sk3pJbZoIdLtejqkOs9oeafmtz6RPF61maa0b56naIcCF6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mo4ijoE4/zyX2xv2dQEbhTN41cna2GSZkZljd09Fpk4=;
	b=dB12poHHH8gmJAoaC2D9n5pt3bmOyKACpz9ZCmeYP7aVh0mKGG9iYQMolADk34Rerd6Y
	 RB7tXqt72d8DykidW+rKjSg7QQpmCxzfhiHia07kmuE3jDSuM/gsplwjsKqvuq9L5899g
	 T71Id/6hHPUvBrLKXsSPIPRuYkcUDDgRZXOWPztu8q3VvkIEaavNLdV/sSNLqj7fVs0S3
	 0T0SB2f3fT+59ZGogzrlgx3jI9eJHm92CewJxCZ9l9s1AuFuOwuK+iH97a/QHxAqNK2qZ
	 RfKD8vY70WYRHR9cttOd8TbK91T5tWfp09fQ6xjGrFPgfh/+0KqKNvQKC0WOs0XXmHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jDdQY2hi;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E233F60A260E
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 05:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E233F60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jDdQY2hi
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a208d93758so1612815e9.3
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646274; x=1793251074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mo4ijoE4/zyX2xv2dQEbhTN41cna2GSZkZljd09Fpk4=;
        b=jDdQY2hisz8TMYWTI29+GYLOa+ORWtv4igvGXYnM07evglAEUnle7RxucKv9VJtchQ
         ogEJdcm79/wz1HSmOGHhod4gPvO6Tr3Saq5JwLdsaca0341egxvYHz6flfqsMDb7jMpN
         ZCRM1A6PMWcv0QtDBT2eg2ZfJGaZw47wuOD4tO3u1278s0jO2RcUjbS5OLyUaQ0SGXrI
         ivcqiqdmX9ALtjJYHLS5VafZl0bEdRltZsOKkamvChe9a4URkhUA4Ul1NpIqwmCmVEPd
         STlI/NqBFUwojMPR582S+KtAVWBw/ihKeCCk4mXj9G8ZUXpWJmNuGX+Al7lno5syuTX2
         2ZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646274; x=1793251074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mo4ijoE4/zyX2xv2dQEbhTN41cna2GSZkZljd09Fpk4=;
        b=X5wav+mD1BtJLx6KkOr+qVRRjm4Z8i1YCWoY/4LGsUCaNCAhfqpGlwxKoGAhxVmoYc
         1gcM/nj3IcOTypl2KP1NZIvQtwX2WfH26vVue3JAEvr7RuzxhGo6L8mJFQGxFX+3h14I
         FFlFrWl9vAEP7RIrCK5jC1J917AaUTeaBekK//lJ2UCZJ96b92PotCmzx+GcpC+dsMUx
         0ADgIIR9eaJCIZzyKySnkHbFzaWRWcrI5Qcu11HBLFQehglF639753WY6gcxtso1h5e9
         4mVqq58mIbDC3kP/Bu5OV7hTFNPzy2Kx7bcI2K06timtTVDJopjp3a+HQcEv2rz5B1YH
         feuw==
X-Forwarded-Encrypted: i=1; AKwUvBwVtW3eQbyPmDuceX0u/BmDzog1F72zAsHty2phk3cZkYIba/oaJJv9u7QiZ+vSDZZ2af2v@lists.linux.dev
X-Gm-Message-State: AFq9FYK+gqMD6ZcvVTvpBfBALQY5fV14PT1H+EqAjnjNkGHdn/xCPooo
	xWtWGQ9+AjQI+Tee8Fum8qFiA6CaUqByTpv90JszVUnhxL7x5Ny1Grsm
X-Gm-Gg: AYBFou3sHhFBJcpCCRsIc94Su5H3s4t+cSvkq3lOwbL7OY9NwXmk7JNCU8Qwd+PLNHm
	s1d6AjYNERop1lpGRlFcuZlBdfQXCnGry396krf7g23KYejSvbw92mhI2WD1DMidZF+Yl+7kaBh
	pPw7bqc10M42vUNDl5EgMg2BLIzaDexWquF2XeJ0l3LOTx3FOh0NS5Z8GixZdV9KQGnNxbA+ibq
	Islt7DxD15WmzWhgEM83/svh/oEb6jN00DVTqaJfxsZ5mEV93dYBbmki50g/0o+iamepQkT1+cr
	ynUvBzqXfxB9JRR/XSv0jBHRwKXFHRu0CiJldxbu5nw5T3LN1DvPxgVQlfqwyJkAkYHYfe8W7qP
	6SMd7skIx3ZrptD+bFYHo2cSW3nCcJQvd7SnacL+fddmiVmjdphyZUMmbRZOHKtCcSYLcpL+YJ8
	MYaRBO1C6Qdigob7zIAX/jgpiDeQqhhltRs2hIh8kbM03wYC+u9LYaEvpsp7mjfhDettLilHBpV
	iH2qMFP8BNtk4NLvakOfaLYJ3PBEbCkul2/6lcooJPmt0Sm6AU/Fllg+vIcKJSQ7qTHF6OJm8KA
	JbewOnrwoKqGljm6twawubOu3jKfJUpQXJJce0vkAoKGSfth6JEXjkDZYcKQnC61V0W9DYE4buK
	9P54MliYuMabOVwEJZHe63Mcfm9FEXOta9uA+U0Gz2sTbZHwIMBF7LwaFXPYB
X-Received: by 2002:a05:600c:1c09:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4a1fdd2468bmr84667645e9.7.1792646274255;
        Wed, 21 Oct 2026 22:17:54 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:53 -0700 (PDT)
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
Subject: [RFC PATCH 12/12] tracing: Pin recursion state for its complete lifetime
Date: Thu, 22 Oct 2026 07:16:54 +0200
Message-Id: <20261022051654.79224-13-kmehltretter@gmail.com>
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

trace_test_and_set_recursion() publishes the task recursion bit before it
disables preemption. Scheduler tracing can therefore run while acquisition
is in progress. Conversely, trace_clear_recursion() enables preemption
before clearing the bit, so a reschedule can observe stale recursion state
during release.

CONFIG_FTRACE_VALIDATE_RCU_IS_WATCHING also validates RCU state before the
outer preemption disable. rcu_is_watching() drops its internal preemption
reference before returning, and the warning path accesses
TRACE_RECORD_RECURSION_BIT outside the protected lifetime.

Disable preemption before validation and retain that reference until the
recursion bit is cleared. Balance both rejection paths. This keeps
validation and published recursion state inside one preemption-disabled
interval.

Keep the transition slot unchanged. It remains necessary for
interrupt-entry intervals whose context is not yet reflected in
preempt_count().

Use preempt_enable_notrace() because this inline API is also used by
modules. The no-reschedule variant is unavailable there.

Assisted-by: LLM
---
 include/linux/trace_recursion.h | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
index e6ca052b2a85a..fd14380751404 100644
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@ -126,11 +126,16 @@ extern void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip);
 static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsigned long pip,
 							int start)
 {
-	unsigned int val = READ_ONCE(current->trace_recursion);
+	unsigned int val;
 	int bit;
 
-	if (trace_warn_on_no_rcu(ip))
+	preempt_disable_notrace();
+	if (trace_warn_on_no_rcu(ip)) {
+		preempt_enable_notrace();
 		return -1;
+	}
+
+	val = READ_ONCE(current->trace_recursion);
 
 	bit = trace_get_context_bit() + start;
 	if (unlikely(val & (1 << bit))) {
@@ -145,6 +150,7 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
 		bit = TRACE_CTX_TRANSITION + start;
 		if (val & (1 << bit)) {
 			do_ftrace_record_recursion(ip, pip);
+			preempt_enable_notrace();
 			return -1;
 		}
 	}
@@ -153,8 +159,6 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
 	current->trace_recursion = val;
 	barrier();
 
-	preempt_disable_notrace();
-
 	return bit;
 }
 
@@ -163,9 +167,9 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
  */
 static __always_inline void trace_clear_recursion(int bit)
 {
-	preempt_enable_notrace();
 	barrier();
 	trace_recursion_clear(bit);
+	preempt_enable_notrace();
 }
 
 /**
-- 
2.39.5 (Apple Git-154)

