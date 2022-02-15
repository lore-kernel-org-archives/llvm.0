Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC8D1188
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 04:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644900876; x=1676436876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ToPYTSKqgT3dHAF94OVKr+aABefwhPvEIXV8gTUWHE4=;
  b=hrE2HFQmjNbf8zn/XdBR7dTcF5qQUGanbFrMClrm2SDvqVPPIkbvVux0
   KGBnEhzUvNJhIyCmM+qqOesG+3sKqo/iq6PsywvlJZGLmoGDC58mAu5cO
   6XX2H/jbPesXURT+dkjaHIBMz13dtJZiwGSzFkirU2NGkv065nY8I20tc
   8KRtap25OQSQDa94Br/ZRNrziLNkRfhT/oiVlyFXMVsCBKmC9PiPKzKIq
   Ws+WUKp1+Jd0f8COlKarhmhhtIqiPolc3wqkuyJUtvnN2KS7shl8U3j47
   aVZhWHOAvnz2FGU0Bnk9RCcVxcNE9rEmzimpmO1ek7jdrwb+vEv0QBgGk
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="250456482"
X-IronPort-AV: E=Sophos;i="5.88,369,1635231600"; 
   d="scan'208";a="250456482"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 20:54:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,369,1635231600"; 
   d="scan'208";a="570633505"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 14 Feb 2022 20:54:33 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJprF-0009Hr-1g; Tue, 15 Feb 2022 04:54:33 +0000
Date: Tue, 15 Feb 2022 12:54:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] ata: add/use ata_taskfile::{error|status} fields
Message-ID: <202202151209.hSVAcH7A-lkp@intel.com>
References: <e99172ca-cf0e-5510-60fc-b19dc48658ac@omp.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e99172ca-cf0e-5510-60fc-b19dc48658ac@omp.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Sergey,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.17-rc4 next-20220214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sergey-Shtylyov/ata-add-use-ata_taskfile-error-status-fields/20220215-044836
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git d567f5db412ed52de0b3b3efca4a451263de6108
config: i386-buildonly-randconfig-r006-20220214 (https://download.01.org/0day-ci/archive/20220215/202202151209.hSVAcH7A-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 37f422f4ac31c8b8041c6b62065263314282dab6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5d89e7cd8ab42fd2cb6f59a7922784b0cce835bf
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sergey-Shtylyov/ata-add-use-ata_taskfile-error-status-fields/20220215-044836
        git checkout 5d89e7cd8ab42fd2cb6f59a7922784b0cce835bf
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/ata/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/ata/sata_vsc.c:203:21: error: use of undeclared identifier 'feature'; did you mean 'return'?
                   tf->hob_feature = feature >> 8;
                                     ^~~~~~~
                                     return
>> drivers/ata/sata_vsc.c:203:21: error: expected expression
   2 errors generated.


vim +203 drivers/ata/sata_vsc.c

^1da177e4c3f41 drivers/scsi/sata_vsc.c Linus Torvalds  2005-04-16  181  
^1da177e4c3f41 drivers/scsi/sata_vsc.c Linus Torvalds  2005-04-16  182  
^1da177e4c3f41 drivers/scsi/sata_vsc.c Linus Torvalds  2005-04-16  183  static void vsc_sata_tf_read(struct ata_port *ap, struct ata_taskfile *tf)
^1da177e4c3f41 drivers/scsi/sata_vsc.c Linus Torvalds  2005-04-16  184  {
^1da177e4c3f41 drivers/scsi/sata_vsc.c Linus Torvalds  2005-04-16  185  	struct ata_ioports *ioaddr = &ap->ioaddr;
5d89e7cd8ab42f drivers/ata/sata_vsc.c  Sergey Shtylyov 2022-02-14  186  	u16 nsect, lbal, lbam, lbah, error;
^1da177e4c3f41 drivers/scsi/sata_vsc.c Linus Torvalds  2005-04-16  187  
5d89e7cd8ab42f drivers/ata/sata_vsc.c  Sergey Shtylyov 2022-02-14  188  	tf->status = ata_sff_check_status(ap);
0d5ff566779f89 drivers/ata/sata_vsc.c  Tejun Heo       2007-02-01  189  	tf->device = readw(ioaddr->device_addr);
5d89e7cd8ab42f drivers/ata/sata_vsc.c  Sergey Shtylyov 2022-02-14  190  	error = readw(ioaddr->error_addr);
0d5ff566779f89 drivers/ata/sata_vsc.c  Tejun Heo       2007-02-01  191  	nsect = readw(ioaddr->nsect_addr);
0d5ff566779f89 drivers/ata/sata_vsc.c  Tejun Heo       2007-02-01  192  	lbal = readw(ioaddr->lbal_addr);
0d5ff566779f89 drivers/ata/sata_vsc.c  Tejun Heo       2007-02-01  193  	lbam = readw(ioaddr->lbam_addr);
0d5ff566779f89 drivers/ata/sata_vsc.c  Tejun Heo       2007-02-01  194  	lbah = readw(ioaddr->lbah_addr);
ac19bff25b6834 drivers/scsi/sata_vsc.c Jeff Garzik     2005-10-29  195  
5d89e7cd8ab42f drivers/ata/sata_vsc.c  Sergey Shtylyov 2022-02-14  196  	tf->error = error;
ac19bff25b6834 drivers/scsi/sata_vsc.c Jeff Garzik     2005-10-29  197  	tf->nsect = nsect;
ac19bff25b6834 drivers/scsi/sata_vsc.c Jeff Garzik     2005-10-29  198  	tf->lbal = lbal;
ac19bff25b6834 drivers/scsi/sata_vsc.c Jeff Garzik     2005-10-29  199  	tf->lbam = lbam;
ac19bff25b6834 drivers/scsi/sata_vsc.c Jeff Garzik     2005-10-29  200  	tf->lbah = lbah;
^1da177e4c3f41 drivers/scsi/sata_vsc.c Linus Torvalds  2005-04-16  201  
^1da177e4c3f41 drivers/scsi/sata_vsc.c Linus Torvalds  2005-04-16  202  	if (tf->flags & ATA_TFLAG_LBA48) {
ac19bff25b6834 drivers/scsi/sata_vsc.c Jeff Garzik     2005-10-29 @203  		tf->hob_feature = feature >> 8;
^1da177e4c3f41 drivers/scsi/sata_vsc.c Linus Torvalds  2005-04-16  204  		tf->hob_nsect = nsect >> 8;
^1da177e4c3f41 drivers/scsi/sata_vsc.c Linus Torvalds  2005-04-16  205  		tf->hob_lbal = lbal >> 8;
^1da177e4c3f41 drivers/scsi/sata_vsc.c Linus Torvalds  2005-04-16  206  		tf->hob_lbam = lbam >> 8;
^1da177e4c3f41 drivers/scsi/sata_vsc.c Linus Torvalds  2005-04-16  207  		tf->hob_lbah = lbah >> 8;
^1da177e4c3f41 drivers/scsi/sata_vsc.c Linus Torvalds  2005-04-16  208  	}
^1da177e4c3f41 drivers/scsi/sata_vsc.c Linus Torvalds  2005-04-16  209  }
^1da177e4c3f41 drivers/scsi/sata_vsc.c Linus Torvalds  2005-04-16  210  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
