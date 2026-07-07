Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237F62EA480
	for <llvm@lists.linux.dev>; Tue,  7 Jul 2026 00:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783385783; cv=none; b=bUfaH4jlb7pvDHItfFgQCaf+t4rqe8y7i1CtAD9wtogW62lXTJ8W1HvxHFVMgAyMDzFwX/cXOM9EJABqNaxtWGb/0De5BSMSc741wYuc0GM5NVCQwjaD0KSVmICUPTaZc0OnY3k2OibejDEoePN9nxVHh4fo8pwQ4wmqbohacXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783385783; c=relaxed/simple;
	bh=AtP1ly62yHRiqJ1z0VVHy+4e1Wq02i/Dfs5QoupcSNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J5qhgfjVlN2SYQb3vkFnQUJJaBzx0KTYCKHnIhqNrQWkp2Vol4Nt5nCjc8aVrk++CX8ndLq4JEOLKzHszLWk5EKFIa58bEPWW2XZIheYMtSdO2M01RH0mRIM5igAtzmkmJkO7z7/0F/UYSfGD/5dBTnYyThvV95BKIP+XM7npKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2nM7kH+; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2nM7kH+"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso1697525a91.2
        for <llvm@lists.linux.dev>; Mon, 06 Jul 2026 17:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783385781; x=1783990581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WwT1m+lGw989aBCp7ntY5F2Cxo1vcQEFm2G6bjMfeX8=;
        b=W2nM7kH+HSeN2FOB+N5VjWkwpgdqt0RacBF7nDJn+RxBf40zYAFj741FyFVJyzvZ0m
         2QtLPXy6/ic6VhBte0ObZkDd1h6SN6rufiBAjeRRquiqbXeCwjerwl/1AK1HtXFd6X9z
         R4MfYeDDpL25hI2mDa7OrpEYSO5KFkLDdh6ZeOdBSHzO2hrWEb1UeDI0+l1Fa/S1V6tp
         Uf9Tv38KbBI+JU6NUrG75/bzvbauoHlM0aldwcmhz7NvRm7RuwCOd0PJE3B0bw/5wL00
         KWYtZGHrhnkCCk1Dh4HzEeUgMUR65NeQO352hpJi+GFLA7ODJRPeb5uJn4CTDLS714vK
         eAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783385781; x=1783990581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwT1m+lGw989aBCp7ntY5F2Cxo1vcQEFm2G6bjMfeX8=;
        b=UmoDeIBV1jqwhKBt/bi7XXjmToYa4Q1ZB+AVdr+P/mKIbXPEEAZJd4JTR/juOupI1h
         /bIscJP1tVnxM126OL8pRR4NZO9M4IB3w1YCjnpfUuxnc5jiLLU1NZ6449jEZfHALVj3
         BjNv/4BQDADZCmdEu0BlQsNCrJFnRgsbLIcjR4uHVuPQtaFo90KHeypQxbaaDyNZgwyS
         Ryedvgqr3zRIsWZWPFYPLbIVVNOj18eE0ItsoRH7PDSF7RqWL3Hj5ZGS2InbI3bDR5iO
         UemNFjMfMRtZH61SNrW6MfG7A+U03WRPMaon+jgp59rbAgw29kKZITC3HmVkKD2TDxE7
         gPDg==
X-Forwarded-Encrypted: i=1; AHgh+RoyalO3jiHO0UBCotjb7J4jtKnFSjTG9Nwv10UbhKGcs0w/YCheGUnCb7hoMiugi4S0HW1L@lists.linux.dev
X-Gm-Message-State: AOJu0YzWr9kJDXQcCHQCuhmy2Un1nYqYRVOYHHKx/SNtqE8iDK7Toqyi
	eXV9t6fpvsPxUFRaS6s3scnXpq6BFXrnkRv7P2bFKNjk/byy4imEMFXA
X-Gm-Gg: AfdE7ckR5ZGgFSWYmMynPookNqIHS5AUkAxAPJtqoexC1xMWDoIVxkYujzPNmB+sjfN
	m5/fq3ifPT0jkSQ1iL/fAmECFpsxnsjNvvT3RHhMmIn/b3XxiZFwbY1B/NUvbZoDRCrMLPymX0t
	rSkp+v7gNljU+8+G3WlFhthsWjnEVb375pcYGRUqE+JPfPUDIeCVAPTWX2/ksPOsu2Ad+C/V1xe
	azjdmjjKpLO/kTbU3yCRSkUpAFQTmotTgwp/6zFaA2DoaUC5uPdlyDK7zjlG2MnZbvc5SwUljvh
	ZpWvfAWAQVZ6TehqfY/FgDPsvOeiOL8tGwRm/ZML2NOWEGNc2VwxPjYMwmeARr0oW4YjqawfMaB
	x/JHDAIhSSmd8BWQ/tneU5w/sOKnrC1fVdUYTVsBfPiamuPermejY/lKLaie6dZoCYWRcftY6E3
	J5HHxiAWtk5X1OxWzPuapKt76Tr/3nrOlBzWVK1z1b2dQXBy3RisP7ebDk1nsGBVKfMhgz7Pe3O
	eq0QOZ2Ag==
X-Received: by 2002:a17:90b:1d01:b0:381:bf9f:be37 with SMTP id 98e67ed59e1d1-38755768660mr3288581a91.5.1783385781345;
        Mon, 06 Jul 2026 17:56:21 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d100b7acsm176090a91.4.2026.07.06.17.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 17:56:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2] clk: thead: allow COMPILE_TEST builds
Date: Mon,  6 Jul 2026 17:56:19 -0700
Message-ID: <20260707005619.1229238-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow the pattern of many other directories in this Makefile (sunxi-ng,
tenstorrent, ti, etc.) by using obj-y. This allows COMPILE_TEST to
select the driver without having CONFIG_ARCH_THEAD enabled

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/thead/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use obj-y
 drivers/clk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index f6a71fd6d872..bbcedf5d60ea 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -157,7 +157,7 @@ obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
 obj-$(CONFIG_CLK_TEGRA)			+= tegra/
 obj-y					+= tenstorrent/
-obj-$(CONFIG_ARCH_THEAD)		+= thead/
+obj-y					+= thead/
 obj-y					+= ti/
 obj-$(CONFIG_CLK_UNIPHIER)		+= uniphier/
 obj-$(CONFIG_ARCH_U8500)		+= ux500/
-- 
2.55.0

