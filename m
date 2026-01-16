Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FBB1E7C34;
	Fri, 16 Jan 2026 16:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580835; cv=none; b=SQUfgCLXida/Rwcfg2sx3dqr5ZXbdpL6mQVCEuq3G/as0fWy+b2LCRm1VoFvcMSG9PP/KINoRjeWfICzcYXvj8MrEQIpqteNy/UVanAWoDWqcw1HORdtUsAu4cPUrWzA9QTsUWwUndjSBurfzef5+8nv6e0RP2yZ87YZmDcWPIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580835; c=relaxed/simple;
	bh=3KTJe3jbXHBaAmS9g+Po8i7QjAbcgTnJ1GzsaORRklY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=F/QKwGmh2WQJhhzxy3rsmu+HHDDD2Sr46RLuQ/xKWs6OiwFX3CvlbUGOQ9DgdKwHVzXZTO0agC/aG+UJR8HcInovwjR6Y8sI/MuLqyRRP6lrxG2K6brKGfwMv1bAgYtt+LbJ2+JuERi3vpEtNYlTwijJOIQQWtveM8msmgu125s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8wj8Myd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8wj8Myd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F70C116C6;
	Fri, 16 Jan 2026 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768580834;
	bh=3KTJe3jbXHBaAmS9g+Po8i7QjAbcgTnJ1GzsaORRklY=;
	h=From:Date:Subject:To:Cc:From;
	b=n8wj8MydAhQ1P4c7ZTS6T1XxVV9kW/EoMXHK5vSjg8PTo+KufdIVF15aSf42nXWA4
	 e7xj+IpkvMvS1OpzkdAA1wbSVGFpDrjSMgJa1Mwspp0f0T3djYvg24mEFtXWzpqQCn
	 fg+Wex6WU1cZW6cYevH0uv0JyV4dyGTfaotGurRHGN/MhLNcphl6gECEhweaf+By9H
	 tuxTqA8EDrC+91oLy1bpcsYz/Y2ULBOTXVkj+0x+w6X/QH1Qm0W+EasGNTWcH2MnXR
	 9ACov/lhcYRbWaSc3lwct63D9WmRsx8ai+vUrF1qFgwchja4BB8eTM7hoIuN15j1GP
	 a+kT1yG1l+YpA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 16 Jan 2026 11:27:03 -0500
Subject: [PATCH v2] printf: convert test_hashed into macro
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-printf-kunit-printf-attr-v2-1-3dd7fefc3207@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBREr0L+2pq2BgRX3sOwgNLCV2lJWxoN6
 d1tMe7NrF4yM28DJy1KB5diAysDOjQ6AT8UIKZOj5LgkBg45SXjtCKLRe0Veawa/Q867y1hzal
 qlCjPvaKQ5ouVCl/79a39slv7uxQ+/+XGhM4b+97dgeXeH5rASEpV85rWfckGeh3nDp9HYWZoY
 4wfU5jMndIAAAA=
X-Change-ID: 20251206-printf-kunit-printf-attr-19369fc57bf0
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
 oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev, 
 kernel test robot <lkp@intel.com>, Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1768580833; l=2018;
 i=tamird@kernel.org; h=from:subject:message-id;
 bh=3KTJe3jbXHBaAmS9g+Po8i7QjAbcgTnJ1GzsaORRklY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO2334r4j/NtvWq6LPvTMOk/FvFaCb/fC+Y7p+pNx/4eYml+dmXVZIlr72sT60CJhpxqrgfftE2
 PCV9otCZzcQk=
X-Developer-Key: i=tamird@kernel.org; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

This allows the compiler to check the arguments against the __printf
attribute on __test. This produces better diagnostics when incorrect
inputs are passed.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512061600.89CKQ3ag-lkp@intel.com/
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
Changes in v2:
- Convert test_hashed to macro rather than try to annotate it in a way
  that is compatible with both clang and gcc.
- Link to v1: https://patch.msgid.link/20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com
---
 lib/tests/printf_kunit.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
index 7617e5b8b02c..1d96cea8af65 100644
--- a/lib/tests/printf_kunit.c
+++ b/lib/tests/printf_kunit.c
@@ -266,15 +266,17 @@ hash_pointer(struct kunit *kunittest)
 	KUNIT_EXPECT_MEMNEQ(kunittest, buf, PTR_STR, PTR_WIDTH);
 }
 
-static void
-test_hashed(struct kunit *kunittest, const char *fmt, const void *p)
-{
-	char buf[PLAIN_BUF_SIZE];
-
-	plain_hash_to_buffer(kunittest, p, buf, PLAIN_BUF_SIZE);
-
-	test(buf, fmt, p);
-}
+/*
+ * This is a macro so that the compiler can compare its arguments to the
+ * __printf attribute on __test. This cannot be a function with a __printf
+ * attribute because GCC requires __printf functions to be variadic.
+ */
+#define test_hashed(kunittest, fmt, p)                                   \
+	do {                                                             \
+		char buf[PLAIN_BUF_SIZE];                                \
+		plain_hash_to_buffer(kunittest, p, buf, PLAIN_BUF_SIZE); \
+		test(buf, fmt, p);                                       \
+	} while (0)
 
 /*
  * NULL pointers aren't hashed.

---
base-commit: 983d014aafb14ee5e4915465bf8948e8f3a723b5
change-id: 20251206-printf-kunit-printf-attr-19369fc57bf0

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

