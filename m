Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941380;
	b=mh3Dwa3GyCMQ7WMNSsutEtZXohPE5dzJJ2YsnS1oZBCIyLcTiq1wg+ggHPZRiYNswI2a
	 e8gWOfOY+WOQJFKNj2QEWVfZkeCnCvLMpHAh2kVxwq0m0qW/O4JAEzT+Xif7FbDqqkcwH
	 TUuiXRHgh12K4qfvjW3NvSVVULJW7bxKcH9V+hfW6AJ6l5vpaQ44O/FtJwLhf47dbx+Bb
	 otqKCjdFzfvOpM0cSEug3bcIDbg+L6RoGswG3/r6+IjoTN6J7xvFGdkbvMyWN9XaWx8Ru
	 hVC7Ocv0IpOOlBJGfQYDDP7i3xIKobCioTnIy6U4lWijdvqr8J72bcXsoxLkJSQXtEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Me5yfIzDRGI7/xvPxV35hthDkGXlSHz/rORd9jtaqKo=;
	b=cwqr0c2l8tXDceR8Gxpf5ijJi54xMayyVH0sOOwn16OsqeF0kWlMkWPwhwP0nN3FkiXj
	 x4zJi1clw02o2qtHAaUKMz/QAA86GBYvdOS4/tCdDc4VBdH+MFueNzBW+FXtpAqbKUbjV
	 phDrYJ6W5qlwWnwAKQ20PpI0hEthQ32Bq/TIJY7ictIurNrnbK/FsP7wQvqgPHbnz8rSS
	 cUVlQlUNQOUktGoosTH/En44al+ZVQtu8XZgFDkTAsll0GiN5SQWW2AqjxAOAEoPLrAUt
	 Jt1dR603bM887GD7JVYpLnD4CLPjH2cxbVY/e6K790QNhUrMixvZctXkGmrF+SwBntw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jYPTqhcu;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C6060A2601
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 18:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49C6060A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jYPTqhcu
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-370230d93efso599684eec.1
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 10:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794941380; x=1795546180; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Me5yfIzDRGI7/xvPxV35hthDkGXlSHz/rORd9jtaqKo=;
        b=jYPTqhcuLJsR6w4QBEm79blfpwVwe0CniTExnTZxAeGC5z+cT/Wt8gJt5bljlh3Pxj
         i7AUnoSm+ZqtklFkfQV0qrMaMmR1LdL6oq8p2I1/fGaPwzC5zFzADrg7B/bjz8bXjG1F
         F1wqxBl24cAEc5aopYeR1OFSK1PjMwZW1YWr2yzcBqH0ligwoEHxUegOC+rn2FKjcJQ8
         Uj35Ora+CWplt2sBin5Yenp4kOTp5siVvfpfLsaKq/D1WirI4+f3kQooG5zWJkQCfJJ3
         d1R1+PvbQS9dqh2ezlB2OyZA+rGAyUs2iqlmirvdhsBrcIUaKht858nCl2Ls4l+RGELV
         sYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941380; x=1795546180;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Me5yfIzDRGI7/xvPxV35hthDkGXlSHz/rORd9jtaqKo=;
        b=QL5GjSKn5bcvF5ZTUaYdyVnLu08H5FZIlPpYL817e9Etfm2qHsmmq44rLXB9Bzy0Aw
         DTKnRFGJkTAykuglBgbsmhyPHkSG4TREUNlmD6GftrBp5WJsiWoR8/Ti0KUibf+j6wHE
         ZVSMdtV+jMNQ0tI/iy6kzIJ2YredcGT195vUEMKayCjqe1oqEB5w1YWCU9Zt2pjPEYFp
         XIv2Tgtm+MEYj4t2vUBCC1myh3rJKzwWGzRel822SH+ndhwpnkRq29dXED2XsJCSV3vy
         1QFZ6ybDIZvil7mYHGktBmBqoykWz0tRJLoD4kk84A0BQYhtc5+/7hj/z9paAeEJ1zUL
         3MNA==
X-Forwarded-Encrypted: i=1; AL+hErGR1L/f7Mx0mmMsePKaDhs+1lVNDYe0Bzwjh6ZO2iu5FJhcMEAQSKLePvLemm7oHD1jeMIt@lists.linux.dev
X-Gm-Message-State: APuU4Z/sPbUjsiqSF3ROYSou2IEToKFOBp9LvnyAn/mycetcaAYa3IDm
	borffm/cxguOmjLAunW7DDxQrFwEVidebSluj/mAVcJDKyiYhgTDG6WHM2/i+sel1waMnTZeX10
	ZuLDI6btfSw==
X-Received: from dygg15.prod.google.com ([2002:a05:693c:80cf:b0:369:a832:e377])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8944:20b0:36e:8410:ecf6
 with SMTP id 5a478bee46e88-3827f5ad3dfmr294688eec.13.1794941379344; Tue, 17
 Nov 2026 10:49:39 -0800 (PST)
Date: Tue, 17 Nov 2026 10:48:39 -0800
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
Message-ID: <20261117184844.99889-19-irogers@google.com>
Subject: [PATCH v14 18/23] perf env: Add __guarded_by and __must_hold annotations
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add __guarded_by(), __must_hold(), and __must_hold_shared() annotations
to the bpf_progs and cgroups trees and helpers in struct perf_env.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf-event.h |  5 +++--
 tools/perf/util/env.c       |  1 +
 tools/perf/util/env.h       | 19 +++++++++++--------
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/tools/perf/util/bpf-event.h b/tools/perf/util/bpf-event.h
index da4eeb4a1a73..3f3323f98f49 100644
--- a/tools/perf/util/bpf-event.h
+++ b/tools/perf/util/bpf-event.h
@@ -6,11 +6,11 @@
 #include <linux/rbtree.h>
 #include <api/fd/array.h>
 #include <stdio.h>
+#include "env.h"
 
 struct bpf_prog_info;
 struct machine;
 union perf_event;
-struct perf_env;
 struct perf_sample;
 struct perf_session;
 struct record_opts;
@@ -42,7 +42,8 @@ int machine__process_bpf(struct machine *machine, union perf_event *event,
 int evlist__add_bpf_sb_event(struct evlist *evlist, struct perf_env *env);
 void __bpf_event__print_bpf_prog_info(struct perf_bpil *info_linear,
 				      struct perf_env *env,
-				      FILE *fp);
+				      FILE *fp)
+	__must_hold_shared(&env->bpf_progs.lock);
 void bpf_metadata_free(struct bpf_metadata *metadata);
 #else
 static inline int machine__process_bpf(struct machine *machine __maybe_unused,
diff --git a/tools/perf/util/env.c b/tools/perf/util/env.c
index 50993b0dedc5..9e8e5d1d822a 100644
--- a/tools/perf/util/env.c
+++ b/tools/perf/util/env.c
@@ -302,6 +302,7 @@ void perf_env__exit(struct perf_env *env)
 }
 
 void perf_env__init(struct perf_env *env)
+	__context_unsafe(/* initialization */)
 {
 	memset(env, 0, sizeof(*env));
 #ifdef HAVE_LIBBPF_SUPPORT
diff --git a/tools/perf/util/env.h b/tools/perf/util/env.h
index 23d35425efe3..6b2083e3640c 100644
--- a/tools/perf/util/env.h
+++ b/tools/perf/util/env.h
@@ -139,16 +139,16 @@ struct perf_env {
 	 */
 	struct {
 		struct rw_semaphore	lock;
-		struct rb_root		infos;
-		u32			infos_cnt;
-		struct rb_root		btfs;
-		u32			btfs_cnt;
+		struct rb_root		infos __guarded_by(&lock);
+		u32			infos_cnt __guarded_by(&lock);
+		struct rb_root		btfs __guarded_by(&lock);
+		u32			btfs_cnt __guarded_by(&lock);
 	} bpf_progs;
 #endif // HAVE_LIBBPF_SUPPORT
 	/* same reason as above (for perf-top) */
 	struct {
 		struct rw_semaphore	lock;
-		struct rb_root		tree;
+		struct rb_root		tree __guarded_by(&lock);
 	} cgroups;
 
 	/* For fast cpu to numa node lookup via perf_env__numa_node */
@@ -223,7 +223,8 @@ int perf_env__nr_cpus_avail(struct perf_env *env);
 void perf_env__init(struct perf_env *env);
 #ifdef HAVE_LIBBPF_SUPPORT
 bool __perf_env__insert_bpf_prog_info(struct perf_env *env,
-				      struct bpf_prog_info_node *info_node);
+				      struct bpf_prog_info_node *info_node)
+	__must_hold(&env->bpf_progs.lock);
 bool perf_env__insert_bpf_prog_info(struct perf_env *env,
 				    struct bpf_prog_info_node *info_node);
 struct bpf_prog_info_node *perf_env__find_bpf_prog_info(struct perf_env *env,
@@ -233,9 +234,11 @@ void perf_env__iterate_bpf_prog_info(struct perf_env *env,
 						void *data),
 				     void *data);
 bool perf_env__insert_btf(struct perf_env *env, struct btf_node *btf_node);
-bool __perf_env__insert_btf(struct perf_env *env, struct btf_node *btf_node);
+bool __perf_env__insert_btf(struct perf_env *env, struct btf_node *btf_node)
+	__must_hold(&env->bpf_progs.lock);
 struct btf_node *perf_env__find_btf(struct perf_env *env, __u32 btf_id);
-struct btf_node *__perf_env__find_btf(struct perf_env *env, __u32 btf_id);
+struct btf_node *__perf_env__find_btf(struct perf_env *env, __u32 btf_id)
+	__must_hold_shared(&env->bpf_progs.lock);
 #endif // HAVE_LIBBPF_SUPPORT
 
 int perf_env__numa_node(struct perf_env *env, struct perf_cpu cpu);
-- 
2.56.1.703.gf848ed807c-goog

