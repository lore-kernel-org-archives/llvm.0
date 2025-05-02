Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F6918024;
	Fri,  2 May 2025 02:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746154034; cv=none; b=dAHnzJRJyV/VrMG1beXGmd5BVcOLknh7zYEhePxslCE6PleFslF0ReH8N/JzSNobfVi1upIOOt8U/EcRC0ixstyVwGDZiOQY7yzHhJxTCAmlwtVa+kN+1/l1NK0tRbNQ4xQ25M+D+KPkhfCCV12gquMgtWqH+/GHcfDcZYPDPDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746154034; c=relaxed/simple;
	bh=ZcrEOSeShKonEhORLGziksZdgqn06Ovdo46FOTtiIT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t5xMcZzBHWpi5W9ZMgrZMBp9AYXc9FvasV0n2gzzMsgGCl8Wh5xGoMZ3tm1dsXom4a5t44h1kGZyiXTvqExKoguWdmNlACWLeb97rw+47ewG3MkcfSxYOaACtZ3gi1m1AWjpjSwiHfl8ZoruGZIKYF7VjQg9OW/u08pldXJTLpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LO6JcfOh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LO6JcfOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746154033; x=1777690033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZcrEOSeShKonEhORLGziksZdgqn06Ovdo46FOTtiIT0=;
  b=LO6JcfOh4kglD524B4ucdIMcIDpPUqyffJ7sfsp28j1wJNVxMNiZvJ+f
   YrPX6yBfnWZ4j+VqdO/6HfmwE5trBYMctw7VioXEMl1vRyBOtgYXJnO/L
   5bcR7eQxSNW6/r8wptE09756q9bFOx1KX07SPj7qdiOU+z0N5baOrAMCt
   Ch/10dWY50CKkZHrtrltuYZ+cw0R1yvWHLs9FbXPWFQxrHWVHGyyGhNAC
   YtyXXcWEqs1PivcgaYkRGmsYwBmgvx6bUskUal/tsP1u3eq+9fWgeu4qO
   XTxZ6+GHMSUcHj4IrC76uaf6RQZjhlEKZFZM3l1I3lUsdX0+bv9SJT7p3
   g==;
X-CSE-ConnectionGUID: w+wLtiZYTmqpvYjlGFgc9w==
X-CSE-MsgGUID: 1HfgPhJPT96W0yJMCRt7Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="50491180"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="50491180"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 19:47:12 -0700
X-CSE-ConnectionGUID: hjegM+moQu+QzBqPylGS5w==
X-CSE-MsgGUID: MHrlycdsQA2qSm4IPmmAkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="165592299"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 May 2025 19:47:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAgQf-0004Vf-0M;
	Fri, 02 May 2025 02:47:09 +0000
Date: Fri, 2 May 2025 10:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.15-rc3 95/110]
 drivers/platform/arm64/mpam/mpam_resctrl.c:851:3: warning: variable 'dom' is
 uninitialized when used here
Message-ID: <202505021036.gkL450hb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.15-rc3
head:   2cc3eff27207d40f181a59f04660a1e8e9746ff8
commit: 5da9bac0425744000799212790168eaf91203c23 [95/110] arm_mpam: resctrl: Call resctrl_exit() in the event of errors
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250502/202505021036.gkL450hb-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021036.gkL450hb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021036.gkL450hb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/arm64/mpam/mpam_resctrl.c:339:10: warning: enumeration value 'QOS_NUM_EVENTS' not handled in switch [-Wswitch]
     339 |         switch (evtid) {
         |                 ^~~~~
>> drivers/platform/arm64/mpam/mpam_resctrl.c:851:3: warning: variable 'dom' is uninitialized when used here [-Wuninitialized]
     851 |                 dom->mbm_local_evt_cfg = 0;
         |                 ^~~
   drivers/platform/arm64/mpam/mpam_resctrl.c:845:30: note: initialize the variable 'dom' to silence this warning
     845 |         struct mpam_resctrl_dom *dom;
         |                                     ^
         |                                      = NULL
   drivers/platform/arm64/mpam/mpam_resctrl.c:864:3: warning: variable 'dom' is uninitialized when used here [-Wuninitialized]
     864 |                 dom->mbm_local_evt_cfg = 0;
         |                 ^~~
   drivers/platform/arm64/mpam/mpam_resctrl.c:861:30: note: initialize the variable 'dom' to silence this warning
     861 |         struct mpam_resctrl_dom *dom;
         |                                     ^
         |                                      = NULL
   3 warnings generated.


vim +/dom +851 drivers/platform/arm64/mpam/mpam_resctrl.c

   842	
   843	void resctrl_arch_mon_event_config_write(void *info)
   844	{
   845		struct mpam_resctrl_dom *dom;
   846		struct resctrl_mon_config_info *mon_info = info;
   847	
   848		WARN_ON_ONCE(mon_info->mon_config & ~MPAM_RESTRL_EVT_CONFIG_VALID);
   849	
   850		if (!mpam_is_enabled()) {
 > 851			dom->mbm_local_evt_cfg = 0;
   852			return;
   853		}
   854	
   855		dom = container_of(mon_info->d, struct mpam_resctrl_dom, resctrl_mon_dom);
   856		dom->mbm_local_evt_cfg = mon_info->mon_config & MPAM_RESTRL_EVT_CONFIG_VALID;
   857	}
   858	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
