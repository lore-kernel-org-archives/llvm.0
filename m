Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8D8173
	for <llvm@lists.linux.dev>; Mon, 27 Jun 2022 00:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656288975; x=1687824975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ETjJrKM7EKk6qTo3Ymv4caPFnW5n+rV1F7mfJnOmGRw=;
  b=EcKpt91LksF/odPka4uwLxxxaO5GoW5rMCf8qsc5KZ5x2C0hr8KEWVro
   Qz2QFb2rdkLjuIrQKpE0clSLeFgWW+fKH/HC29RHI9zBRJYuZmM28C9WM
   IsX4aRjHkmk91U2GWwWCL6q0gIL4NeXioHy8gD9CTgAK19vu9Ijz4Pkty
   hXr4kVMqEdBe2LCtHGmtITEdNGWNwG5dY2i2kLCn3WtlfjOS8T+KPaLrU
   KgiELc/1Rh2DVyWLZVATfoL7UwRyRh5SGu75+iviNghtTKMTEmGQojW6G
   xRKxJetjGhRMdnyiX2UFSis+X9AwMVAY4zumUDZyNp7KVgc3WsDuCD/cR
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="282058718"
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; 
   d="scan'208";a="282058718"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2022 17:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,225,1650956400"; 
   d="scan'208";a="732083282"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Jun 2022 17:16:11 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o5cQF-0007zZ-6B;
	Mon, 27 Jun 2022 00:16:11 +0000
Date: Mon, 27 Jun 2022 08:15:20 +0800
From: kernel test robot <lkp@intel.com>
To: Ash Logan <ash@heyquark.com>, paulus@samba.org, mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu, robh+dt@kernel.org,
	benh@kernel.crashing.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	j.ne@posteo.net, linkmauve@linkmauve.fr, rw-r-r-0644@protonmail.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 06/12] powerpc: wiiu: udbg support for latteipc
Message-ID: <202206270817.dnXU7wge-lkp@intel.com>
References: <20220622131037.57604-7-ash@heyquark.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622131037.57604-7-ash@heyquark.com>

Hi Ash,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on robh/for-next linus/master v5.19-rc4 next-20220624]
[cannot apply to mpe/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ash-Logan/dt-bindings-wiiu-Document-the-Nintendo-Wii-U-devicetree/20220622-221056
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-randconfig-c003-20220626
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b0d6dd3905db145853c7c744ac92d49b00b1fa20)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/acc3ab8f224a93f1a41267aeb09dee3d2ec810fb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ash-Logan/dt-bindings-wiiu-Document-the-Nintendo-Wii-U-devicetree/20220622-221056
        git checkout acc3ab8f224a93f1a41267aeb09dee3d2ec810fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/platforms/wiiu/ drivers/usb/misc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/wiiu/udbg_latteipc.c:65:13: warning: no previous prototype for function 'latteipc_udbg_init' [-Wmissing-prototypes]
   void __init latteipc_udbg_init(void)
               ^
   arch/powerpc/platforms/wiiu/udbg_latteipc.c:65:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init latteipc_udbg_init(void)
   ^
   static 
   1 warning generated.


vim +/latteipc_udbg_init +65 arch/powerpc/platforms/wiiu/udbg_latteipc.c

    61	
    62	/*
    63	 * Latte IPC udbg support initialization.
    64	 */
  > 65	void __init latteipc_udbg_init(void)
    66	{
    67		struct device_node *np;
    68		void __iomem *ipc_io_base;
    69	
    70		if (latteipc_io_base)
    71			udbg_printf("%s: early -> final\n", __func__);
    72	
    73		np = of_find_compatible_node(NULL, NULL, "nintendo,latte-ipc");
    74		if (!np) {
    75			udbg_printf("%s: IPC node not found\n", __func__);
    76			goto out;
    77		}
    78	
    79		ipc_io_base = latteipc_udbg_setup_ipc_io_base(np);
    80		if (!ipc_io_base) {
    81			udbg_printf("%s: failed to setup IPC io base\n", __func__);
    82			goto done;
    83		}
    84	
    85		udbg_putc = latteipc_udbg_putc;
    86		udbg_printf("latteipc_udbg: ready\n");
    87	
    88	done:
    89		of_node_put(np);
    90	out:
    91		return;
    92	}
    93	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
