Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EA27E
	for <llvm@lists.linux.dev>; Sat, 23 Jul 2022 10:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658571082; x=1690107082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rMa2OJS/UU2W2a1y38QJ76HuiC1jErjNS75ABX0n6eA=;
  b=GllEK+yiVq0nZDAcF9k97PbYtGnHI/a0apab6W98z2N4PONa3ABw7G5U
   mSug0ZNhcOP/NSDJ86s6i4Z8S8VuJGg3mxYIGOhgSWjzAsWkVLTBDxtyq
   Wxw6an0e8taJdhtjzep8ilI1ygae/jZK24MGqLIGzZLZKAIk3QIzGKXQg
   fcId3q+zouatR1r+AqmdqlmYPNOWQxzvAeoyY4sPyDDOmoCVJGMu6TVOg
   O5xJeSVMvKByoyLHav5/3+yzdd+hM7b7ZCUvN/5JIbOaYzf8zM8KzJ9Rf
   zzmdC7MFw/74hF97tEZXbnAH0REYrix1wLpDTbysWWNAAa68KouDdztYg
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10416"; a="288216573"
X-IronPort-AV: E=Sophos;i="5.93,188,1654585200"; 
   d="scan'208";a="288216573"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2022 03:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,188,1654585200"; 
   d="scan'208";a="666939418"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 23 Jul 2022 03:11:17 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oFC6P-0002VN-0m;
	Sat, 23 Jul 2022 10:11:17 +0000
Date: Sat, 23 Jul 2022 18:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yevhen Orlov <yevhen.orlov@plvision.eu>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Volodymyr Mytnyk <volodymyr.mytnyk@plvision.eu>,
	Taras Chornyi <taras.chornyi@plvision.eu>,
	Mickey Rachamim <mickeyr@marvell.com>,
	Serhiy Pshyk <serhiy.pshyk@plvision.eu>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Stephen Hemminger <stephen@networkplumber.org>,
	linux-kernel@vger.kernel.org,
	Yevhen Orlov <yevhen.orlov@plvision.eu>,
	Oleksandr Mazur <oleksandr.mazur@plvision.eu>
Subject: Re: [PATCH net-next v2 6/9] net: marvell: prestera: Add heplers to
 interact with fib_notifier_info
Message-ID: <202207231823.Q46D3E5G-lkp@intel.com>
References: <20220721221148.18787-7-yevhen.orlov@plvision.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721221148.18787-7-yevhen.orlov@plvision.eu>

Hi Yevhen,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yevhen-Orlov/net-marvell-prestera-add-nexthop-routes-offloading/20220722-061517
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 5588d628027092e66195097bdf6835ddf64418b3
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220723/202207231823.Q46D3E5G-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 72686d68c137551cce816416190a18d45b4d4e2a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a6535f7f7b3aea14504cac208c170d413739d5f9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yevhen-Orlov/net-marvell-prestera-add-nexthop-routes-offloading/20220722-061517
        git checkout a6535f7f7b3aea14504cac208c170d413739d5f9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/ethernet/marvell/prestera/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/marvell/prestera/prestera_router.c:274:25: warning: address of array 'fen6_info->rt->fib6_nh' will always evaluate to 'true' [-Wpointer-bool-conversion]
                   return fen6_info->rt->fib6_nh ?
                          ~~~~~~~~~~~~~~~^~~~~~~ ~
   drivers/net/ethernet/marvell/prestera/prestera_router.c:466:10: warning: enumeration value 'PRESTERA_FIB_TYPE_UC_NH' not handled in switch [-Wswitch]
           switch (fc->lpm_info.fib_type) {
                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/marvell/prestera/prestera_router.c:122:13: warning: unused function 'prestera_fib_info_is_direct' [-Wunused-function]
   static bool prestera_fib_info_is_direct(struct fib_notifier_info *info)
               ^
   drivers/net/ethernet/marvell/prestera/prestera_router.c:135:13: warning: unused function 'prestera_fib_info_is_nh' [-Wunused-function]
   static bool prestera_fib_info_is_nh(struct fib_notifier_info *info)
               ^
   drivers/net/ethernet/marvell/prestera/prestera_router.c:194:1: warning: unused function 'prestera_util_kern_n_is_reachable' [-Wunused-function]
   prestera_util_kern_n_is_reachable(u32 tb_id,
   ^
   drivers/net/ethernet/marvell/prestera/prestera_router.c:206:13: warning: unused function 'prestera_util_kern_set_neigh_offload' [-Wunused-function]
   static void prestera_util_kern_set_neigh_offload(struct neighbour *n,
               ^
   drivers/net/ethernet/marvell/prestera/prestera_router.c:216:1: warning: unused function 'prestera_util_kern_set_nh_offload' [-Wunused-function]
   prestera_util_kern_set_nh_offload(struct fib_nh_common *nhc, bool offloaded, bool trap)
   ^
   drivers/net/ethernet/marvell/prestera/prestera_router.c:230:1: warning: unused function 'prestera_kern_fib_info_nhc' [-Wunused-function]
   prestera_kern_fib_info_nhc(struct fib_notifier_info *info, int n)
   ^
   drivers/net/ethernet/marvell/prestera/prestera_router.c:262:12: warning: unused function 'prestera_kern_fib_info_nhs' [-Wunused-function]
   static int prestera_kern_fib_info_nhs(struct fib_notifier_info *info)
              ^
   9 warnings generated.


vim +274 drivers/net/ethernet/marvell/prestera/prestera_router.c

   261	
   262	static int prestera_kern_fib_info_nhs(struct fib_notifier_info *info)
   263	{
   264		struct fib6_entry_notifier_info *fen6_info;
   265		struct fib_entry_notifier_info *fen4_info;
   266	
   267		if (info->family == AF_INET) {
   268			fen4_info = container_of(info, struct fib_entry_notifier_info,
   269						 info);
   270			return fib_info_num_path(fen4_info->fi);
   271		} else if (info->family == AF_INET6) {
   272			fen6_info = container_of(info, struct fib6_entry_notifier_info,
   273						 info);
 > 274			return fen6_info->rt->fib6_nh ?
   275				(fen6_info->rt->fib6_nsiblings + 1) : 0;
   276		}
   277	
   278		return 0;
   279	}
   280	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
