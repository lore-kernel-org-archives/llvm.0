Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D1618026;
	Sun, 17 Mar 2024 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710670221; cv=none; b=pBLKwjhvpDo9yhVx9qpFJ8ecZGrz8neM1x/jh15belhS+UVfcJODSPX1p1mZH+VmMdhf24cOJn8wZpvL572BOh+QZwBzl+jG7Y55kTqQZn+/3wuHROq3jzRkp6Y0eoiDORpfJ0/Gc1BNlHMVnOHQ31siFxBoK35qrUou2mC3VCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710670221; c=relaxed/simple;
	bh=RH3jhxvXqqxpZMvOrjGJpJOcFyWT4dS+IUtpLkuziQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOH4jUtG8rV7D54jvhuSc38/ZE409F3fYG+CZN43XY/dwPkunn0UWyBvT6FIlZ78l+zg3Gxe6NAxp6MuXAs1eMFOs3DZ8Ta4sX8uRaOje/IVFdIjb+IWnlDulUkRnEwuV1ZfcfJ9C7O7Hs+tjDmlVKMX/1ZViKNxxLjXrTLZ9Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=el9X9aBW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="el9X9aBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710670218; x=1742206218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RH3jhxvXqqxpZMvOrjGJpJOcFyWT4dS+IUtpLkuziQY=;
  b=el9X9aBWA4hEHEuMZRxdybjCbulo4bWzAzHqrLMq86NxxMg7jxRTJJAr
   oGQeuEMDWQqmVsRPFCDsPXPQ6hn3/Y3PhkBxV1d4xfnt5a/CetQfnFj+r
   ezj9I5bQXC/cFl86TjwcOi2PCAwjWtAMSGwGI0mzmgeveX3wYuxTQGB5E
   Tkw+27m2wZqqoIgDUedzxE8Kmz8xBGjEYDFX6yVYpvMSUPAjRpEUX/OkB
   7bsWlIJ/kUaUBDW6krSJabKm6cQ50jb8ZTBaY9MOUFE6maPZZPA8DZOIL
   nSszTBtN34E7+18E96FOiP6Fqm16CwjhOW6NW/bR8jQRSMY6nJxEqkiza
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="16893450"
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="16893450"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 03:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,132,1708416000"; 
   d="scan'208";a="17876616"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Mar 2024 03:10:16 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlnT3-000GAb-2z;
	Sun, 17 Mar 2024 10:10:13 +0000
Date: Sun, 17 Mar 2024 18:09:29 +0800
From: kernel test robot <lkp@intel.com>
To: Fan Wu <wufan@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v15 17/21] fsverity: consume builtin signature via
 LSM hook
Message-ID: <202403171729.j4sXFWcI-lkp@intel.com>
References: <1710560151-28904-18-git-send-email-wufan@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1710560151-28904-18-git-send-email-wufan@linux.microsoft.com>

Hi Fan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master next-20240315]
[cannot apply to device-mapper-dm/for-next lwn/docs-next v6.8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fan-Wu/security-add-ipe-lsm/20240316-114235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/1710560151-28904-18-git-send-email-wufan%40linux.microsoft.com
patch subject: [RFC PATCH v15 17/21] fsverity: consume builtin signature via LSM hook
config: x86_64-buildonly-randconfig-006-20240317 (https://download.01.org/0day-ci/archive/20240317/202403171729.j4sXFWcI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403171729.j4sXFWcI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403171729.j4sXFWcI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/verity/open.c:11:
   include/linux/security.h:1029:33: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    1029 |                                               enum lsm_intgr_type, type,
         |                                                                    ^
         |                                                                    int
   include/linux/security.h:1029:31: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
    1029 |                                               enum lsm_intgr_type, type,
         |                                                                  ^
   include/linux/security.h:1519:32: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    1519 |                                              enum lsm_intgr_type, type,
         |                                                                   ^
         |                                                                   int
   include/linux/security.h:1519:30: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
    1519 |                                              enum lsm_intgr_type, type,
         |                                                                 ^
>> fs/verity/open.c:182:36: error: too few arguments to function call, expected 5, have 4
     180 |         return security_inode_setintegrity(inode, LSM_INTGR_FSV_SIG,
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     181 |                                            desc->signature,
     182 |                                            le32_to_cpu(desc->sig_size));
         |                                                                       ^
   include/linux/security.h:1028:19: note: 'security_inode_setintegrity' declared here
    1028 | static inline int security_inode_setintegrity(struct inode *inode,
         |                   ^                           ~~~~~~~~~~~~~~~~~~~~
    1029 |                                               enum lsm_intgr_type, type,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~
    1030 |                                               const void *value, size_t size)
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 3 errors generated.


vim +182 fs/verity/open.c

   175	
   176	#ifdef CONFIG_FS_VERITY_BUILTIN_SIGNATURES
   177	static int fsverity_inode_setintegrity(struct inode *inode,
   178					       const struct fsverity_descriptor *desc)
   179	{
   180		return security_inode_setintegrity(inode, LSM_INTGR_FSV_SIG,
   181						   desc->signature,
 > 182						   le32_to_cpu(desc->sig_size));
   183	}
   184	#else
   185	static inline int fsverity_inode_setintegrity(struct inode *inode,
   186						      const struct fsverity_descriptor *desc)
   187	{
   188		return 0;
   189	}
   190	#endif /* CONFIG_FS_VERITY_BUILTIN_SIGNATURES */
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
