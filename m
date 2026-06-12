Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342B8308F3E;
	Fri, 12 Jun 2026 15:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781278812; cv=none; b=WAQJ/JsDhqvn4SiN7YK2hoQITixMpm3N1dCdVCNuVlaCxeiidD/7Z/+5xe7xHAKroAoN2UWXtWSFA1qE0fV91sXMMuWACnmZpmORBw5jfw6TPumREFP92RxpYzoGIPiKcRKpK+kMdqspovefw4LZfNvXjly50BrX6xNABUiHKJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781278812; c=relaxed/simple;
	bh=MBSRMin3XC1lraDIgJxqULNPcVhKSS5k4DKjUOkl8cc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E/GEhijYVclHM3KoIZmcQM1+dkb/EgACFcD6XZ2Pv4VaOqGv1CkZ8pnktFO8KncT5jnPLrXem4r0oafwm0n5PdYwtWVsXyoPo3vfJ36iuaP1a5aWedFWYClkBYG/BQy7ww9vJ7hb4kOXB/sqfav98NLumOgzMSXgO/2BFgW3l6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdvliiRT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdvliiRT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781278810; x=1812814810;
  h=date:from:to:cc:subject:message-id;
  bh=MBSRMin3XC1lraDIgJxqULNPcVhKSS5k4DKjUOkl8cc=;
  b=kdvliiRTG9hcd7r51y2xHxHWZOXMs7RL3mGKUGtvRG0Y/buU8pgrlTAf
   YBWtCMrQhlEIhb2535Vl53YiSAN3gxVCNtKWhFaeflPAltRw6gTxp5x/i
   Kfjbxy7zCqHHIqywifhYZ9g1fL9TZe6MCOoPp2x+rsQfucsQ2IqZ70DA1
   UqvuuDUz70P7/qDT0YSqeZpyBZFJN97XNyVT3OmDggPflot1daLfDWcky
   BdaeBRtsJqvdn6N4TbTnJ24PUy1NcGe8Yr1dihCciH7wPSiR0vOanVk91
   8gzmQDsV8+kf0HsimyZQ1KHtaSCImu5LtQqwRx2wlkn8YXRxerlvG0J57
   w==;
X-CSE-ConnectionGUID: JXme6N+wTJ+TErk2EjEX0A==
X-CSE-MsgGUID: CySgbLKtTYGmVHE22iwR1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="99528201"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="99528201"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 08:40:10 -0700
X-CSE-ConnectionGUID: Jfw9pq3RRnWolBtoR5qhhg==
X-CSE-MsgGUID: UyfIfOJ2Q0mEZxXyd+Q1VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="270897655"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jun 2026 08:40:08 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY3zJ-000000004HN-3K3Y;
	Fri, 12 Jun 2026 15:40:05 +0000
Date: Fri, 12 Jun 2026 17:39:36 +0200
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v6 1/24]
 drivers/nvme/target/../target/bpf.h:15:44: warning: declaration of 'struct
 nvmet_subsys_link' will not be visible outside of this function
Message-ID: <202606121737.dyoUKBZL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v6
head:   65843faa046b6a3ff4953aba7319313104638535
commit: 95eeb6714114cd17d9c4c494a28cc11d86059eef [1/24] nvmet-bpf: eBPF struct_ops support for log pages
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260612/202606121737.dyoUKBZL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121737.dyoUKBZL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121737.dyoUKBZL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/target/fcloop.c:11:
   In file included from drivers/nvme/target/../target/nvmet.h:26:
>> drivers/nvme/target/../target/bpf.h:15:44: warning: declaration of 'struct nvmet_subsys_link' will not be visible outside of this function [-Wvisibility]
      15 | static inline void nvmet_bpf_detach(struct nvmet_subsys_link *s) {}
         |                                            ^
>> drivers/nvme/target/../target/bpf.h:16:47: warning: declaration of 'struct nvmet_subsys' will not be visible outside of this function [-Wvisibility]
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                               ^
>> drivers/nvme/target/../target/bpf.h:16:76: warning: declaration of 'struct nvmet_port' will not be visible outside of this function [-Wvisibility]
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                                            ^
>> drivers/nvme/target/../target/bpf.h:20:56: warning: declaration of 'struct nvmet_req' will not be visible outside of this function [-Wvisibility]
      20 | static inline bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid)
         |                                                        ^
   drivers/nvme/target/../target/bpf.h:24:50: warning: declaration of 'struct nvmet_subsys' will not be visible outside of this function [-Wvisibility]
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                  ^
   drivers/nvme/target/../target/bpf.h:24:79: warning: declaration of 'struct nvmet_req' will not be visible outside of this function [-Wvisibility]
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                                               ^
   drivers/nvme/target/../target/bpf.h:26:9: error: call to undeclared function 'nvmet_bpf_req_complete'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^
   drivers/nvme/target/../target/bpf.h:26:61: error: use of undeclared identifier 'NVME_SC_DNR'
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                                                                    ^~~~~~~~~~~
   6 warnings and 2 errors generated.


vim +15 drivers/nvme/target/../target/bpf.h

     8	
     9	void nvmet_bpf_detach(struct nvmet_subsys_link *s);
    10	bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port);
    11	bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid);
    12	void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req);
    13	int __init nvmet_bpf_struct_ops_init(void);
    14	#else
  > 15	static inline void nvmet_bpf_detach(struct nvmet_subsys_link *s) {}
  > 16	static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
    17	{
    18		return false;
    19	}
  > 20	static inline bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
