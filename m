Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359323226
	for <llvm@lists.linux.dev>; Tue,  5 Apr 2022 19:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649186013; x=1680722013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=afheeonXdMcIaKpgxhSgZlNFQflMvyoO9IdUDEQ6ZQ0=;
  b=YxNDOx+HKqUn3DI1aZoWInTIMZ6NMoxyPmYy0ZWg/6NebeA8dByoj4mc
   CkMIg3FbIazN1v481BGZ3pPf2vtITgyB/33ZBpNGvbabpAp+39hVNAbV8
   PciavCBFVlek4UdmNpDvy3YABbp69KafIMOyV64jgvGIkpO8r1tKAoU8k
   XY2ULTXnBuDdXvqIyYThsX81+nWkzESJJQlN4ceDYUzBMZaz3RBTtVTor
   HXHEgHE/rtGJAkfU3+jxSaYmLBbX6QVQs2CYJCfVaArohRyY1AILbDQCT
   BX6lbeaqFct6UR8KBpIX1O7iJtrDwPpi9RqSHhIGgS0BhfdxEsoJvBa+P
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="260835474"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
   d="scan'208";a="260835474"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 12:13:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
   d="scan'208";a="588053334"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Apr 2022 12:13:27 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nbocI-0003gq-Fy;
	Tue, 05 Apr 2022 19:13:26 +0000
Date: Wed, 6 Apr 2022 03:12:33 +0800
From: kernel test robot <lkp@intel.com>
To: Aditya Bavanari <abavanar@codeaurora.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Alistair Delva <adelva@google.com>,
	Will McVicker <willmcvicker@google.com>
Subject: [tobetter:odroidm1-4.19.y 4348/9999] sound/soc/soc-core.c:761:27:
 warning: no previous prototype for function 'soc_find_component_locked'
Message-ID: <202204060317.N87e8kq1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Aditya,

FYI, the error/warning still remains.

tree:   https://github.com/tobetter/linux odroidm1-4.19.y
head:   9c4982fe4e77325e4d0861cea11b239d8200b585
commit: 75fe91933be2dd4b884ca83bd72e1e0f0d05cfc6 [4348/9999] ANDROID: ASoC: core: add locked version of soc_find_component
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220406/202204060317.N87e8kq1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/tobetter/linux/commit/75fe91933be2dd4b884ca83bd72e1e0f0d05cfc6
        git remote add tobetter https://github.com/tobetter/linux
        git fetch --no-tags tobetter odroidm1-4.19.y
        git checkout 75fe91933be2dd4b884ca83bd72e1e0f0d05cfc6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/soc-core.c:761:27: warning: no previous prototype for function 'soc_find_component_locked' [-Wmissing-prototypes]
   struct snd_soc_component *soc_find_component_locked(
                             ^
   sound/soc/soc-core.c:761:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct snd_soc_component *soc_find_component_locked(
   ^
   static 
   1 warning generated.
   sound/soc/soc-core.c:2971: warning: Excess function parameter 'legacy_dai_naming' description in 'snd_soc_register_dais'
   sound/soc/soc-core.c:3333: warning: Function parameter or member 'online' not described in 'snd_soc_card_change_online_state'


vim +/soc_find_component_locked +761 sound/soc/soc-core.c

   750	
   751	/**
   752	 * soc_find_component_locked: soc_find_component with client lock acquired
   753	 *
   754	 * @of_node: of_node of the component to query.
   755	 * @name: name of the component to query.
   756	 *
   757	 * function to find out if a component is already registered with ASoC core.
   758	 *
   759	 * Returns component handle for success, else NULL error.
   760	 */
 > 761	struct snd_soc_component *soc_find_component_locked(
   762		const struct device_node *of_node, const char *name)
   763	{
   764		struct snd_soc_component *component = NULL;
   765	
   766		mutex_lock(&client_mutex);
   767		component = soc_find_component(of_node, name);
   768		mutex_unlock(&client_mutex);
   769		return component;
   770	}
   771	EXPORT_SYMBOL(soc_find_component_locked);
   772	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
