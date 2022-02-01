Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FABE2C9C
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 13:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643723208; x=1675259208;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=alu1H9qvEw3HFlKI7urAlQj1NT+EXGA6doXsiFrrJ64=;
  b=j7D+M9ZF0QPypxaNk/zX4tKbaxK6F4drnONNjGk0A8Gz8z4RixHoXl4p
   Bcsy/98YWm5Q2/A+5nwoCyvPHkBmofK84SjUiRiqcbOx0gi7FmpSFUkXZ
   1pVlC+9xbrGW/wOMp6Lf8cJUbMIWhRtuWpaXPUXtGKOTIVumgKIGS5uMR
   lNqKENZ8LFrZJGYhbK8HzsVzmXJT4tOsIiUvaPwccSiBxHvyBdCGWDqVl
   6VGXFaHgHpoeH8Ozpzr1g+v9lTh/7u03ie+NlMoCbT0Nmi1JUkdqHhqSN
   V0F62vWuAHQ3Nz9qQm7TjJ/YvocNqbH8vNnGBr5UI83sayul+ArFW/vJJ
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247462106"
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; 
   d="scan'208";a="247462106"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 05:46:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; 
   d="scan'208";a="619793915"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Feb 2022 05:46:44 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEtUZ-000TKG-SL; Tue, 01 Feb 2022 13:46:43 +0000
Date: Tue, 1 Feb 2022 21:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: marek.vasut@gmail.com, linux-pci@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <helgaas@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] PCI: rcar: Use PCI_SET_ERROR_RESPONSE after read
 which triggered an exception
Message-ID: <202202012118.qgdNW3Ra-lkp@intel.com>
References: <20220129043837.172126-2-marek.vasut@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129043837.172126-2-marek.vasut@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,

I love your patch! Yet something to improve:

[auto build test ERROR on helgaas-pci/next]
[also build test ERROR on v5.17-rc2 next-20220131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/marek-vasut-gmail-com/PCI-rcar-Finish-transition-to-L1-state-in-rcar_pcie_config_access/20220129-124033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
config: arm-randconfig-c002-20220201 (https://download.01.org/0day-ci/archive/20220201/202202012118.qgdNW3Ra-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/88177fcc2d6d4acbea59c90839882f70b7b774a1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review marek-vasut-gmail-com/PCI-rcar-Finish-transition-to-L1-state-in-rcar_pcie_config_access/20220129-124033
        git checkout 88177fcc2d6d4acbea59c90839882f70b7b774a1
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/pci/controller/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/pci/controller/pcie-rcar-host.c:133:5: warning: no previous prototype for function 'rcar_pci_write_reg_workaround' [-Wmissing-prototypes]
   int rcar_pci_write_reg_workaround(struct rcar_pcie *pcie, u32 val, unsigned int reg)
       ^
   drivers/pci/controller/pcie-rcar-host.c:133:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int rcar_pci_write_reg_workaround(struct rcar_pcie *pcie, u32 val, unsigned int reg)
   ^
   static 
   drivers/pci/controller/pcie-rcar-host.c:146:5: warning: no previous prototype for function 'rcar_pci_read_reg_workaround' [-Wmissing-prototypes]
   int rcar_pci_read_reg_workaround(struct rcar_pcie *pcie, u32 *val, unsigned int reg)
       ^
   drivers/pci/controller/pcie-rcar-host.c:146:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int rcar_pci_read_reg_workaround(struct rcar_pcie *pcie, u32 *val, unsigned int reg)
   ^
   static 
>> drivers/pci/controller/pcie-rcar-host.c:138:3: error: instruction requires: data-barriers
                   __rcar_pci_rw_reg_workaround("str")
                   ^
   drivers/pci/controller/pcie-rcar-host.c:120:4: note: expanded from macro '__rcar_pci_rw_reg_workaround'
                   "2:     isb\n"                                          \
                    ^
   <inline asm>:2:4: note: instantiated into assembly here
   2:      isb
           ^
   drivers/pci/controller/pcie-rcar-host.c:151:3: error: instruction requires: data-barriers
                   __rcar_pci_rw_reg_workaround("ldr")
                   ^
   drivers/pci/controller/pcie-rcar-host.c:120:4: note: expanded from macro '__rcar_pci_rw_reg_workaround'
                   "2:     isb\n"                                          \
                    ^
   <inline asm>:2:4: note: instantiated into assembly here
   2:      isb
           ^
>> drivers/pci/controller/pcie-rcar-host.c:138:3: error: instruction requires: data-barriers
                   __rcar_pci_rw_reg_workaround("str")
                   ^
   drivers/pci/controller/pcie-rcar-host.c:120:4: note: expanded from macro '__rcar_pci_rw_reg_workaround'
                   "2:     isb\n"                                          \
                    ^
   <inline asm>:2:4: note: instantiated into assembly here
   2:      isb
           ^
   drivers/pci/controller/pcie-rcar-host.c:151:3: error: instruction requires: data-barriers
                   __rcar_pci_rw_reg_workaround("ldr")
                   ^
   drivers/pci/controller/pcie-rcar-host.c:120:4: note: expanded from macro '__rcar_pci_rw_reg_workaround'
                   "2:     isb\n"                                          \
                    ^
   <inline asm>:2:4: note: instantiated into assembly here
   2:      isb
           ^
   2 warnings and 4 errors generated.


vim +138 drivers/pci/controller/pcie-rcar-host.c

   132	
   133	int rcar_pci_write_reg_workaround(struct rcar_pcie *pcie, u32 val, unsigned int reg)
   134	{
   135		int error = PCIBIOS_SUCCESSFUL;
   136	#ifdef CONFIG_ARM
   137		asm volatile(
 > 138			__rcar_pci_rw_reg_workaround("str")
   139		: "+r"(error):"r"(val), "r"(pcie->base + reg) : "memory");
   140	#else
   141		rcar_pci_write_reg(pcie, val, reg);
   142	#endif
   143		return error;
   144	}
   145	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
