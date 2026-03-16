Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB892D94AF
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 15:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773675997; cv=none; b=GK3Bj7W+NLWnB85Z/lwR8UOyG7hKSBKgDz8u4TxAcXCydnCIt51oewwXZHvoUjM8IaG9kUDuMYsACmnHr9e89W/QX8TTr2lUqJGXuXeQunj8BmNVwXQDyWcVJZTt6/w8F9+xmCUuh7ALszTQxWaof+eXTHLJm0nEq074QqtlNxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773675997; c=relaxed/simple;
	bh=JQCgf544xbi44CoC+gqLmySNluxUodaT1DMo8nxG7cw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FaNFou2M9rhLxRvRnZgtTItIgXxk582KZqWGyfNnNiDXUS3oy/FeJNjyL+h0KMRXbZaQl7GN4Bw9EfKhtCIJZEpTlHOxPieVSrN7CE9/ObJr3wGOeNNjjCuknJZEU53Ph3/Wh06ZrnAzv7Ogas5UROgEfZJiVebOOytpk8f/yG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yOcowo7p; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hsF+BcnN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yOcowo7p";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hsF+BcnN"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1773675992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mHtN+rnq/9BVWxyD3Wfvb5q97rTBXdu7QNBZAnIzMZw=;
	b=yOcowo7pTTNZchuAuyZlneIVzObQTsimqkGq0SkrDV0YIBx4I6sn6He5vz0CabG/To4rtk
	UWW7mi4HuXquEFJCrNdvlUnTqqENvnK5LHHj8+Sbtwx08L5OQr/7Wan0WWYrXW0Kh6I8Hu
	CO4b8PzA6WKQpeboIYlj5z1XoCCMswxucwXc585Jp9idhpQE5wLv+jhSFnbii48jof1GtQ
	IYSk3lut7Jh2Vz6EG3/eci9ib2CCRtnyO+MbY/hUtxO+8kBqGenH/LvYNcCJ2NLKyb3nz1
	Lgyt0FebmzLB4x/RpxQbVh4ZCWiXQ4TUpxZtWS+C1iAbp4ADJSxTMpVzgK9/dw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1773675992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mHtN+rnq/9BVWxyD3Wfvb5q97rTBXdu7QNBZAnIzMZw=;
	b=hsF+BcnN84Q8o781Oug7QjRNp80GrDLkEkk1zRMdOlBwyJYJGysP0ym10T7CtvmRuSgcl3
	hnQqKS/Nzy7+gSBA==
Date: Mon, 16 Mar 2026 16:46:14 +0100
Subject: [PATCH RESEND v4] riscv: Implement ARCH_HAS_CC_CAN_LINK
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-cc-can-link-riscv-v4-1-64c072b456dd@linutronix.de>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773675990; l=2321;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JQCgf544xbi44CoC+gqLmySNluxUodaT1DMo8nxG7cw=;
 b=NPN4xNgMxvcwwlhstaLrGvgJ/nCDynrT/VD6/2UlNJZ7ToavccAElKeJ8YzacwbE0X4JfTAx2
 sL/dluLtLKBCIFwKU35mje1FNL2aJM0A/ucHzyoyetqZ2jDc/MDJXpu
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The generic CC_CAN_LINK detection relies on -m32/-m64 compiler flags.
These are not supported by riscv compilers.

Use architecture-specific logic using -mabi instead.

Prefer the 'd' ABI variant when possible as todays toolchains are most
likely to provide a libc for that one.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v4:
- Add -march= for clang compatibility.
- (Sorry for the fast resend, the fixed variant was on a wrong branch)
- Link to v3: https://lore.kernel.org/r/20260227-cc-can-link-riscv-v3-1-b0baf0fff571@linutronix.de

Changes in v3:
- Rebase on v7.0-rc1
- Link to v2: https://lore.kernel.org/r/20260116-cc-can-link-riscv-v2-1-eaf362d74c90@linutronix.de

Changes in v2:
- Also handle !FPU case.
- Extend commit message.
- Link to v1: https://lore.kernel.org/r/20251222-cc-can-link-riscv-v1-1-633e39e4a60d@linutronix.de
---
 arch/riscv/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 90c531e6abf5..614106694224 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -25,6 +25,7 @@ config RISCV
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_BINFMT_FLAT
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DEBUG_VM_PGTABLE
@@ -1374,6 +1375,20 @@ config PORTABLE
 config ARCH_PROC_KCORE_TEXT
 	def_bool y
 
+config ARCH_CC_CAN_LINK
+	bool
+	default $(cc_can_link_user,-march=rv64g -mabi=lp64d) if 64BIT && FPU
+	default $(cc_can_link_user,-march=rv64g -mabi=lp64) if 64BIT
+	default $(cc_can_link_user,-march=rv32g -mabi=ilp32d) if FPU
+	default $(cc_can_link_user,-march=rv32g -mabi=ilp32)
+
+config ARCH_USERFLAGS
+	string
+	default "-march=rv64g -mabi=lp64d" if 64BIT && FPU
+	default "-march=rv64g -mabi=lp64" if 64BIT
+	default "-march=rv32g -mabi=ilp32d" if FPU
+	default "-march=rv32g -mabi=ilp32"
+
 menu "Power management options"
 
 source "kernel/power/Kconfig"

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251222-cc-can-link-riscv-dc0304d27cf4

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

