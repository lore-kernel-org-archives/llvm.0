Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55612475E3
	for <llvm@lists.linux.dev>; Thu,  7 May 2026 23:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778196223; cv=none; b=TyKIAZ/IOuvXzijM8d2uxYFXyB7C/B6AN/322+nMAkR/HtEwmhA0/eris6g5eodtxBpHFiPIO/wV+swMhNvi9/1fdHnHJt/HAFdOU55aw6nr4dD1VYbfYcsxBqPxjg5YvAmQ2vMDDALbj/TmMLuazDcDeD0RC63+jCw1nO73VSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778196223; c=relaxed/simple;
	bh=1KJ2Bvoc6iZawqaQ7SOjwiQHPzA9sUFrhqqMHlRQJLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U/2zRfYuto01ZmyMN6q1ZkAJLMQFxZV8LexdzEVOxdHrJ4CSyY+qcVXnHpAYAn3OhCCLcmahU+/zFdqA/R+7fvVFa8oP8wFVlSfoxV6WRUB62oF8xRH7nxRAg9E5GJvk7Zdx7tf41OWtT2UqRZH6SrrEPBmSqWmC9mfUHpw5MDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTYEce61; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTYEce61"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-834da62e52dso609575b3a.3
        for <llvm@lists.linux.dev>; Thu, 07 May 2026 16:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778196221; x=1778801021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cGtvlVlMdfXez+6h1mKwdTb1HqPOhxq8X9+6dMnsoCs=;
        b=cTYEce61rGohi1h7qINGtwuzcQ9sz8gfmsSyL2v2+H0t1OUgqeIlba6SthuqX0NxuD
         lUKK8r7KC3y5CPWT9yRiCR+ENOSWcCU9VMwbrGSwQbvFWT6FAofIIyXOW/Qb1MlosQDM
         rbbQdf7sdzDg+j28ZjxMC4uFGrSH5Y3u6az0GKRENm2iFNNuIlvAVPcgR929ulkw5F3o
         C1mRK+eZnWfc1LEIZgUycPb/Sl6i8ai2Us3TDs2rAjymnRJ9tUTqXllQaAUOy9X6gZhd
         VnV7OVz1nWDYLziLa81B5QJ+Vd6Njv8VeNw/IwGm+Jn6EqoKEExsWmakGtCV4Kl78sgo
         uU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778196221; x=1778801021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGtvlVlMdfXez+6h1mKwdTb1HqPOhxq8X9+6dMnsoCs=;
        b=ZQVqC09A1R1TTFlavvC48xiyrHOJd1VLw0bNVyGON3HrQKHNFEqwORR6AbrxnSBxBK
         /zScdSTpAM4+Qy3YjUxMsvuDzu+lFsCe3K1AP/BNREbynb1rtoXNgw8h8WeXFxFENvUq
         xRgAelDcpW0VCo9NO6sWCVsbM1UEklYQmGotLs/0ItRWHXZD71g5+Y2MPiV4vBu7v+oL
         9vB/0Doli/bQFQ5xNw3N1AqROktWHxEadyl4jHB7Q2jut4hzeEsOsO9AZsboo/TV4Qkb
         BvGmynri6ltQK4vURifXRFhcS3vIGLv6ZM6SY8qMOs9KeqMwlIs+9RM4yHt7eHK2SEi6
         bgBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8aww2XKU0Oys/yL9L84/xhe07GNRi1F/LRBDbPKPqEZT0uiS3umNYSXgKsUPnAGTC/zKHk@lists.linux.dev
X-Gm-Message-State: AOJu0YwM60wq+3r8CLsKpO7Ln5pUsvdw9Ky08eWBf4jIV2a376pZuxnT
	KEV9tCwiDtVqFMxyDRNxOnhYtD3e1kU0nJlK+bsXce6S82AGM1jkArH9
X-Gm-Gg: AeBDievrg7Fh/tJ6GlqhWKkJMC7HrUtslHHt10wxm9e4JxXQhZKTOAxG2mOjP122WIl
	fiuEK3H10WMDMiIi5UwaZEdtvaP+hIR0Q3YckmU4FbsBvSgVV5k2mtJ10N94Hxp/LoClRVFdcmf
	U7Ex7JUMHv1RHq90w7EMYDv9hAatS/46C6VW5H4zqeN6qU2Iy3fjN9rDFG9T70sFlyhKdR7YIN3
	lXib+62eK10I9qGepADWzI1duNFy0BMjoeph0qegbL+6i8N8KbDVSc4n+q+OGtCxKbFnHrTBjfq
	DLwHZf8QHjtuk91Ko7QSfsE9TI4JtrTeUTkS9ZE+sQC+HDnGqFYTFbMoU4mI735XtpY8bbiiWma
	2xhvEq2NiGgPtCOO3bVkBApQnuFa+OcYmF8V9V7lV/CLHA47cPDh1WuixRQirJhJZSGyDCC4Tez
	RupGQx04igGz00caOQ/568j11H2uZHmuznv2hykp9ImQ6TybZL2ZonxcdjuR98BB3H4vDAtZ3Ui
	9Mchhc7VNA0dTY5FCGVm+ue+1Sriqmfb3M=
X-Received: by 2002:a05:6a00:1a0a:b0:83c:c55f:6dee with SMTP id d2e1a72fcca58-83cc55f6fd4mr867107b3a.11.1778196221065;
        Thu, 07 May 2026 16:23:41 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839659487afsm9527213b3a.18.2026.05.07.16.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 16:23:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] mips: cps: Assemble jr.hb with an R2 ISA level
Date: Thu,  7 May 2026 16:23:23 -0700
Message-ID: <20260507232323.489383-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A MIPS allmodconfig built with LLVM can select CPU_MIPS32_R1 together
with MIPS_MT_SMP. In that configuration clang invokes the integrated
assembler with -march=mips32, and the MIPS MT path in cps-vec.S fails
to assemble two jr.hb instructions:

  arch/mips/kernel/cps-vec.S:376:2: error: instruction requires
  a CPU feature not currently enabled

  arch/mips/kernel/cps-vec.S:490:4: error: instruction requires
  a CPU feature not currently enabled

The earlier jr.hb in the same file is already assembled inside a .set
MIPS_ISA_LEVEL_RAW scope. The two failing sites are reached after
popping back to the file's base ISA level, so LLVM correctly rejects
them for an R1 target.

Wrap those jr.hb instructions in the same ISA-level push/pop used by
the working site. This keeps the MT code unchanged while making the
required R2 hazard-branch encoding explicit to the assembler.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/kernel/cps-vec.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/kernel/cps-vec.S b/arch/mips/kernel/cps-vec.S
index 2ae7034a3d5c..70413c816eb0 100644
--- a/arch/mips/kernel/cps-vec.S
+++ b/arch/mips/kernel/cps-vec.S
@@ -373,8 +373,11 @@ LEAF(mips_cps_boot_vpes)
 	.set	pop
 
 	PTR_LA	t1, 1f
+	.set	push
+	.set	MIPS_ISA_LEVEL_RAW
 	jr.hb	t1
 	 nop
+	.set	pop
 1:	mfc0	t1, CP0_MVPCONTROL
 	ori	t1, t1, MVPCONTROL_VPC
 	mtc0	t1, CP0_MVPCONTROL
@@ -487,8 +490,11 @@ LEAF(mips_cps_boot_vpes)
 	li	t0, TCHALT_H
 	mtc0	t0, CP0_TCHALT
 	PTR_LA	t0, 1f
+	.set	push
+	.set	MIPS_ISA_LEVEL_RAW
 1:	jr.hb	t0
 	 nop
+	.set	pop
 
 2:
 
-- 
2.54.0

