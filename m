Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A99427FD6E;
	Tue, 16 Dec 2025 05:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765863985; cv=none; b=LxXB/DwunNKSpOzP/A7BMrlyFLhO0BvwN0kR8yT0y4CjHPquOpCujVpAElkqyP7nd964aSpd+7q7MqAqOFzsGNAvBmDP6w9LPIsLEcBpLR37Jg2ybv/24mVXycTO00IABH1WE6SO66T4Mt5OHOerILoeGXP5XDz1qm1XLLNz3lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765863985; c=relaxed/simple;
	bh=1XjP0mKFkNYKFLhPRTL97PmYp8Uie7/TKKOaVYmxSU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDG0kdzmDzDeyfXAR1HFy3SqRGD5Fo+afsXpDI4dyxabzxjMn390spREuOIFMEYL2Gf0nMmCS/BMwI7FpCP1iRv+JcDfAl0tY0Qd+eWOUEXDkokJv9wp75hxJxtJ4m8X0zHYaokOXB3W4JmiDj4Ts38c1cfnsxtComJkqZobEYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0qNkHcS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0qNkHcS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765863980; x=1797399980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1XjP0mKFkNYKFLhPRTL97PmYp8Uie7/TKKOaVYmxSU0=;
  b=G0qNkHcSsiTB+tMQ3CtqP461uKGScE014NxaBtNAeem0Vlt6zvgueFhv
   B3zW1uLDiZwL9lRB1YI3jtvn2b9zIcsF0gnyRzXywbIxGeKsiwghsHdEQ
   Kd/T1dUvFhUfXW8pGHiRLfdzhRe8kzYvzqmtsSqH07MlqWOv/kagxlxeD
   QnS+hUabsNrqi1gIEjeSkf9w80D1U5hHOE4awrbWlUNJhwk7XucSxS+qs
   5aOeTfCA3hgzJxp+8lUFprf2Rm4ylDoNit0NqQpBgWG1ZVU7Bj40QX5+8
   uSfIuL98HCIFMp6SJuVmRkhbaQ/pWewvMMtMuXvjYLnCWlhXW+2XoF2s2
   Q==;
X-CSE-ConnectionGUID: teg+S9UrQoq4ACLWOh8kIA==
X-CSE-MsgGUID: 4Mdi/sFnTh+Kvv1PUqAjGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85187792"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="85187792"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 21:46:06 -0800
X-CSE-ConnectionGUID: j31l8sBpSmKaE5BQamH7ig==
X-CSE-MsgGUID: f3jvVeySTViGwe+AHKnECA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="235326976"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Dec 2025 21:46:02 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVNsl-000000001Cr-2Ym4;
	Tue, 16 Dec 2025 05:45:59 +0000
Date: Tue, 16 Dec 2025 13:45:31 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, nd@arm.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Ketil Johnsen <ketil.johnsen@arm.com>
Subject: Re: [PATCH v1 5/5] drm/panthor: Use GROUP_GET_STATE to provide group
 and queue errors
Message-ID: <202512161359.YBFqhXuf-lkp@intel.com>
References: <20251215115457.2137485-6-lukas.zapolskas@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215115457.2137485-6-lukas.zapolskas@arm.com>

Hi Lukas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20251216]
[cannot apply to linus/master v6.19-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Zapolskas/drm-panthor-Implement-CS_FAULT-propagation-to-userspace/20251215-195920
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251215115457.2137485-6-lukas.zapolskas%40arm.com
patch subject: [PATCH v1 5/5] drm/panthor: Use GROUP_GET_STATE to provide group and queue errors
config: x86_64-buildonly-randconfig-001-20251216 (https://download.01.org/0day-ci/archive/20251216/202512161359.YBFqhXuf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161359.YBFqhXuf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161359.YBFqhXuf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panthor/panthor_sched.c:3968:37: error: no member named 'fault' in 'struct panthor_group'
    3968 |         get_state->exception_type = group->fault.exception_type;
         |                                     ~~~~~  ^
   drivers/gpu/drm/panthor/panthor_sched.c:3969:34: error: no member named 'fault' in 'struct panthor_group'
    3969 |         get_state->access_type = group->fault.access_type;
         |                                  ~~~~~  ^
   drivers/gpu/drm/panthor/panthor_sched.c:3970:32: error: no member named 'fault' in 'struct panthor_group'
    3970 |         get_state->source_id = group->fault.source_id;
         |                                ~~~~~  ^
   drivers/gpu/drm/panthor/panthor_sched.c:3971:36: error: no member named 'fault' in 'struct panthor_group'
    3971 |         get_state->valid_address = group->fault.valid_address;
         |                                    ~~~~~  ^
   drivers/gpu/drm/panthor/panthor_sched.c:3972:30: error: no member named 'fault' in 'struct panthor_group'
    3972 |         get_state->address = group->fault.address;
         |                              ~~~~~  ^
   5 errors generated.


vim +3968 drivers/gpu/drm/panthor/panthor_sched.c

  3938	
  3939	int panthor_group_get_state(struct panthor_file *pfile,
  3940				    struct drm_panthor_group_get_state *get_state,
  3941				    struct drm_panthor_queue_event *events, u32 count)
  3942	{
  3943		struct panthor_group_pool *gpool = pfile->groups;
  3944		struct panthor_device *ptdev = pfile->ptdev;
  3945		struct panthor_scheduler *sched = ptdev->scheduler;
  3946		struct panthor_group *group = NULL;
  3947		u32 fault_count;
  3948	
  3949		group = group_from_handle(gpool, get_state->group_handle);
  3950		if (!group)
  3951			return -EINVAL;
  3952	
  3953		guard(mutex)(&sched->lock);
  3954	
  3955		if (group->timedout)
  3956			get_state->state |= DRM_PANTHOR_GROUP_STATE_TIMEDOUT;
  3957		if (group->fatal_queues) {
  3958			get_state->state |= DRM_PANTHOR_GROUP_STATE_FATAL_FAULT;
  3959			get_state->fatal_queues = group->fatal_queues;
  3960		}
  3961		if (group->innocent)
  3962			get_state->state |= DRM_PANTHOR_GROUP_STATE_INNOCENT;
  3963		if (group->fault_queues) {
  3964			get_state->state |= DRM_PANTHOR_GROUP_STATE_QUEUE_FAULT;
  3965			get_state->fault_queues = group->fault_queues;
  3966		}
  3967	
> 3968		get_state->exception_type = group->fault.exception_type;
  3969		get_state->access_type = group->fault.access_type;
  3970		get_state->source_id = group->fault.source_id;
  3971		get_state->valid_address = group->fault.valid_address;
  3972		get_state->address = group->fault.address;
  3973	
  3974		fault_count = panthor_group_count_faults(sched, group);
  3975	
  3976		if (!count && !events) {
  3977			get_state->faults.count = fault_count;
  3978			get_state->faults.stride = sizeof(struct drm_panthor_queue_event);
  3979			goto exit;
  3980		}
  3981	
  3982		panthor_group_get_faults(sched, group, events, min(get_state->faults.count, count));
  3983	
  3984	exit:
  3985		group_put(group);
  3986		return 0;
  3987	}
  3988	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
