Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A93252F60;
	Tue,  5 Mar 2024 09:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709630023; cv=none; b=ikeuaQEK59aAsONutwOqy+vxwzn1R8Mx8y6/w0CaO4+6cNJxHaq5uwYnmrKNWtWjbokWy/4WQo8G7qgQAC8Kl9aAl4hfKDxvUQOZEh0Ymd23ujY3cMjJ7sxH15Z6uLf25BVp8vfNGgyqyErvauAFn3mm5aoTljuQ1DDt/ZQv/mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709630023; c=relaxed/simple;
	bh=apOHzfyQV25+S2S95rRZh0Me+xsyjNtyvU7HMJyLSfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d7yvxPsnWJg50mxCwDSPHkdR+FJiDc3FaaFNk1RT9D/kPp6uZ0RvTpYeztZKmQXtPEb1FJ5q2keiI3mCRJfyGaQhEnR6eq0mQBt0cr+aJvu7yi/KypP63IJP/ocWqQdZf1h8jlpkyxgrXEYahrQAkr+yAv0dgFBioed5A0I6Ahw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6K+SkU7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6K+SkU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709630022; x=1741166022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=apOHzfyQV25+S2S95rRZh0Me+xsyjNtyvU7HMJyLSfs=;
  b=i6K+SkU7L73jPjUlTifaHlrLL0nBqVCxCarQD18NKqudJoGDQJ1rWwyT
   Pt09eMPsasCOIQdLXPkwHOuwfPlLYA4fWbHrh00KhuF2EUbyYIlWl8X56
   nJkjFYb4LqULt7qX1xnSLpCwXENptNeBu9JtwrebmN9UzH7lVNVz0Tbhy
   3100tOUJIhrovrBKcCkP7nxq6ko/NeAkUcHTXM1UUCSm3wIBc8j/PAitP
   z7370SdldCoywMDv8R3odIjYoOmkpgdWl9JRLXSrBh81dNeyCvsIEh42I
   F2/+aucuAn5ynP2ZBkqpNhEGoO2oF8V0D1AjHxW8LjCdwwlgE378Illcx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4028135"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4028135"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 01:13:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9888994"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Mar 2024 01:13:39 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhQrh-0003Az-0O;
	Tue, 05 Mar 2024 09:13:37 +0000
Date: Tue, 5 Mar 2024 17:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 39/41] drivers/char/aaa.c:112:7: warning: format
 specifies type 'unsigned long long' but the argument has type 'dma_addr_t'
 (aka 'unsigned int')
Message-ID: <202403051736.ttkHmbj6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   ae68847cb7b2931e05cac969d0920beb7f40e7dc
commit: 286881ea887dedf90cd8b3c94c802e9e4d1fee72 [39/41] kfifo tester
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240305/202403051736.ttkHmbj6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051736.ttkHmbj6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051736.ttkHmbj6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/aaa.c:112:7: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
                           i, sg_dma_address(&sg[i]),
                              ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:542:26: note: expanded from macro 'pr_cont'
           printk(KERN_CONT fmt, ##__VA_ARGS__)
                            ~~~    ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   include/linux/scatterlist.h:31:28: note: expanded from macro 'sg_dma_address'
   #define sg_dma_address(sg)      ((sg)->dma_address)
                                   ^~~~~~~~~~~~~~~~~~~
>> drivers/char/aaa.c:91:27: warning: implicit conversion from 'unsigned long long' to 'dma_addr_t' (aka 'unsigned int') changes value from 18374686479671623680 to 0 [-Wconstant-conversion]
           dma_addr_t dma = 0xffULL << (64 - 8);
                      ~~~   ~~~~~~~~^~~~~~~~~~~
   2 warnings generated.


vim +112 drivers/char/aaa.c

    87	
    88	static void dump_fifo(void)
    89	{
    90		struct scatterlist sg[4] = {};
  > 91		dma_addr_t dma = 0xffULL << (64 - 8);
    92		unsigned int n;
    93	
    94		if (mutex_lock_interruptible(&my_mutex))
    95			return;
    96	
    97		n = kfifo_dma_out_prepare_mapped(&fifo, sg, ARRAY_SIZE(sg), FIFO_SIZE,
    98						 dma);
    99	
   100		pr_info("%s: in=%4u out=%4u len=%4u avail=%4u sgs=%u data=0x%px(0x%px) dma=%pad\n",
   101			__func__,
   102			ms(fifo.kfifo.in), ms(fifo.kfifo.out),
   103			kfifo_len(&fifo), kfifo_avail(&fifo), n, fifo.kfifo.data,
   104			page_address(virt_to_page(fifo.kfifo.data)) +
   105			offset_in_page(fifo.kfifo.data),
   106			&dma);
   107	
   108		pr_info("\t");
   109		for (unsigned i = 0; i < n; i++) {
   110			pr_cont(" %u.v=%px %u.d=%.16llx %u.l=%u",
   111				i, sg_virt(&sg[i]),// - fifo.kfifo.data,
 > 112				i, sg_dma_address(&sg[i]),
   113				i, sg_dma_len(&sg[i]));
   114		}
   115		pr_cont("\n");
   116	
   117		mutex_unlock(&my_mutex);
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
