Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427E3289340
	for <llvm@lists.linux.dev>; Fri, 27 Feb 2026 06:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772175155; cv=none; b=qSseTZOXtSGq/VHEvm5iqT15oZlJGXOhBkfo5YYkxI4Fkx1mEKI2NUgfrw0G4nGkhYFKBuX2y2bM+C2PjJAnA5p/Q1RVxljkw5F/m8+nNx4062WYCgJoTATEhmMhj3kHA1VSP/z/oAD5drwXztK1uysJHyWmRlLaj4cRrh6IyVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772175155; c=relaxed/simple;
	bh=JQCgf544xbi44CoC+gqLmySNluxUodaT1DMo8nxG7cw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ggANb+2u/TqO8h4WdRvic6Hb9x/QnyOM4lr8Hf61I7UgHzzaxwvt5U2+/zAGpCDPY4Yi/SMXWP6Gm7DwIsVpLYVaFs7PGE5/T/w9JpzdDp81AN5wX5yNpl2EEvBz3/b5CAQN5oejhA44Qi5CKysmzbsnuOJCCCJtyNUxB1mlK0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R8iFvmn3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oMeMy0Ty; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R8iFvmn3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oMeMy0Ty"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772175152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mHtN+rnq/9BVWxyD3Wfvb5q97rTBXdu7QNBZAnIzMZw=;
	b=R8iFvmn3s/tr7AK87fk3ytAivAZsk7JBitSJHy/LS6DivMZH3cZuNRS/v4VNrVLCIw+p1C
	gr3qFw6OzXyUoDgqKXbVvnb+2uOK/m2gFWpwMqil8sPy6zs6ANoZWoMhIHOocgMk4jk+aE
	jHoimEmAp9bCWrO6DHY0T6mAGHaI959dsh3arOpbIKePw2tTKs5kyz58AzCVwPSvDMcPvm
	qoIRNIfyZpEhYh+4zCMJ+xmcD53tNWMd2M9BvdtjOYcitivdc7I2DiRRoDSng6ZKmnOsY3
	5WiPZWgqQR1B75/db9dd5HEqBI43Oa86/vSqHpzdnDlu4uQbIDUYVDE+wejcjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772175152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mHtN+rnq/9BVWxyD3Wfvb5q97rTBXdu7QNBZAnIzMZw=;
	b=oMeMy0TydGXlqF/9lnlhE+gbcNvJIpmhGbMi9EkvNCv8AsS+IubjRrGbWfhmfvqxAZqb/D
	WPR93/9vlJZoFQAw==
Date: Fri, 27 Feb 2026 07:52:29 +0100
Subject: [PATCH v4] riscv: Implement ARCH_HAS_CC_CAN_LINK
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-cc-can-link-riscv-v4-1-854e0d31103c@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NwQrCMAyA4VcZPVtp09qhJ99DPNQ2dUHppJ1lM
 vbuVkEEGR7/hHyZWMZEmNmumVjCQpn6WEOvGuY6G8/IyddmIGAjAYA7x52N/ErxwhNlV7h3Qgn
 toXVBs3p3SxhofJuHY+2O8tCnx/tFka/pP61ILrlRCtUWtTXC7+vyPqQ+0rj2yF5igY9ihJRmS
 YGqoA3KgG+124olRX0VgHZJUVU5iZMNIoSwaeWvMs/zExBQakpCAQAA
X-Change-ID: 20251222-cc-can-link-riscv-dc0304d27cf4
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175151; l=2321;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JQCgf544xbi44CoC+gqLmySNluxUodaT1DMo8nxG7cw=;
 b=y1KHwjRWdEyFAkLM7VLjstYwTC17VkQwahVP8nS0/ZE/6SVlDNzFKg/r5nsRo86Hmi1ILYVqs
 0XwflV4BL1FDZf7laFavkkLsUE8wkSLOjLu8GrTwbKXzjp3rx8YRSbT
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

