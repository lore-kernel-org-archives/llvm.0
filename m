Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6B57B;
	Tue, 25 Apr 2023 07:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682407405; x=1713943405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZLLyogxFQloFVQPD76GnGG5Mb+uYLYFcxhvnkSmyb0k=;
  b=YY2TH5evXVQwf8JDOr6c6uoJLJ5CBPI5EHxyMzE5W4L/KEnbgjxfmoKV
   nuI6b+8YbGdSTZUIVHh+yylcngwZffejAxNLVA42vzSOKhBzl03xcXJt6
   vq1033trl2uv+rTt9glFly8o+ob09YihakDf3rd0afD//mKQHVkURWWsr
   wjshjS40uRMUPCJ0a27fQOc4k3zpnuWEoCpUCiRKJUIAUP6gtmdLnFrqB
   rjbsvvwYXvvhP5a6HOLP4tfWMCtUclbveCAgR/bx2z0n1Ic6Nk9b9IXTv
   WbcRCz9Eg+OaAyAi3Xrx1LutV8+We5kThdJaDOhpOSgBOpAKUxV3DUZ+M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="345439910"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="345439910"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 00:23:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="696072106"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="696072106"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 25 Apr 2023 00:23:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prD1H-000j9O-0U;
	Tue, 25 Apr 2023 07:23:23 +0000
Date: Tue, 25 Apr 2023 15:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Beichler <benjamin.beichler@uni-rostock.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3] average: change non-init state and add check for
 added values
Message-ID: <202304251527.UYFJBOVz-lkp@intel.com>
References: <20230424210430.390592-1-benjamin.beichler@uni-rostock.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424210430.390592-1-benjamin.beichler@uni-rostock.de>

Hi Benjamin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.3 next-20230424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Beichler/average-change-non-init-state-and-add-check-for-added-values/20230425-050642
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230424210430.390592-1-benjamin.beichler%40uni-rostock.de
patch subject: [RFC PATCH v3] average: change non-init state and add check for added values
config: arm-randconfig-r025-20230424 (https://download.01.org/0day-ci/archive/20230425/202304251527.UYFJBOVz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/5dcb0037ea1da8b44284784d7c5d62aab16abad4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Beichler/average-change-non-init-state-and-add-check-for-added-values/20230425-050642
        git checkout 5dcb0037ea1da8b44284784d7c5d62aab16abad4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/ net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251527.UYFJBOVz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/drm_self_refresh_helper.c:56:1: error: expected ')'
   DECLARE_EWMA(psr_time, 4, 4)
   ^
   include/linux/average.h:50:10: note: expanded from macro 'DECLARE_EWMA'
                                                             unsigned long val)    \
                                                             ^
   drivers/gpu/drm/drm_self_refresh_helper.c:56:1: note: to match this '('
   include/linux/average.h:49:44: note: expanded from macro 'DECLARE_EWMA'
                   static inline void ewma_##name##_init_val(struct ewma_##name *e \
                                                            ^
>> drivers/gpu/drm/drm_self_refresh_helper.c:56:1: error: use of undeclared identifier 'val'
   DECLARE_EWMA(psr_time, 4, 4)
   ^
   include/linux/average.h:53:17: note: expanded from macro 'DECLARE_EWMA'
                   e->internal = val;                                              \
                                 ^
   2 errors generated.
--
   In file included from net/mac80211/main.c:28:
   In file included from net/mac80211/ieee80211_i.h:34:
>> net/mac80211/sta_info.h:126:1: error: expected ')'
   DECLARE_EWMA(avg_signal, 10, 8)
   ^
   include/linux/average.h:50:10: note: expanded from macro 'DECLARE_EWMA'
                                                             unsigned long val)    \
                                                             ^
   net/mac80211/sta_info.h:126:1: note: to match this '('
   include/linux/average.h:49:44: note: expanded from macro 'DECLARE_EWMA'
                   static inline void ewma_##name##_init_val(struct ewma_##name *e \
                                                            ^
   In file included from net/mac80211/main.c:28:
   In file included from net/mac80211/ieee80211_i.h:34:
>> net/mac80211/sta_info.h:126:1: error: use of undeclared identifier 'val'
   DECLARE_EWMA(avg_signal, 10, 8)
   ^
   include/linux/average.h:53:17: note: expanded from macro 'DECLARE_EWMA'
                   e->internal = val;                                              \
                                 ^
   In file included from net/mac80211/main.c:28:
   In file included from net/mac80211/ieee80211_i.h:34:
   net/mac80211/sta_info.h:367:1: error: expected ')'
   DECLARE_EWMA(mesh_fail_avg, 20, 8)
   ^
   include/linux/average.h:50:10: note: expanded from macro 'DECLARE_EWMA'
                                                             unsigned long val)    \
                                                             ^
   net/mac80211/sta_info.h:367:1: note: to match this '('
   include/linux/average.h:49:44: note: expanded from macro 'DECLARE_EWMA'
                   static inline void ewma_##name##_init_val(struct ewma_##name *e \
                                                            ^
   In file included from net/mac80211/main.c:28:
   In file included from net/mac80211/ieee80211_i.h:34:
   net/mac80211/sta_info.h:367:1: error: use of undeclared identifier 'val'
   DECLARE_EWMA(mesh_fail_avg, 20, 8)
   ^
   include/linux/average.h:53:17: note: expanded from macro 'DECLARE_EWMA'
                   e->internal = val;                                              \
                                 ^
   In file included from net/mac80211/main.c:28:
   In file included from net/mac80211/ieee80211_i.h:34:
   net/mac80211/sta_info.h:368:1: error: expected ')'
   DECLARE_EWMA(mesh_tx_rate_avg, 8, 16)
   ^
   include/linux/average.h:50:10: note: expanded from macro 'DECLARE_EWMA'
                                                             unsigned long val)    \
                                                             ^
   net/mac80211/sta_info.h:368:1: note: to match this '('
   include/linux/average.h:49:44: note: expanded from macro 'DECLARE_EWMA'
                   static inline void ewma_##name##_init_val(struct ewma_##name *e \
                                                            ^
   In file included from net/mac80211/main.c:28:
   In file included from net/mac80211/ieee80211_i.h:34:
   net/mac80211/sta_info.h:368:1: error: use of undeclared identifier 'val'
   DECLARE_EWMA(mesh_tx_rate_avg, 8, 16)
   ^
   include/linux/average.h:53:17: note: expanded from macro 'DECLARE_EWMA'
                   e->internal = val;                                              \
                                 ^
   In file included from net/mac80211/main.c:28:
   In file included from net/mac80211/ieee80211_i.h:34:
   net/mac80211/sta_info.h:427:1: error: expected ')'
   DECLARE_EWMA(signal, 10, 8)
   ^
   include/linux/average.h:50:10: note: expanded from macro 'DECLARE_EWMA'
                                                             unsigned long val)    \
                                                             ^
   net/mac80211/sta_info.h:427:1: note: to match this '('
   include/linux/average.h:49:44: note: expanded from macro 'DECLARE_EWMA'
                   static inline void ewma_##name##_init_val(struct ewma_##name *e \
                                                            ^
   In file included from net/mac80211/main.c:28:
   In file included from net/mac80211/ieee80211_i.h:34:
   net/mac80211/sta_info.h:427:1: error: use of undeclared identifier 'val'
   DECLARE_EWMA(signal, 10, 8)
   ^
   include/linux/average.h:53:17: note: expanded from macro 'DECLARE_EWMA'
                   e->internal = val;                                              \
                                 ^
   In file included from net/mac80211/main.c:28:
>> net/mac80211/ieee80211_i.h:468:1: error: expected ')'
   DECLARE_EWMA(beacon_signal, 4, 4)
   ^
   include/linux/average.h:50:10: note: expanded from macro 'DECLARE_EWMA'
                                                             unsigned long val)    \
                                                             ^
   net/mac80211/ieee80211_i.h:468:1: note: to match this '('
   include/linux/average.h:49:44: note: expanded from macro 'DECLARE_EWMA'
                   static inline void ewma_##name##_init_val(struct ewma_##name *e \
                                                            ^
   In file included from net/mac80211/main.c:28:
>> net/mac80211/ieee80211_i.h:468:1: error: use of undeclared identifier 'val'
   DECLARE_EWMA(beacon_signal, 4, 4)
   ^
   include/linux/average.h:53:17: note: expanded from macro 'DECLARE_EWMA'
                   e->internal = val;                                              \
                                 ^
   10 errors generated.
--
   In file included from net/batman-adv/bat_algo.c:7:
   In file included from net/batman-adv/main.h:218:
>> net/batman-adv/types.h:578:1: error: expected ')'
   DECLARE_EWMA(throughput, 10, 8)
   ^
   include/linux/average.h:50:10: note: expanded from macro 'DECLARE_EWMA'
                                                             unsigned long val)    \
                                                             ^
   net/batman-adv/types.h:578:1: note: to match this '('
   include/linux/average.h:49:44: note: expanded from macro 'DECLARE_EWMA'
                   static inline void ewma_##name##_init_val(struct ewma_##name *e \
                                                            ^
   In file included from net/batman-adv/bat_algo.c:7:
   In file included from net/batman-adv/main.h:218:
>> net/batman-adv/types.h:578:1: error: use of undeclared identifier 'val'
   DECLARE_EWMA(throughput, 10, 8)
   ^
   include/linux/average.h:53:17: note: expanded from macro 'DECLARE_EWMA'
                   e->internal = val;                                              \
                                 ^
   2 errors generated.
--
>> drivers/net/virtio_net.c:54:1: error: expected ')'
   DECLARE_EWMA(pkt_len, 0, 64)
   ^
   include/linux/average.h:50:10: note: expanded from macro 'DECLARE_EWMA'
                                                             unsigned long val)    \
                                                             ^
   drivers/net/virtio_net.c:54:1: note: to match this '('
   include/linux/average.h:49:44: note: expanded from macro 'DECLARE_EWMA'
                   static inline void ewma_##name##_init_val(struct ewma_##name *e \
                                                            ^
>> drivers/net/virtio_net.c:54:1: error: use of undeclared identifier 'val'
   DECLARE_EWMA(pkt_len, 0, 64)
   ^
   include/linux/average.h:53:17: note: expanded from macro 'DECLARE_EWMA'
                   e->internal = val;                                              \
                                 ^
   2 errors generated.


vim +56 drivers/gpu/drm/drm_self_refresh_helper.c

d4da4e33341c5e Sean Paul 2019-09-18  55  
d4da4e33341c5e Sean Paul 2019-09-18 @56  DECLARE_EWMA(psr_time, 4, 4)
d4da4e33341c5e Sean Paul 2019-09-18  57  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
