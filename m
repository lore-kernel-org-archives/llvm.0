Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F48325F98A;
	Thu, 30 Apr 2026 02:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777515930; cv=none; b=cubdOecBXmcrKYWSMHW816K4unTf3AcDaJ/i6aHyO2ZCoQ839TakD+zQoI7R3sUhA6R4N+ODxftErNDxClqJSJSAu62CdJ1ex6d8r/RlL2oMSQFAV1fT/0zsrv0XAD/wzlxF/G7WPe816smJMj/+KXJKzJnZKpciIAAtEMGp/OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777515930; c=relaxed/simple;
	bh=OGb9tfrgQNP10hKbWyzU17zKzqAihjSGotUXO93TuNk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M/OaZ/CVlB3lwxJBa/P/aDvbFcKvgWCGojfnOIs4W2qYbvfd8NG1JrgidROYgcfQ0CKf5OCRJSd3m480tN+YNC0KhYjkm4+fWpthRp1gIXLpm6jaMGIUY/pHOzRJKUigz7eqyIbB6Ns/4tmkzsRsNJyQS0qXhVA4vmPe/AMU2vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IP1s4MxY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IP1s4MxY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777515928; x=1809051928;
  h=date:from:to:cc:subject:message-id;
  bh=OGb9tfrgQNP10hKbWyzU17zKzqAihjSGotUXO93TuNk=;
  b=IP1s4MxYq0YZuUpyi05rBL4nnOJ/4wzh9CMh87dP8e0XulTovLXOFFkY
   OahCqeHT1N9O2fQ4JFdetw7DD3OnsAeH3TIjgSOKTwHJ0DEBlJ0OcUQUn
   gBvEWo5Asx603WF0qfsh0DRgAbT53SHeXCb6qDUYdPHDGhgPDzfccrkUo
   02UqeDraqp7aQkXqcfwzudSvAF40fji0gVa/rib1WlIKs8FzeGlofR2NU
   Np9g+RI9n3RRqR9su6H2e99L+gLomD600R8uw4g/nohizol4Mz5/Ud48y
   rfS6DvVAcd2EfvHNITpSZL6rz6RONffpjtKaTEsVpWNPdF4iVA3dMslDV
   w==;
X-CSE-ConnectionGUID: eJk70LFJSc2X5hoBBdSaCg==
X-CSE-MsgGUID: zeyK+oomSFScXzbQoPdBQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78326234"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78326234"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 19:25:28 -0700
X-CSE-ConnectionGUID: /Lne4KvpQ4+6yL1B6sA5ww==
X-CSE-MsgGUID: +L0FSZFaTbW/lOXV7JW4jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="257772913"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Apr 2026 19:25:26 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIH5f-00000000Bom-3Ejh;
	Thu, 30 Apr 2026 02:25:23 +0000
Date: Thu, 30 Apr 2026 10:24:35 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/hmx 26/56]
 drivers/video/fbdev/smscufx.c:802:52: error: use of undeclared identifier
 'PAGE_SHARED'
Message-ID: <202604301034.gW2J7Art-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/hmx
head:   702d39aaafd354863915b40f8167c4d998175f9c
commit: 5168e5ebe50537ef5ae89f3e1af1de1913f9c59d [26/56] hexagon: add memory management enhancements
config: hexagon-randconfig-002-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301034.gW2J7Art-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301034.gW2J7Art-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301034.gW2J7Art-lkp@intel.com/

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
