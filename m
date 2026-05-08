Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61142E7BD3;
	Fri,  8 May 2026 19:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778267884; cv=none; b=ijeH6Clj22dYM9qtD1xuPuzO+j1HwrB/eH1XUXLnZkVc2ir4qikwRzDa5R9e2D/j78HnNJTgG6SmFx/Rcn5fAmylXdekSD28GvoAAgriQw9n0uEtsQL7xTd0aFc1OigoAgdMGDPJ7VZ7z0VGymTwBOx91AmkAFYLmhYPnjV0UEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778267884; c=relaxed/simple;
	bh=G2PvSqaYChmtkHce5V7miyQNE0XDCTiMqQg85ZkV9Co=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N/CfyXky25jMSYcZT/tMzpsTqZIG6iBJPMG5vWjl46JGw/2C5qYhQfLeETCiZCLFbOLyQL9IIs6Ja4YOavsUK+X2IeGrZFmI+BIWGMhOaJx2nTZwKttjVkuEHiZTHAJeF0puuGkRllyK00KUlrRK5ULC2KT21NSO8Mu2wvWvm1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9DLabFx; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9DLabFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778267881; x=1809803881;
  h=date:from:to:cc:subject:message-id;
  bh=G2PvSqaYChmtkHce5V7miyQNE0XDCTiMqQg85ZkV9Co=;
  b=T9DLabFxdKDmRDO+42rI3tdFa+0IsdTQ74o0teUIMp5El12Pi9zES50t
   xpd/tgkTl6U7DEhe0YyZ/MUatVEemDIOv89/PCCL1g2PSFvMyQFjAK0q1
   86eMEcVUvvnztudbv8MXyxksBlDxbKWTfSLHTwSFgpYEmO5xl8LV5TApp
   t/tmNb85wfah2iOykBK2zxGAllnjl5FG36eKNvfv4DB8L+oq6uZJiiVIQ
   RS51tHNzUvLKmnCs9QozWQu3vwoOalFSpic8T0TAH+xcl6YYyM2IrkCfI
   H1cTWj3oh3UTg1xnFYYQalH1cfrY6DYc/sUMNbQ68lNuaFFMjhwLht7FU
   g==;
X-CSE-ConnectionGUID: x8RwJZmfTUK6P3zjjKB7Xw==
X-CSE-MsgGUID: YZBopyMeQjST4zlR6ATkeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="66774677"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="66774677"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 12:18:01 -0700
X-CSE-ConnectionGUID: dnpg3oaGR/CYYlqofHtTbw==
X-CSE-MsgGUID: iwNcnnoEQmGX/SqCPnV8mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="233788788"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 08 May 2026 12:17:59 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLQhx-000000007G9-2xHM;
	Fri, 08 May 2026 19:17:57 +0000
Date: Fri, 08 May 2026 21:17:17 +0200
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:configfs-ns 1/9]
 drivers/nvme/target/../target/bpf.h:26:9: error: call to undeclared function
 'nvmet_bpf_req_complete'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605082159.6BFSLR4U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git configfs-ns
head:   509cbb083b05db0f02a3ceea68bb093f8725a6a5
commit: 94040dcdf8d7b146f62dfb3e0156d93a9713880d [1/9] nvmet-bpf: eBPF struct_ops support for log pages
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260508/202605082159.6BFSLR4U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605082159.6BFSLR4U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605082159.6BFSLR4U-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
>> drivers/nvme/target/../target/bpf.h:26:9: error: call to undeclared function 'nvmet_bpf_req_complete'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^
>> drivers/nvme/target/../target/bpf.h:26:61: error: use of undeclared identifier 'NVME_SC_DNR'
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                                                                    ^
   6 warnings and 2 errors generated.


vim +/nvmet_bpf_req_complete +26 drivers/nvme/target/../target/bpf.h

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
    21	{
    22		return false;
    23	}
    24	static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
    25	{
  > 26		return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
