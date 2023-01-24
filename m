Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CADA7C;
	Tue, 24 Jan 2023 12:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674563878; x=1706099878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ys6ZTiuZc3TQfAm/bovh0arpnaK7vEGkCfU/nOEmIIY=;
  b=Xw2wGtqpz/H1aXezbinEga+AagK0vfPhoGY10NA68ev/HEcJ4ghjjH/8
   kFN0bxcSqnim4GN+S+01lAxJgLydeDvbYtuQIbUg+jmKZ2GeQ7IaXT5+6
   6dJlJNGEL0+8iIFUF2QvE68oH/ugz99e+/4gyzMqR/UGgbC7wS7s4s1Rd
   Tfw/8lI3mECuavLQnKiBKqlAwpJApgFqQXdrXYZPKanJP5jmiECdNZFoF
   M036ERTa7MLylzgSw6VcdKt87BNfGQ+pZEQA7yt/3KtooQe8v3q23M/df
   sb65ELZoWLlEW6/bJx55oWgquQ8Nt++c9Q6XK1RKvSpwWf3LYopgNaFIt
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="390787788"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="390787788"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 04:37:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="804584261"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="804584261"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2023 04:37:56 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKIYl-0006Si-0e;
	Tue, 24 Jan 2023 12:37:55 +0000
Date: Tue, 24 Jan 2023 20:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: Babu Moger <babu.moger@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Reinette Chatre <reinette.chatre@intel.com>
Subject: [tip:x86/cache 9/13] arch/x86/kernel/cpu/resctrl/rdtgroup.c:1456:6:
 warning: variable 'h' set but not used
Message-ID: <202301242015.kbzkVteJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/cache
head:   0a363fb23ee2f7beb08437ad7db86d195878d79f
commit: dc2a3e857981f859889933cf66ded117d74edff1 [9/13] x86/resctrl: Add interface to read mbm_total_bytes_config
config: x86_64-randconfig-a013-20230123 (https://download.01.org/0day-ci/archive/20230124/202301242015.kbzkVteJ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=dc2a3e857981f859889933cf66ded117d74edff1
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip x86/cache
        git checkout dc2a3e857981f859889933cf66ded117d74edff1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/cpu/resctrl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:1456:6: warning: variable 'h' set but not used [-Wunused-but-set-variable]
           u32 h;
               ^
   1 warning generated.


vim +/h +1456 arch/x86/kernel/cpu/resctrl/rdtgroup.c

  1451	
  1452	static void mon_event_config_read(void *info)
  1453	{
  1454		struct mon_config_info *mon_info = info;
  1455		unsigned int index;
> 1456		u32 h;
  1457	
  1458		index = mon_event_config_index_get(mon_info->evtid);
  1459		if (index == INVALID_CONFIG_INDEX) {
  1460			pr_warn_once("Invalid event id %d\n", mon_info->evtid);
  1461			return;
  1462		}
  1463		rdmsr(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config, h);
  1464	
  1465		/* Report only the valid event configuration bits */
  1466		mon_info->mon_config &= MAX_EVT_CONFIG_BITS;
  1467	}
  1468	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
