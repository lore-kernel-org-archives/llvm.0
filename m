Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACB53D93
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 19:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658691862; x=1690227862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tQKpN6ikynGTSGkv/G/Uuuz7oZm68bMYo/lj8l6Ddc4=;
  b=nmaBpj9r26wMYiW6nY0ukAOhtIzhNaQW2T2D22gmM0QzSsCUthPAbGcu
   R6pbV6Tq4Yw5QS0b/dQVR3csK9V5xZ4W6ELvEpE+HtE5dmWhvAh1z8asn
   qRbGtM9glUYaR+ZWQ+9nNb/y9MfO/tZObjna2mLgXlmVZZSpNQeY8j2ot
   GgYdNolBIH/cO1v1O+dcQSP7G28EQb19mNA05C48ywYTUObtU8RVur6I5
   +Yij6o6gerW4sFPJLIyD73WosuBL949F1RV6G8Bw1XOMQmTjQHfcMaqwJ
   e6T9fecSf0Q49mCmip2qeaszAdf9TZGjmnbtA10bZU+sCr4CKpdREHePr
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="267340750"
X-IronPort-AV: E=Sophos;i="5.93,191,1654585200"; 
   d="scan'208";a="267340750"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2022 12:44:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,191,1654585200"; 
   d="scan'208";a="845292578"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Jul 2022 12:44:20 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oFhWV-0004CX-2M;
	Sun, 24 Jul 2022 19:44:19 +0000
Date: Mon, 25 Jul 2022 03:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org, Kalle Valo <quic_kvalo@quicinc.com>
Subject: [ammarfaizi2-block:kvalo/ath/pending 3/9]
 drivers/net/wireless/ath/wil6210/debugfs.c:1030:9: warning: variable 'rc' is
 uninitialized when used here
Message-ID: <202207250332.5ud26AGE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block kvalo/ath/pending
head:   086f67ba21ede199307e78476353bda9ffef982c
commit: 7a4836560a6198d245d5732e26f94898b12eb760 [3/9] wifi: wil6210: debugfs: fix info leak in wil_write_file_wmi()
config: powerpc-randconfig-r002-20220718 (https://download.01.org/0day-ci/archive/20220725/202207250332.5ud26AGE-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d74b88c69dc2644bd0dc5d64e2d7413a0d4040e5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/7a4836560a6198d245d5732e26f94898b12eb760
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block kvalo/ath/pending
        git checkout 7a4836560a6198d245d5732e26f94898b12eb760
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/net/wireless/ath/wil6210/

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
7a4836560a6198 Dan Carpenter       2022-07-15  1015  	if (cmdlen < 0 || *ppos != 0)
ff974e40833413 Vladimir Kondratiev 2014-06-16  1016  		return -EINVAL;
ff974e40833413 Vladimir Kondratiev 2014-06-16  1017  
7a4836560a6198 Dan Carpenter       2022-07-15  1018  	wmi = memdup_user(buf, len);
7a4836560a6198 Dan Carpenter       2022-07-15  1019  	if (IS_ERR(wmi))
7a4836560a6198 Dan Carpenter       2022-07-15  1020  		return PTR_ERR(wmi);
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

:::::: The code at line 1030 was first introduced by commit
:::::: ff974e4083341383d3dd4079e52ed30f57f376f0 wil6210: debugfs interface to send raw WMI command

:::::: TO: Vladimir Kondratiev <qca_vkondrat@qca.qualcomm.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
