Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CFE33D6
	for <llvm@lists.linux.dev>; Wed,  1 Jun 2022 22:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654120948; x=1685656948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3z/j317NlI3xcyDNldMXZQ5CSLJfGKteu9YPUIwxMaU=;
  b=WbOvjzLqdphBz/xkKW8aPHCmyLWHTtVrWySyFp60r4clcZ4NN0/dWRKq
   6t6m2VqElTsiE3M78eUs78irSChUDnzsLiMmn+mhy29Z41fd4Ae8FjX8I
   75AqhENfp2d32PcukbmAkCfv1elkgiSMBUvYTTwh0S9LaaciDmNJTMch0
   bA/3QNR9XBJ3TFYaIEAQ+BJGwHyknrSBX52+1vwZh/Zb8C/OKzdGHLxrE
   ECbn6dkswXfsL03vHo8MkljHxItMcpgTflKa+TrDTTh5AJWfIscT1OHBR
   Pjp/G22pYTf38qMWnT0flcGzwg/GSN1/2W4DLL+6qZhYsXJm9THSP3MYV
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="275470141"
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; 
   d="scan'208";a="275470141"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 15:02:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; 
   d="scan'208";a="581789970"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Jun 2022 15:02:24 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwWQ4-0004SW-4C;
	Wed, 01 Jun 2022 22:02:24 +0000
Date: Thu, 2 Jun 2022 06:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <eric.dumazet@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	netdev <netdev@vger.kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net 1/2] net: add debug info to __skb_pull()
Message-ID: <202206020557.QyvlGs0H-lkp@intel.com>
References: <20220531185933.1086667-2-eric.dumazet@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531185933.1086667-2-eric.dumazet@gmail.com>

Hi Eric,

I love your patch! Yet something to improve:

[auto build test ERROR on net/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net-af_packet-be-careful-when-expanding-mac-header-size/20220601-030146
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 09e545f7381459c015b6fa0cd0ac6f010ef8cc25
config: hexagon-randconfig-r002-20220531 (https://download.01.org/0day-ci/archive/20220602/202206020557.QyvlGs0H-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a907c048e7699133feedaa06948c15c719a59f94
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Eric-Dumazet/net-af_packet-be-careful-when-expanding-mac-header-size/20220601-030146
        git checkout a907c048e7699133feedaa06948c15c719a59f94
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: skb_dump
   >>> referenced by cgroup.c
   >>>               bpf/cgroup.o:(__cgroup_bpf_run_filter_skb) in archive kernel/built-in.a
   >>> referenced by cgroup.c
   >>>               bpf/cgroup.o:(__cgroup_bpf_run_filter_skb) in archive kernel/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
