Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BFD2AD13;
	Tue,  7 Jan 2025 04:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736224364; cv=none; b=Bc9A+Z7SnKptSiIUINNGSW5KYOHfCvHv/c/2sZx2Bs3uThFT94EAbQ453vwYz0D9JN96VzZGW02wii1Yh0loyfn5SnXf0NHtrLl58ftrhDUf9pkoCTyYnx6veqF0GvVm/m5MwifIWZyf4hAcn7cbqRwPL5nZfwSC9alo1WkRzok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736224364; c=relaxed/simple;
	bh=T8NHXwcvraan/I0nf/E1ezPZwgK6wkV+wM4iaB+Oyuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eAgwYWZnbY8CiVy9ohFUHI1xCNoEnH21/hw3Ys+hv7nQpyq9Iei9lq0ft+aKuMQwsY0YQzip1p+uoB2ianlUdQeEJZiGxQwUcH19qyKkyeOgKSbwf6gUivv6RK2BoT6mT/fMgcWjS6ctuW7CqBMQPaBeUdOQ3FoqlAFGXuAeI7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFLEHZSw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFLEHZSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736224361; x=1767760361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T8NHXwcvraan/I0nf/E1ezPZwgK6wkV+wM4iaB+Oyuc=;
  b=aFLEHZSwp80qIoQunvq0RZI+BSOanpqccJBiJBE+wKth2bWJakewG32z
   KVQ9q8pGx/6/SCUTeAfJDIIvmwPW5m7AV8UDjbqrS5IflMYmznTKpbTJQ
   72Uptr2Haxer9feyOey0dXX7VqBaGLwUy0pRjKqSjoP/e8M6Ygdpr2wMU
   0qVDg13PHmux7dVzzFwW2u06hykNBrKmMVxueFSMF3VRSVj9UHUXsBPyb
   vAvr2Yqe0GINUqOvY3/1hwC+OIUnP1ZstV+SxphQCi5BkD9U8Ugjc+4yt
   vWTg4f/rH8+TH0WZmeZvzV3nY6uzt+16be/q5fMZTBlLZcmpoE5fCa5EF
   A==;
X-CSE-ConnectionGUID: 6VW40J6XTZ6XAIJRZ4ctIA==
X-CSE-MsgGUID: 6VPfaqwzR1GwKVui8JBYxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="47059839"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="47059839"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 20:32:40 -0800
X-CSE-ConnectionGUID: A7yfvTR8QmurLIqVWJ5sjA==
X-CSE-MsgGUID: 1CZKLOq0SrS+DWWC/6q4pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="102465649"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Jan 2025 20:32:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV1Ge-000EFN-2y;
	Tue, 07 Jan 2025 04:32:36 +0000
Date: Tue, 7 Jan 2025 12:32:14 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_pagecache 6/6] mm/migrate.c:2753: warning:
 Function parameter or struct member 'folio' not described in
 'promotion_candidate'
Message-ID: <202501071202.mCEEi2nO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_pagecache
head:   0b481ba53a1ea6337129cbe63f9234a748df4843
commit: 0b481ba53a1ea6337129cbe63f9234a748df4843 [6/6] migrate,sysfs: add pagecache promotion
config: i386-buildonly-randconfig-003-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071202.mCEEi2nO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501071202.mCEEi2nO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501071202.mCEEi2nO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/migrate.c:2753: warning: Function parameter or struct member 'folio' not described in 'promotion_candidate'


vim +2753 mm/migrate.c

  2741	
  2742	/**
  2743	 * promotion_candidate: report a promotion candidate folio
  2744	 *
  2745	 * The folio will be isolated from LRU if selected, and task_work will
  2746	 * putback the folio on promotion failure.
  2747	 *
  2748	 * Candidates may not be promoted and may be returned to the LRU.
  2749	 *
  2750	 * Takes a folio reference that will be released in task work.
  2751	 */
  2752	void promotion_candidate(struct folio *folio)
> 2753	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
