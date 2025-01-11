Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E15129A78;
	Sat, 11 Jan 2025 06:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736576987; cv=none; b=CStCzoIPmZm0h6L18yL85Lfd80L3TGTEfAOIX+D4FmxuVVTw6doAFddgUspsYtc1R031+rYBGye4SuYX+FuwnREpPrZicuIdydphxlH04EIqt7Ww5Fa0xSIiHwnSYCvtaCl3meM2yd8ElWzsRs7CBZUZtMWqGPaRB/mlj643qVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736576987; c=relaxed/simple;
	bh=GII3GAdCkAmD8TqmlGQ8ak8gS5x+Yie5jwcOQnUccPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d722v6aOiFnjAnZneqO4A1psfVr4fta3942OYVlKoCNnvA9Frkzmn6tsaTxSRwjtUmWbs07ro8G8dZEDUCQgHvm3HO3mLYsM8Zqtmj5/DTq1RLgXFkYmji8HOvB0uTXipdzsK2tR4YygvTl16tDAmrF6Ss4XLImjYKR6nH+gD40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IbVHUvH/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IbVHUvH/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=tUP0Gs+xHDlqOrxyZSgPBKJios62X7JbgLHOVO3I9BU=; b=IbVHUvH/pM2htMH3DqgriWwca2
	0xWMCOcxnOXFTI26X2HpFMOekUXHaKmFbYYpBkOrCuPazL0V9qRoOSnJT05UxmifYlBCF4ddcuL77
	cg3TtB1OEQP9gp1QEuDW2Zltb4HyWVNVdayoDz7bIERKYCrXjLnA9msAoUeYbe7/kdC09RrrY/Y3j
	G692Cias4de0i0gbbuAFSl7LTkJV6ZT3kNlOUjZSNJdfwVPaxBRJHpSkCJwzwbVM1iPWCm4JjZU/n
	ktkrCYRdEKR4nyr/R4rJ87TE/5j5FhmVh2nXA3cYX8gTSLW039nBgCbWD+RE7IKFkSPmU9mJ0Jd+P
	QaVzEfvw==;
Received: from [50.53.2.24] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tWV0C-00000000HKo-3pU9;
	Sat, 11 Jan 2025 06:29:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] gcov: clang: use correct function param names
Date: Fri, 10 Jan 2025 22:29:44 -0800
Message-ID: <20250111062944.910638-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the function parameter names to match the function so that
the kernel-doc warnings disappear.

clang.c:273: warning: Function parameter or struct member 'dst' not described in 'gcov_info_add'
clang.c:273: warning: Function parameter or struct member 'src' not described in 'gcov_info_add'
clang.c:273: warning: Excess function parameter 'dest' description in 'gcov_info_add'
clang.c:273: warning: Excess function parameter 'source' description in 'gcov_info_add'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Peter Oberparleiter <oberpar@linux.ibm.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: llvm@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 kernel/gcov/clang.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20250108.orig/kernel/gcov/clang.c
+++ linux-next-20250108/kernel/gcov/clang.c
@@ -264,10 +264,10 @@ int gcov_info_is_compatible(struct gcov_
 
 /**
  * gcov_info_add - add up profiling data
- * @dest: profiling data set to which data is added
- * @source: profiling data set which is added
+ * @dst: profiling data set to which data is added
+ * @src: profiling data set which is added
  *
- * Adds profiling counts of @source to @dest.
+ * Adds profiling counts of @src to @dst.
  */
 void gcov_info_add(struct gcov_info *dst, struct gcov_info *src)
 {
