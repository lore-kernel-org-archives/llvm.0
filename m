Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E997F3859E6;
	Fri, 11 Sep 2026 12:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131272; cv=none; b=sKsxyuFad6K3mI+i+A2boho3wW4dLRqjdjkl+NVVZZvZ5AXu3qmteqZbOf3Yi3fMJ6/tk8Oku4TtkPn4/yCDgWxovttwDR40ma8ctKmp/v3/KrjY26C1GAc2CRy1nNOs/DMEBav1U8OOu2y4svMoHIxNBkNqDUGxZW3l4ZKVaGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131272; c=relaxed/simple;
	bh=XQUZlDxg0L0FDKtlXWOFVn22axAK1L14q76CZLFqvHM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GVK4eG5nLpSmyF3KtSjOiyMNHR9331XzszDPxR2ASzyCTPiqKSRI1hnHk3cf05QmUg/G3BPQCX44+1chDTu7xvpo6Sjw1lRUvsf8lM41TT3jpLhL72hrUYPZboOmIsq3H28yvEFR3M+aeU0GUibbyO8UK8wOHB/p9URuZ5Uf3zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ec/kZ9la; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ec/kZ9la"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789131270; x=1820667270;
  h=date:from:to:cc:subject:message-id;
  bh=XQUZlDxg0L0FDKtlXWOFVn22axAK1L14q76CZLFqvHM=;
  b=ec/kZ9la0bvoDu6NFdhJq51dQkSPkR5CyouZi+qKI5uG5fK734XvunwJ
   H6/7eKz79pi0xHFWOdtlI2KZBE0MBm0Yd8I2bA2/lP6kfZSmFakmO0gm/
   ENgdV46D0fpfbRho4VeEVwavcabkrM3csOTM82WX/SRgFswS91WY6Dc0O
   vqvT6FWUk43WdD8P0GB04FC/obArksdNbk4wmsONTCf7H7/mk2IDeWTrz
   BrI4tO504Wkb/tD3tSOKRUAyB4aRAtYjxMFg0o7mgsfBpLMbCSSUTf1fz
   b9Xc8xbxW0r6ay29xTsWB+mpX9JmbSOUCdKiHMpXmZf60MkHAisaqOZs1
   Q==;
X-CSE-ConnectionGUID: 9FEalqrnQ8y07ynVg45Kpw==
X-CSE-MsgGUID: t1lcym0QRFiVGFdBoQKm6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100256279"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100256279"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 05:54:29 -0700
X-CSE-ConnectionGUID: plKjy5irQy+x4K8Dgj1FWw==
X-CSE-MsgGUID: /W/S8GkpRpuqwhUqDF45ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="296900849"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 11 Sep 2026 05:54:26 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x50ln-000000001YX-1NZr;
	Fri, 11 Sep 2026 12:54:20 +0000
Date: Fri, 11 Sep 2026 20:53:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jianan Huang <jnhuang95@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [chao:dev-test 15/21] fs/f2fs/super.c:3142:1: warning:
 unused label 'restore_holder'
Message-ID: <202609112008.fQ1gSf8A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
head:   5728ec48778b7eaa1dbc3b3df50e693ee108a7de
commit: ecfbd079a78ba39dcae8df2bc8054108d5c32fb0 [15/21] f2fs: quota: fix stale lock holder on remount failure
config: arm64-randconfig-001-20260911 (https://download.01.org/0day-ci/archive/20260911/202609112008.fQ1gSf8A-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 96295a1412f9afbee9d4a3c2701e83f5a529a9cc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609112008.fQ1gSf8A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609112008.fQ1gSf8A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/super.c:3142:1: warning: unused label 'restore_holder' [-Wunused-label]
    3142 | restore_holder:
         | ^~~~~~~~~~~~~~~
   1 warning generated.


vim +/restore_holder +3142 fs/f2fs/super.c

  2888	
  2889		/* recover superblocks we couldn't write due to previous RO mount */
  2890		if (!(flags & SB_RDONLY) && is_sbi_flag_set(sbi, SBI_NEED_SB_WRITE)) {
  2891			err = f2fs_commit_super(sbi, false);
  2892			f2fs_info(sbi, "Try to recover all the superblocks, ret: %d",
  2893				  err);
  2894			if (!err)
  2895				clear_sbi_flag(sbi, SBI_NEED_SB_WRITE);
  2896		}
  2897	
  2898		default_options(sbi, true);
  2899	
  2900		err = f2fs_check_opt_consistency(fc, sb);
  2901		if (err)
  2902			goto restore_opts;
  2903	
  2904		f2fs_apply_options(fc, sb);
  2905	
  2906		err = f2fs_sanity_check_options(sbi, true);
  2907		if (err)
  2908			goto restore_opts;
  2909	
  2910		/* flush outstanding errors before changing fs state */
  2911		flush_work(&sbi->s_error_work);
  2912	
  2913		/*
  2914		 * Previous and new state of filesystem is RO,
  2915		 * so skip checking GC and FLUSH_MERGE conditions.
  2916		 */
  2917		if (f2fs_readonly(sb) && (flags & SB_RDONLY))
  2918			goto skip;
  2919	
  2920		if (f2fs_dev_is_readonly(sbi) && !(flags & SB_RDONLY)) {
  2921			err = -EROFS;
  2922			goto restore_opts;
  2923		}
  2924	
  2925	#ifdef CONFIG_QUOTA
  2926		if (!f2fs_readonly(sb) && (flags & SB_RDONLY)) {
  2927			err = dquot_suspend(sb, -1);
  2928			if (err < 0)
  2929				goto restore_opts;
  2930		} else if (f2fs_readonly(sb) && !(flags & SB_RDONLY)) {
  2931			/* dquot_resume needs RW */
  2932			sb->s_flags &= ~SB_RDONLY;
  2933			if (sb_any_quota_suspended(sb)) {
  2934				dquot_resume(sb, -1);
  2935			} else if (f2fs_sb_has_quota_ino(sbi)) {
  2936				err = f2fs_enable_quotas(sb);
  2937				if (err)
  2938					goto restore_opts;
  2939			}
  2940		}
  2941	#endif
  2942		/* disallow enable atgc dynamically */
  2943		if (no_atgc == !!test_opt(sbi, ATGC)) {
  2944			err = -EINVAL;
  2945			f2fs_warn(sbi, "switch atgc option is not allowed");
  2946			goto restore_opts;
  2947		}
  2948	
  2949		/* disallow enable/disable extent_cache dynamically */
  2950		if (no_read_extent_cache == !!test_opt(sbi, READ_EXTENT_CACHE)) {
  2951			err = -EINVAL;
  2952			f2fs_warn(sbi, "switch extent_cache option is not allowed");
  2953			goto restore_opts;
  2954		}
  2955		/* disallow enable/disable age extent_cache dynamically */
  2956		if (no_age_extent_cache == !!test_opt(sbi, AGE_EXTENT_CACHE)) {
  2957			err = -EINVAL;
  2958			f2fs_warn(sbi, "switch age_extent_cache option is not allowed");
  2959			goto restore_opts;
  2960		}
  2961	
  2962		if (no_compress_cache == !!test_opt(sbi, COMPRESS_CACHE)) {
  2963			err = -EINVAL;
  2964			f2fs_warn(sbi, "switch compress_cache option is not allowed");
  2965			goto restore_opts;
  2966		}
  2967	
  2968		if (block_unit_discard != f2fs_block_unit_discard(sbi)) {
  2969			err = -EINVAL;
  2970			f2fs_warn(sbi, "switch discard_unit option is not allowed");
  2971			goto restore_opts;
  2972		}
  2973	
  2974		if (no_nat_bits == !!test_opt(sbi, NAT_BITS)) {
  2975			err = -EINVAL;
  2976			f2fs_warn(sbi, "switch nat_bits option is not allowed");
  2977			goto restore_opts;
  2978		}
  2979	
  2980		if ((flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
  2981			err = -EINVAL;
  2982			f2fs_warn(sbi, "disabling checkpoint not compatible with read-only");
  2983			goto restore_opts;
  2984		}
  2985	
  2986		/*
  2987		 * We stop the GC thread if FS is mounted as RO
  2988		 * or if background_gc = off is passed in mount
  2989		 * option. Also sync the filesystem.
  2990		 */
  2991		if ((flags & SB_RDONLY) ||
  2992				(F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_OFF &&
  2993				!test_opt(sbi, GC_MERGE))) {
  2994			if (sbi->gc_thread.f2fs_gc_task) {
  2995				f2fs_stop_gc_thread(sbi);
  2996				need_restart_gc = true;
  2997			}
  2998		} else if (!sbi->gc_thread.f2fs_gc_task) {
  2999			err = f2fs_start_gc_thread(sbi);
  3000			if (err)
  3001				goto restore_opts;
  3002			need_stop_gc = true;
  3003		}
  3004	
  3005		if (flags & SB_RDONLY) {
  3006			sync_inodes_sb(sb);
  3007	
  3008			set_sbi_flag(sbi, SBI_IS_DIRTY);
  3009			set_sbi_flag(sbi, SBI_IS_CLOSE);
  3010			err = f2fs_sync_fs(sb, 1);
  3011			if (err)
  3012				goto restore_gc;
  3013			clear_sbi_flag(sbi, SBI_IS_CLOSE);
  3014		}
  3015	
  3016		/*
  3017		 * We stop issue flush thread if FS is mounted as RO
  3018		 * or if flush_merge is not passed in mount option.
  3019		 */
  3020		if ((flags & SB_RDONLY) || !test_opt(sbi, FLUSH_MERGE)) {
  3021			clear_opt(sbi, FLUSH_MERGE);
  3022			f2fs_destroy_flush_cmd_control(sbi, false);
  3023			need_restart_flush = true;
  3024		} else {
  3025			err = f2fs_create_flush_cmd_control(sbi);
  3026			if (err)
  3027				goto restore_gc;
  3028			need_stop_flush = true;
  3029		}
  3030	
  3031		if (no_discard == !!test_opt(sbi, DISCARD)) {
  3032			if (test_opt(sbi, DISCARD)) {
  3033				err = f2fs_start_discard_thread(sbi);
  3034				if (err)
  3035					goto restore_flush;
  3036				need_stop_discard = true;
  3037			} else {
  3038				f2fs_stop_discard_thread(sbi);
  3039				/*
  3040				 * f2fs_ioc_fitrim() won't race w/ "remount ro"
  3041				 * so it's safe to check discard_cmd_cnt in
  3042				 * f2fs_issue_discard_timeout().
  3043				 */
  3044				f2fs_issue_discard_timeout(sbi, flags & SB_RDONLY);
  3045				need_restart_discard = true;
  3046			}
  3047		}
  3048	
  3049		adjust_unusable_cap_perc(sbi);
  3050		if (enable_checkpoint == !!test_opt(sbi, DISABLE_CHECKPOINT)) {
  3051			if (test_opt(sbi, DISABLE_CHECKPOINT)) {
  3052				err = f2fs_disable_checkpoint(sbi);
  3053				if (err)
  3054					goto restore_discard;
  3055				need_enable_checkpoint = true;
  3056			} else {
  3057				err = f2fs_enable_checkpoint(sbi);
  3058				if (err)
  3059					goto restore_discard;
  3060				need_disable_checkpoint = true;
  3061			}
  3062		}
  3063	
  3064		/*
  3065		 * Place this routine at the end, since a new checkpoint would be
  3066		 * triggered while remount and we need to take care of it before
  3067		 * returning from remount.
  3068		 */
  3069		if ((flags & SB_RDONLY) || test_opt(sbi, DISABLE_CHECKPOINT) ||
  3070				!test_opt(sbi, MERGE_CHECKPOINT)) {
  3071			f2fs_stop_ckpt_thread(sbi);
  3072		} else {
  3073			/* Flush if the previous checkpoint, if exists. */
  3074			f2fs_flush_ckpt_thread(sbi);
  3075	
  3076			err = f2fs_start_ckpt_thread(sbi);
  3077			if (err) {
  3078				f2fs_err(sbi,
  3079				    "Failed to start F2FS issue_checkpoint_thread (%d)",
  3080				    err);
  3081				goto restore_checkpoint;
  3082			}
  3083		}
  3084	
  3085	skip:
  3086	#ifdef CONFIG_QUOTA
  3087		/* Release old quota file names */
  3088		for (i = 0; i < MAXQUOTAS; i++)
  3089			kfree(org_mount_opt.s_qf_names[i]);
  3090	#endif
  3091		/* Update the POSIXACL Flag */
  3092		sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
  3093			(test_opt(sbi, POSIX_ACL) ? SB_POSIXACL : 0);
  3094	
  3095		adjust_pinned_area_boundary(sbi);
  3096		limit_reserve_root(sbi);
  3097		fc->sb_flags = (flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
  3098	
  3099		sbi->umount_lock_holder = NULL;
  3100		return 0;
  3101	restore_checkpoint:
  3102		if (need_enable_checkpoint) {
  3103			if (f2fs_enable_checkpoint(sbi))
  3104				f2fs_warn(sbi, "checkpoint has not been enabled");
  3105		} else if (need_disable_checkpoint) {
  3106			if (f2fs_disable_checkpoint(sbi))
  3107				f2fs_warn(sbi, "checkpoint has not been disabled");
  3108		}
  3109	restore_discard:
  3110		if (need_restart_discard) {
  3111			if (f2fs_start_discard_thread(sbi))
  3112				f2fs_warn(sbi, "discard has been stopped");
  3113		} else if (need_stop_discard) {
  3114			f2fs_stop_discard_thread(sbi);
  3115		}
  3116	restore_flush:
  3117		if (need_restart_flush) {
  3118			if (f2fs_create_flush_cmd_control(sbi))
  3119				f2fs_warn(sbi, "background flush thread has stopped");
  3120		} else if (need_stop_flush) {
  3121			clear_opt(sbi, FLUSH_MERGE);
  3122			f2fs_destroy_flush_cmd_control(sbi, false);
  3123		}
  3124	restore_gc:
  3125		if (need_restart_gc) {
  3126			if (f2fs_start_gc_thread(sbi))
  3127				f2fs_warn(sbi, "background gc thread has stopped");
  3128		} else if (need_stop_gc) {
  3129			f2fs_stop_gc_thread(sbi);
  3130		}
  3131	restore_opts:
  3132	#ifdef CONFIG_QUOTA
  3133		F2FS_OPTION(sbi).s_jquota_fmt = org_mount_opt.s_jquota_fmt;
  3134		for (i = 0; i < MAXQUOTAS; i++) {
  3135			kfree(F2FS_OPTION(sbi).s_qf_names[i]);
  3136			F2FS_OPTION(sbi).s_qf_names[i] = org_mount_opt.s_qf_names[i];
  3137		}
  3138	#endif
  3139		sbi->mount_opt = org_mount_opt;
  3140		sb->s_flags = old_sb_flags;
  3141	
> 3142	restore_holder:
  3143		sbi->umount_lock_holder = NULL;
  3144		return err;
  3145	}
  3146	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
