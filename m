Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BFB136664;
	Sat,  7 Sep 2024 22:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725749495; cv=none; b=l1N6ohKVIu65yemvGyzvGOcwW4sZrMYT0E7sDGMugCBaRp4+aH3A+xX47xUhRK6qWpJOWF/fZkRhiXtqSpsQ9hGWAYeXrXl57dtvpbiEmBKM02eBBkLc9twkbR7nZCwsy/0r2OugLnJSSLMrRynyoppDEVHSyk31j4QYipMf5Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725749495; c=relaxed/simple;
	bh=kRitUETBDTV+D8ZNnV5L945tuFwfKxaZDQekvdoWraI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kh2wRFCzQqDu7G0bJNuZRBvzwKuDX659QRT/wC3eOjrjHE6JdKyBT/L4dD3YuvKWXMSwycA98vvg+gSs9B6LKm1K5ZYTT19lDWkQbHSaUnzzO1TQz0eWhJ5RRfXcYyZeLvpVtSzxp0DRItVaJYU0+NDOE553uqQXrNw3IXa4zog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuXcHu3N; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuXcHu3N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725749492; x=1757285492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kRitUETBDTV+D8ZNnV5L945tuFwfKxaZDQekvdoWraI=;
  b=fuXcHu3N05OXHvhrNgwo4zabAUMzaJUYudm+PyeLKlil8seasDPsZNi6
   aIYAQEeQL5bDC7r4HN3FqUUX5ey8YeNlCubYQaOWoyt5E3JpTqs4+raKF
   mn14qW1u9yNVXAt0ob4yHYdvVQQ0F6XvlrrYXtNAuvjv8P2RjtSlcEboy
   i2oVWVkj+s04ZAw5Yw8G/+oxtoRzlwQZoe1ufafnJH3qs5dB9ABDzQYnw
   HjT0Ni1dK7vWDHP1q1pk9cvoK9W2iqCzRXZyBXd2UqzVwSgYGCXlQQd6l
   KUffMk5wibznuv2XPHgxj8dGUjTE4kBMUJx9UY0aTCYy3WUt33uGOGa2g
   g==;
X-CSE-ConnectionGUID: pJE2Ou6JTSewHnw70v71Tw==
X-CSE-MsgGUID: AYP2MKeZQ/Wir8cP7sIztg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="35829787"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="35829787"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 15:51:31 -0700
X-CSE-ConnectionGUID: nzDItNyBSL6MZAYK2zY/iQ==
X-CSE-MsgGUID: fyaK9nCqRA2RmG3qJjyLcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="89562849"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Sep 2024 15:51:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn4H9-000D4Z-1v;
	Sat, 07 Sep 2024 22:51:27 +0000
Date: Sun, 8 Sep 2024 06:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 61/61] fs/ceph/inode.c:1057:9: error: no
 member named 'min_bshift' in 'struct netfs_inode'
Message-ID: <202409080630.VC47MNOG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   6c59f154a1d493b31755ac17326124d804172fb2
commit: 6c59f154a1d493b31755ac17326124d804172fb2 [61/61] ceph: Use netfslib
config: i386-randconfig-016-20240907 (https://download.01.org/0day-ci/archive/20240908/202409080630.VC47MNOG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080630.VC47MNOG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080630.VC47MNOG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> net/ceph/snapshot.c:40:22: warning: cast from 'void (*)(const void *)' to 'void (*)(struct netfs_group *)' converts to incompatible function type [-Wcast-function-type-strict]
      40 |         snapc->group.free = (void (*)(struct netfs_group *))kfree;
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
--
>> fs/ceph/inode.c:1057:9: error: no member named 'min_bshift' in 'struct netfs_inode'
    1057 |                 ictx->min_bshift = ictx->crypto_bshift;
         |                 ~~~~  ^
   1 error generated.
--
>> fs/ceph/rdwr.c:116:12: error: use of undeclared identifier 'NETFS_RREQ_REPEAT_RMW'
     116 |                         set_bit(NETFS_RREQ_REPEAT_RMW, &ci->netfs.flags);
         |                                 ^
>> fs/ceph/rdwr.c:125:2: error: call to undeclared function 'netfs_subreq_terminated'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     125 |         netfs_subreq_terminated(subreq, wrote, err);
         |         ^
   fs/ceph/rdwr.c:125:2: note: did you mean 'netfs_read_subreq_terminated'?
   include/linux/netfs.h:468:6: note: 'netfs_read_subreq_terminated' declared here
     468 | void netfs_read_subreq_terminated(struct netfs_io_subrequest *subreq,
         |      ^
>> fs/ceph/rdwr.c:139:42: error: use of undeclared identifier 'inode'
     139 |         struct ceph_inode_info *ci = ceph_inode(inode);
         |                                                 ^
>> fs/ceph/rdwr.c:146:59: error: no member named 'max_len' in 'struct netfs_io_subrequest'
     146 |               subreq->start, subreq->len, subreq->start, subreq->max_len,
         |                                                          ~~~~~~  ^
   include/linux/ceph/ceph_debug.h:47:46: note: expanded from macro 'doutc'
      47 |                  client->monc.auth->global_id, __func__, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:589:26: note: expanded from macro 'pr_debug'
     589 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |                                 ^~~~~~~~~~~
   include/linux/dynamic_debug.h:270:22: note: expanded from macro 'dynamic_pr_debug'
     270 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                                           ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   fs/ceph/rdwr.c:167:17: error: use of undeclared identifier 'inode'
     167 |         req->r_inode    = inode;
         |                           ^
   fs/ceph/rdwr.c:168:30: error: use of undeclared identifier 'inode'
     168 |         req->r_mtime    = current_time(inode);
         |                                        ^
>> fs/ceph/rdwr.c:180:7: error: use of undeclared identifier 'assert_ver'
     180 |                 if (assert_ver) {
         |                     ^
   fs/ceph/rdwr.c:182:35: error: use of undeclared identifier 'assert_ver'
     182 |                         req->r_ops[0].assert_ver.ver = assert_ver;
         |                                                        ^
   fs/ceph/rdwr.c:209:38: error: no member named 'max_len' in 'struct netfs_io_subrequest'
     209 |                                       &objnum, &objoff, &subreq->max_len);
         |                                                          ~~~~~~  ^
>> fs/ceph/rdwr.c:266:2: error: use of undeclared identifier 'rreq'
     266 |         rreq->io_streams[0].sreq_max_len = umin(xlen, fsc->mount_options->rsize);
         |         ^
>> fs/ceph/rdwr.c:335:18: warning: unused variable 'iter' [-Wunused-variable]
     335 |         struct iov_iter iter;
         |                         ^~~~
>> fs/ceph/rdwr.c:514:3: error: field designator 'clamp_length' does not refer to any field in type 'const struct netfs_request_ops'
     514 |         .clamp_length           = ceph_netfs_clamp_length,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/ceph/rdwr.c:541:36: error: use of undeclared identifier 'page_snapc'
     541 |                 if (snapc && capsnap->context != page_snapc)
         |                                                  ^
>> fs/ceph/rdwr.c:591:10: error: call to undeclared function 'folio_snap_context'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     591 |         snapc = folio_snap_context(ceph_fscrypt_pagecache_folio(folio));
         |                 ^
>> fs/ceph/rdwr.c:591:8: error: incompatible integer to pointer conversion assigning to 'struct ceph_snap_context *' from 'int' [-Wint-conversion]
     591 |         snapc = folio_snap_context(ceph_fscrypt_pagecache_folio(folio));
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/ceph/rdwr.c:629:54: error: too few arguments to function call, expected 3, have 2
     629 |                 snapc = get_oldest_context(mapping->host, &ceph_wbc);
         |                         ~~~~~~~~~~~~~~~~~~                         ^
   fs/ceph/rdwr.c:525:1: note: 'get_oldest_context' declared here
     525 | get_oldest_context(struct inode *inode, struct ceph_writeback_ctl *ctl,
         | ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     526 |                    struct ceph_snap_context *folio_snapc)
         |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/ceph/rdwr.c:656:17: error: use of undeclared identifier 'ceph_dirty_folio'
     656 |         .dirty_folio    = ceph_dirty_folio,
         |                           ^
>> fs/ceph/rdwr.c:657:22: error: use of undeclared identifier 'ceph_invalidate_folio'; did you mean 'netfs_invalidate_folio'?
     657 |         .invalidate_folio = ceph_invalidate_folio,
         |                             ^~~~~~~~~~~~~~~~~~~~~
         |                             netfs_invalidate_folio
   include/linux/netfs.h:459:6: note: 'netfs_invalidate_folio' declared here
     459 | void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
         |      ^
>> fs/ceph/rdwr.c:721:11: error: call to undeclared function 'ceph_direct_read_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     721 |                                 ret = ceph_direct_read_write(iocb, to,
         |                                       ^
   fs/ceph/rdwr.c:721:11: note: did you mean 'ceph_prepare_write'?
   fs/ceph/rdwr.c:196:13: note: 'ceph_prepare_write' declared here
     196 | static void ceph_prepare_write(struct netfs_io_subrequest *subreq)
         |             ^
>> fs/ceph/rdwr.c:724:17: error: use of undeclared identifier 'CHECK_EOF'
     724 |                                         retry_op = CHECK_EOF;
         |                                                    ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.
--
>> fs/ceph/file.c:1746:15: error: use of undeclared identifier 'ceph_read_iter'; did you mean 'seq_read_iter'?
    1746 |         .read_iter = ceph_read_iter,
         |                      ^~~~~~~~~~~~~~
         |                      seq_read_iter
   include/linux/seq_file.h:110:9: note: 'seq_read_iter' declared here
     110 | ssize_t seq_read_iter(struct kiocb *iocb, struct iov_iter *iter);
         |         ^
>> fs/ceph/file.c:1747:16: error: use of undeclared identifier 'ceph_write_iter'; did you mean 'ceph_write_inode'?
    1747 |         .write_iter = ceph_write_iter,
         |                       ^~~~~~~~~~~~~~~
         |                       ceph_write_inode
   fs/ceph/super.h:1251:12: note: 'ceph_write_inode' declared here
    1251 | extern int ceph_write_inode(struct inode *inode, struct writeback_control *wbc);
         |            ^
>> fs/ceph/file.c:1747:16: error: incompatible function pointer types initializing 'ssize_t (*)(struct kiocb *, struct iov_iter *)' (aka 'int (*)(struct kiocb *, struct iov_iter *)') with an expression of type 'int (struct inode *, struct writeback_control *)' [-Wincompatible-function-pointer-types]
    1747 |         .write_iter = ceph_write_iter,
         |                       ^~~~~~~~~~~~~~~
   3 errors generated.
--
   fs/ceph/crypto.c:545:5: warning: no previous prototype for function 'ceph_fscrypt_decrypt_pages' [-Wmissing-prototypes]
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         |     ^
   fs/ceph/crypto.c:545:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         | ^
         | static 
   fs/ceph/crypto.c:591:5: error: conflicting types for 'ceph_fscrypt_decrypt_extents'
     591 | int ceph_fscrypt_decrypt_extents(struct inode *inode, struct page **page,
         |     ^
   fs/ceph/crypto.h:160:5: note: previous declaration is here
     160 | int ceph_fscrypt_decrypt_extents(struct inode *inode, struct ceph_databuf *dbuf, u64 off,
         |     ^
   fs/ceph/crypto.c:625:44: error: incompatible pointer types passing 'struct page **' to parameter of type 'struct ceph_databuf *' [-Werror,-Wincompatible-pointer-types]
     625 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                          ^~~~~~~~~~~~
   fs/ceph/crypto.c:545:74: note: passing argument to parameter 'dbuf' here
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         |                                                                          ^
>> fs/ceph/crypto.c:644:35: error: use of undeclared identifier 'op'
     644 |         struct ceph_sparse_extent *map = op->extent.sparse_ext;
         |                                          ^
>> fs/ceph/crypto.c:645:42: error: use of undeclared identifier 'inode'
     645 |         struct ceph_inode_info *ci = ceph_inode(inode);
         |                                                 ^
   fs/ceph/crypto.c:647:16: error: use of undeclared identifier 'op'
     647 |         u32 ext_cnt = op->extent.sparse_ext_cnt;
         |                       ^
>> fs/ceph/crypto.c:671:45: error: use of undeclared identifier 'page'
     671 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                           ^
   fs/ceph/crypto.c:671:37: error: use of undeclared identifier 'inode'
     671 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                   ^
>> fs/ceph/crypto.c:672:8: error: use of undeclared identifier 'off'
     672 |                                                  off + pgsoff, ext->len);
         |                                                  ^
>> fs/ceph/crypto.c:640:5: warning: no previous prototype for function 'ceph_decrypt_block' [-Wmissing-prototypes]
     640 | int ceph_decrypt_block(struct netfs_io_request *rreq, loff_t pos, size_t len,
         |     ^
   fs/ceph/crypto.c:640:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     640 | int ceph_decrypt_block(struct netfs_io_request *rreq, loff_t pos, size_t len,
         | ^
         | static 
>> fs/ceph/crypto.c:686:5: warning: no previous prototype for function 'ceph_encrypt_block' [-Wmissing-prototypes]
     686 | int ceph_encrypt_block(struct netfs_io_request *wreq, loff_t pos, size_t len,
         |     ^
   fs/ceph/crypto.c:686:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     686 | int ceph_encrypt_block(struct netfs_io_request *wreq, loff_t pos, size_t len,
         | ^
         | static 
   3 warnings and 8 errors generated.


vim +1057 fs/ceph/inode.c

   936	
   937	/*
   938	 * Populate an inode based on info from mds.  May be called on new or
   939	 * existing inodes.
   940	 */
   941	int ceph_fill_inode(struct inode *inode, struct folio *locked_folio,
   942			    struct ceph_mds_reply_info_in *iinfo,
   943			    struct ceph_mds_reply_dirfrag *dirinfo,
   944			    struct ceph_mds_session *session, int cap_fmode,
   945			    struct ceph_cap_reservation *caps_reservation)
   946	{
   947		struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(inode->i_sb);
   948		struct ceph_client *cl = mdsc->fsc->client;
   949		struct ceph_mds_reply_inode *info = iinfo->in;
   950		struct ceph_inode_info *ci = ceph_inode(inode);
   951		struct netfs_inode *ictx = netfs_inode(inode);
   952		int issued, new_issued, info_caps;
   953		struct timespec64 mtime, atime, ctime;
   954		struct ceph_buffer *xattr_blob = NULL;
   955		struct ceph_buffer *old_blob = NULL;
   956		struct ceph_string *pool_ns = NULL;
   957		struct ceph_cap *new_cap = NULL;
   958		int err = 0;
   959		bool wake = false;
   960		bool queue_trunc = false;
   961		bool new_version = false;
   962		bool fill_inline = false;
   963		umode_t mode = le32_to_cpu(info->mode);
   964		dev_t rdev = le32_to_cpu(info->rdev);
   965	
   966		lockdep_assert_held(&mdsc->snap_rwsem);
   967	
   968		doutc(cl, "%p ino %llx.%llx v %llu had %llu\n", inode, ceph_vinop(inode),
   969		      le64_to_cpu(info->version), ci->i_version);
   970	
   971		/* Once I_NEW is cleared, we can't change type or dev numbers */
   972		if (inode->i_state & I_NEW) {
   973			inode->i_mode = mode;
   974		} else {
   975			if (inode_wrong_type(inode, mode)) {
   976				pr_warn_once_client(cl,
   977					"inode type changed! (ino %llx.%llx is 0%o, mds says 0%o)\n",
   978					ceph_vinop(inode), inode->i_mode, mode);
   979				return -ESTALE;
   980			}
   981	
   982			if ((S_ISCHR(mode) || S_ISBLK(mode)) && inode->i_rdev != rdev) {
   983				pr_warn_once_client(cl,
   984					"dev inode rdev changed! (ino %llx.%llx is %u:%u, mds says %u:%u)\n",
   985					ceph_vinop(inode), MAJOR(inode->i_rdev),
   986					MINOR(inode->i_rdev), MAJOR(rdev),
   987					MINOR(rdev));
   988				return -ESTALE;
   989			}
   990		}
   991	
   992		info_caps = le32_to_cpu(info->cap.caps);
   993	
   994		/* prealloc new cap struct */
   995		if (info_caps && ceph_snap(inode) == CEPH_NOSNAP) {
   996			new_cap = ceph_get_cap(mdsc, caps_reservation);
   997			if (!new_cap)
   998				return -ENOMEM;
   999		}
  1000	
  1001		/*
  1002		 * prealloc xattr data, if it looks like we'll need it.  only
  1003		 * if len > 4 (meaning there are actually xattrs; the first 4
  1004		 * bytes are the xattr count).
  1005		 */
  1006		if (iinfo->xattr_len > 4) {
  1007			xattr_blob = ceph_buffer_new(iinfo->xattr_len, GFP_NOFS);
  1008			if (!xattr_blob)
  1009				pr_err_client(cl, "ENOMEM xattr blob %d bytes\n",
  1010					      iinfo->xattr_len);
  1011		}
  1012	
  1013		if (iinfo->pool_ns_len > 0)
  1014			pool_ns = ceph_find_or_create_string(iinfo->pool_ns_data,
  1015							     iinfo->pool_ns_len);
  1016	
  1017		if (ceph_snap(inode) != CEPH_NOSNAP && !ci->i_snapid_map)
  1018			ci->i_snapid_map = ceph_get_snapid_map(mdsc, ceph_snap(inode));
  1019	
  1020		spin_lock(&ci->i_ceph_lock);
  1021	
  1022		/*
  1023		 * provided version will be odd if inode value is projected,
  1024		 * even if stable.  skip the update if we have newer stable
  1025		 * info (ours>=theirs, e.g. due to racing mds replies), unless
  1026		 * we are getting projected (unstable) info (in which case the
  1027		 * version is odd, and we want ours>theirs).
  1028		 *   us   them
  1029		 *   2    2     skip
  1030		 *   3    2     skip
  1031		 *   3    3     update
  1032		 */
  1033		if (ci->i_version == 0 ||
  1034		    ((info->cap.flags & CEPH_CAP_FLAG_AUTH) &&
  1035		     le64_to_cpu(info->version) > (ci->i_version & ~1)))
  1036			new_version = true;
  1037	
  1038		/* Update change_attribute */
  1039		inode_set_max_iversion_raw(inode, iinfo->change_attr);
  1040	
  1041		__ceph_caps_issued(ci, &issued);
  1042		issued |= __ceph_caps_dirty(ci);
  1043		new_issued = ~issued & info_caps;
  1044	
  1045		__ceph_update_quota(ci, iinfo->max_bytes, iinfo->max_files);
  1046	
  1047	#ifdef CONFIG_FS_ENCRYPTION
  1048		if (iinfo->fscrypt_auth_len &&
  1049		    ((inode->i_state & I_NEW) || (ci->fscrypt_auth_len == 0))) {
  1050			kfree(ci->fscrypt_auth);
  1051			ci->fscrypt_auth_len = iinfo->fscrypt_auth_len;
  1052			ci->fscrypt_auth = iinfo->fscrypt_auth;
  1053			iinfo->fscrypt_auth = NULL;
  1054			iinfo->fscrypt_auth_len = 0;
  1055			inode_set_flags(inode, S_ENCRYPTED, S_ENCRYPTED);
  1056			ictx->crypto_bshift = ilog2(CEPH_FSCRYPT_BLOCK_SIZE);
> 1057			ictx->min_bshift = ictx->crypto_bshift;
  1058			__set_bit(NETFS_ICTX_ENCRYPTED, &ictx->flags);
  1059		}
  1060	#endif
  1061	
  1062		if ((new_version || (new_issued & CEPH_CAP_AUTH_SHARED)) &&
  1063		    (issued & CEPH_CAP_AUTH_EXCL) == 0) {
  1064			inode->i_mode = mode;
  1065			inode->i_uid = make_kuid(&init_user_ns, le32_to_cpu(info->uid));
  1066			inode->i_gid = make_kgid(&init_user_ns, le32_to_cpu(info->gid));
  1067			doutc(cl, "%p %llx.%llx mode 0%o uid.gid %d.%d\n", inode,
  1068			      ceph_vinop(inode), inode->i_mode,
  1069			      from_kuid(&init_user_ns, inode->i_uid),
  1070			      from_kgid(&init_user_ns, inode->i_gid));
  1071			ceph_decode_timespec64(&ci->i_btime, &iinfo->btime);
  1072			ceph_decode_timespec64(&ci->i_snap_btime, &iinfo->snap_btime);
  1073		}
  1074	
  1075		/* directories have fl_stripe_unit set to zero */
  1076		if (IS_ENCRYPTED(inode))
  1077			inode->i_blkbits = CEPH_FSCRYPT_BLOCK_SHIFT;
  1078		else if (le32_to_cpu(info->layout.fl_stripe_unit))
  1079			inode->i_blkbits =
  1080				fls(le32_to_cpu(info->layout.fl_stripe_unit)) - 1;
  1081		else
  1082			inode->i_blkbits = CEPH_BLOCK_SHIFT;
  1083	
  1084		if ((new_version || (new_issued & CEPH_CAP_LINK_SHARED)) &&
  1085		    (issued & CEPH_CAP_LINK_EXCL) == 0)
  1086			set_nlink(inode, le32_to_cpu(info->nlink));
  1087	
  1088		if (new_version || (new_issued & CEPH_CAP_ANY_RD)) {
  1089			/* be careful with mtime, atime, size */
  1090			ceph_decode_timespec64(&atime, &info->atime);
  1091			ceph_decode_timespec64(&mtime, &info->mtime);
  1092			ceph_decode_timespec64(&ctime, &info->ctime);
  1093			ceph_fill_file_time(inode, issued,
  1094					le32_to_cpu(info->time_warp_seq),
  1095					&ctime, &mtime, &atime);
  1096		}
  1097	
  1098		if (new_version || (info_caps & CEPH_CAP_FILE_SHARED)) {
  1099			ci->i_files = le64_to_cpu(info->files);
  1100			ci->i_subdirs = le64_to_cpu(info->subdirs);
  1101		}
  1102	
  1103		if (new_version ||
  1104		    (new_issued & (CEPH_CAP_ANY_FILE_RD | CEPH_CAP_ANY_FILE_WR))) {
  1105			u64 size = le64_to_cpu(info->size);
  1106			s64 old_pool = ci->i_layout.pool_id;
  1107			struct ceph_string *old_ns;
  1108	
  1109			ceph_file_layout_from_legacy(&ci->i_layout, &info->layout);
  1110			old_ns = rcu_dereference_protected(ci->i_layout.pool_ns,
  1111						lockdep_is_held(&ci->i_ceph_lock));
  1112			rcu_assign_pointer(ci->i_layout.pool_ns, pool_ns);
  1113	
  1114			if (ci->i_layout.pool_id != old_pool || pool_ns != old_ns)
  1115				ci->i_ceph_flags &= ~CEPH_I_POOL_PERM;
  1116	
  1117			pool_ns = old_ns;
  1118	
  1119			if (IS_ENCRYPTED(inode) && size &&
  1120			    iinfo->fscrypt_file_len == sizeof(__le64)) {
  1121				u64 fsize = __le64_to_cpu(*(__le64 *)iinfo->fscrypt_file);
  1122	
  1123				if (size == round_up(fsize, CEPH_FSCRYPT_BLOCK_SIZE)) {
  1124					size = fsize;
  1125				} else {
  1126					pr_warn_client(cl,
  1127						"fscrypt size mismatch: size=%llu fscrypt_file=%llu, discarding fscrypt_file size.\n",
  1128						info->size, size);
  1129				}
  1130			}
  1131	
  1132			ictx->zero_point = size;
  1133			queue_trunc = ceph_fill_file_size(inode, issued,
  1134						le32_to_cpu(info->truncate_seq),
  1135						le64_to_cpu(info->truncate_size),
  1136						size);
  1137			/* only update max_size on auth cap */
  1138			if ((info->cap.flags & CEPH_CAP_FLAG_AUTH) &&
  1139			    ci->i_max_size != le64_to_cpu(info->max_size)) {
  1140				doutc(cl, "max_size %lld -> %llu\n",
  1141				    ci->i_max_size, le64_to_cpu(info->max_size));
  1142				ci->i_max_size = le64_to_cpu(info->max_size);
  1143			}
  1144		}
  1145	
  1146		/* layout and rstat are not tracked by capability, update them if
  1147		 * the inode info is from auth mds */
  1148		if (new_version || (info->cap.flags & CEPH_CAP_FLAG_AUTH)) {
  1149			if (S_ISDIR(inode->i_mode)) {
  1150				ci->i_dir_layout = iinfo->dir_layout;
  1151				ci->i_rbytes = le64_to_cpu(info->rbytes);
  1152				ci->i_rfiles = le64_to_cpu(info->rfiles);
  1153				ci->i_rsubdirs = le64_to_cpu(info->rsubdirs);
  1154				ci->i_dir_pin = iinfo->dir_pin;
  1155				ci->i_rsnaps = iinfo->rsnaps;
  1156				ceph_decode_timespec64(&ci->i_rctime, &info->rctime);
  1157			}
  1158		}
  1159	
  1160		/* xattrs */
  1161		/* note that if i_xattrs.len <= 4, i_xattrs.data will still be NULL. */
  1162		if ((ci->i_xattrs.version == 0 || !(issued & CEPH_CAP_XATTR_EXCL))  &&
  1163		    le64_to_cpu(info->xattr_version) > ci->i_xattrs.version) {
  1164			if (ci->i_xattrs.blob)
  1165				old_blob = ci->i_xattrs.blob;
  1166			ci->i_xattrs.blob = xattr_blob;
  1167			if (xattr_blob)
  1168				memcpy(ci->i_xattrs.blob->vec.iov_base,
  1169				       iinfo->xattr_data, iinfo->xattr_len);
  1170			ci->i_xattrs.version = le64_to_cpu(info->xattr_version);
  1171			ceph_forget_all_cached_acls(inode);
  1172			ceph_security_invalidate_secctx(inode);
  1173			xattr_blob = NULL;
  1174		}
  1175	
  1176		/* finally update i_version */
  1177		if (le64_to_cpu(info->version) > ci->i_version)
  1178			ci->i_version = le64_to_cpu(info->version);
  1179	
  1180		inode->i_mapping->a_ops = &ceph_aops;
  1181	
  1182		switch (inode->i_mode & S_IFMT) {
  1183		case S_IFIFO:
  1184		case S_IFBLK:
  1185		case S_IFCHR:
  1186		case S_IFSOCK:
  1187			inode->i_blkbits = PAGE_SHIFT;
  1188			init_special_inode(inode, inode->i_mode, rdev);
  1189			inode->i_op = &ceph_file_iops;
  1190			break;
  1191		case S_IFREG:
  1192			inode->i_op = &ceph_file_iops;
  1193			inode->i_fop = &ceph_file_fops;
  1194			break;
  1195		case S_IFLNK:
  1196			if (!ci->i_symlink) {
  1197				u32 symlen = iinfo->symlink_len;
  1198				char *sym;
  1199	
  1200				spin_unlock(&ci->i_ceph_lock);
  1201	
  1202				if (IS_ENCRYPTED(inode)) {
  1203					if (symlen != i_size_read(inode))
  1204						pr_err_client(cl,
  1205							"%p %llx.%llx BAD symlink size %lld\n",
  1206							inode, ceph_vinop(inode),
  1207							i_size_read(inode));
  1208	
  1209					err = decode_encrypted_symlink(mdsc, iinfo->symlink,
  1210								       symlen, (u8 **)&sym);
  1211					if (err < 0) {
  1212						pr_err_client(cl,
  1213							"decoding encrypted symlink failed: %d\n",
  1214							err);
  1215						goto out;
  1216					}
  1217					symlen = err;
  1218					i_size_write(inode, symlen);
  1219					inode->i_blocks = calc_inode_blocks(symlen);
  1220				} else {
  1221					if (symlen != i_size_read(inode)) {
  1222						pr_err_client(cl,
  1223							"%p %llx.%llx BAD symlink size %lld\n",
  1224							inode, ceph_vinop(inode),
  1225							i_size_read(inode));
  1226						i_size_write(inode, symlen);
  1227						inode->i_blocks = calc_inode_blocks(symlen);
  1228					}
  1229	
  1230					err = -ENOMEM;
  1231					sym = kstrndup(iinfo->symlink, symlen, GFP_NOFS);
  1232					if (!sym)
  1233						goto out;
  1234				}
  1235	
  1236				spin_lock(&ci->i_ceph_lock);
  1237				if (!ci->i_symlink)
  1238					ci->i_symlink = sym;
  1239				else
  1240					kfree(sym); /* lost a race */
  1241			}
  1242	
  1243			if (IS_ENCRYPTED(inode)) {
  1244				/*
  1245				 * Encrypted symlinks need to be decrypted before we can
  1246				 * cache their targets in i_link. Don't touch it here.
  1247				 */
  1248				inode->i_op = &ceph_encrypted_symlink_iops;
  1249			} else {
  1250				inode->i_link = ci->i_symlink;
  1251				inode->i_op = &ceph_symlink_iops;
  1252			}
  1253			break;
  1254		case S_IFDIR:
  1255			inode->i_op = &ceph_dir_iops;
  1256			inode->i_fop = &ceph_dir_fops;
  1257			break;
  1258		default:
  1259			pr_err_client(cl, "%p %llx.%llx BAD mode 0%o\n", inode,
  1260				      ceph_vinop(inode), inode->i_mode);
  1261		}
  1262	
  1263		/* were we issued a capability? */
  1264		if (info_caps) {
  1265			if (ceph_snap(inode) == CEPH_NOSNAP) {
  1266				ceph_add_cap(inode, session,
  1267					     le64_to_cpu(info->cap.cap_id),
  1268					     info_caps,
  1269					     le32_to_cpu(info->cap.wanted),
  1270					     le32_to_cpu(info->cap.seq),
  1271					     le32_to_cpu(info->cap.mseq),
  1272					     le64_to_cpu(info->cap.realm),
  1273					     info->cap.flags, &new_cap);
  1274	
  1275				/* set dir completion flag? */
  1276				if (S_ISDIR(inode->i_mode) &&
  1277				    ci->i_files == 0 && ci->i_subdirs == 0 &&
  1278				    (info_caps & CEPH_CAP_FILE_SHARED) &&
  1279				    (issued & CEPH_CAP_FILE_EXCL) == 0 &&
  1280				    !__ceph_dir_is_complete(ci)) {
  1281					doutc(cl, " marking %p complete (empty)\n",
  1282					      inode);
  1283					i_size_write(inode, 0);
  1284					__ceph_dir_set_complete(ci,
  1285						atomic64_read(&ci->i_release_count),
  1286						atomic64_read(&ci->i_ordered_count));
  1287				}
  1288	
  1289				wake = true;
  1290			} else {
  1291				doutc(cl, " %p got snap_caps %s\n", inode,
  1292				      ceph_cap_string(info_caps));
  1293				ci->i_snap_caps |= info_caps;
  1294			}
  1295		}
  1296	
  1297		if (iinfo->inline_version > 0 &&
  1298		    iinfo->inline_version >= ci->i_inline_version) {
  1299			int cache_caps = CEPH_CAP_FILE_CACHE | CEPH_CAP_FILE_LAZYIO;
  1300			ci->i_inline_version = iinfo->inline_version;
  1301			if (ceph_has_inline_data(ci) &&
  1302			    (locked_folio || (info_caps & cache_caps)))
  1303				fill_inline = true;
  1304		}
  1305	
  1306		if (cap_fmode >= 0) {
  1307			if (!info_caps)
  1308				pr_warn_client(cl, "mds issued no caps on %llx.%llx\n",
  1309					       ceph_vinop(inode));
  1310			__ceph_touch_fmode(ci, mdsc, cap_fmode);
  1311		}
  1312	
  1313		spin_unlock(&ci->i_ceph_lock);
  1314	
  1315		ceph_fscache_register_inode_cookie(inode);
  1316	
  1317		if (fill_inline)
  1318			ceph_fill_inline_data(inode, locked_folio,
  1319					      iinfo->inline_data, iinfo->inline_len);
  1320	
  1321		if (wake)
  1322			wake_up_all(&ci->i_cap_wq);
  1323	
  1324		/* queue truncate if we saw i_size decrease */
  1325		if (queue_trunc)
  1326			ceph_queue_vmtruncate(inode);
  1327	
  1328		/* populate frag tree */
  1329		if (S_ISDIR(inode->i_mode))
  1330			ceph_fill_fragtree(inode, &info->fragtree, dirinfo);
  1331	
  1332		/* update delegation info? */
  1333		if (dirinfo)
  1334			ceph_fill_dirfrag(inode, dirinfo);
  1335	
  1336		err = 0;
  1337	out:
  1338		if (new_cap)
  1339			ceph_put_cap(mdsc, new_cap);
  1340		ceph_buffer_put(old_blob);
  1341		ceph_buffer_put(xattr_blob);
  1342		ceph_put_string(pool_ns);
  1343		return err;
  1344	}
  1345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
