Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A9F315D53
	for <llvm@lists.linux.dev>; Mon, 12 Jan 2026 06:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768200244; cv=none; b=BB0z3vbWDOV12n1nCMR4KmDktd/VlPW0/Ktwo0jjOp7B4z4fDH5ommw0X8rjEl3apTZKYRkdCCRHDVhBLMzGvuno/3XexZVDpK0lbfvPupW6U4DB53SV2yBht8vWJjlwB+gsQWJClzUM28oP/kPjP+iExQVBbVP5h3Qy7jDx3wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768200244; c=relaxed/simple;
	bh=E6o6SdP51AFFLb1ppQSdkahvWHsXfMXww8e/aPSyd94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kvZLlHSbtsm5ecuFwyL8SvyICpeyp/1kKaETroDBhD+W6Jc2/OBrFkeo7jWrUawYEtzKEa0uUSYaxPdClJhj4fDmapqAerquHF0IS+X39sA0RNQL3IIIFoNfNVfVAh7oIKkq53d0cPH8s2BYYPXU1AFsSOCheYP1BN155L+uFlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=A69xnhlF; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="A69xnhlF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768200234;
	bh=E6o6SdP51AFFLb1ppQSdkahvWHsXfMXww8e/aPSyd94=;
	h=From:Date:Subject:To:Cc:From;
	b=A69xnhlFWHcyE+Zk8p4a9Od3+9N0XZKOytnqXFtEIczT1G00bnjykMOc4mhroGQSx
	 38W12uqwjT6/F5Y4O3W4T35zDisNeJtsWxEKBHoAFg5kIPtR7xW2tqUib/VvQD1l5m
	 cuXEAeR1b02hkHfPMDn2uQYJShQEOoK42VRWBoPw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 12 Jan 2026 07:43:52 +0100
Subject: [PATCH] kbuild: Reject unexpected values for LLVM=
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260112-kbuild-llvm-arg-v1-1-8e9bbdae996f@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0ND3eyk0sycFN2cnLJc3cSidN1kc2MTs0STNKMk40QloK6CotS0zAq
 widGxtbUAcCaO7mEAAAA=
X-Change-ID: 20260111-kbuild-llvm-arg-c7346a4f2b3a
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768200234; l=1123;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=E6o6SdP51AFFLb1ppQSdkahvWHsXfMXww8e/aPSyd94=;
 b=KWmaKuyzWxEUYt9keqXzS09/mO73ym+aK1579eE771u2P40K2QyxALwbaXHKkNdZjT2mhH4fP
 1z6YndeskRqCg11e558LpGrUVF0DTCajYfFfX6xkSCyEp2QR0Xr49qZ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The LLVM argument is documented to accept one of three forms:
* a literal '1' to use the default 'clang',
* a toolchain prefix path, ending in a trailing '/',
* a version suffix.

All other values are silently treated as '1'. If for example
the user accidentally forgets the trailing '/' of a toolchain prefix,
kbuild will unexpectedly and silently fall back to the system toolchain.

Instead report an error if the user specified an invalid value for LLVM.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index e404e4767944..2a085a1b6875 100644
--- a/Makefile
+++ b/Makefile
@@ -447,6 +447,8 @@ ifneq ($(filter %/,$(LLVM)),)
 LLVM_PREFIX := $(LLVM)
 else ifneq ($(filter -%,$(LLVM)),)
 LLVM_SUFFIX := $(LLVM)
+else ifneq ($(LLVM),1)
+$(error Invalid value for LLVM=)
 endif
 
 HOSTCC	= $(LLVM_PREFIX)clang$(LLVM_SUFFIX)

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260111-kbuild-llvm-arg-c7346a4f2b3a

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

