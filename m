Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941363;
	b=a+N/mAJaLShebXFGl7b4YoSLpJqrMUvva43cABPCVHCwCf6GEt7e0Yxgz5HXV4DyFe01
	 z/UARcEqdApslhTTtBRwyzLN5TlE+ob+CwvA5Mz+6Ahl3T8Xu/FVBucAyBr6VQ74b9cre
	 I/S+brsgXoPpl1BhJNcJpRY6eB+7r3S/o09XR2nSNpaXX8yWNnFyK6n67aWj309q1xY/7
	 UcbiE956mqaplYtHE2nYjBrUs+BSyZgL3WCjkKGnGsMQ8a5UYNP3gCHuPVfszqFN9SNNL
	 YFl38/POmVD+ozfD63wHJG0cS7O/pA6MPLktPa7hJMXodAU/MocgTm+uTy/lqCcoIZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=hgRklfDHPH2ZDGZe1scZDClSfV3P8wPVDqeqp2cvAD0=;
	b=urz+3Ps/3Jo8gwZMzd06Qq0nrLIqlmumiOFybPU9toFoQpCVl5SyQqckXoSjq0UZ3acU
	 stq1Mwzjxh68SO3G2ZSNH2fC3I00EmLUbVyA+1aV+ygKuOalLoXbTHZRUmNCGQRFtv9ub
	 POgz+C9vunviK7wqZ3nzl6KmLkK3G72BDD2pSQHKoorrSMShqK8VRY1N2Ta0O9oNSpxdh
	 JMF980JWJEu/TOLi7hsTzlc90H8QioetsUoBMmhevYTX2vsNP2OjEMq8U2okoaQ6Puagg
	 MpN8Wu33/kMdAnFr4g3kVmbRy5OnV2CLEoO+Z7T6PtzJyVK+lYgPLWXM3hnhNJK1oQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dIqnTcX+;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0874606A885
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 18:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0874606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dIqnTcX+
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso269523eec.0
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 10:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794941362; x=1795546162; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hgRklfDHPH2ZDGZe1scZDClSfV3P8wPVDqeqp2cvAD0=;
        b=dIqnTcX+49R1VPTV5fIV4K7weVP/LKIy+H5uE1zjbz5aHkjp6CTIKChVgCUKgyt8MP
         DZnUE7YBsQXi/7xz9NM3nN9XVgLLNt+H7PHK6vIs8ckdPe3HmUapjOh4HkQOgZWdpxj4
         4MYzfvM/C3Z40SPfFzkkEjP8jc4wcodCHJBq+A0gMf5x3MeB+6aHQujWbEpsVoTvNTGB
         VYmULJcqvSiK9UYhJvUCgoKkMbx/6owC85qGzXj2KhB2DuwGiKsW5pFKpV87NoBxQLNg
         LZbLaD/sp2OsgbSMbV5pjFe5TDifdNS9/w7ER0b8krVcfxFK2GMNhq/wKaIvhijgELiq
         YIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941362; x=1795546162;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgRklfDHPH2ZDGZe1scZDClSfV3P8wPVDqeqp2cvAD0=;
        b=j5l6CAppkCkbuWbcncFrCXbwG1TZEYNThHwyaaP0+u/GSsULuY3MN4YqH0YHpPoKU2
         5ltwwB0oX4s3BTY/OTIqmWp+K29fmZ3V8HPczzVGmdreYPQCnvvh4b4lcFAGiLKsPvQj
         eGYEiOV3YlvwrQesBEvPw+c3i+Bi9+8P6PC8EEMhO6DkJ1PKSYCUEkdrx2Tb+BEX+zmR
         xumGnh1iI3oI1WXYYj+OlmIpeua/J9+OCMXFc96jv0XSz19wnz7xFY33OH5aeKnIa31R
         7agoHpvFj58xI4v/wKuZ/LgrpSFW0QfA2QG6gwLsVb8xcCxOaiFa7IaOF73Vbps4+DFc
         S3aw==
X-Forwarded-Encrypted: i=1; AL+hErGqNIQrQEDYhvE7nf5XhHAEplFWy/qFGSJcITSW+w6w/TN7ChcSUmvIMA15XYiCXAbiAo5Q@lists.linux.dev
X-Gm-Message-State: APuU4Z8nsV3sRd/cxrK84yC/XVWB8use8sh1Ed1LF65ZK7gFA02yD2Eg
	skcOKXXNhOPhey9ytxPv1TcMj99GO8ITOm5YPpodNpddT6zX0rn8Qt/Vagst59qyr7HAIvgLvxe
	imQGz8TrbRA==
X-Received: from dlar5.prod.google.com ([2002:a05:701b:21c5:b0:195:d59a:94bc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea46:20b0:15e:9126:c60f
 with SMTP id a92af1059eb24-1b543cf2943mr399741c88.29.1794941361787; Tue, 17
 Nov 2026 10:49:21 -0800 (PST)
Date: Tue, 17 Nov 2026 10:48:30 -0800
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
Message-ID: <20261117184844.99889-10-irogers@google.com>
Subject: [PATCH v14 09/23] perf dsos: Ensure DSOs in auxtrace, machine, and
 symbol are in dsos
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Place the DSOs created in addr_filter__resolve_syms(),
machine__process_ksymbol_register(), and maps__split_kallsyms() into a
dsos collection so that all DSOs that may have data fds opened or be
referenced by maps belong to a dsos collection.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/auxtrace.c | 16 +++++++++++++---
 tools/perf/util/machine.c  |  4 ++++
 tools/perf/util/symbol.c   |  4 ++++
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 8bb491d389a2..1451de019df0 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -29,6 +29,7 @@
 #include "config.h"
 #include "evlist.h"
 #include "dso.h"
+#include "dsos.h"
 #include "map.h"
 #include "pmu.h"
 #include "evsel.h"
@@ -2684,7 +2685,7 @@ static int addr_filter__resolve_kernel_syms(struct addr_filter *filt)
 	return 0;
 }
 
-static struct dso *load_dso(const char *name)
+static struct dso *load_dso(const char *name, struct dsos *dsos)
 {
 	struct map *map;
 	struct dso *dso;
@@ -2693,6 +2694,11 @@ static struct dso *load_dso(const char *name)
 	if (!map)
 		return NULL;
 
+	if (dsos__add(dsos, map__dso(map))) {
+		map__put(map);
+		return NULL;
+	}
+
 	if (map__load(map) < 0)
 		pr_err("File '%s' not found or has no symbols.\n", name);
 
@@ -2794,6 +2800,7 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 {
 	u64 start, size;
 	struct dso *dso;
+	struct dsos dsos;
 	int err = 0;
 
 	if (!filt->sym_from && !filt->sym_to)
@@ -2802,9 +2809,11 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 	if (!filt->filename)
 		return addr_filter__resolve_kernel_syms(filt);
 
-	dso = load_dso(filt->filename);
+	dsos__init(&dsos);
+	dso = load_dso(filt->filename, &dsos);
 	if (!dso) {
 		pr_err("Failed to load symbols from: %s\n", filt->filename);
+		dsos__exit(&dsos);
 		return -EINVAL;
 	}
 
@@ -2831,13 +2840,14 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 
 		err = check_end_after_start(filt, start, size);
 		if (err)
-			return err;
+			goto put_dso;
 
 		filt->size = start + size - filt->addr;
 	}
 
 put_dso:
 	dso__put(dso);
+	dsos__exit(&dsos);
 
 	return err;
 }
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 4a3461d79593..02711995f0b6 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -797,6 +797,10 @@ static int machine__process_ksymbol_register(struct machine *machine,
 			dso__set_long_name(dso, "", false);
 		}
 
+		err = dsos__add(&machine->dsos, dso);
+		if (err)
+			goto out;
+
 		map__set_start(map, event->ksymbol.addr);
 		map__set_end(map, map__start(map) + event->ksymbol.len);
 		err = maps__fixup_overlap_and_insert(machine__kernel_maps(machine), map);
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index dc70bbe8514f..a7079381fae1 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -1090,6 +1090,10 @@ static int maps__split_kallsyms(struct maps *kmaps, struct dso *dso, u64 delta,
 				dso__set_symtab_type(ndso, DSO_BINARY_TYPE__KALLSYMS);
 			}
 			dso__set_loaded(ndso);
+			if (dsos__add(&machine->dsos, ndso)) {
+				dso__put(ndso);
+				return -1;
+			}
 
 			curr_map = map__new2(pos->start, ndso);
 			if (curr_map == NULL) {
-- 
2.56.1.703.gf848ed807c-goog

