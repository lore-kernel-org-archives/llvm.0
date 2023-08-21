Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D111171A;
	Mon, 21 Aug 2023 20:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692648471; x=1724184471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cfeNTR28TFv7XNm5wRNHtTOjkdfI98GGGw816HRnS2o=;
  b=G9OMP9WIv6YuTSIckBGxeLt7cB2tYGVvvq57zZkcxU7DlCcrMsSIdwPk
   YRkJVYIVSCIlqamLjBn996gVzJV49bWy5e3sKUqoo4aHSQZSsql+Igyue
   i0TsIsfOTEKbmZDh20/mjVI924jauTZYye9a7MBucq5KKajbPM3P3Cxh6
   pPX4HsWmya6DNNnFXplSjrbKl+4JdvKcajLsQ1Nwjd4G+1MafnbIMKqFp
   1u90b6P7Gi9QMxt22g0yfQg9OtDag5crwVM/BlncmbiVwCSFjRUsFxUNP
   5QvN4s7oGRGHvxwVOhf4SKZVMIInaG27UcyBwZ2x2P5Es8JWvj2ssVKUS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="440063771"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="440063771"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 13:07:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="909827533"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="909827533"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Aug 2023 13:07:49 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYBBk-0000sK-16;
	Mon, 21 Aug 2023 20:07:48 +0000
Date: Tue, 22 Aug 2023 04:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jakob Hauser <jahau@rocketmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>
Subject: [linux-next:master 10698/11453] ld.lld: error: undefined symbol:
 extcon_find_edev_by_node
Message-ID: <202308220324.LsI8q3ML-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
commit: 12cc585f36b8dffa68b809c2d23a9bd73ee6ffd2 [10698/11453] power: supply: rt5033_charger: Add cable detection and USB OTG supply
config: x86_64-randconfig-076-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220324.LsI8q3ML-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220324.LsI8q3ML-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220324.LsI8q3ML-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: extcon_find_edev_by_node
   >>> referenced by rt5033_charger.c:696 (drivers/power/supply/rt5033_charger.c:696)
   >>>               vmlinux.o:(rt5033_charger_probe)
--
>> ld.lld: error: undefined symbol: devm_extcon_register_notifier_all
   >>> referenced by rt5033_charger.c:710 (drivers/power/supply/rt5033_charger.c:710)
   >>>               vmlinux.o:(rt5033_charger_probe)
--
>> ld.lld: error: undefined symbol: extcon_get_state
   >>> referenced by rt5033_charger.c:578 (drivers/power/supply/rt5033_charger.c:578)
   >>>               vmlinux.o:(rt5033_charger_extcon_work)
   >>> referenced by rt5033_charger.c:578 (drivers/power/supply/rt5033_charger.c:578)
   >>>               vmlinux.o:(rt5033_charger_extcon_work)
   >>> referenced by rt5033_charger.c:578 (drivers/power/supply/rt5033_charger.c:578)
   >>>               vmlinux.o:(rt5033_charger_extcon_work)
   >>> referenced 8 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
