Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEEE2C9C
	for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 12:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640090338; x=1671626338;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5i8JtUydwpVJDu6JKYzCrVZamw238lU3ABsDldI+8b8=;
  b=DzC/JAD6Im2zrlA8HjKc0yei91Fts8qz4vwZcvk2SnZ3ULGF/9MX/Mre
   8i7h0PvbdmWklr+cuElzpxtrYVtKlJgio9MkgJL7gfkqZlAP5vnuusgw4
   rFnfmVZ1x0YZyVRS0M3cWCxgH2KbKWIvEfQlISPAtJ4sIFFEpXubMYHmu
   spaGVP4x0AxAJ/oj/49SvqxTS/EE0NMPL++HAzeemg1CitGhOVcPmr1vY
   wh19ot+HYyHW3QK5sxB18RSw9c1zsjjP+XCXgy6ti3faT8A0h5WZMWruG
   ZfxzjVp6U9NhadBUSwBGFu4GQcs9mdAz0ll+kDej3a6vc/8KWdUcfzetS
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="237923387"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="237923387"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 04:38:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="508059135"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Dec 2021 04:38:57 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzePw-00095v-Bq; Tue, 21 Dec 2021 12:38:56 +0000
Date: Tue, 21 Dec 2021 20:38:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 231/8898] drivers/gpu/drm/i915/intel_pm.o:
 warning: objtool: intel_init_clock_gating_hooks()+0x279: unreachable
 instruction
Message-ID: <202112212046.ywpTEZnK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Nathan Chancellor <nathan@kernel.org>
CC: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
CC: Nick Desaulniers <ndesaulniers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   07f8c60fe60f84977dc815ec8a6b1100827c34dd
commit: 2e70570656adfe1c5d9a29940faa348d5f132199 [231/8898] drm/i915: Avoid bitwise vs logical OR warning in snb_wm_latency_quirk()
config: x86_64-randconfig-r026-20211220 (https://download.01.org/0day-ci/archive/20211221/202112212046.ywpTEZnK-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 555eacf75f21cd1dfc6363d73ad187b730349543)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2e70570656adfe1c5d9a29940faa348d5f132199
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2e70570656adfe1c5d9a29940faa348d5f132199
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/ fs// mm//

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/intel_pm.o: warning: objtool: intel_init_clock_gating_hooks()+0x279: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
