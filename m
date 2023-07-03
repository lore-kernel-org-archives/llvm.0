Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CF211C84;
	Mon,  3 Jul 2023 20:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688416851; x=1719952851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iHYnzPo6oLwZVZO2cfNlOqtzMC1vYelzVuODInNOL3g=;
  b=RZmx8Xmo5iVsug8hhlL1DK80+NEWQ4ycxSOytw4tlkYuKh1E7LkiZ777
   zu8rahu/5GLvYR8z7+z6c40JBhJ7Q2Me77Rboj0Q13Wp3wLk3xP6Cimg5
   eYhKgGwzaq2rzAfaqMCpq9qdjnS+On2SOxbxO+DB19IlWaLORz0ELl1Wy
   ByP3zrhtnBxh1IWQGY70Ge/Vtfu8Kv4e/J9azaZRoUA1HszJBCNykCBmN
   5RHPcLXArjjCMHh6YGLnyK29VEVhGQH4ICyXhDJfXfVrqU8QLFtwDweiT
   StphrDCRywbJIZ+E+7u4wd4zxVUdHjfUFe5RWZybEUpmV3WtdmYJOAaku
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="363003581"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="363003581"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 13:40:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="808700229"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="808700229"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Jul 2023 13:40:23 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGQLO-000HeJ-2H;
	Mon, 03 Jul 2023 20:40:22 +0000
Date: Tue, 4 Jul 2023 04:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-runtime-cleanup 6/6]
 arch/x86/include/asm/uv/bios.h:118:16: error: expected ')'
Message-ID: <202307040405.ZjxQfWw3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-runtime-cleanup
head:   f587ec0ba862176b8f48ab73e66516647db95107
commit: f587ec0ba862176b8f48ab73e66516647db95107 [6/6] efi/x86: Rely on compiler to emit MS ABI calls
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230704/202307040405.ZjxQfWw3-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040405.ZjxQfWw3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307040405.ZjxQfWw3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/platform/x86/uv_sysfs.c:14:
>> arch/x86/include/asm/uv/bios.h:118:16: error: expected ')'
           u64 (__efiapi *function)(enum uv_bios_cmd, ...);
                         ^
   arch/x86/include/asm/uv/bios.h:118:6: note: to match this '('
           u64 (__efiapi *function)(enum uv_bios_cmd, ...);
               ^
>> arch/x86/include/asm/uv/bios.h:118:7: error: field '__efiapi' declared as a function
           u64 (__efiapi *function)(enum uv_bios_cmd, ...);
                ^
   2 errors generated.


vim +118 arch/x86/include/asm/uv/bios.h

   110	
   111	/*
   112	 * The UV system table describes specific firmware
   113	 * capabilities available to the Linux kernel at runtime.
   114	 */
   115	struct uv_systab {
   116		char signature[4];	/* must be UV_SYSTAB_SIG */
   117		u32 revision;		/* distinguish different firmware revs */
 > 118		u64 (__efiapi *function)(enum uv_bios_cmd, ...);
   119					/* BIOS runtime callback function ptr */
   120		u32 size;		/* systab size (starting with _VERSION_UV4) */
   121		struct {
   122			u32 type:8;	/* type of entry */
   123			u32 offset:24;	/* byte offset from struct start to entry */
   124		} entry[1];		/* additional entries follow */
   125	};
   126	extern struct uv_systab *uv_systab;
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
