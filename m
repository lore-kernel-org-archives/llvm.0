Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC342C9D
	for <llvm@lists.linux.dev>; Sat, 15 Jan 2022 17:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642268732; x=1673804732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HaFEU8hV9XanfxSPVMYzLo4IVzpcGG8nbFal/ymcWyA=;
  b=i1d1YHMn1Ed4y0r7dbuL+1jw1TXywojl7BDqPSy+eFzHaWMNi5eBEJEd
   /cmszUL5maYWzZ0bbJkbfLMguVVPAvL7Xe1ZeDpDMb1UV8MUtzA3GYnoL
   vcogU71CgTw4OcUP8b0C8JHEWwFPM86CdOa6O6ri+dBNnyBELXBrY5tLL
   aZsU423/c+CWfyaGiVm26+8EqKJy5ZTQ/7KxlfusRHrF6s+nTTRmiFSZ/
   7BnqIyc9L6t17zKFFobOxYFopOLLzvPdGEVte/61moC8QyW+fSyRNbofe
   pYiUtFzYh2iDEe4YpbyFbjjTOffjy7J01NgIDJvV6fQ/WrAbVlwso4lIO
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10228"; a="305161043"
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600"; 
   d="scan'208";a="305161043"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2022 09:45:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,290,1635231600"; 
   d="scan'208";a="559849049"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Jan 2022 09:45:30 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n8n7J-000AAa-JD; Sat, 15 Jan 2022 17:45:29 +0000
Date: Sun, 16 Jan 2022 01:44:32 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [linux-next:master 3378/12347] ld.lld: error: undefined symbol:
 pci_remap_iospace
Message-ID: <202201160131.H7iDdOd3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Pali,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bd8d9cef2a7932e688ca267ea1adf5ea6557c777
commit: bc02973a06a6c74374edeb6d73ed4bde99b37456 [3378/12347] arm: ioremap: Implement standard PCI function pci_remap_iospace()
config: arm-randconfig-r004-20220114 (https://download.01.org/0day-ci/archive/20220116/202201160131.H7iDdOd3-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 650fc40b6d8d9a5869b4fca525d5f237b0ee2803)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bc02973a06a6c74374edeb6d73ed4bde99b37456
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout bc02973a06a6c74374edeb6d73ed4bde99b37456
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld.lld: warning: lld uses blx instruction, no object with architecture supporting feature detected
   ld.lld: warning: lld uses blx instruction, no object with architecture supporting feature detected
>> ld.lld: error: undefined symbol: pci_remap_iospace
   >>> referenced by pci.c
   >>>               pci/pci.o:(devm_pci_remap_iospace) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
