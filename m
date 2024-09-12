Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5F8192D89;
	Thu, 12 Sep 2024 22:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726178670; cv=none; b=qvg5w+NmterXl53X0rqPz2MXYLHZqEjzp1NIiLAsnydPdX2NPztf7uvnuvysi2Vy5GI2xr7te6hKeTGCxp69pXZoMx/C8KVAN9kEU9eb/L1mYsyaH7QLNFgPDmf6DZqs49m1RC94XGpq749G116Ew3zjm+Ri+3LHAF9X6afX51w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726178670; c=relaxed/simple;
	bh=fFGyqoL+rPxCekW4/SvaEA14xSlOVqoYnpwB66u9eqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OEzHWtjUYN0bXTbTNu+xbKfTuJHtnEdQVjoRZOJPXC1eldvhW083JmgbJ3PtdhYzdRJrz6K8wXJNrEbohruLnCsX7c/wpv7mZyMBJKvrPOhOqsadtRnXt1bSw6KZsRJdIlNbiAnvdgNOKeR5UOLXUILLLNrfONf1ZOoTEG1wXfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bozLiVtP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bozLiVtP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726178669; x=1757714669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fFGyqoL+rPxCekW4/SvaEA14xSlOVqoYnpwB66u9eqg=;
  b=bozLiVtPgLqOydvaXXcf18jIliP6CCEIDKexACPkUS7Vr/2FLgYxY6q6
   yd7xPABAuPVr7MZ0s6bPeyJLJdshPY5lbhjaIQdw5TZeG1IDTuZ+ZNpGc
   LrDe+1sS/QBvWwd/ZrrtTPzb8XOrt9v6LdmM5UJRu4ahxqqwvPJJjuoLr
   BukbHRq6KLb+FdKsCXGJUNPY5OJVVnscmIrwbRQ4fHj50Wn/DUGG+klAr
   HTbNWUu4VMGntJYKBoXqx5Ty+tNS32ejM1OFgmhl988UoYH3AoMIaIUe9
   hmGdkZFstu1b+WMUkUk1XXkYh35odXMP/rtDtnAFuLFFxrx6tXLayKYuP
   Q==;
X-CSE-ConnectionGUID: lnUvMNshTuegHnmcjzAPzw==
X-CSE-MsgGUID: vXlrqXAkQAa3fnDlY+cSsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24935467"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="24935467"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 15:04:25 -0700
X-CSE-ConnectionGUID: /P5/i26oSXu9cdc3VNbDaA==
X-CSE-MsgGUID: 3KPHfaHyTOi0/E9faBSrJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="67691430"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Sep 2024 15:04:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sorvI-0005ks-0d;
	Thu, 12 Sep 2024 22:04:20 +0000
Date: Fri, 13 Sep 2024 06:04:00 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
	tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: use drm_file name
Message-ID: <202409130526.fve4aEMs-lkp@intel.com>
References: <20240911145836.734080-3-pierre-eric.pelloux-prayer@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911145836.734080-3-pierre-eric.pelloux-prayer@amd.com>

Hi Pierre-Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11-rc7 next-20240912]
[cannot apply to drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pierre-Eric-Pelloux-Prayer/drm-use-drm_file-name-in-fdinfo/20240911-230058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20240911145836.734080-3-pierre-eric.pelloux-prayer%40amd.com
patch subject: [PATCH 3/3] drm/amdgpu: use drm_file name
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240913/202409130526.fve4aEMs-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409130526.fve4aEMs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409130526.fve4aEMs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2374: warning: Function parameter or struct member 'file' not described in 'amdgpu_vm_set_task_info'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2801: warning: Function parameter or struct member 'ts' not described in 'amdgpu_vm_handle_fault'


vim +2374 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2367  
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2368  /**
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2369   * amdgpu_vm_set_task_info - Sets VMs task info.
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2370   *
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2371   * @vm: vm for which to set the info
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2372   */
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2373  void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *file)
b8f67b9ddf4f8f Shashank Sharma            2024-01-18 @2374  {
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2375  	if (!vm->task_info)
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2376  		return;
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2377  
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2378  	if (vm->task_info->pid == current->pid)
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2379  		return;
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2380  
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2381  	vm->task_info->pid = current->pid;
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2382  	get_task_comm(vm->task_info->task_name, current);
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2383  
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2384  	if (current->group_leader->mm != current->mm)
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2385  		return;
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2386  
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2387  	vm->task_info->tgid = current->group_leader->pid;
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2388  	__get_task_comm(vm->task_info->process_name, TASK_COMM_LEN,
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2389  			current->group_leader);
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2390  	/* Append drm_client_name if set. */
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2391  	if (file && file->name) {
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2392  		int n;
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2393  
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2394  		mutex_lock(&file->name_lock);
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2395  		n = strlen(vm->task_info->process_name);
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2396  		if (n < NAME_MAX) {
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2397  			if (file->name) {
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2398  				vm->task_info->process_name[n] = '/';
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2399  				strscpy_pad(&vm->task_info->process_name[n + 1],
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2400  					    file->name, NAME_MAX - (n + 1));
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2401  			}
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2402  		}
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2403  		mutex_unlock(&file->name_lock);
cd1125e8edc565 Pierre-Eric Pelloux-Prayer 2024-09-11  2404  	}
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2405  }
b8f67b9ddf4f8f Shashank Sharma            2024-01-18  2406  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
