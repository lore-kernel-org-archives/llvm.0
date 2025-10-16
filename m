Received: from smtps.ntu.edu.tw (smtps.ntu.edu.tw [140.112.2.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28CB1C84B2
	for <llvm@lists.linux.dev>; Thu, 16 Oct 2025 15:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.112.2.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760630103; cv=none; b=PNTT+b2Y4TDF0Sqo/iH3O6TdlTPTTVjjxU3/3B0gDRL4ukxsIXoi+3qdOWvin0Jfm6SNZY5otLdnyjVJx6nJ/ZIgecf3ELRpsrDiHwAPGuxLvrVjIY8g5BNtILG356k05VxZvlNVmaupSo+aPW+EBnHaIMmJyGnaLz/1G9PlCkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760630103; c=relaxed/simple;
	bh=ZrEg05StViIMUxZNoRD8lecZvPht+fpmrytBwILDMjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L9WiC7glxRd49MP99KdX1fwAFFRkpmnisR987hCFk+Yt62HtLGekS6xCvChNRURXSs73JXF3DON4NizQUJpq++ct/ChL5VvrPkjECYZQh4qrxjSoY9Sy90QdIUH6pBV6whwIhkokzwOI8FVtkPfNv+GfZCbVGVqRx0WJieCIt0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ntu.edu.tw; spf=pass smtp.mailfrom=ntu.edu.tw; arc=none smtp.client-ip=140.112.2.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ntu.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ntu.edu.tw
Received: from x415ea.. (unknown [49.214.10.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtps.ntu.edu.tw (Postfix) with ESMTPSA id EB2C0315FB;
	Thu, 16 Oct 2025 23:45:30 +0800 (CST)
From: Bill Tsui <b10902118@ntu.edu.tw>
To: oleg@redhat.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Bill Tsui <b10902118@ntu.edu.tw>
Subject: [PATCH v3 0/1] arm64: ptrace: fix hw_break_set() to set addr and ctrl together
Date: Thu, 16 Oct 2025 23:44:00 +0800
Message-ID: <20251016154401.35799-1-b10902118@ntu.edu.tw>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827014113.5852-1-b10902118@ntu.edu.tw>
References: <20250827014113.5852-1-b10902118@ntu.edu.tw>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After revisiting my patches a few weeks later, I have some additional
thoughts:

  1. Keep arm32 ptrace as it. Legacy APIs only need critical bug fix.
  2. For arm64 ptrace, the patch is not only a fix for 32-bit tracee
     but also a refactor that removes partially set state, making logic
	 clearer and preventing similar bugs.

The patch can be tested with the code in my previous mail:
https://lore.kernel.org/all/0fd573cc044584f00976c410955ed486@ntu.edu.tw/
---

Changes in v3:
- Remove patches for arm32 and compat ptrace
- Rewrite commit message
- Reformat the arg of the added function

Changes in v2:
- Fix username

Bill Tsui (1):
  arm64: ptrace: fix hw_break_set() to set addr and ctrl together

 arch/arm64/kernel/ptrace.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

-- 
2.51.0

