Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588158;
	b=MVdvOp7HPBMNhrhrhzSra7vxf2qikdFcHElLskJ9M+q2YW2gqqLf5e42VrdJ3RQvkF86
	 Qq5gyrxPdc8FgnODR0w3nXqUZuhuRp0HovZ+9XCPkj4sbzUoUx7CxBqqOcFbdgUeLFUSw
	 Ab0EBhu4a555sBxWZR7fVaYUVLzDvSAUJRHBHBAyjqCupuaEDhNCuFk7Y+x3sQkpJ1tm5
	 ANJIi3RNEMVxoKPHD6VMCauOIVzNBdb5H24UII2MK9MYXTrz4KJiNNROMfFCTS/2lYSnq
	 loc1lE+kMjgaQ0VpOflywdhWHgWDc+ZR8NEBWipsHaCuKzJAAtKeDvPxtw6P7KJgnkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Me5yfIzDRGI7/xvPxV35hthDkGXlSHz/rORd9jtaqKo=;
	b=0+xsJqXFm0LPR861lb+LGnmfFCo9VzQ+pPLSAslHpLITeA61lxBH7Snc7e9y2pc5uAzc
	 hD7R7SXvF6oSXhqAOc1H6/dmzmWdQaF2rJAIsOWb4ZdBSChA5P9BJlCwsXgBf97YhL6d7
	 CiNsCYXNNJTN8bQWRT/h1CTrPIcSIS0n6kxgiVBPNtd47ugxxpIutwvaODanE07yKvwQ2
	 tkssvaZn4YJ0Prfl/TEZDSdVcDIdNOZXypzNWZ1OqegpYHa2THkIWzkkcVsSTyr77SNNP
	 KaH+HG2YMc7/6E7zSz7lhNBdZT3Gh8h+38f7T/FfGPWI3hUHgjdmzbpxiUTQPHlaeHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e9nH0sLP;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66886074E15
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 16:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E66886074E15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e9nH0sLP
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b29df78132so401823c88.1
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 08:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588157; x=1795192957; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Me5yfIzDRGI7/xvPxV35hthDkGXlSHz/rORd9jtaqKo=;
        b=e9nH0sLPXwnHCzRCycJvio4u2gswo3bcNVyLvfXg2g/leLY/2AwWFrFdU+pGpKUtjN
         zwQViRH12C4R3NHPIX2KvG6DwM2W0lXiWyN8MlTV+PVijuuJVNAa09reaWybcnkWNpyc
         fM3F49v9VcoU9MnKYTdsq2tL7hN0Z83FwZSMWCmTkEOjaDxAqpMCgp2PbI/UDRkrl5dN
         Q09qfE/ChJGbaBfoxPwLl4mwl6dNg7toenpbGnKJPNhH0r685bAgVpV9Ue1aClu6iMwn
         qmuUparBARlhpdtY98LGWCOiwgERogKs8Tcl6Az+74QY+mXqhjKpdlBARbRVXR3f8P2M
         OvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588157; x=1795192957;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Me5yfIzDRGI7/xvPxV35hthDkGXlSHz/rORd9jtaqKo=;
        b=A3WPJn1EQL9dxRv973LBXou7CMIB207Ut8C+oWKN4jZ4MqbiSMrPkWEw61xCcw+R09
         tVEqFgKKLa1TScZMAC/F5VLIq1XX4JwTld528sUXppBMTPGcdFjjm9/+AtRvdcjyIug1
         x7/cKyNjJWYCt3ZoY/oIDOai5i/6IItX9h9JvIzZghMJ7RJKmzNmyqQT219eTd9W2Om5
         9ptDa+x4mYUmg/DCyEyk5QxZazAisig72wD5W2wqtXGU647iJ9V9mcOkD320WKRcXNRE
         XNv3S30HBgUp3iulHQGiTnwnmSfthGxjprrB4O+XsFhbWV6/+mzG5YhNVAyErSCOKIl5
         4p6g==
X-Forwarded-Encrypted: i=1; AL+hErFzEZMv2kHCLhkOoCYe+W4XcLaEPa6gY1HKZ3Wgtza9B2zWsZ3tKvjwDDZ+Lpq8PPXms9Sg@lists.linux.dev
X-Gm-Message-State: APuU4Z+nOTbXG7X9Ca0u8h9zv6dYpl3hWlS33vRFIlFsPuUf98akaMaf
	3aZMw+BcxSbUYZ2FqrQjOwi5ohni69joVpUccARSeRBPQNrOf234jOvYiuchgJPcrA3KvE4Tk9t
	dEacXQr3lYg==
X-Received: from dlbuy12.prod.google.com ([2002:a05:7022:1e0c:b0:1b0:166c:6a91])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4508:20b0:163:c5eb:d42f
 with SMTP id a92af1059eb24-1b503060401mr2912951c88.5.1794588156804; Fri, 13
 Nov 2026 08:42:36 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:49 -0800
In-Reply-To: <20261113164152.2095566-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113164152.2095566-19-irogers@google.com>
Subject: [PATCH v13 18/21] perf env: Add __guarded_by and __must_hold annotations
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
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

