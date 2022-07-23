Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0387E
	for <llvm@lists.linux.dev>; Sat, 23 Jul 2022 00:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658537641; x=1690073641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6HObmke7qbQlG2tmhlmrsc1HGXyA4mOB0pDb52JNZtw=;
  b=H/7BHVRU6Igmv1OSqS7+vgDDeJ341tzmzjGuVnGvDL3UhtiIIJGoxdMM
   8MhZE3urAZ2ZLc5cI3luWjdH+7vGm/wrffKxjBDMLK2/h2wnWfWqO2TMT
   TaRehbtqnHBDVotlltx+SatA91237JLxnhd2xBXt10t0a+pSFRRoUwoIz
   G5CGV/efhtpkxtWXzlhHVJpVukRBxKKPUiF4lEux4UJ0Q21I/hEdC2QRW
   rDmv/LphSWpiQS/7RuUj4Wjb5LQFcDnNwKHzOYg/PaUJ+Cu9gn+oEaIdu
   tEFozLm2/7gjY21aT0nHmtYPL+vvkCA0KXG/5yCHuYnCrYSafuJprmUJ1
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10416"; a="349131284"
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; 
   d="scan'208";a="349131284"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2022 17:53:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; 
   d="scan'208";a="666852088"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2022 17:53:48 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oF3Ot-0001yj-1R;
	Sat, 23 Jul 2022 00:53:47 +0000
Date: Sat, 23 Jul 2022 08:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-nvme@lists.infradead.org, Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: [linux-nvme:nvme-5.20 6/23] ERROR: modpost: "nvme_get_opcode_str"
 [drivers/nvme/host/nvme.ko] undefined!
Message-ID: <202207230815.GclNqpQx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-5.20
head:   db6c4eb373fed6bb78f4aab2c9e4de0cc8e9c7ed
commit: 25399ce891e72e1f70c265a95fa4d12deba0736f [6/23] nvme-pci: print the command name of aborted commands
config: powerpc-randconfig-r012-20220721 (https://download.01.org/0day-ci/archive/20220723/202207230815.GclNqpQx-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 72686d68c137551cce816416190a18d45b4d4e2a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        git remote add linux-nvme git://git.infradead.org/nvme.git
        git fetch --no-tags linux-nvme nvme-5.20
        git checkout 25399ce891e72e1f70c265a95fa4d12deba0736f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "nvme_get_opcode_str" [drivers/nvme/host/nvme.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
