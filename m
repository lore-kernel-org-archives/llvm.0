Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85747B;
	Sat, 11 Mar 2023 17:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678554419; x=1710090419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4EojGgDwl2YPvGMyYgCHjFD0b2gjX/Xoj+/oTAidauE=;
  b=O6Xy1u65TE58L2d9kVUaiiAZLelU2HgGJnW+I/xfHkOBgRkUA+CQDwVA
   rrrDDUEtkK7oCVOPmnPczmwvU2fDwZSMNCqlKtHLhqMRjkgTxGrlPnCxQ
   u2zIwPesEWOW3HjnuHvXTCjsc/lGNzPha3ETG+wnKVfw9VAmKptae64Nr
   EJGevMD/lEc1rAFvcgKQR84xdu+1qQxjFUZ64SmBNSUJ3vXeMa0lrnlOL
   2CHrY/2+cPM74da0IB3WzAHLajj5G0Z4Pkz9232eenX4Xy89MRwNvkxIh
   gJrSl7QCfJI1G5TG70EFZwFGKmi2EHXmKK6zT83riWmseTLFBnFlkK6hO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="399518687"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="399518687"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 09:06:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="655515874"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; 
   d="scan'208";a="655515874"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Mar 2023 09:06:57 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb2gL-0004i1-1E;
	Sat, 11 Mar 2023 17:06:57 +0000
Date: Sun, 12 Mar 2023 01:06:52 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 12/12] module: use aliases to find module on
 find_module_all()
Message-ID: <202303120005.XZm2NRcW-lkp@intel.com>
References: <20230311051712.4095040-13-mcgrof@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311051712.4095040-13-mcgrof@kernel.org>

Hi Luis,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on mcgrof/modules-next]
[also build test ERROR on linus/master v6.3-rc1 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Chamberlain/module-use-goto-errors-on-check_modinfo-and-layout_and_allocate/20230311-131905
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20230311051712.4095040-13-mcgrof%40kernel.org
patch subject: [RFC 12/12] module: use aliases to find module on find_module_all()
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230312/202303120005.XZm2NRcW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d92029475386e6bbbea10a2f56a87d37e61a2b38
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Luis-Chamberlain/module-use-goto-errors-on-check_modinfo-and-layout_and_allocate/20230311-131905
        git checkout d92029475386e6bbbea10a2f56a87d37e61a2b38
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303120005.XZm2NRcW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/module/main.c:351:21: error: no member named 'num_aliases' in 'struct module'
           for (i=0; i < mod->num_aliases; i++) {
                         ~~~  ^
>> kernel/module/main.c:352:16: error: no member named 'aliases' in 'struct module'
                   alias = mod->aliases[i];
                           ~~~  ^
   2 errors generated.


vim +351 kernel/module/main.c

   340	
   341	static bool module_name_match(struct module *mod, const char *name, size_t len)
   342	{
   343		unsigned int i;
   344		const char *alias;
   345	
   346		if (strlen(mod->name) == len && !memcmp(mod->name, name, len))
   347			return true;
   348	
   349		return module_name_match_aliases(mod, name, len);
   350	
 > 351		for (i=0; i < mod->num_aliases; i++) {
 > 352			alias = mod->aliases[i];
   353			if (strlen(alias) == len && !memcmp(alias, name, len)) {
   354				pr_debug("module %s alias matched: alias[%u] = %s\n",
   355					 mod->name, i, alias);
   356				return true;
   357			}
   358		}
   359	
   360		return false;
   361	}
   362	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
