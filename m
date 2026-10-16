Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0F744F55D
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 22:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189110; cv=none; b=UZHSy45WZ9RnU2bWECG74jt5ItAR2cvQ65DBPkJu5AUGTzq/xPSuHUbUntUcQ9cTtcsHTDG6rYRBozEiSEVzCWOwemwlf0Squloqftn+hRizMO+s0xOn1KGvg7BYUL6zhKHN5tswJ0XRbpftNyJ5TsVM1+9RILq79QurJ+HE0Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189110; c=relaxed/simple;
	bh=XzWZHONgT/0d/n03HpxSQAnMoK9ViAwbiRR7AIBlFK8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rQjwVInSDou3c8z9SLwYS3TrO+WMk4RN7c25JsI+GFZCYVP1yMeSRo33+OwYGiwUidLL2oU/59PDYZj/GwLDmqu4801eDAt7KxHS+/2FJW3NBafYNQQ5dy6iY0mxX5k+L8+3Ll9YBFZfhFRrRQ40mHQuEqDcnbMLtz0e7pC7hjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MEFKaEll; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MEFKaEll"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so439989eec.0
        for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 15:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792189108; x=1792793908; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IktZ7k0WQQGq+h8FFQr2kKvApPwIP2MyLekNCFtbtTo=;
        b=MEFKaEll/BUPoELUzYJephPQVojpz3OCp/8E8DGxARlff9JulzJ1wcLliiyQywdJEz
         Qo97plznQzMAtxAAXBDaY/Ab0Z6jFoXLhUm73pJiC3Y4ia6Yq5xzhiTHZXeXDIzYeueO
         jMcNxXJHHtTDemJ2NGs7wquaGTfC/1eVbuPVGYQZdJGBnb6NmQIWfntE0PV2hHZ+flrM
         RB4Xie3Is/U3Jtmg4d/pZtvyAlGUzrVDzwI4bEKMVZTVSnTSlNjZNlnZJdLue4U4vYdn
         FYojFy8CEuYuzzaKmOYqvpWKZMdZmm/HyG84t61qVRVFa2kpBHOuE4jJlKyDaeq3of/r
         SUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189108; x=1792793908;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IktZ7k0WQQGq+h8FFQr2kKvApPwIP2MyLekNCFtbtTo=;
        b=G6TgK30fUh26AARtX6U+Gdi5aL/10znFO2ydLW/+39QJOBwtg6NnX+OveFwGQjINwb
         94OfonSrMTzIgFaaaUFwrDzQkVETO/8syd2+Jt7Dl1Oa4gS2/K6RXG4/4LCWMvTtsCYA
         /Q7DR8ULqfDChayHIixmvegvLBx2FfFcCOlhcvjZzhMiBn3/+Bier/YeU0yH4YHg9Tsz
         QJpqnJagP2cjyrFP7fyj3laL0D2IO0svcbIUf2qU2Snqb1qQ+ejusCAIo9k9+msHrJBR
         bfTpwC3uLwSf6sAipjqCvAQQZ72xCFb5qNwbWabu3uIgvrU3Ec367j4vOs8Xs9ziBNI4
         /VYg==
X-Forwarded-Encrypted: i=1; AKwUvBxxd4Bk89YTIzGjKjq53IHeeJLFaNOhTDDJpgcrqh1wJtWRFaeQp4H15Pspk9NUMZ8zQCKy@lists.linux.dev
X-Gm-Message-State: AFq9FYJ8nuIiRe5NYi1a18zKaTRxIUBccBZfgH6ykU1t97aM2csYR+OT
	RBpcbP4KfgtpGwe1tEDMbN7jA+k/grwri9vH+tLyPE6zvCPe0i2OLLU/JtIrFMq2oZao9s8hoSG
	Z75roBSOXPg==
X-Received: from dyu6.prod.google.com ([2002:a05:693c:8106:b0:359:b917:f2cf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:6395:10b0:35e:60ca:81e9
 with SMTP id 5a478bee46e88-361a1f53a9emr1593056eec.21.1792189107879; Fri, 16
 Oct 2026 15:18:27 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:16:50 -0700
In-Reply-To: <20261016221700.1282659-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261016173106.679725-1-irogers@google.com> <20261016221700.1282659-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016221700.1282659-8-irogers@google.com>
Subject: [PATCH v4 07/17] perf vdso: Fix unlocked __dsos__add() and race in __machine__addnew_vdso()
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

