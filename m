Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CE822FE11;
	Fri, 29 Aug 2025 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756456951; cv=none; b=txqMMLzDLhV0hb+4oeOVrXR42OE3RpTv2rjg0e+TZPtkKmsplgqybTTQzhdsV+ZP67mvmehsLQAhHHXSaZ/aESoEGiTFTC3g9Xy47h99KuD3agtjOqCuXqREqvIa8g4jEYVbOjwP09tMbFgrFGeJVVxnDU3FQBH8jbkky/aCeqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756456951; c=relaxed/simple;
	bh=e17cHEoQlalRX4R0Uk0gLsBJen9uXTcEUc0TFE+UICs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mtyDDsXUTnaAte6ncjUqXj6rtz4FqoNxPnusnoEGnIm+xgVkZvPixjcW2vaF4vwNamd4KE34LV/2KzQhHcuiiibgkoAt0pEB31zKJ80FoEMf1yNRIBnLukmQ6zJ5QAZE/jgBZljWZD+Cy0n/6URsmkiHSwTO0oQvUlFulCYFxxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/NXzlmX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/NXzlmX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756456948; x=1787992948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e17cHEoQlalRX4R0Uk0gLsBJen9uXTcEUc0TFE+UICs=;
  b=k/NXzlmXsp9dEgDkkHul+BrNbrBp78t2qkfqdcwP8IOTZJSVc73irr3M
   fTrQN+Fta00IgcZtJV4vnfBFUTkFlzbbN/Qdfyr53U3q5XrPIdvNDhnkD
   5UDkPv5zuBFb7AES1t1qddw8tCYLACRj0DH9DJZqjcE9sQh7j88jz1Bzf
   NAmp+fgzO6w2NAHrkiETETEdsQKeyoJQk/d/3kG/VBbUzNH34v35IydMi
   561+a6uUt/JKCeSnm4QqoFnFgfnIXa/l7ocP6ALFHKPHSjseLLTKWdBte
   4wvAExfHwRsz6jGw5tJ7axKj4aDYGe5zSyZ6QFnZAJZ3XXBYd47U9sov7
   w==;
X-CSE-ConnectionGUID: Vp6EdyS8RWuitMrWXGyxAw==
X-CSE-MsgGUID: ncsZdGv3RS6Az8uTJVxE0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58670583"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="58670583"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 01:42:28 -0700
X-CSE-ConnectionGUID: liSDTgg3QjuDiJ9nIn9KTg==
X-CSE-MsgGUID: xCi7Pfu8TtupKEq+Ekau2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="174707767"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 29 Aug 2025 01:42:26 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urugh-000UZT-0N;
	Fri, 29 Aug 2025 08:42:23 +0000
Date: Fri, 29 Aug 2025 16:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Metzmacher <metze@samba.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	Steve French <stfrench@microsoft.com>
Subject: [cifs:for-next-next 100/146] fs/smb/server/transport_rdma.c:2158:12:
 warning: stack frame size (1112) exceeds limit (1024) in
 'smb_direct_listen_handler'
Message-ID: <202508291615.Mxyg9D9N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next-next
head:   b79712ce1752aa38da9553b06767f68367b0d7ff
commit: 8ef4d3c2f8db37ea5df6bd5483decfffc5174a19 [100/146] smb: server: make use of smbdirect_socket_init()
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250829/202508291615.Mxyg9D9N-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250829/202508291615.Mxyg9D9N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508291615.Mxyg9D9N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/server/transport_rdma.c:2158:12: warning: stack frame size (1112) exceeds limit (1024) in 'smb_direct_listen_handler' [-Wframe-larger-than]
    2158 | static int smb_direct_listen_handler(struct rdma_cm_id *cm_id,
         |            ^
   1 warning generated.


vim +/smb_direct_listen_handler +2158 fs/smb/server/transport_rdma.c

0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2157  
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16 @2158  static int smb_direct_listen_handler(struct rdma_cm_id *cm_id,
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2159  				     struct rdma_cm_event *event)
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2160  {
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2161  	switch (event->event) {
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2162  	case RDMA_CM_EVENT_CONNECT_REQUEST: {
8170223a650e74 fs/smb/server/transport_rdma.c Stefan Metzmacher 2025-08-20  2163  		int ret = smb_direct_handle_connect_request(cm_id, event);
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2164  
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2165  		if (ret) {
bde1694aecdb53 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-06-28  2166  			pr_err("Can't create transport: %d\n", ret);
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2167  			return ret;
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2168  		}
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2169  
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2170  		ksmbd_debug(RDMA, "Received connection request. cm_id=%p\n",
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2171  			    cm_id);
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2172  		break;
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2173  	}
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2174  	default:
bde1694aecdb53 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-06-28  2175  		pr_err("Unexpected listen event. cm_id=%p, event=%s (%d)\n",
070fb21e5912b6 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-05-26  2176  		       cm_id, rdma_event_msg(event->event), event->event);
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2177  		break;
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2178  	}
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2179  	return 0;
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2180  }
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon       2021-03-16  2181  

:::::: The code at line 2158 was first introduced by commit
:::::: 0626e6641f6b467447c81dd7678a69c66f7746cf cifsd: add server handler for central processing and tranport layers

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
