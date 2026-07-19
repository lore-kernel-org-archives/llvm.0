Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4AA30F7EB
	for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 21:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784497854; cv=none; b=Zt6vMBsth9/5S9tMrSngdVJNJZyXWf5fdpCaKKcUGZFShEY9IXzK3fHtwx4OzKR0pgQwQgHd0Yq+5dzM39vppJVm4g70U7F7Z0ggUR2B5138uyER38cfg5pnGxRnIiMOPCPArSbPC4ct8NDt9ZcY8avFGgQAcZhFsD+Cfd88wQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784497854; c=relaxed/simple;
	bh=0uY0iiDoWci9ie3IlgyibA84n8mhnz5u87H+NUZz4Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T6OFBbjhYZQIzMbv0EwKkGFZuylFbmRw+mueLnViMPT5KIBl2uT6PhC6omBvJPpnnWtiQfoWpNrdjjYuTcH5+EV4mxvA/zPgnODQtu6q4UXsdyUdXYgNi/a0JkLZpBFU70u6eeutdnm8VqPE6pII2Tgc7oT/cchMxY3QR1W7bwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxTHE1T8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxTHE1T8"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so2590695ad.0
        for <llvm@lists.linux.dev>; Sun, 19 Jul 2026 14:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784497852; x=1785102652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEZSCCPTXF+79jewlZrbFumF51dyS7Eb1UAau5L87rc=;
        b=DxTHE1T8+X/Ay7vRackMgJyiRWC+JkzRzP2JDqVrW++Xosm5aVzr2Hn1j/47QObJd4
         zvA8ik9EVZKX2MGqLPjbGWA7FaNb+WnmrOjI5SD5jHXyJEzGPOz4NVU5fZXCuYsJyHoS
         e1GzOKKmkNpLichLEa9352Lfkd1kFETVkdocIdMcZdg98OkXNAmLTxY1QbKMhVYkTYFw
         Z46ZGPvGviVHaE3tNjmYx0k/FpGJtQWUMEclCH1JcP9l+8Snxn387byUAytx87hjoZua
         pYjRSPQ+3CFRksCQ8MTtBHjbnjeD8G5ZzHxaAcH1vSqXcm5gqewehHV1j7ocYxlt5ifx
         ijDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784497852; x=1785102652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KEZSCCPTXF+79jewlZrbFumF51dyS7Eb1UAau5L87rc=;
        b=CG8vYheIwYoCJOZmah+1TCvAHnow+YBWP1WpWvBjszOm4IadNQZizwaFkz8sqsumF4
         fPawMHpsUYcZsoV6IN8fB7PxJQ25U03Vmfivqwxs01yyrOBz5lz4a2YdO+IBfKT3okA7
         DCqVOWiJMy9sVKm89q6LJWz6pEpfF6uo3/j+I+7jML8akQZoWq39nrP03dASvYKJAvDU
         fjQdztGit3yv1rs2Trk2czmtTcmN0TBp2ERuY/HDh5pgwnUVaD5AbU/ncbYNgW+7UEQx
         0dTIwaBVefQQUXMBEPn/CarsJ+jWMfsyzmpaNU/mGU5yE0BPY73kXSOQaKPEDfK7Oouj
         Gdjw==
X-Forwarded-Encrypted: i=1; AHgh+RpQjME5VUY6ROphN8VvvkHoXidQBi7BQ+xvi5Ft9YwiBr8G7f4zboQ+uICDDnSP87qoyT93@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2XIcjm5gPcdyEljkpnNg6Zq0WhOQnygZ71mFSher8XACG6hNe
	2qpw6gDSclVUADvK+bDoTFB/5V/1etwN0E2PVLIm5OHZk5a48I8APsv1
X-Gm-Gg: AfdE7cl3Xbv0WFwwWrpOlIdp7FPfA+I3lr0Q4OyV616avy1afKcdJ804BpjQgtbMcX6
	e8Sp7v3RtMFweJk2nATtYDuFTA5asW61hryRH9ZQKcvqbvcIT2HeYWB05CEO/AszvMGneJnO2Ai
	vrzc1r5CKHo1xPcii/df9q15CR5pgRhrhJ+oFADUTZyiYNDPhaomtt0+7xXNPTocTJMk4XKmi2V
	LvRJ1ePUXlWpwMw22/DxLB/dtB/E5zumVxu4IX26JVf2tbfI/GU1c7eTGV+z5SS84vWlGtTylFZ
	ChUaCCVv5jhXx/4EbHZtlBnIWuLiJRN3ao7j0BZSCi98fV8AvkjVa8dLAH9B/6qPxkw0xbL3Xzj
	o3BZHd2bhBAhC5tT7YoL38Qo6g5w6AOZ9rNO3I6ELjlRGhiEBBSbJPKv0TLGXFe5tvrsSIOBcCY
	tTyo5Urla00O2bidQpHLV+WyD8xO9RVAI0KlKm8F6A2E7ZFhTBQa6A5Vs1BUF0l+qblZwGoGhb6
	vjntE6OXrLEAgxPhHXItm+L2M3cC5Dh3TKOMQVcwL9duAOi1k4+g8ww9Ei57hYKxQ==
X-Received: by 2002:a17:902:ec8e:b0:2c9:e961:d256 with SMTP id d9443c01a7336-2cf3494afcemr121576355ad.27.1784497852491;
        Sun, 19 Jul 2026 14:50:52 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b78e2sm44745845ad.24.2026.07.19.14.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:50:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2 2/2] clk: stm32: allow STM32MP COMPILE_TEST builds
Date: Sun, 19 Jul 2026 14:50:40 -0700
Message-ID: <20260719215040.767232-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260719215040.767232-1-rosenp@gmail.com>
References: <20260719215040.767232-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

COMMON_CLK_STM32MP already allows COMPILE_TEST, but the parent clock
Makefile only descends into drivers/clk/stm32 for ARCH_STM32.  Use the
STM32MP clock symbol for that directory gate instead.

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/stm32/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 8383f9f1da51..bbcedf5d60ea 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -151,7 +151,7 @@ obj-y					+= spacemit/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
 obj-$(CONFIG_ARCH_STI)			+= st/
-obj-$(CONFIG_ARCH_STM32)		+= stm32/
+obj-$(CONFIG_COMMON_CLK_STM32MP)	+= stm32/
 obj-y					+= starfive/
 obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
-- 
2.55.0

