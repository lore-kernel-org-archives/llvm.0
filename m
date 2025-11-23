Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4840A5CDF1
	for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 12:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763900502; cv=none; b=A2XyOb6PVSE165/p/HcOl7OkTixmwqxEy7JcJ+xZDdYicYOPJFLLjw8igg2LlIk7qQTlbIRU58XoF/utOm8e/GfXZcZhmIGHxLidubW+y/xZcz6+DsZlZxBcL3n2rRxsUCc/i2j4oIhLoZRawT1F3rHTwt4nTYwdEt2D7f3m35E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763900502; c=relaxed/simple;
	bh=qzv7MNEPESHaBf9knR8U9/ufN8T1/b2k/bwA1Kzg0KA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vfnro/63DZGC5Qhv/0JJWDES4XyH7/laZOCuXYKVholQsAku+CmQ/k/GTe887Mlc5kv9a2Nmu8JQRGb51GgbzxBl56mxY43lyd0IkCLFTXM8V8/fYICmcYkQjPxwIhp4fRyChx8zUYE505HbO63CjxH5rcrNkWI/aMAkmzkD1hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGLu0Rky; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGLu0Rky"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso5274132b3a.1
        for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 04:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763900500; x=1764505300; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gehuDY8hCnCk3Q8zSl7CeP6iDX7lw6Gp8zKZT6EL4m4=;
        b=KGLu0RkyBFMGkpGU1uYJ4QbZqZfr5pPyWI8n7fS/vSQPiyZ8SiYvobiqNxGPQJ6jKA
         RYKU+m9bGdPrg9sFmbl++eZE/mK7pRQGF9G+Zs2WBVSv2Qlj1k5lPbDp8u3GaVH3Oo67
         OrYWec0kqN6Js5ssWL58CzcWO/gz/Nsk0aSzNUP93p01njFdEF10hJ+w+bvY+cdxrS9K
         /B7zUb4zH4NS1d798PsUXNc8mbSouNM+jShI3lBOpFjJiVujEcFmZOvVEt9Twrwz4UsH
         dSPIWEv37zvwut2ThvVUGQfDeQHJVdMwXFBQYHwSt/pNJLVWo2NXEmpVTehSfExNtV5U
         zsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763900500; x=1764505300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gehuDY8hCnCk3Q8zSl7CeP6iDX7lw6Gp8zKZT6EL4m4=;
        b=kba9jP74lQb3ypOHHepbqNoCZPC3OVV5n9srPeujw6nJxRxKEOMxSVrvxe5CWsF1Xh
         Xto/m5ZRiB3gT/meOIAQPejWwFL7MrrVWMWgdcK8ShPlIJABNuwx0iGc3w4WNDh/3mja
         iUF4O7BYstl0Y4BW8YfXfb7vcEg+QhA8utj1KuTnRi9phbh3SfOsDx/4W3zFWt+vZGcu
         C3egK9nKp0tHlOjsC1f5v/eXovXKFIB82+TFZd2Zg2zOZQDljco3in81eWTKXCfbHd19
         drEc2c4+DrNpdZa8iBH/uyM7vKfvJZGY/KlnsFTskOfzPwst5iRIXdThC2XGslRfJI3w
         rnNw==
X-Forwarded-Encrypted: i=1; AJvYcCV1IABNecSqmj4YfiF0A6+9i6ohQIWIRoPuHD15RmibuCW3X71lq/y+rkEQmOllDlt3wR32@lists.linux.dev
X-Gm-Message-State: AOJu0YxcHjXzqMWKDbePmKe4ERj6PYz15EXBQ4eXSx3FIS1YjF/2uEN/
	fF9a0wSX5o/Jmyl2cOD+orUi9Fzi8MO0x0/ZinLyCxLINZLIJxnMNvH8
X-Gm-Gg: ASbGnctkaDstsEBdNL7Z7sUMx5qekLsRjsC2oc/jYDjvcy962mWFoYsO02G3H8u58QY
	Fcg3+CEf9Ogm7zpe6BF5KF9dShEUkImhXsHAlC1GXNcBn3lIjNPwBHxizeXBcg6KXm2DLzbdqES
	wmggo/GoW9zOrOInjAuoVxSaOQc5f3j+7cct8+Ct8X5aUt5crqndnyM/GGksnxRyjKCuW/qqpeB
	Hs9HczLu11/UAUCW0zBiNkdfNEYBevocHTSC72JClV3CMzFYZaUgM7d4Q5zLwluhBkXGgG5aLn3
	6HNQ4THKoKqNrSg1ECW/bHytWrQeFRzvIM9gBk9XLKpVFrnmo07k98wEhXN7o2Kpkm+tm6CyRuM
	pFlbiy2UpE4evkjPNffUnPmskMADcXzKtnCtwhJOGDFPgjO9mSthsfZeKFJx3xRg5X3aZ16qOE4
	XFMcegIJtp/o83t2jnwTNctBw6ADfeYm/Q33hdMw==
X-Google-Smtp-Source: AGHT+IGKqRo5Rqn/7cYYbwvHMYFh4KwgapmQlfr3dLMTE6/Ihy9Y8y5GgtK/UfE6HYkuLUDpc/O0UQ==
X-Received: by 2002:a05:6a00:22cb:b0:7b9:d7c2:fdf6 with SMTP id d2e1a72fcca58-7c58e601920mr9501764b3a.24.1763900499427;
        Sun, 23 Nov 2025 04:21:39 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([45.121.215.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63aefsm11410178b3a.52.2025.11.23.04.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 04:21:39 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de,
	peterz@infradead.org,
	david@kernel.org,
	riel@surriel.com,
	segher@kernel.crashing.org,
	hpa@zytor.com,
	arnd@arndb.de,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
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
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	thuth@redhat.com,
	akpm@linux-foundation.org,
	lorenzo.stoakes@oracle.com,
	anshuman.khandual@arm.com,
	nysal@linux.ibm.com,
	max.kellermann@ionos.com,
	urezki@gmail.com,
	ryan.roberts@arm.com
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	llvm@lists.linux.dev,
	Xie Yuanbin <qq570070308@gmail.com>
Subject: [PATCH v4 2/3] sched: Make raw_spin_rq_unlock() inline
Date: Sun, 23 Nov 2025 20:18:26 +0800
Message-ID: <20251123121827.1304-3-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251123121827.1304-1-qq570070308@gmail.com>
References: <20251123121827.1304-1-qq570070308@gmail.com>
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
V3->V4: https://lore.kernel.org/20251113105227.57650-3-qq570070308@gmail.com
  -- Revise commit message

 kernel/sched/core.c  | 5 -----
 kernel/sched/sched.h | 6 +++++-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f2931af76405..0f9e9f54d0a8 100644
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
index bbf513b3e76c..a60b238cb0f5 100644
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

