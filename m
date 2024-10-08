Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAAD212EE2
	for <llvm@lists.linux.dev>; Tue,  8 Oct 2024 19:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728414817; cv=none; b=LWZbSyLUpxxvYvew+NKS2xCasvN1fMlV1wDnECg1nKfmYb5gnUPEfPRwB95FbASBKmBd4Gm6YgNkWExXh0hdXFVEuPeuT5z2rWaY5Vgjwy1G3kdCj9WHczBjWp25oTU515jTtdzLO+8jv/rkpP3KL6EzCuLhQfztBGv49vhGfaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728414817; c=relaxed/simple;
	bh=VeyLd080XrjX7LmXYGJDGzbJ4zxukfOJSEDHc+Nkdlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=npyeJqB0DavBWwUPz0ZV3pUF76OgmGlBRl8K2OGhFK7lKmlO8HSZORX0HGRjvZ+ZRSiXYhy3igfku+gyOutG/Egj6E1e9WrHV4DVIhwWus8GOBkhj8r2VWMXS+lhn9v1GQYrOohgbMHvqtvOMIdjDlCMvtCccdTJT0MlWSCpDKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pz0/X7YJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pz0/X7YJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728414815; x=1759950815;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VeyLd080XrjX7LmXYGJDGzbJ4zxukfOJSEDHc+Nkdlo=;
  b=Pz0/X7YJoHfx2WB6H5WlL15Xpc+9+Jo2ti1ryLA/xuLOQIM0QfODgEV0
   ujKxjJOqR+liuGoMj5WFrzofUpiyrasH/CWbYAotZ0C2nrqx7T7sxmP1V
   xSqQP+rwdke2P0Nt/3E85YTyvi21dKxtknGrD/O6mlbf1JlMfwy4HUnQH
   9IEttX+LhEIb0CEBVc/9iiHQXxvv0bBlMrXkL4YgvelC5Drb9y9mqCvhe
   BczjIxwY7kE+13Jkff/w+G2mUr7GTpwu7/IZgr6f/Fi2vPlQUhLOXdUz4
   jGlrkfQBUudn2u1ssBF4Lb1iLZMgPCwSf19b606QnUDUlNPZUQRmxlpZy
   g==;
X-CSE-ConnectionGUID: 76PkojldRT6vPYpz5l62hg==
X-CSE-MsgGUID: IUSzbP8xShSs87+WZbu6Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27769472"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="27769472"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 12:13:34 -0700
X-CSE-ConnectionGUID: ulFTdNS7TKK9+EnYMVAMTA==
X-CSE-MsgGUID: dkKWb7I+QEGNbOY65bYdOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="79925645"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 08 Oct 2024 12:13:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D9C1126B; Tue, 08 Oct 2024 22:13:30 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Chuanhua Han <hanchuanhua@oppo.com>,
	Barry Song <v-songbaohua@oppo.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] mm: Remove unused stub for can_swapin_thp()
Date: Tue,  8 Oct 2024 22:13:29 +0300
Message-ID: <20241008191329.2332346-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When can_swapin_thp() is unused, it prevents kernel builds
with clang, `make W=1` and CONFIG_WERROR=y:

mm/memory.c:4184:20: error: unused function 'can_swapin_thp' [-Werror,-Wunused-function]

Fix this by removing the unused stub.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Fixes: 242d12c98174 ("mm: support large folios swap-in for sync io devices")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 mm/memory.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 2366578015ad..c0869a962ddd 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4181,11 +4181,6 @@ static struct folio *alloc_swap_folio(struct vm_fault *vmf)
 	return __alloc_swap_folio(vmf);
 }
 #else /* !CONFIG_TRANSPARENT_HUGEPAGE */
-static inline bool can_swapin_thp(struct vm_fault *vmf, pte_t *ptep, int nr_pages)
-{
-	return false;
-}
-
 static struct folio *alloc_swap_folio(struct vm_fault *vmf)
 {
 	return __alloc_swap_folio(vmf);
-- 
2.43.0.rc1.1336.g36b5255a03ac

