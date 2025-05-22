Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52C07482;
	Thu, 22 May 2025 04:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747888697; cv=none; b=NkNdSAez2JRXuUHiNtBm3DynrhnS7xbsPun/b6dqRoGplmO8Clmz5PrMItzpwP4dJJl+fzr9iy+wDS2eJTgIAR4xSSXwvzsbO6xRMOTj38o84UoZxJZYwpQuXNAUbBHuCL6KmGlirbtYFdyWXvOsYrCp22xOdnpLcjJ7o5TbOTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747888697; c=relaxed/simple;
	bh=mjm+qbDlPKjFPQVScfn1BHIfcZdfts9WkUTzAzsXPH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NlV1OZVmqvXWN9TbmBg7KvcLYNkCVF0lpiMobXm9TZbqDWJtvETTigcuz6s8rbJYRBd7yUcwJwro5FOCxYbTVH397GsG7btMLKnrN0qphMAwBrhncgXdnqv/tSeqrRZ1NZfx5L6biVnAGqTHjkdVlMbY8qvUqqd3vD27w+7S/Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gisjnxnt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gisjnxnt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747888695; x=1779424695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mjm+qbDlPKjFPQVScfn1BHIfcZdfts9WkUTzAzsXPH0=;
  b=gisjnxntvTen7CJFjVj8OEexdulW5fwPxbKXS2I5dZk6ZXfwLfSG5kyL
   fm5mYIMqP4ByxSo4iRB8UZScP9DwVq/R1QGnSJ2XvzJB1U0zJrbUUP4HS
   gRJsuSRZaRqvtn/8Q+ajM8V03xlnt9pq0p9W2N3jrji8rVX5wMzqSJ75f
   KYAXrCSwo2BWYli3Nm21+g8UhtdnMsore/HsQtxPq88EdMscB/eylWSpt
   WWiYprddLWd+7aXLpWO/kj0WTnv4xJ5TDx2YpemtRa0Z503/1JlJqlCh4
   i1BaGMZVfzxZYb2FXsmGaLVaPvv18KMhRTPDaJobFrP0pq+6rR40fj3px
   A==;
X-CSE-ConnectionGUID: 53rEkCz8TSOb1M9m1OlRRQ==
X-CSE-MsgGUID: phUm6U4sQ4m3Zj70Wxk0Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53691122"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="53691122"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 21:38:14 -0700
X-CSE-ConnectionGUID: 5PKnwZ2hTBy395/FuYQDPw==
X-CSE-MsgGUID: iujxd+FeRZGlpGFpKeimxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="140926829"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 May 2025 21:37:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHxgq-000Oue-0P;
	Thu, 22 May 2025 04:37:56 +0000
Date: Thu, 22 May 2025 12:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 15/22] ld.lld: error: undefined symbol:
 zsmalloc_mops
Message-ID: <202505221256.0yyRMtYR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   d598167a1ec281079ea1f6a0f041fa2b1918001a
commit: 0de34259230765111a99df3cc784279f07aa31df [15/22] mm: stop storing migration_ops in page->mapping
config: i386-randconfig-005-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221256.0yyRMtYR-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221256.0yyRMtYR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221256.0yyRMtYR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: zsmalloc_mops
   >>> referenced by migrate.c:142 (mm/migrate.c:142)
   >>>               mm/migrate.o:(isolate_non_folio_page) in archive vmlinux.a
   >>> referenced by migrate.c:0 (mm/migrate.c:0)
   >>>               mm/migrate.o:(putback_non_folio_page) in archive vmlinux.a
   >>> referenced by migrate.c:0 (mm/migrate.c:0)
   >>>               mm/migrate.o:(migrate_pages_batch) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
