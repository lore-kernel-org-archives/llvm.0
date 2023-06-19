Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBFA210F;
	Mon, 19 Jun 2023 06:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687157299; x=1718693299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qnB+fhSTQqlAc/3k74Aph0kpFjm4zt6dTZBGvj5YK7g=;
  b=X3w3FBvoAF/RFIs84dMrl/AmzDvj+Dh7EKExh+SpEzR3hvqhvoWa5UE0
   yV03TyteV3Z5cEjZDlmVbCs6c6ApMT5WpV+JqUSOquMQq6qqN4vvz/vJv
   5cYNvvuCNJSGBQziWKuY8s6kr6ZNGfYqdYb7PVUGlMb5x22vIvOm5PYYj
   +5xrIpKsmxCAjq97lG67B1SaATXwtKcSF5h/KaQq895PLjMMUy+VPYt0S
   F+tOFQJflnGW1r9ZTfOSjqBtuRrFPEpRyYNvF+gpyjZIgrIO6tPT9Ux/2
   yxgKYpspZx286CKSwBVAz1m5jVEIzdJodjWYZr4mY3SgSHDyAu84xQfTU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="339893668"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="339893668"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 23:48:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="707782940"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="707782940"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Jun 2023 23:48:15 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qB8gR-0004Tc-0O;
	Mon, 19 Jun 2023 06:48:15 +0000
Date: Mon, 19 Jun 2023 14:47:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jorge Lopez <jorge.lopez2@hp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 9543/9999]
 drivers/platform/x86/hp/hp-wmi.c:342:24: warning: cast to smaller integer
 type 'enum hp_wmi_radio' from 'void *'
Message-ID: <202306191433.5E0eMmdo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   471e639e59d128f4bf58000a118b2ceca3893f98
commit: a832a43fdd95bc689bc23862326a114579aa025b [9543/9999] platform/x86: Move existing HP drivers to a new hp subdir
config: x86_64-randconfig-r015-20230619 (https://download.01.org/0day-ci/archive/20230619/202306191433.5E0eMmdo-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306191433.5E0eMmdo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306191433.5E0eMmdo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/hp/hp-wmi.c:342:24: warning: cast to smaller integer type 'enum hp_wmi_radio' from 'void *' [-Wvoid-pointer-to-enum-cast]
           enum hp_wmi_radio r = (enum hp_wmi_radio) data;
                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +342 drivers/platform/x86/hp/hp-wmi.c

f82bdd0d77b6bf drivers/platform/x86/hp-wmi.c Kyle Evans           2014-06-09  339  
19d337dff95cbf drivers/platform/x86/hp-wmi.c Johannes Berg        2009-06-02  340  static int hp_wmi_set_block(void *data, bool blocked)
62ec30d45ecbb8 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25  341  {
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21 @342  	enum hp_wmi_radio r = (enum hp_wmi_radio) data;
e5fbba85a7acc2 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21  343  	int query = BIT(r + 8) | ((!blocked) << r);
6d96e00cef3503 drivers/platform/x86/hp-wmi.c Thomas Renninger     2010-05-21  344  	int ret;
62ec30d45ecbb8 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25  345  
d8193cff33906e drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-19  346) 	ret = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_WRITE,
c3021ea1beeeb1 drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  347  				   &query, sizeof(query), 0);
527376c89caf59 drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-19  348) 
527376c89caf59 drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-19  349) 	return ret <= 0 ? ret : -EINVAL;
62ec30d45ecbb8 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25  350  }
62ec30d45ecbb8 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25  351  

:::::: The code at line 342 was first introduced by commit
:::::: e5fbba85a7acc2626d4fe14501816811d702f3e9 hp-wmi: improve rfkill support

:::::: TO: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
:::::: CC: Len Brown <len.brown@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
