Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F533043DA
	for <llvm@lists.linux.dev>; Sun, 14 Dec 2025 19:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765739402; cv=none; b=D/B74AobCaW3vr2eamMOGoTJ6R4gidM2lk4QwQlVqWRgdLRj8qBk4Q8QGE/VkKZH2H/DBhju+2XgW+DzwJkzNiuyeFTBI5QU7pEok/3INPo+XrZcq7i5wDfSryvpUTCUZaYHpKD3353XqQWkWqfsJlss2CWxkdnHFgPaxDIWTvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765739402; c=relaxed/simple;
	bh=pWT1cPEvuIsmQo6GtAuGEsb57xm3hz5gYaHUhJkIbyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g5Cz8RxPtVxjpfMkE3nJtTHSjOr1Sv59DePJ+xFWPIpKtHSGZdg/URhcEDkCmy8eNmxfGAOVPQnhXdxmLWs5SCyC5Pfp1stghSZLUi9yA4qGFj0tIa5s9y+wGDokcbG/V8IVlK8+ziSRsSZHR/fdK7pTArbqKPA5IN79XYW1eoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDWhZEjm; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDWhZEjm"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so2945539b3a.1
        for <llvm@lists.linux.dev>; Sun, 14 Dec 2025 11:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765739399; x=1766344199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6g+gpMOnc0vQHF+ukJzfO2USCcKfWV/qKZdEDby2+sQ=;
        b=KDWhZEjmZ2Ckl+eCr+RdjMcKJvyGRnf5nocAAbYVU8rUCSS1uDUvyaSJJvN+BoMC2h
         4usKaCKfe/jRxq3tlKOQCN5y3Wv4CxSSFgtF04YiXeWKIM5YwlffOtu2/rwfRtliIs11
         xMfMhH/du5OziSGSlBrpyRMV+pN2wKLZzlESJotq86FIeAK7MPrwaNqOSkQn3+pxY4AP
         cIKG/yHmiNVN38ytTavVwnjRKqBjuIAH16WovmQ7ehjlsFDGb997R4d+ce6lwQaOW3+5
         hNziTJyAu/Xc26hBCCwEPiJGfMm+rpZ+bXAqAunjvCu2we9/12gQRxYdO1cFPN5/Xn84
         opvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765739399; x=1766344199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6g+gpMOnc0vQHF+ukJzfO2USCcKfWV/qKZdEDby2+sQ=;
        b=GvJYwhGGs+56nsJhocMDHkQ6j9u3lQ0Cbz6wDxuqywkpwO7MGSBfYTPAsbGN4uGpBy
         DKFFse0FxPxS2g1XFcGK1KoHaawLYrnXUBbC2yimXDIiWVgb3snuqNZn6lUa+w5H867H
         FmQrL/X4FG9rIV59RqLgeUchOIA3a6ptXJ6t3qJEdWQvlOc9XP/VFIEz6cRFUry7p1Ol
         dbT7A8r+usW9tiiG+8WdzNAoH0Eo+MFO1cf5Whw4lVWE6LM6WQxfsvhO1b5XXQH31Yfr
         w6ZjWkQ1eBT8QjC2aqcjsTwfUWgdgPSJmYzgFBki7Fysoaf7H1CRz6M/s3SImdubjmgI
         ptqg==
X-Forwarded-Encrypted: i=1; AJvYcCUb8eWm48ynHIN6Rv2M8ob+JcrIgeklj3ZvBZc9GzKUBADTiHvk5iJSIvYCNefH64/oMF5j@lists.linux.dev
X-Gm-Message-State: AOJu0YxOB0AsuK3K+ovu5bj8rN8zTcDoEmgqs+ZH4ast3HsKAdnWKrRk
	69oeb2rwXAogeFAJ2yLUyKCOk4py8Lfs2MuRIO0s+RYbHstMjtbZckcI
X-Gm-Gg: AY/fxX7EQjXlhqKP/HJQkIkQ7CXrjxEWnfBja2ftTQMeuSCYQ3+NqDHndRvDWJ5kkvc
	duND83r47JPUURrXfd45qgo6zcGSMtzhum3UMgnPdTe99fIwye65E8UqrDy0MTZQgSbkLlKfsbb
	pJAuF43yTE7Tix4+7Zp85m+roeUTfYPkVX2/tc58tPN/TtHooPOF9X5VmG/nEp3gzHRp4eErzLw
	hiyBKuCos+rlB3Bf0WpXiLDaasF42RFwu3T6AdlRkSc/BPowXffnWkG8hsMePEBzwa62hlgdI+n
	w4Uf6A5nhRdcU7CcXUubmP67jdA5nFOTYUJ69ZOtI/OqKpBJ2J4lOc0qMCzqH81d41yAx2Ex2g0
	k4Y+h/qrySPTiQfxapg52tkeF0TEemeM58OIDwKV5dycUtrVmWedN043z6TSEMT7+xbRbu0U96e
	sRQqmaPWoz4uY/Oza5ovBrtI+1I6mkG+k=
X-Google-Smtp-Source: AGHT+IFEjQ5W/F/1GV+Udmo7P6q8cvk4k0ZspkiPRW94iOHQJNGagX56DVsdqgrn7t+EEED1vTORKQ==
X-Received: by 2002:a05:6a20:72a8:b0:366:14af:9bbd with SMTP id adf61e73a8af0-369b07ae5b5mr8721021637.71.1765739399013;
        Sun, 14 Dec 2025 11:09:59 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe3a1c5esm6909062a91.3.2025.12.14.11.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 11:09:57 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de,
	peterz@infradead.org,
	riel@surriel.com,
	segher@kernel.crashing.org,
	david@kernel.org,
	hpa@zytor.com,
	arnd@arndb.de,
	acme@kernel.org,
	adrian.hunter@intel.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alex@ghiti.fr,
	alexander.shishkin@linux.intel.com,
	andreas@gaisler.com,
	anshuman.khandual@arm.com,
	aou@eecs.berkeley.edu,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	bsegall@google.com,
	dave.hansen@linux.intel.com,
	davem@davemloft.net,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	irogers@google.com,
	james.clark@linaro.org,
	jolsa@kernel.org,
	juri.lelli@redhat.com,
	justinstitt@google.com,
	lorenzo.stoakes@oracle.com,
	luto@kernel.org,
	mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com,
	max.kellermann@ionos.com,
	mgorman@suse.de,
	mingo@redhat.com,
	morbo@google.com,
	namhyung@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nysal@linux.ibm.com,
	palmer@dabbelt.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	rostedt@goodmis.org,
	ryan.roberts@arm.com,
	svens@linux.ibm.com,
	thuth@redhat.com,
	urezki@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	linux@armlinux.org.uk
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 2/3] sched: Make raw_spin_rq_unlock() inline
Date: Mon, 15 Dec 2025 03:09:06 +0800
Message-ID: <20251214190907.184793-3-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251214190907.184793-1-qq570070308@gmail.com>
References: <20251214190907.184793-1-qq570070308@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

raw_spin_rq_unlock() is short, and is called in some hot code paths
such as finish_lock_switch.

Make raw_spin_rq_unlock() inline to optimize performance.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rik van Riel <riel@surriel.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: David Hildenbrand (Red Hat) <david@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 kernel/sched/core.c  | 5 -----
 kernel/sched/sched.h | 6 +++++-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 41ba0be16911..20146da3f181 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -678,11 +678,6 @@ bool raw_spin_rq_trylock(struct rq *rq)
 	}
 }
 
-void raw_spin_rq_unlock(struct rq *rq)
-{
-	raw_spin_unlock(rq_lockp(rq));
-}
-
 /*
  * double_rq_lock - safely lock two runqueues
  */
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index d30cca6870f5..bef6cb13266d 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1551,13 +1551,17 @@ static inline void lockdep_assert_rq_held(struct rq *rq)
 
 extern void raw_spin_rq_lock_nested(struct rq *rq, int subclass);
 extern bool raw_spin_rq_trylock(struct rq *rq);
-extern void raw_spin_rq_unlock(struct rq *rq);
 
 static inline void raw_spin_rq_lock(struct rq *rq)
 {
 	raw_spin_rq_lock_nested(rq, 0);
 }
 
+static inline void raw_spin_rq_unlock(struct rq *rq)
+{
+	raw_spin_unlock(rq_lockp(rq));
+}
+
 static inline void raw_spin_rq_lock_irq(struct rq *rq)
 {
 	local_irq_disable();
-- 
2.51.0

