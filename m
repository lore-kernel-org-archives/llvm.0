Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2A11C84CB
	for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 12:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763900445; cv=none; b=r/UEpxwKTqxbXAlhTPaALX7lYyLuTvVRyleeOFwMJRJCcv0KG6wTRvVxWc3xO0ybWS8wt/F0xRlh0NjCdNtbC7MlzrOveqsasyrE9i8qE6CIBQEfMb8uiuEkaLTa8Jbz/DEFtrMcoq1jpXJhpYeWfFYuaDZairMWM/wVvkpPyrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763900445; c=relaxed/simple;
	bh=b4Kl6/Ln3nxjJA5hQViap2LYnXpQaAYZwfl+OVUiJXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ROXlMIj7dem7r9OWn1A9cO3z+0cmeNQ3IaG2xCudaBcd48Hz0xwZIx0pKCEDaDl2YgPgFv6FF2f9UGucQ3d4RD0y69Y7NdL3ZMhkBK+kUZ2sqrBNqboV+bvV1B2yY04YTUkigi3pBcOU+idcwfGaQg1z5Mi7vdWU8DUZ25Rau9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfqTsE2m; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfqTsE2m"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-343f35d0f99so2793131a91.0
        for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 04:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763900443; x=1764505243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRiPIYfxAbeDZx56dDO7Yzut633E3UEGddHrba2VO58=;
        b=LfqTsE2mN63vLdlTfNjNWXMaWpUY5Og4hPuxtuCyBsykQ8Qmfm+6z7Vg8YZCuWxQ1T
         ETTUaMtkt/jeaRBXbI4dDk98pO4jeGhcnxOI7MtOewxCB820DJPq1AT6hvTEcxi1N41s
         QakVJavDW6n2/GToqD/6AD9Vt691eg3tB8gmL4IF1gC48zCFYOWFm/QweYX5hNQr9SpJ
         ruNSpLOz++MOHMQ0q84+fKtIRs9LYsXLRmgVYNFK4Wt7kWe4kLB1ImIq0YHWRqUJuwl0
         LKcNz8M7O/dOlKhcJw6uq9fVq2F2/nSxtzkn5Z7BRjxG7l/pfGG21W44kS9QVgeVZXuq
         DK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763900443; x=1764505243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uRiPIYfxAbeDZx56dDO7Yzut633E3UEGddHrba2VO58=;
        b=gOnCRd+zycxV9VirWQtwH0U8CvdWYbaeJWH8J2Uvz7PjAvPPcxoh0zsXw7ezqrNt/S
         lLHfJjHa6I6NTw/d/ux15tA2u4z04eAmvov7dXt/G08WGpO5GFoAWYCKn3loN085LA1t
         KkLHjbTbkL6QuqqZTo61amlot+z0y9oSRjB23nJ3RiFojbOy3pjaNMyXG8N6AYeR5wcM
         9hROCtycP1UsFj1BO3SrFGXwtOlhQReYguHemKCZwzzRdLOgpYj35bV8e3zR7LM5O36H
         m2AKw3h8dhGRC4TGT8cYUGBj5DRbVQpCtQfTpIWK3jp6Ibvc7GCAlDNh+hoShd511jnf
         ic6g==
X-Forwarded-Encrypted: i=1; AJvYcCU7DMC+IT1X3chM1IejtGGmR61FKZwbZq+Ch2kDVcTnm1NEFq2yKjNJX8KDIX4+Zv8ZCtMd@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/oFUgH4Sbwt8mDvgQpYe85p8QF0Fv+4S0YoY5L2xeq7wf2zQ0
	J7AoE9deVPmgsBFmePkX6YQF7nb+LoqKr/J5BdIoIeCK/mofFEbZFaGx
X-Gm-Gg: ASbGnctjjhIX6euW2QV6eDVWOdm/HQUD08fvPoWtjLPJvgfyon94rGTld6aYC1b0mS0
	r3cNc1+uEDGAtTq/cUewtwhd00M/7zeuGbn82c/pSHj/RqZmuSIjovDd3lZGY3PWJPR2ehZ5Qhr
	fGGgOCLTySvQCyotNWo7JafVlntZi/PlbwfOmMeyARmMTxZ4lXTQISHTUSFnhLdWaQML8hOdO/S
	mwtBb3QQRer4QbhpRiVoyTtaC92q5T/pw3R1je7K37K8T5VVyXiLpNy1at2B3iWnB/Ouot0ql6X
	Ho/dbkVqJu7PBUfSBb8sfrciXxdziUMUpCpii1U05EimIkNRTtWQZXY9h9q8qNVYkqYIJl1PN8L
	MB2i5IO34M6hatSHKBJjkBmfiKB2HpzBVqGJkQ1F5CoMNoHqIFiRIEwMMixaqS2KoNmKcd46jqB
	z+KIG9lNEVlTZbdgVnCWPioaAjMffvwFzIPqo33A==
X-Google-Smtp-Source: AGHT+IE2OipiHB3l7nfaaOZz9AJR/rU+rtGLdqGSFKCc9D1xo2iRoaS3rmxvDNPBZM5K4JE+kKoccw==
X-Received: by 2002:a17:90b:50ce:b0:340:ec8f:82d8 with SMTP id 98e67ed59e1d1-34733e6ccdcmr8778976a91.12.1763900443106;
        Sun, 23 Nov 2025 04:20:43 -0800 (PST)
Received: from DESKTOP-8TIG9K0.localdomain ([45.121.215.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63aefsm11410178b3a.52.2025.11.23.04.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 04:20:42 -0800 (PST)
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
	Xie Yuanbin <qq570070308@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v4 1/3] x86/mm/tlb: Make enter_lazy_tlb() always inline on x86
Date: Sun, 23 Nov 2025 20:18:25 +0800
Message-ID: <20251123121827.1304-2-qq570070308@gmail.com>
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

enter_lazy_tlb() on x86 is short enough, and is called in context
switching, which is the hot code path.

Make enter_lazy_tlb() always inline on x86 to optimize performance.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
Reviewed-by: Rik van Riel <riel@surriel.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511091959.kfmo9kPB-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202511092219.73aMMES4-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202511100042.ZklpqjOY-lkp@intel.com/
Cc: David Hildenbrand (Red Hat) <david@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
V3->V4: https://lore.kernel.org/20251113105227.57650-2-qq570070308@gmail.com
  - Revise commit message: changing inline to always inline
V2->V3: https://lore.kernel.org/20251108172346.263590-2-qq570070308@gmail.com
  - Add `#ifndef MODULE` to fix build errors

 arch/x86/include/asm/mmu_context.h | 23 ++++++++++++++++++++++-
 arch/x86/mm/tlb.c                  | 21 ---------------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
index 73bf3b1b44e8..ecd134dcfb34 100644
--- a/arch/x86/include/asm/mmu_context.h
+++ b/arch/x86/include/asm/mmu_context.h
@@ -136,8 +136,29 @@ static inline void mm_reset_untag_mask(struct mm_struct *mm)
 }
 #endif
 
+/*
+ * Please ignore the name of this function.  It should be called
+ * switch_to_kernel_thread().
+ *
+ * enter_lazy_tlb() is a hint from the scheduler that we are entering a
+ * kernel thread or other context without an mm.  Acceptable implementations
+ * include doing nothing whatsoever, switching to init_mm, or various clever
+ * lazy tricks to try to minimize TLB flushes.
+ *
+ * The scheduler reserves the right to call enter_lazy_tlb() several times
+ * in a row.  It will notify us that we're going back to a real mm by
+ * calling switch_mm_irqs_off().
+ */
 #define enter_lazy_tlb enter_lazy_tlb
-extern void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk);
+#ifndef MODULE
+static __always_inline void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
+{
+	if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
+		return;
+
+	this_cpu_write(cpu_tlbstate_shared.is_lazy, true);
+}
+#endif
 
 #define mm_init_global_asid mm_init_global_asid
 extern void mm_init_global_asid(struct mm_struct *mm);
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index f5b93e01e347..71abaf0bdb91 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -971,27 +971,6 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
 	}
 }
 
-/*
- * Please ignore the name of this function.  It should be called
- * switch_to_kernel_thread().
- *
- * enter_lazy_tlb() is a hint from the scheduler that we are entering a
- * kernel thread or other context without an mm.  Acceptable implementations
- * include doing nothing whatsoever, switching to init_mm, or various clever
- * lazy tricks to try to minimize TLB flushes.
- *
- * The scheduler reserves the right to call enter_lazy_tlb() several times
- * in a row.  It will notify us that we're going back to a real mm by
- * calling switch_mm_irqs_off().
- */
-void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
-{
-	if (this_cpu_read(cpu_tlbstate.loaded_mm) == &init_mm)
-		return;
-
-	this_cpu_write(cpu_tlbstate_shared.is_lazy, true);
-}
-
 /*
  * Using a temporary mm allows to set temporary mappings that are not accessible
  * by other CPUs. Such mappings are needed to perform sensitive memory writes
-- 
2.51.0

