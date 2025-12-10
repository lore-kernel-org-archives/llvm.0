Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9013430F819;
	Wed, 10 Dec 2025 19:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765393552; cv=none; b=fbs3KEP5Ld2GiO03XxIH02+ruBKVkaMTF4bRB01TlG9Hde7FSGd3L2m1+y3YNDGNAmLmbTXmEzCvOO9CCuedIzTF1T3qCxzrowfWv4uhFWbRVufrqbxw6PBKAmCOLYVEHt/XujJ3h4IysK0l+nD3ykDJz7/fRh24ln7ChkIswDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765393552; c=relaxed/simple;
	bh=n78qlbqQHpkIUeQyBoHky8FhLodpbFzebUW4mrVXKIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VuUUpO0I1KCfuRarNu/AuGFsTAqQQVl2gUoKOR5gX4tnSeaQXFVryjBMO22KhT1Tox7yZxCLJp2TXTv7eisWKcLaVhZlJPEvnwjtM5h5Xbykxikx29IhmAE4vxwpeCr36iBuDpnglspJA4sgeo045aMzaprxOvWv6wnZUMv7j7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWwrYQjI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWwrYQjI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765393551; x=1796929551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n78qlbqQHpkIUeQyBoHky8FhLodpbFzebUW4mrVXKIE=;
  b=jWwrYQjImKQTYYnflxB705JJle4mLQs5Xn8U1JGmRa6cWW1K0OPeZ/s/
   pkatVM/WWWj8E4dyAW3aHS7J+wElSyiVFG4Gg0VKdABz8/kOOD39WnBV5
   VpZF1rCDr4iQz/3gBYQ2+Kxtd/swaEHq0V6wSyBS9On/o9+aMKGADDHAI
   UZgIi+Ht2uC0d/3uG8exFtUSnRyZm/P6EHgTWjfRgh2GbZfC8yanWu708
   4yOfqQ5Q7crMMH5LSibws9conUeqAodZkjvgM4L/nyP/VP0pLl0R9/mEf
   eeO0nKfUOQyUPEL7o9gYclnkKwL9S6+vs5U/ywGb4Do9hk6rtcrxCVh//
   Q==;
X-CSE-ConnectionGUID: Rt/ElUiCRDepsPNWqfbANA==
X-CSE-MsgGUID: PNdwdfTDTEWdZ1Zp1d+3BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="54917255"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="54917255"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 11:05:49 -0800
X-CSE-ConnectionGUID: ChtIockPST25A9NhysPqfw==
X-CSE-MsgGUID: BNJL/5+1Q9GHoOrK10qYRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="196876794"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Dec 2025 11:05:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTPVR-000000003fN-2kLL;
	Wed, 10 Dec 2025 19:05:45 +0000
Date: Thu, 11 Dec 2025 03:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 563/1112]
 fs/bcachefs/debug/async_objs.c:64:14: error: invalid application of 'sizeof'
 to an incomplete type 'struct dump_iter'
Message-ID: <202512110258.0KOGju5g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   c584fbbbf2e8eb98b64af4c5ea5d02d549dd4e4d
commit: da7a6f67bdb81c87b94b7e549f55fb1b3298fc83 [563/1112] bcachefs: kill CONFIG_BCACHEFS_ASYNC_OBJECT_LISTS
config: arm-randconfig-003-20251211 (https://download.01.org/0day-ci/archive/20251211/202512110258.0KOGju5g-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110258.0KOGju5g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110258.0KOGju5g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/debug/async_objs.c:64:14: error: invalid application of 'sizeof' to an incomplete type 'struct dump_iter'
      64 |         i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
         |                     ^     ~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:1041:52: note: expanded from macro 'kzalloc'
    1041 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                                            ^~~~~~~~~~~
   include/linux/alloc_tag.h:253:31: note: expanded from macro 'alloc_hooks'
     253 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:239:9: note: expanded from macro 'alloc_hooks_tag'
     239 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   fs/bcachefs/debug/async_objs.c:62:9: note: forward declaration of 'struct dump_iter'
      62 |         struct dump_iter *i;
         |                ^
>> fs/bcachefs/debug/async_objs.c:64:14: error: invalid application of 'sizeof' to an incomplete type 'struct dump_iter'
      64 |         i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
         |                     ^     ~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:1041:52: note: expanded from macro 'kzalloc'
    1041 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                                            ^~~~~~~~~~~
   include/linux/alloc_tag.h:253:31: note: expanded from macro 'alloc_hooks'
     253 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:243:10: note: expanded from macro 'alloc_hooks_tag'
     243 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   fs/bcachefs/debug/async_objs.c:62:9: note: forward declaration of 'struct dump_iter'
      62 |         struct dump_iter *i;
         |                ^
>> fs/bcachefs/debug/async_objs.c:64:14: error: invalid application of 'sizeof' to an incomplete type 'struct dump_iter'
      64 |         i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
         |                     ^     ~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:1041:52: note: expanded from macro 'kzalloc'
    1041 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                                            ^~~~~~~~~~~
   include/linux/alloc_tag.h:253:31: note: expanded from macro 'alloc_hooks'
     253 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:246:10: note: expanded from macro 'alloc_hooks_tag'
     246 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   fs/bcachefs/debug/async_objs.c:62:9: note: forward declaration of 'struct dump_iter'
      62 |         struct dump_iter *i;
         |                ^
>> fs/bcachefs/debug/async_objs.c:69:3: error: incomplete definition of type 'struct dump_iter'
      69 |         i->from = POS_MIN;
         |         ~^
   fs/bcachefs/debug/async_objs.c:62:9: note: forward declaration of 'struct dump_iter'
      62 |         struct dump_iter *i;
         |                ^
   fs/bcachefs/debug/async_objs.c:70:3: error: incomplete definition of type 'struct dump_iter'
      70 |         i->iter = 0;
         |         ~^
   fs/bcachefs/debug/async_objs.c:62:9: note: forward declaration of 'struct dump_iter'
      62 |         struct dump_iter *i;
         |                ^
   fs/bcachefs/debug/async_objs.c:71:3: error: incomplete definition of type 'struct dump_iter'
      71 |         i->c    = container_of(list, struct bch_fs, async_objs[list->idx]);
         |         ~^
   fs/bcachefs/debug/async_objs.c:62:9: note: forward declaration of 'struct dump_iter'
      62 |         struct dump_iter *i;
         |                ^
   fs/bcachefs/debug/async_objs.c:72:3: error: incomplete definition of type 'struct dump_iter'
      72 |         i->list = list;
         |         ~^
   fs/bcachefs/debug/async_objs.c:62:9: note: forward declaration of 'struct dump_iter'
      62 |         struct dump_iter *i;
         |                ^
   fs/bcachefs/debug/async_objs.c:73:3: error: incomplete definition of type 'struct dump_iter'
      73 |         i->buf  = PRINTBUF;
         |         ~^
   fs/bcachefs/debug/async_objs.c:62:9: note: forward declaration of 'struct dump_iter'
      62 |         struct dump_iter *i;
         |                ^
   fs/bcachefs/debug/async_objs.c:81:33: error: incomplete definition of type 'struct dump_iter'
      81 |         struct async_obj_list *list = i->list;
         |                                       ~^
   fs/bcachefs/debug/async_objs.c:80:9: note: forward declaration of 'struct dump_iter'
      80 |         struct dump_iter *i = file->private_data;
         |                ^
   fs/bcachefs/debug/async_objs.c:84:3: error: incomplete definition of type 'struct dump_iter'
      84 |         i->ubuf = buf;
         |         ~^
   fs/bcachefs/debug/async_objs.c:80:9: note: forward declaration of 'struct dump_iter'
      80 |         struct dump_iter *i = file->private_data;
         |                ^
   fs/bcachefs/debug/async_objs.c:85:3: error: incomplete definition of type 'struct dump_iter'
      85 |         i->size = size;
         |         ~^
   fs/bcachefs/debug/async_objs.c:80:9: note: forward declaration of 'struct dump_iter'
      80 |         struct dump_iter *i = file->private_data;
         |                ^
   fs/bcachefs/debug/async_objs.c:86:3: error: incomplete definition of type 'struct dump_iter'
      86 |         i->ret  = 0;
         |         ~^
   fs/bcachefs/debug/async_objs.c:80:9: note: forward declaration of 'struct dump_iter'
      80 |         struct dump_iter *i = file->private_data;
         |                ^
   fs/bcachefs/debug/async_objs.c:90:51: error: incomplete definition of type 'struct dump_iter'
      90 |         fast_list_for_each_from(&list->list, iter, obj, i->iter) {
         |                                                         ~^
   fs/bcachefs/debug/async_objs.c:80:9: note: forward declaration of 'struct dump_iter'
      80 |         struct dump_iter *i = file->private_data;
         |                ^
   fs/bcachefs/debug/async_objs.c:90:51: error: incomplete definition of type 'struct dump_iter'
      90 |         fast_list_for_each_from(&list->list, iter, obj, i->iter) {
         |                                                         ~^
   fs/bcachefs/debug/async_objs.c:80:9: note: forward declaration of 'struct dump_iter'
      80 |         struct dump_iter *i = file->private_data;
         |                ^
>> fs/bcachefs/debug/async_objs.c:91:9: error: call to undeclared function 'bch2_debugfs_flush_buf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      91 |                 ret = bch2_debugfs_flush_buf(i);
         |                       ^
   fs/bcachefs/debug/async_objs.c:95:9: error: incomplete definition of type 'struct dump_iter'
      95 |                 if (!i->size)
         |                      ~^
   fs/bcachefs/debug/async_objs.c:80:9: note: forward declaration of 'struct dump_iter'
      80 |         struct dump_iter *i = file->private_data;
         |                ^
   fs/bcachefs/debug/async_objs.c:98:23: error: incomplete definition of type 'struct dump_iter'
      98 |                 list->obj_to_text(&i->buf, i->c, obj);
         |                                    ~^
   fs/bcachefs/debug/async_objs.c:80:9: note: forward declaration of 'struct dump_iter'
      80 |         struct dump_iter *i = file->private_data;
         |                ^
   fs/bcachefs/debug/async_objs.c:98:31: error: incomplete definition of type 'struct dump_iter'
      98 |                 list->obj_to_text(&i->buf, i->c, obj);
         |                                            ~^
   fs/bcachefs/debug/async_objs.c:80:9: note: forward declaration of 'struct dump_iter'
      80 |         struct dump_iter *i = file->private_data;
         |                ^
   fs/bcachefs/debug/async_objs.c:99:4: error: incomplete definition of type 'struct dump_iter'
      99 |                 i->iter = iter.pos;
         |                 ~^
   fs/bcachefs/debug/async_objs.c:80:9: note: forward declaration of 'struct dump_iter'
      80 |         struct dump_iter *i = file->private_data;
         |                ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +64 fs/bcachefs/debug/async_objs.c

41e51769b8a649 fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   58  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   59  static int bch2_async_obj_list_open(struct inode *inode, struct file *file)
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   60  {
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   61  	struct async_obj_list *list = inode->i_private;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  @62  	struct dump_iter *i;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   63  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  @64  	i = kzalloc(sizeof(struct dump_iter), GFP_KERNEL);
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   65  	if (!i)
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   66  		return -ENOMEM;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   67  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   68  	file->private_data = i;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  @69  	i->from = POS_MIN;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   70  	i->iter	= 0;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   71  	i->c	= container_of(list, struct bch_fs, async_objs[list->idx]);
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   72  	i->list	= list;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   73  	i->buf	= PRINTBUF;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   74  	return 0;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   75  }
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   76  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   77  static ssize_t bch2_async_obj_list_read(struct file *file, char __user *buf,
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   78  					size_t size, loff_t *ppos)
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   79  {
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  @80  	struct dump_iter *i = file->private_data;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   81  	struct async_obj_list *list = i->list;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   82  	ssize_t ret = 0;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   83  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   84  	i->ubuf = buf;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   85  	i->size	= size;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   86  	i->ret	= 0;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   87  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   88  	struct genradix_iter iter;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   89  	void *obj;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   90  	fast_list_for_each_from(&list->list, iter, obj, i->iter) {
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  @91  		ret = bch2_debugfs_flush_buf(i);
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   92  		if (ret)
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   93  			return ret;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   94  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   95  		if (!i->size)
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   96  			break;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21   97  
43b6a46d5d95bf fs/bcachefs/async_objs.c Kent Overstreet 2025-07-10   98  		list->obj_to_text(&i->buf, i->c, obj);
90221f7301320b fs/bcachefs/async_objs.c Kent Overstreet 2025-07-10   99  		i->iter = iter.pos;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  100  	}
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  101  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  102  	if (i->buf.allocation_failure)
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  103  		ret = -ENOMEM;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  104  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  105  	if (!ret)
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  106  		ret = bch2_debugfs_flush_buf(i);
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  107  
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  108  	return ret ?: i->ret;
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  109  }
0499a82b18b5dd fs/bcachefs/async_objs.c Kent Overstreet 2025-04-21  110  

:::::: The code at line 64 was first introduced by commit
:::::: 0499a82b18b5ddee0d97d2cfcae0c0120f858c1f bcachefs: Async object debugging

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
