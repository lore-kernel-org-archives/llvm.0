Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F358F1F937;
	Thu,  3 Aug 2023 17:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691083622; x=1722619622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WBNNUEeROBuFhzXK8TLPCZ0r7idZ59HKeoWy9VPD0JU=;
  b=lJGLqzki8Z6gFUiKUGD2QqkCuVlstEClCwYtpTRrlTGvSqtFiQkSSX6U
   j9H6OhA1njG9Rkq1cuHP0dCD0J/B81cH6PCbcZF7UauulTB9dKksoX6y+
   y5JzPmhHuWBl1YnxKh7p1eR5qzyrfisOGeycH4QEExxTXpwt9V6EZbsZP
   pSowpVlwJnOIlA4WpfLxvx/BAuT3pIO3mtia4SfhRivpDHNjAsj/V5tya
   yL8PkM1R2uohNozpMPuaFz97WVMYckMYkb/lBAA1EvXR2PS4Ydz2j3Fpf
   HUz6FlJ2hQcJquWUlI88sIK0qe1FrhBS0Nyx6RQ8HxABLtz1vaZI3gqk4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="368846144"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="368846144"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 10:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="976186018"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="976186018"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Aug 2023 10:26:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRc5z-0002Fh-1f;
	Thu, 03 Aug 2023 17:26:43 +0000
Date: Fri, 4 Aug 2023 01:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [sre-misc:rk3588 81/83] drivers/clk/rockchip/clk-gate-link.c:50:5:
 warning: no previous prototype for function 'clk_gate_link_prepare'
Message-ID: <202308040120.7KQxScIs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git rk3588
head:   9789e706b415eaf1d0a2d12c6510bec4c15ed05e
commit: 476b045672c3c13c02f8b5dc8c4a6f4509d19399 [81/83] clk: rockchip: add support for gate link
config: arm64-randconfig-r013-20230731 (https://download.01.org/0day-ci/archive/20230804/202308040120.7KQxScIs-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040120.7KQxScIs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040120.7KQxScIs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/rockchip/clk-gate-link.c:50:5: warning: no previous prototype for function 'clk_gate_link_prepare' [-Wmissing-prototypes]
      50 | int clk_gate_link_prepare(struct clk_hw *hw)
         |     ^
   drivers/clk/rockchip/clk-gate-link.c:50:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      50 | int clk_gate_link_prepare(struct clk_hw *hw)
         | ^
         | static 
>> drivers/clk/rockchip/clk-gate-link.c:57:6: warning: no previous prototype for function 'clk_gate_link_unprepare' [-Wmissing-prototypes]
      57 | void clk_gate_link_unprepare(struct clk_hw *hw)
         |      ^
   drivers/clk/rockchip/clk-gate-link.c:57:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      57 | void clk_gate_link_unprepare(struct clk_hw *hw)
         | ^
         | static 
   2 warnings generated.


vim +/clk_gate_link_prepare +50 drivers/clk/rockchip/clk-gate-link.c

    49	
  > 50	int clk_gate_link_prepare(struct clk_hw *hw)
    51	{
    52		struct clk_gate_link *gate = to_clk_gate_link(to_clk_gate(hw));
    53	
    54		return clk_prepare(gate->link);
    55	}
    56	
  > 57	void clk_gate_link_unprepare(struct clk_hw *hw)
    58	{
    59		struct clk_gate_link *gate = to_clk_gate_link(to_clk_gate(hw));
    60	
    61		clk_unprepare(gate->link);
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
