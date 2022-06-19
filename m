Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491C37B
	for <llvm@lists.linux.dev>; Sun, 19 Jun 2022 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655653270; x=1687189270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T8YFDdRhYrxweQVdK5kIPl50L9VpxARzAZ85FGoOmXg=;
  b=iJF4MTob4hWKVGuMyfrWSUBSeHPcKHYizknxD9vuw8ZgJBcPL3zXnKKg
   93Foubae2k0T8KYUcwzzzKZ1w3lK1/qYFrnglZoi6whi7QWi7kwbB9QMj
   r8d2CrslWyJoFlaU20ZiHNF9fTF6fbbmR2WU3PtMaVNPr2sM8SKS/tYOF
   jdqzKa6c641pz6iTvAxvZBH7LcyzSBbqQdvd9yX4JO7w9tH9gDl37IKSE
   pVUHa0xVGBKQZRtcV4uU5Z1CxqupYBZTBhEj/670fMWnsXt1MdBd3mpV9
   2vO6Qaym+/IFcY/vLbFhHxyCbZetDFOIgLdL6V4/jMmcSKgyR7YLnkTsY
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="278512919"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="278512919"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2022 08:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="913316661"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jun 2022 08:41:07 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2x2r-000RKN-Py;
	Sun, 19 Jun 2022 15:41:01 +0000
Date: Sun, 19 Jun 2022 23:40:36 +0800
From: kernel test robot <lkp@intel.com>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Nava kishore Manne <nava.manne@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 79/1181]
 drivers/of/configfs.c:134:9: warning: no previous prototype for function
 'cfs_overlay_item_dtbo_read'
Message-ID: <202206192308.yTnjMB3r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pantelis,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   59523b5c4aca0174f1f8cba2a07d3b3328b7c80e
commit: 92450eff19894419e326623c7b720e83aeb57b96 [79/1181] OF: DT-Overlay configfs interface (v8)
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220619/202206192308.yTnjMB3r-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/92450eff19894419e326623c7b720e83aeb57b96
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 92450eff19894419e326623c7b720e83aeb57b96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/clk/ drivers/gpu/drm/xlnx/ drivers/media/i2c/ drivers/media/platform/xilinx/ drivers/of/ drivers/phy/xilinx/ drivers/ptp/ drivers/staging/

If you fix the issue, kindly add following tag where applicable
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
