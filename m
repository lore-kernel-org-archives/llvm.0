Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96A41390;
	Tue, 21 Feb 2023 09:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676970475; x=1708506475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zJPs/yZJ0Z3+qHniUjMvIvwFwEPkmHUhCRPAWTC7Zfk=;
  b=SohkstEmzlCB88KLkESiL6QKndSRjVsgCMNxaJ7peMp32Y45x/iGgRbI
   O3tLV+P/kxeRUDyUSMvIzCwJ1OG8TbXCYvI5A61YX4m4TbGBFVMLNgLGP
   aRGQ+JHttjgGdIcBGVtjJHbbBfGnJtE0dM7nj2p4OXCB2cHfHCZbI17MY
   On0g9eMpBcavUxrpapPnaWBPB1aFfHgYQHKNY8mv/yJ7U9E1EsUmxawNf
   RAGNNKE/q5xxb+OKVQGBKIr4aB/mvzivJp2NFGxtjFtggodKLPnEX3JLE
   1trBkIRf3VPq8RYOBDfarCUFob3/Kl8x5bLwHF4x74gjFNK0M5/eMxZ76
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="332588848"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="332588848"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 01:07:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="740340947"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="740340947"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Feb 2023 01:07:54 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUOcr-000Ebt-0M;
	Tue, 21 Feb 2023 09:07:53 +0000
Date: Tue, 21 Feb 2023 17:07:12 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:objtool/core 17/17] ld.lld: error:
 sound/soc/sof/intel/mtl.o: invalid symbol index
Message-ID: <202302211626.6rSdCugw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   1a776f81bc280e34f1d432711748d9ecaaea8827
commit: 1a776f81bc280e34f1d432711748d9ecaaea8827 [17/17] objtool: Single-linked reloc_list(s)
config: x86_64-randconfig-a015-20230220 (https://download.01.org/0day-ci/archive/20230221/202302211626.6rSdCugw-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=1a776f81bc280e34f1d432711748d9ecaaea8827
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue objtool/core
        git checkout 1a776f81bc280e34f1d432711748d9ecaaea8827
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/scsi/ fs/ sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302211626.6rSdCugw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: sound/soc/sof/intel/mtl.o: invalid symbol index
--
>> ld.lld: error: drivers/scsi/aic94xx/aic94xx_seq.o: invalid symbol index
--
>> ld.lld: error: fs/ext4/balloc.o: invalid symbol index
--
>> ld.lld: error: sound/soc/sof/ipc3.o: invalid symbol index

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
