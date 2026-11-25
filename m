Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587378;
	b=tUx/mbKDvZty0poctreDffYQHHEkfABwnDF4QC6pC/e4wp4Vo+Jmsofwss2gmiHKBhpE
	 uaz5b+px8tcn/g88mi9aTO4A5psULmgWBrEyR1u7c0pBGRUCds/50J2v1IC5/cLt7UV7A
	 S7BuBnYp8HhLBEFDvQQQIEWjhykNoX2GZuqHDnXGIjotqOyL0pcup+Jzd8/23IbKWo2PK
	 NO3XeWUzJPWcXEBlGaY/YJfd23dx1y6o5Cj1rzSB9Btoh1djeC85uTAZ4DwZd+s2mE49d
	 d+874mBvgRIOxRTSv3/ObvKMM30KOJcCiYeuKzyG7eWtNDacbnggCX1Nr4W1qPBLLtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=09MAmcu0nJvDv2rEHeASXKSxzXy8pllt4XI/+xpi/1s=;
	b=NCSayf+H0RAbxWv7sfwVLVCRi65p/UIu4gjVes/SyrgWAs+K4VBc+3aZlXtQAr4pbCIy
	 k2aoegZK8jKgJqc/fQVfbgvT5YXEho6EXLF/gg/YpC+eML3Pq+6qi+Ipe2rtreLj+hMEM
	 MQk+N6jaxHylj8PVXyOm/H5l0W5LfyRlQMoPShXxkeQv5/tIcnAHCZFG1TZlRzgcX21lx
	 +Ts/XIQ98a8vhhLPPz9m51ejk/pwvQNMNe0duSp/HnvP/x6SJLwscJjgxYuFaG4cHLsRk
	 gAySk8uFdWCayqtNs1JZpVVViTSxZ3isVd1A3dLRg6Mdw1nNlfEPcJAm3pVIqEtsCpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=THNmwCxI;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5751C607024C
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 06:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5751C607024C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=THNmwCxI
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3846d5f54c1so6513564eec.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 22:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587377; x=1796192177; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09MAmcu0nJvDv2rEHeASXKSxzXy8pllt4XI/+xpi/1s=;
        b=THNmwCxI++eAxLgVQdEZiKUYHJXRFpAptWNUkNON+VsGiQF9aAOdTUiEKQMftU7VgY
         ECtLNsShW30LNja8sT9CWILOqke9HPjmKX5oT8ldpmPWrisk7BctGYwXtaYnpgcy42bH
         XrgDfPrvZXtNuWZ7B4+5+XJJNS8Ec6KN8A9x8RrnSU3NiFMHxqmrPvN3VfpIHm9Cj+Ox
         QRjIiR20mLyhqn8b+hjL7xJjhh3gAggTilfg8fq78X13OyKE9Io9MObhnF0gkySurSgo
         cXP+GvSLYcAFL//yloqu1AiWQKT9G35JcKd9Yy6T/3R7jeQv9/4mzvJGAnqsrAHosT4g
         3I1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587377; x=1796192177;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09MAmcu0nJvDv2rEHeASXKSxzXy8pllt4XI/+xpi/1s=;
        b=pCDK2VfcybY7JebB2ijUK/pNrl2vCgZkKyJyaAyHg39V/lFIVSISQcyCbo1JLXWSpS
         dNwCs3aPeMxyZws25ShbGTbsTueLxO3iCHWXkjgtFgo0nR7UY1DAK+SyfDRJTZI83u3v
         hSyf4EXuAVwxmD4dcZsjch4fvTV77wZntIEmOO0GGXZIlf+FdvARUW71vf3UuwEJYSok
         evIkaZOQyuvbLUQDBi/WP9mAVqzZuFEteUvQm/n1FIM7CoATxfJxDHwmYaifBbbPt8O7
         /jVaB1OmZeaKTD9V9WASBjOyH+z4IC9fTRjJ5Z/kvKV4tzwBJr5u3ZUXKWNMLeehjZeS
         l0mg==
X-Forwarded-Encrypted: i=1; AL+hErE6/BYez+DitwrH3raj4BK8t0AgtfaK6PNwHL1NKbT49+LDnjp7b6ggvalumSwZ9Aq3jvz9@lists.linux.dev
X-Gm-Message-State: APuU4Z8iNH8XVYCYUdu15BTytWvJtQDMXJYBiYKhZLlCp8WaMOQlWkLw
	urq93lJKGLieSqhKg0BeWXQ5ieQlMlS1ipHLmTmPGvzHPxZocI7j0BaeUAV/5vVYopRk0nhOh7Y
	EBZ3cORQjJw==
X-Received: from dyba9.prod.google.com ([2002:a05:693c:63c9:b0:386:a06c:3241])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c72d:b0:369:f9c4:1fda
 with SMTP id 5a478bee46e88-38570845628mr15750428eec.27.1795587377097; Tue, 24
 Nov 2026 22:16:17 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:03 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-11-irogers@google.com>
Subject: [RFC PATCH v2 10/30] tracing: Skip internal ftrace frames under CONFIG_UNWINDER_DWARF_CFI
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Calibrate ftrace internal stack-trace skip counts under
CONFIG_UNWINDER_DWARF_CFI alongside CONFIG_UNWINDER_ORC so stack traces
captured from tracepoints and function tracers omit internal ftrace
wrapper frames consistently.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 kernel/trace/trace.c                | 4 ++--
 kernel/trace/trace_events_trigger.c | 2 +-
 kernel/trace/trace_functions.c      | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 65b9d67647e5..6d36c790c2b0 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -2156,7 +2156,7 @@ void __ftrace_trace_stack(struct trace_array *tr,
 	 * Add one, for this function and the call to save_stack_trace()
 	 * If regs is set, then these functions will not be in the way.
 	 */
-#ifndef CONFIG_UNWINDER_ORC
+#if !defined(CONFIG_UNWINDER_ORC) && !defined(CONFIG_UNWINDER_DWARF_CFI)
 	if (!regs)
 		skip++;
 #endif
@@ -2258,7 +2258,7 @@ void trace_dump_stack(int skip)
 	if (tracing_disabled || tracing_selftest_running)
 		return;
 
-#ifndef CONFIG_UNWINDER_ORC
+#if !defined(CONFIG_UNWINDER_ORC) && !defined(CONFIG_UNWINDER_DWARF_CFI)
 	/* Skip 1 to skip this function. */
 	skip++;
 #endif
diff --git a/kernel/trace/trace_events_trigger.c b/kernel/trace/trace_events_trigger.c
index a2487ad7fef8..c79df5b526e5 100644
--- a/kernel/trace/trace_events_trigger.c
+++ b/kernel/trace/trace_events_trigger.c
@@ -1597,7 +1597,7 @@ static __init int register_trigger_snapshot_cmd(void) { return 0; }
 #endif /* CONFIG_TRACER_SNAPSHOT */
 
 #ifdef CONFIG_STACKTRACE
-#ifdef CONFIG_UNWINDER_ORC
+#if defined(CONFIG_UNWINDER_ORC) || defined(CONFIG_UNWINDER_DWARF_CFI)
 /* Skip 2:
  *   event_triggers_post_call()
  *   trace_event_raw_event_xxx()
diff --git a/kernel/trace/trace_functions.c b/kernel/trace/trace_functions.c
index acaba990aaaa..d601fdedceaa 100644
--- a/kernel/trace/trace_functions.c
+++ b/kernel/trace/trace_functions.c
@@ -251,7 +251,7 @@ function_args_trace_call(unsigned long ip, unsigned long parent_ip,
 	ftrace_test_recursion_unlock(bit);
 }
 
-#ifdef CONFIG_UNWINDER_ORC
+#if defined(CONFIG_UNWINDER_ORC) || defined(CONFIG_UNWINDER_DWARF_CFI)
 /*
  * Skip 2:
  *
@@ -602,7 +602,7 @@ ftrace_traceoff(unsigned long ip, unsigned long parent_ip,
 	tracer_tracing_off(tr);
 }
 
-#ifdef CONFIG_UNWINDER_ORC
+#if defined(CONFIG_UNWINDER_ORC) || defined(CONFIG_UNWINDER_DWARF_CFI)
 /*
  * Skip 3:
  *
-- 
2.56.1.831.g720f3f5937-goog

