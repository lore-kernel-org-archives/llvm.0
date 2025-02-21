Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587481FBC81;
	Fri, 21 Feb 2025 04:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740111974; cv=none; b=Nr5BnZ9X6WdWDV0VMp+kZYFeB46RUxBnQQMH0/giwqCs9zjQEHke84iVP55dmo2IwV0deMOxq9aRvxQECxMt9zbyAsYzn192yYZmz5aBb/A9ipfolQQjhwQIU1tK0o1V+P3ov3KWuu+GZk9m5s1ZizQlkoYrKlFX7s/oVp2Z5B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740111974; c=relaxed/simple;
	bh=zNEC+y4nS2ZhhT0ooPJM1fhXtuC6ecBxWZVuBGXt8jY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cIP9SuoVh7R8dEaMKKkur2ipM/u6gMjYAUOZ9GMNrSLIStQsvuoDh6Ep5yqz6iN9GR5BLX4ufgUCLM8SctghGWCSvkrnrrdJkHbxafTQ+NygeoOYUErD56KIjMs+coEbuk0HLEukjSXijxdzL14j/IrHycTGTk4LPvuWJmLYFkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWvIIkDq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWvIIkDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740111972; x=1771647972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zNEC+y4nS2ZhhT0ooPJM1fhXtuC6ecBxWZVuBGXt8jY=;
  b=FWvIIkDqWDkPn0Nz6gpzwnW039m7xGuXhyVXsF1nXtA73LCQw8a0MzRA
   x3Xilwo8lxz20K3XJjyf1825tHq6yXfwALXXCZsvg1cRjDgO4wqwgUMuQ
   POy6sO4V9tIBBjIYyVafBOQ2Si/Rp8gnzPQw46J61y3uK0MpREduRJBIH
   8KwBEKnZQARLcC350n6IFTsdUHukH9GobFjB79MdLBMnUEgwTNF/vNHx6
   obK5Cqgjug75WpNgOgfFh2Fm+sv47oyzful89O1+LysG6nnT2R8LCr6SN
   cF8NBvCptkqM6VARTDM/gFtMtjWrISFAXdhA9F8/5x86J4rZiS36ytDn2
   g==;
X-CSE-ConnectionGUID: WGy9JGHwTgeapd7NwaR+ZA==
X-CSE-MsgGUID: SqXJUwuGS16FSycwr6Ym4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41182292"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="41182292"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 20:26:09 -0800
X-CSE-ConnectionGUID: q94/JwoLQCKRFCnCLMWkPg==
X-CSE-MsgGUID: zyrS+hL+Sny+d0WlNAmm7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="115452537"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Feb 2025 20:26:07 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlKc1-00056m-1b;
	Fri, 21 Feb 2025 04:26:05 +0000
Date: Fri, 21 Feb 2025 12:25:34 +0800
From: kernel test robot <lkp@intel.com>
To: John Daley <johndale@cisco.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Nelson Escobar <neescoba@cisco.com>,
	Satish Kharat <satishkh@cisco.com>
Subject: [linux-next:master 1515/5164] ERROR: modpost: "page_pool_create"
 [drivers/net/ethernet/cisco/enic/enic.ko] undefined!
Message-ID: <202502211253.3XRosM9I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   50a0c754714aa3ea0b0e62f3765eb666a1579f24
commit: d24cb52b2d8abc89739694ac0be7f0bc2da58e37 [1515/5164] enic: Use the Page Pool API for RX
config: i386-buildonly-randconfig-006-20250221 (https://download.01.org/0day-ci/archive/20250221/202502211253.3XRosM9I-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211253.3XRosM9I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211253.3XRosM9I-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
>> ERROR: modpost: "page_pool_create" [drivers/net/ethernet/cisco/enic/enic.ko] undefined!
>> ERROR: modpost: "page_pool_alloc_netmems" [drivers/net/ethernet/cisco/enic/enic.ko] undefined!
>> ERROR: modpost: "page_pool_alloc_frag_netmem" [drivers/net/ethernet/cisco/enic/enic.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
