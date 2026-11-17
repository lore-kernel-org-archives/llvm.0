Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941357;
	b=S2hziudoI4LEOgCE02JuPrtCKZDVuFMAK9L0PTVN0MBaeiqt13+ZdhHkHBAK5enBS0HX
	 af4YMIIRwS4ucRUeP2rQT1Y7KrPnzHpwcLfxUQ3r5yapuGv+M3Dn1SKcIII4W9v76zSwh
	 U7Mk7cXPbQOXfaYvY3SFkFTrk9qCo4uOFYCo7lqeO4HWQQRbqF0Er9nqi+icU+QowDyX8
	 t8wwo+O3+c/eeXoMW9PDuHhsYsHzyW2dCx7JyVx8SOFkG2ahyc+sNEkTFs7i+bgRVv03L
	 8DvV3mdtFBjomvsHTrP+Q1dKNb4gPzFVoI3aQzCzBTxbn2/rWd45zeA1l0C2H7JjNig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=gRNK11YgcY8cyMOB0/Yo8DNfUbiIMkO6zRKLCyKH5W0=;
	b=LvFOmJ9Jj35UN4Z942AjsOU7wNeN2UOGk9K3ehbHS/jHcSIO8SYBfIjsdlicVH9I20YI
	 DxQi/3AGclOILWPCfanKp4cbDduWoSOUsBS2qDmUD0OrcgRb4v/KWK7q6DYRbEklOoZ5t
	 42gr1ymKQuA5bLqpwToLFAo7wlurrzm1dcFQXCAh+T5H3DJ+CBTyA/U0iOzJCbNLv4AFg
	 OWB9OLbpq+7xsCGzaI78/4co+FUT3NsftTuiGlmJOpYrvAK/7ANCiK2MJc4W5huP3L8k4
	 1W7+wZIRV7l+vVjoxGjEAKOf8UNJ9kBJs+UIQmsS9i5a7Tgb5dj9zmMSD5fW1Dl/xjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RqHwY502;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F326606A32A
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 18:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F326606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RqHwY502
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so238005eec.1
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 10:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794941356; x=1795546156; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gRNK11YgcY8cyMOB0/Yo8DNfUbiIMkO6zRKLCyKH5W0=;
        b=RqHwY502pPKX3V/LnXx/X2cptldxSMa7oBbozbNfwbL93MYiLPMG3vZP1rlzdXVryt
         Pr/wiBLScD4gTK4cTzvmsbgrlWuIAWWpoxGmAUNMT1E1xNGRo0FdO3xNk46C90wMPEpS
         xKjL8MeRAg6IwUPBoqsVD+SWMQDl6RyXfns/233BQWdgtvgeIMjZy+K/LBn0VSgXLldF
         w/4A+Nj1FSIVtHcQFn1vOGArzE07UOMv24jyTNiXZ/PrkLTWnyUxLpn3a9xZlb559OWI
         RDbzUHJhKLedHqt9P1RAPfE+ONBdUctQ0NCDHSTNAW9oxnSBdl91MDHOL5gvI3thqoQQ
         ofKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941356; x=1795546156;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRNK11YgcY8cyMOB0/Yo8DNfUbiIMkO6zRKLCyKH5W0=;
        b=mqij2M2zzmaxA+CrL6ZflVYZ3EgnykjC4eFevPllepTd7H5ps1NTAb5VS/JQ0qLpjH
         P10l9PXpkHocUKMItpCWpIquzgcjLJVq6V9jaDF2HxRT2cSrqWShcTTbx0GkyR/pA5av
         g3kkSY1uJfOOrb9eaptL7qP//jyskM5bW3WWbiNIGTCSZfd8zg9qkQ09HCd4TnjEaXUP
         hadXKd/kCBr7DOJ/gzPn0bF1EiuV/IqosVlo2FwheB9vSPnqX8+F8zHt1ViFNOefuXYY
         O7LqAG7OQPJCGgr6GfK43Zbm/pPezpZLiMOzks2S/RmQsH0cpOs2V77vdQAcsnWulvqH
         1dww==
X-Forwarded-Encrypted: i=1; AL+hErERgR7vq97xatwVXAvQg7HuDu8j1zExtvVFhUQxucfQnf5IjGJUZuB5MRdY2NgPhGxj+TLP@lists.linux.dev
X-Gm-Message-State: APuU4Z9vt0ERMWYMmAlFxcmSsIwNQDqXp0bWgTZ7AxdFWLf7W3O+guUf
	kka5pdV331wwYKvQ8tpv17VjnTnrrorfBlDWqkpRGdibE1MCrVrdc+6765oPxVqEO8C7rBZSI1A
	Kkl6LGGP6jw==
X-Received: from dlbur7-n2.prod.google.com ([2002:a05:7022:ea47:20b0:1b3:b4d2:9bba])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f509:b0:168:3243:c91a
 with SMTP id a92af1059eb24-1b543cb5110mr354520c88.13.1794941356013; Tue, 17
 Nov 2026 10:49:16 -0800 (PST)
Date: Tue, 17 Nov 2026 10:48:27 -0800
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
Message-ID: <20261117184844.99889-7-irogers@google.com>
Subject: [PATCH v14 06/23] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
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
2.56.1.703.gf848ed807c-goog

