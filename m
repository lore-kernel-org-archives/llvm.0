Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABD615A4;
	Sat,  8 Apr 2023 03:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680925111; x=1712461111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+oztJTWwYt3X0/EYAgkC+nX2yjwtrPqRKC5U7BhGYT4=;
  b=hg2sj1lOOMZAZRhHzGgNedAWdu4XwkIQL3dnihVHTdCdlygt0XcqVnMk
   3G+nNWIaddR9qKNp6mbItR8JDs5TQySSQ7Lf9J7Scn7ctQHI5Df95gAwF
   mgGb7I3ytX3t+H0kjkyg+cY+zzYGMKEfptRL2v/tn7fUYFfa3JxeQVwtR
   kwYkgbss2rPVBLNrIsZ1/+i16wX4/wJxluijwvurV19jEjg2OGY8KbXkG
   5k4XGChMiKlY4jeQb/BGXrzze9xMYl3O7JDYpsG5Avzp0iXMcrGLBj0Vh
   LXtX7bivFghf/y/BgayhWapsfr0Z8koFayzQtgB5WtFlVaaG3rvKE2LZZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="405933302"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="405933302"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 20:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="811589948"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; 
   d="scan'208";a="811589948"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Apr 2023 20:38:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkzPG-000TFz-0B;
	Sat, 08 Apr 2023 03:38:26 +0000
Date: Sat, 8 Apr 2023 11:38:17 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [pablo-gtp:main 5/5] drivers/net/gtp.c:1225:13: error: no member
 named 'local_ip6' in 'struct udp_port_cfg'
Message-ID: <202304081142.M3PPnGma-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git main
head:   371016d821b96636a0a571bc8cabb7048369daa7
commit: 371016d821b96636a0a571bc8cabb7048369daa7 [5/5] gtp: add IPv6 support
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230408/202304081142.M3PPnGma-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git/commit/?id=371016d821b96636a0a571bc8cabb7048369daa7
        git remote add pablo-gtp https://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git
        git fetch --no-tags pablo-gtp main
        git checkout 371016d821b96636a0a571bc8cabb7048369daa7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081142.M3PPnGma-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/gtp.c:1225:13: error: no member named 'local_ip6' in 'struct udp_port_cfg'
                   udp_conf->local_ip6 = nla_get_in6_addr(nla);
                   ~~~~~~~~  ^
   1 error generated.


vim +1225 drivers/net/gtp.c

  1214	
  1215	static int gtp_sock_udp_config(struct udp_port_cfg *udp_conf,
  1216				       const struct nlattr *nla, int family)
  1217	{
  1218		udp_conf->family = family;
  1219	
  1220		switch (udp_conf->family) {
  1221		case AF_INET:
  1222			udp_conf->local_ip.s_addr = nla_get_be32(nla);
  1223			break;
  1224		case AF_INET6:
> 1225			udp_conf->local_ip6 = nla_get_in6_addr(nla);
  1226			break;
  1227		default:
  1228			return -EOPNOTSUPP;
  1229		}
  1230	
  1231		return 0;
  1232	}
  1233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
