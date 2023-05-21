Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF0B111A
	for <llvm@lists.linux.dev>; Sun, 21 May 2023 09:43:13 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1684661803;
	bh=lj2geLr/EdywhNVRdZihjVutdtlzdrTLYrnqWuCaRHI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cFDVWF4VRJK30uYLVDvSQLOKcqHfOapaHKy+uCiYEHV8joFGCP1VNLTw5YTPsrZdu
	 tKcAKkoYbj7IucjFJRilU2Xdy+lRiSR3cTBsitu86G2g61qPlvLRSWYVEYyWSjooCV
	 85iXyDnx1wO3gM4uzxU1VGrjVCV4siMhkPC8TJwY=
Date: Sun, 21 May 2023 11:36:30 +0200
Subject: [PATCH 2/7] tools/nolibc: x86_64: disable stack protector for
 _start
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230521-nolibc-automatic-stack-protector-v1-2-dad6c80c51c1@weissschuh.net>
References: <20230521-nolibc-automatic-stack-protector-v1-0-dad6c80c51c1@weissschuh.net>
In-Reply-To: <20230521-nolibc-automatic-stack-protector-v1-0-dad6c80c51c1@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684661802; l=1079;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=lj2geLr/EdywhNVRdZihjVutdtlzdrTLYrnqWuCaRHI=;
 b=JVbhHarzeBvvcx5vDuAxt69sG68MA2ijZHbow7ctpQ1HKfKs70ByaOsPMJGeyj+rVqnfqQVyk
 1O4/8Fg7pOIBbY4WpL5JP7Mj+mvvpxTiEIflujBujsb3if9KDfDQVZN
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

This was forgotten in the original submission.

It is unknown why it worked for x86_64 on some compiler without this
attribute.

Reported-by: Willy Tarreau <w@1wt.eu>
Closes: https://lore.kernel.org/lkml/20230520133237.GA27501@1wt.eu/
Fixes: 0d8c461adbc4 ("tools/nolibc: x86_64: add stackprotector support")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/arch-x86_64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/arch-x86_64.h b/tools/include/nolibc/arch-x86_64.h
index d98f6c89d143..e201af15e142 100644
--- a/tools/include/nolibc/arch-x86_64.h
+++ b/tools/include/nolibc/arch-x86_64.h
@@ -190,7 +190,7 @@ const unsigned long *_auxv __attribute__((weak));
  * 2) The deepest stack frame should be zero (the %rbp).
  *
  */
-void __attribute__((weak,noreturn,optimize("omit-frame-pointer"))) _start(void)
+void __attribute__((weak,noreturn,optimize("omit-frame-pointer"),no_stack_protector)) _start(void)
 {
 	__asm__ volatile (
 #ifdef NOLIBC_STACKPROTECTOR

-- 
2.40.1

