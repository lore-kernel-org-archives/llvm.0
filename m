Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431052D0607
	for <llvm@lists.linux.dev>; Thu, 13 Nov 2025 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763031229; cv=none; b=p1k598FWT6DG2GbV0kKzxSPTfFQZIRwZk4UPxkswr0A9pYZkPvj5yvCfQbJDIPrPGPaS1b++Gi9uOhvluTvHjLLhiUyNdXqTw5Dfk9cdh1kI4qCTdr8kTDrXKBEYVGk0U9XPGyAdjEOAHQ6ZfQ1VLmU83uWLaoHQOm3ABEcU8BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763031229; c=relaxed/simple;
	bh=we3pQV2EfXmlLrOPSazJFmri5Tg0tS6CcEYQq+waSxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rpM8E29qAgPfpP2wtRF0jQcIUGmQ49VbRXU57zmeFWmz9dhRglx8vZu1XP+0Q4oa2QnLOqoIG5olbGz/bJm//BUDDWecjPSzPlzDm1iBqInv0GEVBE+A4M5nRVDdN3zdZ6xcfW+cuqywcxF8MvVeHxVaGibAYyXmqya8hGXbL6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hI1owGvS; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hI1owGvS"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3437ea05540so668293a91.0
        for <llvm@lists.linux.dev>; Thu, 13 Nov 2025 02:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763031227; x=1763636027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79H4PCNvjunVFwIbn/0+pzKB83dy0Gioq68+Eu7c2ig=;
        b=hI1owGvScZthJz5HUFXRKsI2z+NmigJZGOm9H1fha1cXp37DcRhyY/XiRoQOPb9C64
         MWGYrUiK+K2nYj5gR+F52qvAQ2PojWwzbMR8yIpgAb/tQILeDHqO7LK92GFa4Tpj3Rb/
         UhobIly9yjyypzxU4kRszHP3fX+Lv6YmFIkcU005s7wARdN/fwHI4VQhO+otq0VoKjTr
         AZPFWg/agRLWy9h2Tkgj8M5WwtAHvGc5HJ77Vj3yulLFoZ7v3g3IWBVKXOQoVaEXazRI
         r6k1QVBDjH4E3j4mL/lwMPxpzhc8SRV9/zTVCg7fIiTCvPlWMBPhGzNzkoSJEPR9aMlM
         FuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763031227; x=1763636027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=79H4PCNvjunVFwIbn/0+pzKB83dy0Gioq68+Eu7c2ig=;
        b=owPSG/PBIxZPmcLY85aXxKK4Y74+SCaOx2AG0LaSIVS7FG71J+GDGZsZ0Ra/5NSnRX
         WC+bNZ/kOAWLsBSGdNt6shWbND4Roim97NxkU/CmtkHXX+FA04nEC2UQ6yhQUhxcv3sa
         G+gTO221jhgnDCdVzbuTvKqyNmg30+7y9FwSm1DY+O8a8YLUuJrBcF6dRaVp6ySzkzyF
         Kg69LDaqX31oo3mMegvgUvhR3uxzLdKrH8V1iwuQCi85t5W/A4vOsJcn/kBU6OcP65DN
         0IBvqTr0VN2n0TVJE4kkd6IdWqg3sU2zpOawTe6Sn4IRuBYal4mWzBmdgY553n9E6pl1
         Tf2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+nC2hFG0GpzT9L+7fd1xCo5VyWab5Hgf+CnOxirodQ+/YTlk7eKpuRKl8Y3Q9ZqNYUpV2@lists.linux.dev
X-Gm-Message-State: AOJu0YxbgALrWtsLFSsy95MxO2i++7ZYUhtER+y8AKb8QCEO5iTWr2Ph
	qfOBVo3wduKXJJi4xNvE0s6R5sZ15SjFo15xcnxZg3hxtXMkg+DKdh1H
X-Gm-Gg: ASbGncuSXEvaX3JfON6FiOwmAfxX8OOPf9A3kTLoRFtwamH0XeaPeWsr2rXxqKb7Ftz
	AGEOJ60+ev6IRlm0sMJc/MLb4tkBhQWQ5wDa4+Nq4I6wyoRmZFHK0zQ1eNYXNDNoHG8zPhBB3Nl
	+4AVvxS1OqQlziFCVK0hX+I3lOR3vST0bfRJf9ZDt5MTOBOMyMJW8wY7doEGH8dk5+x2YgNuaum
	0l3Ka3lfWrHZSRwAPimK5kWuCMua+83LL9KJd1mrCqzzZaIzzdEmaMcT2SzjIA3vxtZC5kksEuz
	boerZwi1dxOHEUu0JIvNZCqI8ZMqSIws6m5j2VLxR3DWpc3UEHj7R+7j5ExaUwT1C4coOIniGLs
	1DzFonlkUh+amFT8baQuN6gQs8DePYxB9S/Vb3muIwnhViEI8vL1L4LvUSxi0kZ2RHqmqCshZ4j
	o/WIFP+zpjSZeYyuRketMgq5Fz
X-Google-Smtp-Source: AGHT+IG67cbPiY5vzZGzQUE0bLFNEQd0Hs0NoyrOMcnJ2e809/8Qsgd+TCKfqsTG/VC1QF5SpkYEpw==
X-Received: by 2002:a17:90b:51ca:b0:343:653d:31c with SMTP id 98e67ed59e1d1-343dddd4253mr7480650a91.5.1763031227339;
        Thu, 13 Nov 2025 02:53:47 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343ed4c939dsm2139616a91.6.2025.11.13.02.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:53:46 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: tglx@linutronix.de,
	riel@surriel.com,
	segher@kernel.crashing.org,
	david@redhat.com,
	peterz@infradead.org,
	hpa@zytor.com,
	osalvador@suse.de,
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
	sforshee@kernel.org,
	mhiramat@kernel.org,
	andrii@kernel.org,
	oleg@redhat.com,
	jlayton@kernel.org,
	aalbersh@redhat.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	baolin.wang@linux.alibaba.com,
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
Subject: [PATCH v3 2/3] Make raw_spin_rq_unlock inline
Date: Thu, 13 Nov 2025 18:52:26 +0800
Message-ID: <20251113105227.57650-3-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251113105227.57650-1-qq570070308@gmail.com>
References: <20251113105227.57650-1-qq570070308@gmail.com>
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
Cc: H. Peter Anvin (Intel) <hpa@zytor.com>
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

