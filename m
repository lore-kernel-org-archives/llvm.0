Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD98184E
	for <llvm@lists.linux.dev>; Tue, 19 Apr 2022 23:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650411649; x=1681947649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t4emDxanzGVvr52RH7coPRv08JQEzi0lhFYTHZLgntI=;
  b=nSyso1t7uaP98la9NdbvtJm/yObj/iML1Oh0UczuHNrOTVZ5LTaSTtwG
   C8KK1klmFeK35v1gyb5DxIqzX7Ub23KBHFK1irksNXmtaBJ45p65qaQ6j
   COqIGfvSiSJRJ7ULttmqbiHOy2lFYRfBbiojUv4SOIQCOKlr/i7f1rP5J
   FEAvIpJGaKAnv8AYCfLBIWQI2a6fLAI5dnpKDFqYoIntYidIA6QymWQoM
   qokjBULkmfAZxruyt4cmxg4pAmmlWDxc8MU/dugOZY8/OEETazlaDnZC8
   aW+3TfC9sPQdUsbv/o4DTrmFej12JcYzWOGAP4YcxtR19tZeFeOKllpAn
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="326798337"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="326798337"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2022 16:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; 
   d="scan'208";a="647450802"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Apr 2022 16:40:43 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ngxSc-0006Kg-No;
	Tue, 19 Apr 2022 23:40:42 +0000
Date: Wed, 20 Apr 2022 07:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	alim.akhtar@samsung.com, avri.altman@wdc.com, robh+dt@kernel.org,
	krzk+dt@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, jejb@linux.ibm.com,
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v3 4/7] scsi: ufs-renesas: Add support for Renesas R-Car
 UFS controller
Message-ID: <202204200731.hTb71eG4-lkp@intel.com>
References: <20220419120316.209151-5-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419120316.209151-5-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Yoshihiro,

I love your patch! Perhaps something to improve:

[auto build test WARNING on geert-renesas-devel/next]
[also build test WARNING on v5.18-rc3 next-20220419]
[cannot apply to mkp-scsi/for-next jejb-scsi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yoshihiro-Shimoda/treewide-scsi-ufs-Add-support-for-Renesas-R-Car-UFS-controller/20220419-201020
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220420/202204200731.hTb71eG4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c1c49a356162b22554088d269f7689bdb044a9f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3dca0de1a5ecda3be36402f3261cf286ce9dce64
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yoshihiro-Shimoda/treewide-scsi-ufs-Add-support-for-Renesas-R-Car-UFS-controller/20220419-201020
        git checkout 3dca0de1a5ecda3be36402f3261cf286ce9dce64
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/scsi/ufs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/scsi/ufs/ufs-renesas.c:304:15: warning: variable 'val' is uninitialized when used here [-Wuninitialized]
                            p->index, val);
                                      ^~~
   include/linux/printk.h:570:26: note: expanded from macro 'pr_debug'
           dynamic_pr_debug(fmt, ##__VA_ARGS__)
                                   ^~~~~~~~~~~
   include/linux/dynamic_debug.h:163:22: note: expanded from macro 'dynamic_pr_debug'
                              pr_fmt(fmt), ##__VA_ARGS__)
                                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:56: note: expanded from macro '_dynamic_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
                                                                 ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:15: note: expanded from macro '__dynamic_func_call'
                   func(&id, ##__VA_ARGS__);               \
                               ^~~~~~~~~~~
   drivers/scsi/ufs/ufs-renesas.c:285:9: note: initialize the variable 'val' to silence this warning
           u32 val;
                  ^
                   = 0
   1 warning generated.


vim +/val +304 drivers/scsi/ufs/ufs-renesas.c

   279	
   280	static void ufs_renesas_reg_control(struct ufs_hba *hba,
   281					    const struct ufs_renesas_init_param *p)
   282	{
   283		static u32 save[MAX_INDEX];
   284		int ret;
   285		u32 val;
   286	
   287		pr_debug("%s: %d %04x %08x, %08x, %d\n", __func__, p->mode, p->reg,
   288			 p->u.val, p->mask, p->index);
   289	
   290		WARN_ON(p->index >= MAX_INDEX);
   291	
   292		switch (p->mode) {
   293		case MODE_RESTORE:
   294			ufshcd_writel(hba, save[p->index], p->reg);
   295			break;
   296		case MODE_SET:
   297			pr_debug("%s: %d %x %x\n", __func__, p->index, save[p->index],
   298				 p->u.set);
   299			save[p->index] |= p->u.set;
   300			break;
   301		case MODE_SAVE:
   302			save[p->index] = ufshcd_readl(hba, p->reg) & p->mask;
   303			pr_debug("%s: index = %d, val = %08x\n", __func__,
 > 304				 p->index, val);
   305			break;
   306		case MODE_POLL:
   307			ret = readl_poll_timeout_atomic(hba->mmio_base + p->reg,
   308							val,
   309							(val & p->mask) == p->u.expected,
   310							10, 1000);
   311			if (ret)
   312				pr_err("%s: poll failed %d (%08x, %08x, %08x)\n",
   313				       __func__, ret, val, p->mask, p->u.expected);
   314			break;
   315		case MODE_WAIT:
   316			if (p->u.delay_us > 1000)
   317				mdelay(p->u.delay_us / 1000);
   318			else
   319				udelay(p->u.delay_us);
   320			break;
   321		case MODE_WRITE:
   322			ufshcd_writel(hba, p->u.val, p->reg);
   323			break;
   324		default:
   325			break;
   326		}
   327	}
   328	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
