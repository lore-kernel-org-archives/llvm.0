Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DEB2018C;
	Tue, 22 Aug 2023 21:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692738729; x=1724274729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h47jyvY9KIJODj8/IDB8R3btLRf5d4FwKHGpYaDEhg0=;
  b=OA8Pjy2UgLvKQwB2KrOP7MVl4kA3d8Po0VsyaIRh11YPtb14omVV+AzT
   seR+r2vIPPOL2ysYgv+KA/McdNEebmdzwcETdSI95gKqIGhexqDJX0rEt
   bNf+5BnjFElZqwAXApyOsIz7EpUZUVGVgrDyUpalW96Ew9wyJZcj3H1Ve
   8MkzZMytsGwOd9lRrlOqNNNZtFCZ41xukHMm5IU4WqqjQ8mlL1a1CEECP
   NemzmO3WUBkKPCF5AbzZ0jbsy/bh2CxZXzWOZARV4prZ4NdmMVlVThBee
   c8Iy/I5Dv1wc85ZadCesjLpKPr2bHVZAGFgYGDwxdpt1zIYP+O5dGJOLC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404996607"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="404996607"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 14:12:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="736380540"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="736380540"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 22 Aug 2023 14:12:06 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYYfP-0000Wu-36;
	Tue, 22 Aug 2023 21:12:02 +0000
Date: Wed, 23 Aug 2023 05:11:13 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
Subject: /usr/bin/ld: init/main.o: warning: relocation in read-only section
 `.init.text'
Message-ID: <202308230538.sIoFzSnM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f7757129e3dea336c407551c98f50057c22bb266
commit: 8c6174503c7b7134c22072b45f92724c8a959f06 um: hostfs: define our own API boundary
date:   4 months ago
config: um-randconfig-r036-20230822 (https://download.01.org/0day-ci/archive/20230823/202308230538.sIoFzSnM-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230538.sIoFzSnM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230538.sIoFzSnM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> /usr/bin/ld: init/main.o: warning: relocation in read-only section `.init.text'
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: warning: creating DT_TEXTREL in a PIE
>> /usr/bin/ld: init/main.o: warning: relocation in read-only section `.init.text'
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms2 has a LOAD segment with RWX permissions
   /usr/bin/ld: warning: creating DT_TEXTREL in a PIE
>> /usr/bin/ld: init/main.o: warning: relocation in read-only section `.init.text'
   /usr/bin/ld: warning: vmlinux has a LOAD segment with RWX permissions
   /usr/bin/ld: warning: creating DT_TEXTREL in a PIE

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
