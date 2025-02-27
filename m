Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775F326A0F6;
	Thu, 27 Feb 2025 15:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740668946; cv=none; b=Z9UwAlVq6tJ3iSC27tG6CHW780S+1Cfhoy49e6toPqYnaiwS8kTi1gPb00IB5u455NRwhzhNgQDwySxBaITyjBWdS82cZ/0vawI9+eKex0994gxtLoDLn1nrUt4dadc5EF9pXfC4z3yzz1hvl6KI9HlB7EIJjNhzuIH37rD35ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740668946; c=relaxed/simple;
	bh=szyB202eHZeorF7U9Su1RtNYRoHqFOa6sP3O5HWtPdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDObmze70TlCTuiYDeMkvJKGX1+0/JI+UMkpFYles1ZC7K5CgCjhP+HWnGDE56BUEjZTAs+kiT7hqWJChVes8YbBGrtEMJqBOj1Tnu8qWjo2QhFquujSpE+hXsE5fOmkk+yLE9m8mcSlY2El7X0bOnbPcVfkgBT3aNtE3MkLdrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvUu8rn8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvUu8rn8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740668945; x=1772204945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=szyB202eHZeorF7U9Su1RtNYRoHqFOa6sP3O5HWtPdw=;
  b=hvUu8rn8RVaIorG3+sj9HDdQYZosUck/7TVgEvq/HrgGrqqAWlXj9nVJ
   tHnsLzA5XpqzHFpJgb9b463WLqplNJjD8VJEvzAbF9UM41uMvO5o+NCr2
   vXgGPX3LpZsQ8gK5RzdPmYmFv1w69xHZ/oVCL53qhO+gv9V7CgvpwIWYl
   7IpfWEvAn8f99wC8v1hg4Ex4LnkDahPw94TYhJxaz6wowSUIQwIlVGj+m
   RCM0ebzat/H71aC7RljJNFNfDo3JFgyZygD8SUkVqqntsaTvcJkPNJkCz
   mrG3OIquxV76v84DYY5ZA4rA0f967Fed78Kt4Us/jEoBNEYOO7Kjxp3o5
   g==;
X-CSE-ConnectionGUID: SpzHfQK1T8G8US5TRh0kdw==
X-CSE-MsgGUID: cts66HRGSgWZbHSkrPHXHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41818821"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="41818821"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 07:09:04 -0800
X-CSE-ConnectionGUID: ED2xceVETNWY/lMAtHcOYg==
X-CSE-MsgGUID: MCU8QdLpRFqYN0Py0Yfo7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="121644581"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 27 Feb 2025 07:09:03 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnfVF-000DXc-2G;
	Thu, 27 Feb 2025 15:08:51 +0000
Date: Thu, 27 Feb 2025 23:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv7 4/6] ublk: zc register/unregister bvec
Message-ID: <202502272211.0KJ6ijWp-lkp@intel.com>
References: <20250226182102.2631321-5-kbusch@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226182102.2631321-5-kbusch@meta.com>

Hi Keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250226]
[cannot apply to axboe-block/for-next linux-nvme/for-next linus/master v6.14-rc4 v6.14-rc3 v6.14-rc2 v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/io_uring-rw-move-fixed-buffer-import-to-issue-path/20250227-022853
base:   next-20250226
patch link:    https://lore.kernel.org/r/20250226182102.2631321-5-kbusch%40meta.com
patch subject: [PATCHv7 4/6] ublk: zc register/unregister bvec
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250227/202502272211.0KJ6ijWp-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272211.0KJ6ijWp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272211.0KJ6ijWp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/ublk_drv.c:2510:18: warning: '&' within '|' [-Wbitwise-op-parentheses]
    2510 |                 if (info.flags & UBLK_F_USER_COPY | UBLK_F_SUPPORT_ZERO_COPY)
         |                     ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~ ~
   drivers/block/ublk_drv.c:2510:18: note: place parentheses around the '&' expression to silence this warning
    2510 |                 if (info.flags & UBLK_F_USER_COPY | UBLK_F_SUPPORT_ZERO_COPY)
         |                     ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +2510 drivers/block/ublk_drv.c

  2455	
  2456	static int ublk_ctrl_add_dev(struct io_uring_cmd *cmd)
  2457	{
  2458		const struct ublksrv_ctrl_cmd *header = io_uring_sqe_cmd(cmd->sqe);
  2459		void __user *argp = (void __user *)(unsigned long)header->addr;
  2460		struct ublksrv_ctrl_dev_info info;
  2461		struct ublk_device *ub;
  2462		int ret = -EINVAL;
  2463	
  2464		if (header->len < sizeof(info) || !header->addr)
  2465			return -EINVAL;
  2466		if (header->queue_id != (u16)-1) {
  2467			pr_warn("%s: queue_id is wrong %x\n",
  2468				__func__, header->queue_id);
  2469			return -EINVAL;
  2470		}
  2471	
  2472		if (copy_from_user(&info, argp, sizeof(info)))
  2473			return -EFAULT;
  2474	
  2475		if (capable(CAP_SYS_ADMIN))
  2476			info.flags &= ~UBLK_F_UNPRIVILEGED_DEV;
  2477		else if (!(info.flags & UBLK_F_UNPRIVILEGED_DEV))
  2478			return -EPERM;
  2479	
  2480		/* forbid nonsense combinations of recovery flags */
  2481		switch (info.flags & UBLK_F_ALL_RECOVERY_FLAGS) {
  2482		case 0:
  2483		case UBLK_F_USER_RECOVERY:
  2484		case (UBLK_F_USER_RECOVERY | UBLK_F_USER_RECOVERY_REISSUE):
  2485		case (UBLK_F_USER_RECOVERY | UBLK_F_USER_RECOVERY_FAIL_IO):
  2486			break;
  2487		default:
  2488			pr_warn("%s: invalid recovery flags %llx\n", __func__,
  2489				info.flags & UBLK_F_ALL_RECOVERY_FLAGS);
  2490			return -EINVAL;
  2491		}
  2492	
  2493		/*
  2494		 * unprivileged device can't be trusted, but RECOVERY and
  2495		 * RECOVERY_REISSUE still may hang error handling, so can't
  2496		 * support recovery features for unprivileged ublk now
  2497		 *
  2498		 * TODO: provide forward progress for RECOVERY handler, so that
  2499		 * unprivileged device can benefit from it
  2500		 */
  2501		if (info.flags & UBLK_F_UNPRIVILEGED_DEV) {
  2502			info.flags &= ~(UBLK_F_USER_RECOVERY_REISSUE |
  2503					UBLK_F_USER_RECOVERY);
  2504	
  2505			/*
  2506			 * For USER_COPY, we depends on userspace to fill request
  2507			 * buffer by pwrite() to ublk char device, which can't be
  2508			 * used for unprivileged device
  2509			 */
> 2510			if (info.flags & UBLK_F_USER_COPY | UBLK_F_SUPPORT_ZERO_COPY)
  2511				return -EINVAL;
  2512		}
  2513	
  2514		/* the created device is always owned by current user */
  2515		ublk_store_owner_uid_gid(&info.owner_uid, &info.owner_gid);
  2516	
  2517		if (header->dev_id != info.dev_id) {
  2518			pr_warn("%s: dev id not match %u %u\n",
  2519				__func__, header->dev_id, info.dev_id);
  2520			return -EINVAL;
  2521		}
  2522	
  2523		if (header->dev_id != U32_MAX && header->dev_id >= UBLK_MAX_UBLKS) {
  2524			pr_warn("%s: dev id is too large. Max supported is %d\n",
  2525				__func__, UBLK_MAX_UBLKS - 1);
  2526			return -EINVAL;
  2527		}
  2528	
  2529		ublk_dump_dev_info(&info);
  2530	
  2531		ret = mutex_lock_killable(&ublk_ctl_mutex);
  2532		if (ret)
  2533			return ret;
  2534	
  2535		ret = -EACCES;
  2536		if (ublks_added >= ublks_max)
  2537			goto out_unlock;
  2538	
  2539		ret = -ENOMEM;
  2540		ub = kzalloc(sizeof(*ub), GFP_KERNEL);
  2541		if (!ub)
  2542			goto out_unlock;
  2543		mutex_init(&ub->mutex);
  2544		spin_lock_init(&ub->lock);
  2545		INIT_WORK(&ub->nosrv_work, ublk_nosrv_work);
  2546	
  2547		ret = ublk_alloc_dev_number(ub, header->dev_id);
  2548		if (ret < 0)
  2549			goto out_free_ub;
  2550	
  2551		memcpy(&ub->dev_info, &info, sizeof(info));
  2552	
  2553		/* update device id */
  2554		ub->dev_info.dev_id = ub->ub_number;
  2555	
  2556		/*
  2557		 * 64bit flags will be copied back to userspace as feature
  2558		 * negotiation result, so have to clear flags which driver
  2559		 * doesn't support yet, then userspace can get correct flags
  2560		 * (features) to handle.
  2561		 */
  2562		ub->dev_info.flags &= UBLK_F_ALL;
  2563	
  2564		ub->dev_info.flags |= UBLK_F_CMD_IOCTL_ENCODE |
  2565			UBLK_F_URING_CMD_COMP_IN_TASK;
  2566	
  2567		/* GET_DATA isn't needed any more with USER_COPY */
  2568		if (ublk_dev_is_user_copy(ub))
  2569			ub->dev_info.flags &= ~UBLK_F_NEED_GET_DATA;
  2570	
  2571		/* Zoned storage support requires user copy feature */
  2572		if (ublk_dev_is_zoned(ub) &&
  2573		    (!IS_ENABLED(CONFIG_BLK_DEV_ZONED) || !ublk_dev_is_user_copy(ub))) {
  2574			ret = -EINVAL;
  2575			goto out_free_dev_number;
  2576		}
  2577	
  2578		ub->dev_info.nr_hw_queues = min_t(unsigned int,
  2579				ub->dev_info.nr_hw_queues, nr_cpu_ids);
  2580		ublk_align_max_io_size(ub);
  2581	
  2582		ret = ublk_init_queues(ub);
  2583		if (ret)
  2584			goto out_free_dev_number;
  2585	
  2586		ret = ublk_add_tag_set(ub);
  2587		if (ret)
  2588			goto out_deinit_queues;
  2589	
  2590		ret = -EFAULT;
  2591		if (copy_to_user(argp, &ub->dev_info, sizeof(info)))
  2592			goto out_free_tag_set;
  2593	
  2594		/*
  2595		 * Add the char dev so that ublksrv daemon can be setup.
  2596		 * ublk_add_chdev() will cleanup everything if it fails.
  2597		 */
  2598		ret = ublk_add_chdev(ub);
  2599		goto out_unlock;
  2600	
  2601	out_free_tag_set:
  2602		blk_mq_free_tag_set(&ub->tag_set);
  2603	out_deinit_queues:
  2604		ublk_deinit_queues(ub);
  2605	out_free_dev_number:
  2606		ublk_free_dev_number(ub);
  2607	out_free_ub:
  2608		mutex_destroy(&ub->mutex);
  2609		kfree(ub);
  2610	out_unlock:
  2611		mutex_unlock(&ublk_ctl_mutex);
  2612		return ret;
  2613	}
  2614	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
