Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16404420
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 16:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657558657; x=1689094657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LJc053lm49/34TAoPU0ZlWIW2HltKDIYbPHFGb4uF7U=;
  b=heZo2xy2+F0a65lWWjLLf2idvSWjhGR9Sg8pRWlpqGRvfl3EMJG4t2nD
   DX/67CcTVQBBGWQm7we1RjdFqa59cwIOj2v/zNHLOEm5fEz4apMpoX/11
   pQSh//99rFB6MwyJMq6Q1HVDQV6ATQ3y7MDAig/ceRSeAdlM20lGy71/j
   s+tvVE9181htfmia9aWZ9JLcfq7V+/WdSnYJhYcbxVwlyZy3oyOU+5oxs
   F6rX+2ASa1UkGfyRqEHtLUX+UBN2H2wt5ODDJf7jloti0onhEE5Jska5h
   5rIFATr//CbnTN5ZNLQjau+S/X/b9R9ZSZy4UWtjVbeumGbCUsTXFRHLb
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="284741401"
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="284741401"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 09:57:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="569842310"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Jul 2022 09:57:34 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oAwj0-0000yl-1a;
	Mon, 11 Jul 2022 16:57:34 +0000
Date: Tue, 12 Jul 2022 00:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [asahilinux:bluetooth-wip 8/8]
 drivers/bluetooth/hci_bcm43xx.c:1280:8: error: incompatible pointer types
 passing '__le64 *' (aka 'unsigned long long *') to parameter of type
 'dma_addr_t *' (aka 'unsigned int *')
Message-ID: <202207120005.X91mQhqU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bluetooth-wip
head:   988727c92ef6a0ae2c476c6f06676b63665c6059
commit: 988727c92ef6a0ae2c476c6f06676b63665c6059 [8/8] Bluetooth: hci_bcm43xx: Add new driver for BCM43XX PCI boards
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220712/202207120005.X91mQhqU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6ce63e267aab79ca87bf63453d34dd3909ab978d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/988727c92ef6a0ae2c476c6f06676b63665c6059
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bluetooth-wip
        git checkout 988727c92ef6a0ae2c476c6f06676b63665c6059
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/bluetooth/hci_bcm43xx.c:1088:23: warning: unused variable 'bcm43xx' [-Wunused-variable]
           struct bcm43xx_data *bcm43xx = hci_get_drvdata(hdev);
                                ^
>> drivers/bluetooth/hci_bcm43xx.c:1280:8: error: incompatible pointer types passing '__le64 *' (aka 'unsigned long long *') to parameter of type 'dma_addr_t *' (aka 'unsigned int *') [-Werror,-Wincompatible-pointer-types]
                               &bcm43xx->ctx->per_info_addr, GFP_KERNEL);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:550:15: note: passing argument to parameter 'dma_handle' here
                   dma_addr_t *dma_handle, gfp_t gfp)
                               ^
   1 warning and 1 error generated.


vim +1280 drivers/bluetooth/hci_bcm43xx.c

  1256	
  1257	static int bcm43xx_init_context(struct bcm43xx_data *bcm43xx)
  1258	{
  1259		struct device *dev = &bcm43xx->pdev->dev;
  1260	
  1261		bcm43xx->ctx = dmam_alloc_coherent(dev, sizeof(*bcm43xx->ctx),
  1262						   &bcm43xx->ctx_dma, GFP_KERNEL);
  1263		if (!bcm43xx->ctx)
  1264			return -ENOMEM;
  1265		memset(bcm43xx->ctx, 0, sizeof(*bcm43xx->ctx));
  1266	
  1267		bcm43xx->ring_state =
  1268			dmam_alloc_coherent(dev, sizeof(*bcm43xx->ring_state),
  1269					    &bcm43xx->ring_state_dma, GFP_KERNEL);
  1270		if (!bcm43xx->ring_state)
  1271			return -ENOMEM;
  1272		memset(bcm43xx->ring_state, 0, sizeof(*bcm43xx->ring_state));
  1273	
  1274		bcm43xx->ctx->version = cpu_to_le16(1);
  1275		bcm43xx->ctx->size = cpu_to_le16(sizeof(*bcm43xx->ctx));
  1276		bcm43xx->ctx->enabled_caps = cpu_to_le16(2);
  1277	
  1278		// TODO: do we actually care about the contents here?
  1279		dmam_alloc_coherent(&bcm43xx->pdev->dev, PAGE_SIZE,
> 1280				    &bcm43xx->ctx->per_info_addr, GFP_KERNEL);
  1281	
  1282		bcm43xx->ctx->xfer_ring_heads_addr =
  1283			bcm43xx->ring_state_dma +
  1284			offsetof(struct bcm43xx_ring_state, xfer_ring_head);
  1285		bcm43xx->ctx->xfer_ring_tails_addr =
  1286			bcm43xx->ring_state_dma +
  1287			offsetof(struct bcm43xx_ring_state, xfer_ring_tail);
  1288		bcm43xx->ctx->completion_ring_heads_addr =
  1289			bcm43xx->ring_state_dma +
  1290			offsetof(struct bcm43xx_ring_state, completion_ring_head);
  1291		bcm43xx->ctx->completion_ring_tails_addr =
  1292			bcm43xx->ring_state_dma +
  1293			offsetof(struct bcm43xx_ring_state, completion_ring_tail);
  1294	
  1295		bcm43xx->ctx->n_completion_rings =
  1296			cpu_to_le16(BCM43XX_N_COMPLETION_RINGS);
  1297		bcm43xx->ctx->n_xfer_rings = cpu_to_le16(BCM43XX_N_TRANSFER_RINGS);
  1298	
  1299		bcm43xx->ctx->control_completion_ring_addr =
  1300			cpu_to_le64(bcm43xx->control_ack_ring.ring_dma);
  1301		bcm43xx->ctx->control_completion_ring_n_entries =
  1302			cpu_to_le16(bcm43xx->control_ack_ring.n_entries);
  1303		bcm43xx->ctx->control_completion_ring_doorbell = cpu_to_le16(0xffff);
  1304		bcm43xx->ctx->control_completion_ring_msi = 0;
  1305		bcm43xx->ctx->control_completion_ring_header_size = 0;
  1306		bcm43xx->ctx->control_completion_ring_footer_size = 0;
  1307	
  1308		bcm43xx->ctx->control_xfer_ring_addr =
  1309			cpu_to_le64(bcm43xx->control_h2d_ring.ring_dma);
  1310		bcm43xx->ctx->control_xfer_ring_n_entries =
  1311			cpu_to_le16(bcm43xx->control_h2d_ring.n_entries);
  1312		bcm43xx->ctx->control_xfer_ring_doorbell =
  1313			cpu_to_le16(bcm43xx->control_h2d_ring.doorbell);
  1314		bcm43xx->ctx->control_xfer_ring_msi = 0;
  1315		bcm43xx->ctx->control_xfer_ring_header_size = 0;
  1316		bcm43xx->ctx->control_xfer_ring_footer_size =
  1317			bcm43xx->control_h2d_ring.payload_size / 4;
  1318	
  1319		return 0;
  1320	}
  1321	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
