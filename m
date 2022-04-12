Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310231FD1
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 17:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649782858; x=1681318858;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BCfmgdg71xvN/+hNhLnF47iZIeJ9/zDt7qxQb/MMVX4=;
  b=j3NZZuuptFIkBbO94/TDDeEIKQ6+mf8SFXJFdnqJMRduQiysgnVTdZ4F
   02/H0cvZVHtU4OYw/sfjBPry7Q09ejoxan+7uFiSi2Vd2M/vgu4uWoO1t
   SU79Ze18hCW0cqEvrt4LTvhnVj/BCL44SdMARw1dSvI7Cd9Cz5LWDegMw
   a2k3eEm+fA8sGCEAlYzq7aZKCpvhrjX9DlmyDUBEv5q+zKdLnuyndKe28
   aSOJFthKU4kW8DIoGpXGTE4UcUNbHc2PVpAMBWNsn/DUGgGSAr6Gkkb5C
   qmDpgqtH//IZSIxwQfMbPCGpClUt/l0WY+XIXpYUdwfNIOoyaS8Slangj
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262620876"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="262620876"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 10:00:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="724536834"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Apr 2022 10:00:40 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1neJse-000311-6b;
	Tue, 12 Apr 2022 17:00:40 +0000
Date: Wed, 13 Apr 2022 01:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: Duoming Zhou <duoming@zju.edu.cn>, krzk@kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, davem@davemloft.net,
	gregkh@linuxfoundation.org, alexander.deucher@amd.com,
	broonie@kernel.org, akpm@linux-foundation.org,
	netdev@vger.kernel.org, pabeni@redhat.com,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: Re: [PATCH 2/2] drivers: nfc: nfcmrvl: fix double free bug in
 nfc_fw_download_done()
Message-ID: <202204130040.8kwehlO8-lkp@intel.com>
References: <d958c7ea019766405bf9db42d58d24d61d6b7607.1649759498.git.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d958c7ea019766405bf9db42d58d24d61d6b7607.1649759498.git.duoming@zju.edu.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Duoming,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net-next/master]
[also build test ERROR on net/master linus/master linux/master v5.18-rc2 next-20220412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Duoming-Zhou/Fix-double-free-bugs-in-nfcmrvl-module/20220412-203028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git b66bfc131c69bd9a5ed3ae90be4cf47ec46c1526
config: i386-randconfig-a004-20220411 (https://download.01.org/0day-ci/archive/20220413/202204130040.8kwehlO8-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1f4dba76cb2e854d8ae29781d066257f58b33dee
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Duoming-Zhou/Fix-double-free-bugs-in-nfcmrvl-module/20220412-203028
        git checkout 1f4dba76cb2e854d8ae29781d066257f58b33dee
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/nfc/nfcmrvl/fw_dnld.c:120:6: error: use of undeclared identifier 'dev'
           if (dev->fw_download_in_progress)
               ^
   1 error generated.


vim +/dev +120 drivers/nfc/nfcmrvl/fw_dnld.c

    92	
    93	static void fw_dnld_over(struct nfcmrvl_private *priv, u32 error)
    94	{
    95		spin_lock_irq(&priv->fw_dnld.lock);
    96		if (priv->fw_dnld.fw) {
    97			release_firmware(priv->fw_dnld.fw);
    98			priv->fw_dnld.fw = NULL;
    99			priv->fw_dnld.header = NULL;
   100			priv->fw_dnld.binary_config = NULL;
   101		}
   102		spin_unlock_irq(&priv->fw_dnld.lock);
   103	
   104		atomic_set(&priv->ndev->cmd_cnt, 0);
   105	
   106		if (timer_pending(&priv->ndev->cmd_timer))
   107			del_timer_sync(&priv->ndev->cmd_timer);
   108	
   109		if (timer_pending(&priv->fw_dnld.timer))
   110			del_timer_sync(&priv->fw_dnld.timer);
   111	
   112		nfc_info(priv->dev, "FW loading over (%d)]\n", error);
   113	
   114		if (error != 0) {
   115			/* failed, halt the chip to avoid power consumption */
   116			nfcmrvl_chip_halt(priv);
   117		}
   118	
   119		spin_lock_irq(&priv->fw_dnld.lock);
 > 120		if (dev->fw_download_in_progress)
   121			nfc_fw_download_done(priv->ndev->nfc_dev, priv->fw_dnld.name, error);
   122		spin_unlock_irq(&priv->fw_dnld.lock);
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
