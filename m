Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B457E374758;
	Fri,  8 May 2026 16:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778259301; cv=none; b=EbnTXkRl95Op7cAnE6XbBPJWRsLxcf+ZEpS/gQCuETAk2znhv3e7SVkm1S29wsjmsptWExKWvcbVy1M/b3yQRgWlWkTV1L40dg7WEJofYGspmFQy0arS9mA0p6X3aAt5YTGfgnmGWsqACPO9SF+Khvx+QuWOWZVRj1R2Gg/jCA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778259301; c=relaxed/simple;
	bh=HQaUSlngELed0sn/NRU0INQRAnmeXsLigygX8nR7T4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KlRBROHS20d7HDlWUT9l+D3/0Ze1NMoW8CxyALuKfSbNfYmBeBuCtWleX1CJwmUJoI4h0XQhVwNil3oKDMc1Dn9fpyuZMHl0ma0RkdGZmOn7lVFdfT4AKPK3ZaSFEQhSEBDj8cWO3Xq4Ejjii5EPpVQQriGrfPnVqkZu5SDva5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WSm+JzB8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WSm+JzB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778259300; x=1809795300;
  h=date:from:to:cc:subject:message-id;
  bh=HQaUSlngELed0sn/NRU0INQRAnmeXsLigygX8nR7T4c=;
  b=WSm+JzB8Z2eezvMM/PKwXHYtzw/nOlF/YC3cIMz6d4dBvzLOyibSuYqB
   jnCqUwD4rkCTxOC+wsb4rNIDTp46WInetVe1Qjh/trtBJq/152bhG5J/D
   45Wp0UggwVSLnimCkr+qUZBxwEQOG1nsa9Br4I0/9GEnUGRbfq5LEybyK
   jLnQYuhZxHiKeZLCe2TzIxHe4NiqSz828OyO+mPPb+nGzAwiLy1Ek5qD1
   QkPzx3L1r9tH7IXMr3h23llqergdb2jZCsLwvMoBBk0ktrcRotKyqw90Z
   hPrthnSLzTH9zrRDZb+CI2puAOG4bdMw58BqsYvTHEO3gpv+oA55dFY8C
   Q==;
X-CSE-ConnectionGUID: cpWB15baTxySCQkMxEElkA==
X-CSE-MsgGUID: r02Ndu3/QEuHTJdF32RDzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89544046"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="89544046"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 09:55:00 -0700
X-CSE-ConnectionGUID: IdT6Q/ySSAycJgyIsayiSA==
X-CSE-MsgGUID: PuXc59S6SyOEALsgiq+RKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="230422750"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 08 May 2026 09:54:57 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLOTX-000000007Dt-2zDs;
	Fri, 08 May 2026 16:54:55 +0000
Date: Fri, 08 May 2026 18:54:41 +0200
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:configfs-ns 1/9] drivers/nvme/target/bpf.h:15:44:
 warning: declaration of 'struct nvmet_subsys_link' will not be visible
 outside of this function
Message-ID: <202605081839.xgy4NNj4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git configfs-ns
head:   509cbb083b05db0f02a3ceea68bb093f8725a6a5
commit: 94040dcdf8d7b146f62dfb3e0156d93a9713880d [1/9] nvmet-bpf: eBPF struct_ops support for log pages
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260508/202605081839.xgy4NNj4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081839.xgy4NNj4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081839.xgy4NNj4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/target/core.c:17:
   In file included from drivers/nvme/target/trace.h:19:
   In file included from drivers/nvme/target/nvmet.h:26:
>> drivers/nvme/target/bpf.h:15:44: warning: declaration of 'struct nvmet_subsys_link' will not be visible outside of this function [-Wvisibility]
      15 | static inline void nvmet_bpf_detach(struct nvmet_subsys_link *s) {}
         |                                            ^
>> drivers/nvme/target/bpf.h:16:47: warning: declaration of 'struct nvmet_subsys' will not be visible outside of this function [-Wvisibility]
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                               ^
>> drivers/nvme/target/bpf.h:16:76: warning: declaration of 'struct nvmet_port' will not be visible outside of this function [-Wvisibility]
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                                            ^
>> drivers/nvme/target/bpf.h:20:56: warning: declaration of 'struct nvmet_req' will not be visible outside of this function [-Wvisibility]
      20 | static inline bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid)
         |                                                        ^
   drivers/nvme/target/bpf.h:24:50: warning: declaration of 'struct nvmet_subsys' will not be visible outside of this function [-Wvisibility]
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                  ^
   drivers/nvme/target/bpf.h:24:79: warning: declaration of 'struct nvmet_req' will not be visible outside of this function [-Wvisibility]
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                                               ^
   drivers/nvme/target/bpf.h:26:9: error: call to undeclared function 'nvmet_bpf_req_complete'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^
   drivers/nvme/target/bpf.h:26:61: error: use of undeclared identifier 'NVME_SC_DNR'
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                                                                    ^
   6 warnings and 2 errors generated.
--
   In file included from drivers/nvme/target/configfs.c:23:
   In file included from drivers/nvme/target/nvmet.h:26:
>> drivers/nvme/target/bpf.h:15:44: warning: declaration of 'struct nvmet_subsys_link' will not be visible outside of this function [-Wvisibility]
      15 | static inline void nvmet_bpf_detach(struct nvmet_subsys_link *s) {}
         |                                            ^
>> drivers/nvme/target/bpf.h:16:47: warning: declaration of 'struct nvmet_subsys' will not be visible outside of this function [-Wvisibility]
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                               ^
>> drivers/nvme/target/bpf.h:16:76: warning: declaration of 'struct nvmet_port' will not be visible outside of this function [-Wvisibility]
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                                            ^
>> drivers/nvme/target/bpf.h:20:56: warning: declaration of 'struct nvmet_req' will not be visible outside of this function [-Wvisibility]
      20 | static inline bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid)
         |                                                        ^
   drivers/nvme/target/bpf.h:24:50: warning: declaration of 'struct nvmet_subsys' will not be visible outside of this function [-Wvisibility]
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                  ^
   drivers/nvme/target/bpf.h:24:79: warning: declaration of 'struct nvmet_req' will not be visible outside of this function [-Wvisibility]
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                                               ^
   drivers/nvme/target/bpf.h:26:9: error: call to undeclared function 'nvmet_bpf_req_complete'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^
   drivers/nvme/target/bpf.h:26:61: error: use of undeclared identifier 'NVME_SC_DNR'
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                                                                    ^
   drivers/nvme/target/configfs.c:1114:19: error: incompatible pointer types passing 'struct nvmet_subsys_link *' to parameter of type 'struct nvmet_subsys_link *' [-Werror,-Wincompatible-pointer-types]
    1114 |         nvmet_bpf_detach(p);
         |                          ^
   drivers/nvme/target/bpf.h:15:63: note: passing argument to parameter 's' here
      15 | static inline void nvmet_bpf_detach(struct nvmet_subsys_link *s) {}
         |                                                               ^
   6 warnings and 3 errors generated.
--
   In file included from drivers/nvme/target/admin-cmd.c:13:
   In file included from drivers/nvme/target/nvmet.h:26:
>> drivers/nvme/target/bpf.h:15:44: warning: declaration of 'struct nvmet_subsys_link' will not be visible outside of this function [-Wvisibility]
      15 | static inline void nvmet_bpf_detach(struct nvmet_subsys_link *s) {}
         |                                            ^
>> drivers/nvme/target/bpf.h:16:47: warning: declaration of 'struct nvmet_subsys' will not be visible outside of this function [-Wvisibility]
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                               ^
>> drivers/nvme/target/bpf.h:16:76: warning: declaration of 'struct nvmet_port' will not be visible outside of this function [-Wvisibility]
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                                            ^
>> drivers/nvme/target/bpf.h:20:56: warning: declaration of 'struct nvmet_req' will not be visible outside of this function [-Wvisibility]
      20 | static inline bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid)
         |                                                        ^
   drivers/nvme/target/bpf.h:24:50: warning: declaration of 'struct nvmet_subsys' will not be visible outside of this function [-Wvisibility]
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                  ^
   drivers/nvme/target/bpf.h:24:79: warning: declaration of 'struct nvmet_req' will not be visible outside of this function [-Wvisibility]
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                                               ^
   drivers/nvme/target/bpf.h:26:9: error: call to undeclared function 'nvmet_bpf_req_complete'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^
   drivers/nvme/target/bpf.h:26:61: error: use of undeclared identifier 'NVME_SC_DNR'
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                                                                    ^
   drivers/nvme/target/admin-cmd.c:224:26: error: incompatible pointer types passing 'struct nvmet_subsys *' to parameter of type 'struct nvmet_subsys *' [-Werror,-Wincompatible-pointer-types]
     224 |         if (nvmet_bpf_supported(ctrl->subsys, req->port)) {
         |                                 ^~~~~~~~~~~~
   drivers/nvme/target/bpf.h:16:61: note: passing argument to parameter 'subsys' here
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                             ^
   drivers/nvme/target/admin-cmd.c:224:40: error: incompatible pointer types passing 'struct nvmet_port *' to parameter of type 'struct nvmet_port *' [-Werror,-Wincompatible-pointer-types]
     224 |         if (nvmet_bpf_supported(ctrl->subsys, req->port)) {
         |                                               ^~~~~~~~~
   drivers/nvme/target/bpf.h:16:88: note: passing argument to parameter 'port' here
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                                                        ^
   drivers/nvme/target/admin-cmd.c:228:37: error: incompatible pointer types passing 'struct nvmet_req *' to parameter of type 'struct nvmet_req *' [-Werror,-Wincompatible-pointer-types]
     228 |                         if (nvmet_bpf_log_page_supported(req, i))
         |                                                          ^~~
   drivers/nvme/target/bpf.h:20:67: note: passing argument to parameter 'req' here
      20 | static inline bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid)
         |                                                                   ^
   drivers/nvme/target/admin-cmd.c:626:26: error: incompatible pointer types passing 'struct nvmet_subsys *' to parameter of type 'struct nvmet_subsys *' [-Werror,-Wincompatible-pointer-types]
     626 |         if (nvmet_bpf_supported(ctrl->subsys, req->port) &&
         |                                 ^~~~~~~~~~~~
   drivers/nvme/target/bpf.h:16:61: note: passing argument to parameter 'subsys' here
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                             ^
   drivers/nvme/target/admin-cmd.c:626:40: error: incompatible pointer types passing 'struct nvmet_port *' to parameter of type 'struct nvmet_port *' [-Werror,-Wincompatible-pointer-types]
     626 |         if (nvmet_bpf_supported(ctrl->subsys, req->port) &&
         |                                               ^~~~~~~~~
   drivers/nvme/target/bpf.h:16:88: note: passing argument to parameter 'port' here
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                                                        ^
   drivers/nvme/target/admin-cmd.c:627:35: error: incompatible pointer types passing 'struct nvmet_req *' to parameter of type 'struct nvmet_req *' [-Werror,-Wincompatible-pointer-types]
     627 |             nvmet_bpf_log_page_supported(req, lid))
         |                                          ^~~
   drivers/nvme/target/bpf.h:20:67: note: passing argument to parameter 'req' here
      20 | static inline bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid)
         |                                                                   ^
   drivers/nvme/target/admin-cmd.c:628:33: error: incompatible pointer types passing 'struct nvmet_subsys *' to parameter of type 'struct nvmet_subsys *' [-Werror,-Wincompatible-pointer-types]
     628 |                 return nvmet_bpf_get_log_page(ctrl->subsys, req);
         |                                               ^~~~~~~~~~~~
   drivers/nvme/target/bpf.h:24:64: note: passing argument to parameter 'subsys' here
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                                ^
   drivers/nvme/target/admin-cmd.c:628:47: error: incompatible pointer types passing 'struct nvmet_req *' to parameter of type 'struct nvmet_req *' [-Werror,-Wincompatible-pointer-types]
     628 |                 return nvmet_bpf_get_log_page(ctrl->subsys, req);
         |                                                             ^~~
   drivers/nvme/target/bpf.h:24:90: note: passing argument to parameter 'req' here
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                                                          ^
   6 warnings and 10 errors generated.


vim +15 drivers/nvme/target/bpf.h

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
