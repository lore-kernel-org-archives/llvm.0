Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA89A939;
	Tue, 14 Mar 2023 18:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678820338; x=1710356338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vu7xqp3t8MpElplnB9xls9A5ZOgutAPcojKJGBkEo+w=;
  b=J38mIHBqa6pN55toTWe8SBMGc+tPf8o9ctCzVt5j0t7xfpuIb2QyA3M9
   BIB2kj5R/zWiKh6kB9HzUAStDi6Gm2KDJ9uFzaw/A9OcUy/TCOHb0vxxD
   elDUFNCrezUjrr256byYXLh/ZhqVVYrU3PjccD3YsOsV5jpJYtsARs+ae
   5F0FZHqyDIWFtlhthpI1QZ71T5F8QfBRDXsgEWSPr9TtT6UkoUwmee6W+
   Z4+enLZKvyOSRYrGQJFGv6A+nReJALDLvdwUUeNAsce+nmptwtiKsS0db
   B18816U6zwuziCKgnL6T/OkF1lmAjYonNNgVOx8YSVrkwbIe6HBJawDNs
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="317913589"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="317913589"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 11:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="672450593"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="672450593"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Mar 2023 11:58:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc9rE-00077m-1z;
	Tue, 14 Mar 2023 18:58:48 +0000
Date: Wed, 15 Mar 2023 02:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:pipe-list 36/39] fs/fuse/dev.c:715:31: error:
 incomplete definition of type 'struct pipe_inode_info'
Message-ID: <202303150237.zbju2psg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git pipe-list
head:   04b41c19739aec7e0cae6cba28b4e317d703a614
commit: 56d3d64eb47f591c19ac2df0fb268f410ec0887e [36/39] pipe: Privatise the internals
config: i386-randconfig-a011-20230313 (https://download.01.org/0day-ci/archive/20230315/202303150237.zbju2psg-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=56d3d64eb47f591c19ac2df0fb268f410ec0887e
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs pipe-list
        git checkout 56d3d64eb47f591c19ac2df0fb268f410ec0887e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/fuse/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303150237.zbju2psg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/fuse/dev.c:715:31: error: incomplete definition of type 'struct pipe_inode_info'
                           if (cs->nr_segs >= cs->pipe->max_usage)
                                              ~~~~~~~~^
   include/linux/sched.h:59:8: note: forward declaration of 'struct pipe_inode_info'
   struct pipe_inode_info;
          ^
   fs/fuse/dev.c:900:29: error: incomplete definition of type 'struct pipe_inode_info'
           if (cs->nr_segs >= cs->pipe->max_usage)
                              ~~~~~~~~^
   include/linux/sched.h:59:8: note: forward declaration of 'struct pipe_inode_info'
   struct pipe_inode_info;
          ^
   fs/fuse/dev.c:1383:28: error: incomplete definition of type 'struct pipe_inode_info'
           bufs = kvmalloc_array(pipe->max_usage, sizeof(struct pipe_buffer),
                                 ~~~~^
   include/linux/sched.h:59:8: note: forward declaration of 'struct pipe_inode_info'
   struct pipe_inode_info;
          ^
>> fs/fuse/dev.c:1395:6: error: implicit declaration of function 'pipe_occupancy' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (pipe_occupancy(pipe->head, pipe->tail) + cs.nr_segs > pipe->max_usage) {
               ^
   fs/fuse/dev.c:1395:25: error: incomplete definition of type 'struct pipe_inode_info'
           if (pipe_occupancy(pipe->head, pipe->tail) + cs.nr_segs > pipe->max_usage) {
                              ~~~~^
   include/linux/sched.h:59:8: note: forward declaration of 'struct pipe_inode_info'
   struct pipe_inode_info;
          ^
   fs/fuse/dev.c:1395:37: error: incomplete definition of type 'struct pipe_inode_info'
           if (pipe_occupancy(pipe->head, pipe->tail) + cs.nr_segs > pipe->max_usage) {
                                          ~~~~^
   include/linux/sched.h:59:8: note: forward declaration of 'struct pipe_inode_info'
   struct pipe_inode_info;
          ^
   fs/fuse/dev.c:1395:64: error: incomplete definition of type 'struct pipe_inode_info'
           if (pipe_occupancy(pipe->head, pipe->tail) + cs.nr_segs > pipe->max_usage) {
                                                                     ~~~~^
   include/linux/sched.h:59:8: note: forward declaration of 'struct pipe_inode_info'
   struct pipe_inode_info;
          ^
   fs/fuse/dev.c:1982:13: error: incomplete definition of type 'struct pipe_inode_info'
           head = pipe->head;
                  ~~~~^
   include/linux/sched.h:59:8: note: forward declaration of 'struct pipe_inode_info'
   struct pipe_inode_info;
          ^
   fs/fuse/dev.c:1983:13: error: incomplete definition of type 'struct pipe_inode_info'
           tail = pipe->tail;
                  ~~~~^
   include/linux/sched.h:59:8: note: forward declaration of 'struct pipe_inode_info'
   struct pipe_inode_info;
          ^
   fs/fuse/dev.c:1984:13: error: incomplete definition of type 'struct pipe_inode_info'
           mask = pipe->ring_size - 1;
                  ~~~~^
   include/linux/sched.h:59:8: note: forward declaration of 'struct pipe_inode_info'
   struct pipe_inode_info;
          ^
   fs/fuse/dev.c:1996:14: error: incomplete definition of type 'struct pipe_inode_info'
                   rem += pipe->bufs[idx & mask].len;
                          ~~~~^
   include/linux/sched.h:59:8: note: forward declaration of 'struct pipe_inode_info'
   struct pipe_inode_info;
          ^
   fs/fuse/dev.c:2010:15: error: incomplete definition of type 'struct pipe_inode_info'
                   ibuf = &pipe->bufs[tail & mask];
                           ~~~~^
   include/linux/sched.h:59:8: note: forward declaration of 'struct pipe_inode_info'
   struct pipe_inode_info;
          ^
   fs/fuse/dev.c:2017:8: error: incomplete definition of type 'struct pipe_inode_info'
                           pipe->tail = tail;
                           ~~~~^
   include/linux/sched.h:59:8: note: forward declaration of 'struct pipe_inode_info'
   struct pipe_inode_info;
          ^
   13 errors generated.


vim +715 fs/fuse/dev.c

334f485df85ac77 Miklos Szeredi 2005-09-09  684  
334f485df85ac77 Miklos Szeredi 2005-09-09  685  /*
334f485df85ac77 Miklos Szeredi 2005-09-09  686   * Get another pagefull of userspace buffer, and map it to kernel
334f485df85ac77 Miklos Szeredi 2005-09-09  687   * address space, and lock request
334f485df85ac77 Miklos Szeredi 2005-09-09  688   */
334f485df85ac77 Miklos Szeredi 2005-09-09  689  static int fuse_copy_fill(struct fuse_copy_state *cs)
334f485df85ac77 Miklos Szeredi 2005-09-09  690  {
c55a01d360afafc Miklos Szeredi 2014-07-07  691  	struct page *page;
334f485df85ac77 Miklos Szeredi 2005-09-09  692  	int err;
334f485df85ac77 Miklos Szeredi 2005-09-09  693  
dc00809a53edd15 Miklos Szeredi 2015-07-01  694  	err = unlock_request(cs->req);
0d8e84b0432beb6 Miklos Szeredi 2015-07-01  695  	if (err)
0d8e84b0432beb6 Miklos Szeredi 2015-07-01  696  		return err;
0d8e84b0432beb6 Miklos Szeredi 2015-07-01  697  
334f485df85ac77 Miklos Szeredi 2005-09-09  698  	fuse_copy_finish(cs);
dd3bb14f44a6382 Miklos Szeredi 2010-05-25  699  	if (cs->pipebufs) {
dd3bb14f44a6382 Miklos Szeredi 2010-05-25  700  		struct pipe_buffer *buf = cs->pipebufs;
dd3bb14f44a6382 Miklos Szeredi 2010-05-25  701  
c3021629a0d8202 Miklos Szeredi 2010-05-25  702  		if (!cs->write) {
fba597db4218ac3 Miklos Szeredi 2016-09-27  703  			err = pipe_buf_confirm(cs->pipe, buf);
dd3bb14f44a6382 Miklos Szeredi 2010-05-25  704  			if (err)
dd3bb14f44a6382 Miklos Szeredi 2010-05-25  705  				return err;
dd3bb14f44a6382 Miklos Szeredi 2010-05-25  706  
dd3bb14f44a6382 Miklos Szeredi 2010-05-25  707  			BUG_ON(!cs->nr_segs);
dd3bb14f44a6382 Miklos Szeredi 2010-05-25  708  			cs->currbuf = buf;
c55a01d360afafc Miklos Szeredi 2014-07-07  709  			cs->pg = buf->page;
c55a01d360afafc Miklos Szeredi 2014-07-07  710  			cs->offset = buf->offset;
dd3bb14f44a6382 Miklos Szeredi 2010-05-25  711  			cs->len = buf->len;
dd3bb14f44a6382 Miklos Szeredi 2010-05-25  712  			cs->pipebufs++;
dd3bb14f44a6382 Miklos Szeredi 2010-05-25  713  			cs->nr_segs--;
c3021629a0d8202 Miklos Szeredi 2010-05-25  714  		} else {
6718b6f855a0b49 David Howells  2019-10-16 @715  			if (cs->nr_segs >= cs->pipe->max_usage)
c3021629a0d8202 Miklos Szeredi 2010-05-25  716  				return -EIO;
c3021629a0d8202 Miklos Szeredi 2010-05-25  717  
c3021629a0d8202 Miklos Szeredi 2010-05-25  718  			page = alloc_page(GFP_HIGHUSER);
c3021629a0d8202 Miklos Szeredi 2010-05-25  719  			if (!page)
c3021629a0d8202 Miklos Szeredi 2010-05-25  720  				return -ENOMEM;
c3021629a0d8202 Miklos Szeredi 2010-05-25  721  
c3021629a0d8202 Miklos Szeredi 2010-05-25  722  			buf->page = page;
c3021629a0d8202 Miklos Szeredi 2010-05-25  723  			buf->offset = 0;
c3021629a0d8202 Miklos Szeredi 2010-05-25  724  			buf->len = 0;
c3021629a0d8202 Miklos Szeredi 2010-05-25  725  
c3021629a0d8202 Miklos Szeredi 2010-05-25  726  			cs->currbuf = buf;
c55a01d360afafc Miklos Szeredi 2014-07-07  727  			cs->pg = page;
c55a01d360afafc Miklos Szeredi 2014-07-07  728  			cs->offset = 0;
c3021629a0d8202 Miklos Szeredi 2010-05-25  729  			cs->len = PAGE_SIZE;
c3021629a0d8202 Miklos Szeredi 2010-05-25  730  			cs->pipebufs++;
c3021629a0d8202 Miklos Szeredi 2010-05-25  731  			cs->nr_segs++;
c3021629a0d8202 Miklos Szeredi 2010-05-25  732  		}
dd3bb14f44a6382 Miklos Szeredi 2010-05-25  733  	} else {
6c09e94a32e1094 Al Viro        2015-04-03  734  		size_t off;
1ef255e257173f4 Al Viro        2022-06-09  735  		err = iov_iter_get_pages2(cs->iter, &page, PAGE_SIZE, 1, &off);
334f485df85ac77 Miklos Szeredi 2005-09-09  736  		if (err < 0)
334f485df85ac77 Miklos Szeredi 2005-09-09  737  			return err;
6c09e94a32e1094 Al Viro        2015-04-03  738  		BUG_ON(!err);
6c09e94a32e1094 Al Viro        2015-04-03  739  		cs->len = err;
6c09e94a32e1094 Al Viro        2015-04-03  740  		cs->offset = off;
c55a01d360afafc Miklos Szeredi 2014-07-07  741  		cs->pg = page;
dd3bb14f44a6382 Miklos Szeredi 2010-05-25  742  	}
334f485df85ac77 Miklos Szeredi 2005-09-09  743  
dc00809a53edd15 Miklos Szeredi 2015-07-01  744  	return lock_request(cs->req);
334f485df85ac77 Miklos Szeredi 2005-09-09  745  }
334f485df85ac77 Miklos Szeredi 2005-09-09  746  

:::::: The code at line 715 was first introduced by commit
:::::: 6718b6f855a0b4962d54bd625be2718cb820cec6 pipe: Allow pipes to have kernel-reserved slots

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
