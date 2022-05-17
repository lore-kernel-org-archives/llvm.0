Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C061410E8
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 08:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652777956; x=1684313956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kJRcV+v8VB+4mhAf4YNloLzQO3edURpA8KmJXVYZfeI=;
  b=HB/dUsub2KcwpfP4kSY23wWuxBEipv4wu2hN8PU3aCjLp+UCKslpDovB
   EQsI3maUCDN2NTUYfoFhQvK/NTxKRNhXg3s+OfxlGFeZjJeS9c93syX87
   byfm/lCPTuWwnR2tPnAYwiIKwpYMAzy0KFF8k5O+cTTTqS8Tc5oKWlkcC
   rSzlZazcnov+tRcNl/SqRYKeu+gw/+e/H8FfjIAITBYfrceRrQ77eu3N5
   JSodFgRoKk07FEsjK3orC/J8yU/zIWZlRlXWuWPbAO32DngWa1K/zXH+T
   oluus3jMdXm5f/8Mzz0GwcKPYGvAaIEWLwt6zfFMVQyz3RdVj7NJY2mHG
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="296392661"
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; 
   d="scan'208";a="296392661"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 01:59:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; 
   d="scan'208";a="660521224"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 May 2022 01:59:14 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqt2v-0000mD-Mp;
	Tue, 17 May 2022 08:59:13 +0000
Date: Tue, 17 May 2022 16:58:40 +0800
From: kernel test robot <lkp@intel.com>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Nava kishore Manne <nava.manne@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS_2022.1_update 79/1093]
 drivers/of/configfs.c:134:9: warning: no previous prototype for function
 'cfs_overlay_item_dtbo_read'
Message-ID: <202205171656.WPwaalgC-lkp@intel.com>
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

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
head:   5ead03b6e64b5072737c653bb20ebcd88704e3d1
commit: 92450eff19894419e326623c7b720e83aeb57b96 [79/1093] OF: DT-Overlay configfs interface (v8)
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20220517/202205171656.WPwaalgC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/92450eff19894419e326623c7b720e83aeb57b96
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS_2022.1_update
        git checkout 92450eff19894419e326623c7b720e83aeb57b96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/clk/ drivers/gpu/drm/xlnx/ drivers/media/i2c/ drivers/media/platform/xilinx/ drivers/net/ethernet/xilinx/ drivers/of/ drivers/phy/xilinx/ drivers/ptp/ drivers/staging/

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
