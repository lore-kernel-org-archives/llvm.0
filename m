Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FAA24886E;
	Fri, 12 Jun 2026 14:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781275750; cv=none; b=gQXa9WoosBoTXB4C31surLKnGXn+141IL6L3z8xBDMniDWpsBr3RVpfshDu3Dw2er5YX0MO75NggsLGgVgq7X5fkVT4iIozGIL/Fvf6lQ7Lt9p1z91wr9clOcMNY/N5X1qFBQG3JEezHXsH1T5yNxZsuskmMj+MBRqp8if8KnzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781275750; c=relaxed/simple;
	bh=sPEMz439a9BjnXvGTSbuJ69SbnE8LRjcxhABBvexei0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rUp2WDnK+AoVhoeksZrpt99GSPJKnvUho7QGUBeyklYLVaRo9Ph0cpvOmiJWwWtFDm/Bg/bau4H88LG/9xN1HhoGkSD2JQ3yYba4sMLT7NMzauVmkT/zBPGUCXDpMm5mlRsGJKjeC1cLoS55HFU6K/Ifi/RJ0Pye3jvsG/ep4yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=diBxnzJB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="diBxnzJB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781275749; x=1812811749;
  h=date:from:to:cc:subject:message-id;
  bh=sPEMz439a9BjnXvGTSbuJ69SbnE8LRjcxhABBvexei0=;
  b=diBxnzJBR29+8FfeRSHUeoNhGtHJBZgoRa4FBj5F32ENLc4AV7bV37Yc
   9BxfPIIkaE0uv9CEuhwo0TE29IMfDFIBYTPG3z15KFp3i6C4CzBK/nLsd
   PdQ1u3S2CgtLCPgyJz08GBbVghtNlYRK6sMXHwsbZQMO3P3PTgI6oidoc
   iZmXUWQs4BmGEQFzNOouzBSFh44tAs5R89qXxjPfg5YCfCFwL1sZDNccr
   HwgGO66ov9v6LcqfmyezCJguhqxiQYRs4JTgZaEoHpTR1Itr+3o6qf98F
   REVLKBCrMd5NbGgf32hybf7/UNqZi2aANZ5Masj6bISN7GthcvMA96wex
   g==;
X-CSE-ConnectionGUID: HUat+4BeRdim9/mocfUsbw==
X-CSE-MsgGUID: 2LTWALrYQYiY3hLMeYOXGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82167417"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82167417"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 07:49:09 -0700
X-CSE-ConnectionGUID: uqpfzTzYRSGJILPojHl+iA==
X-CSE-MsgGUID: NH7nlMG7SPiG2Z7piTmr6Q==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jun 2026 07:49:07 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY3Bw-000000004Gj-2tfk;
	Fri, 12 Jun 2026 14:49:04 +0000
Date: Fri, 12 Jun 2026 16:48:46 +0200
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v6 1/24]
 drivers/nvme/target/bpf.h:15:44: warning: declaration of 'struct
 nvmet_subsys_link' will not be visible outside of this function
Message-ID: <202606121653.sbaXkuBH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v6
head:   65843faa046b6a3ff4953aba7319313104638535
commit: 95eeb6714114cd17d9c4c494a28cc11d86059eef [1/24] nvmet-bpf: eBPF struct_ops support for log pages
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260612/202606121653.sbaXkuBH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121653.sbaXkuBH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121653.sbaXkuBH-lkp@intel.com/

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
         |                                                                    ^~~~~~~~~~~
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
         |                                                                    ^~~~~~~~~~~
   drivers/nvme/target/configfs.c:1114:19: error: incompatible pointer types passing 'struct nvmet_subsys_link *' to parameter of type 'struct nvmet_subsys_link *' [-Wincompatible-pointer-types]
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
         |                                                                    ^~~~~~~~~~~
   drivers/nvme/target/admin-cmd.c:224:26: error: incompatible pointer types passing 'struct nvmet_subsys *' to parameter of type 'struct nvmet_subsys *' [-Wincompatible-pointer-types]
     224 |         if (nvmet_bpf_supported(ctrl->subsys, req->port)) {
         |                                 ^~~~~~~~~~~~
   drivers/nvme/target/bpf.h:16:61: note: passing argument to parameter 'subsys' here
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                             ^
   drivers/nvme/target/admin-cmd.c:224:40: error: incompatible pointer types passing 'struct nvmet_port *' to parameter of type 'struct nvmet_port *' [-Wincompatible-pointer-types]
     224 |         if (nvmet_bpf_supported(ctrl->subsys, req->port)) {
         |                                               ^~~~~~~~~
   drivers/nvme/target/bpf.h:16:88: note: passing argument to parameter 'port' here
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                                                        ^
   drivers/nvme/target/admin-cmd.c:228:37: error: incompatible pointer types passing 'struct nvmet_req *' to parameter of type 'struct nvmet_req *' [-Wincompatible-pointer-types]
     228 |                         if (nvmet_bpf_log_page_supported(req, i))
         |                                                          ^~~
   drivers/nvme/target/bpf.h:20:67: note: passing argument to parameter 'req' here
      20 | static inline bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid)
         |                                                                   ^
   drivers/nvme/target/admin-cmd.c:626:26: error: incompatible pointer types passing 'struct nvmet_subsys *' to parameter of type 'struct nvmet_subsys *' [-Wincompatible-pointer-types]
     626 |         if (nvmet_bpf_supported(ctrl->subsys, req->port) &&
         |                                 ^~~~~~~~~~~~
   drivers/nvme/target/bpf.h:16:61: note: passing argument to parameter 'subsys' here
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                             ^
   drivers/nvme/target/admin-cmd.c:626:40: error: incompatible pointer types passing 'struct nvmet_port *' to parameter of type 'struct nvmet_port *' [-Wincompatible-pointer-types]
     626 |         if (nvmet_bpf_supported(ctrl->subsys, req->port) &&
         |                                               ^~~~~~~~~
   drivers/nvme/target/bpf.h:16:88: note: passing argument to parameter 'port' here
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                                                        ^
   drivers/nvme/target/admin-cmd.c:627:35: error: incompatible pointer types passing 'struct nvmet_req *' to parameter of type 'struct nvmet_req *' [-Wincompatible-pointer-types]
     627 |             nvmet_bpf_log_page_supported(req, lid))
         |                                          ^~~
   drivers/nvme/target/bpf.h:20:67: note: passing argument to parameter 'req' here
      20 | static inline bool nvmet_bpf_log_page_supported(struct nvmet_req *req, u8 lid)
         |                                                                   ^
   drivers/nvme/target/admin-cmd.c:628:33: error: incompatible pointer types passing 'struct nvmet_subsys *' to parameter of type 'struct nvmet_subsys *' [-Wincompatible-pointer-types]
     628 |                 return nvmet_bpf_get_log_page(ctrl->subsys, req);
         |                                               ^~~~~~~~~~~~
   drivers/nvme/target/bpf.h:24:64: note: passing argument to parameter 'subsys' here
      24 | static inline void nvmet_bpf_get_log_page(struct nvmet_subsys *subsys, struct nvmet_req *req)
         |                                                                ^
   drivers/nvme/target/admin-cmd.c:628:47: error: incompatible pointer types passing 'struct nvmet_req *' to parameter of type 'struct nvmet_req *' [-Wincompatible-pointer-types]
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
