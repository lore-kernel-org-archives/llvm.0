Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3B320F1
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 05:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653974278; x=1685510278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1DJVx9zz0h9kQopUMu17wOrksrBKj9HZHX8vpJW7HEw=;
  b=XIGx6/AgAdgKgqUzSOGItNUcudydYF16ZL9+5Vs85b0ZM2Fw7XsMSnIm
   o8VTo1Sq4A5wjrmn92P1PkVApwuVjxzkg3TGvIfhfoUPnaifIAIGoYidy
   9YcgM34oVaw0DhSBYa8XAUfod1tcW5n5PSy+ffh8j3DdIoiy2Ayyzxctj
   vIO29gvUEMSNytGNKbOb+SOnePQ2P1s5ttm+QsE5KVmoq7BviEy0crpui
   ULe10rBYvDgHrmF2v5N5popqbmNvPgY9IhKABhvjsKKYmieny+L6KILa8
   AZoC79U4d/smwgf6oNbY2RZx+5WLWLdKcJCJ8abcjVb23dK5/IUfIke0E
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="335797962"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="335797962"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 22:17:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="551608108"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 May 2022 22:17:57 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvuGS-0002MU-IY;
	Tue, 31 May 2022 05:17:56 +0000
Date: Tue, 31 May 2022 13:17:32 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
Message-ID: <202205311333.bD979r32-lkp@intel.com>
References: <20220530102017.471865-2-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220530102017.471865-2-jose.exposito89@gmail.com>

Hi "José,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on drm/drm-next]
[also build test ERROR on v5.18 next-20220527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jos-Exp-sito/KUnit-tests-for-drm_format_helper/20220530-182201
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: hexagon-randconfig-r045-20220531 (https://download.01.org/0day-ci/archive/20220531/202205311333.bD979r32-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ed116da35ca09da26713d2192e8493c5d9c500f3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jos-Exp-sito/KUnit-tests-for-drm_format_helper/20220530-182201
        git checkout ed116da35ca09da26713d2192e8493c5d9c500f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_bridge_hpd_enable
   >>> referenced by drm_bridge_connector.c
   >>> gpu/drm/drm_bridge_connector.o:(drm_bridge_connector_enable_hpd) in archive drivers/built-in.a
   >>> referenced by drm_bridge_connector.c
   >>> gpu/drm/drm_bridge_connector.o:(drm_bridge_connector_enable_hpd) in archive drivers/built-in.a
   >>> referenced by drm_bridge_connector.c
   >>> gpu/drm/drm_bridge_connector.o:(drm_bridge_connector_init) in archive drivers/built-in.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: drm_bridge_hpd_disable
   >>> referenced by drm_bridge_connector.c
   >>> gpu/drm/drm_bridge_connector.o:(drm_bridge_connector_disable_hpd) in archive drivers/built-in.a
   >>> referenced by drm_bridge_connector.c
   >>> gpu/drm/drm_bridge_connector.o:(drm_bridge_connector_disable_hpd) in archive drivers/built-in.a
   >>> referenced by drm_bridge_connector.c
   >>> gpu/drm/drm_bridge_connector.o:(drm_bridge_connector_destroy) in archive drivers/built-in.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: drm_connector_list_iter_end
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_helper_encoder_in_use) in archive drivers/built-in.a
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_helper_encoder_in_use) in archive drivers/built-in.a
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_config) in archive drivers/built-in.a
   >>> referenced 35 more times
--
>> ld.lld: error: undefined symbol: drm_modeset_lock_all
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_helper_disable_unused_functions) in archive drivers/built-in.a
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_helper_disable_unused_functions) in archive drivers/built-in.a
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_helper_resume_force_mode) in archive drivers/built-in.a
   >>> referenced 7 more times
--
>> ld.lld: error: undefined symbol: drm_modeset_unlock_all
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_helper_disable_unused_functions) in archive drivers/built-in.a
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_helper_disable_unused_functions) in archive drivers/built-in.a
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_helper_resume_force_mode) in archive drivers/built-in.a
   >>> referenced 7 more times
--
>> ld.lld: error: undefined symbol: drm_warn_on_modeset_not_all_locked
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(__drm_helper_disable_unused_functions) in archive drivers/built-in.a
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(__drm_helper_disable_unused_functions) in archive drivers/built-in.a
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive drivers/built-in.a
   >>> referenced 3 more times
--
>> ld.lld: error: undefined symbol: drm_mode_duplicate
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive drivers/built-in.a
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: drm_mode_init
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive drivers/built-in.a
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive drivers/built-in.a
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive drivers/built-in.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: drm_mode_copy
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive drivers/built-in.a
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive drivers/built-in.a
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive drivers/built-in.a
   >>> referenced 7 more times
--
>> ld.lld: error: undefined symbol: __drm_dbg
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive drivers/built-in.a
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive drivers/built-in.a
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive drivers/built-in.a
   >>> referenced 45 more times
--
>> ld.lld: error: undefined symbol: drm_mode_destroy
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive drivers/built-in.a
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive drivers/built-in.a
   >>> referenced by drm_crtc_helper.c
   >>> gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive drivers/built-in.a
   >>> referenced 1 more times
..

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
