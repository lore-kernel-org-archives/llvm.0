Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F35717555;
	Thu, 19 Sep 2024 21:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726781847; cv=none; b=FM6MBYHCC87Wz7Q1XYZ1sNguG6945526ab8gXj2HC6+BDS35pql37kXjwdnl/0VI2AQTqkqphJmcmPjlLL2iMwZcb7h5bNf0mM7kOFweHUARlqY0TVcocP+6P7NaYq1jLbLe9w0vtEjOLLZExzT/vx397JORBZozC2wbf+l6ERs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726781847; c=relaxed/simple;
	bh=sHbuLlehMIq/ke7fqp+E061SSPEI+N9sg9YQuNMzVMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/b9gB66oWpvsZquOezoKv8JjNZdfcNF6Sw5SNiWudHMRqGWSmG1RbGDMw30xs+wnKIQ0PZvBb63jVOOQr/evygGbNYppQrBtNQkWfvoesm8dqiqqfqeB9vhBgyQQllgCJYNipLlzm8ml9g37Y4PdqJV5VHBaZnugRvWjJPG8J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zsw6shlW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zsw6shlW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726781846; x=1758317846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sHbuLlehMIq/ke7fqp+E061SSPEI+N9sg9YQuNMzVMI=;
  b=Zsw6shlW4EnPBFOb/oJsz+mGpiwjJ9C8/kR4kI1wO9lADmE/bCXA2OzT
   Sw6yuwxMa/DTYSTxX/L3pmIE5re8mbTumojTRMVW92Azbkc0q6l8XtlUv
   d13+Q95qtGuh8tnUNAwAAjn3Z/LCDxZUY9Fp7mNMzoZCeWSrNB2tC+hKW
   P2+7QEcVuU8yBODn/StCLjGrhS4/Nqg5S/BedNxyAdahkJhnyi6/PTu0c
   MtF5IIN7eO5DvKfTwLLcZ2xlaxN6sAtZcFZUfJZmTgAsrdaVXvBdRqXPH
   jV41c17zjRR7oswZDzbU5ZYcx8fr61oBWV5wDCqGpbne6E4gOoqT+Y0Xb
   g==;
X-CSE-ConnectionGUID: IntFJ02XSzWc12aY4Zek6w==
X-CSE-MsgGUID: 9NTCX85YSaizhR6KQqpjNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25959892"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="25959892"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 14:37:24 -0700
X-CSE-ConnectionGUID: NHe/MZlAT2O4j33i74+Ifw==
X-CSE-MsgGUID: BFiJaLAdRzKHv2QXUHI0Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="70376330"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Sep 2024 14:37:22 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srOpz-000Dic-2H;
	Thu, 19 Sep 2024 21:37:19 +0000
Date: Fri, 20 Sep 2024 05:36:19 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
	tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH v2 3/3] drm/amdgpu: use drm_file name
Message-ID: <202409200113.0AEe5YG9-lkp@intel.com>
References: <20240916133223.1023773-3-pierre-eric.pelloux-prayer@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916133223.1023773-3-pierre-eric.pelloux-prayer@amd.com>

Hi Pierre-Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11 next-20240919]
[cannot apply to drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pierre-Eric-Pelloux-Prayer/drm-use-drm_file-name-in-fdinfo/20240916-213521
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20240916133223.1023773-3-pierre-eric.pelloux-prayer%40amd.com
patch subject: [PATCH v2 3/3] drm/amdgpu: use drm_file name
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240920/202409200113.0AEe5YG9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409200113.0AEe5YG9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409200113.0AEe5YG9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:997:32: warning: variable 'file' is uninitialized when used here [-Wuninitialized]
     997 |         r = mutex_lock_interruptible(&file->name_lock);
         |                                       ^~~~
   include/linux/mutex.h:162:72: note: expanded from macro 'mutex_lock_interruptible'
     162 | #define mutex_lock_interruptible(lock) mutex_lock_interruptible_nested(lock, 0)
         |                                                                        ^~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c:990:23: note: initialize the variable 'file' to silence this warning
     990 |         struct drm_file *file;
         |                              ^
         |                               = NULL
   1 warning generated.


vim +/file +997 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c

   984	
   985	#if defined(CONFIG_DEBUG_FS)
   986	static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
   987	{
   988		struct amdgpu_device *adev = m->private;
   989		struct drm_device *dev = adev_to_drm(adev);
   990		struct drm_file *file;
   991		int r;
   992	
   993		r = mutex_lock_interruptible(&dev->filelist_mutex);
   994		if (r)
   995			return r;
   996	
 > 997		r = mutex_lock_interruptible(&file->name_lock);
   998		if (r)
   999			goto out;
  1000	
  1001		list_for_each_entry(file, &dev->filelist, lhead) {
  1002			struct task_struct *task;
  1003			struct drm_gem_object *gobj;
  1004			struct pid *pid;
  1005			int id;
  1006	
  1007			/*
  1008			 * Although we have a valid reference on file->pid, that does
  1009			 * not guarantee that the task_struct who called get_pid() is
  1010			 * still alive (e.g. get_pid(current) => fork() => exit()).
  1011			 * Therefore, we need to protect this ->comm access using RCU.
  1012			 */
  1013			rcu_read_lock();
  1014			pid = rcu_dereference(file->pid);
  1015			task = pid_task(pid, PIDTYPE_TGID);
  1016			seq_printf(m, "pid %8d command %s", pid_nr(pid),
  1017					   task ? task->comm : "<unknown>");
  1018			if (file->name) {
  1019				seq_putc(m, '/');
  1020				seq_puts(m, file->name);
  1021			}
  1022			seq_puts(m, ":\n");
  1023			rcu_read_unlock();
  1024	
  1025			spin_lock(&file->table_lock);
  1026			idr_for_each_entry(&file->object_idr, gobj, id) {
  1027				struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
  1028	
  1029				amdgpu_bo_print_info(id, bo, m);
  1030			}
  1031			spin_unlock(&file->table_lock);
  1032		}
  1033		mutex_unlock(&file->name_lock);
  1034	out:
  1035		mutex_unlock(&dev->filelist_mutex);
  1036		return 0;
  1037	}
  1038	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
