Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514225;
	b=OPXWH9DeGkdXOZlxQb5kk5InWgGwUl7CaIr1+5QgMaUaeyiOQzr9cJiR8IcnrAKDgKkq
	 bn6Nr4kh0+R4wqeD8HC7dGHaqauJQYM5of6BZjx0RXO3H7vA9UsUr5miDLbgiGrwgsVo/
	 zvpl2CLlmrg1xePFwPgtZdJzFgxH+rwKLL6deaKL4IT93Hs4k82HSZqRfngMxOqV3nUwe
	 KMlHfXyh00qlx5mvzzqVzZwpm/EU+hzvh/GyB0exeP9+K9OATHggxrNYlGj9N0/hWpyvM
	 FvTrsc5SXrHyA4vAc5hHSim+Or0VolXbI9yT+FlBX8VtTJobFMKL/xOblI/JLOQJiGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0AxmQfbpaXJI1ahn+7h0PxdePVBkvh19toBGNbRn6vg=;
	b=5Bn+/QMBHa3pkR0jlnoKvL5Ia7Q7t31l44zAjAm44zcZgKJsJIMw2q7ccFApyT2P7t0d
	 83uU84eUe66Wd85qSycXStAf7/G/P3+UD79WUt2v1FTsORcatv0xGyNT9uAB4DkTum27q
	 h+vdADa930vit0zqLQfup5kn89937s66iIFGg06LYyjAbqe/M/u/rx644U2+he/iubueZ
	 ygcJp4lsQSzRE75fyu9FzBoq5FYNES26YwZOY3pRcSu7l3nd+E5FQ0cjmM+9FC/yXJYIr
	 4urV6keLkX39TgJV0BpsLAOyIZi4RgynkNsrkER1iL6asdKEvkFbNcZqKRRkgv9DCzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=MBNM+YTi;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D8160A2629
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 16:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18D8160A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=MBNM+YTi
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36637676140so1430806eec.0
        for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 09:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792514224; x=1793119024; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0AxmQfbpaXJI1ahn+7h0PxdePVBkvh19toBGNbRn6vg=;
        b=MBNM+YTi0es/WejcwPMFwCnAxU6KOWeu2NkIyzXQx5HnrJCdSCPxEuaIuUoqVADzMy
         RgP//moeCO6G3l7o+soAzFYi+WLeKZCwnShuabGr4GPBnzJUdYPpOTDmmJrCOXHnsnfL
         iJYwD2NNAo2JVyW7bi0WBxaOKpJkdydVF7LXDfEIioCsNdFO980ZSXn5eV64ZKpqJBp5
         G3mggVEuamBUI1gGU+KF8ffeor3t/bjMPtruqKVqJ6/DwOxDHnGIMbbZGaCifSF1Gy7u
         UnV46M4sEMZSxlOeSSkHnCR+SpMeH1bZdizkbc4ZTU7P73PI9UKiNYmirOtH3UabqQ3V
         gVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514224; x=1793119024;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0AxmQfbpaXJI1ahn+7h0PxdePVBkvh19toBGNbRn6vg=;
        b=Qy6+bBsHBZvoo/hK18lVlHkghzAjlCIXvSPAA0DAYMN6iAW9OrekZS9HUhbMqOxN44
         2l9hSH/i6PUvcO5d4l+NBOg8s6PXJEbDBRCXkZvRNITrfLKLhQ5GUHe//SgdsegG3yQ5
         tZTilgGPo4HLm2+502Kr4sJREDpGIthUulltphsYdUgJZLdekR/R6w4jnhV5EJ+HPY2G
         WPnt2Hmyi8FKwXa/+I7f5nccNVZXVN7BAfA8lvN0G8ZhAC6/6BLmwiTt9qV2yjpEuSoo
         F8sXFTLuwYWqrD4fzI2ZHkOrm7+VHtau7hRVLLFpIaC0PsGYwoaBtQXVVSfhNZKHddz6
         BF8Q==
X-Forwarded-Encrypted: i=1; AKwUvBw2JwRh+RWzvJ4bDwrcIV+h3YxP3/ifBHtpngcG3Jj7RRr3Ghm/WV1rFMsbHfnhndEndz/e@lists.linux.dev
X-Gm-Message-State: AFq9FYKjdnIreFDmT1ylWptQcDg6ZcQS2cVXpDN8w4M2s+LOcf6rFWvl
	uqP/EfwuSTylfC5LfFCkr1ZV2VbeZHcX7ABlMRtmWRR3sFFwq5U3hH8ZLUF56L+buYkUfYKDVVm
	HjdvLcCsDCA==
X-Received: from dlbrl9.prod.google.com ([2002:a05:7022:f509:b0:166:1a44:a89])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:901:b0:17c:393d:a0c8
 with SMTP id a92af1059eb24-1850c40d87bmr18319504c88.5.1792514223719; Tue, 20
 Oct 2026 09:37:03 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:36:29 -0700
In-Reply-To: <20261020163640.746159-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261016221700.1282659-1-irogers@google.com> <20261020163640.746159-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020163640.746159-7-irogers@google.com>
Subject: [PATCH v5 06/17] perf comm: Add __guarded_by annotations to struct comm_strs
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

