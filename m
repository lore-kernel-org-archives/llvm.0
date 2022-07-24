Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AF14681
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 19:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658692524; x=1690228524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TAIXFpDOQ/CxClmge1r6AUYC/RL/gwXIxitPXhEkqEc=;
  b=LDyUofh6SU29w0orf/+mXf9vFTEgx/Przh7f89B6PF+9I2zk/tArQOes
   3IlOasEbTtdobMV3T73+Lw1DLQlw8lRBzQyfN4uf4qMB9uER81KebiwhH
   O4c8FwG6FPJTvjxErYkFLR6O3QNRUCgxXSjzKFNskAt/KPp3CCJ3ZKFEg
   lTzdo2ALRt65iWzn5h4XJRBi7Ew56sHH/PpbJmVJMYL0YZIQZzSy6VBPY
   Ogloo9Q0pzx76F59rd/MFQyNygPaSiASodhogmv0WzzMu2UNuw9cn8pP3
   8AlPk0pCVh2ed9oOotB1q07pbuX33bHP6SGAagEk16sVQGIxXyhika85e
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="313312849"
X-IronPort-AV: E=Sophos;i="5.93,191,1654585200"; 
   d="scan'208";a="313312849"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2022 12:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,191,1654585200"; 
   d="scan'208";a="627187988"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Jul 2022 12:55:21 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oFhhA-0004DB-1l;
	Sun, 24 Jul 2022 19:55:20 +0000
Date: Mon, 25 Jul 2022 03:54:23 +0800
From: kernel test robot <lkp@intel.com>
To: Enzo Matsumiya <ematsumiya@suse.de>, linux-cifs@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, smfrench@gmail.com,
	pc@cjr.nz, ronniesahlberg@gmail.com, nspmangalore@gmail.com
Subject: Re: [PATCH] cifs: split procfs from debug code
Message-ID: <202207250335.WyICKUV2-lkp@intel.com>
References: <20220724145735.5853-1-ematsumiya@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220724145735.5853-1-ematsumiya@suse.de>

Hi Enzo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on cifs/for-next]
[also build test ERROR on next-20220722]
[cannot apply to linus/master v5.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Enzo-Matsumiya/cifs-split-procfs-from-debug-code/20220724-225846
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
config: hexagon-randconfig-r045-20220724 (https://download.01.org/0day-ci/archive/20220725/202207250335.WyICKUV2-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 12fbd2d377e396ad61bce56d71c98a1eb1bebfa9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a9bbb62b87033fb57943ff221160dbf92e84e297
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Enzo-Matsumiya/cifs-split-procfs-from-debug-code/20220724-225846
        git checkout a9bbb62b87033fb57943ff221160dbf92e84e297
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: cifs_dump_mem
   >>> referenced by cifssmb.c:418 (fs/cifs/cifssmb.c:418)
   >>> cifs/cifssmb.o:(CIFSPOSIXCreate) in archive fs/built-in.a
   >>> referenced by cifssmb.c:418 (fs/cifs/cifssmb.c:418)
   >>> cifs/cifssmb.o:(CIFSPOSIXCreate) in archive fs/built-in.a
   >>> referenced by cifssmb.c:418 (fs/cifs/cifssmb.c:418)
   >>> cifs/cifssmb.o:(CIFSSMBPosixLock) in archive fs/built-in.a
   >>> referenced 43 more times
--
>> ld.lld: error: undefined symbol: cifs_dump_detail
   >>> referenced by smb1ops.c
   >>> cifs/smb1ops.o:(smb1_operations) in archive fs/built-in.a
   pahole: .tmp_vmlinux.btf: No such file or directory
   ld.lld: error: .btf.vmlinux.bin.o: unknown file type

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
