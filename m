Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6C54A23;
	Sat, 30 Aug 2025 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756548039; cv=none; b=jA2FAXrEQG91pgRR3WAVnNj0cp2autjONEUxwr3E3PP/0pLaqeNZzfLItsbo3ovSkwpXL+TnFIG7AKTYCpxCMoGTQ7jodzBCn+mTBYBzTy9QAp3TGMTWtt3FOaN2IFNb8Tsz/3/izfnSZy4A+yYXTXW3ibGN1KKcm92rFJqegyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756548039; c=relaxed/simple;
	bh=bhtVqDJ+ccIej11Kzy/PHoH3vaeXhnciLFeGfDeuyiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bPEyuE4NzTC/0QuY3Jw7T+ieDtz+ICwZOzVtGmM2chr97t/ReAGadQwyPYOeEuuPwzLb6GHgH+mynPWlEt16Q+TQWjeJD6F6iyGU2yaKiyIPjDBWJsECeKXoMxc0oiU1cJs3Xp5DOfFmB+ZFliTU6/j1wr6geIobikqN9y4wN0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CcWm5dUI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CcWm5dUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756548036; x=1788084036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bhtVqDJ+ccIej11Kzy/PHoH3vaeXhnciLFeGfDeuyiA=;
  b=CcWm5dUI06giVDZpKYwhHbhkM/udHxw+xE9rzbSiG7I7Pd9ZjEdtcG7E
   jqy/hVHvoEMjOY3koMQNRvVfXLF1/OBLGwsYHVhqowmgVdo2DUvhP7ZhY
   y4r/XR7VZKOJsLeHZLgLJZ6pdOKvxFjm5DQ7KWTKDw+QgkAO/w1fQAGiL
   tu8Kh0NO8ZtFOEzUs0nRiTfOD55M5lCULgYw7TqeVEgIx1O0uhq3x40nZ
   u9bIGhhUGCcsEDqawXFSdCG3j9O+JR7OmwTVlrgdYcyQPFvWYK2ljTvrd
   fw3X65U+t3ZzS9Iq0k/XdU39yeJIUb7Fp+Hw/fWFOTznfOGVVcBLgvRDF
   g==;
X-CSE-ConnectionGUID: wtiQr3+wQ6qPkffJUXbSnQ==
X-CSE-MsgGUID: aDyrUCipQCev9TJz9X/n8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="57845971"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="57845971"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 03:00:35 -0700
X-CSE-ConnectionGUID: +tTTPdQpTX2aRvuCzeFDuQ==
X-CSE-MsgGUID: VXn0odu9ReeTGd1Qrrt4tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="194235984"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2025 03:00:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usIMv-000VHv-25;
	Sat, 30 Aug 2025 09:59:53 +0000
Date: Sat, 30 Aug 2025 17:59:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sun YangKai <sunk67188@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	David Sterba <dsterba@suse.com>
Subject: [btrfs:pr/1157 47/47] fs/btrfs/scrub.c:615:3: warning: void function
 'scrub_print_common_warning' should not return a value
Message-ID: <202508301747.dZexfo9v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/btrfs/linux.git pr/1157
head:   2d6338c6972523b39e105aab0adf90ce3ce9ea15
commit: 2d6338c6972523b39e105aab0adf90ce3ce9ea15 [47/47] btrfs: more trivial BTRFS_PATH_AUTO_FREE conversions
config: i386-buildonly-randconfig-006-20250830 (https://download.01.org/0day-ci/archive/20250830/202508301747.dZexfo9v-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508301747.dZexfo9v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508301747.dZexfo9v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/scrub.c:615:3: warning: void function 'scrub_print_common_warning' should not return a value [-Wreturn-mismatch]
     615 |                 return ret;
         |                 ^      ~~~
   fs/btrfs/scrub.c:307:1: warning: unused function 'scrub_bitmap_set_has_extent' [-Wunused-function]
     307 | IMPLEMENT_SCRUB_BITMAP_OPS(has_extent);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:242:20: note: expanded from macro 'IMPLEMENT_SCRUB_BITMAP_OPS'
     242 | static inline void scrub_bitmap_set_##name(struct scrub_stripe *stripe, \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:8:1: note: expanded from here
       8 | scrub_bitmap_set_has_extent
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:307:1: warning: unused function 'scrub_bitmap_clear_has_extent' [-Wunused-function]
     307 | IMPLEMENT_SCRUB_BITMAP_OPS(has_extent);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:251:20: note: expanded from macro 'IMPLEMENT_SCRUB_BITMAP_OPS'
     251 | static inline void scrub_bitmap_clear_##name(struct scrub_stripe *stripe, \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:22:1: note: expanded from here
      22 | scrub_bitmap_clear_has_extent
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:307:1: warning: unused function 'scrub_bitmap_clear_bit_has_extent' [-Wunused-function]
     307 | IMPLEMENT_SCRUB_BITMAP_OPS(has_extent);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:276:20: note: expanded from macro 'IMPLEMENT_SCRUB_BITMAP_OPS'
     276 | static inline void scrub_bitmap_clear_bit_##name(struct scrub_stripe *stripe, \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:65:1: note: expanded from here
      65 | scrub_bitmap_clear_bit_has_extent
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:307:1: warning: unused function 'scrub_bitmap_weight_has_extent' [-Wunused-function]
     307 | IMPLEMENT_SCRUB_BITMAP_OPS(has_extent);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:301:28: note: expanded from macro 'IMPLEMENT_SCRUB_BITMAP_OPS'
     301 | static inline unsigned int scrub_bitmap_weight_##name(struct scrub_stripe *stripe) \
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:95:1: note: expanded from here
      95 | scrub_bitmap_weight_has_extent
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:308:1: warning: unused function 'scrub_bitmap_set_is_metadata' [-Wunused-function]
     308 | IMPLEMENT_SCRUB_BITMAP_OPS(is_metadata);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:242:20: note: expanded from macro 'IMPLEMENT_SCRUB_BITMAP_OPS'
     242 | static inline void scrub_bitmap_set_##name(struct scrub_stripe *stripe, \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:97:1: note: expanded from here
      97 | scrub_bitmap_set_is_metadata
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:308:1: warning: unused function 'scrub_bitmap_clear_is_metadata' [-Wunused-function]
     308 | IMPLEMENT_SCRUB_BITMAP_OPS(is_metadata);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:251:20: note: expanded from macro 'IMPLEMENT_SCRUB_BITMAP_OPS'
     251 | static inline void scrub_bitmap_clear_##name(struct scrub_stripe *stripe, \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:111:1: note: expanded from here
     111 | scrub_bitmap_clear_is_metadata
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:308:1: warning: unused function 'scrub_bitmap_clear_bit_is_metadata' [-Wunused-function]
     308 | IMPLEMENT_SCRUB_BITMAP_OPS(is_metadata);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:276:20: note: expanded from macro 'IMPLEMENT_SCRUB_BITMAP_OPS'
     276 | static inline void scrub_bitmap_clear_bit_##name(struct scrub_stripe *stripe, \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:154:1: note: expanded from here
     154 | scrub_bitmap_clear_bit_is_metadata
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:308:1: warning: unused function 'scrub_bitmap_empty_is_metadata' [-Wunused-function]
     308 | IMPLEMENT_SCRUB_BITMAP_OPS(is_metadata);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:295:20: note: expanded from macro 'IMPLEMENT_SCRUB_BITMAP_OPS'
     295 | static inline bool scrub_bitmap_empty_##name(struct scrub_stripe *stripe) \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:182:1: note: expanded from here
     182 | scrub_bitmap_empty_is_metadata
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:308:1: warning: unused function 'scrub_bitmap_weight_is_metadata' [-Wunused-function]
     308 | IMPLEMENT_SCRUB_BITMAP_OPS(is_metadata);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:301:28: note: expanded from macro 'IMPLEMENT_SCRUB_BITMAP_OPS'
     301 | static inline unsigned int scrub_bitmap_weight_##name(struct scrub_stripe *stripe) \
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:184:1: note: expanded from here
     184 | scrub_bitmap_weight_is_metadata
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:309:1: warning: unused function 'scrub_bitmap_test_bit_error' [-Wunused-function]
     309 | IMPLEMENT_SCRUB_BITMAP_OPS(error);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:260:20: note: expanded from macro 'IMPLEMENT_SCRUB_BITMAP_OPS'
     260 | static inline bool scrub_bitmap_test_bit_##name(struct scrub_stripe *stripe, \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:214:1: note: expanded from here
     214 | scrub_bitmap_test_bit_error
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:309:1: warning: unused function 'scrub_bitmap_weight_error' [-Wunused-function]
     309 | IMPLEMENT_SCRUB_BITMAP_OPS(error);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/scrub.c:301:28: note: expanded from macro 'IMPLEMENT_SCRUB_BITMAP_OPS'
     301 | static inline unsigned int scrub_bitmap_weight_##name(struct scrub_stripe *stripe) \
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:56:1: note: expanded from here
      56 | scrub_bitmap_weight_error
--
>> fs/btrfs/send.c:1774:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1774 |         int ret = 0;
         |             ^
   1 warning generated.


vim +/scrub_print_common_warning +615 fs/btrfs/scrub.c

   583	
   584	static void scrub_print_common_warning(const char *errstr, struct btrfs_device *dev,
   585					       bool is_super, u64 logical, u64 physical)
   586	{
   587		struct btrfs_fs_info *fs_info = dev->fs_info;
   588		BTRFS_PATH_AUTO_FREE(path);
   589		struct btrfs_key found_key;
   590		struct extent_buffer *eb;
   591		struct btrfs_extent_item *ei;
   592		struct scrub_warning swarn;
   593		u64 flags = 0;
   594		u32 item_size;
   595		int ret;
   596	
   597		/* Super block error, no need to search extent tree. */
   598		if (is_super) {
   599			btrfs_warn(fs_info, "scrub: %s on device %s, physical %llu",
   600					  errstr, btrfs_dev_name(dev), physical);
   601			return;
   602		}
   603		path = btrfs_alloc_path();
   604		if (!path)
   605			return;
   606	
   607		swarn.physical = physical;
   608		swarn.logical = logical;
   609		swarn.errstr = errstr;
   610		swarn.dev = NULL;
   611	
   612		ret = extent_from_logical(fs_info, swarn.logical, path, &found_key,
   613					  &flags);
   614		if (ret < 0)
 > 615			return ret;
   616	
   617		swarn.extent_item_size = found_key.offset;
   618	
   619		eb = path->nodes[0];
   620		ei = btrfs_item_ptr(eb, path->slots[0], struct btrfs_extent_item);
   621		item_size = btrfs_item_size(eb, path->slots[0]);
   622	
   623		if (flags & BTRFS_EXTENT_FLAG_TREE_BLOCK) {
   624			unsigned long ptr = 0;
   625			u8 ref_level;
   626			u64 ref_root;
   627	
   628			while (true) {
   629				ret = tree_backref_for_extent(&ptr, eb, &found_key, ei,
   630							      item_size, &ref_root,
   631							      &ref_level);
   632				if (ret < 0) {
   633					btrfs_warn(fs_info,
   634			   "scrub: failed to resolve tree backref for logical %llu: %d",
   635						   swarn.logical, ret);
   636					break;
   637				}
   638				if (ret > 0)
   639					break;
   640				btrfs_warn(fs_info,
   641	"scrub: %s at logical %llu on dev %s, physical %llu: metadata %s (level %d) in tree %llu",
   642					errstr, swarn.logical, btrfs_dev_name(dev),
   643					swarn.physical, (ref_level ? "node" : "leaf"),
   644					ref_level, ref_root);
   645			}
   646			btrfs_release_path(path);
   647		} else {
   648			struct btrfs_backref_walk_ctx ctx = { 0 };
   649	
   650			btrfs_release_path(path);
   651	
   652			ctx.bytenr = found_key.objectid;
   653			ctx.extent_item_pos = swarn.logical - found_key.objectid;
   654			ctx.fs_info = fs_info;
   655	
   656			swarn.path = path;
   657			swarn.dev = dev;
   658	
   659			iterate_extent_inodes(&ctx, true, scrub_print_warning_inode, &swarn);
   660		}
   661	}
   662	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
