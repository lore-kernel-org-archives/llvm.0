Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB153D62
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 14:38:26 +0000 (UTC)
Received: from [185.122.133.20] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oYTWs-0006bn-QY; Wed, 14 Sep 2022 16:38:18 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lkp@intel.com, palmer@rivosinc.com, Conor.Dooley@microchip.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-mm@kvack.org
Subject: Re: [linux-next:master 6256/7172] arch/riscv/errata/thead/errata.c:40:2: error: use of undeclared identifier 'riscv_cbom_block_size'
Date: Wed, 14 Sep 2022 16:38:17 +0200
Message-ID: <2646330.mvXUDI8C0e@phil>
In-Reply-To: <2d0d917d-9bc8-a1e4-1569-af3921a18139@microchip.com>
References: <202209141913.Nxzv3hwM-lkp@intel.com> <2d0d917d-9bc8-a1e4-1569-af3921a18139@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Conor,

Am Mittwoch, 14. September 2022, 14:27:19 CEST schrieb Conor.Dooley@microchip.com:
> @Heiko is this the same issue that LKP previously complained about
> that you have a fix for, or should I sent a fix for it tonight?

this one is new, but the cause is similar (building t-head cache ops but not
zicbom cache ops).

I've just sent a patch to move the definition to the more generic block in
cacheflush.h


Heiko

> On 14/09/2022 12:37, kernel test robot wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   f117c01187301a087412bd6697fcf5463cb427d8
> > commit: 8f7e001e0325de63a42f23342ac3b8139150c5cf [6256/7172] RISC-V: Clean up the Zicbom block size probing
> > config: riscv-randconfig-r042-20220914 (https://download.01.org/0day-ci/archive/20220914/202209141913.Nxzv3hwM-lkp@intel.com/config)
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
> > reproduce (this is a W=1 build):
> >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >          chmod +x ~/bin/make.cross
> >          # install riscv cross compiling tool for clang build
> >          # apt-get install binutils-riscv64-linux-gnu
> >          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=8f7e001e0325de63a42f23342ac3b8139150c5cf
> >          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >          git fetch --no-tags linux-next master
> >          git checkout 8f7e001e0325de63a42f23342ac3b8139150c5cf
> >          # save the config file
> >          mkdir build_dir && cp config build_dir/.config
> >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/errata/thead/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> >>> arch/riscv/errata/thead/errata.c:40:2: error: use of undeclared identifier 'riscv_cbom_block_size'
> >             riscv_cbom_block_size = L1_CACHE_BYTES;
> >             ^
> >     1 error generated.
> > 
> > 
> > vim +/riscv_cbom_block_size +40 arch/riscv/errata/thead/errata.c
> > 
> >      29
> >      30  static bool errata_probe_cmo(unsigned int stage,
> >      31                               unsigned long arch_id, unsigned long impid)
> >      32  {
> >      33  #ifdef CONFIG_ERRATA_THEAD_CMO
> >      34          if (arch_id != 0 || impid != 0)
> >      35                  return false;
> >      36
> >      37          if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> >      38                  return false;
> >      39
> >    > 40          riscv_cbom_block_size = L1_CACHE_BYTES;
> >      41          riscv_noncoherent_supported();
> >      42          return true;
> >      43  #else
> >      44          return false;
> >      45  #endif
> >      46  }
> >      47
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://01.org/lkp
> 
> 




