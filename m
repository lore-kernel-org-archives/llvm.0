Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B611109
	for <llvm@lists.linux.dev>; Wed, 22 Jun 2022 16:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655916356; x=1687452356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7ccKqyXYKVwJv71q5J9RKGEr3PdUchbiSLz0u5zwIT0=;
  b=JbSftPdAlb0ypXwP76y/CTkSyvqjNSPQJLV9IMm6h4aUR2QpMUqyA7aq
   QE78VY9al81/PAx5YI8XGlvHAOX5/tAL1pmY6I6rf0VeqBG8hxOOjNb/X
   PrwOuftdOMZWEhKIYWJGDSJlvTEpdyQHusd7Qq8+x4zAVhVuTcZ0Rpqzc
   FHivbiwQn7VMNn1g0TctrPfCPbtYG2kUPI1CMdOXInsmhHJcLHPvFMXWa
   jOCP1MqJGBGZzGi2vUURG+GJ9Ry+IPKRJ10wBCbCNPqwGtuQ8S7bbR/1G
   C0C5NW0xjt2fU2x6/kLVCsKmCdMCeCaqVAeIDppSs+oS3ltTiRc96CwKK
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="344462664"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="344462664"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 09:45:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; 
   d="scan'208";a="730433678"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2022 09:45:54 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o43UH-0001UZ-VC;
	Wed, 22 Jun 2022 16:45:53 +0000
Date: Thu, 23 Jun 2022 00:45:49 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:dhowells/linux-fs/rxrpc-multiqueue 5/9]
 net/rxrpc/af_rxrpc.c:948:2: warning: compat_setsockopt disappeared
Message-ID: <202206230014.cPat244L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/rxrpc-multiqueue
head:   83e1620a43190584ecbc51e8afc8b94a7b14286c
commit: 79ccb581e080d255dae79131e273d2db3cd5b51a [5/9] rxrpc: Allow the call to interact with to be preselected
config: hexagon-randconfig-r041-20220622 (https://download.01.org/0day-ci/archive/20220623/202206230014.cPat244L-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8b8d126598ce7bd5243da7f94f69fa1104288bee)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/79ccb581e080d255dae79131e273d2db3cd5b51a
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/rxrpc-multiqueue
        git checkout 79ccb581e080d255dae79131e273d2db3cd5b51a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/rxrpc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/rxrpc/af_rxrpc.c:948:2: warning: compat_setsockopt disappeared [-W#warnings]
   #warning compat_setsockopt disappeared
    ^
   1 warning generated.


vim +948 net/rxrpc/af_rxrpc.c

   848	
   849	/*
   850	 * set RxRPC socket options
   851	 */
   852	static int rxrpc_setsockopt(struct socket *sock, int level, int optname,
   853				    sockptr_t optval, unsigned int optlen)
   854	{
   855		struct rxrpc_sock *rx = rxrpc_sk(sock->sk);
   856		unsigned long long call_id;
   857		unsigned int min_sec_level;
   858		u16 service_upgrade[2];
   859		int ret, fd;
   860	
   861		_enter(",%d,%d,,%d", level, optname, optlen);
   862	
   863		lock_sock(&rx->sk);
   864		ret = -EOPNOTSUPP;
   865	
   866		if (level == SOL_RXRPC) {
   867			switch (optname) {
   868			case RXRPC_EXCLUSIVE_CONNECTION:
   869				ret = -EINVAL;
   870				if (optlen != 0)
   871					goto error;
   872				ret = -EISCONN;
   873				if (rx->sk.sk_state != RXRPC_UNBOUND)
   874					goto error;
   875				rx->exclusive = true;
   876				goto success;
   877	
   878			case RXRPC_SECURITY_KEY:
   879				ret = -EINVAL;
   880				if (rx->key)
   881					goto error;
   882				ret = -EISCONN;
   883				if (rx->sk.sk_state != RXRPC_UNBOUND)
   884					goto error;
   885				ret = rxrpc_request_key(rx, optval, optlen);
   886				goto error;
   887	
   888			case RXRPC_SECURITY_KEYRING:
   889				ret = -EINVAL;
   890				if (rx->key)
   891					goto error;
   892				ret = -EISCONN;
   893				if (rx->sk.sk_state != RXRPC_UNBOUND)
   894					goto error;
   895				ret = rxrpc_server_keyring(rx, optval, optlen);
   896				goto error;
   897	
   898			case RXRPC_MIN_SECURITY_LEVEL:
   899				ret = -EINVAL;
   900				if (optlen != sizeof(unsigned int))
   901					goto error;
   902				ret = -EISCONN;
   903				if (rx->sk.sk_state != RXRPC_UNBOUND)
   904					goto error;
   905				ret = copy_from_sockptr(&min_sec_level, optval,
   906					       sizeof(unsigned int));
   907				if (ret < 0)
   908					goto error;
   909				ret = -EINVAL;
   910				if (min_sec_level > RXRPC_SECURITY_MAX)
   911					goto error;
   912				rx->min_sec_level = min_sec_level;
   913				goto success;
   914	
   915			case RXRPC_UPGRADEABLE_SERVICE:
   916				ret = -EINVAL;
   917				if (optlen != sizeof(service_upgrade))
   918					goto error;
   919				ret = -EISCONN;
   920				if (rx->sk.sk_state != RXRPC_SERVER_BOUND)
   921					goto error;
   922				ret = -EFAULT;
   923				if (copy_from_sockptr(service_upgrade, optval,
   924						   sizeof(service_upgrade)) != 0)
   925					goto error;
   926				mutex_lock(&rx->local->services_lock);
   927				ret = rxrpc_bind_service_upgrade(rx, service_upgrade[0],
   928								 service_upgrade[1]);
   929				mutex_unlock(&rx->local->services_lock);
   930				if (ret < 0)
   931					goto error;
   932				goto success;
   933	
   934			case RXRPC_BIND_CHANNEL:
   935				ret = -EINVAL;
   936				if (optlen != sizeof(fd))
   937					goto error;
   938				ret = -EFAULT;
   939				if (copy_from_sockptr(&fd, optval, sizeof(fd)) != 0)
   940					goto error;
   941				ret = rxrpc_bind_channel(rx, fd);
   942				if (ret < 0)
   943					goto error;
   944				goto success;
   945	
   946			case RXRPC_SELECT_CALL_FOR_RECV:
   947			case RXRPC_SELECT_CALL_FOR_SEND:
 > 948	#warning compat_setsockopt disappeared
   949				ret = -EINVAL;
   950				if (optlen != sizeof(call_id))
   951					goto error;
   952				ret = -EFAULT;
   953				if (copy_from_sockptr(&call_id, optval,
   954						      sizeof(call_id)) != 0)
   955					goto error;
   956				ret = rxrpc_set_select_call(rx, call_id, optname);
   957				goto error;
   958	
   959			default:
   960				goto error;
   961			}
   962		} else {
   963			goto error;
   964		}
   965	
   966	success:
   967		ret = 0;
   968	error:
   969		release_sock(&rx->sk);
   970		return ret;
   971	}
   972	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
