Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719E87B
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 00:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646784707; x=1678320707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/eJ+XHd1Ms87SKIz1nVImLRpqYsl8GniCmZ7kQua8JA=;
  b=MFcyNffhHgFHbl05tjlMwXuNLiA2XYGKhrKZ31ZXg9YtUKErbpB1/mQX
   iqJLENyo7O+EF9jyPMmHNu5hJG2BhlSPN33i0j1GA8KBeusufDBeae1v3
   nspq1m1nybOdsXkATB17betIdjz/Mg2YxkGw1HQXS9uCtDb1yLCv8r3w+
   mSdCoC9fPF5N4aGcpVzaG1pDhBZnej/hi7CjhB4fydnd7TY7/h4jOkO/n
   T0jPgVJ1nDBVSCQMKTHcO7rCN8RgJw9/oNcI1rxsCO3kvQitX9UK1T7pZ
   V0KgIu54nEQAvmav7YxCm/0Oda68iu9KTQROe8WMeKI2buN7Ggl02k9Fb
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="253677025"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="253677025"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 16:11:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="495650716"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 08 Mar 2022 16:11:44 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRjvb-0002Ee-Mk; Wed, 09 Mar 2022 00:11:43 +0000
Date: Wed, 9 Mar 2022 08:11:36 +0800
From: kernel test robot <lkp@intel.com>
To: Aditya Bavanari <abavanar@codeaurora.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org, Alistair Delva <adelva@google.com>,
	Will McVicker <willmcvicker@google.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.19-stable
 5226/9999] sound/soc/soc-core.c:761:27: warning: no previous prototype for
 function 'soc_find_component_locked'
Message-ID: <202203090820.wqQmG5sl-lkp@intel.com>
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

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-4.19-stable
head:   3fba6c6e70994eff4dcc5be475c9d2bd3848b83d
commit: 75fe91933be2dd4b884ca83bd72e1e0f0d05cfc6 [5226/9999] ANDROID: ASoC: core: add locked version of soc_find_component
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220309/202203090820.wqQmG5sl-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a2e9c68fcd4425fbce7380746e916966f00a39a0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/75fe91933be2dd4b884ca83bd72e1e0f0d05cfc6
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-4.19-stable
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
