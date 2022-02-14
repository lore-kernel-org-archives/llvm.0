Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A5BA2C
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 17:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644859216; x=1676395216;
  h=date:from:cc:subject:message-id:mime-version;
  bh=zV+5iJNX/+4UhRcz+aj/ZEWHZQcCBStSKpsVmNedm+U=;
  b=f0DnUnZumXsGpIz+ICjT4KTKxkqPfsE65U/c5D++HwngBhsKSaJrtvVE
   EL0hYl7u80FYEdmb9VD/MN8M9WVeH3RC384fsawKxAKo1aKJ9Xx0mBqL0
   wRWxPV4WX5OJrSu4wJHfMwcKQssEKK2rRD315IZE7aheb7ByLu03mlUpt
   W/KByxsMC3FxH2nr4SZmnvI98SESJplmcoWhGu623R3ZFvgqxZkCaWYSp
   3oIPXleBw2hkWim225UJM5F9A5ThfyVjzcQvVr5guIMr3Ci172UYUb3Qi
   8rKNT/SEH20D4b8fa694Abt9T3m1BEp6QROtTzrkEjRluu4X9wTBrCzbT
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="237548045"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="237548045"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 09:20:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="703191555"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Feb 2022 09:20:14 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJf1K-0008nA-49; Mon, 14 Feb 2022 17:20:14 +0000
Date: Tue, 15 Feb 2022 01:19:32 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 842/5679]
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.o: warning: objtool:
 csiphy_lanes_enable() falls through to next function csiphy_lanes_disable()
Message-ID: <202202142312.dSKZUCkF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jonathan Marek <jonathan@marek.ca>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Robert Foss <robert.foss@linaro.org>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   259cbfc98c55ba3b6ef6e61fb7cfc3751dfded1e
commit: 53655d2a0ff295deee5c4b40fe7fc8851bc672e6 [842/5679] media: camss: csiphy-3ph: add support for SM8250 CSI DPHY
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220214/202202142312.dSKZUCkF-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=53655d2a0ff295deee5c4b40fe7fc8851bc672e6
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 53655d2a0ff295deee5c4b40fe7fc8851bc672e6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.o: warning: objtool: csiphy_lanes_enable() falls through to next function csiphy_lanes_disable()

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
