Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F51F14F135
	for <llvm@lists.linux.dev>; Mon,  9 Sep 2024 02:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725850699; cv=none; b=JDlcO710Pp9KTDBlBhvaQxLKhLdroLVdglAPvyiqBjYRpf/ctYY6tkWFOTdfrRa3hxOd4bDnTboT+ms2juHReOV90U0rPJiNDCztZqoSrfy4Irzs90VoNoCiddv2ihRrDa/2uMJACpbB4ph5g++pXA6lVihlaImdPR7X0KJJmrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725850699; c=relaxed/simple;
	bh=61I2ChZ6MoldBG9x3NThRnCHIYyf1KC7SPeNFXUUbJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GcPRDoeSDnNp7XYfyMFP1uvDUXuWYlkinXUeu2+IU9+g1xc/Ie8GNEmZUp/1PiKDF2kvEinl912pQ4TGwVIwLYu4Z03pjziDCgFrVOvoN/gIxHf25PxHwpmJiZX6LCs6nXEPioNnSWggzDouZDR8L1PBqJnS6a+jEIaUfrE4umI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=gvaQqebc; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="gvaQqebc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1725850638;
	bh=0jvAXe9spnDkSUEV8dePIAYQvx00bCT7m3MR46ml5fI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=gvaQqebcD8pSIsNoXprAnAoaJCKxnOH5YwKzeDzQl6DL7zSdFJNEDwoBL+SnthU4G
	 ViWrPZTpzLg600dslrHdJ751mq7exozGI9kPmEXhOHi+qdCeOmUGbEhdI8AtQmNn8u
	 xkPYwuaSvStrU9OmRmHLavfpkvw1Ti3wJPySquUQ=
X-QQ-mid: bizesmtp80t1725850634tv2rc5j5
X-QQ-Originating-IP: E6t5mxXfc7ZFPvUXzfw9HkQ6yB38DisTbd7HuGprEOo=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Sep 2024 10:57:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2667592176881023246
From: WangYuli <wangyuli@uniontech.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org,
	sashal@kernel.org,
	parri.andrea@gmail.com,
	mathieu.desnoyers@efficios.com,
	palmer@rivosinc.com,
	wangyuli@uniontech.com
Cc: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	paulmck@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	brauner@kernel.org,
	arnd@arndb.de
Subject: [PATCH 6.6] membarrier: riscv: Add full memory barrier in switch_mm()
Date: Mon,  9 Sep 2024 10:57:01 +0800
Message-ID: <10F34E3A3BFBC534+20240909025701.1101397-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.4
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1

From: Andrea Parri <parri.andrea@gmail.com>

[ Upstream commit d6cfd1770f20392d7009ae1fdb04733794514fa9 ]

The membarrier system call requires a full memory barrier after storing
to rq->curr, before going back to user-space.  The barrier is only
needed when switching between processes: the barrier is implied by
mmdrop() when switching from kernel to userspace, and it's not needed
when switching from userspace to kernel.

Rely on the feature/mechanism ARCH_HAS_MEMBARRIER_CALLBACKS and on the
primitive membarrier_arch_switch_mm(), already adopted by the PowerPC
architecture, to insert the required barrier.

Fixes: fab957c11efe2f ("RISC-V: Atomic and Locking Code")
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/r/20240131144936.29190-2-parri.andrea@gmail.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 MAINTAINERS                         |  2 +-
 arch/riscv/Kconfig                  |  1 +
 arch/riscv/include/asm/membarrier.h | 31 +++++++++++++++++++++++++++++
 arch/riscv/mm/context.c             |  2 ++
 kernel/sched/core.c                 |  5 +++--
 5 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/include/asm/membarrier.h

diff --git a/MAINTAINERS b/MAINTAINERS
index f09415b2b3c5..ae4c0cec5073 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13702,7 +13702,7 @@ M:	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
 M:	"Paul E. McKenney" <paulmck@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
-F:	arch/powerpc/include/asm/membarrier.h
+F:	arch/*/include/asm/membarrier.h
 F:	include/uapi/linux/membarrier.h
 F:	kernel/sched/membarrier.c
 
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c785a0200573..1df4afccc381 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -27,6 +27,7 @@ config RISCV
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_MMIOWB
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PMEM_API
diff --git a/arch/riscv/include/asm/membarrier.h b/arch/riscv/include/asm/membarrier.h
new file mode 100644
index 000000000000..6c016ebb5020
--- /dev/null
+++ b/arch/riscv/include/asm/membarrier.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_RISCV_MEMBARRIER_H
+#define _ASM_RISCV_MEMBARRIER_H
+
+static inline void membarrier_arch_switch_mm(struct mm_struct *prev,
+					     struct mm_struct *next,
+					     struct task_struct *tsk)
+{
+	/*
+	 * Only need the full barrier when switching between processes.
+	 * Barrier when switching from kernel to userspace is not
+	 * required here, given that it is implied by mmdrop(). Barrier
+	 * when switching from userspace to kernel is not needed after
+	 * store to rq->curr.
+	 */
+	if (IS_ENABLED(CONFIG_SMP) &&
+	    likely(!(atomic_read(&next->membarrier_state) &
+		     (MEMBARRIER_STATE_PRIVATE_EXPEDITED |
+		      MEMBARRIER_STATE_GLOBAL_EXPEDITED)) || !prev))
+		return;
+
+	/*
+	 * The membarrier system call requires a full memory barrier
+	 * after storing to rq->curr, before going back to user-space.
+	 * Matches a full barrier in the proximity of the membarrier
+	 * system call entry.
+	 */
+	smp_mb();
+}
+
+#endif /* _ASM_RISCV_MEMBARRIER_H */
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 217fd4de6134..ba8eb3944687 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -323,6 +323,8 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	if (unlikely(prev == next))
 		return;
 
+	membarrier_arch_switch_mm(prev, next, task);
+
 	/*
 	 * Mark the current MM context as inactive, and the next as
 	 * active.  This is at least used by the icache flushing
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 97571d390f18..9b406d988654 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6679,8 +6679,9 @@ static void __sched notrace __schedule(unsigned int sched_mode)
 		 *
 		 * Here are the schemes providing that barrier on the
 		 * various architectures:
-		 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC.
-		 *   switch_mm() rely on membarrier_arch_switch_mm() on PowerPC.
+		 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC,
+		 *   RISC-V.  switch_mm() relies on membarrier_arch_switch_mm()
+		 *   on PowerPC and on RISC-V.
 		 * - finish_lock_switch() for weakly-ordered
 		 *   architectures where spin_unlock is a full barrier,
 		 * - switch_to() for arm64 (weakly-ordered, spin_unlock
-- 
2.43.4

