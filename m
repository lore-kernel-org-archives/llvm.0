Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76794179
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 00:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660176433; x=1691712433;
  h=date:from:cc:subject:message-id:mime-version;
  bh=sH2Fr/am8To4OR+YfB0fk0PpzS0uCH7XysXWpPZjKhA=;
  b=L8HXjoWAlV6jAPZEabJdqr8e3ugnCbRjo2agc+Zvax98wMjuHxrc8G/z
   C36Lf8Hh4W19OQ+ib7z0SSxKJ8G7uxa6ntJPEVO4W8H36kxULZ/w4qsdU
   NXuGNes8Elbh6dZFHOAnLaRUGVYKjpcf543z1wQc0TNraFDo3/40X6nZg
   UBhe1S1+S9ogrehq9WcLTNXrJfJ/LWP1geahBoHlnhU9RcoO2rBQDskTI
   rwru0c84vr9nCaUtrwJTJoN0QZBi3vuTAKj7sF6u/Q4KTxyLHumxzaqFx
   qPcl7usIPSjlPNj/ofCkdvyhHeNtAam2hL9Ugb18nmne3QDuX/+aE0VuL
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="352961063"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="352961063"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2022 17:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="673485186"
Received: from lkp-server02.sh.intel.com (HELO 5d6b42aa80b8) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Aug 2022 17:07:11 -0700
Received: from kbuild by 5d6b42aa80b8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLvjD-0000se-0S;
	Thu, 11 Aug 2022 00:07:11 +0000
Date: Thu, 11 Aug 2022 08:06:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:linux-5.15.y 8980/9027] ld.lld: error:
 init/built-in.a(main.o):(function rcu_lock_acquire: .text+0x51a): relocation
 R_RISCV_HI20 out of range: 530618 is not in [-524288, 524287]; references
 rcu_lock_map
Message-ID: <202208110738.IwvFJk7c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Michal Maloszewski <michal.maloszewski@intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Dawid Lukwinski <dawid.lukwinski@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
head:   9c5eacc2ad1f605c31c69d9e2436823ada99f1dc
commit: 186fcdb68f42ef13733cef5d1be4fdfc07b8935d [8980/9027] i40e: Fix interface init with MSI interrupts (no MSI-X)
config: riscv-randconfig-r002-20220810 (https://download.01.org/0day-ci/archive/20220811/202208110738.IwvFJk7c-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=186fcdb68f42ef13733cef5d1be4fdfc07b8935d
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.15.y
        git checkout 186fcdb68f42ef13733cef5d1be4fdfc07b8935d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(main.o):(function rcu_lock_acquire: .text+0x51a): relocation R_RISCV_HI20 out of range: 530618 is not in [-524288, 524287]; references rcu_lock_map
   >>> referenced by main.c
   >>> defined in kernel/built-in.a(rcu/update.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function rcu_lock_acquire: .text+0x522): relocation R_RISCV_HI20 out of range: 524289 is not in [-524288, 524287]; references .Ltmp8
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function rcu_lock_release: .text+0x54c): relocation R_RISCV_HI20 out of range: 530618 is not in [-524288, 524287]; references rcu_lock_map
   >>> referenced by main.c
   >>> defined in kernel/built-in.a(rcu/update.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function rcu_lock_release: .text+0x554): relocation R_RISCV_HI20 out of range: 524289 is not in [-524288, 524287]; references .Ltmp9
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
