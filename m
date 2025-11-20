Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10401E9905;
	Thu, 20 Nov 2025 23:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763680837; cv=none; b=Jqk2iGDqqkwl0OOTpRKxvzx2FT9PHKXZv2bpRTsaSmQa9Gn/c9jwpIBoznNu627KnvYElRZ/v7babGs7bbgzkhByx9Ro85C/arNjaNWNiGrbVMMSmkCZdCLkbo19Rl0sy3GDIMLOJpQ6WW4h9AkaUNk2d57C6ox0llfn1NyGW4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763680837; c=relaxed/simple;
	bh=Lq0Vl5lLGuNBti3HQiKBLrBqxQsHbv9D2PhJmpLi+70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkc4baJmlEw1Q9mTNQZ9Iuod11w2m3DYbsq8rHyvHeR9pD+6BLfUXsqba3bjK53rvMB+UsskX9O0RGqvZoY8Exd6Qb4sGv6jhvO69h56MIOJZ1h1dT9gOOpwj9/h8hUT7KrA53uXRqANATs5SaGFhq9q8xpiG2kZe3wEbjHG6nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g+mBYVvY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+mBYVvY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763680836; x=1795216836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lq0Vl5lLGuNBti3HQiKBLrBqxQsHbv9D2PhJmpLi+70=;
  b=g+mBYVvY2CCmAEbs0DfzEYkqMedrB7vVaPK0hBtEPr+zhkrHs4sam6B8
   zM+eAhbrXUKSwWzZCqGYXh5zyMlmsIP11D//aV7+oGpuklgJPDQCvNWNh
   CmzQ/XMOm+ytQjG2kkcDibiA0mFq9gEycG23wz9pv/9RSBVvKIx3VQ7Lo
   3L5UG26SqtiodeyB0X6uD/YR9u1aI3VuN3Kp2k7Rum24OgsZE+16B2l5T
   7jOXWc91tTsoaibsMsmmH3webv7mrCW9c5qA4vvtHAAuw+/GaC+8LuAb0
   EKigedUao9QFLzZaG7f+c+RBJD2sv2uYQPYGh8ENtG6aPQ3pXWPC/a/9D
   w==;
X-CSE-ConnectionGUID: 0NATzTszQRutdQn66ZZBrQ==
X-CSE-MsgGUID: zj5v4IV7Ska2wAzroLJ3OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69635404"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="69635404"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 15:20:35 -0800
X-CSE-ConnectionGUID: xyC7etM5Rdyf1EL6lKzDBQ==
X-CSE-MsgGUID: IpUrYyM6RamaoWVfXIuxaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="214872231"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Nov 2025 15:20:34 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMDx1-0004hX-2m;
	Thu, 20 Nov 2025 23:20:31 +0000
Date: Fri, 21 Nov 2025 07:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: Chi Zhiling <chizhiling@163.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/7] exfat: support reuse buffer head for
 exfat_ent_get
Message-ID: <202511210737.YlTzkgUO-lkp@intel.com>
References: <20251118082208.1034186-3-chizhiling@163.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118082208.1034186-3-chizhiling@163.com>

Hi Chi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.18-rc6 next-20251120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chi-Zhiling/exfat-add-cache-option-for-__exfat_ent_get/20251118-163146
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20251118082208.1034186-3-chizhiling%40163.com
patch subject: [RFC PATCH 2/7] exfat: support reuse buffer head for exfat_ent_get
config: hexagon-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511210737.YlTzkgUO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210737.YlTzkgUO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210737.YlTzkgUO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/exfat/fatent.c:100:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     100 |         if (!is_valid_cluster(sbi, loc)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/exfat/fatent.c:144:9: note: uninitialized use occurs here
     144 |         return err;
         |                ^~~
   fs/exfat/fatent.c:100:2: note: remove the 'if' if its condition is always false
     100 |         if (!is_valid_cluster(sbi, loc)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     101 |                 exfat_fs_error_ratelimit(sb,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     102 |                         "invalid access to FAT (entry 0x%08x)",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     103 |                         loc);
         |                         ~~~~~
     104 |                 goto err;
         |                 ~~~~~~~~~
     105 |         }
         |         ~
   fs/exfat/fatent.c:98:9: note: initialize the variable 'err' to silence this warning
      98 |         int err;
         |                ^
         |                 = 0
   1 warning generated.


vim +100 fs/exfat/fatent.c

31023864e67a5f Namjae Jeon 2020-03-02   90  
edadc12d948285 Chi Zhiling 2025-11-18   91  /*
edadc12d948285 Chi Zhiling 2025-11-18   92   * Caller must release the buffer_head if no error return.
edadc12d948285 Chi Zhiling 2025-11-18   93   */
31023864e67a5f Namjae Jeon 2020-03-02   94  int exfat_ent_get(struct super_block *sb, unsigned int loc,
edadc12d948285 Chi Zhiling 2025-11-18   95  		unsigned int *content, struct buffer_head **last)
31023864e67a5f Namjae Jeon 2020-03-02   96  {
31023864e67a5f Namjae Jeon 2020-03-02   97  	struct exfat_sb_info *sbi = EXFAT_SB(sb);
31023864e67a5f Namjae Jeon 2020-03-02   98  	int err;
31023864e67a5f Namjae Jeon 2020-03-02   99  
31023864e67a5f Namjae Jeon 2020-03-02 @100  	if (!is_valid_cluster(sbi, loc)) {
6dfba108387bf4 Chi Zhiling 2025-08-15  101  		exfat_fs_error_ratelimit(sb,
6dfba108387bf4 Chi Zhiling 2025-08-15  102  			"invalid access to FAT (entry 0x%08x)",
31023864e67a5f Namjae Jeon 2020-03-02  103  			loc);
edadc12d948285 Chi Zhiling 2025-11-18  104  		goto err;
31023864e67a5f Namjae Jeon 2020-03-02  105  	}
31023864e67a5f Namjae Jeon 2020-03-02  106  
edadc12d948285 Chi Zhiling 2025-11-18  107  	err = __exfat_ent_get(sb, loc, content, last);
edadc12d948285 Chi Zhiling 2025-11-18  108  	if (unlikely(err)) {
6dfba108387bf4 Chi Zhiling 2025-08-15  109  		exfat_fs_error_ratelimit(sb,
31023864e67a5f Namjae Jeon 2020-03-02  110  			"failed to access to FAT (entry 0x%08x, err:%d)",
31023864e67a5f Namjae Jeon 2020-03-02  111  			loc, err);
edadc12d948285 Chi Zhiling 2025-11-18  112  		goto err;
31023864e67a5f Namjae Jeon 2020-03-02  113  	}
31023864e67a5f Namjae Jeon 2020-03-02  114  
edadc12d948285 Chi Zhiling 2025-11-18  115  	if (unlikely(*content == EXFAT_FREE_CLUSTER)) {
6dfba108387bf4 Chi Zhiling 2025-08-15  116  		exfat_fs_error_ratelimit(sb,
31023864e67a5f Namjae Jeon 2020-03-02  117  			"invalid access to FAT free cluster (entry 0x%08x)",
31023864e67a5f Namjae Jeon 2020-03-02  118  			loc);
edadc12d948285 Chi Zhiling 2025-11-18  119  		goto err;
31023864e67a5f Namjae Jeon 2020-03-02  120  	}
31023864e67a5f Namjae Jeon 2020-03-02  121  
edadc12d948285 Chi Zhiling 2025-11-18  122  	if (unlikely(*content == EXFAT_BAD_CLUSTER)) {
6dfba108387bf4 Chi Zhiling 2025-08-15  123  		exfat_fs_error_ratelimit(sb,
31023864e67a5f Namjae Jeon 2020-03-02  124  			"invalid access to FAT bad cluster (entry 0x%08x)",
31023864e67a5f Namjae Jeon 2020-03-02  125  			loc);
edadc12d948285 Chi Zhiling 2025-11-18  126  		goto err;
31023864e67a5f Namjae Jeon 2020-03-02  127  	}
31023864e67a5f Namjae Jeon 2020-03-02  128  
31023864e67a5f Namjae Jeon 2020-03-02  129  	if (*content != EXFAT_EOF_CLUSTER && !is_valid_cluster(sbi, *content)) {
6dfba108387bf4 Chi Zhiling 2025-08-15  130  		exfat_fs_error_ratelimit(sb,
31023864e67a5f Namjae Jeon 2020-03-02  131  			"invalid access to FAT (entry 0x%08x) bogus content (0x%08x)",
31023864e67a5f Namjae Jeon 2020-03-02  132  			loc, *content);
edadc12d948285 Chi Zhiling 2025-11-18  133  		goto err;
31023864e67a5f Namjae Jeon 2020-03-02  134  	}
31023864e67a5f Namjae Jeon 2020-03-02  135  
31023864e67a5f Namjae Jeon 2020-03-02  136  	return 0;
edadc12d948285 Chi Zhiling 2025-11-18  137  err:
edadc12d948285 Chi Zhiling 2025-11-18  138  	if (last) {
edadc12d948285 Chi Zhiling 2025-11-18  139  		brelse(*last);
edadc12d948285 Chi Zhiling 2025-11-18  140  
edadc12d948285 Chi Zhiling 2025-11-18  141  		/* Avoid double release */
edadc12d948285 Chi Zhiling 2025-11-18  142  		*last = NULL;
edadc12d948285 Chi Zhiling 2025-11-18  143  	}
edadc12d948285 Chi Zhiling 2025-11-18  144  	return err;
31023864e67a5f Namjae Jeon 2020-03-02  145  }
31023864e67a5f Namjae Jeon 2020-03-02  146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
