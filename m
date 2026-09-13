Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F78388397;
	Sun, 13 Sep 2026 08:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789286864; cv=none; b=NJQEfU431gha2EzqQOsn9799ykeEaBRNAScwN7gYxiUHaCjdnrgBECiRH5htqTWmIo2tVgPK9y+xkdoMBjh1JK6Beqoc0aYUFppXqb/Qwkvy7u0bHYjG+WpU3yxqoFvs2xx4LMbIVNcwHXn7rC68MmBIJKe6fpVTsEzWsGpQmCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789286864; c=relaxed/simple;
	bh=eVgPp3zE4UWPlXdNcCX28jql8tS5c8wjEHtHsF9tTgI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nTd9VmqYj1OGBXfxjG+vY08novSua7sPWeemtRv1J6DRkravvmoL5aU8zRtoyW2fFpc6/rSRlBG9hJJsIqaq2V4gU7AUMSYtjsG/MwBUW+6BRKUVgpt+bC6PdjqxFSbE2cHuXYy2LbzBWWpj0P6saZque6XFCwwnRUtfZaBP6mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P194nyYD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P194nyYD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789286859; x=1820822859;
  h=date:from:to:cc:subject:message-id;
  bh=eVgPp3zE4UWPlXdNcCX28jql8tS5c8wjEHtHsF9tTgI=;
  b=P194nyYDrnH4tunxlWIj4fXg1LJkMj9NDZJFo+v6DspKvQMRfZjw0xmo
   fHsHQBqjHGroBmmyqwB0hgUVQUwiuDoVkpkje7WsrPhd3qmpQqyHY4Q7I
   hKS9gbb4N5TUXL+jgQBMsDHLyuunqBlBp10sgF4qantrZL0JiLwsV+LSY
   GitY6yizXSkEGmbkUVyWtM3VfP9x86lTxPuTJJjaLof9gpSZrHwuvq6v2
   V3Y/kpQGXEY5cM+mn7XvReA1UdDW9qOvZZTpEGqvpCymcxuJgJ9/argHU
   ZfrhRwUSJuAvHBHoETRJkUMB0aHAHMYm1PvtD0uLEiaqS/MGKPNx6yZ8i
   Q==;
X-CSE-ConnectionGUID: pKSmB5kRQzOAGb9prtKuwA==
X-CSE-MsgGUID: ig+74wBqTgiygQrMRCzcxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="115218769"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="115218769"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 01:07:33 -0700
X-CSE-ConnectionGUID: zumOgaLVQAKYQ5Absee0og==
X-CSE-MsgGUID: 5JHnEf3gQH20Crv8VCS/hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="277603326"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 13 Sep 2026 01:07:31 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5fFB-000000003kN-3kNp;
	Sun, 13 Sep 2026 08:07:24 +0000
Date: Sun, 13 Sep 2026 16:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 161/169]
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c:664:6: warning: variable 'source'
 set but not used
Message-ID: <202609131638.i4iLw29I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   357c2e168b861a3df80c68a9c44de9c9c282ec46
commit: 99f62d82955331605ec24226a734233f2d52c6e0 [161/169] media: ipu6: Bridge the gap between streams in V4L2 and IPU6 firmware
config: i386-randconfig-012-20260913 (https://download.01.org/0day-ci/archive/20260913/202609131638.i4iLw29I-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609131638.i4iLw29I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609131638.i4iLw29I-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/ipu6-fw-isys.c:664:6: warning: variable 'source' set but not used [-Wunused-but-set-variable]
     664 |         int source;
         |             ^
   1 warning generated.


vim +/source +664 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c

33f56ed128438d Antti Laakso 2026-08-27  658  
33f56ed128438d Antti Laakso 2026-08-27  659  static void ipu6_isys_csi2_isr(struct ipu6_isys_csi2 *csi2)
33f56ed128438d Antti Laakso 2026-08-27  660  {
33f56ed128438d Antti Laakso 2026-08-27  661  	struct ipu6_isys_stream *stream;
33f56ed128438d Antti Laakso 2026-08-27  662  	unsigned int i;
33f56ed128438d Antti Laakso 2026-08-27  663  	u32 status;
33f56ed128438d Antti Laakso 2026-08-27 @664  	int source;
33f56ed128438d Antti Laakso 2026-08-27  665  
33f56ed128438d Antti Laakso 2026-08-27  666  	ipu6_isys_register_errors(csi2);
33f56ed128438d Antti Laakso 2026-08-27  667  
33f56ed128438d Antti Laakso 2026-08-27  668  	status = readl(csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
33f56ed128438d Antti Laakso 2026-08-27  669  		       CSI_PORT_REG_BASE_IRQ_STATUS_OFFSET);
33f56ed128438d Antti Laakso 2026-08-27  670  
33f56ed128438d Antti Laakso 2026-08-27  671  	writel(status, csi2->base + CSI_PORT_REG_BASE_IRQ_CSI_SYNC +
33f56ed128438d Antti Laakso 2026-08-27  672  	       CSI_PORT_REG_BASE_IRQ_CLEAR_OFFSET);
33f56ed128438d Antti Laakso 2026-08-27  673  
33f56ed128438d Antti Laakso 2026-08-27  674  	source = csi2->asd.source;
33f56ed128438d Antti Laakso 2026-08-27  675  	for (i = 0; i < NR_OF_CSI2_VC; i++) {
33f56ed128438d Antti Laakso 2026-08-27  676  		if (status & IPU_CSI_RX_IRQ_FS_VC(i)) {
99f62d82955331 Sakari Ailus 2026-06-26  677  			stream = csi2->streams_by_vc[i];
99f62d82955331 Sakari Ailus 2026-06-26  678  			if (stream)
33f56ed128438d Antti Laakso 2026-08-27  679  				ipu6_isys_csi2_sof_event_by_stream(stream);
33f56ed128438d Antti Laakso 2026-08-27  680  		}
33f56ed128438d Antti Laakso 2026-08-27  681  
33f56ed128438d Antti Laakso 2026-08-27  682  		if (status & IPU_CSI_RX_IRQ_FE_VC(i)) {
99f62d82955331 Sakari Ailus 2026-06-26  683  			stream = csi2->streams_by_vc[i];
99f62d82955331 Sakari Ailus 2026-06-26  684  			if (stream)
33f56ed128438d Antti Laakso 2026-08-27  685  				ipu6_isys_csi2_eof_event_by_stream(stream);
33f56ed128438d Antti Laakso 2026-08-27  686  		}
33f56ed128438d Antti Laakso 2026-08-27  687  	}
33f56ed128438d Antti Laakso 2026-08-27  688  }
33f56ed128438d Antti Laakso 2026-08-27  689  

:::::: The code at line 664 was first introduced by commit
:::::: 33f56ed128438dd791b9114ad079ab188daa1c09 media: ipu6: Move isys isr handlers to fw file

:::::: TO: Antti Laakso <antti.laakso@linux.intel.com>
:::::: CC: Sakari Ailus <sakari.ailus@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
