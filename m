Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F6F1427E;
	Mon, 19 Jun 2023 19:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687204023; x=1718740023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y6uCnDi6s8xKpkxLjIo0Do9Gpa+PeBZT/7pbRYY49Os=;
  b=O/E2oY+xGMP5n3GfqebFEpYMDimtX1lsOWJyelAPfdXpJltSVtUUkkT7
   Wfa4V3SpJl8ua36rp/k4MgDB87b66aGmiwMYIDWhGsJHE6jUBNkaL4mJT
   vNQDHS28zq/0YnyV5ikyxdk6ICoya/ZClaT5A4Ebd3JLXjyAgPZoV3+pZ
   CSFycRIwczq+8f2o6rzpswNsrIAwOqip1wuynZWiq3wf4Nh2x4mGmlnop
   vEV23F/yIz9o7ikHs/G1eHhrE77VTsaZxMFZ3/P55pQfTHsyIgV6uIfkd
   FYRm3Ub21+faTvkUCBW3YELwGhhDOiW1UFJw1U6R/zmxI1YOJrjC+lQfa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="423369235"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="423369235"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 12:47:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="1043988363"
X-IronPort-AV: E=Sophos;i="6.00,255,1681196400"; 
   d="scan'208";a="1043988363"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jun 2023 12:47:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBKq4-00054W-2A;
	Mon, 19 Jun 2023 19:47:00 +0000
Date: Tue, 20 Jun 2023 03:46:04 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10783/10788] /bin/bash: line 1: 137480
 Segmentation fault      LLVM_OBJCOPY="llvm-objcopy" pahole -J
 --btf_gen_floats -j --lang_exclude=rust
 --skip_encoding_btf_inconsistent_proto --btf_gen_optimized --btf_base
 vmlinux drivers/iio/adc/max1363.ko
Message-ID: <202306200328.NX4JlBDv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47045630bc409ce6606d97b790895210dd1d517d
commit: 55ec9fb02a9a37ba830b14379197a3cd1f7120a3 [10783/10788] Merge branch 'sysctl-next' of git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
config: hexagon-randconfig-r011-20230619 (https://download.01.org/0day-ci/archive/20230620/202306200328.NX4JlBDv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306200328.NX4JlBDv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306200328.NX4JlBDv-lkp@intel.com/

All errors (new ones prefixed by >>):

   die__process_class: tag not supported 0x21 (subrange_type)!
   die__process: got compile_unit unexpected tag after DW_TAG_compile_unit!
>> /bin/bash: line 1: 137480 Segmentation fault      LLVM_OBJCOPY="llvm-objcopy" pahole -J --btf_gen_floats -j --lang_exclude=rust --skip_encoding_btf_inconsistent_proto --btf_gen_optimized --btf_base vmlinux drivers/iio/adc/max1363.ko

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
