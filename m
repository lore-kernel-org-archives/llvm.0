Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522D537C107;
	Mon, 13 Apr 2026 08:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069034; cv=none; b=QGqmvdLkdFC7oiTJDkZipwXFld3OmQVDUCyRyxtzL7Nh3f5xGvna9UBTeubXwgIykpgltm5cfNkqE8NGc/pl/Y5mTa40Oxl8VCoEHVcZgVOauU05FvMe2XFmqtJmY5DViUHQ+wlkwK2idMBtAGRDRRL3ShpbH8X6vx/2wEZkyvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069034; c=relaxed/simple;
	bh=basOywsiI3wh3nikVgiIweTGNU00sqZdqSpyaZlVRDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvwhVgO9s0YcsR3/AYgGlAPWu9kZXxUqHZSEXCz/MtqKMH+gNLP4p0lL6WLMmYCZKIS0UXSO90Y7ymWdoLDCdzNRTYPnXyEbEg67Xs8iHX08JTynT+hAinrOUGdf7GKmx9dtyzrOCIbMK3JDEozNkp8C+Nf9JRWtxoF+gSrfSjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6qHjeuc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6qHjeuc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776069033; x=1807605033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=basOywsiI3wh3nikVgiIweTGNU00sqZdqSpyaZlVRDk=;
  b=I6qHjeucVp5PtuWY0luEeZk9RNAK9f/87VvCqb/uQqtP7FkgLVaq2pIi
   LnoPK6Ig6Td8fmvqkIWjiQXajFAWFVVXqtWIIIgmrZbh/Ua7Ai422meNK
   YrwqGrijYCpMkKdKo9UOSCygtGQ6TL7uw022BaDbvmBwp3+sf+j0xU8A3
   qBl2QkbGCRcRImzW+34HHvMf4LFbZvfi6X+JId3VGp6IdAP1QNaJQWytI
   BCUZKG4hBJQDA4lV13d/CQ+rqEEAeJCGXe9IZAJWwGSy60QHQO2DRNCPY
   FrNOFK+C+71TeqbpG0WWw2vKuxZI06ng813H/6EvjVxlgguSnHTR+UY/P
   A==;
X-CSE-ConnectionGUID: xhYxFpVNQryJAUx/pXye+A==
X-CSE-MsgGUID: XFKe/P2eRg+F2yRlrykWnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76959704"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="76959704"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 01:30:33 -0700
X-CSE-ConnectionGUID: 1bgjYVYYSfuoredBAXI95A==
X-CSE-MsgGUID: hDEnkYcgRTeTGqeTTd/4Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="260167796"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Apr 2026 01:30:32 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCCgb-000000000DD-2uUe;
	Mon, 13 Apr 2026 08:30:27 +0000
Date: Mon, 13 Apr 2026 16:29:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] fs: drop_caches: introduce per-node drop_caches
 interface
Message-ID: <202604130943.MLP9ZgAQ-lkp@intel.com>
References: <20260409063503.3475420-1-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409063503.3475420-1-wangkefeng.wang@huawei.com>

Hi Kefeng,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on brauner-vfs/vfs.all driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v7.0-rc7 next-20260410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/fs-drop_caches-introduce-per-node-drop_caches-interface/20260412-192452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260409063503.3475420-1-wangkefeng.wang%40huawei.com
patch subject: [PATCH RFC] fs: drop_caches: introduce per-node drop_caches interface
config: powerpc64-randconfig-002-20260413 (https://download.01.org/0day-ci/archive/20260413/202604130943.MLP9ZgAQ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604130943.MLP9ZgAQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604130943.MLP9ZgAQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/drop_caches.c:148:5: error: redefinition of 'drop_caches_register_node'
     148 | int drop_caches_register_node(struct node *node)
         |     ^
   include/linux/fs.h:3661:19: note: previous definition is here
    3661 | static inline int drop_caches_register_node(struct node *node) { return 0; }
         |                   ^
>> fs/drop_caches.c:153:6: error: redefinition of 'drop_caches_unregister_node'
     153 | void drop_caches_unregister_node(struct node *node)
         |      ^
   include/linux/fs.h:3662:20: note: previous definition is here
    3662 | static inline void drop_caches_unregister_node(struct node *node) {}
         |                    ^
   2 errors generated.


vim +/drop_caches_register_node +148 fs/drop_caches.c

   146	
   147	static DEVICE_ATTR_WO(drop_caches);
 > 148	int drop_caches_register_node(struct node *node)
   149	{
   150		return device_create_file(&node->dev, &dev_attr_drop_caches);
   151	}
   152	
 > 153	void drop_caches_unregister_node(struct node *node)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
