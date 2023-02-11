Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58397F4;
	Sat, 11 Feb 2023 01:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676079054; x=1707615054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+UWsdxrOI8sICLOnpXx6z6RZ0IREm2aFB7BYK3ujS0A=;
  b=kBTKp98vVKjyH1oekmMcktu9rQ1YWxWVoqV5QXHzGJamdvi+XNW9lT8r
   g4Aq4JebaSr30ryIzo4GiDBtHxEU2fu3lO6IxI0lWWb6+K5nJFqqqUGBj
   mTpK5JUBiN/jppdSJACoby9KEIrkezZ6ZaWFMLoVjvAbaZBYCGe67XHzp
   HbuM5n6etdo/dG2H/5BdJvJ1r3jUkU41qLNv5J4b57Q7T+h1/CW07wsv6
   YoJJY9DIsfSRJqXtz8g8A/SGJmJpGqdgFYJdN5v5n1UH/XyicoAtSiqel
   8Tta+4kyDZSt/1S7+93LeVhXwyUjpV1rK/PgypJtJf3sCDy/PNHTrxOHW
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="330578343"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="330578343"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 17:30:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="756971441"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="756971441"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2023 17:30:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQej5-0006A9-3C;
	Sat, 11 Feb 2023 01:30:52 +0000
Date: Sat, 11 Feb 2023 09:30:13 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:dhowells/linux-fs/rxrpc-next 4/10]
 fs/afs/rxrpc.c:157:6: warning: variable 'o' is used uninitialized whenever
 'if' condition is false
Message-ID: <202302110939.GED9MYd1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/rxrpc-next
head:   c661a1d21c087e6a776a85eb4c60fbba29caaf99
commit: 0f2dc9220002c9a8172c453b9550df310bf9bd60 [4/10] rxrpc: Allow UDP socket sharing for AF_RXRPC service sockets
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20230211/202302110939.GED9MYd1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/0f2dc9220002c9a8172c453b9550df310bf9bd60
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/rxrpc-next
        git checkout 0f2dc9220002c9a8172c453b9550df310bf9bd60
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/afs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302110939.GED9MYd1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/afs/rxrpc.c:157:6: warning: variable 'o' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (!prealloc)
               ^~~~~~~~~
   fs/afs/rxrpc.c:159:58: note: uninitialized use occurs here
           trace_afs_call(call->debug_id, afs_call_trace_alloc, 1, o,
                                                                   ^
   fs/afs/rxrpc.c:157:2: note: remove the 'if' if its condition is always true
           if (!prealloc)
           ^~~~~~~~~~~~~~
   fs/afs/rxrpc.c:142:7: note: initialize the variable 'o' to silence this warning
           int o;
                ^
                 = 0
   1 warning generated.


vim +157 fs/afs/rxrpc.c

   133	
   134	/*
   135	 * Allocate a call.
   136	 */
   137	static struct afs_call *afs_alloc_call(struct afs_net *net,
   138					       const struct afs_call_type *type,
   139					       bool prealloc, gfp_t gfp)
   140	{
   141		struct afs_call *call;
   142		int o;
   143	
   144		call = kzalloc(sizeof(*call), gfp);
   145		if (!call)
   146			return NULL;
   147	
   148		call->type = type;
   149		call->net = net;
   150		call->debug_id = atomic_inc_return(&rxrpc_debug_id);
   151		refcount_set(&call->ref, 1);
   152		INIT_WORK(&call->async_work, afs_process_async_call);
   153		init_waitqueue_head(&call->waitq);
   154		spin_lock_init(&call->state_lock);
   155		call->iter = &call->def_iter;
   156	
 > 157		if (!prealloc)
   158			o = atomic_inc_return(&net->nr_outstanding_calls);
   159		trace_afs_call(call->debug_id, afs_call_trace_alloc, 1, o,
   160			       __builtin_return_address(0));
   161		return call;
   162	}
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
