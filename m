Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629115230;
	Wed,  2 Aug 2023 16:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690995027; x=1722531027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SjrhUfmUTRs0znB4RfQf3tTTDrqFwiLjTLl/vgLRaG8=;
  b=be2RGhbMyhOIxVdBbs0+OSroROzuuOAOgq4velsksX0Q+APjzeEUjS1h
   5jiMnpcIanBjAfkUBEjtQlVMaU/QZoWZ2Q8c2lFrjXM+VI70zvZ7YnVgz
   tJo01pD4al5U9uASqBcrTZSjkqfAlON9VG3bm9ooPlJObjyWPsKZrOFo9
   Tytj6t+WEc+knjZQfSmH3kaSrV0P+avZxUx4Vu4bDfBO+F65G+p33WPOk
   r+j6HsFcRYWuJEqdhCix3tJbCZGjHo7tqY+PqqppBS74/3pRpXzw2bCUW
   UBTtetNoIdZwwp46afUmdVuYDQ8NtSjQEIjnQDbkAzSEL5xff2X2NdUB0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="433480809"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="433480809"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 09:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="1059904147"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="1059904147"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Aug 2023 09:50:25 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRF3I-0001LL-2o;
	Wed, 02 Aug 2023 16:50:24 +0000
Date: Thu, 3 Aug 2023 00:49:41 +0800
From: kernel test robot <lkp@intel.com>
To: zhanchengbin <zhanchengbin1@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] ext4: ioctl add EXT4_IOC_SUPERBLOCK_KEY_S_ERRORS
Message-ID: <202308030029.p1ufH6az-lkp@intel.com>
References: <20230802083402.515570-3-zhanchengbin1@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802083402.515570-3-zhanchengbin1@huawei.com>

Hi zhanchengbin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on linus/master v6.5-rc4 next-20230802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhanchengbin/ext4-ioctl-adds-a-framework-for-modifying-superblock-parameters/20230802-163905
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20230802083402.515570-3-zhanchengbin1%40huawei.com
patch subject: [RFC PATCH 2/2] ext4: ioctl add EXT4_IOC_SUPERBLOCK_KEY_S_ERRORS
config: i386-randconfig-r026-20230801 (https://download.01.org/0day-ci/archive/20230803/202308030029.p1ufH6az-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030029.p1ufH6az-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308030029.p1ufH6az-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext4/ioctl.c:33:5: warning: no previous prototype for function 'sb_attr_errors_check' [-Wmissing-prototypes]
   int sb_attr_errors_check(struct ext4_sbattr *p_sbattr)
       ^
   fs/ext4/ioctl.c:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sb_attr_errors_check(struct ext4_sbattr *p_sbattr)
   ^
   static 
>> fs/ext4/ioctl.c:47:6: warning: no previous prototype for function 'sb_attr_errors_set' [-Wmissing-prototypes]
   void sb_attr_errors_set(struct ext4_super_block *es, const void *arg)
        ^
   fs/ext4/ioctl.c:47:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void sb_attr_errors_set(struct ext4_super_block *es, const void *arg)
   ^
   static 
   2 warnings generated.


vim +/sb_attr_errors_check +33 fs/ext4/ioctl.c

    29	
    30	typedef void ext4_update_sb_callback(struct ext4_super_block *es,
    31					       const void *arg);
    32	
  > 33	int sb_attr_errors_check(struct ext4_sbattr *p_sbattr)
    34	{
    35		__u16 error_behavior = *(__u16 *)(p_sbattr->sba_value);
    36	
    37		if (p_sbattr->sba_len != EXT4_IOC_SUPERBLOCK_LEN_S_ERRORS)
    38			return -EINVAL;
    39	
    40		if (error_behavior < EXT4_ERRORS_CONTINUE ||
    41		    error_behavior > EXT4_ERRORS_PANIC)
    42			return -EINVAL;
    43	
    44		return 0;
    45	}
    46	
  > 47	void sb_attr_errors_set(struct ext4_super_block *es, const void *arg)
    48	{
    49		struct ext4_sbattr *p_sbattr = (struct ext4_sbattr *)arg;
    50	
    51		es->s_errors = cpu_to_le16(*(__u16 *)p_sbattr->sba_value);
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
