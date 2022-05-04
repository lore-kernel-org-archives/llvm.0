Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE002CA2
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 18:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651689983; x=1683225983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jyTQEwbjfvLLpw1wwfSdTxxby/fqapPziDJyt1C+xZk=;
  b=CDDMApwftIebYUYqsH6Nre19NpWI/mtsJC8nOGHNrqtzwiy7f8+VP1gJ
   dYdFFfNexhAn8tnQ/aCcZt9+ERNX/6K9yy1ue34fn7gs2+eX/LwJH/t+j
   1vUVGOe0JIqNZ18wcOpWcyTAwZ+kvTAw+op+qbs9M9+AE0uVgzprvzs0B
   oiZ11noofOreVoYY3llI4flQ/hTw+8dFQQWIRA44XpczrzfdtUQ6ZSY2K
   WIgugNEZVXUzQTENj8nHKyPCHnLRw7FumSQDvqmgX+nTgixiytEi+FEHd
   6OklLK2JGAvgua4knjnJ9j7i5Pc2ebdDxXzsqW7Spfog8UDyjtvVziexF
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="354301527"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; 
   d="scan'208";a="354301527"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 11:46:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; 
   d="scan'208";a="548978916"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 May 2022 11:46:20 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmK0y-000Bhn-3q;
	Wed, 04 May 2022 18:46:20 +0000
Date: Thu, 5 May 2022 02:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [masahiroy:lto-cleanup-wip 53/61] scripts/mod/modpost.c:2311:33:
 error: no member named 'is_gpl' in 'struct symbol'
Message-ID: <202205050233.D3ojJLR9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git lto-cleanup-wip
head:   63a6c25309d336a3bc7185d4fa17fc9e64485d95
commit: 14beda2dc5aff83f69fd5ecf83309250c5c03d79 [53/61] kbuild: embed symbol versions at final link of vmlinux or modules
config: hexagon-randconfig-r041-20220501 (https://download.01.org/0day-ci/archive/20220505/202205050233.D3ojJLR9-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?id=14beda2dc5aff83f69fd5ecf83309250c5c03d79
        git remote add masahiroy https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
        git fetch --no-tags masahiroy lto-cleanup-wip
        git checkout 14beda2dc5aff83f69fd5ecf83309250c5c03d79
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> scripts/mod/modpost.c:2311:33: error: no member named 'is_gpl' in 'struct symbol'
                              sym->name, sym->crc, sym->is_gpl ? "_gpl" : "");
                                                   ~~~  ^
   1 error generated.
   make[2]: *** [scripts/Makefile.host:112: scripts/mod/modpost.o] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1194: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +2311 scripts/mod/modpost.c

  2287	
  2288	/* Record CRCs for exported symbols */
  2289	static void add_exported_symversions(struct buffer *buf, struct module *mod)
  2290	{
  2291		struct symbol *sym;
  2292	
  2293		if (!modversions)
  2294			return;
  2295	
  2296		buf_printf(buf,
  2297			   "\n"
  2298			   "#include <linux/symversion.h>\n"
  2299			   "\n");
  2300	
  2301		list_for_each_entry(sym, &mod->exported_symbols, list) {
  2302			if (!sym->crc_valid) {
  2303				warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n"
  2304				     "Is \"%s\" prototyped in <asm/asm-prototypes.h>?\n",
  2305				     sym->name, mod->name, mod->is_vmlinux ? "" : ".ko",
  2306				     sym->name);
  2307				continue;
  2308			}
  2309	
  2310			buf_printf(buf, "SYMBOL_CRC(%s, 0x%08x, \"%s\");\n",
> 2311				   sym->name, sym->crc, sym->is_gpl ? "_gpl" : "");
  2312		}
  2313	}
  2314	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
