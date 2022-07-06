Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0FA4C81
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 15:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657122013; x=1688658013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AKh4mr1uPByPYABv1mpl6RRugd2DcaAFD/hiBVNUfF4=;
  b=eknQLDTilYxpJ24/gFSVMzE+S7aITWmI9Vin2w1Gh14tqhrgoSx0Lm9O
   Dm9HfsqOfOf9P/1vGtNedQL7ldgGXu2n27IpTpWnPJPSZUy6DBn8f/npl
   M7rK4w4pR7Hn9wrWfab6rPJQRJBnn1khJrgkVJdh8Km03gs2dN340v/VB
   E7KruOq++ad8y+lA/nuqTdz9fsqy04gGI3w+zuNxnPBkoU8Mz6flZWbck
   CWaOrAoWsg/LkGqRTk6F903ul6zRK7A5em2oipvvLMUQGyLkyC21lq3K5
   Ux4phwGvZIyFf50a8dbRLR6J4d+jjHpLfLBupSSk2OxZ3+ZeCsH+wXZsg
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="264197341"
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; 
   d="scan'208";a="264197341"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2022 08:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; 
   d="scan'208";a="661012580"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Jul 2022 08:40:11 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o978M-000KkH-J0;
	Wed, 06 Jul 2022 15:40:10 +0000
Date: Wed, 6 Jul 2022 23:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Habets <habetsm.xilinx@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: drivers/net/ethernet/sfc/siena/selftest.c:46:15: warning: field ip
 within 'struct efx_loopback_payload' is less aligned than 'struct iphdr' and
 is usually due to 'struct efx_loopback_payload' being packed, which can lead
 to unaligned accesses
Message-ID: <202207062332.BG1QJUUo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e35e5b6f695d241ffb1d223207da58a1fbcdff4b
commit: c5a13c319e10e795850b61bc7e3447b08024be2e sfc: Add a basic Siena module
date:   8 weeks ago
config: arm-randconfig-r004-20220706 (https://download.01.org/0day-ci/archive/20220706/202207062332.BG1QJUUo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f553287b588916de09c66e3e32bf75e5060f967f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c5a13c319e10e795850b61bc7e3447b08024be2e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c5a13c319e10e795850b61bc7e3447b08024be2e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/ethernet/sfc/siena/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/sfc/siena/selftest.c:46:15: warning: field ip within 'struct efx_loopback_payload' is less aligned than 'struct iphdr' and is usually due to 'struct efx_loopback_payload' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           struct iphdr ip;
                        ^
   1 warning generated.


vim +46 drivers/net/ethernet/sfc/siena/selftest.c

d48523cb88e0703 Martin Habets 2022-05-09  37  
d48523cb88e0703 Martin Habets 2022-05-09  38  /*
d48523cb88e0703 Martin Habets 2022-05-09  39   * Loopback test packet structure
d48523cb88e0703 Martin Habets 2022-05-09  40   *
d48523cb88e0703 Martin Habets 2022-05-09  41   * The self-test should stress every RSS vector, and unfortunately
d48523cb88e0703 Martin Habets 2022-05-09  42   * Falcon only performs RSS on TCP/UDP packets.
d48523cb88e0703 Martin Habets 2022-05-09  43   */
d48523cb88e0703 Martin Habets 2022-05-09  44  struct efx_loopback_payload {
d48523cb88e0703 Martin Habets 2022-05-09  45  	struct ethhdr header;
d48523cb88e0703 Martin Habets 2022-05-09 @46  	struct iphdr ip;
d48523cb88e0703 Martin Habets 2022-05-09  47  	struct udphdr udp;
d48523cb88e0703 Martin Habets 2022-05-09  48  	__be16 iteration;
d48523cb88e0703 Martin Habets 2022-05-09  49  	char msg[64];
d48523cb88e0703 Martin Habets 2022-05-09  50  } __packed;
d48523cb88e0703 Martin Habets 2022-05-09  51  

:::::: The code at line 46 was first introduced by commit
:::::: d48523cb88e0703055c1b33e61eb644a7976f92b sfc: Copy shared files needed for Siena (part 2)

:::::: TO: Martin Habets <martinh@xilinx.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
