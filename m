Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC88582BA8
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 17:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171900; cv=none; b=bSxF8yMiGnub0X8V/BI7FuJSJJuupAEkiRBmQnmdGpBJc7nFVyK9uTrfTopSHUNjBmEfjRajk1bsxWcetbAOtZFeJJDp/FmqXacB6/yjVq3gLJP3/a+3PeEAuB2RlCeJkT65S1Yo1CPv5/wA+Pd6UeJN5pmadMQSuEUl8HV1w4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171900; c=relaxed/simple;
	bh=XzWZHONgT/0d/n03HpxSQAnMoK9ViAwbiRR7AIBlFK8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f3mSqKSfwNgTjij05qBnHZ2ZTbzwJzc3I5aKIr8oQW6poUrycibJN1k48YrrMdf6sgibA0B7nhhGvTHDBC27+DPckJ/qH53+WNbaFCfK/BrdG7EV8R4BbSuP672rVF8Lgv8EWGLfvZlRaZ9ydXmTBhYD1NecqKn6spMPUppagXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mfLdzO1P; arc=none smtp.client-ip=74.125.82.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mfLdzO1P"
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so173584eec.1
        for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 10:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792171896; x=1792776696; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IktZ7k0WQQGq+h8FFQr2kKvApPwIP2MyLekNCFtbtTo=;
        b=mfLdzO1PaUJkA5fHKHB61PrkScKk5XvVUHVKTUo+CIh55Hj5LFradbnaSLdhqP34Uh
         /eWpENNdsCn2S3Yl0Of/SC6xSvjBjK5MsVjlx9xArsOjxA4M9qmkRGD52LYzSeRhrodj
         ai9xxhedRhAx1SOOJAl4mRF+o8h9yMs4svTO2vKCMdQTsyhnNHE8GDKk5z+D7tjgoYf0
         KVhXblqkyc8sr/BqMfP731WO92dBNiek7EBVfhZK7RE59wNywLLgkkUyVBDusT10kRez
         BvTDagdpZfixohAA0Qs68U6Y2wiAPTYLJPqRto7E7iN9UUDN+2FKzEpClNyQun8teX2n
         A6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171896; x=1792776696;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IktZ7k0WQQGq+h8FFQr2kKvApPwIP2MyLekNCFtbtTo=;
        b=ehyw5rizL03Y6lY4LOM5+nLmHtUUSpUaHfeFoVa/R8yCIFPMTL6gOHizY+9qf7G+3K
         UzPeMG5HUmOIRNyb7NmMs1dHg1uK6HykncBKWUqBQme1x8engSOPthYENE9lWpw0AAfa
         4iKQapJXreJQKm7ueqzOJ1vpVcgyFwOguKPUqbHTkXh+IF5am13V0uJKXpD287kraYr7
         QvEy9yg/rqgIk06n8BMOPxUyV+ESquV6nYf6W0JnahuWQKo4cfbOVwEGTskvDON31Oj/
         X6hpGKLdpbzbbw0pIRA06i7NLdPGAXcz5AEDijF1i6kznVeF5wblxgcCjvz97EtzKO/F
         rvRA==
X-Forwarded-Encrypted: i=1; AKwUvBx7s4x+tYtgfvmgYblezmguMa9rcrvYZAFbNL+Nn1MaGQc3sYOBd1FjugFWzfRyciZNH/lZ@lists.linux.dev
X-Gm-Message-State: AFq9FYLJ4IZ5sIsGHdt5q9DoS010lfvQIltiBWhoPgCUOCX/6fdtgR/X
	fl7cTYReiM9225rP/sthWEvZdtXX/J4WbY3Q0/2uaamLARW5gjXXtTb0nnl+R2wr30mkYtc0nlU
	VascB3Paepw==
X-Received: from dycnb1.prod.google.com ([2002:a05:7301:b01:b0:352:94e:a8c9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:de4c:b0:358:eccb:af79
 with SMTP id 5a478bee46e88-361a253ea3fmr458759eec.34.1792171895606; Fri, 16
 Oct 2026 10:31:35 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:30:56 -0700
In-Reply-To: <20261016173106.679725-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013222622.1822619-1-irogers@google.com> <20261016173106.679725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016173106.679725-8-irogers@google.com>
Subject: [PATCH v3 07/17] perf vdso: Fix unlocked __dsos__add() and race in __machine__addnew_vdso()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

__machine__addnew_vdso() called __dsos__add(&machine->dsos, dso) without
holding machine->dsos.lock. Acquire machine->dsos.lock in write mode,
double-check __dsos__find() to avoid inserting duplicate VDSO entries
when racing with another thread, and set the long name before calling
__dsos__add() so it does not attempt to re-acquire machine->dsos.lock.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dsos.c |  7 ++++++-
 tools/perf/util/dsos.h |  1 +
 tools/perf/util/vdso.c | 17 +++++++++++++++--
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index a2cd37bd1660..40267d3a725d 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -284,12 +284,17 @@ static struct dso *__dsos__find_id(struct dsos *dsos, const char *name, const st
 	return res;
 }
 
+struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked)
+{
+	return __dsos__find_id(dsos, name, &dso_id_empty, cmp_short, write_locked);
+}
+
 struct dso *dsos__find(struct dsos *dsos, const char *name, bool cmp_short)
 {
 	struct dso *res;
 
 	down_read(&dsos->lock);
-	res = __dsos__find_id(dsos, name, &dso_id_empty, cmp_short, /*write_locked=*/false);
+	res = __dsos__find(dsos, name, cmp_short, /*write_locked=*/false);
 	up_read(&dsos->lock);
 	return res;
 }
diff --git a/tools/perf/util/dsos.h b/tools/perf/util/dsos.h
index a26774950866..857a79fd8805 100644
--- a/tools/perf/util/dsos.h
+++ b/tools/perf/util/dsos.h
@@ -30,6 +30,7 @@ void dsos__exit(struct dsos *dsos);
 
 int __dsos__add(struct dsos *dsos, struct dso *dso);
 int dsos__add(struct dsos *dsos, struct dso *dso);
+struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked);
 struct dso *dsos__find(struct dsos *dsos, const char *name, bool cmp_short);
 
 struct dso *dsos__findnew_id(struct dsos *dsos, const char *name, const struct dso_id *id);
diff --git a/tools/perf/util/vdso.c b/tools/perf/util/vdso.c
index c12f5d8c4bf6..dca4f683be9b 100644
--- a/tools/perf/util/vdso.c
+++ b/tools/perf/util/vdso.c
@@ -127,13 +127,26 @@ void machine__exit_vdso(struct machine *machine)
 static struct dso *__machine__addnew_vdso(struct machine *machine, const char *short_name,
 					  const char *long_name)
 {
-	struct dso *dso;
+	struct dso *dso, *existing;
+
+	down_write(&machine->dsos.lock);
+	existing = __dsos__find(&machine->dsos, short_name, true, /*write_locked=*/true);
+	if (existing) {
+		up_write(&machine->dsos.lock);
+		return existing;
+	}
 
 	dso = dso__new(short_name);
 	if (dso != NULL) {
-		__dsos__add(&machine->dsos, dso);
+		/*
+		 * Set the long name before adding to machine->dsos so that
+		 * __dsos__add() inserts it in sorted order without needing to
+		 * re-take machine->dsos.lock.
+		 */
 		dso__set_long_name(dso, long_name, false);
+		__dsos__add(&machine->dsos, dso);
 	}
+	up_write(&machine->dsos.lock);
 
 	return dso;
 }
-- 
2.56.0.212.g129ede20d9-goog

