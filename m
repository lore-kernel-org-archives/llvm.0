Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E9D42B308;
	Fri, 10 Jul 2026 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688817; cv=none; b=X/6Q7QX2kRes5gWMDxZwSCww3j1eya+b+91X13zRKDv1PPV8QSCgX5EOzAbIiNVloBBq10WjzNeI8oDowKFU6cc4FeQ9bA60eU2fydvYwvjY/7W9HMzzqChwRMe673kzg1ELjtGyMJFeQar2sNcL3a37hq/T9ymCpbzxUvNZjcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688817; c=relaxed/simple;
	bh=duBvtzlFJom3QCDoxYagOQl4KIBkpWaZXyPwspdnfuw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pHdMzEBekhOBRfqF+JjxYGLFnVD20qJRQ+hLJrYWlA5MJXHReQHUsEtG+trSGxkQrb+X3FBc7ss+mRdLy209UQL83wl6jmf0ISZbsXJor1iIYvBEWELbIQaot69cxbwryr+YE9Nj6g35XQKNHatIcAXbsQiI1wJf9rrxNCw30oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HHf9loKI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HHf9loKI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783688816; x=1815224816;
  h=date:from:to:cc:subject:message-id;
  bh=duBvtzlFJom3QCDoxYagOQl4KIBkpWaZXyPwspdnfuw=;
  b=HHf9loKIgOD6txWIeZqtwfIZgIusT0dA1CFMKM0bPDPLZR/6mKaCDfee
   nbEFg6cALU7+YjoOdxxM4b3QxJQCNu8fj5wrcM2ilWUL5mryKJFjp9QRp
   da0dXEWqrl+7d5Btg2JDd1WUunXx3DdP5N2AO4kpVnItzNT4yxmQl+wMa
   Aoqr0bUHdIap6ibsdSfrMKck7tIY3Ni9idyTN/18k/OSwwuXGjFKx++L5
   qRnmCW5KztSE2anfMKXevZpeLfDqK8rImydDw36Z9+75y7lf8foM2nYmZ
   FJEuSFxL3M9fAYlK3y7VZ9UODgCb0SPigBM3oL5t+paDIVfGcGCObVD9a
   Q==;
X-CSE-ConnectionGUID: 3pV93jxnTT+LyRfiSb0HTg==
X-CSE-MsgGUID: V6n6KqjDSbieTfZn4k8kpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88298386"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88298386"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 06:06:53 -0700
X-CSE-ConnectionGUID: aEdvfhhkRx+x9cxIbS1TnQ==
X-CSE-MsgGUID: WZuL2EOxRkKBJpa6P+9H/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259193024"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 10 Jul 2026 06:06:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiAwK-00000000IvO-3yUp;
	Fri, 10 Jul 2026 13:06:48 +0000
Date: Fri, 10 Jul 2026 21:06:13 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: 
 [gourryinverse:scratch/gourry/cxl/compression/file_cleancache 87/98]
 mm/internal.h:2086:15: error: unknown type name 'rmap_t'
Message-ID: <202607102042.LZPwOQ3J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/cxl/compression/file_cleancache
head:   bcd0bfca5b64d6cbb5aadb07554b9bd218e0df85
commit: 6e2dd58311ea13f03bd4c1f38bd1d4d5818803ce [87/98] mm/migrate: re-install migrated write-fenced folios read-only
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260710/202607102042.LZPwOQ3J-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607102042.LZPwOQ3J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607102042.LZPwOQ3J-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:54:
>> mm/internal.h:2086:15: error: unknown type name 'rmap_t'
    2086 | static inline rmap_t migration_remap_rmap_flags(struct folio *folio,
         |               ^
>> mm/internal.h:2091:10: error: use of undeclared identifier 'RMAP_EXCLUSIVE'
    2091 |                 return RMAP_EXCLUSIVE;
         |                        ^
>> mm/internal.h:2092:9: error: use of undeclared identifier 'RMAP_NONE'; did you mean 'DMA_NONE'?
    2092 |         return RMAP_NONE;
         |                ^~~~~~~~~
         |                DMA_NONE
   include/linux/dma-direction.h:9:2: note: 'DMA_NONE' declared here
       9 |         DMA_NONE = 3,
         |         ^
   In file included from mm/filemap.c:54:
   mm/internal.h:2096:10: error: unknown type name 'rmap_t'
    2096 |                                             rmap_t rmap_flags)
         |                                             ^
   mm/internal.h:2105:50: error: use of undeclared identifier 'RMAP_EXCLUSIVE'
    2105 |         return !folio_test_anon(folio) || (rmap_flags & RMAP_EXCLUSIVE);
         |                                                         ^
   5 errors generated.


vim +/rmap_t +2086 mm/internal.h

  2073	
  2074	/*
  2075	 * Resolve rmap flags and writability for a folio being re-installed present
  2076	 * after migration.  Shared by remove_migration_pte() and remove_migration_pmd().
  2077	 *
  2078	 * Exclusivity is the single lever.  Anon writability requires exclusive
  2079	 * ownership.  A writable migration entry is only ever made for an exclusive anon
  2080	 * page; see make_writable_migration_entry() and the VM_WARN in
  2081	 * try_to_migrate_one().  A folio that must stay read-only, one on a write-fenced
  2082	 * node, is kept non-exclusive here, and writability falls out as false.  The
  2083	 * next write then COW-promotes it off-node.  This also makes the "writable anon
  2084	 * implies exclusive" invariant structural rather than a tripwire.
  2085	 */
> 2086	static inline rmap_t migration_remap_rmap_flags(struct folio *folio,
  2087							bool was_read)
  2088	{
  2089		if (folio_test_anon(folio) && !was_read &&
  2090		    !node_write_fenced(folio_nid(folio)))
> 2091			return RMAP_EXCLUSIVE;
> 2092		return RMAP_NONE;
  2093	}
  2094	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
