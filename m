Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBC072
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 15:42:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68F0761213;
	Tue, 28 Sep 2021 15:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632843727;
	bh=156FKnz/OvVEB3zIN85DJGz9LjSiZjIncr3WzNLycZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FKfmymYE47y6Sg6Ghf8/IhNvskJR1H4pNPwzOuzO9txBryrVYCKVdObwWZToIspGT
	 /ng5bDJ2x0vtRGPoPgCj3NFeiIONiJGLIgGtfTqpJ4FCyHxXKpCvM9XWK191GMPnIo
	 x8HlvEsE3iBPfb3+398Ojwlv9I7zTVwzwEWuJYqMb22KSBLfGU55UqCA7WnFKGy95U
	 54sZG8tui8mtQtM4mm0dSgBb62qUZAikQAja0x2MgPQzwVZXDprKtvhl5ipBGS2g5O
	 tTgS7RtqqXqAUwfFGJB1XIiqiJvUrqSYCXLf52TSh5po+xaDynKaU6XDDUr74b5N4E
	 ykLlR3hUB99Xw==
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	llvm@lists.linux.dev
Subject: [PATCH 04/14] ARM: kprobes: address gcc -Wempty-body warning
Date: Tue, 28 Sep 2021 17:41:33 +0200
Message-Id: <20210928154143.2106903-5-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210928154143.2106903-1-arnd@kernel.org>
References: <20210928154143.2106903-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Building with 'make W=1' shows a warning in some configurations
when 'verbose()' is defined to be empty.

arch/arm/probes/kprobes/test-core.c: In function 'kprobes_test_case_start':
arch/arm/probes/kprobes/test-core.c:1367:26: error: suggest braces around empty body in an 'else' statement [-Werror=empty-body]
 1367 |      current_instruction);
      |                          ^

Change the definition of verbose() to use no_printk(), allowing format
string checking and avoiding the warning.

Link: https://lore.kernel.org/all/20210322114600.3528031-1-arnd@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/probes/kprobes/test-core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/probes/kprobes/test-core.h b/arch/arm/probes/kprobes/test-core.h
index f1d5583e7bbb..56ad3c0aaeea 100644
--- a/arch/arm/probes/kprobes/test-core.h
+++ b/arch/arm/probes/kprobes/test-core.h
@@ -98,7 +98,7 @@ struct test_arg_end {
 #if VERBOSE
 #define verbose(fmt, ...) pr_info(fmt, ##__VA_ARGS__)
 #else
-#define verbose(fmt, ...)
+#define verbose(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
 #endif
 
 #define TEST_GROUP(title)					\
-- 
2.29.2

