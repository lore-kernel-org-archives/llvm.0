Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA002877E2
	for <llvm@lists.linux.dev>; Sat, 19 Jul 2025 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752939538; cv=none; b=D4JNhXIraMZiRbYLD7JSc5gYmHcpiMpn73t8uLoo4tGKFsohiF/0fYBppZTII96DNoSzE3GCBDdTeERrgwBh3jegcpVdd1lYlI7F64yqN/fClKMO6ITYvLnPpVShh8iVZBH/FqosztqJdiSuQkMo4qvsAhtn2J0LmdsDKiBMOX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752939538; c=relaxed/simple;
	bh=51GkrVrQpjPfvvJr3LapBWVH8+FIFYkaT062gxrS96I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mL15WPVKve0ECDlkA4mHqe6GOTYi77AkpJezBc7Zz/Aum454EGqqh3w5sklbAge6thpvKyx6Dve4TdiCYBIKDFK6uLhji35xl+py3ByTou1xOi8S81NlzyqfWAB6T40KLRnLEWbR2H09ykqFvlgf0v0EwwWOi3PAVG5RZAxMEUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=WVtI9GZY; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="WVtI9GZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1752939526;
	bh=51GkrVrQpjPfvvJr3LapBWVH8+FIFYkaT062gxrS96I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WVtI9GZYhsNpCZV/Cgg8eE7tgSuYjabUaW6lyLIS/v92QbaJFV/2FNnvHDrYwVkcG
	 yioU/3HcMnzGsIlaxW40bBR30+/9sb1nICi21tzsXtVhqxEns2advXeQ/9zQHxUgEN
	 OFkdfjRGZDztG3XLAgZsqrV9B04a2ZuC/j/q0VFQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 19 Jul 2025 17:38:29 +0200
Subject: [PATCH 3/3] selftests/nolibc: always compile the kernel with GCC
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250719-nolibc-llvm-system-v1-3-1730216ce171@weissschuh.net>
References: <20250719-nolibc-llvm-system-v1-0-1730216ce171@weissschuh.net>
In-Reply-To: <20250719-nolibc-llvm-system-v1-0-1730216ce171@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752939526; l=1288;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=51GkrVrQpjPfvvJr3LapBWVH8+FIFYkaT062gxrS96I=;
 b=BRqqIxDJNQdSvuWhzuAvv++iXFFsb1KwrMKiT8bWI8nXvZwVhxwcGPJOIn8Ry8DkCynnALEcu
 rwqRwA6kxhDBHkv+uuQnvLcytH6hZ3eskUoIYw4adK3VZ0jFevyjRNi
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

LLVM/clang can not build the kernel for all architectures supported by
nolibc. The current setup uses the same compiler to build the kernel as
is used for nolibc-test. This prevents using the full qemu-system tests
for LLVM builds.

Instead always build the kernel with GCC. For the nolibc testsuite the
kernel does not need to be built with LLVM.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/nolibc/Makefile.nolibc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nolibc/Makefile.nolibc b/tools/testing/selftests/nolibc/Makefile.nolibc
index 6e6dddaa2e3ed56886cd76c423297648d13027c7..3d8e314c2433a2d032cf4f58ea1d6a2f430faaae 100644
--- a/tools/testing/selftests/nolibc/Makefile.nolibc
+++ b/tools/testing/selftests/nolibc/Makefile.nolibc
@@ -263,7 +263,7 @@ REPORT  ?= awk '/\[OK\][\r]*$$/{p++} /\[FAIL\][\r]*$$/{if (!f) printf("\n"); f++
 		printf("\nSee all results in %s\n", ARGV[1]); }'
 
 # Execute the toplevel kernel Makefile
-KBUILD_MAKE = $(MAKE) -C $(srctree) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE)
+KBUILD_MAKE = $(MAKE) -C $(srctree) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) LLVM=
 
 help:
 	@echo "Supported targets under selftests/nolibc:"

-- 
2.50.1

