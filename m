Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AE8296162;
	Fri, 11 Apr 2025 07:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744357487; cv=none; b=g4GksedI1dgKT9SQESVmQGudz8KvBiyHvZ3sxjAhhFW0uHMXsQgUNtOoVgyp9YVfUO6ogpGUbOkUKuWStjiq4YFibrgeorTQDHvsIGYENKO+QLGDxGL899KGrCWPBkVl0u/vUABOYCznXnhuh4fh5VMyoh4q6pLb/G4+59GRmjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744357487; c=relaxed/simple;
	bh=BatrTrRZ7JbnzpwmHwqLBJA+VfyF2JrypX+7zybZCtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyWOfg7AW24W8sE0HvYUJbXTAiUQ5ePIwz0B8u5iCZ0q85Q2r0VDXva6iZMUqsFObQyea3p4QMkq2HYjGbgMD9fQSFzRBEpouFHyprI2oc2+erItwLvRfoOeEOoRYMYWt1plTCZLdL6M4orUviJu9KQNUFhxHlgl5fuAS7IpOaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z5+Lw/pg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z5+Lw/pg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744357485; x=1775893485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BatrTrRZ7JbnzpwmHwqLBJA+VfyF2JrypX+7zybZCtk=;
  b=Z5+Lw/pgRx49u1yZFgsdx7Wm8rx58cKV6Wq+S+0Ou96HT9QUj+7NaSQm
   +nXb0nousVjRh/PC21FDAegO9xm8bsWjPr4zDkD8GQo8Ov3QUFhUklqoH
   SBZfOpUP5B0sSt/YiF+jvNAeh2WqdlxlHT1QCdgVx0nYUFEuhrHZIlKpY
   IJ30ohAAlZRtLeUXk82kKnRrhx3FU23Me8QH0aJGxMAy01/WZvc7WlAmN
   tTlBhSSd66GufFVBA/04/XP5+JqDWdpuFWDbLaS4vFUIUrFoWwKyJQ01c
   ROk1R7k6TQ68jaJIPlmErEH/SP+/yCI1FQBW/S40EMEv+My4dGdam3tzA
   Q==;
X-CSE-ConnectionGUID: t+5XfyvmSgO13CHxLVT8UQ==
X-CSE-MsgGUID: auXCtRJ0T1yY+4Dx179mgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="46067878"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="46067878"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 00:44:44 -0700
X-CSE-ConnectionGUID: yco92PoOR6OZAG9251mptA==
X-CSE-MsgGUID: YPEP/conRxqdoCsd2q8WeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="133230360"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Apr 2025 00:44:42 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3944-000Aws-0L;
	Fri, 11 Apr 2025 07:44:40 +0000
Date: Fri, 11 Apr 2025 15:44:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bo Liu <liubo03@inspur.com>, xiang@kernel.org, chao@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Bo Liu <liubo03@inspur.com>
Subject: Re: [PATCH 2/2] erofs: support deflate decompress by using Intel QAT
Message-ID: <202504111545.9ZYfP6Gr-lkp@intel.com>
References: <20250410042048.3044-3-liubo03@inspur.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410042048.3044-3-liubo03@inspur.com>

Hi Bo,

kernel test robot noticed the following build errors:

[auto build test ERROR on xiang-erofs/dev-test]
[also build test ERROR on xiang-erofs/dev linus/master v6.15-rc1]
[cannot apply to xiang-erofs/fixes next-20250411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Liu/erofs-remove-duplicate-code/20250410-122442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20250410042048.3044-3-liubo03%40inspur.com
patch subject: [PATCH 2/2] erofs: support deflate decompress by using Intel QAT
config: x86_64-buildonly-randconfig-003-20250411 (https://download.01.org/0day-ci/archive/20250411/202504111545.9ZYfP6Gr-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504111545.9ZYfP6Gr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504111545.9ZYfP6Gr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/erofs/sysfs.c:136:12: error: no member named 'erofs_tfm' in 'struct erofs_sb_info'
     136 |                 if (sbi->erofs_tfm)
         |                     ~~~  ^
   fs/erofs/sysfs.c:138:33: error: no member named 'erofs_tfm' in 'struct erofs_sb_info'
     138 |                                 crypto_comp_alg_common(sbi->erofs_tfm)->base.cra_driver_name);
         |                                                        ~~~  ^
   2 errors generated.


vim +136 fs/erofs/sysfs.c

   115	
   116	static ssize_t erofs_attr_show(struct kobject *kobj,
   117					struct attribute *attr, char *buf)
   118	{
   119		struct erofs_sb_info *sbi = container_of(kobj, struct erofs_sb_info,
   120							s_kobj);
   121		struct erofs_attr *a = container_of(attr, struct erofs_attr, attr);
   122		unsigned char *ptr = __struct_ptr(sbi, a->struct_type, a->offset);
   123	
   124		switch (a->attr_id) {
   125		case attr_feature:
   126			return sysfs_emit(buf, "supported\n");
   127		case attr_pointer_ui:
   128			if (!ptr)
   129				return 0;
   130			return sysfs_emit(buf, "%u\n", *(unsigned int *)ptr);
   131		case attr_pointer_bool:
   132			if (!ptr)
   133				return 0;
   134			return sysfs_emit(buf, "%d\n", *(bool *)ptr);
   135		case attr_comp_crypto:
 > 136			if (sbi->erofs_tfm)
   137				return sysfs_emit(buf, "%s\n",
   138					crypto_comp_alg_common(sbi->erofs_tfm)->base.cra_driver_name);
   139			else
   140				return sysfs_emit(buf, "NONE\n");
   141		}
   142		return 0;
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
