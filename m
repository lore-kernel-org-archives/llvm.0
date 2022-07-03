Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90FA23A4
	for <llvm@lists.linux.dev>; Sun,  3 Jul 2022 10:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656845625; x=1688381625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y/Vt3d7l5Ij3MoJHbWc5HYIuGyzHq0belxXhsMztFoo=;
  b=cgN0fefRThh+HjhoMWr7H7RlJjESzIwN9yRXiqvCLCnfWbCu5p7wLDs8
   ClXWMEEfvyabydLxSA5Stn4mSYf4AlDvrU213cUvF9MMSTN621w1PqCXE
   Pr6ky9Nfvx3nwZw4oZjAADaCfui5KgeYMwaGpSAUo3rdgZQg9pJConfnF
   FpmcncZFqSVi/bOyNdpZQnXNpHEBpr9WpeAyyoCxjqm95wrWF/YkYmoFA
   a9JIKbrZlwAH4RzgeqhFUWx6eECCp9NQhgpR9jeEykZO77B5WQ3bIwm98
   jWohkps6aybgSOPRPZe2jmnJccreTjoLpnYJ1mbdf5RFfU8wowynbnzAR
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10396"; a="308465460"
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; 
   d="scan'208";a="308465460"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2022 03:53:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; 
   d="scan'208";a="734527743"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2022 03:53:44 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o7xEV-000GMf-G2;
	Sun, 03 Jul 2022 10:53:43 +0000
Date: Sun, 3 Jul 2022 18:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jianmin Lv <lvjianmin@loongson.cn>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH V14 07/15] irqchip/loongson-pch-pic: Add ACPI init support
Message-ID: <202207031820.EptpeQ5R-lkp@intel.com>
References: <1656837932-18257-8-git-send-email-lvjianmin@loongson.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1656837932-18257-8-git-send-email-lvjianmin@loongson.cn>

Hi Jianmin,

I love your patch! Yet something to improve:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on rafael-pm/linux-next linus/master v5.19-rc4 next-20220701]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianmin-Lv/irqchip-Add-LoongArch-related-irqchip-drivers/20220703-164922
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git ac165aab469895de059a4a191a2e04ddb5421d0e
config: hexagon-buildonly-randconfig-r005-20220703 (https://download.01.org/0day-ci/archive/20220703/202207031820.EptpeQ5R-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5d787689b14574fe58ba9798563f4a6df6059fbf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3889e0bcc694bb0465b7cf65e2a722f3f74dd0b2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jianmin-Lv/irqchip-Add-LoongArch-related-irqchip-drivers/20220703-164922
        git checkout 3889e0bcc694bb0465b7cf65e2a722f3f74dd0b2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-loongson-pch-pic.c:47:37: error: use of undeclared identifier 'MAX_IO_PICS'
   static struct pch_pic *pch_pic_priv[MAX_IO_PICS];
                                       ^
   drivers/irqchip/irq-loongson-pch-pic.c:49:38: error: use of undeclared identifier 'MAX_IO_PICS'
   struct fwnode_handle *pch_pic_handle[MAX_IO_PICS];
                                        ^
   drivers/irqchip/irq-loongson-pch-pic.c:56:18: error: use of undeclared identifier 'MAX_IO_PICS'
           for (i = 0; i < MAX_IO_PICS; i++) {
                           ^
>> drivers/irqchip/irq-loongson-pch-pic.c:51:5: warning: no previous prototype for function 'find_pch_pic' [-Wmissing-prototypes]
   int find_pch_pic(u32 gsi)
       ^
   drivers/irqchip/irq-loongson-pch-pic.c:51:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int find_pch_pic(u32 gsi)
   ^
   static 
>> drivers/irqchip/irq-loongson-pch-pic.c:266:22: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           priv->vec_count = ((readq(priv->base) >> 48) & 0xff) + 1;
                               ^
>> drivers/irqchip/irq-loongson-pch-pic.c:266:40: warning: shift count >= width of type [-Wshift-count-overflow]
           priv->vec_count = ((readq(priv->base) >> 48) & 0xff) + 1;
                                                 ^  ~~
   2 warnings and 4 errors generated.


vim +/MAX_IO_PICS +47 drivers/irqchip/irq-loongson-pch-pic.c

    46	
  > 47	static struct pch_pic *pch_pic_priv[MAX_IO_PICS];
    48	
    49	struct fwnode_handle *pch_pic_handle[MAX_IO_PICS];
    50	
  > 51	int find_pch_pic(u32 gsi)
    52	{
    53		int i;
    54	
    55		/* Find the PCH_PIC that manages this GSI. */
    56		for (i = 0; i < MAX_IO_PICS; i++) {
    57			struct pch_pic *priv = pch_pic_priv[i];
    58	
    59			if (!priv)
    60				return -1;
    61	
    62			if (gsi >= priv->gsi_base && gsi < (priv->gsi_base + priv->vec_count))
    63				return i;
    64		}
    65	
    66		pr_err("ERROR: Unable to locate PCH_PIC for GSI %d\n", gsi);
    67		return -1;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
