Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627B71FCC43;
	Tue, 12 Nov 2024 16:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731430724; cv=none; b=bzYbBHT7Rn5lHVfq795bpmBZe/LCIqOLhEyWLE3soOp3RjHug/IElAQ4XMQFeecQ/v614rvUhBhO5Vslo2G/iSoKB39Nevmv3MrDpqN5kxlyNmLQvRF82aZx7cu9UmB9uWok7fPsd7teYixyOhACShX7+ukx6w+o+Y6M/SreNlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731430724; c=relaxed/simple;
	bh=aeoydx0HLFHSStAdMKkZnSfEwsDzUEWxHMeOyr5IZs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkVFnfd3iA7t/XxpgPG4bjBO/jWs7IjjdNbxpdgNWZUcu7gDxtybDa9nS0Y3eSVth4BmE8Q/W6yPVoCcCqFllwctVrLQLeEXCvu7BXa9PxWz+ml8z0P4FSZV24HFd6MiBcBhsPD6ppzwfRm3gPEXTIUPFSNTW+tFhgBfyboLMlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DnkSp0Mg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnkSp0Mg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731430721; x=1762966721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aeoydx0HLFHSStAdMKkZnSfEwsDzUEWxHMeOyr5IZs4=;
  b=DnkSp0Mg6FyNcGumNju9bdsn1nHsmqt082aQGJNox2eHQ6+1M8emEWxU
   283hqjdYL2Rq8M5xh4diXk7oW9+IG7Ry+Dv34uknLOGGG2QmN8clwKL3w
   I66cCWNDdjDN1sI1x8cWVYujoRTU50P1cQBGPpXvhOclB1kedcJDBp9vY
   KCEAb8U78ucPeM1NJoSXm7EA9yJxgrhOIHxUFc2shwhiLogVgx/LEi+OX
   dVWAc6lbpn2tETdjxPbmXMvvkzz3bNaUECyGquIT5TOtwwDBPqLXszU7Y
   5GgEDFtC07LYxG7HvfKWtJWmjUo6MKSZDDLMGF9jtv8xLPISib4zFXgAh
   g==;
X-CSE-ConnectionGUID: 9K5F0gY5TA+/zBRnPQ74hQ==
X-CSE-MsgGUID: aUQOvaW3QXy0NUtNO1x/+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="41888156"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="41888156"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 08:58:40 -0800
X-CSE-ConnectionGUID: TTsunEUaTSiwLWuDYqCwdA==
X-CSE-MsgGUID: FpX1XzS+RM+WhOuJGDmlnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="91597022"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Nov 2024 08:58:38 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAuDr-0001YD-1w;
	Tue, 12 Nov 2024 16:58:35 +0000
Date: Wed, 13 Nov 2024 00:57:44 +0800
From: kernel test robot <lkp@intel.com>
To: Chunhai Guo <guochunhai@vivo.com>, xiang@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, chao@kernel.org,
	huyue2@coolpad.com, jefflexu@linux.alibaba.com, dhavale@google.com,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Chunhai Guo <guochunhai@vivo.com>
Subject: Re: [PATCH] erofs: add sysfs node to drop all compression-related
 caches
Message-ID: <202411130033.ZP2Akhk8-lkp@intel.com>
References: <20241112091403.586545-1-guochunhai@vivo.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112091403.586545-1-guochunhai@vivo.com>

Hi Chunhai,

kernel test robot noticed the following build errors:

[auto build test ERROR on xiang-erofs/dev-test]
[also build test ERROR on xiang-erofs/dev xiang-erofs/fixes linus/master v6.12-rc7 next-20241112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chunhai-Guo/erofs-add-sysfs-node-to-drop-all-compression-related-caches/20241112-170412
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20241112091403.586545-1-guochunhai%40vivo.com
patch subject: [PATCH] erofs: add sysfs node to drop all compression-related caches
config: i386-randconfig-003-20241112 (https://download.01.org/0day-ci/archive/20241113/202411130033.ZP2Akhk8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130033.ZP2Akhk8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130033.ZP2Akhk8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/erofs/sysfs.c:9:
   In file included from fs/erofs/internal.h:11:
   In file included from include/linux/dax.h:6:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/erofs/sysfs.c:175:3: error: call to undeclared function 'z_erofs_shrink_scan'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     175 |                 z_erofs_shrink_scan(sbi, ~0UL);
         |                 ^
   1 warning and 1 error generated.


vim +/z_erofs_shrink_scan +175 fs/erofs/sysfs.c

   132	
   133	static ssize_t erofs_attr_store(struct kobject *kobj, struct attribute *attr,
   134							const char *buf, size_t len)
   135	{
   136		struct erofs_sb_info *sbi = container_of(kobj, struct erofs_sb_info,
   137							s_kobj);
   138		struct erofs_attr *a = container_of(attr, struct erofs_attr, attr);
   139		unsigned char *ptr = __struct_ptr(sbi, a->struct_type, a->offset);
   140		unsigned long t;
   141		int ret;
   142	
   143		switch (a->attr_id) {
   144		case attr_pointer_ui:
   145			if (!ptr)
   146				return 0;
   147			ret = kstrtoul(skip_spaces(buf), 0, &t);
   148			if (ret)
   149				return ret;
   150			if (t != (unsigned int)t)
   151				return -ERANGE;
   152	#ifdef CONFIG_EROFS_FS_ZIP
   153			if (!strcmp(a->attr.name, "sync_decompress") &&
   154			    (t > EROFS_SYNC_DECOMPRESS_FORCE_OFF))
   155				return -EINVAL;
   156	#endif
   157			*(unsigned int *)ptr = t;
   158			return len;
   159		case attr_pointer_bool:
   160			if (!ptr)
   161				return 0;
   162			ret = kstrtoul(skip_spaces(buf), 0, &t);
   163			if (ret)
   164				return ret;
   165			if (t != 0 && t != 1)
   166				return -EINVAL;
   167			*(bool *)ptr = !!t;
   168			return len;
   169		case attr_drop_caches:
   170			ret = kstrtoul(skip_spaces(buf), 0, &t);
   171			if (ret)
   172				return ret;
   173			if (t != 1)
   174				return -EINVAL;
 > 175			z_erofs_shrink_scan(sbi, ~0UL);
   176			return len;
   177		}
   178		return 0;
   179	}
   180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
