Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659530;
	b=OzE3C+Y9FxfSFB7zOrYL8ubZ3rgdFzyS+kwuoD5Q/E7BxQZ5i8Ogau7YY+Oh2N/BGkVJ
	 ufRDTpQjNk+Go3jevp0JvRCpyZEEr2bdTNqO0Zu8AN8q7V0Fm6gd2q2N/PwQA8H/I59aQ
	 +zWrP81Vk98TeULX63RgHqaJ5pACslWfnyjdENR8MRppiKbb3s9c120foAKZelNbcwVGc
	 Ik96+mEiYCARHgfN4FkSOaN+MMwgL0npFhV2MT5k/yRenKBKkzghXSVasJzXXVii/85cG
	 yBnr1Ez2TCevDcTq+ryFlz5QIju+rF6MnE+by+YRS/ICLBWgSxVWvj8sHJ5I6sjzCsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659530;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8hWw5b26mqKqJp1xqnFOgseTDKqkWU7op0vhqlcFJNE=;
	b=c/StjUD8IJav0le3IVc2AmJeErH7fRqT4GqODlrXRGJauTiKukYaBdQQ0Gk5jFxeftih
	 jMgFe/ZlZj7VM7oxccgvJjJ9vTTyNgZg8pyeBHak/iqw6DjG2aUdhAxu9Gl9h+vu68w4X
	 /U5oJJbPF/W1jZ5LgJN/v7om2+5o5t4vfkXq0YZ/0QBrTxnt2ha090yYM2OB+gnl/jlJb
	 HUCn7cTyjyYmdy3LEkG5n6mXMUq4ot974WHc/4Km8mzm0/PxYodoPuxvT6eqt2alAmo6S
	 +VV4S3bZxntNbpX2u4Po4HmuZEbXqF19Nfw/0cXs6k5kWQjzj3k7lbdo4ImVOK2dEsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NEfH1e9P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EDF606A324;
	Mon,  2 Nov 2026 22:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NEfH1e9P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B165B1F00A1A;
	Mon,  2 Nov 2026 22:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793659530;
	bh=8hWw5b26mqKqJp1xqnFOgseTDKqkWU7op0vhqlcFJNE=;
	h=From:To:Cc:Subject:Date;
	b=NEfH1e9PbDq5+zC87ofPcexu0dLJZQorOEw31oyjUcMboCV2Zgen/+FizIa2AtUeT
	 3zdxBlMb74pQT9EazX/51l9ldRpGPyuRyDomqj2MJVp1BYzGui097VKYErpOHsUvTV
	 /xdaIZDmePT6DcuFV8A2zW0nZAjRBZa/OyFwLLXewS5jKWJFot6Tl2YRFb/Cp0NH7n
	 Kd4Cz6qmbgDLFGPbvTOmiN6ePS3RbnjcMGSFaaWeU/O4PYxRHEGbCil1tsw+WihleN
	 NNxTj+zsZQLAIoDeeuV6mJ+/K+vmiZp3kdfqItz/mF42EC9uSdREAZYicqqItskj9l
	 ZyOLY+iXmMrLA==
From: Sasha Levin <sashal@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	devicetree@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] of: reserved_mem: mark the early_memremap() array helpers __init
Date: Mon,  2 Nov 2026 17:45:28 -0500
Message-ID: <20261102224528.2495168-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

early_array_map() and early_array_unmap() wrap early_memremap() and
early_memunmap(), which are __init, but the helpers themselves are only
static inline. If the compiler decides not to inline them, the out of
line copy ends up in .text and modpost complains. clang 21 does this for
a riscv allnoconfig build:

  WARNING: modpost: vmlinux: section mismatch in reference: early_array_map+0x30 (section: .text) -> early_memremap (section: .init.text)
  ERROR: modpost: Section mismatches detected.

Both helpers are only called from fdt_scan_reserved_mem(), which is
__init, so mark them __init too.

Fixes: aa05faf81583 ("of: reserved_mem: allocate and map the reserved_mem array early")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
KernelCI's clang-21 riscv builds fail on this once dt/for-next is
merged, so it will probably show up in tomorrow's linux-next as well.

Tested with a riscv LLVM=1 allnoconfig build (fails at modpost before,
links after), plus W=1 builds of of_reserved_mem.o for riscv and arm64
defconfig with clang, and arm64 defconfig with gcc.

 drivers/of/of_reserved_mem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 0fd1683cba011..630ad65466385 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -66,11 +66,11 @@ static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
  */
 #if defined(CONFIG_GENERIC_EARLY_IOREMAP) && !defined(CONFIG_PPC64)
 #include <asm/early_ioremap.h>
-static inline void *early_array_map(void *array, size_t size)
+static inline void * __init early_array_map(void *array, size_t size)
 {
 	return early_memremap(__pa(array), size);
 }
-static inline void early_array_unmap(void *map, size_t size)
+static inline void __init early_array_unmap(void *map, size_t size)
 {
 	early_memunmap(map, size);
 }
-- 
2.53.0

