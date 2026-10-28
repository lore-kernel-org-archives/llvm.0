Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158341;
	b=YWa9gV/nyTMIYJPaBMMc9svy0OzRh8VW0IJm6PLGvvmtqBaR49i85j7Ujm2Rjd7ddG9W
	 jAYc+T1KG51pjfeSPAiX1Twj8C+KA1ytIi3TXBx6OX5kEiXuZH1Jz0yWgOpWirbfqL9yv
	 4hRa2vJ0mqScv8Bj3wKVQOEgjegyTbgpSmzosmf2oHBwVVCIuaN8VRin0RswGNaPVZu+Q
	 RPVPThFuh/4u1ogxmHfYHbMENrCNdMJRM2d36+0nul8+xYKDp2wps1VOeyvojsvOclano
	 xv0n4xzreQe9sxH390zo4tEear0iSYwCizl1jQJfTpa2Q59nkjlrHUP0kd6W4BnkqiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZR3iK/21HRL590OT/HWs7TggzA8Gmahp8IuVcPxIo1I=;
	b=q5gViI6k2iX/2OG2T5uL6H2JSClEtCZ043ZliLlhMauV8nIUACQ4aBXYCg7Sr6Lo2tRX
	 gAhVCCx10CXj+yfIvazDnqg9oBtwVwOW1hUdpk5cCPFm+v0esmLbjFr5CPVBvp8uNX6Uq
	 BFVvnqn158GWTwnNIbpyLU0q5Kkb/QLPnltYDy3CLC+SILDGAf8S31RgJocTyfurIa7sV
	 mkd9zLgWdlPfaxytk9sG/t2w+aoYyoiZpjGshEmIBUocgS3yiRtJhrLmN2vRtly+8+7y6
	 9VAPj0dKa24OSWfkEJXtAmeDFJJugeVVZXASCyzXqDs0ZXc9Hp6dXHvB5PsAWyrXy2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pYewvRJo;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604A460A2604
	for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 03:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 604A460A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pYewvRJo
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so4459395e9.0
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 20:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158340; x=1793763140; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZR3iK/21HRL590OT/HWs7TggzA8Gmahp8IuVcPxIo1I=;
        b=pYewvRJo2ad9DvGMM8vBMzuDVLbtjFgeMpstmyaDKVWPbWbvmk7z/IA/K7nW8FBjaC
         nT9WBD1/fcGC4sSwjawbLjfywKxuU27JlHJhM/UQuRA0UMCejNgw6lSJ0up+US885sEq
         TFlGzzzaH9QAGmmmL4ts8XdCSmsKdZdc82J3xiODfT16dVHVM5kD34091PvL/s05QyMj
         LRJ4rAyBp3spJFoXbT2UY8O5MxAiSw1SuihpUjNV3crvzyy6PVk/RFq9XyWHDwyC8E11
         JfSXJhe1zmur2MKE/DKoqfjOQvt9EAnvS3yTfdIWasGlCDXbSk2YRVRAs80Q7LqlOWDX
         Namw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158340; x=1793763140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZR3iK/21HRL590OT/HWs7TggzA8Gmahp8IuVcPxIo1I=;
        b=q1lDBk1ubD0X51sN0hXEz3xxDfWo6C/73Mv4OGxKmhtI4khjidFL4AvsZm73H273rv
         ++b8l4cEFYt25Tic2nT9mEzuDxuZZT/iSKeMZE2MnmWSTk30HyF4ZjMWkwtoo4BbSYsZ
         9uWekWrtp+vr6tAoHteam2PyCczwbrg/l3sJrbMbKcCVMbdmyABMUWYTBOEViZwVB9oa
         qcl4U49z18G9y2pJTKU9yETUlHnOUWfMN4l+mQl7Rpct/uWvaxmoCVOxP9Op2vb/z4z9
         AuhywrXCLPdZlW6g3u5vya0atj2tTjfkv47A2U32DMbVdvtXT8KCUWHwEa4/kRujZRFm
         21cw==
X-Forwarded-Encrypted: i=1; AKwUvBzcloST2IB185/WMDXM1yF6rVp4pWly5tKKZLKIrFbjRlNGnb636iFSLw7QtUeEEFynimFX@lists.linux.dev
X-Gm-Message-State: AFq9FYKNZnmIg6VQHwZ98ECmQX7v1MtAbc+LE/kzDNYkTCJOrPgLQ0S3
	4Qzt4KaoBnVOQsAcSQ0PQCQycMf9FNIUcMTF0MNJL1wBzDpqcIiqo0cP
X-Gm-Gg: AYBFou3Qytm8zzptyMzsd0eZyoQG5oev+ZllF7/RH65WNk7M1ADvwm6zSE8tfe6cZRa
	u0aPRnw6LaJRPbrRqyjxcTVi3mniRgDBWAz756EkksvEXUt6qOkkw0s1caA60JODp9lcdT1fKhG
	ikZo68rgmU/fL9UcScExxIZUSPjEy5H+7ftowR+MRWXw9hiCqhmMg7I2PdPGMjXfG6SlqENy/yo
	BXdh3e17dXiRZmIdTHQ+m/GHjR+0hQhHhIpoy9D00FHlLVy4x9zNB1igcJFFRyxAb6cwvZvMTDp
	7kD5ypWUpLtZtW65jNhjngPhQxeh2G/tdJ2jIo5Up5faf/wNbYRRNfQXl6yNgNeJiMGhd2igDGJ
	c8G9kICgcDS1s3/HpQDK92YS1LNmd17oe4sGn4dsyYO/FOKCF7LC25dKABMiB7qSUequELP/VKg
	3WgCxnYq3EqpAqOtUE/xbkc4lQTUXvXc17s/64zWZyUWJ5zZ/0tilb5zaRjVg5enuwObbZ4ezKm
	W9xYcH0+z1mUR6penvWSBKqtvtkmuY0AbE8YKut/6QjrLhJDO1lTLrIS7gtZE0uhcZH3Xr54gpq
	GCguqRIVNd6r+ZRsBrPtO+eKxhpDXgU+x+JAobiQYWMlRmH7ANmb6rwai6KA1Jd8N8+h084iGN0
	r8Y7sjsQ1gm9iv+MdKLADFb2u9k7u5jEiu2p+1ChKafXM/HI+Eel9y7QJJrz5pNUq2gTT9igdBq
	Etndjw7j8HuIRZZa/svuHjrdxD8DzzNrDq
X-Received: by 2002:a05:600d:8641:20b0:4a2:10d:5e0d with SMTP id 5b1f17b1804b1-4a7c58f389cmr88355155e9.14.1793158339700;
        Tue, 27 Oct 2026 20:32:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:19 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
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
Subject: [RFC PATCH v2 13/13] locking/selftest: Exercise hardirq return-tail preparation
Date: Wed, 28 Oct 2026 04:31:27 +0100
Message-Id: <20261028033127.82193-14-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
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

The return-tail lockdep preparation must see a live hardirq context. A zero
depth must fail. Depth one and nested contexts must pass. The ordinary
preparation helper must continue to reject a live hardirq context.

Add focused boot-time lockdep cases for those four states. Skip the final
IRQ-state transition after an expected preparation failure so that each
failure remains attributable to the preparation invariant.

Assisted-by: LLM
---
 lib/locking-selftest.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
index c3d976c801bb4..7e26b757344a4 100644
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
+	DO_TESTCASE_1("IRQ tail prepare", prepare_irqtail, 2);
+	DO_TESTCASE_1B("regular IRQ prepare", prepare_regular, 1);
 
 	ww_tests();
 
-- 
2.39.5 (Apple Git-154)

