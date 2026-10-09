Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB3D3446A6
	for <llvm@lists.linux.dev>; Fri,  9 Oct 2026 17:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568734; cv=none; b=LMSP4oRoRaxtuUKg4ivNPL1KD5+oL7fW9ocaGH2ygR1OV/q/VEtspbNrn1QuzJ1KIVVzgNisq4cQkzCiFPrtT8j8jrfnME0jey+NN4Zhabdcs8uB+e9FMcNNH0s0prIt5irK5wFCWJQ+BPtuk2v+yVQt06a3ABsF4uhi4xkMwtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568734; c=relaxed/simple;
	bh=TRAbFOmIuXO7lFa2+5mHt2V6HZzH9UnQ+dCDMXHXAdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TmeSANeKij5VVIPovmvazfifa//zr0PT1Lhx/XbPtLufMtrDdU7F5cImCErELoN5TL3oAqN4ZeYMe6cWWoXakU6t9y5A30QpKzbHq7FY5MCfMzBF4YjP4Oovuebdr7ks9EJXjM1eKb45nng5Bk/jdQra/W2g6uPvYspu7kuyhHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQYlnyo2; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQYlnyo2"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab67ff8f16so464962a91.3
        for <llvm@lists.linux.dev>; Fri, 09 Oct 2026 10:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791568733; x=1792173533; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFMcmEx2+Bmb7Wycj6pYJAy5yt+ElDaMMm24XjvbUJI=;
        b=jQYlnyo2avGXWN1Dt1LgbaNZCCUY0tCHsEyAVYKKkzJ6RdjRJBkvBs4SkYnX2pVWYy
         yGs2NLkJccrrybemoj0T2G7LEocSXJybkUsK0hPbmg3GNoFJX8957BJxov/cvv/oPwfG
         oWhYSMHx/Y8fTBX6WSFd6ksW8mA/Y5rzmoxN392DlDwxQ6O1wlYanANKPolnDxxSOBs5
         p9+3FDlEGZC5kwlyEhsuucuQxITh6br/xp7MSBNW/YLLC/ZC3Q7E2QPFLKCOvCY5oC0K
         5mKXt/ka0uUAtCFrVcoT+ypt7OAqcrQsKtpvUYXYTLtTzRbU6qiQCoSRXZ3UFRz1UMgm
         rybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568733; x=1792173533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFMcmEx2+Bmb7Wycj6pYJAy5yt+ElDaMMm24XjvbUJI=;
        b=r1brzIP12pCBQmKUo5ShLfuO6GRhyZ4VEtct+xI8Yn05F6fVPfxP3uDH2CUrx6Dm7r
         zkEcR0sOt/c2ivcnC5Y7f08SpBMWkSWeB7uHtOgKsYij6XY0DnjBEklGfTLIjeD6CJGq
         j4UKhthwhULnwIxB13Lx4J4FESDEcIa+M9yg2XIdsu4LVITuPHycZ4TqB+PP0sB/DYCh
         Antw66xC/oxUhuQzEQDfedW2It5Ct57jvdrZpIupkTGv+5+uYRYX7Ap2kjCxKKnFUpfc
         jWXg8aqOBOYJKy/ba0c2hEHiPCPxcQYXzHWUOCA4Uk63mqr10Qf0Pes+GtLm3oNhHDgX
         3mBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoftGX5PvFaEUjy2c5QP6k7c7T2+kjgdzVMVu7LEUdwrBLP24STBqLd+1/Si7Z1xwcetYC@lists.linux.dev
X-Gm-Message-State: AFq9FYIbQbOwPOc4NiazpLi5z0FpCugeN/4xSi4qoak2IBEhlGLrIsYd
	G9aKzTKrz2MWcEIqyWiyUI1XH41YEsELZm95pqCmgxPUBNsyCrKB103v
X-Gm-Gg: AYBFou2emCrIJQBZ7a4pxE5RDvZOY7swdVOULt3ZjARDW+6BpEA4/1Q0C5yU5XPKpzJ
	NVjtVlN7EeIDNczR+bsEgCTcedz9Ltn0LNtUbnVVz8WA4St/31DKBHaEVUUgRoZueje457q+WIp
	+XUOznafSfNVyKa6gWhsyJK2BwVRJlwWJ+fE2mxozW1R5kVHd6FvRTVm22RtlxWDuF3S/nGbNAQ
	bgzlJLwQhLLUB/s4eQ4hjQSQKgF8U+QOweG0Mxd3Xc0mrl9z0dG8lt/hk4u/bnihLtZl0onfBv0
	2cnyaRSlAEYuuW6qA1/4+Drk0RMbs31qprQS/oyC8g15hTxabEu2BkMduJsF91IDQo1Hcty7M12
	XmyZ6FXhf19va6FQhfaRjRWQDnIYkT0+9NEQltDfIOnp0if4QAW/FrIDGzfpELL2mrUx10axPb9
	dUDdVgjmfpv5eeIMmMjOwxnwBo28hsopZNIjpQWk6NPH9UpXs0Guju960VQSihLrtUl/RDAthGz
	UU7M30Z5XYetjzcNYqAAG8VI8lYPow5b4uJHrzTzjud5QclEPT5Lb5Ub0ShplNVIpmIBw+Tqrzm
	18g55I31VMFyCVazbnLShM0eagdw1YHkSrYYvPfdKl2t44mKEgMPzjaYnLOaFQpYi9RlpxAYWXy
	GJLPJoj7vHn+l6+vjOg==
X-Received: by 2002:a17:90b:3c8e:b0:3a6:fc30:ce16 with SMTP id 98e67ed59e1d1-3ab3ae696c8mr1964314a91.51.1791568732651;
        Fri, 09 Oct 2026 10:58:52 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:d58d:323::50:f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f8277bsm4415918a91.11.2026.10.09.10.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:58:52 -0700 (PDT)
From: Ting-Han Hou <ue081723@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clang-tools: Import os for broken pipe handling
Date: Sat, 10 Oct 2026 01:58:32 +0800
Message-ID: <20261009175836.2277-1-ue081723@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BrokenPipeError handler in run-clang-tools.py calls os.open() and
os.dup2() without importing os. If this handler is reached, it raises
NameError instead of redirecting stdout and exiting with status 1.

Import os so the handler can work as intended.

Fixes: 87c7ee67deb7 ("scripts: handle BrokenPipeError for python scripts")
Assisted-by: LLM
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
Changes in v2:
- Drop the regression test and adjust the commit message (Nathan)
- Use my full name in the Signed-off-by
- v1: https://lore.kernel.org/r/179017337986.52388.7943687183785012868@gmail.com/

Sorry for the mangled resend in the meantime; this one is sent with
git send-email.

 scripts/clang-tools/run-clang-tools.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index e78be82..79d58b3 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -12,6 +12,7 @@ compile_commands.json.
 import argparse
 import json
 import multiprocessing
+import os
 import subprocess
 import sys
 

base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.52.0.windows.1

