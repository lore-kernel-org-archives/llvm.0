Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE2C46F4AF;
	Wed, 16 Sep 2026 08:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547881; cv=none; b=jTsHMfQX4iBJ7YertOKul6DzVK0AF5+Cpn2gQQhzY21Y5WEtkxSZ3Yp6P2RO9/IrlHmiVEHS2QQGvn2yesxSTEcbe29SxkOFasmecYj2Bxtzl+RGvAt03IugmjQPoAkUj3cfxGqUah3vDn9ObHnO1G7TszaMKJxqgroyXSjq6Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547881; c=relaxed/simple;
	bh=J+6sio5yRa0FJQHFzUkjZvt161ouwYeO6rsk6NxVyPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OYmLFqZCcZco8bjgACaAvKGAdHLxp/WKJl3591wHcoYds01fxkkBJHwpLl/+Ymn5PQ90IXgJy+YuYZKV8lwRFwBRNCnYOkcJbWvHFBLN9inIHUhxiswhkfJzgJT0YhHxV0LPaO3d71KWtF1jp+Cznr18INVK0CtviafZnF6lrXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkW4r6Xn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkW4r6Xn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D0B71F000FF;
	Wed, 16 Sep 2026 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789547879;
	bh=/ZVRl7Y1YIACUYiiu0izSYuEQsygi4uHz7Xju5KXuwQ=;
	h=From:To:Cc:Subject:Date;
	b=OkW4r6XnEuLZt8f+qeI1RNfMhekNjYfaGPS2go2IHp6Jcr8isnpn9NaVU9LLDPdrk
	 dT5YGgBBobi/ivVZGZzflNUSvVjluFaE6wrn+Vqw2+XrcamktGC8TDNt6uZpNR/dFL
	 Qjr//c12wbrEOBAw/2Qqp50mx3Lx7LVDnuaj86B41Pg1a6Z5lTnphItVJt9R4F94tX
	 LeIh8E4tlCTWvMlsiSDMIpzaY5ktJnpzWdcncZWNKbIc63DFr+U9wrifJKtJQj4ItU
	 BMMaIbcOx+jiwE+dGuk8w75FV6epimz9KCw8mgJWSc88Xin4v737WTNLqL4CM6FZbh
	 tfnzZeHJgEpsA==
From: Arnd Bergmann <arnd@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nam Cao <namcao@linutronix.de>,
	Jia Wang <wangjia@ultrarisc.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] riscv: limit sifive errata to CONFIG_64BIT
Date: Wed, 16 Sep 2026 10:37:21 +0200
Message-ID: <20260916083752.47310-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

There are two errata for this vendor, and they both individually depend on
CONFIG_64BIT already. However, an 32-bit allmodconfig produces this warning
from clang for a condition that can never be true.

arch/riscv/errata/sifive/errata.c:29:14: error: result of comparison of constant 9223372036854775815 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
   29 |         if (arch_id != 0x8000000000000007 ||
      |             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~
arch/riscv/errata/sifive/errata.c:42:14: error: result of comparison of constant 9223372036854775815 with expression of type 'unsigned long' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
   42 |         if (arch_id != 0x8000000000000007 && arch_id != 0x1)
      |             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/riscv/Kconfig.errata | 2 +-
 arch/riscv/Kconfig.socs   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 3c945d086c7d..38ade0ea4e9c 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -46,7 +46,7 @@ config ERRATA_MIPS_P8700_PAUSE_OPCODE
 
 config ERRATA_SIFIVE
 	bool "SiFive errata"
-	depends on RISCV_ALTERNATIVE
+	depends on RISCV_ALTERNATIVE && 64BIT
 	help
 	  All SiFive errata Kconfig depend on this Kconfig. Disabling
 	  this Kconfig will disable all SiFive errata. Please say "Y"
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 429e07589306..cecbce0c4983 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -34,6 +34,7 @@ config ARCH_RENESAS
 config ARCH_SIFIVE
 	bool "SiFive SoCs"
 	select ERRATA_SIFIVE
+	depends on 64BIT
 	help
 	  This enables support for SiFive SoC platform hardware.
 
-- 
2.53.0

