Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244355;
	b=IvSz+gBQ1hhwINdaFykbVUCvsbMit/8J0wmKKJ4M5xkmuWgbj03d4vj4KazoCgH0EcMG
	 3gPyID5k91AGF7B9M/RxYftmNo4+f63CW7tf+3bZ3ERJqRk6ha/I4HkHA2U8DACxa1ogs
	 bqA13kgMOMC5FYjSahc0ZoVZCkxxrexzDMefp+A91sX09PdrL2VlGeGQfimBRe0M74lZC
	 CCNmDnrF1+ejwPsEAXQPG+o1FucKHGV+RBzxsEwh81l0FDyNFyl/PSjL4BbzXBGbinlIH
	 nv1YnpPH6S7buBG3slPl9lYcaJ8Ez0FoZ1s1RMqQLQdG3ENrTmisdnvnvUqK3YhXW9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=eypqNFLgLpXUHRcqXnjliravXE92Pjb7dAJMkh1LWac=;
	b=sa/gREAfRGGWonwmdbYCcJbN8FIhCFsOXdkxRk3SPoeBNT4oZt1SFWvy8rlSHeq73sdD
	 ZRsWpXhdACz6V9xmK5YUDyGJh2eGrEvQYX+CmF8284THXhnNNu2AqAi/1DNWI9HvCEVA3
	 jBLOcu6V6xxLPV+i6bN6HBvYII+9uPLreBxQkmkEkKK1i+wgegnH8VWUrtLYwOaKtajQj
	 4xKLHl3e/WH3/3KxdQNkHeaeSP8eJ0nATzJvVV3syrV2mkeh05O6Kby8aVavtYLC/gV+K
	 cGUtybIZed+shIi3oWzKaLFxerUdY+XrkSK+/O7bYVTFfFJSW6I0+PZkveEEV9JMopQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aTTJzfEH;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DED4606A33F
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 06:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DED4606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aTTJzfEH
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b41b099809so1645466a91.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 22:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244354; x=1795849154; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eypqNFLgLpXUHRcqXnjliravXE92Pjb7dAJMkh1LWac=;
        b=aTTJzfEHSJBOW2oApYNs+7nbsTL4wdO+E11anXte7b2QALN0CUIPQwPTzVRW+QnThI
         oiN9Zb04cuPKzOYBqhFgtl+lcOrCANrIcnieM+QScrSpvW0U/XdBAKgmJuqdhZDntq31
         F/iwsKcCwhm+2tJ8bTV4hwoALSpBSOYbzKrCFpOjgHqFT+2OX9LGncmn969fjYVgGSHw
         NZ9PLu8N0FdPsMkkOuIGXOT1+HGAnwbZu9WBv6SodjuWoWU1+Mmj4wZtYYaH/GPIW0fd
         Gc76Zc0aiDwpr6ARQ5hnNwZ8K6+U/xr3xarTdMnsMMZvu0BWd10VrGWyEFp2Plf+GonE
         DoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244354; x=1795849154;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eypqNFLgLpXUHRcqXnjliravXE92Pjb7dAJMkh1LWac=;
        b=2IULKz5NST6gPbQd02g0/nR1WJotzL2x93Yyvyx18kdr02zd9/qLwUYF5th6uCXZ0g
         gdkVQIACBwUPEzZkS3tDplRiUqljjslf2o0QUbvHVc0jyp4Ti6amoEeBI36s+YrexXmQ
         3QJh3l/5hp50GGgXaGphbCCa8BT9h6DAmfHIxBQW8UVP7WvHQrgpHqa+9/DEivWhpctV
         BeNpruSz+OMBtwypwInpJq9bi/crgpZ4kgVpco/1pMtsv9+uDhsNRcwSLFG5khFAtPjK
         LVLUF+ZIvpmXf+kKclEmnuxowHHh5DfKAmQMq7bHyKRpg3avaDKu9cKowz2mR38IvTGM
         WYeQ==
X-Forwarded-Encrypted: i=1; AL+hErE2npgEU0N6NixJoMG0NWdunNrwbtIcnH+x+Sg1rNArBSpjY1ngz/0WZ8CnFPaj0wT8FjIR@lists.linux.dev
X-Gm-Message-State: APuU4Z+7eZU8urP88CP1TVbTV5UEOev5wZDUOgVcQD/y3jnf3jCvOnwJ
	NE+Haf8C3WdLyYftxBb/kKA9IcEJ7J+dcGw1mtmVIqfK9EUleLMl/3XBTIom9d9ZNntV2j6CiNZ
	1iXpLm4tN6g==
X-Received: from pjbrm1.prod.google.com ([2002:a17:90b:3ec1:b0:3b3:f9ba:d0b5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4483:b0:3ac:bc3d:6fe8
 with SMTP id 98e67ed59e1d1-3b41c92f8f9mr4652569a91.34.1795244354221; Fri, 20
 Nov 2026 22:59:14 -0800 (PST)
Date: Fri, 20 Nov 2026 22:58:01 -0800
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
Message-ID: <20261121065813.4143649-13-irogers@google.com>
Subject: [PATCH v15 12/23] perf dsos: Use read lock fast path in dsos__findnew_id()
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

In dsos__findnew_id(), try finding the DSO under the read lock first and
only acquire the write lock when a new DSO must be inserted or an
existing DSO needs its ID updated (checked via dso__needs_improve_id()).
Prioritize build IDs over inode fields in dso__needs_improve_id() and
__dso__improve_id() so an existing DSO with a defined build ID is not
updated with inode metadata.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c  | 45 +++++++++++++++++++++++++++++-------------
 tools/perf/util/dso.h  |  1 +
 tools/perf/util/dsos.c | 10 ++++++++++
 3 files changed, 42 insertions(+), 14 deletions(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 5be5d224b246..1c938d1b11e9 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1685,6 +1685,20 @@ const struct dso_id dso_id_empty = {
 	}
 };
 
+bool dso__needs_improve_id(const struct dso *dso, const struct dso_id *id)
+{
+	const struct dso_id *dso_id = dso__id_const(dso);
+
+	if (!id || build_id__is_defined(&dso_id->build_id))
+		return false;
+
+	if (build_id__is_defined(&id->build_id))
+		return true;
+
+	return (id->mmap2_valid && !dso_id->mmap2_valid) ||
+	       (id->mmap2_ino_generation_valid && !dso_id->mmap2_ino_generation_valid);
+}
+
 void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 {
 	struct dsos *dsos = dso__dsos(dso);
@@ -1692,22 +1706,25 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 	bool changed = false;
 
 	/* dsos write lock held by caller. */
+	if (!id || build_id__is_defined(&dso_id->build_id))
+		return;
 
-	if (id->mmap2_valid && !dso_id->mmap2_valid) {
-		dso_id->maj = id->maj;
-		dso_id->min = id->min;
-		dso_id->ino = id->ino;
-		dso_id->mmap2_valid = true;
-		changed = true;
-	}
-	if (id->mmap2_ino_generation_valid && !dso_id->mmap2_ino_generation_valid) {
-		dso_id->ino_generation = id->ino_generation;
-		dso_id->mmap2_ino_generation_valid = true;
-		changed = true;
-	}
-	if (build_id__is_defined(&id->build_id) && !build_id__is_defined(&dso_id->build_id)) {
+	if (build_id__is_defined(&id->build_id)) {
 		dso_id->build_id = id->build_id;
 		changed = true;
+	} else {
+		if (id->mmap2_valid && !dso_id->mmap2_valid) {
+			dso_id->maj = id->maj;
+			dso_id->min = id->min;
+			dso_id->ino = id->ino;
+			dso_id->mmap2_valid = true;
+			changed = true;
+		}
+		if (id->mmap2_ino_generation_valid && !dso_id->mmap2_ino_generation_valid) {
+			dso_id->ino_generation = id->ino_generation;
+			dso_id->mmap2_ino_generation_valid = true;
+			changed = true;
+		}
 	}
 	if (changed && dsos)
 		dsos->sorted = false;
@@ -1715,7 +1732,7 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 
 int dso_id__cmp(const struct dso_id *a, const struct dso_id *b)
 {
-	if (a == &dso_id_empty || b == &dso_id_empty) {
+	if (!a || !b || a == &dso_id_empty || b == &dso_id_empty) {
 		/* There is no valid data to compare so the comparison always returns identical. */
 		return 0;
 	}
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index e8cd13c101a6..bb887d10a9ee 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -802,6 +802,7 @@ void dso__delete(struct dso *dso);
 int dso__cmp_id(struct dso *a, struct dso *b);
 void dso__set_short_name(struct dso *dso, const char *name, bool name_allocated);
 void dso__set_long_name(struct dso *dso, const char *name, bool name_allocated);
+bool dso__needs_improve_id(const struct dso *dso, const struct dso_id *id);
 void __dso__improve_id(struct dso *dso, const struct dso_id *id);
 
 int dso__name_len(const struct dso *dso);
diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index a7f6a98acbaf..4ff38cb5e2cb 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -349,6 +349,16 @@ static struct dso *__dsos__findnew_id(struct dsos *dsos, const char *name, const
 struct dso *dsos__findnew_id(struct dsos *dsos, const char *name, const struct dso_id *id)
 {
 	struct dso *dso;
+
+	down_read(&dsos->lock);
+	dso = __dsos__find_id(dsos, name, id, false, /*write_locked=*/false);
+	if (dso && !dso__needs_improve_id(dso, id)) {
+		up_read(&dsos->lock);
+		return dso;
+	}
+	up_read(&dsos->lock);
+	dso__put(dso);
+
 	down_write(&dsos->lock);
 	dso = __dsos__findnew_id(dsos, name, id);
 	up_write(&dsos->lock);
-- 
2.56.1.750.gf70dc682cf-goog

