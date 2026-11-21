Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244392;
	b=Gd3XJgjmdPQ6JnNNxuvsGDsrrmX3i5vHnEyZrA8HYHOMxwSY4vtnnROHXYUB1yktoJ3y
	 4e7dcuIm1c3jcxCk5am3fsGdZCvqJaHBSjmWurGEGIkQduYxTF5J55ce9tMQFywmvSSoU
	 /7gkNOpEdt5yv3WGjD87W3bf0UgPYaiiaB5nu1f9ceE0pec1vm+6JtP1Syz53dPiYnT6D
	 DnPJXuj0P1mN506i4NPMSeeYM/DQKxDCkxq2mK+iIr9V+eQ0idjzPttbLi70WC7/4rqgF
	 dklQSIiCSB+LJu5bRoCG8g+PVKIXgsrEus7nXQiP18FO10jeJn3IuBUbAUi4bqpRupQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fGAdvKbnnDNvC7VTESnuJjeTLcD1XbFE2xtDIUZCto4=;
	b=cI+iqVrvfZ2p+4/Q2/Zsv8oGN666hQgert14VXevWh2eBjmX3gGrJkmXsoOqKaMWUPyl
	 R0dF4SGhjyzx6Ah/GuQIbKiHAo0D6XcIr1riypc9lWjDf8eaJXqxjmowO1cfPJX+xwwg2
	 RYk0zCbtj04Xkg/OEGKMt5yaqMi9QmTQDCslRijlIFPlGPgqquduoMIyz2DsBgsbAQaXg
	 0mWqBHFrj66ANExyx/rnlYT+osbQ+oX2YwyNcF2BPvBuAVX0pfa8RCDVRqhC5f+ShHBJn
	 jZ3gzOMn3CnWuge1SvTAC+Lc1izKGO8Taj9yZWhy0ojzUzp/oRtgYZHVEAgoUrZcV8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lUV7dsGA;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0609606A32A
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 06:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0609606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lUV7dsGA
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-382af5cfc58so4753026eec.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 22:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244391; x=1795849191; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGAdvKbnnDNvC7VTESnuJjeTLcD1XbFE2xtDIUZCto4=;
        b=lUV7dsGArGQeJ6tfRgjTGQt84RvVOD6y1yWzSVOrDDO1exx/bGkSwmp48iisN2nyPH
         dZeZ8+XzseayZ4SmSx/3Jo4A0iWdkCoi9pXlKq2QtxKt2A6s7pss1aZiN506laaR96DE
         MBzYV/V5yypZxrQ/3As83Dl2E2J9waUndacsF+f5W90yI9SLp3HLsoZ52FH0HfjNekb4
         BeM4Fyqzpm3xd2+BGj8BLwk5vkbL+uSow1yPRhzMTZLirTTiUOX6x5MB3FpUHg2C5Fdc
         XQbQujHsxKv9l+a+812+jS3hWTcp/Wf5yjzEcSp8Oc8O5Unnpt1v4WiL7mBnbjbxUzut
         VJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244391; x=1795849191;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGAdvKbnnDNvC7VTESnuJjeTLcD1XbFE2xtDIUZCto4=;
        b=mORwSts0dA/o1hR2gO/OfEVoO1oBQuOOEe9ki+MPzXkUKQVqmmdFzPBjdKGl1KwkLQ
         eG01UgsCf00G5NC2v6IB7+UF5w626p/bhJKvdCJYpWtCIKePr8q/xqEDeNSmGvE6dujj
         ZTBeHFvNHLmCLcop0FsRlne9iYdBQjWEo0DoKYvOJ6lZ51jchPHvoNwozsWeJvdFtFtF
         +NnfYazE4fhYB88ZIWWak3e6E1uxehLMp3TLt4odwq1+R663WcJzYWAQYsg3FxY10CxX
         b7n9AF9f++T2dR5X5SnYSk8ufHVjPFl0TOwY3pXtoxk2Y/B328g1k8n99GApot1bX9ZS
         f2GQ==
X-Forwarded-Encrypted: i=1; AL+hErFOD+CXDlMQRYomGvxsTc14g6AJ8d5VZpusYE0AIYEJLJ3CLsu3a3SBW1V6NEOQEY0OPfj1@lists.linux.dev
X-Gm-Message-State: APuU4Z9DwTV/1Ql78msbjZE1rI4Cc+Y21C+kKTAtdDneBlMGVa51WrYv
	GKK7y5yOySlgkWUVkGw0aAWg5ANfFqA0RyiuTg91MNDfyuGUSQXslvZgVCZLz2gAcIFyd5cAAaH
	sey6sJ2MbAg==
X-Received: from dloo27-n1.prod.google.com ([2002:a05:7023:a5b:10b0:1b2:48fb:f4d0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2608:b0:1b5:342a:e4f0
 with SMTP id a92af1059eb24-1b5568b678fmr7282977c88.6.1795244390557; Fri, 20
 Nov 2026 22:59:50 -0800 (PST)
Date: Fri, 20 Nov 2026 22:58:12 -0800
In-Reply-To: <20261121065813.4143649-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261121065813.4143649-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121065813.4143649-24-irogers@google.com>
Subject: [PATCH v15 23/23] perf machine: Add __guarded_by annotation to machines->guests
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
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
2.56.1.750.gf70dc682cf-goog

