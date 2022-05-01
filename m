Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3036C28EB
	for <llvm@lists.linux.dev>; Sun,  1 May 2022 13:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651411660; x=1682947660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W9XgJB0z/hlKMilWYTML4XcEaox85FAHqbX3Es+eMm0=;
  b=gVagYydBR3UenUWnzbzktN/YfracGAByCB9tvudC7ybhPaxd5Jaj7CY4
   /5n3Q8YgSQWGABUzaEttx5g3Tc3Vokua+++VSrixsXis8Ndc85Eoz2fTS
   qiSzDaSpwLbF+H0JrYTa5Vey/3V8JXMqR9jfCDaoWPMKUYR5frarmPj2k
   1Un4x3zIxu5oec2tk2GnyhY6y+srhBM3vqa56IwmWlQUPUiJtWEbzmWaU
   az7vvKhQ1p2pAvpi+6Hl4nP44R96bUtdPTa8xue4UzmRc+bDDsIF/U5HA
   fLq2g1VA7NTyqbShxFj7hov5CQF4uTDF5NhTxUiVNAX3Bob5Yg3vY/TpY
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10333"; a="254442730"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="254442730"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2022 06:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="515638649"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 May 2022 06:27:37 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nl9bs-0008mB-Nk;
	Sun, 01 May 2022 13:27:36 +0000
Date: Sun, 1 May 2022 21:26:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sumit Saxena <sumit.saxena@broadcom.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>
Subject: [linux-next:master 6711/7959]
 ./usr/include/scsi/scsi_bsg_mpi3mr.h:96:2: error: unknown type name '__le32'
Message-ID: <202205012134.OmrQqBxu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5469f0c06732a077c70a759a81f2a1f00b277694
commit: 455aac4f7a13eced7697437f348b1287d6961838 [6711/7959] scsi: mpi3mr: Move data structures/definitions from MPI headers to uapi header
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220501/202205012134.OmrQqBxu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=455aac4f7a13eced7697437f348b1287d6961838
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 455aac4f7a13eced7697437f348b1287d6961838
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD 5469f0c06732a077c70a759a81f2a1f00b277694 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/scsi/scsi_bsg_mpi3mr.h:96:2: error: unknown type name '__le32'
           __le32             information_length;
           ^
>> ./usr/include/scsi/scsi_bsg_mpi3mr.h:97:2: error: unknown type name 'u8'
           u8                 driver_signature[12];
           ^
   ./usr/include/scsi/scsi_bsg_mpi3mr.h:98:2: error: unknown type name 'u8'
           u8                 os_name[16];
           ^
   ./usr/include/scsi/scsi_bsg_mpi3mr.h:99:2: error: unknown type name 'u8'
           u8                 os_version[12];
           ^
   ./usr/include/scsi/scsi_bsg_mpi3mr.h:100:2: error: unknown type name 'u8'
           u8                 driver_name[20];
           ^
   ./usr/include/scsi/scsi_bsg_mpi3mr.h:101:2: error: unknown type name 'u8'
           u8                 driver_version[32];
           ^
   ./usr/include/scsi/scsi_bsg_mpi3mr.h:102:2: error: unknown type name 'u8'
           u8                 driver_release_date[20];
           ^
   ./usr/include/scsi/scsi_bsg_mpi3mr.h:103:2: error: unknown type name '__le32'
           __le32             driver_capabilities;
           ^
   ./usr/include/scsi/scsi_bsg_mpi3mr.h:128:2: error: unknown type name 'uint32_t'
           uint32_t adp_type;
           ^
   ./usr/include/scsi/scsi_bsg_mpi3mr.h:129:2: error: unknown type name 'uint32_t'
           uint32_t rsvd1;
           ^
   ./usr/include/scsi/scsi_bsg_mpi3mr.h:130:2: error: unknown type name 'uint32_t'
           uint32_t pci_dev_id;
           ^
   ./usr/include/scsi/scsi_bsg_mpi3mr.h:131:2: error: unknown type name 'uint32_t'
           uint32_t pci_dev_hw_rev;
           ^
   ./usr/include/scsi/scsi_bsg_mpi3mr.h:132:2: error: unknown type name 'uint32_t'
           uint32_t pci_subsys_dev_id;
           ^
   ./usr/include/scsi/scsi_bsg_mpi3mr.h:133:2: error: unknown type name 'uint32_t'
           uint32_t pci_subsys_ven_id;
           ^
   ./usr/include/scsi/scsi_bsg_mpi3mr.h:134:2: error: unknown type name 'uint32_t'
           uint32_t pci_dev:5;
           ^
   ./usr/include/scsi/scsi_bsg_mpi3mr.h:135:2: error: unknown type name 'uint32_t'
           uint32_t pci_func:3;
           ^
   ./usr/include/scsi/scsi_bsg_mpi3mr.h:136:2: error: unknown type name 'uint32_t'
           uint32_t pci_bus:8;
           ^
   ./usr/include/scsi/scsi_bsg_mpi3mr.h:137:2: error: unknown type name 'uint16_t'
           uint16_t rsvd2;
           ^
   ./usr/include/scsi/scsi_bsg_mpi3mr.h:138:2: error: unknown type name 'uint32_t'
           uint32_t pci_seg_id;
           ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
