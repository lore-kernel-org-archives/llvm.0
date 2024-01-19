Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45201E48B;
	Fri, 19 Jan 2024 22:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705704261; cv=none; b=qSsiWAPY5ceodEvMZbROgT0/zIZ4VBMafwou+7wihx9kQ6ZP9BO2KyqqqPpYKLa7+1d4J5gr7YV/vB0o39vLg2z1Hr6PYqG7mEgJDkLx+l5GETdH5x3C5ffygegzXCb/DoJfz5avwgfb4nTtFzdivaJ0Y2NkA4a6C4m2mR9OuTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705704261; c=relaxed/simple;
	bh=p6odk3Ini6u4mmECfO11wu0U99cb9ZzXxqHie34gnnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LJnsbtRQIkB7UwbKfoao20yV7YE/3NYOhDlLfLcYoUofoK4UrcED44av1/6o6LIEbhjjpeY7qOGT0MCVd9Fx79SPsThaF7alUS+37/DKyij5JllQk1xu6Srzxut6nXp+5sCQhjqjh/vkBiV2iRRrXzPEVGFtUeCGTlMut7qaRDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ld9Iz/M/; arc=none smtp.client-ip=192.55.52.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ld9Iz/M/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705704259; x=1737240259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p6odk3Ini6u4mmECfO11wu0U99cb9ZzXxqHie34gnnk=;
  b=Ld9Iz/M/noz9u6US2vdvNauq3tSZTrdSWizZwrYIam7AnoRQ9YnU4dB0
   CJR/M5Gn5tFUxBVACoQYv5CDZFV+pBxeHBhUNxbm/3x59lJXeXTpfBXWb
   CD8EPhugNSeOQhhgZTV7L8IonMhK6u5lOOhvvfmnHNrOGuSmIq4bx9ejc
   jnQfavHsp1CT8vbQHFsqCZLmbyYEufnA+o5CsQLhVz51gqySoasuSjeji
   O2drqQpdXZacVBWUMDLFyJqe3u0WYspSvtPxiCK00btoX/M2eVW2GtXwi
   GbapXW/h/KNjyKivIuCzc3FQoFl8GBVW7b97mu8KSkeYlo+/KQu9hM7Dj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="487011876"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="487011876"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 14:44:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="734650741"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="734650741"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Jan 2024 14:44:17 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQxaw-0004Tw-2b;
	Fri, 19 Jan 2024 22:44:14 +0000
Date: Sat, 20 Jan 2024 06:44:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Huang, Ying" <ying.huang@intel.com>
Subject: [djiang:cxl-hmem-report 12/13] drivers/cxl/core/cdat.c:627:9: error:
 call to undeclared function 'hmat_update_target_coordinates'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202401200653.z2X2MAO4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-hmem-report
head:   b720bb8edd5a52abe7d5c888245352e3dbaefdb1
commit: b278f4f522cb92b95bad61cbd30324f94eaf778c [12/13] cxl: Add memory hotplug notifier for cxl region
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240120/202401200653.z2X2MAO4-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d92ce344bf641e6bb025b41b3f1a77dd25e2b3e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200653.z2X2MAO4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200653.z2X2MAO4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/core/cdat.c:627:9: error: call to undeclared function 'hmat_update_target_coordinates'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     627 |         return hmat_update_target_coordinates(nid, &cxlr->coord[access], access);
         |                ^
   1 error generated.


vim +/hmat_update_target_coordinates +627 drivers/cxl/core/cdat.c

   623	
   624	int cxl_update_hmat_access_coordinates(int nid, struct cxl_region *cxlr,
   625					       enum access_coordinate_class access)
   626	{
 > 627		return hmat_update_target_coordinates(nid, &cxlr->coord[access], access);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
