Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E479368
	for <llvm@lists.linux.dev>; Thu,  5 May 2022 10:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651747080; x=1683283080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wV603nhnDa9kVJXVMArqUFut9nS+nq9L91q9VkdDoSY=;
  b=jbdmEJzU+ZRIgm/eeWocgM6OivJAhsj0Oo3IjkCFPfEhPXbreyVfV8VT
   3Q4H+0+ZhYFjfj0zNQN0o28y61PAzo8y95rAJDiHMVaQgfLKOUmLgzc7A
   YT6FdOSXAdCci+3RhLBuvuNPKQwBYoPWGv6RkFQD4zycivariH/7b0xHg
   uFufqlOPXNbiUYioKzLs3VwAZ0VuHWchsDe9W4FyxVGUDo3sj/3APBUko
   P+5hcFMLdpvipQyqlO6SNpjmj/zvQE1FdgFO7nGEHjQirmzIyYyLRkoGF
   yHUbh/3JQ4aV3SgsamHHu4pDmLrf8337cTA8URtxe0wbBd4brDNQPzlBp
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="266909881"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="266909881"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 03:37:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="664911279"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 May 2022 03:37:58 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmYrt-000CIL-LW;
	Thu, 05 May 2022 10:37:57 +0000
Date: Thu, 5 May 2022 18:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: Al Cooper <alcooperx@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [ulfh-mmc:next 43/52] drivers/mmc/host/sdhci-brcmstb.c:51:6:
 warning: no previous prototype for function 'brcmstb_reset'
Message-ID: <202205051804.E5PoKkYL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   0662d797d5962fd0a21aceb0cf651a6ff308e924
commit: 6bcc55fe648b860ef0c2b8dc23adc05bcddb93c2 [43/52] mmc: sdhci-brcmstb: Enable Clock Gating to save power
config: mips-bmips_stb_defconfig (https://download.01.org/0day-ci/archive/20220505/202205051804.E5PoKkYL-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git/commit/?id=6bcc55fe648b860ef0c2b8dc23adc05bcddb93c2
        git remote add ulfh-mmc git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
        git fetch --no-tags ulfh-mmc next
        git checkout 6bcc55fe648b860ef0c2b8dc23adc05bcddb93c2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/mmc/host/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/sdhci-brcmstb.c:51:6: warning: no previous prototype for function 'brcmstb_reset' [-Wmissing-prototypes]
   void brcmstb_reset(struct sdhci_host *host, u8 mask)
        ^
   drivers/mmc/host/sdhci-brcmstb.c:51:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void brcmstb_reset(struct sdhci_host *host, u8 mask)
   ^
   static 
   1 warning generated.


vim +/brcmstb_reset +51 drivers/mmc/host/sdhci-brcmstb.c

    50	
  > 51	void brcmstb_reset(struct sdhci_host *host, u8 mask)
    52	{
    53		struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
    54		struct sdhci_brcmstb_priv *priv = sdhci_pltfm_priv(pltfm_host);
    55	
    56		sdhci_reset(host, mask);
    57	
    58		/* Reset will clear this, so re-enable it */
    59		if (priv->flags & BRCMSTB_PRIV_FLAGS_GATE_CLOCK)
    60			enable_clock_gating(host);
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
