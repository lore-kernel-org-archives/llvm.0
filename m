Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2895B72
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 15:42:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BEA061262;
	Tue, 28 Sep 2021 15:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632843736;
	bh=tDbRq5i6qASgBwM/j3ZRVdUHgka0QCfL/gLEW9HmgWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lTK6v1rRFxj2VgIC2rKTFVxSoOcmPksPNC1LBLSYWCv2jjTQqb/0zqhAUXuP5U94G
	 wjLe7bZ+icVeYTXH5a2YWl2rA3w6ZJKkTLW5T5zBkFzlmFq8FEq03u6hgmLelIMJNk
	 n7UkNNv1yyrKlInW7WnYteD9Rrsj8fhb8o6dGduDpwa9DhyetX65VIIOnyIp3aDXyz
	 NtRDTOVIjAKy8LIp476KbNm1g9pdbVnfpzgGikcVmNmUC892phrbttqdiDsHy0LBrV
	 zUNhk0pJnpZVUHngdBv2aFfO2Ak3oN6OAS9C/XtaimU3BWb+QMXW5uwSLPuvdoieVe
	 MWXqDLjASdv+w==
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	llvm@lists.linux.dev,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 08/14] ARM: kprobes: fix arch_init_kprobes() prototype
Date: Tue, 28 Sep 2021 17:41:37 +0200
Message-Id: <20210928154143.2106903-9-arnd@kernel.org>
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

With extra warnings enabled, gcc complains about this function
definition:

arch/arm/probes/kprobes/core.c: In function 'arch_init_kprobes':
arch/arm/probes/kprobes/core.c:465:12: warning: old-style function definition [-Wold-style-definition]
  465 | int __init arch_init_kprobes()

Fixes: 24ba613c9d6c ("ARM kprobes: core code")
Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
Link: https://lore.kernel.org/all/20201027093057.c685a14b386acacb3c449e3d@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/probes/kprobes/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/probes/kprobes/core.c b/arch/arm/probes/kprobes/core.c
index 27e0af78e88b..9d8634e2f12f 100644
--- a/arch/arm/probes/kprobes/core.c
+++ b/arch/arm/probes/kprobes/core.c
@@ -439,7 +439,7 @@ static struct undef_hook kprobes_arm_break_hook = {
 
 #endif /* !CONFIG_THUMB2_KERNEL */
 
-int __init arch_init_kprobes()
+int __init arch_init_kprobes(void)
 {
 	arm_probes_decode_init();
 #ifdef CONFIG_THUMB2_KERNEL
-- 
2.29.2

