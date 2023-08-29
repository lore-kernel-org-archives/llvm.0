Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C914F174E6;
	Tue, 29 Aug 2023 19:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693337630; x=1724873630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FhRzEy8srJtKAkuWzF8ayY4jQ7U79zGM2IKhPsb40u8=;
  b=JFkbVQcVl37merDP8cShQMCIJ3i6MGIUwSuE603JdA13B9oL/dYWIcmp
   ZV3Lpvs4VhMqGblbVQ35RsKWUxOqb4uAajhajeUA8zUSstwmKcTxeFt3H
   UYE4qwo8GrYL40kzULbbstDYYdkt/aTUCDV6ReCkSQxnHTExVYdHXgyF0
   vR+zt6euIcHd1FB/tAYRIbfdtJAWTr3eh/2wpH5BwuamhK5S98wL5ykkG
   zD+0xiRFRYvNXfRbVyEBx9Ano4Zldo5+K1zA296QEY1Nu09el/s/l/lic
   g7XQy38AjHbd9bBIyDlOWozpHVhzq75/iXUDF/20hgS6cqplmaqKtWtCt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="372873005"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="372873005"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 12:33:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="1069586678"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="1069586678"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 29 Aug 2023 12:33:46 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb4T9-000926-1b;
	Tue, 29 Aug 2023 19:33:43 +0000
Date: Wed, 30 Aug 2023 03:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-super-mtd 51/51] ld.lld: error: undefined
 symbol: sget_dev
Message-ID: <202308300300.vRFhalwF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-super-mtd
head:   a115996e417a9245d3f9974b94f649479ad76f99
commit: c73c565bd77f3823dffaaca4cc2887889a48c4f9 [51/51] mtd: key superblock by device number
config: arm-randconfig-r011-20230830 (https://download.01.org/0day-ci/archive/20230830/202308300300.vRFhalwF-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300300.vRFhalwF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300300.vRFhalwF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: sget_dev
   >>> referenced by mtdsuper.c:33 (drivers/mtd/mtdsuper.c:33)
   >>>               drivers/mtd/mtdsuper.o:(mtd_get_sb) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
