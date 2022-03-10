Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEC97F
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 00:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4C1C340E8;
	Thu, 10 Mar 2022 00:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646871538;
	bh=GVv4mxk8ewyfsCZHIqin2zrYrFLWh4W9/mCezQgG92A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oz24NHQU2jKUym5bzo7Ln16IBL7cFLQWQleV2JSNkC73vGPTDtXfGZ10C9WC98Afh
	 adRpLhGZT2GyixgH6DxkqpBNleHOKmlADxgK0xXhU2c2knOlIjhW7MNOAoXmYL9iz7
	 E6Ea7kxuB35ctEiqOb9qjpndSq0DGCEBFYPcUrfkjOmlARbfR4QiUjfD+ScAiw9uL1
	 9DfmmLw978Q0AH1Nv3fhEd9jWOdPDZzzMv847orxxTCzoZfv0NYoyjSZb+4HDE/aUT
	 K9M/Kx/34K6Gl5tPi070CayBP70UiyfGGCJ92PGF0lNMsEm6t9YgicdUnyQvHzow52
	 KJcCD2p48RPyQ==
Date: Wed, 9 Mar 2022 17:18:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [lpieralisi-pci:pci/rcar 2/2]
 drivers/pci/controller/pcie-rcar-host.c:139:3: error: instruction requires:
 data-barriers
Message-ID: <YilD68QeKpgJG1W2@dev-arch.thelio-3990X>
References: <202203091741.IetDk7a7-lkp@intel.com>
 <20220309230950.GA89632@bhelgaas>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309230950.GA89632@bhelgaas>

Hi Bjorn,

On Wed, Mar 09, 2022 at 05:09:50PM -0600, Bjorn Helgaas wrote:
> On Wed, Mar 09, 2022 at 05:04:28PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/pci.git pci/rcar
> > head:   9775965dbae50a04f12879179d6d6fb58f240d6b
> > commit: 9775965dbae50a04f12879179d6d6fb58f240d6b [2/2] PCI: rcar: Use PCI_SET_ERROR_RESPONSE after read which triggered an exception
> > config: arm-randconfig-c002-20220307 (https://download.01.org/0day-ci/archive/20220309/202203091741.IetDk7a7-lkp@intel.com/config)
> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm cross compiling tool for clang build
> >         # apt-get install binutils-arm-linux-gnueabi
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/pci.git/commit/?id=9775965dbae50a04f12879179d6d6fb58f240d6b
> >         git remote add lpieralisi-pci https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/pci.git
> >         git fetch --no-tags lpieralisi-pci pci/rcar
> >         git checkout 9775965dbae50a04f12879179d6d6fb58f240d6b
> >         # save the config file to linux build tree
> >         mkdir build_dir
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> > 
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> drivers/pci/controller/pcie-rcar-host.c:139:3: error: instruction requires: data-barriers
> >                    __rcar_pci_rw_reg_workaround("str")
> >                    ^
> >    drivers/pci/controller/pcie-rcar-host.c:120:4: note: expanded from macro '__rcar_pci_rw_reg_workaround'
> >                    "2:     isb\n"                                          \
> >                     ^
> >    <inline asm>:2:4: note: instantiated into assembly here
> >    2:      isb
> >            ^
> >    drivers/pci/controller/pcie-rcar-host.c:153:3: error: instruction requires: data-barriers
> >                    __rcar_pci_rw_reg_workaround("ldr")
> >                    ^
> >    drivers/pci/controller/pcie-rcar-host.c:120:4: note: expanded from macro '__rcar_pci_rw_reg_workaround'
> >                    "2:     isb\n"                                          \
> >                     ^
> >    <inline asm>:2:4: note: instantiated into assembly here
> >    2:      isb
> >            ^
> >    2 errors generated.
> 
> I don't know how to fix this.  We currently have these on Lorenzo's
> pci/rcar branch:
> 
>   9775965dbae5 ("PCI: rcar: Use PCI_SET_ERROR_RESPONSE after read which triggered an exception")
>   de6b5097f58b ("PCI: rcar: Finish transition to L1 state in rcar_pcie_config_access()")
> 
> To avoid this error, for now I have cherry-picked de6b5097f58b to a
> local pci/host/rcar branch and dropped 9775965dbae5.

FWIW, this is not clang specific, the same configuration blows up with
GCC 11.2.0 as well:

$ make -skj"$(nproc)" \
       ARCH=arm \
       CROSS_COMPILE=arm-linux-gnueabi- \
       olddefconfig drivers/pci/controller/pcie-rcar-host.o
/tmp/ccz8ybtm.s: Assembler messages:
/tmp/ccz8ybtm.s:742: Error: selected processor does not support `isb' in ARM mode
/tmp/ccz8ybtm.s:812: Error: selected processor does not support `isb' in ARM mode
make[4]: *** [scripts/Makefile.build:288: drivers/pci/controller/pcie-rcar-host.o] Error 1

$ rg CONFIG_CPU_32 .config
289:CONFIG_CPU_32v4=y

It does not look like isb can be used with this configuration, at least
if I understand arch/arm/include/asm/barrier.h correctly.

Cheers,
Nathan
