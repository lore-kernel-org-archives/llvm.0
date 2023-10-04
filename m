Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E7518E16;
	Wed,  4 Oct 2023 15:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696432078; x=1727968078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l5H26bAxT5Z9FuNL/Ykcqi8Wgw4NFLEkGqbaN0gFGBo=;
  b=OycHfe8WL7Jm97lk9FBX92yX/zDmpdk4H/mY2LRd/UdCtS/+LJOZzAyd
   K4sLicSIwW1XRw88FqpeOdf63exdbMge5odXCekGolWmwsdE04GJU+vsq
   V8Lia/QcTaOxw4qOvlDpFmm5zd3NM5fvWcZJSro4v3s/NCjTlcj2fcvwf
   Zb9pI8ukBJVRmrjb6hLSLFb1OI18fdMrXRZRlFUfbX/75PfW9LbyywLh1
   auOA4122KUOKlSvdlQQjWdTXEQH0+0jNu4sPuderEUXnMjcT8yGw78QeB
   rIYElohfEsTVvzsdvnlFUmk4KV5fsv0xF+lY0IXeMwakzp4UFsOEM397X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="362548441"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="362548441"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 08:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="998495249"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="998495249"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 04 Oct 2023 08:05:17 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo3R4-000KKC-2w;
	Wed, 04 Oct 2023 15:05:14 +0000
Date: Wed, 4 Oct 2023 23:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [linux-next:master 4144/9570] /bin/bash: line 1: 83326 Segmentation
 fault      LLVM_OBJCOPY="llvm-objcopy" pahole -J --btf_gen_floats -j
 --lang_exclude=rust --skip_encoding_btf_inconsistent_proto
 --btf_gen_optimized --btf_base vmlinux
 drivers/power/supply/bq256xx_charger.ko
Message-ID: <202310042342.Bv7kezcd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33b64befb1a28bca3f5a9ed9807d2f87e976c63a
commit: f28992902b17245af042913d6cfd6a1cc100bcaf [4144/9570] power: supply: bq256xx: Use i2c_get_match_data()
config: hexagon-randconfig-r003-20221116 (https://download.01.org/0day-ci/archive/20231004/202310042342.Bv7kezcd-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310042342.Bv7kezcd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310042342.Bv7kezcd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: 83326 Segmentation fault      LLVM_OBJCOPY="llvm-objcopy" pahole -J --btf_gen_floats -j --lang_exclude=rust --skip_encoding_btf_inconsistent_proto --btf_gen_optimized --btf_base vmlinux drivers/power/supply/bq256xx_charger.ko

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
