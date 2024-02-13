Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C592868D;
	Tue, 13 Feb 2024 10:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707821691; cv=none; b=b7OX4cBpjXhAnmFsev9STQmPgy60kBHTZtuDQYbsx09x0JNCdJpljj6KKx/jVJZs6bOlV+tER0C8LF6ksJzpZ6+OOVN3XwGXyMuESIFSxRCa3o0klmQIGM1+iz08WPc5d+kUQ5XgLINwZJGI+GD55AWW3puA9i9d/oNMDI3/xV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707821691; c=relaxed/simple;
	bh=i0PH+e6iAE9CVt87DhB8L3tIQLYGI7GlKZAfupFbOho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EsQSMtjaMcKfov8jHcjhXXcJHKzelpejhE5NPxjBz3px8fDCqJGE5O73Y6BuFfKqquyiQWuL3pOQ77KzINO+iOnuWtSg4Nlxx1eG99r07ejJ37NzR/pcF4KCaDhOHLjsW+PxUPaWrKy66LA88hXRVAl+i70X4PGApDTiY64Dgso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m88Rj1sh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m88Rj1sh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707821690; x=1739357690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i0PH+e6iAE9CVt87DhB8L3tIQLYGI7GlKZAfupFbOho=;
  b=m88Rj1shDrnkMKrsaqe4zHAlDFL4cJVRRILFLpMGOnYiMtowX/0guqTS
   x7CIdY/8PJhkmZlDRBE5bIXDueDXyYpro1EgzO0Uyvxz/gpE/rcIjHgxW
   dCgFMmIZ63mfuxPitJPJq54ZDrE+QowzH58/6W+soJQgYVAITLiTs0DNT
   DGVnDrgDPjTK004Tf8CCsCxhcTXz4XTUQD8d3tLaWES7jFFVzT9lma4DS
   yuyLBJIXBBxYUTSgmt+ZuQHbRdm4b5sP7UFUP5rMtKTmt/jQI6D+8tkp8
   i0mW5w4xdNOgvfYtDT4xrLKdk9+rzLeolBezh6J8GAwSTo2sPP/snqtB8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13215881"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="13215881"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:54:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="2781894"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2024 02:54:46 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZqR1-0007fi-2Q;
	Tue, 13 Feb 2024 10:54:43 +0000
Date: Tue, 13 Feb 2024 18:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chunkuang-hu:mediatek-cmdq8 4/6]
 drivers/soc/mediatek/mtk-cmdq-helper.c:372:5: warning: no previous prototype
 for function 'cmq_pkt_nop'
Message-ID: <202402131818.89AgTkT5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git mediatek-cmdq8
head:   572ee20058cf30ec608e6009421d89e45a6b6f5e
commit: 7656e1f3f594b39a255f94230c6bbf1dd1d0099c [4/6] soc: mediatek: cmdq: Add cmdq_pkt_nop() helper function
config: i386-buildonly-randconfig-001-20240213 (https://download.01.org/0day-ci/archive/20240213/202402131818.89AgTkT5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240213/202402131818.89AgTkT5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402131818.89AgTkT5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/mediatek/mtk-cmdq-helper.c:372:5: warning: no previous prototype for function 'cmq_pkt_nop' [-Wmissing-prototypes]
     372 | int cmq_pkt_nop(struct cmdq_pkt *pkt, u8 shift_pa)
         |     ^
   drivers/soc/mediatek/mtk-cmdq-helper.c:372:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     372 | int cmq_pkt_nop(struct cmdq_pkt *pkt, u8 shift_pa)
         | ^
         | static 
   1 warning generated.


vim +/cmq_pkt_nop +372 drivers/soc/mediatek/mtk-cmdq-helper.c

   371	
 > 372	int cmq_pkt_nop(struct cmdq_pkt *pkt, u8 shift_pa)
   373	{
   374		struct cmdq_instruction inst = { {0} };
   375	
   376		/* Jumping to next instruction is equal to no operation */
   377		inst.op = CMDQ_CODE_JUMP;
   378		inst.value = CMDQ_INST_SIZE >> shift_pa;
   379		return cmdq_pkt_append_command(pkt, inst);
   380	}
   381	EXPORT_SYMBOL(cmq_pkt_nop);
   382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
