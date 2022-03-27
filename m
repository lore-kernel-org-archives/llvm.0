Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879867E
	for <llvm@lists.linux.dev>; Sun, 27 Mar 2022 00:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648340385; x=1679876385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q2GnO8WW+PtoP/up/sromQvWqCUDnDLHSJ3SrxjPVhw=;
  b=MrjLgeBx63gHx584a5moei5Mbp8I3PKZ6igH37D7kYaR+lnao20WBKVX
   dvWKhrekSVkdF3gptPlWdl1omhrqzA8qqvU2sW3WNtzeWt48EMD1DEDdy
   D0M4zg4RD7Ollofzls4qkgtHmizELKrWECmiyNllXu90bPUpL0923Xye6
   UIRzrrVn/15zBUWqkrLo+6G2w1ncbFLpo1+uknCtqvXvMRMtHXj+yNxiD
   0Ji3uKedBKjpjL2DzcuLTNAHIJ2L4yNDqXV2JxkyQC/bzFbIj8uPDHm5+
   cgjt8OSifeFOVihkkBoZDWmv+WuwdwVfeutPkGJJtz0/a0wEyaTqsvqtX
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10298"; a="345247937"
X-IronPort-AV: E=Sophos;i="5.90,214,1643702400"; 
   d="scan'208";a="345247937"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2022 17:19:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,214,1643702400"; 
   d="scan'208";a="584816887"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Mar 2022 17:19:41 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nYGdB-0000YJ-A1; Sun, 27 Mar 2022 00:19:41 +0000
Date: Sun, 27 Mar 2022 08:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Nava kishore Manne <nava.manne@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 79/1029]
 drivers/of/configfs.c:134:9: warning: no previous prototype for function
 'cfs_overlay_item_dtbo_read'
Message-ID: <202203270826.aWqJcdaC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Pantelis,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
commit: 92450eff19894419e326623c7b720e83aeb57b96 [79/1029] OF: DT-Overlay configfs interface (v8)
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220327/202203270826.aWqJcdaC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/92450eff19894419e326623c7b720e83aeb57b96
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 92450eff19894419e326623c7b720e83aeb57b96
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

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

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
