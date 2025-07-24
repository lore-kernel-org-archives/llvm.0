Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F194925D1E9;
	Thu, 24 Jul 2025 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753347725; cv=none; b=MdTdAh9k8rMRyx1oeTAwLQcCeclwAMwYoeiz+HeVkjIivIKwlwYoyChbRf0TJsAMxH1pZY+d0ULYI3eOHdT+5ik9SqV5Oj2rh/TiT2Cob4OyRDV/1wHbpIQBs8uRWrGWa4O21gjHGDkIbuTxoko+LQWox0lJM2pkuhIh4bzWKho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753347725; c=relaxed/simple;
	bh=0dO2URZl4K45DKG7qPNIIkutRDdHG7Ce2Rokv//r5Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uhuutCxU0hpQoS70iPK+WrtP5tqqtgCvAy8Xf8P/vdU/esr4PTh3IXNd8ET1rMcDaXt5CCQPvuL1zbhfSHejAGTHq/ruFnRvhtN8a/3xQ+5fagLt4Rn/nNs5ZxZKfXckjlCGwcJujIYwm7UyQJbudexUGj1fIi83PCGq+iHu/Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBb/bNOl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBb/bNOl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753347724; x=1784883724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0dO2URZl4K45DKG7qPNIIkutRDdHG7Ce2Rokv//r5Zs=;
  b=KBb/bNOlhrsQjQB72xNg5xA1GkR8CVVeTge09xyt8Nu38VzgVF4ZuDEt
   BMm843w5SnUedBZNGLcVnkuleDdB7NKj8n/4mVMzTb8kf4AuhLIaz0Tyk
   bHz03he4AcZ5RjOXRVA2b+lRrZ6GuVwxjdifppuXuO5hQ/SvlznMPxxEn
   PKV8ausHjX8u9q+PVlFN8cVEPUPXzr6XnngygxvUqx9KxI35q/KnLqNSl
   syArz4nSOOt4dCQQP2ipBEhktnekC35F158Z9Or10EEBXzsRBfjfNXf3C
   j+n7UL48kf+A6e8CU7lxiZdzKxvPHHQyBHOlb7aPHGNJnVmLzMcWgQjTd
   w==;
X-CSE-ConnectionGUID: 183pqAKsRPqxIaMMpFIlDg==
X-CSE-MsgGUID: VfG9IkjpRLiAf2EOzggIQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="67084961"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="67084961"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 02:02:04 -0700
X-CSE-ConnectionGUID: Zn6rqp3WT+qy64XPPUg8vg==
X-CSE-MsgGUID: lH4AIpsZSt6t4H8j1QZqqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="160378942"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 02:02:02 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uerpw-000KG3-1c;
	Thu, 24 Jul 2025 09:02:00 +0000
Date: Thu, 24 Jul 2025 17:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:vm_normal_page_pud 6/10]
 include/linux/pgtable.h:2099:21: error: invalid register name
Message-ID: <202507241656.X2gQNivK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux vm_normal_page_pud
head:   003d8c09bad32ddd03332b6356751f332e161659
commit: fa859b2c9755a46929caa5414f8594cc8ef3f40f [6/10] mm/rmap: convert rmap_level to generic pgtable_level
config: x86_64-buildonly-randconfig-002-20250724 (https://download.01.org/0day-ci/archive/20250724/202507241656.X2gQNivK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241656.X2gQNivK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507241656.X2gQNivK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> include/linux/pgtable.h:2099:21: error: invalid register name
   enum pgtable_level {
                       ^
>> include/linux/pgtable.h:2099:21: error: Expected an op-mask register at this point
   enum pgtable_level {
                       ^
>> include/linux/pgtable.h:2100:23: error: expected newline
    PGTABLE_LEVEL_PTE = 0,
                         ^
>> include/linux/pgtable.h:2101:19: error: unknown token in expression
    PGTABLE_LEVEL_PMD,
                     ^
   include/linux/pgtable.h:2102:19: error: unknown token in expression
    PGTABLE_LEVEL_PUD,
                     ^
   include/linux/pgtable.h:2103:19: error: unknown token in expression
    PGTABLE_LEVEL_P4D,
                     ^
   include/linux/pgtable.h:2104:19: error: unknown token in expression
    PGTABLE_LEVEL_PGD,
                     ^
>> include/linux/pgtable.h:2105:1: error: invalid instruction mnemonic '}'
   };
   ^


vim +2099 include/linux/pgtable.h

  2098	
> 2099	enum pgtable_level {
> 2100		PGTABLE_LEVEL_PTE = 0,
> 2101		PGTABLE_LEVEL_PMD,
> 2102		PGTABLE_LEVEL_PUD,
  2103		PGTABLE_LEVEL_P4D,
  2104		PGTABLE_LEVEL_PGD,
> 2105	};
  2106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
