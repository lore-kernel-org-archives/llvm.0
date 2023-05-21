Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF60D10E8
	for <llvm@lists.linux.dev>; Sun, 21 May 2023 09:36:53 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1684661804;
	bh=OtZaR9VeuPmOojjtUgQSBdMGO5O2wKJgryXGtmTqRzI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qhrhQOOMS89DvZWNK5Af0kDzvUeY+vJnHje0Yv/lqShv8qVQxvPu7lLqOxLdaHDbb
	 yg7wwTACqQ699CQiFqiHYVuIpHZfQMKuNwT2AyogjeH4mqTU1vmIvrxFgkdbLkNxF/
	 nsk2legjwR2ozCkPxi3xQjS0XL+LYgRhmOHn0l14=
Date: Sun, 21 May 2023 11:36:35 +0200
Subject: [PATCH 7/7] tools/nolibc: simplify stackprotector compiler flags
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230521-nolibc-automatic-stack-protector-v1-7-dad6c80c51c1@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684661802; l=1698;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=OtZaR9VeuPmOojjtUgQSBdMGO5O2wKJgryXGtmTqRzI=;
 b=DomoIsmXsRZwQWk0ScmwjLFDuu1dnN26YCXUzo34GqOdYuAtwSgkUrabKkFdr4rSI27UuPoCc
 06iKjlgljDsC3ma9RvH/A7hClYqSQSwPisv/goaAeqLfKemkx+wOWfn
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that nolibc enable stackprotector support automatically when the
compiler enables it we only have to get the -fstack-protector flags
correct.

The cc-options are structured so that -fstack-protector-all is only
enabled if -mstack-protector=guard works, as that is the only mode
supported by nolibc.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/nolibc/Makefile | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index bd41102ea299..445c352b1b33 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -76,20 +76,11 @@ else
 Q=@
 endif
 
-CFLAGS_STACKPROTECTOR = -DNOLIBC_STACKPROTECTOR \
-			$(call cc-option,-mstack-protector-guard=global) \
-			$(call cc-option,-fstack-protector-all)
-CFLAGS_STKP_i386 = $(CFLAGS_STACKPROTECTOR)
-CFLAGS_STKP_x86_64 = $(CFLAGS_STACKPROTECTOR)
-CFLAGS_STKP_x86 = $(CFLAGS_STACKPROTECTOR)
-CFLAGS_STKP_arm64 = $(CFLAGS_STACKPROTECTOR)
-CFLAGS_STKP_arm = $(CFLAGS_STACKPROTECTOR)
-CFLAGS_STKP_mips = $(CFLAGS_STACKPROTECTOR)
-CFLAGS_STKP_riscv = $(CFLAGS_STACKPROTECTOR)
-CFLAGS_STKP_loongarch = $(CFLAGS_STACKPROTECTOR)
+CFLAGS_STACKPROTECTOR = $(call cc-option,-mstack-protector-guard=global -fstack-protector-all)
 CFLAGS_s390 = -m64
 CFLAGS  ?= -Os -fno-ident -fno-asynchronous-unwind-tables -std=c89 \
 		$(call cc-option,-fno-stack-protector) \
+		$(call cc-option,-mstack-protector-guard=global $(call cc-option,-fstack-protector-all)) \
 		$(CFLAGS_STKP_$(ARCH)) $(CFLAGS_$(ARCH))
 LDFLAGS := -s
 

-- 
2.40.1

