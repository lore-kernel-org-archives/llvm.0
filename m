Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865FDAD28;
	Thu, 16 Mar 2023 20:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678997144; x=1710533144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C0cReLFJhnT5aG5DPSfFtGFMx4wRxAweCSiz/LnzkQQ=;
  b=fGCoC4GG2LKA+HNH+L/623p5Mbw0HPFThQ/+CYHeLKgP24BNWVG4/UY5
   SXEoiZdryIG3vQ45zhV4yKDMnA8HAWZb4QhwPKNoFSOVPJ/Y1ZI7TcT/y
   2/M/6xsq5bsU4DAdvRWGOdm0j3s2CRGP/q0L54Il5r57lrdzwfz6quAX9
   NuWzjpO9w9ol+3OmOPkFFVzBdbOfrVn/pNXXTcRf4sCWgSFAhXjdDwKGs
   Nale0hhrsecoGnaf2YzpikrtfdYRcTFvIBcTkyq52RNkbvEaP+aT5Rw4D
   jaqO2X022R2ZCbyQFGR9vEvmDbHoOLJJt4fwNioqHBaue2mSjlQKZlPIT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="318497120"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="318497120"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 13:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="710270759"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="710270759"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Mar 2023 13:05:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pctr4-0008mg-0D;
	Thu, 16 Mar 2023 20:05:42 +0000
Date: Fri, 17 Mar 2023 04:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:pipe-list 48/48] block/blk-merge.c:531:33: warning:
 suggest braces around initialization of subobject
Message-ID: <202303170443.S6hI1D4P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git pipe-list
head:   b678626289708f1a3b1f2a46671bf3e0f00282e5
commit: b678626289708f1a3b1f2a46671bf3e0f00282e5 [48/48] pipe: Use a linked-list instead of a ring buffer
config: x86_64-randconfig-a012-20230313 (https://download.01.org/0day-ci/archive/20230317/202303170443.S6hI1D4P-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=b678626289708f1a3b1f2a46671bf3e0f00282e5
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs pipe-list
        git checkout b678626289708f1a3b1f2a46671bf3e0f00282e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303170443.S6hI1D4P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-merge.c:531:33: warning: suggest braces around initialization of subobject [-Wmissing-braces]
           struct bio_vec bvec, bvprv = { NULL };
                                          ^~~~
                                          {   }
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   1 warning generated.
--
>> block/blk-integrity.c:29:31: warning: suggest braces around initialization of subobject [-Wmissing-braces]
           struct bio_vec iv, ivprv = { NULL };
                                        ^~~~
                                        {   }
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   block/blk-integrity.c:71:31: warning: suggest braces around initialization of subobject [-Wmissing-braces]
           struct bio_vec iv, ivprv = { NULL };
                                        ^~~~
                                        {   }
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   2 warnings generated.


vim +531 block/blk-merge.c

963ab9e5da95c6 Asias He          2012-08-02  526  
5cb8850c9c4a76 Kent Overstreet   2014-02-07  527  static int __blk_bios_map_sg(struct request_queue *q, struct bio *bio,
5cb8850c9c4a76 Kent Overstreet   2014-02-07  528  			     struct scatterlist *sglist,
5cb8850c9c4a76 Kent Overstreet   2014-02-07  529  			     struct scatterlist **sg)
963ab9e5da95c6 Asias He          2012-08-02  530  {
3f649ab728cda8 Kees Cook         2020-06-03 @531  	struct bio_vec bvec, bvprv = { NULL };
5cb8850c9c4a76 Kent Overstreet   2014-02-07  532  	struct bvec_iter iter;
38417468d4f05c Christoph Hellwig 2018-12-13  533  	int nsegs = 0;
f6970f83ef7950 Ming Lei          2019-03-17  534  	bool new_bio = false;
5cb8850c9c4a76 Kent Overstreet   2014-02-07  535  
f6970f83ef7950 Ming Lei          2019-03-17  536  	for_each_bio(bio) {
f6970f83ef7950 Ming Lei          2019-03-17  537  		bio_for_each_bvec(bvec, bio, iter) {
f6970f83ef7950 Ming Lei          2019-03-17  538  			/*
f6970f83ef7950 Ming Lei          2019-03-17  539  			 * Only try to merge bvecs from two bios given we
f6970f83ef7950 Ming Lei          2019-03-17  540  			 * have done bio internal merge when adding pages
f6970f83ef7950 Ming Lei          2019-03-17  541  			 * to bio
f6970f83ef7950 Ming Lei          2019-03-17  542  			 */
f6970f83ef7950 Ming Lei          2019-03-17  543  			if (new_bio &&
f6970f83ef7950 Ming Lei          2019-03-17  544  			    __blk_segment_map_sg_merge(q, &bvec, &bvprv, sg))
f6970f83ef7950 Ming Lei          2019-03-17  545  				goto next_bvec;
f6970f83ef7950 Ming Lei          2019-03-17  546  
f6970f83ef7950 Ming Lei          2019-03-17  547  			if (bvec.bv_offset + bvec.bv_len <= PAGE_SIZE)
f6970f83ef7950 Ming Lei          2019-03-17  548  				nsegs += __blk_bvec_map_sg(bvec, sglist, sg);
f6970f83ef7950 Ming Lei          2019-03-17  549  			else
f6970f83ef7950 Ming Lei          2019-03-17  550  				nsegs += blk_bvec_map_sg(q, &bvec, sglist, sg);
f6970f83ef7950 Ming Lei          2019-03-17  551   next_bvec:
f6970f83ef7950 Ming Lei          2019-03-17  552  			new_bio = false;
f6970f83ef7950 Ming Lei          2019-03-17  553  		}
b21e11c5c8311b Ming Lei          2019-04-02  554  		if (likely(bio->bi_iter.bi_size)) {
f6970f83ef7950 Ming Lei          2019-03-17  555  			bvprv = bvec;
f6970f83ef7950 Ming Lei          2019-03-17  556  			new_bio = true;
f6970f83ef7950 Ming Lei          2019-03-17  557  		}
b21e11c5c8311b Ming Lei          2019-04-02  558  	}
d6d48196961729 Jens Axboe        2008-01-29  559  
5cb8850c9c4a76 Kent Overstreet   2014-02-07  560  	return nsegs;
5cb8850c9c4a76 Kent Overstreet   2014-02-07  561  }
5cb8850c9c4a76 Kent Overstreet   2014-02-07  562  

:::::: The code at line 531 was first introduced by commit
:::::: 3f649ab728cda8038259d8f14492fe400fbab911 treewide: Remove uninitialized_var() usage

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
