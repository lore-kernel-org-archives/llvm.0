Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026494;
	b=Ipu2BS+D9XW1ycTs7vgADL8NrN0Xsb8s5mvaBoY88UU7/B4ZImCSEYLTHgeG8fdQ8BTh
	 Sy/af8TsJzREYxbAkCsxz0RzN4BOB3G8C1cIf3kAE+yl1Lcl42PYXa8NRfSycaWdt0qHj
	 2PvHsmnKlA1cUayUInHfAJHHV3Rfz+fCfotPQ7MEabov7jzvS1g8TOBG2A1KT95s3BNih
	 Ka7uqrJTV9dgSYVOGMmIjbkI5nA5vs5xDocxqdXCKmUL7elF+/pupJeOj8+BoHeWxYTnQ
	 ck+s+B/w5kRNEGSb7r6Qe2FD74aQSUi7IEpzaFBp072PktvcSg1rqbgeML7EWfvSsQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
	b=YEW0ILDA3mP13DzAan571GAr/3hlIfH13QYF2iZfqNo5X5Te475+LWjZIcgRtZ9qK4LT
	 bJsXT48YZBJV7TlrjEdwyhZT7yeHQ2zQGl3/4aJ5V/GDL0aeNo9EGmOxHbzSwI9jeYoIZ
	 OUAmgAxZy4ovHw/ugBbQ5lkPziRop1UWhaWncVEWH7uKkqfZtGjdvbkmz4f3tejl7OjPT
	 IFCRrhmHAZxffCiT5Ut5gsKqTu8EPfUgUAIv5AG22bFvNjJXRkbPNJvLggQVWEHl0AM+4
	 Dw641XibKpsTLcO+x67HY3GkCJekbiGs4okSLOM5+o5JSyPGNcFhoYpQIdG6ODJKHoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j0eihaW4;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77C8606D80C
	for <llvm@lists.linux.dev>; Sat,  7 Nov 2026 04:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C77C8606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j0eihaW4
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36de26cb4b3so1664415eec.1
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 20:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794026493; x=1794631293; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
        b=j0eihaW4G/ABu38ceztbzS1hvlqNtMPK2KIFhvMYLgRmbL2u03st5njYktMPOemHWY
         n9FvrlQf9jCe4qQAOyuK01/SNvzqyZwMkCz3Qh3wFcwl4RQvwcpokPUxYtDzkfVV25XN
         LwPGwZIYL6OS3hFN+cFIRhwY9d1YysRLO2YQkxNCSWYtuHWUS7Ws19HRlmu8SVM8lNc2
         EPRAeF5eyGoMdLC5ANFWldcQIakRmhycuGlryLs2qRJjDYqbdA/9h7cbrqz0e6lvTg8B
         5WbsgKDu9Pb3A/2Hyq3/v0/1/sfAZ9W7LsixxoAqRCzso11OQZBcmWxRAnvYf719bmzY
         lH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026493; x=1794631293;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+by7u1BFJT4b4TWAdAafRvzASUd5HXLmuE7W7FAfx0=;
        b=TXiOfrJ7s/1OI38qbkZlkbD7zfWeLeSpE7evKSgP6t8W43g168Al7nOnaRsf47CAQD
         gsb7P8a+QLA3axyWMtPrn+vD0IQOYXKmg3YQEHWeWd4txYpjXXrlMEGUFVDjUmYgmTE5
         oGPouNyhO1fvg+bzTfDHQE0pqu2Hqs0YVBsMMg1NY93tcDUzt9dfBwqWicyoaeQEnTU6
         hkw0Vsrdwjcmks7RtcR2UPGfiJVL+QuZUAg+E7tQA2XrFnwXZ+s0RvvnfVrVbpTko+wP
         TYzadPpvfrkE28rmPg0G0H8EYzlrtIeGq/y4QgYtVKzevWuQbkzqEVkjKCE1cNm7HEye
         C9jA==
X-Forwarded-Encrypted: i=1; AL+hErH9CRYHBkx9IHj4ijLY0l37o+jn52KKRVBhdXh8R/ckozGh5qzknxgezywqiOchE7rvPNNH@lists.linux.dev
X-Gm-Message-State: APuU4Z+61sgotAIAJ4TeYFYq8sEODwYs3Ef53Qyf7sgIoSqfA9g17bPJ
	DPUxfw6N1xHfLB1QM6SYpyfZReh/eNGh0zITvg4OA9jjeSg8+o7FzXxS7n7wZRYfutauRV0XGhS
	7bTj9Op0eMQ==
X-Received: from dycol4.prod.google.com ([2002:a05:7301:db84:b0:351:4a2a:1ece])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:680b:b0:36d:394d:e690
 with SMTP id 5a478bee46e88-36f785b760bmr5719519eec.40.1794026492432; Fri, 06
 Nov 2026 20:41:32 -0800 (PST)
Date: Fri,  6 Nov 2026 20:40:53 -0800
In-Reply-To: <20261107044102.1506626-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261107044102.1506626-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261107044102.1506626-13-irogers@google.com>
Subject: [PATCH v11 12/20] perf dsos: Use read lock fast path in dsos__findnew_id()
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

