Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235392;
	b=unzg/BchADKAhy4DRGNKCDFNcNTw2ngfslvdOv1Yxxp32RBVFGMq+9dl0xovO9Nm8PpS
	 rZAieCV7X9YHOv30qNiZ8jZCAInk3aeEpQy0p1uHe2rEjiYr5qUg3iZa+vuvvswSplPEv
	 oxD6R8pe37yfL7YxBIuY+/enkOYiu3zdpbvWSeH+i72sKxF6cAhSFca8HpGJcmG3g+5r+
	 97xJm4c0tHrZBtzNOdCKfXUG4kL948qAXs1Mkttc/S3ZbgsMwUU6UixWEUk6EyrSVR0dz
	 ftWM1EKjwv9IaP0t+MxFRaf5UIW/m+vHn1fM3LzWz7qaD6oUQogypEgHEfaL59VgsuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235392;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=WJaFLNVVCITmidQfLnZRtwsb4tOgPs9S2KR6vTy+ewo=;
	b=1Hib9oejUsdUmZEU8ZwjJkBdNEMI6ZtWQLCsbyN+ASly09M1me0RA6L3UQGIX0t6pbWN
	 Eirg8tkh4Etgq5L5WlMjaiKB7bZk68lN2XhipPJtXZba3HYjR1VHIucHMclcxCcLbG19a
	 1FC6B1jTbHAgnZaNnNr078EjrVySVCPjILjHeid1CvICL+X9CGo5acVs1y2kSiguttfYM
	 8C8LNMATHTgZi1sAYg+WjgReBCAoN+TgsRQJFwxgXz2QBCqvArHp/g+WeR01j1tPakkz2
	 pm3s9RY6o9wiIexVRoZZ7eEipCD3zEw5hfY62Z8BiQ9KgFf8aGjwBVCQJu1iVKbPM8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JnIRu0k8;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B49606A32A;
	Mon,  9 Nov 2026 14:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B49606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JnIRu0k8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794235391; x=1825771391;
  h=date:from:to:cc:subject:message-id;
  bh=fFvrrVhxqiaSCIrU2a1EKkYLQ/AnxsuEyO5H7WhY0SA=;
  b=JnIRu0k8Ic6Klep3i4TxLp7YlkFD7BQpH1QAVFEOpFMoK8dYqo2e6L9P
   qcelAr/Ptlp3F7ogDlKQRos7sxQZn7Hpl43rvjy7RXeOQrBbe7IxwcLR4
   CFf0ffgDMhD5MgzvnGcpvNgHWT9ime+px2PKuWOYcv5NzkklEtfZL2JbL
   yNiCVVwJhueC/qgNCTKiCTnK5I8mAAllumoxMVQRo1Nl34c0iKe5vi4JD
   3c8uFU4IJKnDw4fnywzCh8n536hAC5isup0BU+bZp0oD1ziCZZnkijvUX
   RX3kEJF6uqn1AkmYOiKkRB8sA4YgTM+oJwN/zaPwsjoHhMszaDEEZ1u1K
   A==;
X-CSE-ConnectionGUID: VU154qMiTreUFFzqbhWN/w==
X-CSE-MsgGUID: H/wFk90MRcC3eF/zU3WyuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3059989"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="3059989"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 06:43:11 -0800
X-CSE-ConnectionGUID: VlV0+fvaS8OhqRVUXpsA9A==
X-CSE-MsgGUID: VlPbtVA4S4+T28AexAU3dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7750685"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Nov 2026 06:43:09 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQQaQ-00000000ug9-3SH4;
	Mon, 09 Nov 2026 14:43:06 +0000
Date: Mon, 09 Nov 2026 22:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V15 10/35]
 drivers/firmware/arm_scmi/telemetry.c:356:9: warning: format specifies type
 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned
 int')
Message-ID: <202611092247.VFVvjfD5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V15
head:   d51f22cab86f4ad2f08b4e88803f85fdffd81a62
commit: 64c4292f50171fb197737a97cf5cd8b6d378984f [10/35] firmware: arm_scmi: Add Telemetry resources enumeration
config: hexagon-randconfig-1001-20261109 (https://download.01.org/0day-ci/archive/20261109/202611092247.VFVvjfD5-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611092247.VFVvjfD5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611092247.VFVvjfD5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/telemetry.c:356:9: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
     355 |                 dev_err(dev, FW_BUG "%s phys_addr (0x%llX) pointer too big.\n",
         |                                                      ~~~~
         |                                                      %X
     356 |                         tag, pa);
         |                              ^~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:362:9: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
     361 |                 dev_err(dev, FW_BUG "%s phys_addr (0x%llX) misaligned.\n",
         |                                                      ~~~~
         |                                                      %X
     362 |                         tag, pa);
         |                              ^~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/firmware/arm_scmi/telemetry.c:374:9: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
     373 |                 dev_err(dev, FW_BUG "%s area (0x%llX/%u) wrap-around.\n",
         |                                                 ~~~~
         |                                                 %X
     374 |                         tag, pa, size);
         |                              ^~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   3 warnings generated.


vim +356 drivers/firmware/arm_scmi/telemetry.c

   343	
   344	static inline int
   345	scmi_telemetry_area_check(struct device *dev, const char *tag,
   346				  u32 low, u32 high, u32 size,
   347				  phys_addr_t *phys_addr, size_t *len)
   348	{
   349		u64 addr = ((u64)high << 32) | low;
   350		phys_addr_t pa = (phys_addr_t)addr;
   351		unsigned long end_phys;
   352	
   353		/* Does the returned pointer fits architetural size ? */
   354		if ((u64)pa != addr) {
   355			dev_err(dev, FW_BUG "%s phys_addr (0x%llX) pointer too big.\n",
 > 356				tag, pa);
   357			return -EOVERFLOW;
   358		}
   359	
   360		if (!IS_ALIGNED(pa, 4)) {
   361			dev_err(dev, FW_BUG "%s phys_addr (0x%llX) misaligned.\n",
   362				tag, pa);
   363			return -EINVAL;
   364		}
   365	
   366		if (!IS_ALIGNED(size, 4)) {
   367			dev_err(dev, FW_BUG "%s area length (%u) misaligned\n",
   368				tag, size);
   369			return -EINVAL;
   370		}
   371	
   372		if (check_add_overflow(pa, size, &end_phys)) {
   373			dev_err(dev, FW_BUG "%s area (0x%llX/%u) wrap-around.\n",
   374				tag, pa, size);
   375			return -EOVERFLOW;
   376		}
   377	
   378		*phys_addr = pa;
   379		*len = size;
   380	
   381		return 0;
   382	}
   383	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
