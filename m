Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5401548F;
	Thu, 30 Nov 2023 04:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BjFLOAkp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701316992; x=1732852992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lv3eW2TOZ55jN7KZ/f4TbMkgEF+ITNbNvPTU0G0/IEs=;
  b=BjFLOAkpO8YuumXsQ6SAFNJlD1DI846uPXf0HpaDy/1pje9zO/LpulCv
   bKidR7lXbu5IpD82eC+Irynz3dkCX8RsulusY+rH9+C6oOWZb5pAS4CgD
   rrFfTixkB+N95sCLr95x1IvUAVRTVht7mIbYqJrxrFuuGkzNTX6KS9hWY
   Xz3f7l2BUU4+V3+9Gm5aXUREAR9cTyK2OhwDkGnzSJ0QgCAFiIaF/czTJ
   2Vm6i4C7mOIAVH7FUlWJMxDeR06b5ahsUghmRZJk3fxoNQcOQX3yTUiFV
   wsERnZF3sxplfs+CAqbzDOETFHkjoF8OSddJEB/ZGVoZCOIzfjW4Sz+NQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="393009072"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="393009072"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 20:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="913063269"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="913063269"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 29 Nov 2023 20:03:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8YGW-0001Jw-0m;
	Thu, 30 Nov 2023 04:03:04 +0000
Date: Thu, 30 Nov 2023 12:02:54 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nvme@lists.infradead.org, Sagi Grimberg <sagi@grimberg.me>
Subject: [linux-nvme:nvme-6.7 5/6] drivers/nvme/host/rdma.c:987:47: error:
 incompatible pointer types passing 'struct nvme_rdma_ctrl *' to parameter of
 type 'struct nvme_ctrl *'
Message-ID: <202311301141.jPWaYfLH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.7
head:   b6cbe703db447a22f70caa0ee9cf616ac26cdc37
commit: 822d50c036c6af2e6a42b45b2e63cb02d6233c2b [5/6] nvme: ensure reset state check ordering
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231130/202311301141.jPWaYfLH-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301141.jPWaYfLH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301141.jPWaYfLH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/host/rdma.c:987:47: error: incompatible pointer types passing 'struct nvme_rdma_ctrl *' to parameter of type 'struct nvme_ctrl *' [-Werror,-Wincompatible-pointer-types]
           enum nvme_ctrl_state state = nvme_ctrl_state(ctrl);
                                                        ^~~~
   drivers/nvme/host/nvme.h:390:70: note: passing argument to parameter 'ctrl' here
   static inline enum nvme_ctrl_state nvme_ctrl_state(struct nvme_ctrl *ctrl)
                                                                        ^
   drivers/nvme/host/rdma.c:1063:48: error: incompatible pointer types passing 'struct nvme_rdma_ctrl *' to parameter of type 'struct nvme_ctrl *' [-Werror,-Wincompatible-pointer-types]
                   enum nvme_ctrl_state state = nvme_ctrl_state(ctrl);
                                                                ^~~~
   drivers/nvme/host/nvme.h:390:70: note: passing argument to parameter 'ctrl' here
   static inline enum nvme_ctrl_state nvme_ctrl_state(struct nvme_ctrl *ctrl)
                                                                        ^
   drivers/nvme/host/rdma.c:1135:48: error: incompatible pointer types passing 'struct nvme_rdma_ctrl *' to parameter of type 'struct nvme_ctrl *' [-Werror,-Wincompatible-pointer-types]
                   enum nvme_ctrl_state state = nvme_ctrl_state(ctrl);
                                                                ^~~~
   drivers/nvme/host/nvme.h:390:70: note: passing argument to parameter 'ctrl' here
   static inline enum nvme_ctrl_state nvme_ctrl_state(struct nvme_ctrl *ctrl)
                                                                        ^
   drivers/nvme/host/rdma.c:1170:22: error: incompatible pointer types passing 'struct nvme_rdma_ctrl *' to parameter of type 'struct nvme_ctrl *' [-Werror,-Wincompatible-pointer-types]
           if (nvme_ctrl_state(ctrl) == NVME_CTRL_LIVE)
                               ^~~~
   drivers/nvme/host/nvme.h:390:70: note: passing argument to parameter 'ctrl' here
   static inline enum nvme_ctrl_state nvme_ctrl_state(struct nvme_ctrl *ctrl)
                                                                        ^
   drivers/nvme/host/rdma.c:1953:22: error: incompatible pointer types passing 'struct nvme_rdma_ctrl *' to parameter of type 'struct nvme_ctrl *' [-Werror,-Wincompatible-pointer-types]
           if (nvme_ctrl_state(ctrl) != NVME_CTRL_LIVE) {
                               ^~~~
   drivers/nvme/host/nvme.h:390:70: note: passing argument to parameter 'ctrl' here
   static inline enum nvme_ctrl_state nvme_ctrl_state(struct nvme_ctrl *ctrl)
                                                                        ^
   5 errors generated.


vim +987 drivers/nvme/host/rdma.c

   984	
   985	static void nvme_rdma_reconnect_or_remove(struct nvme_rdma_ctrl *ctrl)
   986	{
 > 987		enum nvme_ctrl_state state = nvme_ctrl_state(ctrl);
   988	
   989		/* If we are resetting/deleting then do nothing */
   990		if (state != NVME_CTRL_CONNECTING) {
   991			WARN_ON_ONCE(state == NVME_CTRL_NEW || state == NVME_CTRL_LIVE);
   992			return;
   993		}
   994	
   995		if (nvmf_should_reconnect(&ctrl->ctrl)) {
   996			dev_info(ctrl->ctrl.device, "Reconnecting in %d seconds...\n",
   997				ctrl->ctrl.opts->reconnect_delay);
   998			queue_delayed_work(nvme_wq, &ctrl->reconnect_work,
   999					ctrl->ctrl.opts->reconnect_delay * HZ);
  1000		} else {
  1001			nvme_delete_ctrl(&ctrl->ctrl);
  1002		}
  1003	}
  1004	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
