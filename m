Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAA3173
	for <llvm@lists.linux.dev>; Mon, 27 Dec 2021 13:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640610023; x=1672146023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MKxL8dgBk3R5/XNvlt7YYq/kRC7xwnUj2P3HBcvE73c=;
  b=bDNczRsEiDId+xra8rdabO2vdD4aTNLfyLMGFaepyJPNRaxO71QOdUP+
   XSaeKpczvVxu5hCHdKaUr+qLcp/EJxGLnNthel938r8d2r8L2FGI7rMXL
   lA+J180mkxe3UJUqYvjEfyBFYE8Kf2gPiHZxabnCTs4wgo/cLRg3+ex7t
   YxIo+uH2dG++iZEW5hD4qFU67shQX8H8TCbsEZfxXi2C4bOUSJjRrxY2/
   hxiQgmLbTwGmlBtN85b3mbS5++4biOkIgkcduq4jLR9Ct7UnEXYS7ij80
   6q/6XCy9YDgCD+Km+qsqat/jPJ3vV2s8LkL3XZjeLyC7PTc3WDun42sxr
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="221873031"
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
   d="scan'208";a="221873031"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 05:00:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
   d="scan'208";a="588561503"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Dec 2021 05:00:20 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n1pbv-0006HT-74; Mon, 27 Dec 2021 13:00:19 +0000
Date: Mon, 27 Dec 2021 20:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: Vasily Averin <vvs@virtuozzo.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, kernel@openvz.org,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nfs: local_lock: handle async processing of F_SETLK with
 FL_SLEEP
Message-ID: <202112272042.Xlz50x0x-lkp@intel.com>
References: <6613b17b-43bd-07d0-2ca7-1581a39cdf7b@virtuozzo.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6613b17b-43bd-07d0-2ca7-1581a39cdf7b@virtuozzo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Vasily,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on v5.16-rc7 next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Vasily-Averin/nfs-local_lock-handle-async-processing-of-F_SETLK-with-FL_SLEEP/20211227-184705
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
config: i386-randconfig-r034-20211227 (https://download.01.org/0day-ci/archive/20211227/202112272042.Xlz50x0x-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 511726c64d3b6cca66f7c54d457d586aa3129f67)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/00e7edbaaa914f1b049ab8a652c5a91483f4141d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Vasily-Averin/nfs-local_lock-handle-async-processing-of-F_SETLK-with-FL_SLEEP/20211227-184705
        git checkout 00e7edbaaa914f1b049ab8a652c5a91483f4141d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/nfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/nfs/file.c:772:25: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
           else if ((fl->fl_flags && FL_SLEEP) && IS_SETLK(cmd))
                                  ^  ~~~~~~~~
   fs/nfs/file.c:772:25: note: use '&' for a bitwise operation
           else if ((fl->fl_flags && FL_SLEEP) && IS_SETLK(cmd))
                                  ^~
                                  &
   fs/nfs/file.c:772:25: note: remove constant to silence this warning
           else if ((fl->fl_flags && FL_SLEEP) && IS_SETLK(cmd))
                                 ~^~~~~~~~~~~
   1 warning generated.


vim +772 fs/nfs/file.c

   751	
   752	static int
   753	do_setlk(struct file *filp, int cmd, struct file_lock *fl, int is_local)
   754	{
   755		struct inode *inode = filp->f_mapping->host;
   756		int status;
   757	
   758		/*
   759		 * Flush all pending writes before doing anything
   760		 * with locks..
   761		 */
   762		status = nfs_sync_mapping(filp->f_mapping);
   763		if (status != 0)
   764			goto out;
   765	
   766		/*
   767		 * Use local locking if mounted with "-onolock" or with appropriate
   768		 * "-olocal_lock="
   769		 */
   770		if (!is_local)
   771			status = NFS_PROTO(inode)->lock(filp, cmd, fl);
 > 772		else if ((fl->fl_flags && FL_SLEEP) && IS_SETLK(cmd))
   773			status = posix_lock_file(filp, fl, NULL);
   774		else
   775			status = locks_lock_file_wait(filp, fl);
   776		if (status)
   777			goto out;
   778	
   779		/*
   780		 * Invalidate cache to prevent missing any changes.  If
   781		 * the file is mapped, clear the page cache as well so
   782		 * those mappings will be loaded.
   783		 *
   784		 * This makes locking act as a cache coherency point.
   785		 */
   786		nfs_sync_mapping(filp->f_mapping);
   787		if (!NFS_PROTO(inode)->have_delegation(inode, FMODE_READ)) {
   788			nfs_zap_caches(inode);
   789			if (mapping_mapped(filp->f_mapping))
   790				nfs_revalidate_mapping(inode, filp->f_mapping);
   791		}
   792	out:
   793		return status;
   794	}
   795	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
