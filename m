Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5901376
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 19:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652729570; x=1684265570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UyeIsvzafhmjCzob4EXOOMUZUZqxT0Y/3G8Xu5JTXxo=;
  b=ST9i0czV0SAMxVekyTbrgYHzaHEW9q5XAcHhfMRibU6QiFHrzTDmmHLe
   5ESwLuhWvxHwe+k0oAvZGZkFukIT1wpDH2LS6blW+BYGwtPbPhlNziiu4
   aQu5GVhjYMGW0VNtliEMIzc229SDNpeydZ5qDYFpXAw9leXA1XbLCMwi4
   nPtuCPs7fEK6HoVu4aq2+j99X0CM/ARV7m/KKLFhSDG4T6N59NJCeIDJu
   c0VNhqBGQosrRiJMwc2ZNT7AIMYdnIW6eJcDFdAj9x0NWE51exY6w4SSt
   4h6MCJw7uzt/yGMkMYgqSCLPyCl0UMuenOnDaUQssbai47w9aGQTEUX/L
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="251458400"
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="251458400"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 12:32:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="897351678"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 16 May 2022 12:32:47 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqgSV-0000IL-3P;
	Mon, 16 May 2022 19:32:47 +0000
Date: Tue, 17 May 2022 03:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: Mikhail Zhilkin <csharper2005@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	NOGUCHI Hiroshi <drvlabo@gmail.com>
Subject: [linux-next:master 10956/12195] ERROR: modpost: "__udivdi3"
 [drivers/mtd/parsers/scpart.ko] undefined!
Message-ID: <202205170327.TVBbIsh2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f7bdc402fb06f897ff1f492a2d42e1f7c2efedb
commit: 4213e556fe2a18782e91a87fec70d98c48f1ee41 [10956/12195] mtd: parsers: add support for Sercomm partitions
config: i386-randconfig-r004-20220516 (https://download.01.org/0day-ci/archive/20220517/202205170327.TVBbIsh2-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4213e556fe2a18782e91a87fec70d98c48f1ee41
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 4213e556fe2a18782e91a87fec70d98c48f1ee41
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/mtd/parsers/scpart.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
