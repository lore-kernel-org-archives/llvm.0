Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967FC4A23;
	Wed, 30 Jul 2025 11:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753873393; cv=none; b=ueOx0nPRH+ALz7n2ep8JZBiu6WS0D13lplPj0pLgTzuN6R2uJen8fjsRg6Wv4RnP2hC0hdjQFnQWzUiRLtwB4azz2sd9oLe3eykqblxnLIhMoNhg/LqiF6h1oLBr0zFnSQiZNJ6hzWqfvqxjURc5WgAQtrGHspR8gFTAAVky5XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753873393; c=relaxed/simple;
	bh=pZNdbBfK0/PdExC7LN9m++lu6lu7O2/QnJQqbttmsbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=US1FYAohKfgNuj8sKPerDCG0A5j9wLGqpEUCkfT8lKyWZy9PtUOX73WhyOT+6b/wpXRUZKcgavX+09EwrofGYlRIhOjKyhQHQVifS/HQfBghkeKnc/Q21a1btRn0YAgRZUDZRVrPQGCbl0kRqNTceppP2J5I9ZIW8qcM3e5aUEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZorlQNR1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZorlQNR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753873391; x=1785409391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pZNdbBfK0/PdExC7LN9m++lu6lu7O2/QnJQqbttmsbs=;
  b=ZorlQNR1l6uOI12MuPA3dMJicf3Wtx/TOb075/qcCqQ/F9DGOOCrilov
   LT8WPws6Kw3kAF6pEdI3+r9YG9dCIJUQhg1anePXfi74H+bEM1FYaTZza
   GBdCdpfN0RBp/ps/Zv+k+Bu+C8uIuYPFaYvFGaOLZOtO0vONFvQ96Sv8m
   ioAQeqWRChLX7i9tBmT2LgusNhlw4nUmQPj0JHpqWsobpOYV1mHECx9VH
   KM2QltQfS4MekwNtd6QphK3fRpL+/HhoBx7WldtgvubgRtmP6YxIsEopA
   DIp4rYMKbI2DArK9aB7NEujerccdIoxJwx4h/KZ/lDs28xlZff/wkZfpB
   A==;
X-CSE-ConnectionGUID: TtVhYl49REmAN0S63KbQBw==
X-CSE-MsgGUID: atcdMVEnQHq238T3SE+ntg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56257875"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56257875"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 04:03:10 -0700
X-CSE-ConnectionGUID: RMM8zo/1Ts+53Ge0MxKAMA==
X-CSE-MsgGUID: 8UDdkvo1SrONBufafvXV/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163305108"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jul 2025 04:03:08 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uh4aP-0002eX-2D;
	Wed, 30 Jul 2025 11:03:05 +0000
Date: Wed, 30 Jul 2025 19:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jaegeuk Kim <jaegeuk@kernel.org>, Eric Sandeen <sandeen@redhat.com>,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [linux-next:master 10769/12889] vmlinux.o: warning: objtool:
 f2fs_parse_param+0x80: sibling call from callable instruction with modified
 stack frame
Message-ID: <202507301859.QJFfmnU0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   79fb37f39b77bbf9a56304e9af843cd93a7a1916
commit: 94b3ce7f1509d91fbe3f84f367b622cbb2c1af7e [10769/12889] f2fs: switch to the new mount api
config: loongarch-randconfig-002-20250730 (https://download.01.org/0day-ci/archive/20250730/202507301859.QJFfmnU0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507301859.QJFfmnU0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507301859.QJFfmnU0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: xfs_dinode_verify_fork+0x320: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_inode_init+0x2b0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: __xfs_rmap_finish_intent+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_rmap_convert+0x66c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_rmap_convert_shared+0x4d8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_refcount_finish_one+0x190: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_rtrefcount_finish_one+0x158: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_validate_sb_common+0x824: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_zone_validate+0x1ec: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_fsmap_owner_to_rmap+0xc4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_getfsmap_helper+0x358: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_file_ioctl+0x194: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_bmap_add_extent_hole_delay+0x348: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_bulkstat_one_int+0x490: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_fs_parse_param+0x88: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_trans_mod_sb+0x74: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_log_need_covered+0x6c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xlog_state_clean_iclog+0x1e8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xlog_recover_validate_buf_type+0xd4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_attr_recover_work+0x6f8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xlog_recover_attri_commit_pass2+0xa8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_attri_validate+0xe4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_inode_item_data_fork_size+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_inode_item_format_data_fork+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_rmap_recover_work+0x2e8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_rmap_update_log_item+0xfc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xlog_recovery_process_trans+0x9c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xlog_recover_reorder_trans+0x174: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfsaild+0x8dc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_try_use_zone+0xf4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xchk_bmap+0x1b4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xchk_dirtree_evaluate+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xchk_update_health+0xf8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xchk_dinode+0x3e8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xchk_setup_metapath+0xb8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xchk_dir_walk+0xf4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xchk_rmapbt_mark_bitmap+0x8c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xfs_scrub_metadata+0x1f8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xrep_bmap_check_inputs+0x150: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xrep_dinode_size+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xrep_dinode_find_mode+0x338: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xrep_dinode_check_dfork+0x98: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xrep_dinode_check_afork+0xd4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xrep_dinode_ensure_forkoff+0x248: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: xrep_tempexch_estimate+0x10c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nilfs_parse_param+0x98: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nilfs_bmap_read+0xf0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nilfs_search_super_root+0x5d0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: nilfs_segctor_do_construct+0x5b0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: befs_check_sb+0xbc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: befs_parse_param+0xa8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: debugfs_parse_param+0x88: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: btrfs_parse_param+0x88: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: btrfs_get_extent_inline_ref_type+0xa0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: __btrfs_run_delayed_refs+0x3e0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: alloc_reserved_file_extent+0xd0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: lookup_inline_extent_backref+0x66c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: update_inline_extent_backref+0x240: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: setup_inline_extent_backref+0x118: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: btrfs_print_leaf+0x7a0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: btrfs_extent_item_to_extent_map+0x184: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: btrfs_get_global_root+0x6c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: btrfs_encoded_io_compression_from_extent+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: btrfs_encoded_read_inline+0x1e4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: btrfs_do_encoded_write+0x8c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: btrfs_sysfs_add_space_info_type+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: btrfs_ioctl+0x9c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: btrfs_ioctl_subvol_sync+0x138: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: alloc_workspace+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: free_workspace+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: get_workspace+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: put_workspace+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: find_parent_nodes+0xe9c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tree_backref_for_extent+0x1c0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: btrfs_backref_iter_next+0xe4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: send_create_inode+0xfc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: inconsistent_snapshot_error+0x3c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: btrfs_init_dev_replace+0x214: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: btrfs_dev_replace_cancel+0xac: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: btrfs_resume_dev_replace_async+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: __btrfs_check_leaf+0x37c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: check_leaf_item+0x1af0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: __reserve_bytes+0x438: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: flush_space+0x80: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: btrfs_init_root_block_rsv+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: tree_mod_log_rewind+0x154: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: btrfs_build_ref_tree+0x4f4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ea_list_i+0xd0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: gfs2_dump_glock+0x144: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: finish_xmote+0x3d8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: gfs2_llseek.llvm.15768678323288600665+0x60: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: gfs2_parse_param+0x8c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: gfs2_fill_super+0xa68: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: gfs2_quota_get_state.llvm.11840075804900318499+0x8c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: gfs2_show_options.llvm.4435460917261406920+0x24c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: status_show+0x70: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: f2fs_do_shutdown+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: __f2fs_ioctl+0x100: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: f2fs_llseek.llvm.10111086266837519394+0x84: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: f2fs_iget+0x2f8: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: f2fs_parse_param+0x80: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: f2fs_show_options+0x6e0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: __f2fs_is_valid_blkaddr.llvm.7535017273404782652+0x6c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: f2fs_ra_meta_pages+0x174: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: f2fs_get_victim+0x414: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: f2fs_map_blocks+0x604: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: f2fs_available_free_memory+0x8c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: f2fs_truncate_inode_blocks+0x36c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: new_curseg+0x1d0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: f2fs_get_segment_temp+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: __get_segment_type+0x5cc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: f2fs_sbi_store+0xd4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: __struct_ptr+0x54: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ramoops_pstore_erase+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: erofs_fc_parse_param+0x94: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: erofs_iget+0x470: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: keyring_get_key_chunk+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: keyctl_reject_key+0xcc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: keyctl_set_reqkey_keyring+0x7c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: sys_keyctl+0x68: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: key_task_permission+0x58: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: lookup_user_key+0xe8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: request_key_and_link+0x32c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: keyctl_pkey_params_get_2+0x1b8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: datablob_parse+0xc8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: cap_task_fix_setuid+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: cap_task_prctl+0x7c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rsa_set_pub_key+0xdc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rsa_set_priv_key+0x158: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: generate_random_testvec_config+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: generate_random_length+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: crypto_gcm_setauthsize+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: michael_final+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ecc_get_curve+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ecc_is_key_valid+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ecc_gen_privkey+0x54: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ecc_make_pub_key+0x70: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: crypto_ecdh_shared_secret+0x74: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: vli_mmod_fast+0x268: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ecrdsa_param_curve+0x64: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: async_raid6_2data_recov+0x248: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: x509_note_sig_algo+0x88: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: x509_process_extension+0x68: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pkcs7_sig_note_digest_algo+0x80: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pkcs7_sig_note_pkey_algo+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pkcs7_sig_note_authenticated_attr+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: pkcs7_verify+0x68: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: biovec_slab+0x40: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: submit_bio_noacct+0x320: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: blk_flush_complete_seq+0xbc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: bio_split_to_limits+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: blk_attempt_bio_merge+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: blk_mq_submit_bio+0x278: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: blkdev_ioctl+0x134: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ioprio_check_cap+0x44: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: sys_ioprio_set+0x68: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: msdos_partition+0x3dc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: bsg_ioctl+0x90: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: bfq_bfqq_expire+0x518: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: bfq_set_next_ioprio_data+0x68: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: bfq_get_queue+0xb4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: sed_ioctl+0x134: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: start_generic_opal_session+0x148: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: response_get_string+0xc0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: kiocb_done+0x108: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: io_timeout_remove+0x20c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: __io_timeout_prep+0x334: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: sys_io_uring_register+0x280: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: io_parse_restrictions+0xd8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: do_swap+0x5c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: match_token+0x18c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: extract_iter_to_sg+0x98: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: _copy_to_iter+0x1e8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: _copy_from_iter+0x1e4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: _copy_from_iter_nocache+0x168: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: copy_page_to_iter_nofault+0x390: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iov_iter_zero+0x1c4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: copy_folio_from_iter_atomic+0x3e8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iov_iter_advance+0xbc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iov_iter_revert+0xd4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iov_iter_single_seg_count+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iov_iter_is_aligned+0xe0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iov_iter_alignment+0xa8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iov_iter_npages+0xd8: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: iov_iter_extract_pages+0x1dc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: rhashtable_jhash2+0x128: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: refcount_warn_saturate+0x50: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: string_unescape+0x2ac: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: string_escape_mem+0x3d4: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: kstrtobool+0xa0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: vvar_fault.llvm.6795815868049752848+0x4c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: __devm_ioremap.llvm.16465148086375617399+0x78: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: zlib_inflate+0x174: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: find_poly_roots+0x5cc: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: HUF_compress1X_usingCTable_internal.llvm.16785660852261606571+0x118: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_cParam_getBounds+0x84: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_CCtx_setParameter+0x144: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_CCtxParams_setParameter+0xb0: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_CCtxParams_getParameter+0x8c: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_CCtx_setCParams+0x184: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: ZSTD_buildEntropyStatisticsAndEstimateSubBlockSize+0x150: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
