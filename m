Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277AD563283
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 22:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930413; cv=none; b=kIQts8+2R9I3os6PdZwjTvZRS8yzrQW8/fUJyhFJ9pjjA/LIOcD3MQVYD/lohiznJ3EQLiu+Jkbrn2+9ldV/Xtk5lvANnvdfQx8nSonbX/CJxx8AmMr039L7U7j1Gc55qREvpx1BQNpuqBtoM2g0KXdrtbbP1v24Yx1iUXDivRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930413; c=relaxed/simple;
	bh=qz98LWjBN7vuyhktaur2iXpicZss29gzxpSAse2Me08=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l2R4hhaf/7WDXWCa8KP4RWZY5iczrgF3yCxQ+LUtyfGzFjyzvWFcdnuOY+XeyqNnvYsKv7ZJbSQNDr7WcGLJ6fpwvdkiaffol0EPzqx2ZA61oLAVG+Qv14wVDFaZyC6aBfeFUctLvWT9x3eBSHLYoDMjTdVEjvG1CgX7P7N5oa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rAmqQ/cs; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rAmqQ/cs"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso662298c88.0
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 15:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791930411; x=1792535211; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DM2MthsEYIVhdmp2494m0lpQjS73jUhrnW6tHHeF46g=;
        b=rAmqQ/csfhea0QVPnoVSV+cWck4Rf+r2wHHHIaw/DTuJlHNtv+kbkN9k3yypwc91Ok
         TB4dahKO+3d0yKE3kjZwInomiybxbwZ2CSeKbocJEWfUDmxj+ycPt/Hglnx24xJSMyq7
         iR+/JugeJlBa3QAZnt/OhfutXJlSaxVUoLuak9LmDW9p7pcOAHmw/oZVnPvVMvT465cT
         qqaQwX0KWYVrlszDxRqe5cm1WOuubFutK+OPtO4nSCPt3gLGJN0zuU2W55KiuhNQZXxd
         o6qbKxNH7aGoCxCAOcbSGYJOlU0cDv7dGiNik0obXV0bs46ssjUJ+WLxTKSseLXabBOL
         fPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930411; x=1792535211;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DM2MthsEYIVhdmp2494m0lpQjS73jUhrnW6tHHeF46g=;
        b=zhdQccPhzWBHquc2wxwj51lmD/dxcNQB5GTv2p6TaRDQNBdcklUvOU6OIiKJb5cvYe
         L429qh8mxoxVbI2Vhnuon7i7R7Y5i8Yu96SXT06BO2YM0uP2rv4Bt+Ew3Rox8W5mDOcH
         51JVo7p+mQKdpbQ69BVEdmDw2xaMCfKf9yWhNpe2ZfpeiAlBeXQ1JX7A4Po8mTJwSTeu
         rauEH/1Kv8BNIL4diWdbC0WiTO4o7oLy9VVy+7jcmMi0JJko45eoyrxn1iaWOW0+mOFg
         gxs+ri5l6FEGCfMc8LQu9cZ3jP8muiC4V17buVE6SyYFZ+dm2wlVFzcRr9H5LnnO3izg
         cnzw==
X-Forwarded-Encrypted: i=1; AKwUvBxKft7oGc5VUroCpKoY5Ki29lS0E9Ynlb9MoY98dtpFbCbRc552TZBwbl1xXca6+OAa7s+u@lists.linux.dev
X-Gm-Message-State: AFq9FYKEYrjxrplSEAVQfUMkOp0L5O0sVpSpfskzr6lpE72oi1wKbbGH
	9EscZsaJJM4YKgvBuDNTqdXiOdPIFvEfaKPJHhi/TTi0aLpT86rYC6pGLnoDM4g0BvzQJuB5qPZ
	4kgJ7WFv0wQ==
X-Received: from dldyr19-n2.prod.google.com ([2002:a05:701b:4513:20b0:143:75c2:6d21])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2412:b0:137:fa50:a242
 with SMTP id a92af1059eb24-16a586a3183mr17963824c88.1.1791930410665; Tue, 13
 Oct 2026 15:26:50 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:26:18 -0700
In-Reply-To: <20261013222622.1822619-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com> <20261013222622.1822619-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013222622.1822619-7-irogers@google.com>
Subject: [PATCH v2 06/10] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, james.clark@linaro.org, 
	jolsa@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Annotate strs, num_strs, and capacity in struct comm_strs with
__guarded_by(&lock) and __pt_guarded_by(&lock) so Clang verifies all
accesses hold comm_strs->lock.

Assisted-by: Antigravity:gemini-3.1-pro

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
2.56.0.385.gd3acb90ef8-goog

