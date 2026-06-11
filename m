Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180B32DA76C;
	Thu, 11 Jun 2026 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182711; cv=none; b=PqbNmSX5mayZD14knJvAmh5e5MsiKZ24FectWzfnohTKRwns6uzAVgKHXsKeZCm1Lwt7fES7jXtT+aq+B9TIcddJwyl5y1KiR3LNBTEiW8O856qj4zIypizmBYKajDvTz6zKDTABT2sfqab4P48GjUJzoNIzFgRBdvYa0nrf0+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182711; c=relaxed/simple;
	bh=QE0ehZnwPg2+Law+f8Qni0EUBclw25XvcJEvWUu8C14=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f7dckqZS2Vo9MRv8clsWsfQZPCFeLbstjwmy+o7NqqIosurvW7p7TyAy98pnmaUFiEWsfUHrefCZRWlMTflWZ0AyOh0iZSfn2mh8h83ALPAXne5SYFo4VHpYtOJfH+irCGkx/HDmT6PdbltfDrB3ia0dTXRI9R5aZ3z1LnNdOHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jmr6holv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jmr6holv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860071F00893;
	Thu, 11 Jun 2026 12:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781182707;
	bh=xoThyNDhoXi0q4nklYxR3wusyJfAFvo0Yiumhi7jkAg=;
	h=From:To:Cc:Subject:Date;
	b=Jmr6holvwx0XqGvka84MEDz7v68XthZniqnVy7CIPlXRnBrP6hhfoTkzg0GvvMkS6
	 2CymkgQJQm27vXQAYDgBULlLOO92p24Qs9FD8s698JknO26d3fKC5HO/gV0Um+wf8c
	 0caYpi5+53qGpdQOtB0a1laU8H6JJmV3m38CcOPj8Gul47b0R4KLMV9SWsC5vSLolP
	 VerYqiT4fdC/89+wUwLDC9AwSyZ3+rOlbsGxAwXPfe/1dYmKMY7c8jDK8LnnHLlmSr
	 yTQSNA+zX7tJ/+NHtu3QQTufdXoHBsiLAoYHWVm/aeXI7jBX8IvGogExX83vXUbyed
	 gRSVMBl86U9zQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] nvmem: airoha: add ARM64 dependency
Date: Thu, 11 Jun 2026 14:58:00 +0200
Message-Id: <20260611125822.3386722-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The driver already depends on HAVE_ARM_SMCCC and ARCH_AIROHA, but both
are available for 32-bit and 64-bit targets. However, the smccc invocation
fails on thumb2 builds with clang:

drivers/nvmem/airoha-smc-efuses.c:38:2: error: write to reserved register 'R7'
   38 |         arm_smccc_1_1_invoke(AIROHA_SMC_EFUSE_FID,
      |         ^
note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
arch/arm/include/asm/opcodes.h:215:2: note: expanded from macro '__inst_arm_thumb32'
  215 |         __inst_thumb32(thumb_opcode)
      |         ^

Since the driver is only used on the 64-bit an7581 soc, avoid this
problem with a stricter dependency.

Fixes: 25e001fcc1e6 ("nvmem: airoha: Add support for SMC eFUSE")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/nvmem/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index e10f7ff725ff..f33ee18930ae 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -30,6 +30,7 @@ source "drivers/nvmem/layouts/Kconfig"
 
 config NVMEM_AIROHA_SMC_EFUSES
 	tristate "Airoha SMC eFuse support"
+	depends on ARM64
 	depends on ARCH_AIROHA || COMPILE_TEST
 	depends on HAVE_ARM_SMCCC
 	default ARCH_AIROHA
-- 
2.39.5

