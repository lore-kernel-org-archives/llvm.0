Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFB2136A
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 04:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655181375; x=1686717375;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+NDgUjBHzhvKS3KEEHJCiS336jh3KE4+YEAhDwndiGo=;
  b=OlYmpbQdw/ulNWLxmdqYgXO6VPnkTtSTE0bQ5SlheYaoacW0ThVAC65k
   vR683ekhUkR83P/xOiTyVrLt1pL9lidvu9V/3wnZ5HQiUjRqC/NBbZ0F1
   HhRdhICZw+R1845Z8coiPIB73Kejk9gDkOSFqEY27eWv24G7FF592wtGm
   mfwzI3ccQCyXVBAiyWlofqA/cPATh7B5C+4FYK1sDFvd8CtS1qH0GmhBn
   lC6deGsCQpG9Oi8XPx6ALPJnIRSiB4ILWq/52JfbW5MmuAOBRY2ejXnBS
   K0EMt4i139YiWsR2/Yt867rxA9wL63waWcAspO3BVuw1e+giGWVGXEdFQ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="279542719"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="279542719"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 21:36:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="588207178"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jun 2022 21:36:14 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0yHl-000LTw-Ep;
	Tue, 14 Jun 2022 04:36:13 +0000
Date: Tue, 14 Jun 2022 12:35:24 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.19-q-release
 5202/7636] fs/crypto/keyinfo.o: warning: objtool: gelf_getehdr: invalid
 `Elf' handle
Message-ID: <202206141204.mIgNdOaY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-4.19-q-release
head:   1a3500dc59324a85c20f025cfa6485a1a0debbdf
commit: 205cde74877d624ef7d24a6692e6e9337b19a541 [5202/7636] ANDROID: x86: add support for CONFIG_LTO_CLANG
config: x86_64-randconfig-a005-20220613 (https://download.01.org/0day-ci/archive/20220614/202206141204.mIgNdOaY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d378268ead93c85803c270277f0243737b536ae7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/205cde74877d624ef7d24a6692e6e9337b19a541
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-4.19-q-release
        git checkout 205cde74877d624ef7d24a6692e6e9337b19a541
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/ fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/crypto/keyinfo.o: warning: objtool: gelf_getehdr: invalid `Elf' handle
--
>> drivers/gpu/drm/virtio/virtgpu_drm_bus.o: warning: objtool: gelf_getehdr: invalid `Elf' handle

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for STACK_VALIDATION
   Depends on HAVE_STACK_VALIDATION
   Selected by
   - UNWINDER_ORC && <choice> && X86_64

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
