Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792800258;
	b=ydy6hYQsD3ZZ3aXU10ZyQTvlrL9dpJtvZu91eKpZUfKl7TzCnNcwqXFACvMvZ2xnjsEf
	 +dOyeHOIapA9WLvf/5ZGeBKsAjFmIMjYp3hmieEQiccfl9qgMY0wCJtFF2d/I9YLYkq8q
	 0/OqX/RrppPz73tXW8vmYw4X3l/PLfNWvnF4U5Wg8fhYPIeN0ByCaWBYZBG/cok9b5rGh
	 fA5Ar358Tn+OH1kUZrbl4AXe4r0tb2pFi+gjJzVa4aUYwDa5VNQ2tKV8JX+d0PSE+DYuV
	 IE2t8zwDePq6Ug1naXsp+RctnumqpRBh0z2WbERBHUy9w3b1lmp/4WnTFryKtHF7TJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792800258;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ziYWLz9wM2tT4veM70p1I58aNnF0qcqrKAyoRgOGTlE=;
	b=pgbyPx18U35M8E5LsY7Zu0ItFoFXmrfPfoce25uxowbrGfDXOxuyTNXZi3FxDEVX03x5
	 aXzcsZ+XO/lhamAi8AaLFoHB/9WDvtCt4vKJ850xvwYGhx/GHxBKo8kLpOt9pgme2tO5x
	 sZD4tDligWYIzqIkt3fZ/70XZ0LzI2yFDbSBI5WKvWMU6PFnK1MvUg9JtZWtkGVyOvBrW
	 3oS6jOQpseXNndrvAl6UZzFldv0AZ2KJjcAVSsvh8S0wMNEcmtUyv/+uV5HP9DHgXhFDf
	 lPeQGaEHaou8KE4i3nKRKqu9Wh+7UVc1c7eK1ul0l0tALrDh/hLyHRoQXN/3z10WePw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="N/HuAZsJ";
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFCD606A321;
	Sat, 24 Oct 2026 00:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EFCD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N/HuAZsJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792800257; x=1824336257;
  h=date:from:to:cc:subject:message-id;
  bh=AjEZFQzlNnZwW7yjYYp8BWuGXBYroqkYijbHuo5IdM0=;
  b=N/HuAZsJhAyk1bZUGbdeliAhVA2vzj/FklqJY4GqAme/wdGkS+DLM43W
   5NYVBAvvMerPhkAqOrfG/6Agh2PpoWNQp8D2EulL8rinIzaz58dFTALFI
   q7dWhkmLHXIJI1T2U51T2UPTUgygfIvRxZ4qRJKSER7FtLwrH28u9adQW
   dobGX3ES8RC0EsZ3VMFmlYFIm2MbVjhROuZHG2WwGG4RjCjFfI09AIsyS
   ESNtFetB1pMpqRqjzgBWEBjW6EaofgCcY2N2AB+gJ5Ck+Y04PVXtIYI/R
   gkezGfhRQqkaLTS4dM5/XHKGXkG9JFc2lVYjH4PQU1HBCtQBgvz1DUKSi
   w==;
X-CSE-ConnectionGUID: r6XGwDfwQxy5jkV2XQGpGQ==
X-CSE-MsgGUID: eQazQvdWQfazbx7wQ6pbMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1451808"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1451808"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 17:04:16 -0700
X-CSE-ConnectionGUID: /AZfbux8RIG3EoZ5oJB+Tw==
X-CSE-MsgGUID: ighPofzrT2yFjntMxOxPYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="4158445"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Oct 2026 17:04:13 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKPF4-00000000TO0-3hW5;
	Sat, 24 Oct 2026 00:04:10 +0000
Date: Sat, 24 Oct 2026 08:03:34 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:hexagon 2/82] drivers/video/fbdev/udlfb.c:370:52:
 error: use of undeclared identifier 'PAGE_SHARED'
Message-ID: <202610240743.6bfk7K8M-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git hexagon
head:   35ab1dadb94646b74469738c1741f68e8c6aac3d
commit: a068d81e03bf28e40eceb94bc49e122f09177d70 [2/82] hexagon: fix the page table model for the Hexagon VM
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261024/202610240743.6bfk7K8M-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610240743.6bfk7K8M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610240743.6bfk7K8M-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/udlfb.c:370:52: error: use of undeclared identifier 'PAGE_SHARED'
     370 |                 if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
         |                                                                  ^~~~~~~~~~~
   1 error generated.


vim +/PAGE_SHARED +370 drivers/video/fbdev/udlfb.c

8de779dc40d35d drivers/video/fbdev/udlfb.c   Rajat Gupta        2026-05-03  342  
4574203f45eb26 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-02-15  343  static int dlfb_ops_mmap(struct fb_info *info, struct vm_area_struct *vma)
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  344  {
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  345  	unsigned long start = vma->vm_start;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  346  	unsigned long size = vma->vm_end - vma->vm_start;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  347  	unsigned long offset = vma->vm_pgoff << PAGE_SHIFT;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  348  	unsigned long page, pos;
8de779dc40d35d drivers/video/fbdev/udlfb.c   Rajat Gupta        2026-05-03  349  	struct dlfb_data *dlfb = info->par;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  350  
5905585103276b drivers/video/fbdev/udlfb.c   Thomas Zimmermann  2022-04-29  351  	if (info->fbdefio)
5905585103276b drivers/video/fbdev/udlfb.c   Thomas Zimmermann  2022-04-29  352  		return fb_deferred_io_mmap(info, vma);
5905585103276b drivers/video/fbdev/udlfb.c   Thomas Zimmermann  2022-04-29  353  
76f92201b821dd drivers/video/fbdev/udlfb.c   Thomas Zimmermann  2023-11-27  354  	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
76f92201b821dd drivers/video/fbdev/udlfb.c   Thomas Zimmermann  2023-11-27  355  
04f8afbec37f63 drivers/video/udlfb.c         Tomi Valkeinen     2013-04-18  356  	if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
04f8afbec37f63 drivers/video/udlfb.c         Tomi Valkeinen     2013-04-18  357  		return -EINVAL;
04f8afbec37f63 drivers/video/udlfb.c         Tomi Valkeinen     2013-04-18  358  	if (size > info->fix.smem_len)
04f8afbec37f63 drivers/video/udlfb.c         Tomi Valkeinen     2013-04-18  359  		return -EINVAL;
04f8afbec37f63 drivers/video/udlfb.c         Tomi Valkeinen     2013-04-18  360  	if (offset > info->fix.smem_len - size)
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  361  		return -EINVAL;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  362  
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  363  	pos = (unsigned long)info->fix.smem_start + offset;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  364  
5865889fe43194 drivers/video/fbdev/udlfb.c   Ladislav Michl     2018-01-16  365  	dev_dbg(info->dev, "mmap() framebuffer addr:%lu size:%lu\n",
2685cffa9e7992 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  366  		pos, size);
2685cffa9e7992 drivers/staging/udlfb/udlfb.c Bernie Thompson    2010-09-05  367  
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  368  	while (size > 0) {
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  369  		page = vmalloc_to_pfn((void *)pos);
f05e0575ed334a drivers/staging/udlfb/udlfb.c Greg Kroah-Hartman 2009-06-03 @370  		if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  371  			return -EAGAIN;
f05e0575ed334a drivers/staging/udlfb/udlfb.c Greg Kroah-Hartman 2009-06-03  372  
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  373  		start += PAGE_SIZE;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  374  		pos += PAGE_SIZE;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  375  		if (size > PAGE_SIZE)
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  376  			size -= PAGE_SIZE;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  377  		else
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  378  			size = 0;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  379  	}
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  380  
8de779dc40d35d drivers/video/fbdev/udlfb.c   Rajat Gupta        2026-05-03  381  	vma->vm_ops = &dlfb_vm_ops;
8de779dc40d35d drivers/video/fbdev/udlfb.c   Rajat Gupta        2026-05-03  382  	vma->vm_private_data = dlfb;
8de779dc40d35d drivers/video/fbdev/udlfb.c   Rajat Gupta        2026-05-03  383  	atomic_inc(&dlfb->mmap_count);
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  384  	return 0;
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  385  }
88e58b1a42f8c1 drivers/staging/udlfb/udlfb.c Roberto De Ioris   2009-06-03  386  

:::::: The code at line 370 was first introduced by commit
:::::: f05e0575ed334a23dad91b8f6ed0ac42a3996b8d Staging: udlfb: clean up checkpatch warnings in udlfb.c

:::::: TO: Greg Kroah-Hartman <gregkh@suse.de>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
