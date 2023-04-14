Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92EF630;
	Fri, 14 Apr 2023 03:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681443195; x=1712979195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8+H3Yn8mCHIQZVndb2RJ/hjT1NxIw/Q1dkpG63g8Tf8=;
  b=TmQbypAXhk8vQ18V3GsGOY5+IVdyngRYPteq7XrGGDE+ZXE9ZK5Ccngb
   nsC0Y8GkPuG6XtyLVwl+mRzhAKuIr+LIShLytYWVBLnt4yLXmEusVw37v
   Jz3ER5s+XBYbQCIe+UC9bdRD2IXuGuj/ac1MgOVJXPXJiayjZNmpsQYLy
   MDApj89wyv35nTaHz5UQpToK0Ae53y3bHFM+rhpcLX5QSRz9/nXoLNzDj
   y6D/aSHeC1EV4AYdGW4qYXexxd2PPe559F8+3ltfp//7V2eQ2xBZCxAR5
   ftOcWNWAr+6Ch1KiGwzroYcbKx4PUbqxE3MEDo1Ds7XbGd+9yUsHJu0xh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="343134142"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="343134142"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 20:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="722308925"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="722308925"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Apr 2023 20:33:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnABU-000ZBj-2E;
	Fri, 14 Apr 2023 03:33:12 +0000
Date: Fri, 14 Apr 2023 11:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: Bobby Eshleman <bobby.eshleman@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next v2 3/4] vsock: Add lockless sendmsg() support
Message-ID: <202304141112.r8VWcDK5-lkp@intel.com>
References: <20230413-b4-vsock-dgram-v2-3-079cc7cee62e@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413-b4-vsock-dgram-v2-3-079cc7cee62e@bytedance.com>

Hi Bobby,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ed72bd5a6790a0c3747cb32b0427f921bd03bb71]

url:    https://github.com/intel-lab-lkp/linux/commits/Bobby-Eshleman/virtio-vsock-support-dgram/20230414-082831
base:   ed72bd5a6790a0c3747cb32b0427f921bd03bb71
patch link:    https://lore.kernel.org/r/20230413-b4-vsock-dgram-v2-3-079cc7cee62e%40bytedance.com
patch subject: [PATCH RFC net-next v2 3/4] vsock: Add lockless sendmsg() support
config: i386-randconfig-a003-20230410 (https://download.01.org/0day-ci/archive/20230414/202304141112.r8VWcDK5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/de4d5e13dd5c747996abbc4e9ce38eeb3093ea01
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bobby-Eshleman/virtio-vsock-support-dgram/20230414-082831
        git checkout de4d5e13dd5c747996abbc4e9ce38eeb3093ea01
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/vmw_vsock/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141112.r8VWcDK5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/vmw_vsock/af_vsock.c:247:5: warning: no previous prototype for function 'vsock_remote_addr_update' [-Wmissing-prototypes]
   int vsock_remote_addr_update(struct vsock_sock *vsk, struct sockaddr_vm *src)
       ^
   net/vmw_vsock/af_vsock.c:247:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int vsock_remote_addr_update(struct vsock_sock *vsk, struct sockaddr_vm *src)
   ^
   static 
   1 warning generated.
--
>> net/vmw_vsock/virtio_transport_common.c:1174:7: warning: variable 'skerr' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                   if (err)
                       ^~~
   net/vmw_vsock/virtio_transport_common.c:1194:15: note: uninitialized use occurs here
           sk->sk_err = skerr;
                        ^~~~~
   net/vmw_vsock/virtio_transport_common.c:1174:3: note: remove the 'if' if its condition is always false
                   if (err)
                   ^~~~~~~~
   net/vmw_vsock/virtio_transport_common.c:1166:11: note: initialize the variable 'skerr' to silence this warning
           int skerr;
                    ^
                     = 0
   1 warning generated.


vim +/vsock_remote_addr_update +247 net/vmw_vsock/af_vsock.c

   245	
   246	/* The socket lock must be held by the caller */
 > 247	int vsock_remote_addr_update(struct vsock_sock *vsk, struct sockaddr_vm *src)
   248	{
   249		struct sockaddr_vm_rcu *old, *new;
   250	
   251		new = kmalloc(sizeof(*new), GFP_KERNEL);
   252		if (!new)
   253			return -ENOMEM;
   254	
   255		memcpy(&new->addr, src, sizeof(new->addr));
   256		old = rcu_replace_pointer(vsk->remote_addr, new, lockdep_sock_is_held(sk_vsock(vsk)));
   257		kfree_rcu(old, rcu);
   258	
   259		return 0;
   260	}
   261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
