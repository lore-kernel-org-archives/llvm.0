Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A039168
	for <llvm@lists.linux.dev>; Mon, 27 Dec 2021 17:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640627930; x=1672163930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NkjbsmiVmuHzXY7F0rRZhYetn0NtusHxc19MkfdVzHs=;
  b=QUV8cwcyLluahe5rJChHvRMRMws59ZUJlMj8CGaGIKc+bhVc2rdOXPxO
   a9gz0/CSOlmtvmvOVcyDmmpCyXpGSmSekiY5KSfuks1V5oryW/XJTH1Dd
   6vD8+sqF+OHu2Ukl/mw1FOQRqQEc7yClRfbxlkJTGxPMzK7una4lSyrcD
   /18mO7c79sHNviWsOpJUNe/ZTBzDZXHh9P6ZxZ51MgWsfbYxHBcLBzhDZ
   lXyovfol+qgUPunlB/8VSpp0hKQ1kyCFmjYxIxn85+pD5phwVK2gbnApH
   z/laTQvsxaEPlc+r8STq1amA/SlTFVxlq4OwbNENxiuuiuZRsVa7EVJGu
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="221918639"
X-IronPort-AV: E=Sophos;i="5.88,240,1635231600"; 
   d="scan'208";a="221918639"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 09:58:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,240,1635231600"; 
   d="scan'208";a="618517709"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Dec 2021 09:58:32 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n1uGW-0006fj-1i; Mon, 27 Dec 2021 17:58:32 +0000
Date: Tue, 28 Dec 2021 01:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: Vasily Averin <vvs@virtuozzo.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, kernel@openvz.org,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nfs4: handle async processing of F_SETLK with FL_SLEEP
Message-ID: <202112280146.yo82FThq-lkp@intel.com>
References: <3a2c6cb9-abe7-ab32-b11c-d78621361555@virtuozzo.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a2c6cb9-abe7-ab32-b11c-d78621361555@virtuozzo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Vasily,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on v5.16-rc7 next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Vasily-Averin/nfs4-handle-async-processing-of-F_SETLK-with-FL_SLEEP/20211227-184632
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
config: i386-randconfig-r005-20211227 (https://download.01.org/0day-ci/archive/20211228/202112280146.yo82FThq-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 511726c64d3b6cca66f7c54d457d586aa3129f67)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/7ae55d384b2f337e6630509e451c35dda45ae185
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Vasily-Averin/nfs4-handle-async-processing-of-F_SETLK-with-FL_SLEEP/20211227-184632
        git checkout 7ae55d384b2f337e6630509e451c35dda45ae185
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/nfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/nfs/nfs4proc.c:7202:25: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
           if ((request->fl_flags && FL_SLEEP) && IS_SETLK(cmd))
                                  ^  ~~~~~~~~
   fs/nfs/nfs4proc.c:7202:25: note: use '&' for a bitwise operation
           if ((request->fl_flags && FL_SLEEP) && IS_SETLK(cmd))
                                  ^~
                                  &
   fs/nfs/nfs4proc.c:7202:25: note: remove constant to silence this warning
           if ((request->fl_flags && FL_SLEEP) && IS_SETLK(cmd))
                                 ~^~~~~~~~~~~
   1 warning generated.


vim +7202 fs/nfs/nfs4proc.c

  7193	
  7194	static int _nfs4_proc_setlk(struct nfs4_state *state, int cmd, struct file_lock *request)
  7195	{
  7196		struct nfs_inode *nfsi = NFS_I(state->inode);
  7197		struct nfs4_state_owner *sp = state->owner;
  7198		unsigned char fl_flags = request->fl_flags;
  7199		int status;
  7200	
  7201		request->fl_flags |= FL_ACCESS;
> 7202		if ((request->fl_flags && FL_SLEEP) && IS_SETLK(cmd))
  7203			status = posix_lock_file(request->fl_file, request, NULL);
  7204		else
  7205			status = locks_lock_inode_wait(state->inode, request);
  7206		if (status)
  7207			goto out;
  7208		mutex_lock(&sp->so_delegreturn_mutex);
  7209		down_read(&nfsi->rwsem);
  7210		if (test_bit(NFS_DELEGATED_STATE, &state->flags)) {
  7211			/* Yes: cache locks! */
  7212			/* ...but avoid races with delegation recall... */
  7213			request->fl_flags = fl_flags & ~FL_SLEEP;
  7214			status = locks_lock_inode_wait(state->inode, request);
  7215			up_read(&nfsi->rwsem);
  7216			mutex_unlock(&sp->so_delegreturn_mutex);
  7217			goto out;
  7218		}
  7219		up_read(&nfsi->rwsem);
  7220		mutex_unlock(&sp->so_delegreturn_mutex);
  7221		status = _nfs4_do_setlk(state, cmd, request, NFS_LOCK_NEW);
  7222	out:
  7223		request->fl_flags = fl_flags;
  7224		return status;
  7225	}
  7226	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
