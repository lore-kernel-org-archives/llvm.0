Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794742820;
	b=ZRaIGuKjeYVdb7BM9LTn0N4avip0IpsaaEzSGCMMHLlwA4KpXAgogrTQyYybE0s/wG6S
	 k7o+YmGA0bVjO+aBRPZ4/JODrsmJKYTJBEbrNtzqXRhLBZf0LaJmkNeTv+b3gHHLfA4c1
	 knSgLcLdNNEkoH1Bpi3jTBNBJfyhNwS25Qlrh2o1FhESwY+qOhg7cxrOhQMfAgjHEhjz/
	 f2Ulo3ffT7JEuOCi75ihWD8HiXXwmq7Lpm5mv/w2vpdOLWIITI1RQXD/n/daFhRkh2jxa
	 N+siaQjMhnJMM+czXSvhfxbc4b9/dftlwiuYG2Ms4vZYJZOWE+JyimOfAFYWmhcqwWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794742820;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=x4EtZvheymUYOFQPCnUHMFQz5DwQ95FNwCmLv1vyhAQ=;
	b=Q/ydqLvt8lb8O6Bb19Z87L50dXYguNceLVOVFEUgziuRQZ+cd7X3UlcMgZ3TB+OgUGdE
	 Skbkrujw+n0Gf+/Z31Gdb2037eqrq5UYpdYTjfHXCpMxAAX9bywrbn8sK14sJnkrX9hWE
	 nNUCg5zTf5ol8s89/NomhWF9UMymc5KvBz3bY+o7ZuOSkwK+BKiKkErvGsC2zcGcvp1Lg
	 /CEPP3fbO0HEUynk3inxBcXSspOTTW86h9MkQJX9XLikarpqyEoJLyjYBElaI2yvLghxU
	 ECFTbrdNB8t+Z8LxPGmLrHubkgBibXkDJozx/UlwMw4hdWOqgjDa/34LXa8DwVYadMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DfLTUz57;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71D3606A31F;
	Sun, 15 Nov 2026 11:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E71D3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DfLTUz57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794742820; x=1826278820;
  h=date:from:to:cc:subject:message-id;
  bh=bdnPlb//VvJXvS9g2SK5HJCpl6923oGhYZYRDbpQCcE=;
  b=DfLTUz57PzybI6wYlv3KZCkQTztUZ/jMKe7Ub0UZNicclglrNQabOqBJ
   ksgo1XOvuHuNlJxo/K64DrviYdvQN12Dp/tyWS+ZJ+3mqTgapRhRHQTw7
   0P/UpY6vKhMj9ji1SaF53PPeYuFPEqlHWvNGjqkEU+RVf+nXQaJuZGBGn
   s5+2R3QSRIuXlG/Tl4p/a/yiuk719Z9ooaY6e0Q+GRUoI6Hx9GG/CSV8U
   18qpIYsbEQ+dEmtAWp/XV8/WrxZZccy0eaHGa+c0d0tTyMh7eSPXzGQ0G
   ATto7I0IDvozsavUd6KWX3xbXLQ0XZILQy9w+ZquK9QYihuulLiI/Ylqh
   A==;
X-CSE-ConnectionGUID: XDEAbOD6Rq+ucp4acobEvQ==
X-CSE-MsgGUID: AHfdI96eTPWUQt4lfYc3Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3368401"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3368401"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 03:40:19 -0800
X-CSE-ConnectionGUID: 0g/gwaozTTqBLK4dmL6g5Q==
X-CSE-MsgGUID: RcKRCg4VQ5GzIIF40S0gGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9512591"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 15 Nov 2026 03:40:17 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSYal-000000002AA-1KW8;
	Sun, 15 Nov 2026 11:40:15 +0000
Date: Sun, 15 Nov 2026 12:39:24 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 400/458] fs/btrfs/inode.c:6379:11:
 error: expected expression
Message-ID: <202611151238.egsmxnac-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   6a8743e9201f9d942f7c93093bf7ce69b48a7eea
commit: 30de8225ca7129893217c164616597464eba4693 [400/458] btrfs: Annotate btrfs_readdir_put_delayed_items()
config: mips-randconfig-2000-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151238.egsmxnac-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151238.egsmxnac-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151238.egsmxnac-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/btrfs/inode.c:6379:11: error: expected expression
    6379 |                                __release_shared(&BTRFS_I(inode)->vfs_inode.i_rwsem));
         |                                ^
   include/linux/compiler-context-analysis.h:506:29: note: expanded from macro '__release_shared'
     506 | #define __release_shared(x)     __release_shared_ctx_lock(x)
         |                                 ^
   include/linux/compiler-context-analysis.h:191:42: note: expanded from macro '__release_shared_ctx_lock'
     191 | # define __release_shared_ctx_lock(var)         do { } while (0)
         |                                                 ^
   1 error generated.


vim +6379 fs/btrfs/inode.c

  6257	
  6258	static int btrfs_real_readdir(struct file *file, struct dir_context *ctx)
  6259	{
  6260		struct inode *inode = file_inode(file);
  6261		struct btrfs_root *root = BTRFS_I(inode)->root;
  6262		struct btrfs_file_private *private = file->private_data;
  6263		struct btrfs_dir_item *di;
  6264		struct btrfs_key key;
  6265		struct btrfs_key found_key;
  6266		BTRFS_PATH_AUTO_FREE(path);
  6267		void *addr;
  6268		LIST_HEAD(ins_list);
  6269		LIST_HEAD(del_list);
  6270		int ret;
  6271		char *name_ptr;
  6272		int name_len;
  6273		int entries = 0;
  6274		int total_len = 0;
  6275		bool put = false;
  6276		struct btrfs_key location;
  6277	
  6278		if (!dir_emit_dots(file, ctx))
  6279			return 0;
  6280	
  6281		path = btrfs_alloc_path();
  6282		if (!path)
  6283			return -ENOMEM;
  6284	
  6285		addr = private->filldir_buf;
  6286		path->reada = READA_FORWARD;
  6287	
  6288		put = btrfs_readdir_get_delayed_items(BTRFS_I(inode), private->last_index,
  6289						      &ins_list, &del_list);
  6290	
  6291	again:
  6292		key.type = BTRFS_DIR_INDEX_KEY;
  6293		key.offset = ctx->pos;
  6294		key.objectid = btrfs_ino(BTRFS_I(inode));
  6295	
  6296		btrfs_for_each_slot(root, &key, &found_key, path, ret) {
  6297			struct dir_entry *entry;
  6298			struct extent_buffer *leaf = path->nodes[0];
  6299			u8 ftype;
  6300	
  6301			if (found_key.objectid != key.objectid)
  6302				break;
  6303			if (found_key.type != BTRFS_DIR_INDEX_KEY)
  6304				break;
  6305			if (found_key.offset < ctx->pos)
  6306				continue;
  6307			if (found_key.offset > private->last_index)
  6308				break;
  6309			if (btrfs_should_delete_dir_index(&del_list, found_key.offset))
  6310				continue;
  6311			di = btrfs_item_ptr(leaf, path->slots[0], struct btrfs_dir_item);
  6312			name_len = btrfs_dir_name_len(leaf, di);
  6313			if ((total_len + sizeof(struct dir_entry) + name_len) >=
  6314			    PAGE_SIZE) {
  6315				btrfs_release_path(path);
  6316				ret = btrfs_filldir(private->filldir_buf, entries, ctx);
  6317				if (ret)
  6318					goto nopos;
  6319				addr = private->filldir_buf;
  6320				entries = 0;
  6321				total_len = 0;
  6322				goto again;
  6323			}
  6324	
  6325			ftype = btrfs_dir_flags_to_ftype(btrfs_dir_flags(leaf, di));
  6326			entry = addr;
  6327			name_ptr = (char *)(entry + 1);
  6328			read_extent_buffer(leaf, name_ptr,
  6329					   (unsigned long)(di + 1), name_len);
  6330			put_unaligned(name_len, &entry->name_len);
  6331			put_unaligned(fs_ftype_to_dtype(ftype), &entry->type);
  6332			btrfs_dir_item_key_to_cpu(leaf, di, &location);
  6333			put_unaligned(location.objectid, &entry->ino);
  6334			put_unaligned(found_key.offset, &entry->offset);
  6335			entries++;
  6336			addr += sizeof(struct dir_entry) + name_len;
  6337			total_len += sizeof(struct dir_entry) + name_len;
  6338		}
  6339		/* Catch error encountered during iteration */
  6340		if (ret < 0)
  6341			goto err;
  6342	
  6343		btrfs_release_path(path);
  6344	
  6345		ret = btrfs_filldir(private->filldir_buf, entries, ctx);
  6346		if (ret)
  6347			goto nopos;
  6348	
  6349		if (btrfs_readdir_delayed_dir_index(ctx, &ins_list))
  6350			goto nopos;
  6351	
  6352		/*
  6353		 * Stop new entries from being returned after we return the last
  6354		 * entry.
  6355		 *
  6356		 * New directory entries are assigned a strictly increasing
  6357		 * offset.  This means that new entries created during readdir
  6358		 * are *guaranteed* to be seen in the future by that readdir.
  6359		 * This has broken buggy programs which operate on names as
  6360		 * they're returned by readdir.  Until we reuse freed offsets
  6361		 * we have this hack to stop new entries from being returned
  6362		 * under the assumption that they'll never reach this huge
  6363		 * offset.
  6364		 *
  6365		 * This is being careful not to overflow 32bit loff_t unless the
  6366		 * last entry requires it because doing so has broken 32bit apps
  6367		 * in the past.
  6368		 */
  6369		if (ctx->pos >= INT_MAX)
  6370			ctx->pos = LLONG_MAX;
  6371		else
  6372			ctx->pos = INT_MAX;
  6373	nopos:
  6374		ret = 0;
  6375	err:
  6376		if (put)
  6377			context_unsafe(btrfs_readdir_put_delayed_items(BTRFS_I(inode),
  6378								       &ins_list, &del_list),
> 6379				       __release_shared(&BTRFS_I(inode)->vfs_inode.i_rwsem));
  6380		return ret;
  6381	}
  6382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
