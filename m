Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209A125484D
	for <llvm@lists.linux.dev>; Sat,  8 Nov 2025 17:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762622759; cv=none; b=PrlSSx3ZK+ZHNhum4rQjqFn5JBOSVdvjemosk4nTN+Bmkss+9m5lXBGmnFSjAJlEMiHpzmjbowVJJ8k9Msdffj9+jbqHnocAA3/tnP7vB/T51PclH6+wDvsgKfWR4D45FxZETG7e1IozSVtvhjKpc4OeLsPC5gPgCut/B/gMC34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762622759; c=relaxed/simple;
	bh=+z69aBAj7PeYbAZxC2mqFkm9oFXI8oBi1usMI/J9M1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R2ypOp92DU/OgS9p5liQe2/g3mt1OHIiTCSHD0i7rShjXGisTG7vQEmd5PRbfjOABLb/4ISxLaUIs1vO14xBJD9zq8IdyYJ26N4MLj9LfJ5pX8dN7k8P+Gavszrt0NLzi2wxF5C1zYgJlxwKT58uXLD3vuBvx1OskIeLqGugX9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiXeGH7Y; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiXeGH7Y"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3436a97f092so1057793a91.3
        for <llvm@lists.linux.dev>; Sat, 08 Nov 2025 09:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762622756; x=1763227556; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5bwZ5Z+zIq2ecop9oyYTCXszFNgUcbYI97Mt5lZei4=;
        b=QiXeGH7YwVt71MFz0r87vx5VZ5kTK2P87idISddQ2/wSLJ8beG7H04CfJMOde/s5NY
         OvKeWWRD2yOtModWgvkx6jdOh4EJcW+SFI0FTAEIo6JiHroe993oQmH8YR+QHr666iGS
         KFzyE3YSNjmDolA0Fi7LsFVm94fuOqM3XX0KdpMPtAKb8oiEdLUQcwMkmxoasNQGEXQU
         J/UYU3RO6DFAXQbKGcCVl0X4RUis7NowKW/3di/l4GQSlCuKqG45TkBPG0kXDVFgoyNl
         n81VU2a31e0UIqvDiQKviWELYqJhZgxr9OmN9vnRlh+3u8FdG1z1+ZOGnFhVD+Ex6Z3N
         Z5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762622756; x=1763227556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q5bwZ5Z+zIq2ecop9oyYTCXszFNgUcbYI97Mt5lZei4=;
        b=CHIRLCApEqQbH5FBZWhADt4y4oLUfdBGJFMnYWGIGD0QPKQYIIW2fSv++FNQPE/JPZ
         t4qAWl3/CZ+woDjroogy0opki+8EhbsLb6BHIlWeK3lbEnCeHoZSrKdNeBdu7/dAra1S
         mmaRK+TWLx1FnTDj5DRZhXXOiuaMpfFOPfxXcQ4pbk1mbbewR/97h13lMHARMAWh1HNg
         jkusG2ThWU18fnTyfai2rMoDhZCac0Oj2YF+qRHl8ExAlBlBNoKAJS7Us3ohESReK/3z
         ki6DFn63EjcSvguNgihPwjrbyC0O9DN6pELL65yG5PIujhUbBh7W2xejVUpI3N064rQ0
         d2lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaQAO63gj/8lYOy8SxEhMknvZbKu6bpfujSzo/vE+quRIXxREPwNTAFeYRAQYO7vfWDl2f@lists.linux.dev
X-Gm-Message-State: AOJu0YxS7Ej8gyKxX0CFzyo/cI89J2r1zUMKVkjEK9mktU1R2fpeC9nZ
	dSH4gBmIRhwp4fPHmgkBTyVoX1bAYdwPI2a3X9jXXG0KHRcaP2nE7d8t
X-Gm-Gg: ASbGncuD871Ma9yNXkPYv7/WGyCuVgxG7/eq+Joq6npe4XvAezjHGZE45Bc6Yzsw5d5
	rxe3rcznV792HW8P1nq4X6yjv2d5HJhzQorquAoJxE8mWoo8khzDrAG+chT4eRuMc3W/bTg8pgH
	9lvJARL5j76F/lsJld1lRtNLt7DlIFzi1phWWda37Ca3yw9DD19vtXtxHsEPwC1/aJp5oJCgjHu
	9PHpmHVveQAfNZPvwLCosmRpYJlfD5IEks8QWg1cch3PJNobGgUnCtyQ2C/iOmvit83rtSa2Pvw
	R1NuC3JoAsOtxM4BNyqL9w4B0lFdgcglifQn1UlECT9aAtWBsJqktmXCD+xMHJGWg/HjfW+216y
	uGAyIyhehYolRo+bXT3I4jtFHhXzbC5iPLp9/wdu2QFR2Y4apOX9N4eg+uzLBuN4HSoDZvBFOOO
	VKumSm//SNO0q1sqrUbGyXeU2+fs0zUDGmLn4=
X-Google-Smtp-Source: AGHT+IFzryf94me9ukx/zbL0xbjMPFhvtV+1CTMJbLmCIUchy3O1OLGY4lLG83s/d5GEdAHNinNGqw==
X-Received: by 2002:a17:90b:4b04:b0:340:d81d:7874 with SMTP id 98e67ed59e1d1-3436cbc9436mr4012371a91.26.1762622756323;
        Sat, 08 Nov 2025 09:25:56 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3436c3d7dddsm2769122a91.7.2025.11.08.09.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 09:25:55 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: david@redhat.com,
	tglx@linutronix.de,
	segher@kernel.crashing.org,
	riel@surriel.com,
	peterz@infradead.org,
	linux@armlinux.org.uk,
	mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	andreas@gaisler.com,
	luto@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qq570070308@gmail.com,
	thuth@redhat.com,
	brauner@kernel.org,
	arnd@arndb.de,
	jlayton@kernel.org,
	aalbersh@redhat.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	max.kellermann@ionos.com,
	ryan.roberts@arm.com,
	nysal@linux.ibm.com,
	urezki@gmail.com
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev,
	will@kernel.org
Subject: [PATCH v2 2/4] Make raw_spin_rq_unlock inline
Date: Sun,  9 Nov 2025 01:23:44 +0800
Message-ID: <20251108172346.263590-3-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251108172346.263590-1-qq570070308@gmail.com>
References: <20251108172346.263590-1-qq570070308@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function is short, and is called in some critical hot code paths,
such as finish_lock_switch.

Make it inline to optimize performance.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rik van Riel <riel@surriel.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 kernel/sched/core.c  | 5 -----
 kernel/sched/sched.h | 6 +++++-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 81cf8452449a..0e50ef3d819a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -677,11 +677,6 @@ bool raw_spin_rq_trylock(struct rq *rq)
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
index f702fb452eb6..7d305ec10374 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1541,13 +1541,17 @@ static inline void lockdep_assert_rq_held(struct rq *rq)
 
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

