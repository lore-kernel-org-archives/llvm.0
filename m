Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E3E320F;
	Sun, 22 Jan 2023 23:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674429829; x=1705965829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7CJQ0jmsEt+dJReSCxVWoW2tGWdndhsW2nRcoMURKAw=;
  b=npAxR24nR0JeD36R5BZ0rR5ZZrwycjN0iWnbtFl/S7NX+k74y7KE73v4
   la/N9bvQfOiV9lmqkxtBzZ4/wZyrDAWvTlxj4CqGNdsMiieLvDmlzlT9x
   gXHaw4+hAiPb53xpbhqL2UWzUZOtnAHtXPrfYsiW4yxcFnoioeYVyVNoJ
   elkfoUwiRI9axfGl1X2psBUiC9z9k2WtITAd+FXYup7fLf4WsF2Fkssv9
   HV9lKqJ/34UtvQSeMCPiKFCE4WJ3d0yju7NVSvWWb4iTlOSHhMopCcbn/
   D1IUdUgxvGwK542PvmwsYbidZNsxKdfcrz/q+2hIKVwLPQsh6JpqTwO1E
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="412180924"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="412180924"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 15:23:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="693675428"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="693675428"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Jan 2023 15:23:45 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJjge-0005I4-2i;
	Sun, 22 Jan 2023 23:23:44 +0000
Date: Mon, 23 Jan 2023 07:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: Shazad Hussain <quic_shazhuss@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [linux-next:master 5692/6912] drivers/clk/qcom/gcc-sa8775p.c:313:32:
 warning: unused variable 'gcc_parent_map_10'
Message-ID: <202301230743.Xnut0Zvc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d514392f17fd4d386cfadde7f849d97db4ca1fb0
commit: 08c51ceb12f7ce2252513a38ad8a8ed26103a4e2 [5692/6912] clk: qcom: add the GCC driver for sa8775p
config: riscv-randconfig-c006-20230122 (https://download.01.org/0day-ci/archive/20230123/202301230743.Xnut0Zvc-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=08c51ceb12f7ce2252513a38ad8a8ed26103a4e2
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 08c51ceb12f7ce2252513a38ad8a8ed26103a4e2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/clk/qcom/ drivers/media/platform/verisilicon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/clk/qcom/gcc-sa8775p.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/clk/qcom/gcc-sa8775p.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:743:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
   #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/clk/qcom/gcc-sa8775p.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:751:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/clk/qcom/gcc-sa8775p.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
   #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/clk/qcom/gcc-sa8775p.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/clk/qcom/gcc-sa8775p.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
   #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/clk/qcom/gcc-sa8775p.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
   #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/clk/qcom/gcc-sa8775p.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/clk/qcom/gcc-sa8775p.c:313:32: warning: unused variable 'gcc_parent_map_10' [-Wunused-const-variable]
   static const struct parent_map gcc_parent_map_10[] = {
                                  ^
>> drivers/clk/qcom/gcc-sa8775p.c:318:37: warning: unused variable 'gcc_parent_data_10' [-Wunused-const-variable]
   static const struct clk_parent_data gcc_parent_data_10[] = {
                                       ^
>> drivers/clk/qcom/gcc-sa8775p.c:333:32: warning: unused variable 'gcc_parent_map_12' [-Wunused-const-variable]
   static const struct parent_map gcc_parent_map_12[] = {
                                  ^
>> drivers/clk/qcom/gcc-sa8775p.c:338:37: warning: unused variable 'gcc_parent_data_12' [-Wunused-const-variable]
   static const struct clk_parent_data gcc_parent_data_12[] = {
                                       ^
   17 warnings generated.


vim +/gcc_parent_map_10 +313 drivers/clk/qcom/gcc-sa8775p.c

   312	
 > 313	static const struct parent_map gcc_parent_map_10[] = {
   314		{ P_PCIE_0_PIPE_CLK, 0 },
   315		{ P_BI_TCXO, 2 },
   316	};
   317	
 > 318	static const struct clk_parent_data gcc_parent_data_10[] = {
   319		{ .index = DT_PCIE_0_PIPE_CLK },
   320		{ .index = DT_BI_TCXO },
   321	};
   322	
   323	static const struct parent_map gcc_parent_map_11[] = {
   324		{ P_PCIE_PHY_AUX_CLK, 1 },
   325		{ P_BI_TCXO, 2 },
   326	};
   327	
   328	static const struct clk_parent_data gcc_parent_data_11[] = {
   329		{ .index = DT_PCIE_PHY_AUX_CLK },
   330		{ .index = DT_BI_TCXO },
   331	};
   332	
 > 333	static const struct parent_map gcc_parent_map_12[] = {
   334		{ P_PCIE_1_PIPE_CLK, 0 },
   335		{ P_BI_TCXO, 2 },
   336	};
   337	
 > 338	static const struct clk_parent_data gcc_parent_data_12[] = {
   339		{ .index = DT_PCIE_1_PIPE_CLK },
   340		{ .index = DT_BI_TCXO },
   341	};
   342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
