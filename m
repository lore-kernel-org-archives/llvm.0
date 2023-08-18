Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1020380;
	Fri, 18 Aug 2023 03:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692329206; x=1723865206;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Cu/D8T16n9qA/Mgk+zdIomIh4E03DEyhcRi8XmFKUDA=;
  b=L0Ylo+ndFEbReuF6h6lK1igKn6AAhwsE0r+fPP8eTVyHm4OCBBQZOJjy
   9cj1MERGY3+ZZS18Yw4HwuX75pVEqOxgQ0BUMwBiidnABNbOtt2i/Nhr3
   jloM/vd7yeGi9gd3PRaoZdtkCOA22Nj1nftSTPwalwyNB6dPBUXLdbvm8
   N1F0MONkX3/8Cu2CrN6ySeZPjS9c2uCcPbnJzLfXGHTVFs1VFhJqSGfB3
   ehR5p5IhHsjZVzjTKeZKQR45L8nhQsJorRfvyQrwVJynL+joxsneL+jcV
   PwRTXM35PyU4r7WrV7K91Eo/AxnUaf7vhZtbzplIBSUoaJ+cWhnsFRV76
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="459354581"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="459354581"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 20:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="804979505"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="804979505"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 17 Aug 2023 20:26:44 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWq8J-00023u-34;
	Fri, 18 Aug 2023 03:26:43 +0000
Date: Fri, 18 Aug 2023 11:26:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH-cgroup v7 1/6] cgroup/cpuset: Add
 cpuset.cpus.exclusive.effective for v2
Message-ID: <202308181153.3ZTvFaar-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

In-Reply-To: <20230817132454.755459-2-longman@redhat.com>
References: <20230817132454.755459-2-longman@redhat.com>
TO: Waiman Long <longman@redhat.com>
TO: Tejun Heo <tj@kernel.org>
TO: Zefan Li <lizefan.x@bytedance.com>
TO: Johannes Weiner <hannes@cmpxchg.org>
TO: Christian Brauner <brauner@kernel.org>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Shuah Khan <skhan@linuxfoundation.org>
CC: cgroups@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Juri Lelli <juri.lelli@redhat.com>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>
CC: "Michal Koutný" <mkoutny@suse.com>
CC: Giuseppe Scrivano <gscrivan@redhat.com>
CC: Waiman Long <longman@redhat.com>

Hi Waiman,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230817]
[cannot apply to tj-cgroup/for-next v6.5-rc6 v6.5-rc5 v6.5-rc4 linus/master v6.5-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Waiman-Long/cgroup-cpuset-Add-cpuset-cpus-exclusive-effective-for-v2/20230817-214025
base:   next-20230817
patch link:    https://lore.kernel.org/r/20230817132454.755459-2-longman%40redhat.com
patch subject: [PATCH-cgroup v7 1/6] cgroup/cpuset: Add cpuset.cpus.exclusive.effective for v2
config: riscv-randconfig-r042-20230818 (https://download.01.org/0day-ci/archive/20230818/202308181153.3ZTvFaar-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181153.3ZTvFaar-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181153.3ZTvFaar-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(fs/xfs/xfs_rmap_item.o):(function xfs_rmap_update_get_group: .text+0x56): relocation R_RISCV_HI20 out of range: 529929 is not in [-524288, 524287]; references .L__unnamed_1
   >>> referenced by xfs_rmap_item.c:401 (fs/xfs/xfs_rmap_item.c:401)
   >>> defined in vmlinux.a(fs/xfs/xfs_rmap_item.o)
--
>> ld.lld: error: vmlinux.a(fs/xfs/xfs_rmap_item.o):(function xfs_rmap_update_create_intent: .text+0xae): relocation R_RISCV_HI20 out of range: 525314 is not in [-524288, 524287]; references xfs_rmap_update_diff_items
   >>> referenced by xfs_rmap_item.c:402 (fs/xfs/xfs_rmap_item.c:402)
   >>> defined in vmlinux.a(fs/xfs/xfs_rmap_item.o)
--
>> ld.lld: error: vmlinux.a(fs/xfs/xfs_rmap_item.o):(function xfs_rmap_update_finish_item: .text+0x194): relocation R_RISCV_HI20 out of range: 530839 is not in [-524288, 524287]; references xfs_rmap_intent_cache
   >>> referenced by xfs_rmap_item.c:401 (fs/xfs/xfs_rmap_item.c:401)
   >>> defined in vmlinux.a(fs/xfs/libxfs/xfs_rmap.o)
--
>> ld.lld: error: vmlinux.a(fs/xfs/xfs_rmap_item.o):(function xfs_rmap_update_cancel_item: .text+0x1cc): relocation R_RISCV_HI20 out of range: 530839 is not in [-524288, 524287]; references xfs_rmap_intent_cache
   >>> referenced by xfs_rmap_item.c:401 (fs/xfs/xfs_rmap_item.c:401)
   >>> defined in vmlinux.a(fs/xfs/libxfs/xfs_rmap.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
