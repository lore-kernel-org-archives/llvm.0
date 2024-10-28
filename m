Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6451DE4D7;
	Mon, 28 Oct 2024 15:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730129897; cv=none; b=qSK5xA0OK6t/BL4h4F7G4ck7qVkZRwVloRYt1qbFjgv/Xgc+0sI88y+3JWviPTeNJjbJ82RJeVwu+zhRrw8b3XuDP3+ii+WLyozWbKo1uXT9m1JJRINzGUxS3WZKHchmkN/vHZSC7TUBmFpxT95o8p3PFNw5ubIfnavQ4BjUXjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730129897; c=relaxed/simple;
	bh=KI+8ElUyFlThCSQkNvpVMT5PY4eVVVOcB0U6lIqIkxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hpRFWVYsxcBDTmjxA6NtQzJbbr9TWuifS+NzVX5W10sh8FGCvWHtUDyOa48ZVz/tESd64WXoaHD9CB16P6aIhk0/AwpT4U6iRiHa5SJXk/70jq/vXPem/jQD5Xr+zwexfIXuGQP0Yx28Uidv3eIvfuZuzv+w21PRILgsm+Rzvaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNPiQLwY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNPiQLwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730129895; x=1761665895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KI+8ElUyFlThCSQkNvpVMT5PY4eVVVOcB0U6lIqIkxc=;
  b=GNPiQLwYpNiDU2M3WFsHbpKi9AGXxDhYzV4bP0ZRWxrZs3Q3BhzTBr3W
   kAviumjhuFeBB6SBTBbooFqpzrZK+7Y/npYK8Cale9oJwfU+WVPyERQZi
   ACjfSAr+aVPJSlvKOe0aYn2kVC1/G48ssMJp5HyPwY4y0YL3GVBveWX/i
   L8A+UGuOXOX9D7oRPocMQHearYfS1C4zU0FrLumTm54XQA0Ttf+Vev/F1
   dxOhc2m/M0xRkkAl+SQbFSou0YtOt108L7yrO/cwcLsViELzTdWtIQiAp
   clGgBe3GALmPxkaIz/pkSrTo1RyxYuNMZf2PidA+n0ZUwRXsV0UI7W2xr
   A==;
X-CSE-ConnectionGUID: Fp+g0cYOSAK33zYY4i3vHA==
X-CSE-MsgGUID: y68sWv22TqOI4iPMCipZyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="41122212"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="41122212"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 08:38:11 -0700
X-CSE-ConnectionGUID: R41ru12HS1S5UyZRETpIfQ==
X-CSE-MsgGUID: QL1SB2rkQa+kpbUVhLUT+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="86225069"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Oct 2024 08:38:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Rok-000cZp-1y;
	Mon, 28 Oct 2024 15:38:06 +0000
Date: Mon, 28 Oct 2024 23:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_5 21/26]
 include/linux/uprobes.h:127:16: error: field has incomplete type 'struct
 mutex'
Message-ID: <202410282327.W1zgIXtN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_5
head:   748f02be1adc50c8aea1e580791e8085f8713c07
commit: 0ec2293dc6f5526b57f0f431643dbfbbddc5cd51 [21/26] uprobes: Add mapping for optimized uprobe trampolines
config: arm-defconfig (https://download.01.org/0day-ci/archive/20241028/202410282327.W1zgIXtN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410282327.W1zgIXtN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410282327.W1zgIXtN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/probes/uprobes/actions-arm.c:10:
>> include/linux/uprobes.h:127:16: error: field has incomplete type 'struct mutex'
           struct mutex            tramp_mutex;
                                   ^
   include/linux/uprobes.h:127:9: note: forward declaration of 'struct mutex'
           struct mutex            tramp_mutex;
                  ^
   In file included from arch/arm/probes/uprobes/actions-arm.c:11:
   In file included from include/linux/module.h:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:1039:16: error: flexible array member 'cpu_bitmap' not allowed in otherwise empty struct
           unsigned long cpu_bitmap[];
                         ^
>> include/linux/mm_types.h:1138:27: error: no member named 'mm_mt' in 'struct mm_struct'
           mas_init(&vmi->mas, &mm->mm_mt, addr);
                                ~~  ^
>> include/linux/mm_types.h:1189:45: error: no member named 'pcpu_cid' in 'struct mm_struct'
                   struct mm_cid *pcpu_cid = per_cpu_ptr(mm->pcpu_cid, i);
                                                         ~~  ^
   include/linux/percpu-defs.h:235:20: note: expanded from macro 'per_cpu_ptr'
           __verify_pcpu_ptr(ptr);                                         \
                             ^~~
   include/linux/percpu-defs.h:219:47: note: expanded from macro '__verify_pcpu_ptr'
           const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
                                                        ^~~
   In file included from arch/arm/probes/uprobes/actions-arm.c:11:
   In file included from include/linux/module.h:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:1189:45: error: no member named 'pcpu_cid' in 'struct mm_struct'
                   struct mm_cid *pcpu_cid = per_cpu_ptr(mm->pcpu_cid, i);
                                                         ~~  ^
   include/linux/percpu-defs.h:236:20: note: expanded from macro 'per_cpu_ptr'
           SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
                             ^~~
   include/linux/percpu-defs.h:231:23: note: expanded from macro 'SHIFT_PERCPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
                                ^~~
   include/linux/compiler.h:177:31: note: expanded from macro 'RELOC_HIDE'
        __ptr = (unsigned long) (ptr);                             \
                                 ^~~
   In file included from arch/arm/probes/uprobes/actions-arm.c:11:
   In file included from include/linux/module.h:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:1189:45: error: no member named 'pcpu_cid' in 'struct mm_struct'
                   struct mm_cid *pcpu_cid = per_cpu_ptr(mm->pcpu_cid, i);
                                                         ~~  ^
   include/linux/percpu-defs.h:236:20: note: expanded from macro 'per_cpu_ptr'
           SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
                             ^~~
   include/linux/percpu-defs.h:231:49: note: expanded from macro 'SHIFT_PERCPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
                                                          ^~~
   include/linux/compiler.h:177:31: note: expanded from macro 'RELOC_HIDE'
        __ptr = (unsigned long) (ptr);                             \
                                 ^~~
   In file included from arch/arm/probes/uprobes/actions-arm.c:11:
   In file included from include/linux/module.h:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:1189:45: error: no member named 'pcpu_cid' in 'struct mm_struct'
                   struct mm_cid *pcpu_cid = per_cpu_ptr(mm->pcpu_cid, i);
                                                         ~~  ^
   include/linux/percpu-defs.h:236:20: note: expanded from macro 'per_cpu_ptr'
           SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
                             ^~~
   include/linux/percpu-defs.h:231:23: note: expanded from macro 'SHIFT_PERCPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
                                ^~~
   include/linux/compiler.h:178:13: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
               ^~~
   In file included from arch/arm/probes/uprobes/actions-arm.c:11:
   In file included from include/linux/module.h:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:1189:45: error: no member named 'pcpu_cid' in 'struct mm_struct'
                   struct mm_cid *pcpu_cid = per_cpu_ptr(mm->pcpu_cid, i);
                                                         ~~  ^
   include/linux/percpu-defs.h:236:20: note: expanded from macro 'per_cpu_ptr'
           SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
                             ^~~
   include/linux/percpu-defs.h:231:49: note: expanded from macro 'SHIFT_PERCPU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
                                                          ^~~
   include/linux/compiler.h:178:13: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
               ^~~
   In file included from arch/arm/probes/uprobes/actions-arm.c:11:
   In file included from include/linux/module.h:17:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   include/linux/mm_types.h:1189:18: error: initializing 'struct mm_cid *' with an expression of incompatible type 'void'
                   struct mm_cid *pcpu_cid = per_cpu_ptr(mm->pcpu_cid, i);
                                  ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:1199:6: error: no member named 'pcpu_cid' in 'struct mm_struct'
           mm->pcpu_cid = alloc_percpu_noprof(struct mm_cid);
           ~~  ^
   include/linux/mm_types.h:1200:11: error: no member named 'pcpu_cid' in 'struct mm_struct'
           if (!mm->pcpu_cid)
                ~~  ^
   include/linux/mm_types.h:1209:18: error: no member named 'pcpu_cid' in 'struct mm_struct'
           free_percpu(mm->pcpu_cid);
                       ~~  ^
   include/linux/mm_types.h:1210:6: error: no member named 'pcpu_cid' in 'struct mm_struct'
           mm->pcpu_cid = NULL;
           ~~  ^
   In file included from arch/arm/probes/uprobes/actions-arm.c:11:
   In file included from include/linux/module.h:21:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:21:
   In file included from include/linux/sched/mm.h:11:
   include/linux/sched/coredump.h:31:28: error: no member named 'flags' in 'struct mm_struct'
           return __get_dumpable(mm->flags);
                                 ~~  ^
   In file included from arch/arm/probes/uprobes/actions-arm.c:11:
   In file included from include/linux/module.h:21:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:21:
   include/linux/sched/mm.h:37:18: error: no member named 'mm_count' in 'struct mm_struct'
           atomic_inc(&mm->mm_count);
                       ~~  ^
   include/linux/sched/mm.h:54:40: error: no member named 'mm_count' in 'struct mm_struct'
           if (unlikely(atomic_dec_and_test(&mm->mm_count)))
                                             ~~  ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   In file included from arch/arm/probes/uprobes/actions-arm.c:11:
   In file included from include/linux/module.h:21:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:21:
   In file included from include/linux/xarray.h:21:
   include/linux/sched/mm.h:133:18: error: no member named 'mm_users' in 'struct mm_struct'
           atomic_inc(&mm->mm_users);
                       ~~  ^
   include/linux/sched/mm.h:138:34: error: no member named 'mm_users' in 'struct mm_struct'
           return atomic_inc_not_zero(&mm->mm_users);
                                       ~~  ^
   include/linux/sched/mm.h:536:32: error: no member named 'membarrier_state' in 'struct mm_struct'
           if (likely(!(atomic_read(&mm->membarrier_state) &
                                     ~~  ^
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   19 errors generated.


vim +127 include/linux/uprobes.h

   123	
   124	struct uprobes_state {
   125		struct xol_area		*xol_area;
   126		struct hlist_head	tramp_head;
 > 127		struct mutex		tramp_mutex;
   128	};
   129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
