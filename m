Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF277C;
	Fri, 19 May 2023 06:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684476902; x=1716012902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=33gwOlNJJbOb1crQLFuv8hx2jYe8ldoygppJkHRy6gs=;
  b=C06EchXVg3IzMpFoNHa0dvkfSkq/DBugdoFviOXLI0mGsjGKrGRL6tGG
   k3aL8512z8AWZ5xS9z84MY2buk/l7vCvYhyU9ANLH5fUeGL/TAovpKcCs
   42S8FjAWR0XS0Gs9RdLrBIAn4iMmgxmLbL6vL9qi4fULS8dqBmevTxeVK
   3YxTc9HdeKLWDerHOgHapdI8juigDzcsm8oXb3OeUXZiSmKUVL9G3Tw0h
   kE4apuJHnWAIjg9AWQ/hNSROqFPHQpmId4miYTxDOLBiNflRuOBCeGAEY
   CYp0Z11cif6QenCYbMLYA6k3LHPSeyybUZu8EOkCHJ7CUFLAuyM4Kqhtl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354647902"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="354647902"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 23:15:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="948999510"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="948999510"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 May 2023 23:15:00 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pztOG-000Ae2-0H;
	Fri, 19 May 2023 06:15:00 +0000
Date: Fri, 19 May 2023 14:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-v6.4-rc2-noaudio 34/87]
 drivers/bluetooth/btqca.c:213:6: warning: variable 'bid_len' set but not
 used
Message-ID: <202305191415.BhcGeutK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.4-rc2-noaudio
head:   3f22761b1d2903107946609c00f63d8a68d7e85a
commit: 5d5687ac24bde537084f46f49d21e4ce7653dd28 [34/87] hack: bluetooth: add way to generate nvm name
config: riscv-randconfig-r001-20230517 (https://download.01.org/0day-ci/archive/20230519/202305191415.BhcGeutK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/steev/linux/commit/5d5687ac24bde537084f46f49d21e4ce7653dd28
        git remote add steev https://github.com/steev/linux
        git fetch --no-tags steev lenovo-x13s-v6.4-rc2-noaudio
        git checkout 5d5687ac24bde537084f46f49d21e4ce7653dd28
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305191415.BhcGeutK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bluetooth/btqca.c:213:6: warning: variable 'bid_len' set but not used [-Wunused-but-set-variable]
           int bid_len, err = 0;
               ^
   1 warning generated.


vim +/bid_len +213 drivers/bluetooth/btqca.c

   207	
   208	static int qca_read_fw_board_id(struct hci_dev *hdev, u16 *bid)
   209	{
   210		u8 cmd;
   211		struct sk_buff *skb;
   212		struct edl_event_hdr *edl;
 > 213		int bid_len, err = 0;
   214	
   215		cmd = EDL_GET_BID_REQ_CMD;
   216		skb = __hci_cmd_sync_ev(hdev, EDL_PATCH_CMD_OPCODE, EDL_PATCH_CMD_LEN,
   217					&cmd, 0, HCI_INIT_TIMEOUT);
   218		if (IS_ERR(skb)) {
   219			err = PTR_ERR(skb);
   220			bt_dev_err(hdev, "Reading QCA board ID failed (%d)", err);
   221			return err;
   222		}
   223	
   224		edl = skb_pull_data(skb, sizeof(*edl));
   225		if (!edl) {
   226			bt_dev_err(hdev, "QCA read board ID with no header");
   227			err = -EILSEQ;
   228			goto out;
   229		}
   230	
   231		if (edl->cresp != EDL_CMD_REQ_RES_EVT ||
   232		    edl->rtype != EDL_GET_BID_REQ_CMD) {
   233			bt_dev_err(hdev, "QCA Wrong packet received %d %d", edl->cresp,
   234				   edl->rtype);
   235			err = -EIO;
   236			goto out;
   237		}
   238	
   239		bid_len = edl->data[0];
   240		*bid = (edl->data[1] << 8) + edl->data[2];
   241	
   242	out:
   243		kfree_skb(skb);
   244		return err;
   245	}
   246	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
