Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F661844
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 05:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647323575; x=1678859575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/d1E6m5PhLMpfyieea5/73VZdfL1I+Jo11kCAro1Vms=;
  b=hO8oNhvEoai/NcpWPnLAlzKKWVa3hTMJ3lSijERr2QYeiU4WO/knpfOC
   z3u/wv299LJbSpvha2ySG25am9NS11IyFdMreGikW/ElwIZ1U30SI9kQr
   +btU71Imk1UPjDabXZhyIs5nmtkJxq0bX8BDaCAMSpbz71Nu64mzO9Jdu
   GsLBMwao4PC23BKAQtiUB8U+k+CkG8hnrluXg8kFiAVUAAD/QhrWpm/9G
   +ehW8XWgct9BaeXdI5DwutID2TU0cEwo8NK10lREs9lgbfYGeFXVsFjLg
   GSYZsqiITPcNIwpw9KvK841RScmYJUTFwCYBnvHWEqrm1bKq8M1tjWCv0
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256170551"
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; 
   d="scan'208";a="256170551"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 22:52:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; 
   d="scan'208";a="580394960"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Mar 2022 22:52:52 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nU071-000Ac0-M2; Tue, 15 Mar 2022 05:52:51 +0000
Date: Tue, 15 Mar 2022 13:52:44 +0800
From: kernel test robot <lkp@intel.com>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Nava kishore Manne <nava.manne@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 79/983]
 drivers/of/configfs.c:134:9: warning: no previous prototype for function
 'cfs_overlay_item_dtbo_read'
Message-ID: <202203151317.g6Z6rKCh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   82a6a288ad2ea30575c859f1a5ec2ad014e51528
commit: 92450eff19894419e326623c7b720e83aeb57b96 [79/983] OF: DT-Overlay configfs interface (v8)
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220315/202203151317.g6Z6rKCh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f50fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/92450eff19894419e326623c7b720e83aeb57b96
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 92450eff19894419e326623c7b720e83aeb57b96
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/clk/ drivers/gpu/drm/xlnx/ drivers/media/platform/xilinx/ drivers/misc/ drivers/net/ethernet/xilinx/ drivers/of/ drivers/phy/xilinx/ drivers/ptp/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/of/configfs.c:134:9: warning: no previous prototype for function 'cfs_overlay_item_dtbo_read' [-Wmissing-prototypes]
   ssize_t cfs_overlay_item_dtbo_read(struct config_item *item,
           ^
   drivers/of/configfs.c:134:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t cfs_overlay_item_dtbo_read(struct config_item *item,
   ^
   static 
>> drivers/of/configfs.c:156:9: warning: no previous prototype for function 'cfs_overlay_item_dtbo_write' [-Wmissing-prototypes]
   ssize_t cfs_overlay_item_dtbo_write(struct config_item *item,
           ^
   drivers/of/configfs.c:156:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t cfs_overlay_item_dtbo_write(struct config_item *item,
   ^
   static 
   2 warnings generated.


vim +/cfs_overlay_item_dtbo_read +134 drivers/of/configfs.c

   133	
 > 134	ssize_t cfs_overlay_item_dtbo_read(struct config_item *item,
   135					   void *buf, size_t max_count)
   136	{
   137		struct cfs_overlay_item *overlay = to_cfs_overlay_item(item);
   138	
   139		pr_debug("%s: buf=%p max_count=%zu\n", __func__, buf, max_count);
   140	
   141		if (!overlay->dtbo)
   142			return 0;
   143	
   144		/* copy if buffer provided */
   145		if (buf) {
   146			/* the buffer must be large enough */
   147			if (overlay->dtbo_size > max_count)
   148				return -ENOSPC;
   149	
   150			memcpy(buf, overlay->dtbo, overlay->dtbo_size);
   151		}
   152	
   153		return overlay->dtbo_size;
   154	}
   155	
 > 156	ssize_t cfs_overlay_item_dtbo_write(struct config_item *item,
   157					    const void *buf, size_t count)
   158	{
   159		struct cfs_overlay_item *overlay = to_cfs_overlay_item(item);
   160		int err;
   161	
   162		/* if it's set do not allow changes */
   163		if (overlay->path[0] != '\0' || overlay->dtbo_size > 0)
   164			return -EPERM;
   165	
   166		/* copy the contents */
   167		overlay->dtbo = kmemdup(buf, count, GFP_KERNEL);
   168		if (!overlay->dtbo)
   169			return -ENOMEM;
   170	
   171		overlay->dtbo_size = count;
   172	
   173		err = create_overlay(overlay, overlay->dtbo);
   174		if (err < 0)
   175			goto out_err;
   176	
   177		return count;
   178	
   179	out_err:
   180		kfree(overlay->dtbo);
   181		overlay->dtbo = NULL;
   182		overlay->dtbo_size = 0;
   183	
   184		return err;
   185	}
   186	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
