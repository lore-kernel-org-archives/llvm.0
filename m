Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9135ED9;
	Tue,  4 Jul 2023 07:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688454824; x=1719990824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wGvgCLgL0q5WNPmwsWiv1l+OZfTQdHb1jN4eEDBhx+A=;
  b=aViCJdYbUTyK4fnibgUUQhGvxEMQcPo1gk5sX8r3sDAbUs+HeJ2VSagt
   1dDlzGqXuC+24GqUSnYNG+Trm+TCVYkm7906q7Ekan6a7tIaRM0RL6l7k
   xyqM+WQOZfu4fYieoHodGpLxwdjBPy24216cZC8WEs4HcqkgwGCAFhLZL
   fcim3uIYTcopONZJYLVSvFBkwNqRGhIi5XfMHW3LNszZkR3em4PyW6wqR
   U1xGyv96H8T8yN+ljPVy3vdY8p2ZfycZuvBiBbgOcVgx2Hp9pDf29TV3O
   2NzY1XsTWbSKRSlq8aNTulisgNFMyPCeDuohRnwzES/w+unZEoIlFgIIj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="347845189"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="347845189"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 00:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="718814872"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="718814872"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Jul 2023 00:13:41 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGaEG-000I43-2H;
	Tue, 04 Jul 2023 07:13:40 +0000
Date: Tue, 4 Jul 2023 15:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 12987/13166] ld.lld: error: undefined symbol:
 machine_kexec_cleanup
Message-ID: <202307041537.G8Z4pB7K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1c6f93977947dbba1fc4d250c4eb8a7d4cfdecf1
commit: 0fd6d7a6e290d94f18134302d49162c22dff01c9 [12987/13166] mips/kexec: refactor for kernel/Kconfig.kexec
config: mips-randconfig-r002-20230703 (https://download.01.org/0day-ci/archive/20230704/202307041537.G8Z4pB7K-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041537.G8Z4pB7K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307041537.G8Z4pB7K-lkp@intel.com/

Note: the linux-next/master HEAD 1c6f93977947dbba1fc4d250c4eb8a7d4cfdecf1 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: machine_kexec_cleanup
   >>> referenced by kexec_core.c
   >>>               kernel/kexec_core.o:(kimage_free) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: machine_crash_shutdown
   >>> referenced by kexec_core.c
   >>>               kernel/kexec_core.o:(__crash_kexec) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: machine_kexec
   >>> referenced by kexec_core.c
   >>>               kernel/kexec_core.o:(__crash_kexec) in archive vmlinux.a
   >>> referenced by kexec_core.c
   >>>               kernel/kexec_core.o:(kernel_kexec) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: machine_shutdown
   >>> referenced by kexec_core.c
   >>>               kernel/kexec_core.o:(kernel_kexec) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
