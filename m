Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657AF23A0
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 19:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649790202; x=1681326202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HpGjrYJoEalUKEBztA14G6zIloZOB+OyJDxSAc6VVcE=;
  b=j2JIglsaDk4yv2rBBxMRGNw1n1qOGy3IJlKNGQo0Iu5FnSCrKIcVKr+B
   foSKL156/0BUfFyAFGgWnptFRPFnTk6I5KBzhlfoQ5b0RRZPwE8CheMOH
   rC1EjYlz0HJ8UGf7GtdyXqldprp0smH28Ekx0alF0Sc4+odNzb3F5UkrN
   brqStYcC2PUFNoyvy5GQABDiBdesot05SjSsodLwjsTNrDamuuHoXUaYZ
   HHz7U/hxykEgpe33yJP9WfXdaGPaM/yvgiNBvnWb4tbZyjYRjHRLb7jSY
   49RI5NxObre4AmgdP8KiuInmv0ni7kTvH987QtIFm96v0u0uR2YSGQ6ux
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="262661223"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="262661223"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 12:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="644869089"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Apr 2022 12:03:18 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1neLnK-00036G-0c;
	Tue, 12 Apr 2022 19:03:18 +0000
Date: Wed, 13 Apr 2022 03:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC V2 1/8] perf: Consolidate branch sample filter helpers
Message-ID: <202204130219.KG5G7zyU-lkp@intel.com>
References: <20220412115455.293119-2-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412115455.293119-2-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Anshuman,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master linux/master v5.18-rc2]
[cannot apply to tip/perf/core tip/master next-20220412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/arm64-perf-Enable-branch-stack-sampling/20220412-204141
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
config: i386-randconfig-a001-20220411 (https://download.01.org/0day-ci/archive/20220413/202204130219.KG5G7zyU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6d93333c8ddf355a33ed0f51718603406412afbb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Anshuman-Khandual/arm64-perf-Enable-branch-stack-sampling/20220412-204141
        git checkout 6d93333c8ddf355a33ed0f51718603406412afbb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from ipc/msg.c:35:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   include/linux/perf_event.h:1685:42: error: use of undeclared identifier 'PERF_SAMPLE_BRANCH_PRIV_SAVE'; did you mean 'PERF_SAMPLE_BRANCH_TYPE_SAVE'?
           return event->attr.branch_sample_type & PERF_SAMPLE_BRANCH_PRIV_SAVE;
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                   PERF_SAMPLE_BRANCH_TYPE_SAVE
   include/uapi/linux/perf_event.h:231:2: note: 'PERF_SAMPLE_BRANCH_TYPE_SAVE' declared here
           PERF_SAMPLE_BRANCH_TYPE_SAVE    =
           ^
>> ipc/msg.c:496:20: warning: implicit conversion from 'int' to 'unsigned short' changes value from 32768000 to 0 [-Wconstant-conversion]
           msginfo->msgseg = MSGSEG;
                           ~ ^~~~~~
   include/uapi/linux/msg.h:87:38: note: expanded from macro 'MSGSEG'
   #define MSGSEG (__MSGSEG <= 0xffff ? __MSGSEG : 0xffff)
                                        ^~~~~~~~
   include/uapi/linux/msg.h:86:36: note: expanded from macro '__MSGSEG'
   #define __MSGSEG ((MSGPOOL * 1024) / MSGSSZ) /* max no. of segments */
                     ~~~~~~~~~~~~~~~~~^~~~~~~~
   1 warning and 1 error generated.


vim +496 ipc/msg.c

a0d092fc2df845 Pierre Peiffer  2008-04-29  475  
156d9ed1260ee5 Al Viro         2017-07-09  476  static int msgctl_info(struct ipc_namespace *ns, int msqid,
156d9ed1260ee5 Al Viro         2017-07-09  477  			 int cmd, struct msginfo *msginfo)
a0d092fc2df845 Pierre Peiffer  2008-04-29  478  {
2cafed30f150f7 Davidlohr Bueso 2013-07-08  479  	int err;
27c331a1746142 Manfred Spraul  2018-08-21  480  	int max_idx;
5a06a363ef4844 Ingo Molnar     2006-07-30  481  
5a06a363ef4844 Ingo Molnar     2006-07-30  482  	/*
5a06a363ef4844 Ingo Molnar     2006-07-30  483  	 * We must not return kernel stack data.
^1da177e4c3f41 Linus Torvalds  2005-04-16  484  	 * due to padding, it's not enough
^1da177e4c3f41 Linus Torvalds  2005-04-16  485  	 * to set all member fields.
^1da177e4c3f41 Linus Torvalds  2005-04-16  486  	 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  487  	err = security_msg_queue_msgctl(NULL, cmd);
^1da177e4c3f41 Linus Torvalds  2005-04-16  488  	if (err)
^1da177e4c3f41 Linus Torvalds  2005-04-16  489  		return err;
^1da177e4c3f41 Linus Torvalds  2005-04-16  490  
156d9ed1260ee5 Al Viro         2017-07-09  491  	memset(msginfo, 0, sizeof(*msginfo));
156d9ed1260ee5 Al Viro         2017-07-09  492  	msginfo->msgmni = ns->msg_ctlmni;
156d9ed1260ee5 Al Viro         2017-07-09  493  	msginfo->msgmax = ns->msg_ctlmax;
156d9ed1260ee5 Al Viro         2017-07-09  494  	msginfo->msgmnb = ns->msg_ctlmnb;
156d9ed1260ee5 Al Viro         2017-07-09  495  	msginfo->msgssz = MSGSSZ;
156d9ed1260ee5 Al Viro         2017-07-09 @496  	msginfo->msgseg = MSGSEG;
d9a605e40b1376 Davidlohr Bueso 2013-09-11  497  	down_read(&msg_ids(ns).rwsem);
^1da177e4c3f41 Linus Torvalds  2005-04-16  498  	if (cmd == MSG_INFO) {
156d9ed1260ee5 Al Viro         2017-07-09  499  		msginfo->msgpool = msg_ids(ns).in_use;
156d9ed1260ee5 Al Viro         2017-07-09  500  		msginfo->msgmap = atomic_read(&ns->msg_hdrs);
156d9ed1260ee5 Al Viro         2017-07-09  501  		msginfo->msgtql = atomic_read(&ns->msg_bytes);
^1da177e4c3f41 Linus Torvalds  2005-04-16  502  	} else {
156d9ed1260ee5 Al Viro         2017-07-09  503  		msginfo->msgmap = MSGMAP;
156d9ed1260ee5 Al Viro         2017-07-09  504  		msginfo->msgpool = MSGPOOL;
156d9ed1260ee5 Al Viro         2017-07-09  505  		msginfo->msgtql = MSGTQL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  506  	}
27c331a1746142 Manfred Spraul  2018-08-21  507  	max_idx = ipc_get_maxidx(&msg_ids(ns));
d9a605e40b1376 Davidlohr Bueso 2013-09-11  508  	up_read(&msg_ids(ns).rwsem);
27c331a1746142 Manfred Spraul  2018-08-21  509  	return (max_idx < 0) ? 0 : max_idx;
^1da177e4c3f41 Linus Torvalds  2005-04-16  510  }
2cafed30f150f7 Davidlohr Bueso 2013-07-08  511  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
