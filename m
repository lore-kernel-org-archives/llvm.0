Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A51109
	for <llvm@lists.linux.dev>; Sun, 21 May 2023 09:36:53 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1684661803;
	bh=KkdsW9VXfNNBI6sP0ntlx33DPNCyB2uOxDEqiGEf2wU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RdpfqaQoyGQXLZ4oSh4gSS+fa4ntLUJSJ+BTBwKdA+ZohbITgg7DP4w6h/Rvnfq5R
	 Lqo4qICVTQGNvwcYUitfO7CRTCoMDHx64OoX/jV66bQOrbJAPUmtIZAXOe8dJtAvP1
	 LFr5kgG6Vu554SvJ2nNgIFHASIJgCCWujtCD4Ak8=
Date: Sun, 21 May 2023 11:36:33 +0200
Subject: [PATCH 5/7] tools/nolibc: reformat list of headers to be installed
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230521-nolibc-automatic-stack-protector-v1-5-dad6c80c51c1@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684661802; l=1064;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=KkdsW9VXfNNBI6sP0ntlx33DPNCyB2uOxDEqiGEf2wU=;
 b=HmqDEXUj86k+sCTx7kSFyyZmSkwOFjknXc2XT/iZXgF9ShYYJ+3e3o9ak9JftRvYgatJUZAZ9
 erlY0GjTc2QCCoJU5J7KOTchwQ0j6e0q00Qivlm5cdviCW8McaI2uSo
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

This makes it easier to add and remove more entries in the future
without creating spurious diff hunks.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/Makefile | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 9839feafd38a..e37c3ac86e23 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -25,8 +25,22 @@ endif
 
 nolibc_arch := $(patsubst arm64,aarch64,$(ARCH))
 arch_file := arch-$(nolibc_arch).h
-all_files := ctype.h errno.h nolibc.h signal.h stackprotector.h std.h stdint.h \
-             stdio.h stdlib.h string.h sys.h time.h types.h unistd.h
+all_files := \
+		ctype.h \
+		errno.h \
+		nolibc.h \
+		signal.h \
+		stackprotector.h \
+		std.h \
+		stdint.h \
+		stdlib.h \
+		string.h \
+		sys.h \
+		time.h \
+		types.h \
+		unistd.h \
+		stdio.h \
+
 
 # install all headers needed to support a bare-metal compiler
 all: headers

-- 
2.40.1

