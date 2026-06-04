Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F953D47B1
	for <llvm@lists.linux.dev>; Thu,  4 Jun 2026 06:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780553002; cv=none; b=sHUclgS5v62ZA9jwUQU9X33BSzxyWJjVHJIuh5JGueWOYtrLnjlu3J43mIACK90mQzMdMvpJUz479Ah4lPPAdR0FcGsQHlzwcfVCg66+ih5w593C9iTxYdtVbNR7wD/9XTJ53hYKyz8GI6FlxKQ81vo5N3U0ywcg5VBtbp0kE3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780553002; c=relaxed/simple;
	bh=+yYSQP6LeZMc3ZffWozLVmprMPp6mtXwffsPe9XTOBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hJWVYp3h5wi2AsMo7635T9kntaYs2+fH1srKHjoanzrw9vlAEX2RoztYWofcZHw1UYL0r648Y1lzrCTSW6lv7yf7heKNhSkF8uiMVBj1MnYPX+0FaxlTGGCGry3kgiNl7uAjAsqcitGHZJExKIflXu7dt1RxsEkrWvNiR9q8VCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=KN/DqLcD; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="KN/DqLcD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780552997;
	bh=uYEiIKeZO3aBG6XlpnCb3l6B+MiZrhwTf4twZWvkiSs=;
	h=From:Date:Subject:To:Cc;
	b=KN/DqLcDkU/Rjufk/YE7UVnQw/ZcbgNtD2SElb5OoQwo7RpFQL2r0dLXXXHym7FP8
	 Qsd6OKHxo6G6WbgblhpUDykuunowPUy9u/6qEjZqYHxvMNkG033pOSRW7ukv/BXKop
	 Ekjo4anxXwgshrwVbAnxwEC7yatBuu+xsLL2QYIWhgpkTpAz4BOolNTee0y9qQYNNy
	 z74EsqIbbC0GaDLCU1+gXyOZ8nbaOY6LWJ9EkhaEgH8SrKIW8ful30MKwu4F5jwH9V
	 OKn/1xshC6gZG5LPlbRoBQsuXYAGP468hfwn3H/WUH33Kd6bmiyd2fKZ9BGuFeWSKO
	 PFNS/g54+F/pA==
Received: by codeconstruct.com.au (Postfix, from userid 10004)
	id 4003A605A0; Thu,  4 Jun 2026 14:03:17 +0800 (AWST)
From: James Lee <james@codeconstruct.com.au>
Date: Thu, 04 Jun 2026 14:03:00 +0800
Subject: [PATCH] modpost: Add __llvm_covfun and __llvm_covmap to
 section_white_list
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-dev-coverage-patch-v1-1-9f9368253cb4@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIABMVIWoC/x2MQQqAIBAAvxJ7TtBNCvpKdDBday8aGhKIf086D
 sNMhUyJKcM6VEhUOHMMHdQ4gL1MOEmw6wwocZaz1MJRETYWSqa72zz2EseCk5YKvVIOengn8vz
 +021v7QNvH2eXZAAAAA==
X-Change-ID: 20260604-dev-coverage-patch-b7234012f11d
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, James Lee <james@codeconstruct.com.au>
X-Mailer: b4 0.14.2

Modpost emits hundreds of warnings when using Clang to build for ARCH=um
and CONFIG_GCOV=y. e.g.:
    vmlinux (__llvm_covfun): unexpected non-allocatable section.
    Did you forget to use "ax"/"aw" in a .S file?
    Note that for example <linux/init.h> contains
    section definitions for use in .S files.

For example, when we use LLVM for a kunit user mode build with coverage:
    python3 tools/testing/kunit/kunit.py build --make_options LLVM=1 \
        --kunitconfig=tools/testing/kunit/configs/default.config \
        --kunitconfig=tools/testing/kunit/configs/coverage_uml.config

The behaviour occurs when building the kernel for ARCH=um with code
coverage enabled. The warnings come from modpost's check_sec_ref
function, which ensures no sections reference others that will be
discarded. covfun and covmap sections must reference __init and __exit
sections to collect coverage data, triggering the modpost warning.

To suppress these warnings, these section names have been added to
modpost's whitelist. This is unlikely to suppress legitimate warnings as
Clang will only insert these sections when building with coverage, and
can be assumed to manage these references safely.

Signed-off-by: James Lee <james@codeconstruct.com.au>
---
Unsure if there are Clang options that might better suppress this.
Certainly open to other options if they're available.
---
 scripts/mod/modpost.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index be89921d60b61d1db0398313aeb00bc1888843b1..287b7d67747dfe215640a4f8ec615519e9699921 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -749,6 +749,8 @@ static const char *const section_white_list[] =
 	".gnu.lto*",
 	".discard.*",
 	".llvm.call-graph-profile",	/* call graph */
+	"__llvm_covfun",
+	"__llvm_covmap",
 	NULL
 };
 

---
base-commit: d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3
change-id: 20260604-dev-coverage-patch-b7234012f11d

Best regards,
-- 
James Lee <james@codeconstruct.com.au>

