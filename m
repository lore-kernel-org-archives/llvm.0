Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D561957FF;
	Sat, 16 Nov 2024 23:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731798623; cv=none; b=KAjTwDOeQaZ/0LUw0Wq1Wq4zJIWUMQnQ9y5JB5Zv4fJcfHzpdUuZS+XCgYxQ/FQBcMk9ZadZyiEiDKTnIe/PqhlMOA6sghQhO6zpc+nYvpNrp+i3rFdgrOvlveOQtCD5x+Q7HcgkRLJoZBwej6IDgQuHlGFoTUkVAtxW58PIIaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731798623; c=relaxed/simple;
	bh=Z/HkpWipnwhLBIY9kdd/Ia1KBf9aWjemqDYlqmxB1ug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rHPATOvOu2FMQmq+v6nJLRFlxs6FYUQjANE3ScjhhpzoIm80FU5D2E0OT3DoWElN7+Qbq9MLZTF6FJtugBM+AVVVz1XS4evYOJ8F3gN0z7AHRyy+zkTShtgHhwk9nZuR2ef3RCP69DGwPbuCs1GSF+OaEmruqvmNeSgNZZXVBGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qr/C0qZB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qr/C0qZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731798622; x=1763334622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z/HkpWipnwhLBIY9kdd/Ia1KBf9aWjemqDYlqmxB1ug=;
  b=Qr/C0qZBSdjnfxLIa+JybBYsAyOlP8naLkrfI9P3tjo66Y0mVPnTogNV
   Rhhu3ReIl2H4mLSkfEwRdUzuLXcRfGHulbftPQjAWUmrtknAtjhxO7mR9
   qZuFiL2lZlmnxfGAAuvsWvl4mjVwZjQMFMJXUfMrRdWPM9KmQYW7IUWhK
   ocul0c8cCluIyoXKCKcNC+yZVYvX7kTeicAEaLZh9PjaUkyBP65CpjOLU
   d67IKZMCm3QAnTpIzkIhSqPc18m8pD1CGCDhf6pR21UW1EGW0V0TyrSwJ
   Rt3Jxxff7Hf6TOLodmD5kuTy+ms2yLo3ZKY/oZfk78nzgW/0z9meE2/CP
   A==;
X-CSE-ConnectionGUID: Fr2ARjUhROGC1AZ/owBVEA==
X-CSE-MsgGUID: MWnxpHu7RPSbmmgWsEb2Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31936052"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="31936052"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 15:10:19 -0800
X-CSE-ConnectionGUID: mLHCh854RHu0eag25PyN2Q==
X-CSE-MsgGUID: p0sHHGDLSb2cqsYsjMZFKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88636107"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2024 15:10:17 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCRvi-0001A1-2v;
	Sat, 16 Nov 2024 23:10:14 +0000
Date: Sun, 17 Nov 2024 07:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 21/28] drivers/fwctl/cxl/cxl.c:68:12: error: use
 of undeclared identifier '__free_kvfree'; did you mean '__free_pages'?
Message-ID: <202411170749.kYYAaKTi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   81cb57f64be6af29f39bde3b3ca4203975a84377
commit: 8d042dccf81ccdd81279cd26a9bbd89f705fea56 [21/28] fwctl/cxl: Add hw_info callback
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20241117/202411170749.kYYAaKTi-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170749.kYYAaKTi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170749.kYYAaKTi-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/fwctl/cxl/cxl.c:47:9: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      47 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |                ^
   drivers/fwctl/cxl/cxl.c:47:7: error: incompatible integer to pointer conversion assigning to 'struct fwctl_info_cxl *' from 'int' [-Wint-conversion]
      47 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/fwctl/cxl/cxl.c:68:12: error: use of undeclared identifier '__free_kvfree'; did you mean '__free_pages'?
      68 |         void *out __free(kvfree) = kvzalloc(*out_len, GFP_KERNEL);
         |                   ^
   include/linux/cleanup.h:200:33: note: expanded from macro '__free'
     200 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:11:1: note: expanded from here
      11 | __free_kvfree
         | ^
   include/linux/gfp.h:371:13: note: '__free_pages' declared here
     371 | extern void __free_pages(struct page *page, unsigned int order);
         |             ^
>> drivers/fwctl/cxl/cxl.c:68:12: error: 'cleanup' function '__free_pages' must take 1 parameter
      68 |         void *out __free(kvfree) = kvzalloc(*out_len, GFP_KERNEL);
         |                   ^
   include/linux/cleanup.h:200:33: note: expanded from macro '__free'
     200 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:11:1: note: expanded from here
      11 | __free_kvfree
         | ^
>> drivers/fwctl/cxl/cxl.c:68:29: error: call to undeclared function 'kvzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      68 |         void *out __free(kvfree) = kvzalloc(*out_len, GFP_KERNEL);
         |                                    ^
>> drivers/fwctl/cxl/cxl.c:68:8: error: incompatible integer to pointer conversion initializing 'void *' with an expression of type 'int' [-Wint-conversion]
      68 |         void *out __free(kvfree) = kvzalloc(*out_len, GFP_KERNEL);
         |               ^                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 errors generated.


vim +68 drivers/fwctl/cxl/cxl.c

    55	
    56	static void *cxlctl_hw_info(struct fwctl_uctx *uctx, int commands, size_t *out_len)
    57	{
    58		struct cxlctl_uctx *cxlctl_uctx =
    59			container_of(uctx, struct cxlctl_uctx, uctx);
    60		struct fwctl_device *fwctl = uctx->fwctl;
    61		struct cxlctl_dev *cxlctl =
    62			container_of(fwctl, struct cxlctl_dev, fwctl);
    63		int rc;
    64	
    65		if (commands > cxlctl_uctx->nr_commands)
    66			return ERR_PTR(-EINVAL);
    67	
  > 68		void *out __free(kvfree) = kvzalloc(*out_len, GFP_KERNEL);
    69		if (!out)
    70			return ERR_PTR(-ENOMEM);
    71	
    72		rc = cxl_mailbox_user_commands_info_get(cxlctl->mbox,
    73							commands, out, out_len);
    74		if (rc)
    75			return ERR_PTR(rc);
    76	
    77		return_ptr(out);
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
