Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E014315534E
	for <llvm@lists.linux.dev>; Wed, 29 Jan 2025 00:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738110391; cv=none; b=Dt3h6TYXB1m7oxSE2jjqSo5cEpNIE2Uc01lAgHOVoQ9AcN/rEdHoNV0wWGK1eOkM45nreSjen3xPzAm8GhfWfZfDwCAJzMxQ3IMoUtKnxs1MKu3nQNme+bveEZMqADkoP6fRoOESwW8EPSRV2ykivS3pVKxuteYK4io55f4fArM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738110391; c=relaxed/simple;
	bh=ttHPeGDMTcjcBIoqQRbKRxvn64T3Ln0kMiIrAztObZo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FKK50aMcMAqKoWsUHv00gkxcoQCTC+IifiNFJkQJKRDzyKUiqkFATfSThVbi6r6stvSH8O7BL3A+R9PuCnvWa0KKNGXXcMAM/WM84sRFA5UKSZK5McH4P77PcOW42hArlMFV+6AU8o6Q30lCeH6i4A3CUFG8IESAfbYDH77mei8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=whTzH0Sj; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="whTzH0Sj"
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-29f9dcd1235so3723020fac.3
        for <llvm@lists.linux.dev>; Tue, 28 Jan 2025 16:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738110388; x=1738715188; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pWNil8Fjn4Jar+XAMcIdAlTx0TuFDQai1n5OzDTNvzE=;
        b=whTzH0Sj8pGElNSjytQDr3w9ONF/4P0bJDDJyiM1GIeNyWFVjbf6qqonmqK1qDqeLu
         ptklutnNt6HnuCQU/JVQF18iXPTD45JRV9tQixMNPZ7Wsh7+uhIkJOK74N3L8wZHWrtq
         oXoBUZIwNelupS6vJ6z9fBt2b5HAIyYBp4E/tLOG7cGPA47v8M/JkkgjpHIS/lnxHB3R
         Vo8pIhCcDCUC72AXmmHRbl5tEyJJB2d0OyXq2sTzba2JTv/E4n+D5B7ph7+jEpi2h2Hn
         7mXuZc3jv4vhmUHqqvBkLE1fX4okPKFpptypDsQM2BeeQTQI99HnZPXmeSeJnv6odOP4
         BhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738110388; x=1738715188;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pWNil8Fjn4Jar+XAMcIdAlTx0TuFDQai1n5OzDTNvzE=;
        b=Dub57T5ssaDYo5Z2v/MR41ihmP+0FcpoFQfl2SnFlbAIw4YSoF7IfV1o/toH6jKVLk
         jmKACI3RRsA7JyLk2tH3ei93LMQDDD/TbTU5wi57W5KTHdzsA/cKGx02cjZPIsVzVD9U
         U5Fpkok0GkFAoB2k8D9hyIPLRf+pv6w1ZHwABZCfYxVyt0soYFfu0ulz5CqGTG8VPJdp
         sK3XxxiDryMB7c2Uv/bttoyY4T3qCgtgA3X85s8faekpnU6o/RfFr8rhN3clj9Nxrq0W
         h65uUDNwQixsCBvYjkMwNfW2H5O0/Lhp9oIIwATiNGVZNpD5iN+mxcXUFnKvHE0GKKXn
         F4ow==
X-Forwarded-Encrypted: i=1; AJvYcCXkkrVARCEPeCwqETU9ypCx6sg7g47aMmhSzlO0wlX/Vf6YuZV+ZdtpV8Vf0TKtK2oA8kjx@lists.linux.dev
X-Gm-Message-State: AOJu0YxEp91PW9/9Y8yHblHP8Z4N4XERk3f1whGdMdlKOB1IbKPrepmg
	lv1gN8nWphyRJ7V1wIyXoorDle6D48A6BTnFD8kImbYmDHMrHxjKijHHHrmiGlo0FjERiLQpBB5
	B4g==
X-Google-Smtp-Source: AGHT+IHsDI3JvNuSMQ9/eovun24uNULLxtkUZVYW6kTWXvv63qVQ/psGtmGrSgUv9BBLi2ZcriE/74v7jeg=
X-Received: from oabsa15.prod.google.com ([2002:a05:6871:210f:b0:297:1959:a097])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:71d6:b0:29e:49b4:92b2
 with SMTP id 586e51a60fabf-2b32f0434e2mr647836fac.12.1738110387974; Tue, 28
 Jan 2025 16:26:27 -0800 (PST)
Date: Tue, 28 Jan 2025 16:14:59 -0800
In-Reply-To: <20250129001905.619859-1-ctshao@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250129001905.619859-1-ctshao@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129001905.619859-4-ctshao@google.com>
Subject: [PATCH v3 3/5] perf lock: Make rb_tree helper functions generic
From: Chun-Tse Shao <ctshao@google.com>
To: linux-kernel@vger.kernel.org
Cc: Chun-Tse Shao <ctshao@google.com>, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The rb_tree helper functions can be reused for parsing `owner_lock_stat`
into rb tree for sorting.

Signed-off-by: Chun-Tse Shao <ctshao@google.com>
---
 tools/perf/builtin-lock.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/tools/perf/builtin-lock.c b/tools/perf/builtin-lock.c
index 5d405cd8e696..9bebc186286f 100644
--- a/tools/perf/builtin-lock.c
+++ b/tools/perf/builtin-lock.c
@@ -418,16 +418,13 @@ static void combine_lock_stats(struct lock_stat *st)
 	rb_insert_color(&st->rb, &sorted);
 }
 
-static void insert_to_result(struct lock_stat *st,
-			     int (*bigger)(struct lock_stat *, struct lock_stat *))
+static void insert_to(struct rb_root *rr, struct lock_stat *st,
+		      int (*bigger)(struct lock_stat *, struct lock_stat *))
 {
-	struct rb_node **rb = &result.rb_node;
+	struct rb_node **rb = &rr->rb_node;
 	struct rb_node *parent = NULL;
 	struct lock_stat *p;
 
-	if (combine_locks && st->combined)
-		return;
-
 	while (*rb) {
 		p = container_of(*rb, struct lock_stat, rb);
 		parent = *rb;
@@ -439,13 +436,21 @@ static void insert_to_result(struct lock_stat *st,
 	}
 
 	rb_link_node(&st->rb, parent, rb);
-	rb_insert_color(&st->rb, &result);
+	rb_insert_color(&st->rb, rr);
 }
 
-/* returns left most element of result, and erase it */
-static struct lock_stat *pop_from_result(void)
+static inline void insert_to_result(struct lock_stat *st,
+				    int (*bigger)(struct lock_stat *,
+						  struct lock_stat *))
+{
+	if (combine_locks && st->combined)
+		return;
+	insert_to(&result, st, bigger);
+}
+
+static inline struct lock_stat *pop_from(struct rb_root *rr)
 {
-	struct rb_node *node = result.rb_node;
+	struct rb_node *node = rr->rb_node;
 
 	if (!node)
 		return NULL;
@@ -453,8 +458,15 @@ static struct lock_stat *pop_from_result(void)
 	while (node->rb_left)
 		node = node->rb_left;
 
-	rb_erase(node, &result);
+	rb_erase(node, rr);
 	return container_of(node, struct lock_stat, rb);
+
+}
+
+/* returns left most element of result, and erase it */
+static struct lock_stat *pop_from_result(void)
+{
+	return pop_from(&result);
 }
 
 struct trace_lock_handler {
-- 
2.48.1.262.g85cc9f2d1e-goog

