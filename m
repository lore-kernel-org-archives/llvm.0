Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D3F12B9D;
	Tue, 30 May 2023 06:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685428275; x=1716964275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mEtClSVGzM1+Fb02shHWf0DS6zvgcQR4oFbfk7BZ0uk=;
  b=IUULBPnM59E/jhI/+QhACAAJzM2aT/rHEzEEu+WxdCNuafzTVfq/IOFe
   OQeqWG0UrpMOuMl5jsrldiKY+ejgcGjO7WX+aRXdHhIFMMA0jh8CP1QiS
   HdaYPRUT1Wj4tIxDpVX2GEJQZ9VW5Xd0H1+gV0fhEFZTdTXgyxQuesrP4
   KMSPhdQbd6tTbJNePdN/c5LNaSAEao7J09GFwr8tWmtxIbkGGD/aMyBnf
   +M7SACrZ+gF090TJLLX7nekKGQRq12PZsh/Etm5cWIIgztPgEOD7uYQ21
   fto+IRKulsIiCNFZprVMUMds3i4rZBGPfzkABC99knwfMOs6Sm3blMYE+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="334450916"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="334450916"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 23:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="706294857"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="706294857"
Received: from lkp-server01.sh.intel.com (HELO fd90924b3b99) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 May 2023 23:31:10 -0700
Received: from kbuild by fd90924b3b99 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3ssx-0000Ak-0P;
	Tue, 30 May 2023 06:31:11 +0000
Date: Tue, 30 May 2023 14:30:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jorge Lopez <jorge.lopez2@hp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-rolling-lts 3595/3741]
 drivers/platform/x86/hp/hp-wmi.c:554:24: warning: cast to smaller integer
 type 'enum hp_wmi_radio' from 'void *'
Message-ID: <202305301415.Yf5GHUrC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-rolling-lts
head:   aa17ef53676edbc7f175ea14fe2b68a9ad013130
commit: 1189b7f4954084a5cfb10ab48f4e41fc9c37b516 [3595/3741] platform/x86: Move existing HP drivers to a new hp subdir
config: x86_64-randconfig-x073-20230530 (https://download.01.org/0day-ci/archive/20230530/202305301415.Yf5GHUrC-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=1189b7f4954084a5cfb10ab48f4e41fc9c37b516
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-rolling-lts
        git checkout 1189b7f4954084a5cfb10ab48f4e41fc9c37b516
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/hp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305301415.Yf5GHUrC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/hp/hp-wmi.c:554:24: warning: cast to smaller integer type 'enum hp_wmi_radio' from 'void *' [-Wvoid-pointer-to-enum-cast]
           enum hp_wmi_radio r = (enum hp_wmi_radio) data;
                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +554 drivers/platform/x86/hp/hp-wmi.c

f82bdd0d77b6bf drivers/platform/x86/hp-wmi.c Kyle Evans           2014-06-09  551  
19d337dff95cbf drivers/platform/x86/hp-wmi.c Johannes Berg        2009-06-02  552  static int hp_wmi_set_block(void *data, bool blocked)
62ec30d45ecbb8 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25  553  {
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21 @554  	enum hp_wmi_radio r = (enum hp_wmi_radio) data;
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21  555  	int query = BIT(r + 8) | ((!blocked) << r);
6d96e00cef3503 drivers/platform/x86/hp-wmi.c Thomas Renninger     2010-05-21  556  	int ret;
62ec30d45ecbb8 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25  557  
d8193cff33906e drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-19  558) 	ret = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_WRITE,
c3021ea1beeeb1 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  559  				   &query, sizeof(query), 0);
527376c89caf59 drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-19  560) 
527376c89caf59 drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-19  561) 	return ret <= 0 ? ret : -EINVAL;
62ec30d45ecbb8 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25  562  }
62ec30d45ecbb8 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25  563  

:::::: The code at line 554 was first introduced by commit
:::::: e5fbba85a7acc2626d4fe14501816811d702f3e9 hp-wmi: improve rfkill support

:::::: TO: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
:::::: CC: Len Brown <len.brown@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
