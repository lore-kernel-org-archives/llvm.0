Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067383B1BD;
	Sun, 14 Jun 2026 00:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781395436; cv=none; b=DiGvGvvGOoUGSKK3zw6oVW2Y3vhFkLhVYdc6thJYqYB2hbEAMFwG5BSsgDvSqyQ6eeYQt4+dldGcV9l4oCbDS4reLlymbbhUiqziA9KhykCH2Q7MGucjbgX6juCBkZqIgntGTV0OWAonWEc0aqVAcL39ImoAMGMDE0nhUgVETdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781395436; c=relaxed/simple;
	bh=VksiTXrs/c8MNTI7YJSFem1K8m/7E1Rvmk4eWCSxFoQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aaDLidWbB/dnAd3xqkFImrHmzFgylWeSEs9iZvuGjs1HsRPN/m9R5C2wHDi4v4ZW3urBQFqWSi0fIfjh1OpfQEh9mfqmtUEipmeXb0CkpjhGYhSLEMBaWHVw6MQpgP4Ng24Kq2Eoz2s28qrAqc7Fp6K/KuXFfnMP+Noupx7GXlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ef+y7W9w; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ef+y7W9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781395435; x=1812931435;
  h=date:from:to:cc:subject:message-id;
  bh=VksiTXrs/c8MNTI7YJSFem1K8m/7E1Rvmk4eWCSxFoQ=;
  b=Ef+y7W9w4ZkR0nxYduAo8WdpN8tVS0av1j//zHmJLA2zTAapLNFHvkqV
   JjrJtTxW2dwXO4p9AbcuSzyt/Wa1EI/TlnKGl9pSvB572cB37xdeyGkJR
   Hxge3JOfeKtOVpM+Q9H17N73R4XFdDi78E7zXUJ27QwHN0Od+c6cAde7b
   yTEOGv7LJav31j85v6bvNhj0Yddmb/OHSqVt2XZHkXjLjb3ZmqWjnOJwk
   R42aFKNIPF+Y7JoIIZ0lJivi/gZefELU9XBJ+ytPgf1lYh1JpA61PPP/g
   BbL9XLNH6zPvGw3L8KUVZkkqEXO/04BL4ODa//qloNa/y8IJxu4sS7D24
   A==;
X-CSE-ConnectionGUID: U4Fcid3aQPWb9CmdwmCfpA==
X-CSE-MsgGUID: 2y5f9eTdTrOFwBAxI5DNWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82031631"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="82031631"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 17:03:53 -0700
X-CSE-ConnectionGUID: 66IJr+ttRgSFrs8slLepXg==
X-CSE-MsgGUID: ydvWA7zoSMWH+vUcvGa6vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="246245041"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jun 2026 17:03:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYYKK-00000000QOo-3I9d;
	Sun, 14 Jun 2026 00:03:48 +0000
Date: Sun, 14 Jun 2026 08:03:05 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v6 1/24]
 drivers/nvme/target/bpf.h:26:9: error: call to undeclared function
 'nvmet_bpf_req_complete'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202606140700.QNDLr2fR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v6
head:   65843faa046b6a3ff4953aba7319313104638535
commit: 95eeb6714114cd17d9c4c494a28cc11d86059eef [1/24] nvmet-bpf: eBPF struct_ops support for log pages
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260614/202606140700.QNDLr2fR-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140700.QNDLr2fR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140700.QNDLr2fR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
>> drivers/nvme/target/bpf.h:26:9: error: call to undeclared function 'nvmet_bpf_req_complete'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^
>> drivers/nvme/target/bpf.h:26:61: error: use of undeclared identifier 'NVME_SC_DNR'
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
>> drivers/nvme/target/bpf.h:26:9: error: call to undeclared function 'nvmet_bpf_req_complete'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^
>> drivers/nvme/target/bpf.h:26:61: error: use of undeclared identifier 'NVME_SC_DNR'
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                                                                    ^~~~~~~~~~~
>> drivers/nvme/target/configfs.c:1114:19: error: incompatible pointer types passing 'struct nvmet_subsys_link *' to parameter of type 'struct nvmet_subsys_link *' [-Wincompatible-pointer-types]
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
>> drivers/nvme/target/bpf.h:26:9: error: call to undeclared function 'nvmet_bpf_req_complete'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                ^
>> drivers/nvme/target/bpf.h:26:61: error: use of undeclared identifier 'NVME_SC_DNR'
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                                                                    ^~~~~~~~~~~
>> drivers/nvme/target/admin-cmd.c:224:26: error: incompatible pointer types passing 'struct nvmet_subsys *' to parameter of type 'struct nvmet_subsys *' [-Wincompatible-pointer-types]
     224 |         if (nvmet_bpf_supported(ctrl->subsys, req->port)) {
         |                                 ^~~~~~~~~~~~
   drivers/nvme/target/bpf.h:16:61: note: passing argument to parameter 'subsys' here
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                             ^
>> drivers/nvme/target/admin-cmd.c:224:40: error: incompatible pointer types passing 'struct nvmet_port *' to parameter of type 'struct nvmet_port *' [-Wincompatible-pointer-types]
     224 |         if (nvmet_bpf_supported(ctrl->subsys, req->port)) {
         |                                               ^~~~~~~~~
   drivers/nvme/target/bpf.h:16:88: note: passing argument to parameter 'port' here
      16 | static inline bool nvmet_bpf_supported(struct nvmet_subsys *subsys, struct nvmet_port *port)
         |                                                                                        ^
>> drivers/nvme/target/admin-cmd.c:228:37: error: incompatible pointer types passing 'struct nvmet_req *' to parameter of type 'struct nvmet_req *' [-Wincompatible-pointer-types]
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
--
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
   drivers/nvme/target/../target/bpf.h:26:61: error: use of undeclared identifier 'NVME_SC_DNR'
      26 |         return nvmet_bpf_req_complete(req, NVME_SC_INVALID_FIELD | NVME_SC_DNR);
         |                                                                    ^~~~~~~~~~~
   6 warnings and 2 errors generated.


vim +/nvmet_bpf_req_complete +26 drivers/nvme/target/bpf.h

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
