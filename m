Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642DB221282
	for <llvm@lists.linux.dev>; Fri, 11 Apr 2025 10:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369057; cv=none; b=J6ArpU3wfnds821vjASqLg45VuzjGREB+vSAA29mank2mT67bzLHeISGUmiNgQO36bZz/yDxF8eoEAHjPmj/bTtSvSSgr/DHWjUrtPy+Z705Z4yV//jY89PpOVj1x33OsXLU+TIq1cBPAdn8aDDl+XruC2LcpteUjmLkpb3oAxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369057; c=relaxed/simple;
	bh=KV7838qVuJFvwP0GE1fI+kpv6Rs/f7TnldAdDLmDYlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V0xZX1sLls2RqQJI4pF4+i9cB085a1+mj8w6xxGH7wm5BD3G1cwQWrMCp45M6Hs5srzrIei8HCHFnTHrO2Bxx4Pg+KGcye9dFfAMrAupu0QQX2VEtG9W70tG+2HGZ42/9wd9hc3ZYUaNxo8VEKxMwX/eTNTeTCUBMOViWg1MTzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=iFX/Q4WO; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="iFX/Q4WO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744369011;
	bh=XD6rEhxQqjvTOqUCfuE2USI2iV6mhbN96PZIywkA7yY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=iFX/Q4WOy2YYqQpXu0AFKcwCEQCMkkdYqlE5sK2U++7k414RPYq81Oplqwe5MkyJi
	 2st1lt3svS4S6OHK3hCZCa72vF2CiZXdg0OUA86HGjwrzwB4ip2R5nFTVWzk4RlBWn
	 Qgu8eI9jNHKEqTSdKIaFF5PfetfAbIGqJNas/LEs=
X-QQ-mid: bizesmtp23t1744368979t8c6ba75
X-QQ-Originating-IP: hyEvcGxRx4R8ga2tMqHGxAY7PKJA9kC//8bMj+yDfx8=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Apr 2025 18:56:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5292152857670839937
EX-QQ-RecipientCnt: 14
From: Chen Linxuan <chenlinxuan@uniontech.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Winston Wen <wentao@uniontech.com>,
	Changbin Du <changbin.du@gmail.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [RFC PATCH 7/7] lib/Kconfig.debug: introduce CONFIG_NO_AUTO_INLINE
Date: Fri, 11 Apr 2025 18:54:55 +0800
Message-ID: <69F64A6F8DE504F5+20250411105459.90782-7-chenlinxuan@uniontech.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250411105459.90782-1-chenlinxuan@uniontech.com>
References: <31F42D8141CDD2D0+20250411105142.89296-1-chenlinxuan@uniontech.com>
 <20250411105459.90782-1-chenlinxuan@uniontech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: M6I+dON63j22E0s7K5ul/m42Jm4TY9NO309evGG0ejKHFzZEwKmPcuU1
	+Cx8sUrd+rj5fjh5ygTZjNAOld7cpn8FszZ909UwKnW5PvdZhy8O7BqQWrxYzxSweWbBFx5
	ChbGn8zXoiu12H4MvFI/r5VMuOzxjTq7zveMY4+Jmf8vuR81SLDyRN8x1mv3vZOxUY1eeUu
	ZNgE1Js7HiY2bv4kn/6NuWV3V9W8Q+0QVlSZdqCa6EeGGFQKb8ew/j2noTaw2xqoofDdYZv
	9/kFsdQOtAMIOCsDsoWbjJte/daTfOeCQVITYF2gUS2hkRklc64lS6oc9yzuIKP4BIoMP1d
	7rLoPQbvwuF6jdsAjPe1FZynKqqrW4ejdkyvUGCMhSv9MEGTTi4+Vjib6j+Cwp3CVyeuXne
	YweBWjenwmxLPMQuJ+hnpONagckj3DJwuxAYRSLLKR47ctKCma8KzN/XgpfG5ppO2b5lvYC
	Ouh5hooN4tK+xAgwe7GwubqAWhdH/MMjCbBK2DWFwKjcgxY0QPn0FLU6bAIfEhYSC8FB+mk
	yJgqVAVgaukNUJEnQ/UyOO0aFxNMCsvDEIJ2NpoQwN7HeiYRSvU8/zBN6CPIPmw8gV1fSlL
	ejCw1gFX9IZj2x8aTwKESbaPMZ44Dzo+UgSrD7TpVz0O9TIpYrWBGrSg+ewP//kk1/kU19F
	Ky3Oe1547qv/pGyEAOt0UdcYFf0f4nz2skAll2mbX1RWTaUq9MKYuqJnWDUS3FI5nrOU0h7
	MYe7az0kCd3OpsIzbZCyM0LjgBC+DVPYnLyoWjR1Nzp0/STb8Zs24Bta2pvhPsFM0shK4tW
	GNb1oAmWpwgRpB2fgGm+BVgoamPP/A9wnvlb35jmX9OgRTb+OASGYUOzfXzL3F6y8PTLnS4
	VxOrNh60NuyuNhdJ214JNEFBcMVJnsOqtXbHF67rvnHqhDZt84yeYOM8ru76niAtLAWAxI4
	fA7zJDO9LL+U46RXKxKRx8eUj9fgK1Zz4GUnwSldbVllHAis6VNq9f2cWBdNfZK6UtM8kST
	ovTA2rlEe8nEhDLRrP
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

From: Winston Wen <wentao@uniontech.com>

Add a new kernel hacking option CONFIG_NO_AUTO_INLINE that prevents the
compiler from auto-inlining functions not explicitly marked with the
'inline' keyword.

This enhancement improves function tracer capabilities as it can only
trace functions that haven't been inlined by the compiler.

Previous discussions:
Link: https://lore.kernel.org/all/20181028130945.23581-3-changbin.du@gmail.com/

This patch is modified from 917fad29febd ("kernel hacking: add a config
option to disable compiler auto-inlining") which can be founded in
linux-next-history:
Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next-history.git/commit/?id=917fad29febd

Unlike the original implementation, this patch:

1. Make it depends on CC_IS_GCC,
   as Clang 18.1.3 break test_bitmap_const_eval() in lib/test_bitmap.c

2. Make it depends on X86_64,
   as I haven't test other architectures

3. Removes unnecessary cc-option checks per 7d73c3e9c514 ("Makefile:
   remove stale cc-option checks").

4. Update help information.

Cc: Changbin Du <changbin.du@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Winston Wen <wentao@uniontech.com>
Co-Developed-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
---
 Makefile          |  6 ++++++
 lib/Kconfig.debug | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/Makefile b/Makefile
index f42418556507..0a9bf33ce75f 100644
--- a/Makefile
+++ b/Makefile
@@ -1071,6 +1071,12 @@ endif
 # Ensure compilers do not transform certain loops into calls to wcslen()
 KBUILD_CFLAGS += -fno-builtin-wcslen
 
+ifdef CONFIG_NO_AUTO_INLINE
+KBUILD_CFLAGS   += -fno-inline-functions \
+		   -fno-inline-small-functions \
+		   -fno-inline-functions-called-once
+endif
+
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
 KBUILD_CPPFLAGS += $(call cc-option,-ffile-prefix-map=$(srcroot)/=)
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 9fe4d8dfe578..2ebb4802886a 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -436,8 +436,23 @@ config GDB_SCRIPTS
 	  instance. See Documentation/process/debugging/gdb-kernel-debugging.rst
 	  for further details.
 
+
 endif # DEBUG_INFO
 
+config NO_AUTO_INLINE
+	bool "Disable compiler auto-inline optimizations (EXPERIMENTAL)"
+	default n
+	depends on CC_IS_GCC && (X86 || LOONGARCH)
+	help
+	  This will prevent the compiler from optimizing the kernel by
+	  auto-inlining functions not marked with the inline keyword.
+	  With this option, only functions explicitly marked with
+	  "inline" will be inlined. This will allow the function tracer
+	  to trace more functions because it only traces functions that
+	  the compiler has not inlined.
+
+	  If unsure, select N.
+
 config FRAME_WARN
 	int "Warn for stack frames larger than"
 	range 0 8192
-- 
2.48.1

