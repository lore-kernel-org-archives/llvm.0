Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BE67E;
	Sat, 27 May 2023 07:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685172359; x=1716708359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aoz7yY3kXGA4c6y1mxxRSISl9xM5SDY46Oyq8TBzCHM=;
  b=DOAES2KXBSSyGtneHUTTqIjt9Nic4RTgCyIQ4+D+QIQngq2YN2G7orHl
   w+pQP7jmlTH9XuzHBUKwwGZf5Y665+16H/OYcloG1pzu0YNNJMdU1+3jW
   oj8wR9qK3AxIHMGZa/d3s2+IbS2VrNK9WIKeqOv18y8qVCUVcn0OB8Qai
   zBAzZnI1+8DB7seDKwMyMv+mpgf4unPYgP5jBHzyvno0P/aeU7y1ZVYWY
   nY1U6Lh/5kmCy7seCWEZreKdVxoICO1BYkBr0KNkfQ4c2Sq6krxTCpKyu
   gm+aR4scp6KenMAL+JaSZ2tf1Dm3JwZ5CDwY97FKo2xd4kHHDMNSH5buy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="354386492"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="354386492"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 00:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="770541550"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="770541550"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 May 2023 00:25:56 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2oJH-000Jq0-17;
	Sat, 27 May 2023 07:25:55 +0000
Date: Sat, 27 May 2023 15:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 8/27] lib/fw_table.c:59:3: error: expected expression
Message-ID: <202305271540.oiKyDRcZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   36e73b13967bf8146fe28cc8bea6706944eb564c
commit: b7e30c45269bc274639656da29b2692c64d25455 [8/27] lib/firmware_table: tables: Add CDAT table parsing support
config: i386-randconfig-r033-20230525 (https://download.01.org/0day-ci/archive/20230527/202305271540.oiKyDRcZ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=b7e30c45269bc274639656da29b2692c64d25455
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout b7e30c45269bc274639656da29b2692c64d25455
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305271540.oiKyDRcZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/fw_table.c:59:3: error: expected expression
                   __le16 length = (__force __le16)entry->hdr->cdat.length;
                   ^
>> lib/fw_table.c:61:22: error: use of undeclared identifier 'length'
                   return le16_to_cpu(length);
                                      ^
   include/linux/byteorder/generic.h:91:21: note: expanded from macro 'le16_to_cpu'
   #define le16_to_cpu __le16_to_cpu
                       ^
   2 errors generated.


vim +59 lib/fw_table.c

    45	
    46	static unsigned long __init_or_fwtbllib
    47	fwtbl_get_entry_length(struct fwtbl_subtable_entry *entry)
    48	{
    49		switch (entry->type) {
    50		case ACPI_SUBTABLE_COMMON:
    51			return entry->hdr->common.length;
    52		case ACPI_SUBTABLE_HMAT:
    53			return entry->hdr->hmat.length;
    54		case ACPI_SUBTABLE_PRMT:
    55			return entry->hdr->prmt.length;
    56		case ACPI_SUBTABLE_CEDT:
    57			return entry->hdr->cedt.length;
    58		case CDAT_SUBTABLE:
  > 59			__le16 length = (__force __le16)entry->hdr->cdat.length;
    60	
  > 61			return le16_to_cpu(length);
    62		}
    63		return 0;
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
