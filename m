Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A950D1624C5;
	Tue, 17 Feb 2026 11:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771327000; cv=none; b=mNZ9fsv0duGeMiX/sMk9+IBmdMDU77f2oiGnImYrSZ0D5IjxgfkKN4Dm9DizK4tWt6OqLWf1jtfLI+ZeqGWan+H8bZtHpKncDeWKZ+vQKiYxqQAlcKHu/LTjHccDyIgarL8wvxT0AA6oUi43yQWFWSC22xGcKpCUB4NhNriCuJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771327000; c=relaxed/simple;
	bh=kGqfIQDTVCoEnxXWDpVosDZ6o6/h+fp2jwSXEyzWFAA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VDXYywNK91q3+o4Bs7ntzFdfrAJmYepZ6bEQfw0XCHDsZHb5nsOAQ/8O7rXtToBYY7+yzip3XeCVJxwcq5mxnwtywsWZnNdxv1kB2f1VJNZMWPOr8Z9Nl0gaDQ/UIpWcgvXaRGMs12hNEnCVCFWuTAfDS/egLSaO1wl5j3jELpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDN1I5si; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDN1I5si"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771326999; x=1802862999;
  h=date:from:to:cc:subject:message-id;
  bh=kGqfIQDTVCoEnxXWDpVosDZ6o6/h+fp2jwSXEyzWFAA=;
  b=dDN1I5siWN/tF7BZhsivFFzeQYPBJw8WPV6xLNsi2Tfw7PysiYrAcLhG
   z6P4D8VCU6lHfnwmVXlHgjWvjPJjjdgwAeIS19l2rMFdAhrr29ubxBeBE
   cQBNEwXqsOWIuGrdFNx2lVSQH4gU7+dciZ1AMvRNSCJGWhaU38fccyVpH
   CWICVyf/vZuF2W+HIiQFFkOq+xI3dxnYPB/h0qUPfYY31kt9BJPXAxPXc
   Ag26YeIwzVaEuUsozs/oycV11UQveS4/ZnuerpPH5SHw4pg6DFi0ruIX2
   B2GKzb774oPB83Rz6+qW4PgYn28eCLl5chD744exof0WakO/odQGIMkZw
   w==;
X-CSE-ConnectionGUID: s6Om5PX2QFiW9XiZIIm1oQ==
X-CSE-MsgGUID: rGc+nKNcRH26X+zl/CeuEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="74992851"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="74992851"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 03:16:38 -0800
X-CSE-ConnectionGUID: K4vV9UqnRIK1m7VIt6YnWw==
X-CSE-MsgGUID: qLJOTdwpSTaKfE3wq6wMwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="212336353"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Feb 2026 03:16:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsJ4E-000000010si-1Uqq;
	Tue, 17 Feb 2026 11:16:34 +0000
Date: Tue, 17 Feb 2026 19:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 33/41]
 drivers/video/fbdev/udlfb.c:350:52: error: use of undeclared identifier
 'PAGE_SHARED'
Message-ID: <202602171935.9Pf4NjEl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   62702f080dc2ac995b8515a4e564fac852471147
commit: 548c797c73b9fc63c25c2d482b6f985c4af02adb [33/41] hexagon: fix page table model for hexagon VM
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260217/202602171935.9Pf4NjEl-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171935.9Pf4NjEl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171935.9Pf4NjEl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/udlfb.c:350:52: error: use of undeclared identifier 'PAGE_SHARED'
     350 |                 if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
         |                                                                  ^
   1 error generated.
--
>> drivers/video/fbdev/smscufx.c:802:52: error: use of undeclared identifier 'PAGE_SHARED'
     802 |                 if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
         |                                                                  ^
   1 error generated.


vim +/PAGE_SHARED +350 drivers/video/fbdev/udlfb.c

59277b679f8b5c drivers/staging/udlfb/udlfb.c Bernie Thompson    2009-11-24  323  
4574203f45eb26 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  324  static int dlfb_ops_mmap(struct fb_info *info, struct vm_area_struct *vma)
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  325  {
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  326  	unsigned long start = vma->vm_start;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  327  	unsigned long size = vma->vm_end - vma->vm_start;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  328  	unsigned long offset = vma->vm_pgoff << PAGE_SHIFT;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  329  	unsigned long page, pos;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  330  
5905585103276b drivers/video/fbdev/udlfb.c   Thomas Zimmermann  2022-04-29  331  	if (info->fbdefio)
5905585103276b drivers/video/fbdev/udlfb.c   Thomas Zimmermann  2022-04-29  332  		return fb_deferred_io_mmap(info, vma);
5905585103276b drivers/video/fbdev/udlfb.c   Thomas Zimmermann  2022-04-29  333  
76f92201b821dd drivers/video/fbdev/udlfb.c   Thomas Zimmermann  2023-11-27  334  	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
76f92201b821dd drivers/video/fbdev/udlfb.c   Thomas Zimmermann  2023-11-27  335  
04f8afbec37f63 drivers/video/udlfb.c         Tomi Valkeinen     2013-04-18  336  	if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
04f8afbec37f63 drivers/video/udlfb.c         Tomi Valkeinen     2013-04-18  337  		return -EINVAL;
04f8afbec37f63 drivers/video/udlfb.c         Tomi Valkeinen     2013-04-18  338  	if (size > info->fix.smem_len)
04f8afbec37f63 drivers/video/udlfb.c         Tomi Valkeinen     2013-04-18  339  		return -EINVAL;
04f8afbec37f63 drivers/video/udlfb.c         Tomi Valkeinen     2013-04-18  340  	if (offset > info->fix.smem_len - size)
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  341  		return -EINVAL;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  342  
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  343  	pos = (unsigned long)info->fix.smem_start + offset;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  344  
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  345  	dev_dbg(info->dev, "mmap() framebuffer addr:%lu size:%lu\n",
2685cffa9e7992 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  346  		pos, size);
2685cffa9e7992 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  347  
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  348  	while (size > 0) {
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  349  		page = vmalloc_to_pfn((void *)pos);
f05e0575ed334a drivers/staging/udlfb/udlfb.c Greg Kroah-Hartman 2009-06-03 @350  		if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  351  			return -EAGAIN;
f05e0575ed334a drivers/staging/udlfb/udlfb.c Greg Kroah-Hartman 2009-06-03  352  
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  353  		start += PAGE_SIZE;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  354  		pos += PAGE_SIZE;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  355  		if (size > PAGE_SIZE)
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  356  			size -= PAGE_SIZE;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  357  		else
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  358  			size = 0;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  359  	}
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  360  
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  361  	return 0;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  362  }
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  363  

:::::: The code at line 350 was first introduced by commit
:::::: f05e0575ed334a23dad91b8f6ed0ac42a3996b8d Staging: udlfb: clean up checkpatch warnings in udlfb.c

:::::: TO: Greg Kroah-Hartman <gregkh@suse.de>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
