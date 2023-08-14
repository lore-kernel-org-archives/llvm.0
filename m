Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7512AC154;
	Mon, 14 Aug 2023 15:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692025414; x=1723561414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GOOwHi58Za3Qnx1mdynlL6d9Wq2lnOCiAh7PS8Adcn8=;
  b=n1ZIO0gCwNbzfLjdg/Qcx7g4OkoXn2/tV4Wu0csBI/98Qqk9ZVQYQ4IH
   Lmfoc+tJ+6bhgGheAyYE7h5/z6rmrzLlQrj8hC8b/TUIuUCid/tvtsyZs
   HUGNU8qm+zR6nTpEB+R8uZctdhGUMETCEeDIZJpC+AVmS/ykzHEwxrAoF
   7I3zYpPqvRVOYMPmVEKLZ1yfpN2Ksp/w04IbdGZcL91heHh+8a8XqgEGH
   +WHSLfiT+6jCb1AOrdZ9QKaw1c93YyTdkXKxlH8s5bhZ+IGadyCySD0BA
   Mtgn5dR6ZD/w9nVFoTZG4BZ7K6BjxctRPXhXrFQTuQwKULb6nkE+s2HEO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="362207538"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="362207538"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 08:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="733476993"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="733476993"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Aug 2023 08:02:11 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVZ58-0000Cq-38;
	Mon, 14 Aug 2023 15:02:10 +0000
Date: Mon, 14 Aug 2023 23:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jorge Lopez <jorge.lopez2@hp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 8420/9999]
 drivers/platform/x86/hp/hp-wmi.c:342:24: warning: cast to smaller integer
 type 'enum hp_wmi_radio' from 'void *'
Message-ID: <202308142203.dEXrEfaZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jorge,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   24c4de4069cbce796a1c71166240807d617cd652
commit: a832a43fdd95bc689bc23862326a114579aa025b [8420/9999] platform/x86: Move existing HP drivers to a new hp subdir
config: x86_64-randconfig-r011-20230814 (https://download.01.org/0day-ci/archive/20230814/202308142203.dEXrEfaZ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308142203.dEXrEfaZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308142203.dEXrEfaZ-lkp@intel.com/

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
