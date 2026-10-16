Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DB6377A81
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 22:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189108; cv=none; b=t9OBW7x0D7x4EK1zteLx6caVwQ+HrlkqgW6wBLi9ztao7xNzCRimGf/20bZaDB/Lb+v9/jJc7LDEJJCloT83ywt3YyQSUcsOk9dDc6zufWPwhJnVH1gCz/TvGN14yGxQ4LNkKZDRh2ihU7HjNp6tbLKQTikxYR0YEbZl8Gp7I7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189108; c=relaxed/simple;
	bh=NHNHFzCRJCoNjfCgzgh3uLdZFtzpAhqYSL5RZUodvIE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JV9Ymj7qaMaHtKW22wJnMLSU45tz5my2ft2zP2jJr+ECDwpV915KY9BEAvnCVy7DaCwxpSm2NgKlo0w4flC/qCBBqKWt5Xkbut+EPpJRSWlqDt4HhMKW9VmpbZYTIG6buF7Ykx1OjD7ydzzSGYxEoRPr2Ucq3/rE5xrQ9RMGwbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iELb31EI; arc=none smtp.client-ip=74.125.82.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iELb31EI"
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-169846a19aaso4234c88.0
        for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 15:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792189106; x=1792793906; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0AxmQfbpaXJI1ahn+7h0PxdePVBkvh19toBGNbRn6vg=;
        b=iELb31EI7a3Mujt4Z1bQ8e6AZttgfooC33JxQnOhQxmc/kAi9JYdNIHpBTvI3EosTd
         GlJXeUYw9JcYMpzUWaTRvuzeJhHdN2bct0FCec2/HDIVrj7KPLpCPW9BBwA/Ta1QbkPh
         ib1/G2VAe7mp+l5UFKfTdAaa/rL3mwv7I7TxFmcqMtHH0+uABEjeSTdhFvChaWQ/NXWW
         0fV72leWbyVYsVNbeQ6cMHuTkhA+H54jGWU/17P9fqyPH4CGfPfkQytTREoQa/hXpa9H
         VFzv31R0ZckYf8mUJOfI7IVoE3KkPwOmVuBktW0tQgDCrvmC+nmywUBKJ6crf/K9Djdj
         ZaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189106; x=1792793906;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0AxmQfbpaXJI1ahn+7h0PxdePVBkvh19toBGNbRn6vg=;
        b=uv80IGu6PpMSeQ/pRUH1rluu/rjMFu1EvUXdwJBL6f8vWhOO47T6F+KOnRcZQBIlxJ
         RJWyWQvHliHtEX1NyS5hsphUsrhh2aML6jvtxUGZl6UjyRiaIS4h6xYUgBiaRNg5EsKc
         MVa4QQc1BLR3MBRSj6xLWGWTTieOa7LcDqiVU0dv9pBcpt2Ys8llLoNqD6M7HcQNI5qw
         fcSwzzGzwbcw/0aBYH7I/taZy+zsR9CAKHJJxAmEuf00gGcD5C3VeU2dj/wfUw/hr2qM
         V1bKBOv1Q/xD0M+PJDXROKc8IslA9lTNI0klaRTgK1yFwr/3nUwqaZ2eYvqAUH/h4tt5
         7+uA==
X-Forwarded-Encrypted: i=1; AKwUvBwlN5HLpY5qFxFiML587yGIeQazv/pymmjUBfVDaPyrarC+v5WOSNLZ/J7YPavUmS1Sn0JZ@lists.linux.dev
X-Gm-Message-State: AFq9FYI6Wq7w97g9SZyWpLch6lV0JhcCujgm89UrghtVEAsCfvhLVQuL
	LW8Le73+t/+ofVCLzBbnLUBqldt6EPCsS1Mq8RwYMcLqUWEkGBPFDXxn1gPOD7Xtu6FPUEaxt2O
	Em3VfKXMXJQ==
X-Received: from dlah10.prod.google.com ([2002:a05:701b:260a:b0:161:fc1c:61e2])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1508:b0:143:7001:7645
 with SMTP id a92af1059eb24-185151be2e3mr1523967c88.47.1792189105155; Fri, 16
 Oct 2026 15:18:25 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:16:49 -0700
In-Reply-To: <20261016221700.1282659-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261016173106.679725-1-irogers@google.com> <20261016221700.1282659-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016221700.1282659-7-irogers@google.com>
Subject: [PATCH v4 06/17] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Annotate strs, num_strs, and capacity in struct comm_strs with
__guarded_by(&lock) and __pt_guarded_by(&lock) so Clang verifies all
accesses hold comm_strs->lock.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/comm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
index 6343a3c9debe..9fc4e91a36e9 100644
--- a/tools/perf/util/comm.c
+++ b/tools/perf/util/comm.c
@@ -16,9 +16,9 @@ DECLARE_RC_STRUCT(comm_str) {
 
 static struct comm_strs {
 	struct rw_semaphore lock;
-	struct comm_str **strs;
-	int num_strs;
-	int capacity;
+	struct comm_str **strs __pt_guarded_by(&lock) __guarded_by(&lock);
+	int num_strs __guarded_by(&lock);
+	int capacity __guarded_by(&lock);
 } _comm_strs;
 
 static void comm_strs__remove_if_last(struct comm_str *cs);
-- 
2.56.0.212.g129ede20d9-goog

