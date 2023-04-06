Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E720AD26;
	Thu,  6 Apr 2023 16:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680799752; x=1712335752;
  h=date:from:cc:subject:message-id:mime-version;
  bh=XFbz5G83yaBiDKkiE/owACVGd1P/3EhK/cIXU2hhDwo=;
  b=Hbkmra8QDzjyMJt1jVvOPEvJxtoEoLIrwHB86/eHiSH0Fp9blbHViuRd
   wgB5LcvGicAhocO8t+ROTP6ZRnNQ/UBdYaAvg8/0+eNJFJGqH+ZiSUqIF
   50xSVXOZxMc/rp3P+lso8N3EY3N8Nw22+HEY/EPF0WEYbtMf4dYuSNj6o
   EejktXWBNFtpq2FGtvhS5EV6txOr/Fu1Wsd8TbdKzJe/eBWLPopFhmr35
   BPhPhljzZXLmX3XNNUYbHj6puSTS81qy/784PM4mMiJ6lv0FwX0qRmk/Y
   VQLnOjsaIeZQmbW2sfQf4zAud4hrWABtfjaAEs/nhZHdCgaOlwojNq108
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="429076519"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="429076519"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 09:49:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="798399416"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="798399416"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Apr 2023 09:48:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkSnD-000RWc-0b;
	Thu, 06 Apr 2023 16:48:59 +0000
Date: Fri, 7 Apr 2023 00:48:44 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jpoimboe:objtool-debug 3/8] vmlinux.o: warning: objtool:
 run_delalloc_nocow+0xa41: unreachable instruction
Message-ID: <202304070026.o74QWrsm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-debug
head:   261316083661e4879d4db1cc7d34efb3f3dfcbbf
commit: 8a21b194da04c824cdf6825a4de136c585eeb307 [3/8] objtool: Limit unreachable warnings to once per function
config: x86_64-randconfig-r032-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070026.o74QWrsm-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=8a21b194da04c824cdf6825a4de136c585eeb307
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-debug
        git checkout 8a21b194da04c824cdf6825a4de136c585eeb307
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070026.o74QWrsm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: btrfs_unfreeze+0x1fc: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_statfs+0xa2b: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_find_item+0x197: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_search_slot+0xe17: unreachable instruction
   vmlinux.o: warning: objtool: finish_need_commit_sem_search+0x108: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_search_old_slot+0x4c7: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_search_forward+0x5c8: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_next_old_leaf+0x9c8: unreachable instruction
   vmlinux.o: warning: objtool: split_node+0x4c0: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_extent_inline_ref_type+0x232: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_discard_extent+0x397: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_inc_extent_ref+0xb9: unreachable instruction
   vmlinux.o: warning: objtool: __btrfs_run_delayed_refs+0xf14: unreachable instruction
   vmlinux.o: warning: objtool: find_free_extent+0x162c: unreachable instruction
   vmlinux.o: warning: objtool: __btrfs_free_extent+0x1243: unreachable instruction
   vmlinux.o: warning: objtool: alloc_reserved_extent+0x179: unreachable instruction
   vmlinux.o: warning: objtool: update_inline_extent_backref+0x3e9: unreachable instruction
   vmlinux.o: warning: objtool: extent_data_ref_count+0x18d: unreachable instruction
   vmlinux.o: warning: objtool: do_walk_down+0xc76: unreachable instruction
   vmlinux.o: warning: objtool: insert_with_overflow+0x183: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_inode_set_file_extent_range+0xf0: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_inode_clear_file_extent_range+0x105: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_lookup_bio_sums+0x83d: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_lookup_csums_list+0x6f5: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_lookup_csums_bitmap+0x638: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_csum_one_bio+0x511: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_del_csums+0x60d: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_file_extent_end+0x120: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_truncate_inode_items+0xcc2: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_read_extent_buffer+0x267: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_validate_metadata_buffer+0x268: unreachable instruction
   vmlinux.o: warning: objtool: validate_extent_buffer+0x68f: unreachable instruction
   vmlinux.o: warning: objtool: read_tree_block+0xd2: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_global_root_insert+0x116: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_csum_root+0x15c: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_extent_root+0x15c: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_mark_buffer_dirty+0x214: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_root_ref+0x431: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_fs_root_commit_root+0x1b1: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_drop_and_free_fs_root+0xe7: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_read_dev_one_super+0x204: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_cleanup_dirty_bgs+0x19c: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_cleanup_one_transaction+0xb1c: unreachable instruction
   vmlinux.o: warning: objtool: csum_one_extent_buffer+0x1b9: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_wait_tree_log_extents+0x108: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_commit_transaction+0x1453: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_trans_release_metadata+0x191: unreachable instruction
   vmlinux.o: warning: objtool: add_pending_snapshot+0xf0: unreachable instruction
   vmlinux.o: warning: objtool: commit_fs_roots+0x2d5: unreachable instruction
   vmlinux.o: warning: objtool: commit_cowonly_roots+0x355: unreachable instruction
   vmlinux.o: warning: objtool: switch_commit_roots+0x1fa: unreachable instruction
   vmlinux.o: warning: objtool: create_pending_snapshot+0xbe3: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_run_delalloc_range+0x7cf: unreachable instruction
>> vmlinux.o: warning: objtool: run_delalloc_nocow+0xa41: unreachable instruction
   vmlinux.o: warning: objtool: run_delalloc_zoned+0x245: unreachable instruction
   vmlinux.o: warning: objtool: cow_file_range+0x75f: unreachable instruction
   vmlinux.o: warning: objtool: __btrfs_del_delalloc_inode+0x146: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_clear_delalloc_extent+0x426: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_extract_ordered_extent+0x5cc: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_release_delalloc_bytes+0x73: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_check_sector_csum+0x11c: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_data_csum_ok+0x28c: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_add_delayed_iput+0x16f: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_delete_subvolume+0x8c9: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_extent+0x9c8: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_evict_inode+0x629: unreachable instruction
   vmlinux.o: warning: objtool: read_inline_extent+0x1ce: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_range_writeback+0x18c: unreachable instruction
   vmlinux.o: warning: objtool: create_io_em+0x138: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_invalidate_folio+0x503: unreachable instruction
   vmlinux.o: warning: objtool: __btrfs_release_folio+0xe1: unreachable instruction
   vmlinux.o: warning: objtool: insert_inline_extent+0x8e: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_dirty_pages+0x214: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_drop_extents+0x62e: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_sync_file+0x91f: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_release_log_ctx_extents+0xb7: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_insert_replace_extent+0x453: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_fallocate+0x1173: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_drop_pages+0x1a0: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_zero_range+0x9dc: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_defrag_file+0xf9c: unreachable instruction
   vmlinux.o: warning: objtool: defrag_collect_targets+0x455: unreachable instruction
   vmlinux.o: warning: objtool: defrag_lookup_extent+0x71f: unreachable instruction
   vmlinux.o: warning: objtool: replace_extent_mapping+0x23e: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_add_extent_mapping+0x2be: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_drop_extent_map_range+0x814: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_replace_extent_map_range+0xcc: unreachable instruction
   vmlinux.o: warning: objtool: mergable_maps+0x146: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_sysfs_remove_fs_devices+0xe1: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_sysfs_remove_device+0xbf: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_sysfs_add_device+0x189: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_sysfs_add_qgroups+0x8c: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_token_8+0x153: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_8+0x13c: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_token_8+0x160: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_8+0x142: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_token_16+0x206: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_16+0x1ca: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_token_16+0x212: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_16+0x1d4: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_token_32+0x23c: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_32+0x1fb: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_token_32+0x231: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_32+0x1f7: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_token_64+0x23e: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_64+0x1f9: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_token_64+0x245: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_set_64+0x1f8: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_setxattr+0x5ec: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_setxattr_trans+0x1d1: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_add_ordered_extent+0x24a: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_mark_ordered_io_finished+0x649: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_put_ordered_extent+0x27b: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_remove_ordered_extent+0x556: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_get_ordered_extents_for_logging+0x249: unreachable instruction
   vmlinux.o: warning: objtool: __process_pages_contig+0x4ef: unreachable instruction
   vmlinux.o: warning: objtool: end_extent_writepage+0x175: unreachable instruction
   vmlinux.o: warning: objtool: set_page_extent_mapped+0x104: unreachable instruction
   vmlinux.o: warning: objtool: clear_page_extent_mapped+0x156: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_do_readpage+0x750: unreachable instruction
   vmlinux.o: warning: objtool: submit_one_bio+0x1ff: unreachable instruction
   vmlinux.o: warning: objtool: extent_write_locked_range+0x31a: unreachable instruction
   vmlinux.o: warning: objtool: __extent_writepage+0x55b: unreachable instruction
   vmlinux.o: warning: objtool: extent_writepages+0x908: unreachable instruction
   vmlinux.o: warning: objtool: extent_invalidate_folio+0x158: unreachable instruction
   vmlinux.o: warning: objtool: extent_fiemap+0x10c3: unreachable instruction
   vmlinux.o: warning: objtool: emit_fiemap_extent+0x19e: unreachable instruction
   vmlinux.o: warning: objtool: __alloc_extent_buffer+0x151: unreachable instruction
   vmlinux.o: warning: objtool: alloc_extent_buffer+0x453: unreachable instruction
   vmlinux.o: warning: objtool: btree_clear_page_dirty+0x1c1: unreachable instruction
   vmlinux.o: warning: objtool: set_extent_buffer_dirty+0x331: unreachable instruction
   vmlinux.o: warning: objtool: read_extent_buffer_pages+0xb03: unreachable instruction
   vmlinux.o: warning: objtool: end_bio_extent_readpage+0x67f: unreachable instruction
   vmlinux.o: warning: objtool: submit_extent_page+0xea: unreachable instruction
   vmlinux.o: warning: objtool: copy_extent_buffer_full+0x207: unreachable instruction
   vmlinux.o: warning: objtool: try_release_extent_buffer+0x57d: unreachable instruction
   vmlinux.o: warning: objtool: end_page_read+0xbc: unreachable instruction
   vmlinux.o: warning: objtool: end_bio_subpage_eb_writepage+0x335: unreachable instruction
   vmlinux.o: warning: objtool: end_bio_extent_buffer_writepage+0x253: unreachable instruction
   vmlinux.o: warning: objtool: __extent_writepage_io+0x56c: unreachable instruction
   vmlinux.o: warning: objtool: find_lock_delalloc_range+0x30d: unreachable instruction
   vmlinux.o: warning: objtool: lock_delalloc_pages+0x10f: unreachable instruction
   vmlinux.o: warning: objtool: __unlock_for_delalloc+0xbc: unreachable instruction
   vmlinux.o: warning: objtool: end_bio_extent_writepage+0x242: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_release_extent_buffer_pages+0x1e2: unreachable instruction
   vmlinux.o: warning: objtool: find_extent_buffer_readpage+0x110: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_bio_add_page+0x209: unreachable instruction
   vmlinux.o: warning: objtool: close_fs_devices+0x2b0: unreachable instruction
   vmlinux.o: warning: objtool: find_free_dev_extent+0x57d: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_rm_device+0x78d: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_rm_dev_replace_free_srcdev+0x192: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_remove_chunk+0x71d: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_create_chunk+0x935: unreachable instruction
   vmlinux.o: warning: objtool: btrfs_chunk_alloc_add_chunk_item+0x577: unreachable instruction


objdump-func vmlinux.o run_delalloc_nocow:
0000 0000000000c6ed40 <run_delalloc_nocow>:
0000   c6ed40:	55                   	push   %rbp
0001   c6ed41:	41 57                	push   %r15
0003   c6ed43:	41 56                	push   %r14
0005   c6ed45:	41 55                	push   %r13
0007   c6ed47:	41 54                	push   %r12
0009   c6ed49:	53                   	push   %rbx
000a   c6ed4a:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
0011   c6ed51:	4c 89 8c 24 88 00 00 00 	mov    %r9,0x88(%rsp)
0019   c6ed59:	4c 89 84 24 80 00 00 00 	mov    %r8,0x80(%rsp)
0021   c6ed61:	49 89 cf             	mov    %rcx,%r15
0024   c6ed64:	49 89 d5             	mov    %rdx,%r13
0027   c6ed67:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
002c   c6ed6c:	48 89 fb             	mov    %rdi,%rbx
002f   c6ed6f:	e8 00 00 00 00       	call   c6ed74 <run_delalloc_nocow+0x34>	c6ed70: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0034   c6ed74:	4c 8b 23             	mov    (%rbx),%r12
0037   c6ed77:	49 8b 84 24 08 02 00 00 	mov    0x208(%r12),%rax
003f   c6ed7f:	48 89 84 24 d0 00 00 00 	mov    %rax,0xd0(%rsp)
0047   c6ed87:	4c 8b b3 c0 04 00 00 	mov    0x4c0(%rbx),%r14
004e   c6ed8e:	48 c7 84 24 c0 00 00 00 00 00 00 00 	movq   $0x0,0xc0(%rsp)
005a   c6ed9a:	48 c7 84 24 b8 00 00 00 00 00 00 00 	movq   $0x0,0xb8(%rsp)
0066   c6eda6:	48 c7 84 24 b0 00 00 00 00 00 00 00 	movq   $0x0,0xb0(%rsp)
0072   c6edb2:	48 c7 84 24 a8 00 00 00 00 00 00 00 	movq   $0x0,0xa8(%rsp)
007e   c6edbe:	48 c7 84 24 a0 00 00 00 00 00 00 00 	movq   $0x0,0xa0(%rsp)
008a   c6edca:	48 c7 84 24 98 00 00 00 00 00 00 00 	movq   $0x0,0x98(%rsp)
0096   c6edd6:	48 c7 84 24 90 00 00 00 00 00 00 00 	movq   $0x0,0x90(%rsp)
00a2   c6ede2:	e8 00 00 00 00       	call   c6ede7 <run_delalloc_nocow+0xa7>	c6ede3: R_X86_64_PLT32	btrfs_alloc_path-0x4
00a7   c6ede7:	48 85 c0             	test   %rax,%rax
00aa   c6edea:	0f 84 64 07 00 00    	je     c6f554 <run_delalloc_nocow+0x814>
00b0   c6edf0:	48 89 c5             	mov    %rax,%rbp
00b3   c6edf3:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
00b8   c6edf8:	4c 89 7c 24 18       	mov    %r15,0x18(%rsp)
00bd   c6edfd:	4c 89 bc 24 98 00 00 00 	mov    %r15,0x98(%rsp)
00c5   c6ee05:	c6 84 24 a0 00 00 00 01 	movb   $0x1,0xa0(%rsp)
00cd   c6ee0d:	c6 44 24 40 00       	movb   $0x0,0x40(%rsp)
00d2   c6ee12:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)
00db   c6ee1b:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)
00e4   c6ee24:	31 ff                	xor    %edi,%edi
00e6   c6ee26:	4c 89 64 24 70       	mov    %r12,0x70(%rsp)
00eb   c6ee2b:	4c 89 e6             	mov    %r12,%rsi
00ee   c6ee2e:	48 89 c2             	mov    %rax,%rdx
00f1   c6ee31:	4c 89 f1             	mov    %r14,%rcx
00f4   c6ee34:	4c 89 2c 24          	mov    %r13,(%rsp)
00f8   c6ee38:	4d 89 e8             	mov    %r13,%r8
00fb   c6ee3b:	45 31 c9             	xor    %r9d,%r9d
00fe   c6ee3e:	e8 00 00 00 00       	call   c6ee43 <run_delalloc_nocow+0x103>	c6ee3f: R_X86_64_PLT32	btrfs_lookup_file_extent-0x4
0103   c6ee43:	41 89 c5             	mov    %eax,%r13d
0106   c6ee46:	31 ff                	xor    %edi,%edi
0108   c6ee48:	89 c6                	mov    %eax,%esi
010a   c6ee4a:	e8 00 00 00 00       	call   c6ee4f <run_delalloc_nocow+0x10f>	c6ee4b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
010f   c6ee4f:	45 85 ed             	test   %r13d,%r13d
0112   c6ee52:	49 89 ef             	mov    %rbp,%r15
0115   c6ee55:	0f 88 28 07 00 00    	js     c6f583 <run_delalloc_nocow+0x843>
011b   c6ee5b:	4c 89 f3             	mov    %r14,%rbx
011e   c6ee5e:	48 c7 44 24 20 ff ff ff ff 	movq   $0xffffffffffffffff,0x20(%rsp)
0127   c6ee67:	31 c0                	xor    %eax,%eax
0129   c6ee69:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
012e   c6ee6e:	45 31 f6             	xor    %r14d,%r14d
0131   c6ee71:	31 ff                	xor    %edi,%edi
0133   c6ee73:	44 89 ee             	mov    %r13d,%esi
0136   c6ee76:	e8 00 00 00 00       	call   c6ee7b <run_delalloc_nocow+0x13b>	c6ee77: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
013b   c6ee7b:	45 85 ed             	test   %r13d,%r13d
013e   c6ee7e:	74 24                	je     c6eea4 <run_delalloc_nocow+0x164>
0140   c6ee80:	41 8b 6f 40          	mov    0x40(%r15),%ebp
0144   c6ee84:	bf 01 00 00 00       	mov    $0x1,%edi
0149   c6ee89:	89 ee                	mov    %ebp,%esi
014b   c6ee8b:	e8 00 00 00 00       	call   c6ee90 <run_delalloc_nocow+0x150>	c6ee8c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0150   c6ee90:	85 ed                	test   %ebp,%ebp
0152   c6ee92:	0f 9f c0             	setg   %al
0155   c6ee95:	41 f6 d6             	not    %r14b
0158   c6ee98:	41 84 c6             	test   %al,%r14b
015b   c6ee9b:	75 0e                	jne    c6eeab <run_delalloc_nocow+0x16b>
015d   c6ee9d:	e8 00 00 00 00       	call   c6eea2 <run_delalloc_nocow+0x162>	c6ee9e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0162   c6eea2:	eb 6e                	jmp    c6ef12 <run_delalloc_nocow+0x1d2>
0164   c6eea4:	e8 00 00 00 00       	call   c6eea9 <run_delalloc_nocow+0x169>	c6eea5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0169   c6eea9:	eb 67                	jmp    c6ef12 <run_delalloc_nocow+0x1d2>
016b   c6eeab:	49 8b 3f             	mov    (%r15),%rdi
016e   c6eeae:	83 c5 ff             	add    $0xffffffff,%ebp
0171   c6eeb1:	48 8d 04 ad 00 00 00 00 	lea    0x0(,%rbp,4),%rax
0179   c6eeb9:	48 01 e8             	add    %rbp,%rax
017c   c6eebc:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
0180   c6eec0:	48 83 c2 65          	add    $0x65,%rdx
0184   c6eec4:	b9 11 00 00 00       	mov    $0x11,%ecx
0189   c6eec9:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
018e   c6eece:	e8 00 00 00 00       	call   c6eed3 <run_delalloc_nocow+0x193>	c6eecf: R_X86_64_PLT32	read_extent_buffer-0x4
0193   c6eed3:	48 8b 6c 24 30       	mov    0x30(%rsp),%rbp
0198   c6eed8:	48 89 ef             	mov    %rbp,%rdi
019b   c6eedb:	48 89 de             	mov    %rbx,%rsi
019e   c6eede:	e8 00 00 00 00       	call   c6eee3 <run_delalloc_nocow+0x1a3>	c6eedf: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
01a3   c6eee3:	44 8a 74 24 38       	mov    0x38(%rsp),%r14b
01a8   c6eee8:	41 0f b6 f6          	movzbl %r14b,%esi
01ac   c6eeec:	bf 6c 00 00 00       	mov    $0x6c,%edi
01b1   c6eef1:	e8 00 00 00 00       	call   c6eef6 <run_delalloc_nocow+0x1b6>	c6eef2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
01b6   c6eef6:	48 39 dd             	cmp    %rbx,%rbp
01b9   c6eef9:	75 12                	jne    c6ef0d <run_delalloc_nocow+0x1cd>
01bb   c6eefb:	41 80 fe 6c          	cmp    $0x6c,%r14b
01bf   c6eeff:	75 0c                	jne    c6ef0d <run_delalloc_nocow+0x1cd>
01c1   c6ef01:	e8 00 00 00 00       	call   c6ef06 <run_delalloc_nocow+0x1c6>	c6ef02: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01c6   c6ef06:	41 83 47 40 ff       	addl   $0xffffffff,0x40(%r15)
01cb   c6ef0b:	eb 05                	jmp    c6ef12 <run_delalloc_nocow+0x1d2>
01cd   c6ef0d:	e8 00 00 00 00       	call   c6ef12 <run_delalloc_nocow+0x1d2>	c6ef0e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01d2   c6ef12:	41 8b 6f 40          	mov    0x40(%r15),%ebp
01d6   c6ef16:	31 c0                	xor    %eax,%eax
01d8   c6ef18:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
01dd   c6ef1d:	31 c0                	xor    %eax,%eax
01df   c6ef1f:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
01e4   c6ef24:	4d 8b 27             	mov    (%r15),%r12
01e7   c6ef27:	49 8b 04 24          	mov    (%r12),%rax
01eb   c6ef2b:	49 8b 8c 24 30 01 00 00 	mov    0x130(%r12),%rcx
01f3   c6ef33:	48 2b 0d 00 00 00 00 	sub    0x0(%rip),%rcx        # c6ef3a <run_delalloc_nocow+0x1fa>	c6ef36: R_X86_64_PC32	vmemmap_base-0x4
01fa   c6ef3a:	48 c1 e1 06          	shl    $0x6,%rcx
01fe   c6ef3e:	48 03 0d 00 00 00 00 	add    0x0(%rip),%rcx        # c6ef45 <run_delalloc_nocow+0x205>	c6ef41: R_X86_64_PC32	page_offset_base-0x4
0205   c6ef45:	25 ff 0f 00 00       	and    $0xfff,%eax
020a   c6ef4a:	44 8b 74 08 60       	mov    0x60(%rax,%rcx,1),%r14d
020f   c6ef4f:	89 ef                	mov    %ebp,%edi
0211   c6ef51:	44 89 f6             	mov    %r14d,%esi
0214   c6ef54:	e8 00 00 00 00       	call   c6ef59 <run_delalloc_nocow+0x219>	c6ef55: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
0219   c6ef59:	44 39 f5             	cmp    %r14d,%ebp
021c   c6ef5c:	73 07                	jae    c6ef65 <run_delalloc_nocow+0x225>
021e   c6ef5e:	e8 00 00 00 00       	call   c6ef63 <run_delalloc_nocow+0x223>	c6ef5f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0223   c6ef63:	eb 46                	jmp    c6efab <run_delalloc_nocow+0x26b>
0225   c6ef65:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
022a   c6ef6a:	4c 89 fe             	mov    %r15,%rsi
022d   c6ef6d:	31 d2                	xor    %edx,%edx
022f   c6ef6f:	e8 00 00 00 00       	call   c6ef74 <run_delalloc_nocow+0x234>	c6ef70: R_X86_64_PLT32	btrfs_next_old_leaf-0x4
0234   c6ef74:	41 89 c5             	mov    %eax,%r13d
0237   c6ef77:	31 ff                	xor    %edi,%edi
0239   c6ef79:	89 c6                	mov    %eax,%esi
023b   c6ef7b:	e8 00 00 00 00       	call   c6ef80 <run_delalloc_nocow+0x240>	c6ef7c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0240   c6ef80:	45 85 ed             	test   %r13d,%r13d
0243   c6ef83:	0f 88 19 06 00 00    	js     c6f5a2 <run_delalloc_nocow+0x862>
0249   c6ef89:	31 ff                	xor    %edi,%edi
024b   c6ef8b:	44 89 ee             	mov    %r13d,%esi
024e   c6ef8e:	e8 00 00 00 00       	call   c6ef93 <run_delalloc_nocow+0x253>	c6ef8f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0253   c6ef93:	45 85 ed             	test   %r13d,%r13d
0256   c6ef96:	0f 85 3f 06 00 00    	jne    c6f5db <run_delalloc_nocow+0x89b>
025c   c6ef9c:	e8 00 00 00 00       	call   c6efa1 <run_delalloc_nocow+0x261>	c6ef9d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0261   c6efa1:	4d 8b 27             	mov    (%r15),%r12
0264   c6efa4:	41 8b 6f 40          	mov    0x40(%r15),%ebp
0268   c6efa8:	45 31 ed             	xor    %r13d,%r13d
026b   c6efab:	48 63 c5             	movslq %ebp,%rax
026e   c6efae:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
0272   c6efb2:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
0276   c6efb6:	48 83 c2 65          	add    $0x65,%rdx
027a   c6efba:	b9 11 00 00 00       	mov    $0x11,%ecx
027f   c6efbf:	4c 89 e7             	mov    %r12,%rdi
0282   c6efc2:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
0287   c6efc7:	e8 00 00 00 00       	call   c6efcc <run_delalloc_nocow+0x28c>	c6efc8: R_X86_64_PLT32	read_extent_buffer-0x4
028c   c6efcc:	48 8b 6c 24 30       	mov    0x30(%rsp),%rbp
0291   c6efd1:	48 89 ef             	mov    %rbp,%rdi
0294   c6efd4:	48 89 de             	mov    %rbx,%rsi
0297   c6efd7:	e8 00 00 00 00       	call   c6efdc <run_delalloc_nocow+0x29c>	c6efd8: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
029c   c6efdc:	48 39 dd             	cmp    %rbx,%rbp
029f   c6efdf:	0f 87 b6 05 00 00    	ja     c6f59b <run_delalloc_nocow+0x85b>
02a5   c6efe5:	48 89 ef             	mov    %rbp,%rdi
02a8   c6efe8:	48 89 de             	mov    %rbx,%rsi
02ab   c6efeb:	e8 00 00 00 00       	call   c6eff0 <run_delalloc_nocow+0x2b0>	c6efec: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
02b0   c6eff0:	48 39 dd             	cmp    %rbx,%rbp
02b3   c6eff3:	0f 82 a7 01 00 00    	jb     c6f1a0 <run_delalloc_nocow+0x460>
02b9   c6eff9:	0f b6 6c 24 38       	movzbl 0x38(%rsp),%ebp
02be   c6effe:	bf 6c 00 00 00       	mov    $0x6c,%edi
02c3   c6f003:	89 ee                	mov    %ebp,%esi
02c5   c6f005:	e8 00 00 00 00       	call   c6f00a <run_delalloc_nocow+0x2ca>	c6f006: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
02ca   c6f00a:	83 fd 6b             	cmp    $0x6b,%ebp
02cd   c6f00d:	77 15                	ja     c6f024 <run_delalloc_nocow+0x2e4>
02cf   c6f00f:	e8 00 00 00 00       	call   c6f014 <run_delalloc_nocow+0x2d4>	c6f010: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02d4   c6f014:	41 8b 6f 40          	mov    0x40(%r15),%ebp
02d8   c6f018:	83 c5 01             	add    $0x1,%ebp
02db   c6f01b:	41 89 6f 40          	mov    %ebp,0x40(%r15)
02df   c6f01f:	e9 00 ff ff ff       	jmp    c6ef24 <run_delalloc_nocow+0x1e4>
02e4   c6f024:	40 0f b6 ed          	movzbl %bpl,%ebp
02e8   c6f028:	bf 6c 00 00 00       	mov    $0x6c,%edi
02ed   c6f02d:	89 ee                	mov    %ebp,%esi
02ef   c6f02f:	e8 00 00 00 00       	call   c6f034 <run_delalloc_nocow+0x2f4>	c6f030: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
02f4   c6f034:	40 80 fd 6c          	cmp    $0x6c,%bpl
02f8   c6f038:	0f 85 cd 06 00 00    	jne    c6f70b <run_delalloc_nocow+0x9cb>
02fe   c6f03e:	48 8b 6c 24 39       	mov    0x39(%rsp),%rbp
0303   c6f043:	48 89 ef             	mov    %rbp,%rdi
0306   c6f046:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
030b   c6f04b:	4c 89 f6             	mov    %r14,%rsi
030e   c6f04e:	e8 00 00 00 00       	call   c6f053 <run_delalloc_nocow+0x313>	c6f04f: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
0313   c6f053:	4c 39 f5             	cmp    %r14,%rbp
0316   c6f056:	0f 87 b9 06 00 00    	ja     c6f715 <run_delalloc_nocow+0x9d5>
031c   c6f05c:	48 89 ef             	mov    %rbp,%rdi
031f   c6f05f:	4c 8b 34 24          	mov    (%rsp),%r14
0323   c6f063:	4c 89 f6             	mov    %r14,%rsi
0326   c6f066:	e8 00 00 00 00       	call   c6f06b <run_delalloc_nocow+0x32b>	c6f067: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
032b   c6f06b:	4c 39 f5             	cmp    %r14,%rbp
032e   c6f06e:	77 7a                	ja     c6f0ea <run_delalloc_nocow+0x3aa>
0330   c6f070:	49 63 47 40          	movslq 0x40(%r15),%rax
0334   c6f074:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
0338   c6f078:	48 8d 34 80          	lea    (%rax,%rax,4),%rsi
033c   c6f07c:	48 83 c6 65          	add    $0x65,%rsi
0340   c6f080:	ba 11 00 00 00       	mov    $0x11,%edx
0345   c6f085:	4c 89 e7             	mov    %r12,%rdi
0348   c6f088:	e8 00 00 00 00       	call   c6f08d <run_delalloc_nocow+0x34d>	c6f089: R_X86_64_PLT32	btrfs_get_32-0x4
034d   c6f08d:	89 c5                	mov    %eax,%ebp
034f   c6f08f:	48 83 c5 65          	add    $0x65,%rbp
0353   c6f093:	ba 14 00 00 00       	mov    $0x14,%edx
0358   c6f098:	4c 89 e7             	mov    %r12,%rdi
035b   c6f09b:	48 89 ee             	mov    %rbp,%rsi
035e   c6f09e:	e8 00 00 00 00       	call   c6f0a3 <run_delalloc_nocow+0x363>	c6f09f: R_X86_64_PLT32	btrfs_get_8-0x4
0363   c6f0a3:	41 89 c6             	mov    %eax,%r14d
0366   c6f0a6:	0f b6 f0             	movzbl %al,%esi
0369   c6f0a9:	bf 03 00 00 00       	mov    $0x3,%edi
036e   c6f0ae:	e8 00 00 00 00       	call   c6f0b3 <run_delalloc_nocow+0x373>	c6f0af: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0373   c6f0b3:	41 80 fe 03          	cmp    $0x3,%r14b
0377   c6f0b7:	0f 83 a6 06 00 00    	jae    c6f763 <run_delalloc_nocow+0xa23>
037d   c6f0bd:	ba 08 00 00 00       	mov    $0x8,%edx
0382   c6f0c2:	4c 89 e7             	mov    %r12,%rdi
0385   c6f0c5:	48 89 ee             	mov    %rbp,%rsi
0388   c6f0c8:	e8 00 00 00 00       	call   c6f0cd <run_delalloc_nocow+0x38d>	c6f0c9: R_X86_64_PLT32	btrfs_get_64-0x4
038d   c6f0cd:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
0392   c6f0d2:	4c 89 ff             	mov    %r15,%rdi
0395   c6f0d5:	e8 00 00 00 00       	call   c6f0da <run_delalloc_nocow+0x39a>	c6f0d6: R_X86_64_PLT32	btrfs_file_extent_end-0x4
039a   c6f0da:	48 3b 04 24          	cmp    (%rsp),%rax
039e   c6f0de:	77 2b                	ja     c6f10b <run_delalloc_nocow+0x3cb>
03a0   c6f0e0:	e8 00 00 00 00       	call   c6f0e5 <run_delalloc_nocow+0x3a5>	c6f0e1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03a5   c6f0e5:	e9 2a ff ff ff       	jmp    c6f014 <run_delalloc_nocow+0x2d4>
03aa   c6f0ea:	48 89 6c 24 50       	mov    %rbp,0x50(%rsp)
03af   c6f0ef:	e8 00 00 00 00       	call   c6f0f4 <run_delalloc_nocow+0x3b4>	c6f0f0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03b4   c6f0f4:	c7 44 24 58 00 00 00 00 	movl   $0x0,0x58(%rsp)
03bc   c6f0fc:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
03c1   c6f101:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
03c6   c6f106:	e9 ab 00 00 00       	jmp    c6f1b6 <run_delalloc_nocow+0x476>
03cb   c6f10b:	48 89 c5             	mov    %rax,%rbp
03ce   c6f10e:	48 8b 04 24          	mov    (%rsp),%rax
03d2   c6f112:	48 89 84 24 90 00 00 00 	mov    %rax,0x90(%rsp)
03da   c6f11a:	4c 89 ff             	mov    %r15,%rdi
03dd   c6f11d:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
03e2   c6f122:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
03e7   c6f127:	48 8d 8c 24 90 00 00 00 	lea    0x90(%rsp),%rcx
03ef   c6f12f:	e8 8c c0 00 00       	call   c7b1c0 <can_nocow_file_extent>
03f4   c6f134:	41 89 c5             	mov    %eax,%r13d
03f7   c6f137:	31 ff                	xor    %edi,%edi
03f9   c6f139:	89 c6                	mov    %eax,%esi
03fb   c6f13b:	e8 00 00 00 00       	call   c6f140 <run_delalloc_nocow+0x400>	c6f13c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0400   c6f140:	45 85 ed             	test   %r13d,%r13d
0403   c6f143:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
0408   c6f148:	0f 88 db 05 00 00    	js     c6f729 <run_delalloc_nocow+0x9e9>
040e   c6f14e:	44 89 74 24 58       	mov    %r14d,0x58(%rsp)
0413   c6f153:	31 ff                	xor    %edi,%edi
0415   c6f155:	44 89 ee             	mov    %r13d,%esi
0418   c6f158:	e8 00 00 00 00       	call   c6f15d <run_delalloc_nocow+0x41d>	c6f159: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
041d   c6f15d:	45 85 ed             	test   %r13d,%r13d
0420   c6f160:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
0425   c6f165:	48 89 6c 24 50       	mov    %rbp,0x50(%rsp)
042a   c6f16a:	74 42                	je     c6f1ae <run_delalloc_nocow+0x46e>
042c   c6f16c:	e8 00 00 00 00       	call   c6f171 <run_delalloc_nocow+0x431>	c6f16d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0431   c6f171:	48 8b b4 24 a8 00 00 00 	mov    0xa8(%rsp),%rsi
0439   c6f179:	48 8b bc 24 d0 00 00 00 	mov    0xd0(%rsp),%rdi
0441   c6f181:	e8 00 00 00 00       	call   c6f186 <run_delalloc_nocow+0x446>	c6f182: R_X86_64_PLT32	btrfs_inc_nocow_writers-0x4
0446   c6f186:	48 89 c1             	mov    %rax,%rcx
0449   c6f189:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
044e   c6f18e:	48 85 c0             	test   %rax,%rax
0451   c6f191:	45 0f b6 f6          	movzbl %r14b,%r14d
0455   c6f195:	b8 01 00 00 00       	mov    $0x1,%eax
045a   c6f19a:	44 0f 45 f0          	cmovne %eax,%r14d
045e   c6f19e:	eb 13                	jmp    c6f1b3 <run_delalloc_nocow+0x473>
0460   c6f1a0:	e8 00 00 00 00       	call   c6f1a5 <run_delalloc_nocow+0x465>	c6f1a1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0465   c6f1a5:	90                   	nop
0466   c6f1a6:	0f 0b                	ud2
0468   c6f1a8:	90                   	nop
0469   c6f1a9:	e9 66 fe ff ff       	jmp    c6f014 <run_delalloc_nocow+0x2d4>
046e   c6f1ae:	e8 00 00 00 00       	call   c6f1b3 <run_delalloc_nocow+0x473>	c6f1af: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0473   c6f1b3:	45 31 ed             	xor    %r13d,%r13d
0476   c6f1b6:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
047b   c6f1bb:	44 89 f0             	mov    %r14d,%eax
047e   c6f1be:	24 01                	and    $0x1,%al
0480   c6f1c0:	44 0f b6 f0          	movzbl %al,%r14d
0484   c6f1c4:	31 ff                	xor    %edi,%edi
0486   c6f1c6:	44 89 f6             	mov    %r14d,%esi
0489   c6f1c9:	e8 00 00 00 00       	call   c6f1ce <run_delalloc_nocow+0x48e>	c6f1ca: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
048e   c6f1ce:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
0495   c6f1d5:	48 8b 6c 24 20       	mov    0x20(%rsp),%rbp
049a   c6f1da:	48 89 ee             	mov    %rbp,%rsi
049d   c6f1dd:	e8 00 00 00 00       	call   c6f1e2 <run_delalloc_nocow+0x4a2>	c6f1de: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
04a2   c6f1e2:	45 84 f6             	test   %r14b,%r14b
04a5   c6f1e5:	75 49                	jne    c6f230 <run_delalloc_nocow+0x4f0>
04a7   c6f1e7:	48 83 fd ff          	cmp    $0xffffffffffffffff,%rbp
04ab   c6f1eb:	48 0f 44 2c 24       	cmove  (%rsp),%rbp
04b0   c6f1f0:	48 89 6c 24 20       	mov    %rbp,0x20(%rsp)
04b5   c6f1f5:	4c 8b 74 24 50       	mov    0x50(%rsp),%r14
04ba   c6f1fa:	4c 89 f7             	mov    %r14,%rdi
04bd   c6f1fd:	4c 89 e5             	mov    %r12,%rbp
04c0   c6f200:	4c 89 e6             	mov    %r12,%rsi
04c3   c6f203:	e8 00 00 00 00       	call   c6f208 <run_delalloc_nocow+0x4c8>	c6f204: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
04c8   c6f208:	4d 39 e6             	cmp    %r12,%r14
04cb   c6f20b:	0f 87 0e 05 00 00    	ja     c6f71f <run_delalloc_nocow+0x9df>
04d1   c6f211:	49 83 3f 00          	cmpq   $0x0,(%r15)
04d5   c6f215:	74 66                	je     c6f27d <run_delalloc_nocow+0x53d>
04d7   c6f217:	e8 00 00 00 00       	call   c6f21c <run_delalloc_nocow+0x4dc>	c6f218: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04dc   c6f21c:	41 8b 6f 40          	mov    0x40(%r15),%ebp
04e0   c6f220:	83 c5 01             	add    $0x1,%ebp
04e3   c6f223:	41 89 6f 40          	mov    %ebp,0x40(%r15)
04e7   c6f227:	4c 89 34 24          	mov    %r14,(%rsp)
04eb   c6f22b:	e9 f4 fc ff ff       	jmp    c6ef24 <run_delalloc_nocow+0x1e4>
04f0   c6f230:	48 83 fd ff          	cmp    $0xffffffffffffffff,%rbp
04f4   c6f234:	74 51                	je     c6f287 <run_delalloc_nocow+0x547>
04f6   c6f236:	48 8b 4c 24 39       	mov    0x39(%rsp),%rcx
04fb   c6f23b:	48 83 c1 ff          	add    $0xffffffffffffffff,%rcx
04ff   c6f23f:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
0504   c6f244:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
0509   c6f249:	48 89 ea             	mov    %rbp,%rdx
050c   c6f24c:	4c 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%r8
0514   c6f254:	4c 8b 8c 24 88 00 00 00 	mov    0x88(%rsp),%r9
051c   c6f25c:	e8 5f 0d 01 00       	call   c7ffc0 <fallback_to_cow>
0521   c6f261:	41 89 c5             	mov    %eax,%r13d
0524   c6f264:	31 ff                	xor    %edi,%edi
0526   c6f266:	89 c6                	mov    %eax,%esi
0528   c6f268:	e8 00 00 00 00       	call   c6f26d <run_delalloc_nocow+0x52d>	c6f269: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
052d   c6f26d:	45 85 ed             	test   %r13d,%r13d
0530   c6f270:	0f 85 5a 05 00 00    	jne    c6f7d0 <run_delalloc_nocow+0xa90>
0536   c6f276:	e8 00 00 00 00       	call   c6f27b <run_delalloc_nocow+0x53b>	c6f277: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
053b   c6f27b:	eb 0f                	jmp    c6f28c <run_delalloc_nocow+0x54c>
053d   c6f27d:	e8 00 00 00 00       	call   c6f282 <run_delalloc_nocow+0x542>	c6f27e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0542   c6f282:	e9 7f 02 00 00       	jmp    c6f506 <run_delalloc_nocow+0x7c6>
0547   c6f287:	e8 00 00 00 00       	call   c6f28c <run_delalloc_nocow+0x54c>	c6f288: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
054c   c6f28c:	48 8b ac 24 c0 00 00 00 	mov    0xc0(%rsp),%rbp
0554   c6f294:	4c 8b 34 24          	mov    (%rsp),%r14
0558   c6f298:	49 8d 04 2e          	lea    (%r14,%rbp,1),%rax
055c   c6f29c:	48 83 c0 ff          	add    $0xffffffffffffffff,%rax
0560   c6f2a0:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
0565   c6f2a5:	44 0f b6 6c 24 58    	movzbl 0x58(%rsp),%r13d
056b   c6f2ab:	bf 02 00 00 00       	mov    $0x2,%edi
0570   c6f2b0:	44 89 ee             	mov    %r13d,%esi
0573   c6f2b3:	e8 00 00 00 00       	call   c6f2b8 <run_delalloc_nocow+0x578>	c6f2b4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0578   c6f2b8:	41 80 fd 02          	cmp    $0x2,%r13b
057c   c6f2bc:	48 89 6c 24 20       	mov    %rbp,0x20(%rsp)
0581   c6f2c1:	4c 89 7c 24 60       	mov    %r15,0x60(%rsp)
0586   c6f2c6:	0f 85 b2 00 00 00    	jne    c6f37e <run_delalloc_nocow+0x63e>
058c   c6f2cc:	48 8b 6c 24 39       	mov    0x39(%rsp),%rbp
0591   c6f2d1:	4c 8b a4 24 b8 00 00 00 	mov    0xb8(%rsp),%r12
0599   c6f2d9:	4c 8b b4 24 a8 00 00 00 	mov    0xa8(%rsp),%r14
05a1   c6f2e1:	48 8b 84 24 b0 00 00 00 	mov    0xb0(%rsp),%rax
05a9   c6f2e9:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
05ae   c6f2ee:	e8 00 00 00 00       	call   c6f2f3 <run_delalloc_nocow+0x5b3>	c6f2ef: R_X86_64_PLT32	alloc_extent_map-0x4
05b3   c6f2f3:	48 85 c0             	test   %rax,%rax
05b6   c6f2f6:	0f 84 db 04 00 00    	je     c6f7d7 <run_delalloc_nocow+0xa97>
05bc   c6f2fc:	49 89 c5             	mov    %rax,%r13
05bf   c6f2ff:	4c 29 e5             	sub    %r12,%rbp
05c2   c6f302:	48 8b 04 24          	mov    (%rsp),%rax
05c6   c6f306:	49 89 45 18          	mov    %rax,0x18(%r13)
05ca   c6f30a:	49 89 6d 38          	mov    %rbp,0x38(%r13)
05ce   c6f30e:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
05d3   c6f313:	49 89 45 20          	mov    %rax,0x20(%r13)
05d7   c6f317:	49 89 45 58          	mov    %rax,0x58(%r13)
05db   c6f31b:	4c 89 b4 24 c8 00 00 00 	mov    %r14,0xc8(%rsp)
05e3   c6f323:	4d 89 75 50          	mov    %r14,0x50(%r13)
05e7   c6f327:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
05ec   c6f32c:	49 89 45 40          	mov    %rax,0x40(%r13)
05f0   c6f330:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
05f5   c6f335:	49 89 45 48          	mov    %rax,0x48(%r13)
05f9   c6f339:	49 c7 45 60 ff ff ff ff 	movq   $0xffffffffffffffff,0x60(%r13)
0601   c6f341:	41 80 4d 68 01       	orb    $0x1,0x68(%r13)
0606   c6f346:	41 80 4d 68 10       	orb    $0x10,0x68(%r13)
060b   c6f34b:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
0610   c6f350:	4c 89 ee             	mov    %r13,%rsi
0613   c6f353:	ba 01 00 00 00       	mov    $0x1,%edx
0618   c6f358:	e8 00 00 00 00       	call   c6f35d <run_delalloc_nocow+0x61d>	c6f359: R_X86_64_PLT32	btrfs_replace_extent_map_range-0x4
061d   c6f35d:	89 c5                	mov    %eax,%ebp
061f   c6f35f:	31 ff                	xor    %edi,%edi
0621   c6f361:	89 c6                	mov    %eax,%esi
0623   c6f363:	e8 00 00 00 00       	call   c6f368 <run_delalloc_nocow+0x628>	c6f364: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0628   c6f368:	85 ed                	test   %ebp,%ebp
062a   c6f36a:	74 5b                	je     c6f3c7 <run_delalloc_nocow+0x687>
062c   c6f36c:	e8 00 00 00 00       	call   c6f371 <run_delalloc_nocow+0x631>	c6f36d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0631   c6f371:	4c 89 ef             	mov    %r13,%rdi
0634   c6f374:	e8 00 00 00 00       	call   c6f379 <run_delalloc_nocow+0x639>	c6f375: R_X86_64_PLT32	free_extent_map-0x4
0639   c6f379:	4c 63 ed             	movslq %ebp,%r13
063c   c6f37c:	eb 4e                	jmp    c6f3cc <run_delalloc_nocow+0x68c>
063e   c6f37e:	4c 8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%r8
0646   c6f386:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
064b   c6f38b:	4c 89 f6             	mov    %r14,%rsi
064e   c6f38e:	48 89 ea             	mov    %rbp,%rdx
0651   c6f391:	48 89 e9             	mov    %rbp,%rcx
0654   c6f394:	49 89 e9             	mov    %rbp,%r9
0657   c6f397:	6a 00                	push   $0x0
0659   c6f399:	6a 02                	push   $0x2
065b   c6f39b:	6a 00                	push   $0x0
065d   c6f39d:	e8 00 00 00 00       	call   c6f3a2 <run_delalloc_nocow+0x662>	c6f39e: R_X86_64_PLT32	btrfs_add_ordered_extent-0x4
0662   c6f3a2:	48 83 c4 18          	add    $0x18,%rsp
0666   c6f3a6:	41 89 c5             	mov    %eax,%r13d
0669   c6f3a9:	31 ff                	xor    %edi,%edi
066b   c6f3ab:	89 c6                	mov    %eax,%esi
066d   c6f3ad:	e8 00 00 00 00       	call   c6f3b2 <run_delalloc_nocow+0x672>	c6f3ae: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0672   c6f3b2:	45 85 ed             	test   %r13d,%r13d
0675   c6f3b5:	0f 85 2a 04 00 00    	jne    c6f7e5 <run_delalloc_nocow+0xaa5>
067b   c6f3bb:	e8 00 00 00 00       	call   c6f3c0 <run_delalloc_nocow+0x680>	c6f3bc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0680   c6f3c0:	4c 8b 74 24 50       	mov    0x50(%rsp),%r14
0685   c6f3c5:	eb 6c                	jmp    c6f433 <run_delalloc_nocow+0x6f3>
0687   c6f3c7:	e8 00 00 00 00       	call   c6f3cc <run_delalloc_nocow+0x68c>	c6f3c8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
068c   c6f3cc:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
0691   c6f3d1:	4c 8b 74 24 50       	mov    0x50(%rsp),%r14
0696   c6f3d6:	49 81 fd 01 f0 ff ff 	cmp    $0xfffffffffffff001,%r13
069d   c6f3dd:	48 8b ac 24 c8 00 00 00 	mov    0xc8(%rsp),%rbp
06a5   c6f3e5:	0f 83 01 04 00 00    	jae    c6f7ec <run_delalloc_nocow+0xaac>
06ab   c6f3eb:	4c 89 ef             	mov    %r13,%rdi
06ae   c6f3ee:	e8 00 00 00 00       	call   c6f3f3 <run_delalloc_nocow+0x6b3>	c6f3ef: R_X86_64_PLT32	free_extent_map-0x4
06b3   c6f3f3:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
06b8   c6f3f8:	48 8b 34 24          	mov    (%rsp),%rsi
06bc   c6f3fc:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
06c1   c6f401:	48 89 ca             	mov    %rcx,%rdx
06c4   c6f404:	49 89 e8             	mov    %rbp,%r8
06c7   c6f407:	49 89 c9             	mov    %rcx,%r9
06ca   c6f40a:	6a 00                	push   $0x0
06cc   c6f40c:	6a 04                	push   $0x4
06ce   c6f40e:	6a 00                	push   $0x0
06d0   c6f410:	e8 00 00 00 00       	call   c6f415 <run_delalloc_nocow+0x6d5>	c6f411: R_X86_64_PLT32	btrfs_add_ordered_extent-0x4
06d5   c6f415:	48 83 c4 18          	add    $0x18,%rsp
06d9   c6f419:	41 89 c5             	mov    %eax,%r13d
06dc   c6f41c:	31 ff                	xor    %edi,%edi
06de   c6f41e:	89 c6                	mov    %eax,%esi
06e0   c6f420:	e8 00 00 00 00       	call   c6f425 <run_delalloc_nocow+0x6e5>	c6f421: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
06e5   c6f425:	45 85 ed             	test   %r13d,%r13d
06e8   c6f428:	0f 85 d1 03 00 00    	jne    c6f7ff <run_delalloc_nocow+0xabf>
06ee   c6f42e:	e8 00 00 00 00       	call   c6f433 <run_delalloc_nocow+0x6f3>	c6f42f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06f3   c6f433:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
06f8   c6f438:	e8 00 00 00 00       	call   c6f43d <run_delalloc_nocow+0x6fd>	c6f439: R_X86_64_PLT32	btrfs_dec_nocow_writers-0x4
06fd   c6f43d:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
0702   c6f442:	48 8b a8 f7 01 00 00 	mov    0x1f7(%rax),%rbp
0709   c6f449:	48 c7 c7 f7 ff ff ff 	mov    $0xfffffffffffffff7,%rdi
0710   c6f450:	48 89 ee             	mov    %rbp,%rsi
0713   c6f453:	e8 00 00 00 00       	call   c6f458 <run_delalloc_nocow+0x718>	c6f454: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0718   c6f458:	48 83 fd f7          	cmp    $0xfffffffffffffff7,%rbp
071c   c6f45c:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
0721   c6f461:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
0726   c6f466:	75 4d                	jne    c6f4b5 <run_delalloc_nocow+0x775>
0728   c6f468:	48 89 ef             	mov    %rbp,%rdi
072b   c6f46b:	4c 8b 3c 24          	mov    (%rsp),%r15
072f   c6f46f:	4c 89 fe             	mov    %r15,%rsi
0732   c6f472:	e8 00 00 00 00       	call   c6f477 <run_delalloc_nocow+0x737>	c6f473: R_X86_64_PLT32	btrfs_reloc_clone_csums-0x4
0737   c6f477:	41 89 c5             	mov    %eax,%r13d
073a   c6f47a:	41 b9 09 00 00 00    	mov    $0x9,%r9d
0740   c6f480:	48 89 ef             	mov    %rbp,%rdi
0743   c6f483:	4c 89 fe             	mov    %r15,%rsi
0746   c6f486:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
074b   c6f48b:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
0750   c6f490:	41 b8 14 10 00 00    	mov    $0x1014,%r8d
0756   c6f496:	e8 00 00 00 00       	call   c6f49b <run_delalloc_nocow+0x75b>	c6f497: R_X86_64_PLT32	extent_clear_unlock_delalloc-0x4
075b   c6f49b:	31 ff                	xor    %edi,%edi
075d   c6f49d:	44 89 ee             	mov    %r13d,%esi
0760   c6f4a0:	e8 00 00 00 00       	call   c6f4a5 <run_delalloc_nocow+0x765>	c6f4a1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0765   c6f4a5:	45 85 ed             	test   %r13d,%r13d
0768   c6f4a8:	0f 85 73 03 00 00    	jne    c6f821 <run_delalloc_nocow+0xae1>
076e   c6f4ae:	e8 00 00 00 00       	call   c6f4b3 <run_delalloc_nocow+0x773>	c6f4af: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0773   c6f4b3:	eb 27                	jmp    c6f4dc <run_delalloc_nocow+0x79c>
0775   c6f4b5:	e8 00 00 00 00       	call   c6f4ba <run_delalloc_nocow+0x77a>	c6f4b6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
077a   c6f4ba:	41 b9 09 00 00 00    	mov    $0x9,%r9d
0780   c6f4c0:	48 89 ef             	mov    %rbp,%rdi
0783   c6f4c3:	48 8b 34 24          	mov    (%rsp),%rsi
0787   c6f4c7:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
078c   c6f4cc:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
0791   c6f4d1:	41 b8 14 10 00 00    	mov    $0x1014,%r8d
0797   c6f4d7:	e8 00 00 00 00       	call   c6f4dc <run_delalloc_nocow+0x79c>	c6f4d8: R_X86_64_PLT32	extent_clear_unlock_delalloc-0x4
079c   c6f4dc:	4c 8b 7c 24 60       	mov    0x60(%rsp),%r15
07a1   c6f4e1:	4c 89 f7             	mov    %r14,%rdi
07a4   c6f4e4:	4c 89 e5             	mov    %r12,%rbp
07a7   c6f4e7:	4c 89 e6             	mov    %r12,%rsi
07aa   c6f4ea:	e8 00 00 00 00       	call   c6f4ef <run_delalloc_nocow+0x7af>	c6f4eb: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
07af   c6f4ef:	4d 39 e6             	cmp    %r12,%r14
07b2   c6f4f2:	0f 87 bb 02 00 00    	ja     c6f7b3 <run_delalloc_nocow+0xa73>
07b8   c6f4f8:	e8 00 00 00 00       	call   c6f4fd <run_delalloc_nocow+0x7bd>	c6f4f9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07bd   c6f4fd:	48 c7 44 24 20 ff ff ff ff 	movq   $0xffffffffffffffff,0x20(%rsp)
07c6   c6f506:	c6 44 24 40 00       	movb   $0x0,0x40(%rsp)
07cb   c6f50b:	48 c7 44 24 38 00 00 00 00 	movq   $0x0,0x38(%rsp)
07d4   c6f514:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)
07dd   c6f51d:	31 ff                	xor    %edi,%edi
07df   c6f51f:	48 8b 74 24 70       	mov    0x70(%rsp),%rsi
07e4   c6f524:	4c 89 fa             	mov    %r15,%rdx
07e7   c6f527:	48 89 d9             	mov    %rbx,%rcx
07ea   c6f52a:	4d 89 f0             	mov    %r14,%r8
07ed   c6f52d:	45 31 c9             	xor    %r9d,%r9d
07f0   c6f530:	e8 00 00 00 00       	call   c6f535 <run_delalloc_nocow+0x7f5>	c6f531: R_X86_64_PLT32	btrfs_lookup_file_extent-0x4
07f5   c6f535:	41 89 c5             	mov    %eax,%r13d
07f8   c6f538:	85 c0                	test   %eax,%eax
07fa   c6f53a:	4c 89 f5             	mov    %r14,%rbp
07fd   c6f53d:	0f 88 5f 02 00 00    	js     c6f7a2 <run_delalloc_nocow+0xa62>
0803   c6f543:	e8 00 00 00 00       	call   c6f548 <run_delalloc_nocow+0x808>	c6f544: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0808   c6f548:	41 b6 01             	mov    $0x1,%r14b
080b   c6f54b:	48 89 2c 24          	mov    %rbp,(%rsp)
080f   c6f54f:	e9 1d f9 ff ff       	jmp    c6ee71 <run_delalloc_nocow+0x131>
0814   c6f554:	e8 00 00 00 00       	call   c6f559 <run_delalloc_nocow+0x819>	c6f555: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0819   c6f559:	41 b9 07 00 00 00    	mov    $0x7,%r9d
081f   c6f55f:	48 89 df             	mov    %rbx,%rdi
0822   c6f562:	4c 89 ee             	mov    %r13,%rsi
0825   c6f565:	4c 89 fa             	mov    %r15,%rdx
0828   c6f568:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
082d   c6f56d:	41 b8 34 11 00 00    	mov    $0x1134,%r8d
0833   c6f573:	e8 00 00 00 00       	call   c6f578 <run_delalloc_nocow+0x838>	c6f574: R_X86_64_PLT32	extent_clear_unlock_delalloc-0x4
0838   c6f578:	41 bd f4 ff ff ff    	mov    $0xfffffff4,%r13d
083e   c6f57e:	e9 73 01 00 00       	jmp    c6f6f6 <run_delalloc_nocow+0x9b6>
0843   c6f583:	e8 00 00 00 00       	call   c6f588 <run_delalloc_nocow+0x848>	c6f584: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0848   c6f588:	31 c0                	xor    %eax,%eax
084a   c6f58a:	45 31 e4             	xor    %r12d,%r12d
084d   c6f58d:	4c 8b 34 24          	mov    (%rsp),%r14
0851   c6f591:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
0856   c6f596:	e9 e0 00 00 00       	jmp    c6f67b <run_delalloc_nocow+0x93b>
085b   c6f59b:	e8 00 00 00 00       	call   c6f5a0 <run_delalloc_nocow+0x860>	c6f59c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0860   c6f5a0:	eb 3e                	jmp    c6f5e0 <run_delalloc_nocow+0x8a0>
0862   c6f5a2:	e8 00 00 00 00       	call   c6f5a7 <run_delalloc_nocow+0x867>	c6f5a3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0867   c6f5a7:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
086e   c6f5ae:	48 8b 6c 24 20       	mov    0x20(%rsp),%rbp
0873   c6f5b3:	48 89 ee             	mov    %rbp,%rsi
0876   c6f5b6:	e8 00 00 00 00       	call   c6f5bb <run_delalloc_nocow+0x87b>	c6f5b7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
087b   c6f5bb:	48 83 fd ff          	cmp    $0xffffffffffffffff,%rbp
087f   c6f5bf:	4c 8b 34 24          	mov    (%rsp),%r14
0883   c6f5c3:	4c 0f 45 f5          	cmovne %rbp,%r14
0887   c6f5c7:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
088c   c6f5cc:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
0891   c6f5d1:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0896   c6f5d6:	e9 a0 00 00 00       	jmp    c6f67b <run_delalloc_nocow+0x93b>
089b   c6f5db:	e8 00 00 00 00       	call   c6f5e0 <run_delalloc_nocow+0x8a0>	c6f5dc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08a0   c6f5e0:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
08a5   c6f5e5:	4c 8b 34 24          	mov    (%rsp),%r14
08a9   c6f5e9:	4c 89 ff             	mov    %r15,%rdi
08ac   c6f5ec:	e8 00 00 00 00       	call   c6f5f1 <run_delalloc_nocow+0x8b1>	c6f5ed: R_X86_64_PLT32	btrfs_release_path-0x4
08b1   c6f5f1:	4c 89 f7             	mov    %r14,%rdi
08b4   c6f5f4:	4c 89 e6             	mov    %r12,%rsi
08b7   c6f5f7:	e8 00 00 00 00       	call   c6f5fc <run_delalloc_nocow+0x8bc>	c6f5f8: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
08bc   c6f5fc:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
08c3   c6f603:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
08c8   c6f608:	48 89 de             	mov    %rbx,%rsi
08cb   c6f60b:	e8 00 00 00 00       	call   c6f610 <run_delalloc_nocow+0x8d0>	c6f60c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
08d0   c6f610:	48 83 fb ff          	cmp    $0xffffffffffffffff,%rbx
08d4   c6f614:	48 89 dd             	mov    %rbx,%rbp
08d7   c6f617:	49 0f 44 ee          	cmove  %r14,%rbp
08db   c6f61b:	4d 39 e6             	cmp    %r12,%r14
08de   c6f61e:	48 0f 47 eb          	cmova  %rbx,%rbp
08e2   c6f622:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
08e9   c6f629:	48 89 ee             	mov    %rbp,%rsi
08ec   c6f62c:	e8 00 00 00 00       	call   c6f631 <run_delalloc_nocow+0x8f1>	c6f62d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
08f1   c6f631:	48 83 fd ff          	cmp    $0xffffffffffffffff,%rbp
08f5   c6f635:	74 32                	je     c6f669 <run_delalloc_nocow+0x929>
08f7   c6f637:	e8 00 00 00 00       	call   c6f63c <run_delalloc_nocow+0x8fc>	c6f638: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08fc   c6f63c:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
0901   c6f641:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
0906   c6f646:	48 89 ea             	mov    %rbp,%rdx
0909   c6f649:	4c 89 e1             	mov    %r12,%rcx
090c   c6f64c:	4c 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%r8
0914   c6f654:	4c 8b 8c 24 88 00 00 00 	mov    0x88(%rsp),%r9
091c   c6f65c:	e8 5f 09 01 00       	call   c7ffc0 <fallback_to_cow>
0921   c6f661:	41 89 c5             	mov    %eax,%r13d
0924   c6f664:	4d 89 e6             	mov    %r12,%r14
0927   c6f667:	eb 05                	jmp    c6f66e <run_delalloc_nocow+0x92e>
0929   c6f669:	e8 00 00 00 00       	call   c6f66e <run_delalloc_nocow+0x92e>	c6f66a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
092e   c6f66e:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0933   c6f673:	4c 89 e3             	mov    %r12,%rbx
0936   c6f676:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
093b   c6f67b:	24 01                	and    $0x1,%al
093d   c6f67d:	0f b6 e8             	movzbl %al,%ebp
0940   c6f680:	31 ff                	xor    %edi,%edi
0942   c6f682:	89 ee                	mov    %ebp,%esi
0944   c6f684:	e8 00 00 00 00       	call   c6f689 <run_delalloc_nocow+0x949>	c6f685: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0949   c6f689:	40 84 ed             	test   %bpl,%bpl
094c   c6f68c:	75 07                	jne    c6f695 <run_delalloc_nocow+0x955>
094e   c6f68e:	e8 00 00 00 00       	call   c6f693 <run_delalloc_nocow+0x953>	c6f68f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0953   c6f693:	eb 0d                	jmp    c6f6a2 <run_delalloc_nocow+0x962>
0955   c6f695:	e8 00 00 00 00       	call   c6f69a <run_delalloc_nocow+0x95a>	c6f696: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
095a   c6f69a:	4c 89 e7             	mov    %r12,%rdi
095d   c6f69d:	e8 00 00 00 00       	call   c6f6a2 <run_delalloc_nocow+0x962>	c6f69e: R_X86_64_PLT32	btrfs_dec_nocow_writers-0x4
0962   c6f6a2:	31 ff                	xor    %edi,%edi
0964   c6f6a4:	44 89 ee             	mov    %r13d,%esi
0967   c6f6a7:	e8 00 00 00 00       	call   c6f6ac <run_delalloc_nocow+0x96c>	c6f6a8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
096c   c6f6ac:	4c 89 f7             	mov    %r14,%rdi
096f   c6f6af:	48 89 de             	mov    %rbx,%rsi
0972   c6f6b2:	e8 00 00 00 00       	call   c6f6b7 <run_delalloc_nocow+0x977>	c6f6b3: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
0977   c6f6b7:	45 85 ed             	test   %r13d,%r13d
097a   c6f6ba:	74 2d                	je     c6f6e9 <run_delalloc_nocow+0x9a9>
097c   c6f6bc:	49 39 de             	cmp    %rbx,%r14
097f   c6f6bf:	73 28                	jae    c6f6e9 <run_delalloc_nocow+0x9a9>
0981   c6f6c1:	e8 00 00 00 00       	call   c6f6c6 <run_delalloc_nocow+0x986>	c6f6c2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0986   c6f6c6:	41 b9 07 00 00 00    	mov    $0x7,%r9d
098c   c6f6cc:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
0991   c6f6d1:	4c 89 f6             	mov    %r14,%rsi
0994   c6f6d4:	48 89 da             	mov    %rbx,%rdx
0997   c6f6d7:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
099c   c6f6dc:	41 b8 34 11 00 00    	mov    $0x1134,%r8d
09a2   c6f6e2:	e8 00 00 00 00       	call   c6f6e7 <run_delalloc_nocow+0x9a7>	c6f6e3: R_X86_64_PLT32	extent_clear_unlock_delalloc-0x4
09a7   c6f6e7:	eb 05                	jmp    c6f6ee <run_delalloc_nocow+0x9ae>
09a9   c6f6e9:	e8 00 00 00 00       	call   c6f6ee <run_delalloc_nocow+0x9ae>	c6f6ea: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09ae   c6f6ee:	4c 89 ff             	mov    %r15,%rdi
09b1   c6f6f1:	e8 00 00 00 00       	call   c6f6f6 <run_delalloc_nocow+0x9b6>	c6f6f2: R_X86_64_PLT32	btrfs_free_path-0x4
09b6   c6f6f6:	44 89 e8             	mov    %r13d,%eax
09b9   c6f6f9:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
09c0   c6f700:	5b                   	pop    %rbx
09c1   c6f701:	41 5c                	pop    %r12
09c3   c6f703:	41 5d                	pop    %r13
09c5   c6f705:	41 5e                	pop    %r14
09c7   c6f707:	41 5f                	pop    %r15
09c9   c6f709:	5d                   	pop    %rbp
09ca   c6f70a:	c3                   	ret
09cb   c6f70b:	e8 00 00 00 00       	call   c6f710 <run_delalloc_nocow+0x9d0>	c6f70c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09d0   c6f710:	e9 cb fe ff ff       	jmp    c6f5e0 <run_delalloc_nocow+0x8a0>
09d5   c6f715:	e8 00 00 00 00       	call   c6f71a <run_delalloc_nocow+0x9da>	c6f716: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09da   c6f71a:	e9 c1 fe ff ff       	jmp    c6f5e0 <run_delalloc_nocow+0x8a0>
09df   c6f71f:	e8 00 00 00 00       	call   c6f724 <run_delalloc_nocow+0x9e4>	c6f720: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09e4   c6f724:	e9 c0 fe ff ff       	jmp    c6f5e9 <run_delalloc_nocow+0x8a9>
09e9   c6f729:	e8 00 00 00 00       	call   c6f72e <run_delalloc_nocow+0x9ee>	c6f72a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09ee   c6f72e:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
09f5   c6f735:	48 8b 6c 24 20       	mov    0x20(%rsp),%rbp
09fa   c6f73a:	48 89 ee             	mov    %rbp,%rsi
09fd   c6f73d:	e8 00 00 00 00       	call   c6f742 <run_delalloc_nocow+0xa02>	c6f73e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0a02   c6f742:	48 83 fd ff          	cmp    $0xffffffffffffffff,%rbp
0a06   c6f746:	4c 8b 34 24          	mov    (%rsp),%r14
0a0a   c6f74a:	4c 0f 45 f5          	cmovne %rbp,%r14
0a0e   c6f74e:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0a13   c6f753:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0a18   c6f758:	4c 89 e3             	mov    %r12,%rbx
0a1b   c6f75b:	49 89 cc             	mov    %rcx,%r12
0a1e   c6f75e:	e9 18 ff ff ff       	jmp    c6f67b <run_delalloc_nocow+0x93b>
0a23   c6f763:	e8 00 00 00 00       	call   c6f768 <run_delalloc_nocow+0xa28>	c6f764: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a28   c6f768:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	c6f76b: R_X86_64_32S	.rodata.str1.1+0xa906b
0a2f   c6f76f:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	c6f772: R_X86_64_32S	.rodata.str1.1+0x5805c
0a36   c6f776:	ba f5 07 00 00       	mov    $0x7f5,%edx
0a3b   c6f77b:	e8 00 00 00 00       	call   c6f780 <run_delalloc_nocow+0xa40>	c6f77c: R_X86_64_PLT32	btrfs_assertfail-0x4
0a40   c6f780:	90                   	nop
0a41   c6f781:	0f 0b                	ud2
0a43   c6f783:	90                   	nop
0a44   c6f784:	41 bd 8b ff ff ff    	mov    $0xffffff8b,%r13d
0a4a   c6f78a:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
0a4f   c6f78f:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
0a54   c6f794:	4c 8b 34 24          	mov    (%rsp),%r14
0a58   c6f798:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0a5d   c6f79d:	e9 d9 fe ff ff       	jmp    c6f67b <run_delalloc_nocow+0x93b>
0a62   c6f7a2:	e8 00 00 00 00       	call   c6f7a7 <run_delalloc_nocow+0xa67>	c6f7a3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a67   c6f7a7:	31 c0                	xor    %eax,%eax
0a69   c6f7a9:	49 89 ee             	mov    %rbp,%r14
0a6c   c6f7ac:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0a71   c6f7b1:	eb a5                	jmp    c6f758 <run_delalloc_nocow+0xa18>
0a73   c6f7b3:	e8 00 00 00 00       	call   c6f7b8 <run_delalloc_nocow+0xa78>	c6f7b4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a78   c6f7b8:	48 c7 44 24 20 ff ff ff ff 	movq   $0xffffffffffffffff,0x20(%rsp)
0a81   c6f7c1:	45 31 ed             	xor    %r13d,%r13d
0a84   c6f7c4:	31 c0                	xor    %eax,%eax
0a86   c6f7c6:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
0a8b   c6f7cb:	e9 19 fe ff ff       	jmp    c6f5e9 <run_delalloc_nocow+0x8a9>
0a90   c6f7d0:	e8 00 00 00 00       	call   c6f7d5 <run_delalloc_nocow+0xa95>	c6f7d1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a95   c6f7d5:	eb 1a                	jmp    c6f7f1 <run_delalloc_nocow+0xab1>
0a97   c6f7d7:	e8 00 00 00 00       	call   c6f7dc <run_delalloc_nocow+0xa9c>	c6f7d8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a9c   c6f7dc:	49 c7 c5 f4 ff ff ff 	mov    $0xfffffffffffffff4,%r13
0aa3   c6f7e3:	eb a5                	jmp    c6f78a <run_delalloc_nocow+0xa4a>
0aa5   c6f7e5:	e8 00 00 00 00       	call   c6f7ea <run_delalloc_nocow+0xaaa>	c6f7e6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0aaa   c6f7ea:	eb 05                	jmp    c6f7f1 <run_delalloc_nocow+0xab1>
0aac   c6f7ec:	e8 00 00 00 00       	call   c6f7f1 <run_delalloc_nocow+0xab1>	c6f7ed: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ab1   c6f7f1:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0ab6   c6f7f6:	4c 8b 34 24          	mov    (%rsp),%r14
0aba   c6f7fa:	e9 54 ff ff ff       	jmp    c6f753 <run_delalloc_nocow+0xa13>
0abf   c6f7ff:	e8 00 00 00 00       	call   c6f804 <run_delalloc_nocow+0xac4>	c6f800: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ac4   c6f804:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
0ac9   c6f809:	4c 8b 34 24          	mov    (%rsp),%r14
0acd   c6f80d:	4c 89 f6             	mov    %r14,%rsi
0ad0   c6f810:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
0ad5   c6f815:	31 c9                	xor    %ecx,%ecx
0ad7   c6f817:	e8 00 00 00 00       	call   c6f81c <run_delalloc_nocow+0xadc>	c6f818: R_X86_64_PLT32	btrfs_drop_extent_map_range-0x4
0adc   c6f81c:	e9 2d ff ff ff       	jmp    c6f74e <run_delalloc_nocow+0xa0e>
0ae1   c6f821:	e8 00 00 00 00       	call   c6f826 <run_delalloc_nocow+0xae6>	c6f822: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ae6   c6f826:	31 c0                	xor    %eax,%eax
0ae8   c6f828:	4c 8b 7c 24 60       	mov    0x60(%rsp),%r15
0aed   c6f82d:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0af2   c6f832:	e9 21 ff ff ff       	jmp    c6f758 <run_delalloc_nocow+0xa18>
0af7   c6f837:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
