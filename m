Received: from mail-oo1-f74.google.com (mail-oo1-f74.google.com [209.85.161.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E1F7E792
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 00:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774915760; cv=none; b=UZ5BbTNree/DF99EOnz989izLhkS1wMO6k4xEaPoAsCmFFs2wPTgwD51uTmomjyzQg4uux8Mf4sazHIcHbklZSXsx3+Vzv8cJdVFsiy7zNpgNd00pegIBOfDWSoR0JgmnHJd60IHbqrwBDOE+UUbdpLVJyce5BBbUOUe465q6XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774915760; c=relaxed/simple;
	bh=0zzJj5XbJZNH/JIAf3ERvtI4s2NzTsyvLe8QvhS7z1I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=tTmGGJl7RhFLh7Q66Ou4Ul/LsY1HQZxf36dOF/7EQDJtgEJlUfqifPpnh0Ku4jv9r27Vl4A5VNyrFvcpsYZBNblDl/3phdvzD7z8554JnBtxagLYVSDHsAl11txDy4sGPC0lKL0tCHrF4yKqmxlRylQvOLTkNKaR+ejplH33xTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cpZDp6+a; arc=none smtp.client-ip=209.85.161.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cpZDp6+a"
Received: by mail-oo1-f74.google.com with SMTP id 006d021491bc7-67df8dd0e26so9432879eaf.1
        for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 17:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774915758; x=1775520558; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Biv+L7zDH8OWARKW4shGacT9EOL/EfELU3DWE4aGIX0=;
        b=cpZDp6+ad3WEk87knrl3UuFoRWKLmpEHB49qpNP1J70VcSNqOsH4OBlNCe7e68J3+6
         RfcVbeyrssT5TlINw+5ksauMkTCQzB7tymMIAzZ+HPqAwRCQqmVpGTIKdQFhhOf1gab2
         GQKsHlGcL7PWy++SrTFka3dN2vB6FNAYdw83FDgCVMTgNd7Gipg+D+n04+m+lldTYazP
         Acky3qY17ZMXQtvBfHlILUYKUcYpGtHH2hi1j0VQS1lqfgwge7Sq5Unu9/8vLpykgrxB
         81OEUucMbWItGb+/YmmfxVkSovhvyzeaVtvHl7kMXQIE+q26HPwT2/UhV3Uk6f/iRtmJ
         hWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774915758; x=1775520558;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Biv+L7zDH8OWARKW4shGacT9EOL/EfELU3DWE4aGIX0=;
        b=M03RZPiGauTZ7QtZcB6MfDRyvZQiHKmrHfhutpbGPADZJiNp97Qcx3HvhcI/fjM5Tv
         DWbdhMrO3Zo8I6z7AVvUSrncGMVOKuNgw2QSPHJYFKcPBCuZawIyUUKT+K7Zto9z9xfy
         nhxgaFYUeqtiYrlxhyq4z3CblBXq0DmJfXzPbQahvY04rh1egOJo4vy8QO/fSr5V71+i
         ZsBgtUS202/KudUPKiCCsTi0SeooX79jQ2tiwSUbfZcsG3yHOvyfa86fgd/dkkgV/UcA
         L2UiiCB8BFgNEMXvW2dnna70hmPhCw5lkwMcH8DAk4qFyArFim0zdcTsQYkgBbL1YKbq
         Fa5w==
X-Forwarded-Encrypted: i=1; AJvYcCWzRX7LJMp3dvsajZQaMhR11DRyCAKH3tfEXx5Bg/Yvy9GmXGgjc7M2Vhjf66n1zTgWgb1p@lists.linux.dev
X-Gm-Message-State: AOJu0YyM2QOF0he418LSLp9VzOkBeJEPvAY4sB8rHp5h5s99iRL1JKTh
	b/3rHHS0unDux/OXkj9pO8nyHtBESDshs3JlL48/LfYviwxkOyWezVxd3YoWc1ilj2eYDg6tiFr
	WZikki1PA/C06zUFyNjY6DYn2UA==
X-Received: from ilbdl5.prod.google.com ([2002:a05:6e02:2585:b0:4f8:9ed9:1e35])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:99b:b0:67e:3f0d:4229 with SMTP id 006d021491bc7-67e3f0d4596mr526703eaf.14.1774915757999;
 Mon, 30 Mar 2026 17:09:17 -0700 (PDT)
Date: Mon, 30 Mar 2026 17:09:08 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKMQy2kC/42NwQ7CIBAFf6XhLIaFUNST/2F6QNi2GysY0Kpp+
 u/SnrzpcV4y8yaWMRFmdqgmlnCkTDEUkJuKud6GDjn5wkwKWQslDb+cHzR4nvv45BQGChQ6rrX
 xCryUe2VZUW8JW3qt2VNTuKd8j+m9voywrD+CI3DgAnYILdToNR67GLsBty5el4M/bKOEddJZ1 Aa+7Wae5w8McaVs9wAAAA==
X-Change-Id: 20260327-kbuild-show-inlining-557d31d2293a
X-Developer-Key: i=justinstitt@google.com; a=openpgp; fpr=6E3AADB90F44DA9EB9CDCB6799D922A9379F2964
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807; i=justinstitt@google.com;
 h=from:subject:message-id; bh=0zzJj5XbJZNH/JIAf3ERvtI4s2NzTsyvLe8QvhS7z1I=;
 b=owEBbQKS/ZANAwAKAZnZIqk3nylkAcsmYgBpyxCth4ToybVBS8QAYW1JSRg4EFMkoArfUQneN
 aNgUGjGm/KJAjMEAAEKAB0WIQRuOq25D0TanrnNy2eZ2SKpN58pZAUCacsQrQAKCRCZ2SKpN58p
 ZAshD/44gdrcDdJnZkI9ro2nUYl9aLuGTtUVuuCouFlQNmROm1W9xkvhg0u0znR+XArJjWRKWhy
 CdnNw9HG5Qt8LkMeLteK1jbYtCHe+GCza2JCMj1JE2njoZeGaFVd/7ftISZKElkud6OerPgeswq
 tnj+TK/LJ7ptXJyeQvnpUH+M2SqPHB9v0Wrl6XVPO6VGYRSWaZ55/zdVkmF2Hh+vZ1wLXMjCYmd
 zANJRTGBBgcQcy4bM53fNtWMEqKa5kzJhW1GA0XXixfbXXh2PYcP8LfFWEX0Pz6QW+iISovQBsI
 7L3nW2ZYzUy1x/O6KxlcuQhoL/inwGzXHAQTWQzKoPb1pcYFnfXw4EaC0IDC6GiMWAc7NbnY5Ba
 HksrKUr5A6ihZ5Xjmn5DoDuz6FgyzR1a45/NqQQXYJ8ow432g+pwWqMoj5v/Tp6Tnc68cjcagGB
 veT0hHTW7mcMhNwv2JRMPbwy5kZlTV8thqk26T3mAcoYjiAgDMcXLmTuMAMM6L12l2zhWYXfoDw
 MJO419a6l3k7Tp4bUeone6uWRYBEVKtCAmff46rfLlqXNLzybfMmiiEvqqojPdXjqA49xhLU0u0
 qs3YV8GzPb9jeDG89GWkkvQkGMJVu/wJOAS7FeSJT29rVHOVkD1u2L355yLNdRBisxVYFvo2/G2 irbE13lKsu3R7Pw==
X-Mailer: b4 0.14.3
Message-ID: <20260330-kbuild-show-inlining-v2-1-c0c481a4ea7b@google.com>
Subject: [PATCH v2] kbuild: expand inlining hints with -fdiagnostics-show-inlining-chain
From: Justin Stitt <justinstitt@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>
Cc: Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

Clang recently added -fdiagnostics-show-inlining-chain [1] to improve
the visibility of inlining chains in diagnostics. This is particularly
useful for CONFIG_FORTIFY_SOURCE where detections can happen deep in
inlined functions.

Add this flag to KBUILD_CFLAGS under a cc-option so it is enabled if the
compiler supports it. Note that GCC does not have an equivalent flag as
it supports a similar diagnostic structure unconditionally.

Link: https://github.com/llvm/llvm-project/pull/174892 [1]
Link: https://github.com/ClangBuiltLinux/linux/issues/1571
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- Move to always enable option if compiler supports it (thanks Nathan,
  Kees)
- Change commit title and message
- Link to v1: https://lore.kernel.org/r/20260327-kbuild-show-inlining-v1-1-730ac2cae571@google.com
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index e1279c4d5b24..4972b23fb77f 100644
--- a/Makefile
+++ b/Makefile
@@ -973,6 +973,10 @@ KBUILD_CFLAGS	+= $(call cc-option, -fno-stack-clash-protection)
 # Get details on warnings generated due to GCC value tracking.
 KBUILD_CFLAGS	+= $(call cc-option, -fdiagnostics-show-context=2)
 
+# Show inlining notes for __attribute__((warning/error)) call chains.
+# GCC supports this unconditionally while Clang 23+ provides a flag.
+KBUILD_CFLAGS	+= $(call cc-option, -fdiagnostics-show-inlining-chain)
+
 # Clear used registers at func exit (to reduce data lifetime and ROP gadgets).
 ifdef CONFIG_ZERO_CALL_USED_REGS
 KBUILD_CFLAGS	+= -fzero-call-used-regs=used-gpr

---
base-commit: 7df48e36313029e4c0907b2023905dd7213fd678
change-id: 20260327-kbuild-show-inlining-557d31d2293a

Best regards,
-- 
Justin Stitt <justinstitt@google.com>

