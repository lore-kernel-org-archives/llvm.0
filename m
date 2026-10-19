Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C64495539;
	Mon, 19 Oct 2026 09:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402601; cv=none; b=OHdKfznuLk8EXGVg2CEbFJjODRxT01W/UYROBMXzXIFnM8FWrwSY+x6rrm98FwxuhuqhEHcA0iWNHeNYDFvcp6ZcV/Uhh1S3MZf6sTNr5CSsHFpsZdNIDs6dr3lu6KrFzZ1QBjdm32Y9wsb2ymzLDL5eOz9mESRuZKGWED6uW7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402601; c=relaxed/simple;
	bh=ZNYn0o6QlkDZHTT0Ij4GjtQ9uliVC93GZH1xhSky+aM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qba1f+iQUBQjB9HwKCH54LbJIIdPxzH3ShL24CpkIs6WiEuHO6V0wosnAfm3eT0vyCW4NPBp9R1PglACjw7mZbE03a7vvPtJDvYerNpBi9tM2J2HKddb5vSaHT4JmknijAtwCK2u0GPM9eXx/Uu8A1U4OW6WdTd+2irPbyzn3m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gDiM3geP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gDiM3geP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792402599; x=1823938599;
  h=date:from:to:cc:subject:message-id;
  bh=ZNYn0o6QlkDZHTT0Ij4GjtQ9uliVC93GZH1xhSky+aM=;
  b=gDiM3gePfj4yx40Qd4xlM7PoNJmmllO+5jILIH9tGodNr1iUftKgZAvM
   8IomKEeAWJ8vkO0Dv+uo/u9vUpP5owYvygzfQhBeDsIKTQUPjn7SFurT1
   QMPEX/Y9p22f76xIX5EAJXfpR++7PbuRQXgJtvQ5Is5h686mnkYHf7MTe
   bYmZRP6m0Cec+L+Ds/gw4nogtjv4/yMskGgkZ32wc4OvcRJiYZmC35D5Y
   BfkNOt3IrXo7Ht8xbo1pkNBBQGsm2O1nYzLtGPi+2n28Tqksk/nzywUab
   byZh2QRPrPtEDZiS3CXDigMxKsw5V/yNq4LwPlmimtMRVpW2D6tau3H4B
   Q==;
X-CSE-ConnectionGUID: JfzurHQfSoyNhAJO+WW2Eg==
X-CSE-MsgGUID: el4zpNZQRCagAlvixEz3tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1066546"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1066546"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 02:36:38 -0700
X-CSE-ConnectionGUID: 2ff5VxcZRFS6UxpAgY6xlQ==
X-CSE-MsgGUID: xZH0+GvPT7ywi3GpTRTF2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2869194"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Oct 2026 02:36:37 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIjnG-00000000LUI-1A3J;
	Mon, 19 Oct 2026 09:36:34 +0000
Date: Mon, 19 Oct 2026 17:35:37 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:hexagon 2/82] drivers/video/fbdev/smscufx.c:802:52:
 error: use of undeclared identifier 'PAGE_SHARED'
Message-ID: <202610191931.5HtFIFIu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git hexagon
head:   35ab1dadb94646b74469738c1741f68e8c6aac3d
commit: a068d81e03bf28e40eceb94bc49e122f09177d70 [2/82] hexagon: fix the page table model for the Hexagon VM
config: hexagon-randconfig-1000-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191931.5HtFIFIu-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191931.5HtFIFIu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191931.5HtFIFIu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/smscufx.c:802:52: error: use of undeclared identifier 'PAGE_SHARED'
     802 |                 if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
         |                                                                  ^~~~~~~~~~~
>> drivers/video/fbdev/smscufx.c:802:52: error: use of undeclared identifier 'PAGE_SHARED'
     802 |                 if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
         |                                                                  ^~~~~~~~~~~
>> drivers/video/fbdev/smscufx.c:802:52: error: use of undeclared identifier 'PAGE_SHARED'
     802 |                 if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
         |                                                                  ^~~~~~~~~~~
   3 errors generated.


vim +/PAGE_SHARED +802 drivers/video/fbdev/smscufx.c

3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  775  
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  776  static int ufx_ops_mmap(struct fb_info *info, struct vm_area_struct *vma)
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  777  {
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  778  	unsigned long start = vma->vm_start;
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  779  	unsigned long size = vma->vm_end - vma->vm_start;
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  780  	unsigned long offset = vma->vm_pgoff << PAGE_SHIFT;
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  781  	unsigned long page, pos;
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  782  
5905585103276b7 drivers/video/fbdev/smscufx.c Thomas Zimmermann 2022-04-29  783  	if (info->fbdefio)
5905585103276b7 drivers/video/fbdev/smscufx.c Thomas Zimmermann 2022-04-29  784  		return fb_deferred_io_mmap(info, vma);
5905585103276b7 drivers/video/fbdev/smscufx.c Thomas Zimmermann 2022-04-29  785  
76f92201b821dd2 drivers/video/fbdev/smscufx.c Thomas Zimmermann 2023-11-27  786  	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
76f92201b821dd2 drivers/video/fbdev/smscufx.c Thomas Zimmermann 2023-11-27  787  
04f8afbec37f63f drivers/video/smscufx.c       Tomi Valkeinen    2013-04-18  788  	if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
04f8afbec37f63f drivers/video/smscufx.c       Tomi Valkeinen    2013-04-18  789  		return -EINVAL;
04f8afbec37f63f drivers/video/smscufx.c       Tomi Valkeinen    2013-04-18  790  	if (size > info->fix.smem_len)
04f8afbec37f63f drivers/video/smscufx.c       Tomi Valkeinen    2013-04-18  791  		return -EINVAL;
04f8afbec37f63f drivers/video/smscufx.c       Tomi Valkeinen    2013-04-18  792  	if (offset > info->fix.smem_len - size)
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  793  		return -EINVAL;
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  794  
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  795  	pos = (unsigned long)info->fix.smem_start + offset;
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  796  
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  797  	pr_debug("mmap() framebuffer addr:%lu size:%lu\n",
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  798  		  pos, size);
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  799  
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  800  	while (size > 0) {
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  801  		page = vmalloc_to_pfn((void *)pos);
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18 @802  		if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  803  			return -EAGAIN;
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  804  
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  805  		start += PAGE_SIZE;
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  806  		pos += PAGE_SIZE;
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  807  		if (size > PAGE_SIZE)
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  808  			size -= PAGE_SIZE;
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  809  		else
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  810  			size = 0;
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  811  	}
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  812  
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  813  	return 0;
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  814  }
3c8a63e22a0802f drivers/video/smscufx.c       Steve Glendinning 2011-08-18  815  

:::::: The code at line 802 was first introduced by commit
:::::: 3c8a63e22a0802fd56380f6ab305b419f18eb6f5 Add support for SMSC UFX6000/7000 USB display adapters

:::::: TO: Steve Glendinning <steve.glendinning@smsc.com>
:::::: CC: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
