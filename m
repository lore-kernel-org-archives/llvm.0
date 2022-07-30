Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C567B3D98
	for <llvm@lists.linux.dev>; Sat, 30 Jul 2022 20:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659212370; x=1690748370;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WAw2PV3fWHourLZeCCBkKAd+etiv3C5zoOgmY9QHuQA=;
  b=dwCKsfy0uGr4DHvfTmLqMqZhLkD8knrct0q0Pl8MKAnYqBeDsbzCXykB
   AsY2UI1XI8YMUI65hMdKBihCulB3AZT20urUSddOYBSB4iY7hldxdVQJ9
   0g0IYsgk7Urfz3tVIaYnfGETS5eNy6cGqnSg/bfRHc+IUdBAfp9s7jof/
   UFGLpwh0lcel3BWx1tFer+nyJw8mtv6WjC+ot4OUHrCejdBqQxvzP4yRf
   tbkEmG/if6j/h1NMLrURGxdPE7IhFfNIBNsZyp9EXZU5YRZMM379YMTfL
   kPOjpxJ2WR4YjKTQoy+EeamWZub09+lIamjDTlpY9l65DzOITGEqJFbaY
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10424"; a="375248258"
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; 
   d="scan'208";a="375248258"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2022 13:19:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,204,1654585200"; 
   d="scan'208";a="598558543"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Jul 2022 13:19:26 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHsvm-000DHf-0S;
	Sat, 30 Jul 2022 20:19:26 +0000
Date: Sun, 31 Jul 2022 04:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>, aroulin@nvidia.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, sbrivio@redhat.com,
	roopa@nvidia.com, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nikolay Aleksandrov <razor@blackwall.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, bridge@lists.linux-foundation.org,
	Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Subject: Re: [PATCH net-next 2/3] net: 8021q: fix bridge binding behavior for
 vlan interfaces
Message-ID: <202207310415.XN6htXAe-lkp@intel.com>
References: <2b09fbacde7e8818f4ada4829818fdf015e36b58.1659195179.git.sevinj.aghayeva@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b09fbacde7e8818f4ada4829818fdf015e36b58.1659195179.git.sevinj.aghayeva@gmail.com>

Hi Sevinj,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Sevinj-Aghayeva/net-vlan-fix-bridge-binding-behavior-and-add-selftests/20220731-000455
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 63757225a93353bc2ce4499af5501eabdbbf23f9
config: hexagon-randconfig-r032-20220729 (https://download.01.org/0day-ci/archive/20220731/202207310415.XN6htXAe-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/993166d2a01876dc92807f74b3d72f63d25c8227
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sevinj-Aghayeva/net-vlan-fix-bridge-binding-behavior-and-add-selftests/20220731-000455
        git checkout 993166d2a01876dc92807f74b3d72f63d25c8227
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: br_vlan_upper_change
   >>> referenced by vlan_dev.c:0 (net/8021q/vlan_dev.c:0)
   >>>               8021q/vlan_dev.o:(vlan_dev_change_flags) in archive net/built-in.a
   >>> referenced by vlan_dev.c:0 (net/8021q/vlan_dev.c:0)
   >>>               8021q/vlan_dev.o:(vlan_dev_change_flags) in archive net/built-in.a
   pahole: .tmp_vmlinux.btf: No such file or directory
   ld.lld: error: .btf.vmlinux.bin.o: unknown file type

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
