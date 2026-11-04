Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825985;
	b=T+l44jIF6NQZNcZ0DpwFGisTzKUozjU86NkNmGxp/0bA5HyPcLXrqrEn/A9qNuPhtZF5
	 xQ61QkRyQ8VbDXrLqqPmksEuVnijXoHQ/5BWL9vLXNILu4JvXh9o5CY8wSUEwamCXwHCn
	 p4hGCmg/u4sz/HuxIVYn+jmjxw5clBe7OkIs8j+dDkBQ0fcJVfmHBM0nPbKhrbWG5TdIN
	 11M5GwJlDioQf2Iix645tdeDjBnK0Nn9xL/bL4cfI2xhD9TWVWwPRJ8COv8iZHurLbcXv
	 +/l84yNfsY+DC0nsHLjA3pgbkRBQcn/RT7uEGFkuh5uyoavsSmQhI0HFuwCpzw4/Yjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
	b=ErGmXeq2QZpeR6XJKl/FvReYJg9u2ZKupI8ALMfQnhOVKobI6e+P/eH70lJcYGhuGyBC
	 kOBZwE5AS6d9aCogl9B5KTvPzesd1+qMGvsJ6gr8VahAw2lL7b5fP45BVo1giQQOLyD15
	 YGkMXPruT7bMJIqOf9zlmB1DvTglNcV7LMVtMxNTPtQVQUKditnUnOpJ4yAVce8sqrkTg
	 Ase+wjV1+R0rQGo6HZcOKHYvMY1mLfSICZW8GQXBcxjNBllsWCCbZPneda+Z4yyFKRGab
	 JmmXgLshKfjg1AW6PS7pXHTiYau4CoYUGtoX5U28IM3IzTXPbTo8Q1G0kcWhzLulsww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EIHXHZlC;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE0160E4821
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 20:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE0160E4821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EIHXHZlC
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33713e5e6daso1248473eec.0
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 12:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825985; x=1794430785; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
        b=EIHXHZlCDnHo7XOsjkgS+b7OA6EeP+xkNCpza3VpmSxmeai8eWBqlanFKLpXuRAExT
         jp6dIF05VJYb8CW5mi6LrGE+Na3ny4HDPz1LL992boMAvqA52/1sLuj7a+F0vnzreydJ
         D/xK9OVKDlRacpCLyQq1kQpqvySlS43S1hh5c7XyJWoLwGYpaG92WBK5rFdppBE/Yec3
         cH5FJ68/0+4BR2nFt9wIOaOO73Aaqm8uI+zQ1B7u4o70I0J3AIXHoxXp9iywIfdI8dhD
         34aqkenuV0Er5a0j/bf0bQYBfamM9N/KQg8Jz6AoCUibn18FVDzShWNR5Hltf3Dyex5k
         qrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825985; x=1794430785;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
        b=EYDq9yZe2F2KNDxcc5gKUx4vM/DgF7YRJ32a3KptM24zz1bdkrJtEixpBKnC3kA7X5
         Hf1YfuHDGwxIWpnfgjvgoyB3nv4PydkfKIwm6Qnv2R8k1W0Dw60oAfVx+WtJPh/XM56R
         +ewRiO8+MNAPsru+oJUQapThY1VZ/Jyg2EaQlUQmSv+ymWhbHsPS9p9NpRjWXb1YR/SU
         7EO9PClFU18qRVsQHzHwOCJNNA8a0nva9FTq4tGhSjugndu9mv0IpmpOhMd/MzvXWr8X
         3JCCd2mXnpu2d8FJ8385VQ6yJLEvU7tHoxt04rICjfsvAkRfVEWUz1LFjn7s+tTARVxY
         TnXQ==
X-Forwarded-Encrypted: i=1; AKwUvByz5ZY6vPEcW9KaNQ5vejS19p3Nyte0IwP4jgH84wMLPxBfslipyvFRK9Pzy7xgLKm8fH3F@lists.linux.dev
X-Gm-Message-State: APuU4Z/L5SbpSFflhGRG9Y1wg6Kzjk1CKw1QAbMS2qVA2RD7LOy+ghzO
	q39JyOpnGYNagMadyKQeise5OqtrNBO5GtHI102RVoMVkuNzI9FJtKNFa8v1mbn40HBQ5oAlZcu
	NhL5k4vKVDw==
X-Received: from dyblj29.prod.google.com ([2002:a05:7301:111d:b0:36c:9ca8:5abe])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:7306:b0:369:38e3:5363
 with SMTP id 5a478bee46e88-36a4234586bmr23137344eec.7.1793825984405; Wed, 04
 Nov 2026 12:59:44 -0800 (PST)
Date: Wed,  4 Nov 2026 12:59:02 -0800
In-Reply-To: <20261104205909.2078411-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261104205909.2078411-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104205909.2078411-13-irogers@google.com>
Subject: [PATCH v9 12/19] perf dsos: Use read lock fast path in dsos__findnew_id()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In dsos__findnew_id(), try finding the DSO under the read lock first and
only acquire the write lock when a new DSO must be inserted or an
existing DSO needs its ID updated (checked via dso__needs_improve_id()).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c  | 16 +++++++++++++++-
 tools/perf/util/dso.h  |  1 +
 tools/perf/util/dsos.c | 10 ++++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index f0e02062c09c..4dc518f7cb7d 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1685,6 +1685,18 @@ const struct dso_id dso_id_empty = {
 	}
 };
 
+bool dso__needs_improve_id(const struct dso *dso, const struct dso_id *id)
+{
+	const struct dso_id *dso_id = dso__id_const(dso);
+
+	if (!id)
+		return false;
+
+	return (id->mmap2_valid && !dso_id->mmap2_valid) ||
+	       (id->mmap2_ino_generation_valid && !dso_id->mmap2_ino_generation_valid) ||
+	       (build_id__is_defined(&id->build_id) && !build_id__is_defined(&dso_id->build_id));
+}
+
 void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 {
 	struct dsos *dsos = dso__dsos(dso);
@@ -1692,6 +1704,8 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 	bool changed = false;
 
 	/* dsos write lock held by caller. */
+	if (!id)
+		return;
 
 	if (id->mmap2_valid && !dso_id->mmap2_valid) {
 		dso_id->maj = id->maj;
@@ -1715,7 +1729,7 @@ void __dso__improve_id(struct dso *dso, const struct dso_id *id)
 
 int dso_id__cmp(const struct dso_id *a, const struct dso_id *b)
 {
-	if (a == &dso_id_empty || b == &dso_id_empty) {
+	if (!a || !b || a == &dso_id_empty || b == &dso_id_empty) {
 		/* There is no valid data to compare so the comparison always returns identical. */
 		return 0;
 	}
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index 9e38b3b69e9b..df1748763d95 100644
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
index fbbf98c4ccae..1b3f8b84ed30 100644
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
2.56.0.455.g6c5a503b38-goog

