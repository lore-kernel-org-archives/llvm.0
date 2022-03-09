Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAD917C0
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 23:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D513C340E8;
	Wed,  9 Mar 2022 23:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646867392;
	bh=ibHZIpp5hEnoCg+q6FN9PuIaT2D/qY/GSosZEsHZ2tg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=afb38Szwtnh5oFv17U8cT3v2S5KMa3QRhS+q5FQbRxe7JHYT3NhJQJki4rTuLxswW
	 0qCh1fHS8MANQH8HeheJisbcT8i7df3kTd+cndZzquefKyfGLsqf+NmgHMRofZs9QQ
	 5MO1K1l8btLqsExCflkVGk+2Kv+7M1IysDylbohfUtcb92VWvN6M/OdQOk593Q7apB
	 S1olQJxl3DGtaVmqlizg7730+1n0cojCShDMYqT83yUL0iPCWov/uzymg/pmk15KQe
	 91d0tTDn13RuH+4/mCaLsM3l/xdYxeWbcu3R8ITcvhSv2xPAwIRPmf2xG0FurClY6E
	 49WI3dJFpRtMw==
Date: Wed, 9 Mar 2022 17:09:50 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [lpieralisi-pci:pci/rcar 2/2]
 drivers/pci/controller/pcie-rcar-host.c:139:3: error: instruction requires:
 data-barriers
Message-ID: <20220309230950.GA89632@bhelgaas>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202203091741.IetDk7a7-lkp@intel.com>

On Wed, Mar 09, 2022 at 05:04:28PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/pci.git pci/rcar
> head:   9775965dbae50a04f12879179d6d6fb58f240d6b
> commit: 9775965dbae50a04f12879179d6d6fb58f240d6b [2/2] PCI: rcar: Use PCI_SET_ERROR_RESPONSE after read which triggered an exception
> config: arm-randconfig-c002-20220307 (https://download.01.org/0day-ci/archive/20220309/202203091741.IetDk7a7-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/pci.git/commit/?id=9775965dbae50a04f12879179d6d6fb58f240d6b
>         git remote add lpieralisi-pci https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/pci.git
>         git fetch --no-tags lpieralisi-pci pci/rcar
>         git checkout 9775965dbae50a04f12879179d6d6fb58f240d6b
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/pci/controller/pcie-rcar-host.c:139:3: error: instruction requires: data-barriers
>                    __rcar_pci_rw_reg_workaround("str")
>                    ^
>    drivers/pci/controller/pcie-rcar-host.c:120:4: note: expanded from macro '__rcar_pci_rw_reg_workaround'
>                    "2:     isb\n"                                          \
>                     ^
>    <inline asm>:2:4: note: instantiated into assembly here
>    2:      isb
>            ^
>    drivers/pci/controller/pcie-rcar-host.c:153:3: error: instruction requires: data-barriers
>                    __rcar_pci_rw_reg_workaround("ldr")
>                    ^
>    drivers/pci/controller/pcie-rcar-host.c:120:4: note: expanded from macro '__rcar_pci_rw_reg_workaround'
>                    "2:     isb\n"                                          \
>                     ^
>    <inline asm>:2:4: note: instantiated into assembly here
>    2:      isb
>            ^
>    2 errors generated.

I don't know how to fix this.  We currently have these on Lorenzo's
pci/rcar branch:

  9775965dbae5 ("PCI: rcar: Use PCI_SET_ERROR_RESPONSE after read which triggered an exception")
  de6b5097f58b ("PCI: rcar: Finish transition to L1 state in rcar_pcie_config_access()")

To avoid this error, for now I have cherry-picked de6b5097f58b to a
local pci/host/rcar branch and dropped 9775965dbae5.

> vim +139 drivers/pci/controller/pcie-rcar-host.c
> 
>    132	
>    133	static int rcar_pci_write_reg_workaround(struct rcar_pcie *pcie, u32 val,
>    134						 unsigned int reg)
>    135	{
>    136		int error = PCIBIOS_SUCCESSFUL;
>    137	#ifdef CONFIG_ARM
>    138		asm volatile(
>  > 139			__rcar_pci_rw_reg_workaround("str")
>    140		: "+r"(error):"r"(val), "r"(pcie->base + reg) : "memory");
>    141	#else
>    142		rcar_pci_write_reg(pcie, val, reg);
>    143	#endif
>    144		return error;
>    145	}
>    146	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
