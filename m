Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8E73148B4
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 14:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762786022; cv=none; b=RIRhFuFf3pCGnt3ioT/cPsJY/5WKrTnf3PFQOvRMa4erqqurpkYMz1CfHbl+2lrvMTscRLPa8kCchQ/oRlGi7MnzkHdH9zGTmATd6BQ8REV9a0VCjwXW5QZiyF6YBNVnJJFX+2eL8VX6el/vQzVzQoHblbDDhGe0mA+9KqIyryw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762786022; c=relaxed/simple;
	bh=S182r2lsewPICyaylRQbPz+g5CauLqJBFEwdDL6xZfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r5pI+QlHuA09QitACdyW+JQe1P4sqhTsE8qHsfarU0TmsZ7kHKThx39iTVbGFKiMnk/oTomlWLY7i43+edy6cB4xur/zf4QWYWt40RV9IFLQPR/sVZIBDntrXKVmovSRk0jbeNzXpMzZ3ayfGDJCLhcmNQM84T/LrMU7r6WU2rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apWArB6v; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apWArB6v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762786020; x=1794322020;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S182r2lsewPICyaylRQbPz+g5CauLqJBFEwdDL6xZfA=;
  b=apWArB6vJGENXNLXF2BeqDA3U6dcSvB53IpRyS206X4KRhtC9/khuBfF
   MRtSXBhBod2W6vaSB4G11leuVSogjTJyDHSDs2YIyr9hVs4W8yv/w97Wh
   CfB2O8NUzkwuKvrqQpfFwtmUXaKsh4ybKROTm0d/AuBOBxah2nfl6INy/
   ryL0STuEf0cgq5fgTbCGpHZGJFjAro4buSsWAvhVLpeSCofX82kzmEEZc
   A3l7EXk3to0sqX8F+gH85fti7D4k1f5WQIOtRZR7LoF5cHb3AyRUcCAfu
   jHrpCqmfB9sTJiWQP6JLAIJynnByEtTYMrvRqSMzcvP5c59lQA7+0ztSS
   A==;
X-CSE-ConnectionGUID: fpM71a/ZQjCBUSKJ7HP54Q==
X-CSE-MsgGUID: UWVpd172SAOBsLCaRBLTvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64870546"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64870546"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 06:47:00 -0800
X-CSE-ConnectionGUID: GD0RI4PqTtiCCVKHcfrW1A==
X-CSE-MsgGUID: pd/YdXoIQby7U7ZEgcSQhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="192947687"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 10 Nov 2025 06:46:56 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 3A05895; Mon, 10 Nov 2025 15:46:56 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Ilya Dryomov <idryomov@gmail.com>,
	Xiubo Li <xiubli@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: [PATCH v1 1/1] libceph: Amend checking to fix `make W=1` build breakage
Date: Mon, 10 Nov 2025 15:46:53 +0100
Message-ID: <20251110144653.375367-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a few cases the code compares 32-bit value to a SIZE_MAX derived
constant which is much higher than that value on 64-bit platforms,
Clang, in particular, is not happy about this

net/ceph/osdmap.c:1441:10: error: result of comparison of constant 4611686018427387891 with expression of type 'u32' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
 1441 |         if (len > (SIZE_MAX - sizeof(*pg)) / sizeof(u32))
      |             ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
net/ceph/osdmap.c:1624:10: error: result of comparison of constant 2305843009213693945 with expression of type 'u32' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
 1624 |         if (len > (SIZE_MAX - sizeof(*pg)) / (2 * sizeof(u32)))
      |             ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

fs/ceph/snap.c:377:10: error: result of comparison of constant 2305843009213693948 with expression of type 'u32' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
  377 |         if (num > (SIZE_MAX - sizeof(*snapc)) / sizeof(u64))
      |             ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fix this by casting to size_t. Note, that possible replacement of SIZE_MAX
by U32_MAX may lead to the behaviour changes on the corner cases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 net/ceph/osdmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ceph/osdmap.c b/net/ceph/osdmap.c
index 295098873861..8e7cb2fde6f1 100644
--- a/net/ceph/osdmap.c
+++ b/net/ceph/osdmap.c
@@ -1438,7 +1438,7 @@ static struct ceph_pg_mapping *__decode_pg_temp(void **p, void *end,
 	ceph_decode_32_safe(p, end, len, e_inval);
 	if (len == 0 && incremental)
 		return NULL;	/* new_pg_temp: [] to remove */
-	if (len > (SIZE_MAX - sizeof(*pg)) / sizeof(u32))
+	if ((size_t)len > (SIZE_MAX - sizeof(*pg)) / sizeof(u32))
 		return ERR_PTR(-EINVAL);
 
 	ceph_decode_need(p, end, len * sizeof(u32), e_inval);
@@ -1621,7 +1621,7 @@ static struct ceph_pg_mapping *__decode_pg_upmap_items(void **p, void *end,
 	u32 len, i;
 
 	ceph_decode_32_safe(p, end, len, e_inval);
-	if (len > (SIZE_MAX - sizeof(*pg)) / (2 * sizeof(u32)))
+	if ((size_t)len > (SIZE_MAX - sizeof(*pg)) / (2 * sizeof(u32)))
 		return ERR_PTR(-EINVAL);
 
 	ceph_decode_need(p, end, 2 * len * sizeof(u32), e_inval);
-- 
2.50.1

