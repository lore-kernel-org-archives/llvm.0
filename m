Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4BF139A
	for <llvm@lists.linux.dev>; Sun, 10 Jul 2022 13:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657458320; x=1688994320;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TtvL8llhAWl459/KhPxFhFqdLuhz7mx/ARqHz6U+Iq0=;
  b=hnnDSFpDE23FRlJYKDAkh0V9upLt94L2Co9npPgID1xcPf0QLDyGctz+
   O1abAp82nIO8dMhgAiKzdELe8WSH/2zWT7g5fPtMslxYnGQ6Vx4iHYa9c
   4feQAGJpx1M+WAphqkYmRrDWRklRuM3tSqbHOej3INjFoiOgfdNRncnly
   KejHPkW5p32JZszb70NoAj7N9PGvlaTr5JVb06AibkyoF1p0x1snErepR
   ltJV4PvXQ6HQCMTo3mpxUhSrbhFlgEevebMwqpzG170IyasLt1N7jQl3v
   iC1R0pE4GsHWQ/d+RjOnDpvnrkAZE8/yrBqcoJPgs07H8U61kvM2jECN7
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10403"; a="264920890"
X-IronPort-AV: E=Sophos;i="5.92,260,1650956400"; 
   d="scan'208";a="264920890"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2022 06:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,260,1650956400"; 
   d="scan'208";a="544719832"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Jul 2022 06:05:13 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oAWca-000Pr8-Et;
	Sun, 10 Jul 2022 13:05:12 +0000
Date: Sun, 10 Jul 2022 21:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 1/2] wil6210: debugfs: fix info leak in
 wil_write_file_wmi()
Message-ID: <202207102127.7EJG1r1i-lkp@intel.com>
References: <YsUx6tbR5jhJc/UH@kili>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YsUx6tbR5jhJc/UH@kili>

Hi Dan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main kvalo-ath/ath-next linus/master kvalo-wireless-drivers/master v5.19-rc5 next-20220708]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Carpenter/wil6210-debugfs-fix-info-leak-in-wil_write_file_wmi/20220706-145900
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220710/202207102127.7EJG1r1i-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f553287b588916de09c66e3e32bf75e5060f967f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/9c358c3b4049c36e9f0f49ea9a491c68dc8c9a89
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dan-Carpenter/wil6210-debugfs-fix-info-leak-in-wil_write_file_wmi/20220706-145900
        git checkout 9c358c3b4049c36e9f0f49ea9a491c68dc8c9a89
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpio/ drivers/net/ethernet/marvell/octeontx2/af/ drivers/net/wireless/ath/wil6210/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/wil6210/debugfs.c:1030:9: warning: variable 'rc' is uninitialized when used here [-Wuninitialized]
           return rc;
                  ^~
   drivers/net/wireless/ath/wil6210/debugfs.c:1013:8: note: initialize the variable 'rc' to silence this warning
           int rc, rc1;
                 ^
                  = 0
   1 warning generated.


vim +/rc +1030 drivers/net/wireless/ath/wil6210/debugfs.c

2be7d22f062535 Vladimir Kondratiev 2012-12-20  1000  
ff974e40833413 Vladimir Kondratiev 2014-06-16  1001  /* Write WMI command (w/o mbox header) to this file to send it
ff974e40833413 Vladimir Kondratiev 2014-06-16  1002   * WMI starts from wil6210_mbox_hdr_wmi header
ff974e40833413 Vladimir Kondratiev 2014-06-16  1003   */
ff974e40833413 Vladimir Kondratiev 2014-06-16  1004  static ssize_t wil_write_file_wmi(struct file *file, const char __user *buf,
ff974e40833413 Vladimir Kondratiev 2014-06-16  1005  				  size_t len, loff_t *ppos)
ff974e40833413 Vladimir Kondratiev 2014-06-16  1006  {
ff974e40833413 Vladimir Kondratiev 2014-06-16  1007  	struct wil6210_priv *wil = file->private_data;
e00243fab84b4e Lior David          2018-02-26  1008  	struct wil6210_vif *vif = ndev_to_vif(wil->main_ndev);
b874ddecae0a08 Lior David          2016-03-01  1009  	struct wmi_cmd_hdr *wmi;
ff974e40833413 Vladimir Kondratiev 2014-06-16  1010  	void *cmd;
b874ddecae0a08 Lior David          2016-03-01  1011  	int cmdlen = len - sizeof(struct wmi_cmd_hdr);
ff974e40833413 Vladimir Kondratiev 2014-06-16  1012  	u16 cmdid;
ff974e40833413 Vladimir Kondratiev 2014-06-16  1013  	int rc, rc1;
ff974e40833413 Vladimir Kondratiev 2014-06-16  1014  
9c358c3b4049c3 Dan Carpenter       2022-07-06  1015  	if (cmdlen < 0 || *ppos != 0)
ff974e40833413 Vladimir Kondratiev 2014-06-16  1016  		return -EINVAL;
ff974e40833413 Vladimir Kondratiev 2014-06-16  1017  
9c358c3b4049c3 Dan Carpenter       2022-07-06  1018  	wmi = memdup_user(buf, len);
9c358c3b4049c3 Dan Carpenter       2022-07-06  1019  	if (IS_ERR(wmi))
9c358c3b4049c3 Dan Carpenter       2022-07-06  1020  		return PTR_ERR(wmi);
ff974e40833413 Vladimir Kondratiev 2014-06-16  1021  
69218a48005d0c Lior David          2016-03-21  1022  	cmd = (cmdlen > 0) ? &wmi[1] : NULL;
b874ddecae0a08 Lior David          2016-03-01  1023  	cmdid = le16_to_cpu(wmi->command_id);
ff974e40833413 Vladimir Kondratiev 2014-06-16  1024  
e00243fab84b4e Lior David          2018-02-26  1025  	rc1 = wmi_send(wil, cmdid, vif->mid, cmd, cmdlen);
ff974e40833413 Vladimir Kondratiev 2014-06-16  1026  	kfree(wmi);
ff974e40833413 Vladimir Kondratiev 2014-06-16  1027  
af3db60a30331d Lazar Alexei        2017-01-20  1028  	wil_info(wil, "0x%04x[%d] -> %d\n", cmdid, cmdlen, rc1);
ff974e40833413 Vladimir Kondratiev 2014-06-16  1029  
ff974e40833413 Vladimir Kondratiev 2014-06-16 @1030  	return rc;
ff974e40833413 Vladimir Kondratiev 2014-06-16  1031  }
ff974e40833413 Vladimir Kondratiev 2014-06-16  1032  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
