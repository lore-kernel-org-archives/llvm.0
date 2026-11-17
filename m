Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941391;
	b=fMzF98VMyGMpdJrSBWI5VO0BdtG/chEifPdlYqjeeOn+We221Hu06NIIJcC2HrUr1Ste
	 7gyDotc0zXUt/eczuBXXD6et+bIRQEI9+zhNNF6Zy1nnJHnA2WD6bTVbLBvKn1YgI2MbZ
	 j5PeGUpDoEKHCxmNDnU1z2Z4+jUwBOzW6v7Ji7bdGMAnbB7hcvu/F3JINgNrsUAbwpuDL
	 qudi2demhuhJudklbWncWN55R/Oy4jo2h3nr1r8SzfqjyhIfnBW0viWqPrbjPG5fd+zLE
	 P2HsTkRJTUFRdL5wEyidtyeoQvl3zNxOOv1NSbspANuD+e9jRPAkLa9PLR+w1iRwBLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fE96Bwoq4dvubLO/ytQscTwlirtJcyD7QHCmaubFJQM=;
	b=Zc/xLGeq9TfBta2vswPwHDMRfS6mtE0XEzUPF7xQXpEsy3uwLz/6xw8JYfFRlIWGxiuQ
	 6WIQvfE4MZEquJPjHq3P50MeTlFg24X4HbZnJcyRw8eKAh+36d6S0YkqU/gUXYZhitcCm
	 4238CvlDlsmO0JWCoL0E5NbBKgGCwf3Gc7Nvf7tgf2ZMmz5jxLWmw3YUF6r/j3JneZRU1
	 ydRtUopsUiE6qPE2k/mCb6suVXPkD7MDoPY1C+o6n4qVhXhCBTF2CwGbQnp5xtIkiYU5O
	 ix4dqYB4vfdIzHgCu+UeQXQ9tQ8knvx5WLUJiTpDRQLom3AR3ISNkwMo6kHUrQoVejA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WMSNBl01;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5B560A3803
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 18:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F5B560A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WMSNBl01
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso270182eec.0
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 10:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794941390; x=1795546190; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fE96Bwoq4dvubLO/ytQscTwlirtJcyD7QHCmaubFJQM=;
        b=WMSNBl01fXJSk/OnsdcXE0c4T2uikgqeYLjA2j6YvGtzpHzRIrppzWsOEcMdD7IuLq
         GgzJFlB/vq5t8Rh8EYfYPjYDq/hvyxCGU3QPLJJ/hIs4HSN25LDDSoY7KHkDzHj5Scwy
         pOXXcElxYlrF9ZeyWZKjqBO0yYGKyQi6936N48qAxB2F2oMWzz5nInQtzXj/Fazipu0b
         r/6w+1p26ax4MZFc3SNy8PD6FjIuNE7Cs7Jaz3uEswpwHqxNKf/yitCt+E1xYLsgjcro
         i6avsp/bBSLsJ8YhOs4CZUJG2PAOQmEzH7jPDPEPnKwKuoDfA/xEx7qfPh8BlIAJD9rC
         1YRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941390; x=1795546190;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fE96Bwoq4dvubLO/ytQscTwlirtJcyD7QHCmaubFJQM=;
        b=dBgnql4DCyRTrF09IbLEL8S73T+U9aEIGyOf6eiju7RQxZRvAHWts+0ZBn7oDJVzRG
         HYdFVfLDAN1qqXwAep5Kb1TI7SrsidCCR+BWLslu218fxmLvI/HCwqGWJAZLKMcCbosb
         f+jPHmk5EB67BwZXGi3quq5EH4QsTsJOuBuUTKMHPfVwtEAlkfhfj+3gxFl5SqhbEi8g
         OeApenOjmjjJfzWmtmp5Vk0CtOV9Zs/K0Z1yKw+dPTqLyBjTs9drn8TTAhFeGWjZQRH2
         dzvmJwTHzEBfGvhUabZeqpN7pB0SEtQADFjmSS/z7OQlOZhRTfkiuYlkrO1CdkfjtVlE
         ZCRg==
X-Forwarded-Encrypted: i=1; AL+hErE53OK5Xd4s7xXzxnlTVRb7tQzx1iEX9/IGBU5eI4/o8jj0mtkO8+xSaUwyOTYmkwo2oMPQ@lists.linux.dev
X-Gm-Message-State: APuU4Z8Ov1IfijSWobE4hpfv6AUSeqSnlWz5uhs5pTgNCi/iBAUC6dut
	iz8n0fyXGsGMcKXa3aC1keomy/V0pl6Prv13gJwT/VMH1HtRalbKvHqmwYkX1ghiQ8uHkioQoC3
	BAwVTFDB4rQ==
X-Received: from dycnd10.prod.google.com ([2002:a05:7301:c0a:b0:343:520f:7a80])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:804c:b0:378:2e89:3958
 with SMTP id 5a478bee46e88-38280f22793mr277558eec.19.1794941389993; Tue, 17
 Nov 2026 10:49:49 -0800 (PST)
Date: Tue, 17 Nov 2026 10:48:44 -0800
In-Reply-To: <20261117184844.99889-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261117184844.99889-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117184844.99889-24-irogers@google.com>
Subject: [PATCH v14 23/23] perf machine: Add __guarded_by annotation to machines->guests
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Annotate guests in struct machines with __guarded_by(&lock) and mark
machines__init() with __context_unsafe().

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/machine.c | 1 +
 tools/perf/util/machine.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 0cc593d5372a..70870baa157e 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -234,6 +234,7 @@ void machine__delete(struct machine *machine)
 }
 
 int machines__init(struct machines *machines, struct perf_session *session)
+	__context_unsafe(/* initialization */)
 {
 	int err = machine__init(&machines->host, "", HOST_KERNEL_ID);
 
diff --git a/tools/perf/util/machine.h b/tools/perf/util/machine.h
index 80191545ee8a..67d517742fb6 100644
--- a/tools/perf/util/machine.h
+++ b/tools/perf/util/machine.h
@@ -3,6 +3,7 @@
 #define __PERF_MACHINE_H
 
 #include <sys/types.h>
+#include <linux/compiler-context-analysis.h>
 #include <linux/rbtree.h>
 #include "maps.h"
 #include "dsos.h"
@@ -153,7 +154,7 @@ struct machines {
 	struct perf_session *session;
 	struct rw_semaphore lock;
 	struct machine host;
-	struct rb_root_cached guests;
+	struct rb_root_cached guests __guarded_by(&lock);
 };
 
 int machines__init(struct machines *machines, struct perf_session *session);
-- 
2.56.1.703.gf848ed807c-goog

