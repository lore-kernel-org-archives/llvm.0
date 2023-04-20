Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8791E17C9;
	Thu, 20 Apr 2023 08:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681980275; x=1713516275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YjGQstfvvhcdHzIV9JHIeUC2gb3iKkrxZIq09mdWRmk=;
  b=VQuzxcavnKsRbSpErnqY5HSZyyaApQx/grYApFoes9qFhne9l00aA2lh
   dfqw5HGKC1RtxCtNOHgaITKRG4wFdr/yGYUAzHHm2zHDe2MXPszenzsOb
   MPKaktOqqDzQGUEw3nEme8Nv3g0rBT6OHnCYd4Ym5iC4tp1WWSdbXG5eB
   Mvfs2Da9r+Shxyd0LdwYRAQ1Ep3eprMaYWy3mLp3chR1oTFuDq6DsS0v1
   0QahVWxvQ426IeP18N4ocoKZQCBK0RZXhxH7ZG757OCpY3jfzO1qQaXyt
   KPRj0E+xGz8bRmhpFwsHb70dJC+N8kda90KLRSoFBy/bSlW9ibboDZE/b
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325282856"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="325282856"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 01:44:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="937977405"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="937977405"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Apr 2023 01:44:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppPu4-000fdY-1p;
	Thu, 20 Apr 2023 08:44:32 +0000
Date: Thu, 20 Apr 2023 16:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: peili.dev@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] Reduce vdpa initialization / startup overhead for
 ioctl()
Message-ID: <202304201654.2ewx6SeJ-lkp@intel.com>
References: <20230420052026.1883230-1-peili.dev@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420052026.1883230-1-peili.dev@gmail.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on mst-vhost/linux-next]
[also build test ERROR on linus/master v6.3-rc7 next-20230419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/peili-dev-gmail-com/Reduce-vdpa-initialization-startup-overhead-for-ioctl/20230420-132556
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20230420052026.1883230-1-peili.dev%40gmail.com
patch subject: [RFC PATCH] Reduce vdpa initialization / startup overhead for ioctl()
config: i386-randconfig-a012-20230417 (https://download.01.org/0day-ci/archive/20230420/202304201654.2ewx6SeJ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ab8e2356cbe7e460fb8d5e16d57db96737f000b7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review peili-dev-gmail-com/Reduce-vdpa-initialization-startup-overhead-for-ioctl/20230420-132556
        git checkout ab8e2356cbe7e460fb8d5e16d57db96737f000b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/vhost/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201654.2ewx6SeJ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/vhost/vdpa.c:558:6: error: indirection requires pointer operand ('unsigned int' invalid)
           r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:130:43: note: expanded from macro 'get_user'
   #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,ptr); })
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:101:21: note: expanded from macro 'do_get_user_call'
           register __inttype(*(ptr)) __val_gu asm("%"_ASM_DX);            \
                    ~~~~~~~~~~^~~~~~~
   arch/x86/include/asm/uaccess.h:72:13: note: expanded from macro '__inttype'
           __typefits(x,char,                      \
           ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:78:31: note: expanded from macro '__typefits'
           __builtin_choose_expr(sizeof(x)<=sizeof(type),(unsigned type)0,not)
                                        ^
>> drivers/vhost/vdpa.c:558:6: error: indirection requires pointer operand ('unsigned int' invalid)
           r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:130:43: note: expanded from macro 'get_user'
   #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,ptr); })
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:101:21: note: expanded from macro 'do_get_user_call'
           register __inttype(*(ptr)) __val_gu asm("%"_ASM_DX);            \
                    ~~~~~~~~~~^~~~~~~
   arch/x86/include/asm/uaccess.h:73:15: note: expanded from macro '__inttype'
             __typefits(x,short,                   \
             ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:78:31: note: expanded from macro '__typefits'
           __builtin_choose_expr(sizeof(x)<=sizeof(type),(unsigned type)0,not)
                                        ^
   arch/x86/include/asm/uaccess.h:78:65: note: expanded from macro '__typefits'
           __builtin_choose_expr(sizeof(x)<=sizeof(type),(unsigned type)0,not)
                                                                          ^~~
>> drivers/vhost/vdpa.c:558:6: error: indirection requires pointer operand ('unsigned int' invalid)
           r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:130:43: note: expanded from macro 'get_user'
   #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,ptr); })
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:101:21: note: expanded from macro 'do_get_user_call'
           register __inttype(*(ptr)) __val_gu asm("%"_ASM_DX);            \
                    ~~~~~~~~~~^~~~~~~
   arch/x86/include/asm/uaccess.h:74:17: note: expanded from macro '__inttype'
               __typefits(x,int,                   \
               ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:78:31: note: expanded from macro '__typefits'
           __builtin_choose_expr(sizeof(x)<=sizeof(type),(unsigned type)0,not)
                                        ^
   arch/x86/include/asm/uaccess.h:78:65: note: expanded from macro '__typefits'
           __builtin_choose_expr(sizeof(x)<=sizeof(type),(unsigned type)0,not)
                                                                          ^
   arch/x86/include/asm/uaccess.h:78:65: note: expanded from macro '__typefits'
           __builtin_choose_expr(sizeof(x)<=sizeof(type),(unsigned type)0,not)
                                                                          ^~~
>> drivers/vhost/vdpa.c:558:6: error: indirection requires pointer operand ('unsigned int' invalid)
           r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:130:43: note: expanded from macro 'get_user'
   #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,ptr); })
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:101:21: note: expanded from macro 'do_get_user_call'
           register __inttype(*(ptr)) __val_gu asm("%"_ASM_DX);            \
                    ~~~~~~~~~~^~~~~~~
   arch/x86/include/asm/uaccess.h:75:19: note: expanded from macro '__inttype'
                 __typefits(x,long,0ULL)))))
                 ~~~~~~~~~~~^~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   arch/x86/include/asm/uaccess.h:78:65: note: expanded from macro '__typefits'
           __builtin_choose_expr(sizeof(x)<=sizeof(type),(unsigned type)0,not)
                                                                          ^
   arch/x86/include/asm/uaccess.h:78:65: note: expanded from macro '__typefits'
   arch/x86/include/asm/uaccess.h:78:65: note: expanded from macro '__typefits'
           __builtin_choose_expr(sizeof(x)<=sizeof(type),(unsigned type)0,not)
                                                                          ^~~
>> drivers/vhost/vdpa.c:558:6: error: indirection requires pointer operand ('unsigned int' invalid)
           r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:130:43: note: expanded from macro 'get_user'
   #define get_user(x,ptr) ({ might_fault(); do_get_user_call(get_user,x,ptr); })
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/uaccess.h:108:28: note: expanded from macro 'do_get_user_call'
           (x) = (__force __typeof__(*(ptr))) __val_gu;                    \
                                     ^~~~~~
>> drivers/vhost/vdpa.c:565:34: warning: variable length array used [-Wvla]
           struct vhost_vring_state states[num + 1];
                                           ^~~~~~~
>> drivers/vhost/vdpa.c:565:27: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           struct vhost_vring_state states[num + 1];
                                    ^
   2 warnings and 5 errors generated.


vim +558 drivers/vhost/vdpa.c

   546	
   547	static long vhost_vdpa_vring_ioctl_batch(struct vhost_vdpa *v, unsigned int cmd,
   548					   void __user *argp)
   549	{
   550		struct vdpa_device *vdpa = v->vdpa;
   551		const struct vdpa_config_ops *ops = vdpa->config;
   552		struct vhost_virtqueue *vq;
   553		struct vhost_vring_state s;
   554	
   555		u32 idx, num, i;
   556		long r;
   557	
 > 558		r = get_user(num, ((struct vhost_vring_state __user *)argp)->num);
   559		if (r < 0) {
   560			return r;
   561		}
   562	
   563		num = array_index_nospec(num, v->nvqs);
   564	
 > 565		struct vhost_vring_state states[num + 1];
   566	
   567		if (copy_from_user(&states, argp, sizeof(states)))
   568			return -EFAULT;
   569	
   570		switch (cmd) {
   571		case VHOST_VDPA_SET_VRING_ENABLE_BATCH:
   572			for (i = 1; i <= num; i++) {
   573				i = array_index_nospec(i, num + 1);
   574				idx = states[i].index;
   575				if (idx >= v->nvqs)
   576					return -ENOBUFS;
   577	
   578				idx = array_index_nospec(idx, v->nvqs);
   579	
   580				ops->set_vq_ready(vdpa, idx, 1);
   581			}
   582			return 0;
   583		case VHOST_VDPA_GET_VRING_GROUP_BATCH:
   584			if (!ops->get_vq_group)
   585				return -EOPNOTSUPP;
   586			
   587			for (i = 1; i <= num; i++) {
   588				i = array_index_nospec(i, num + 1);
   589				idx = states[i].index;
   590				if (idx >= v->nvqs)
   591					return -ENOBUFS;
   592				idx = array_index_nospec(idx, v->nvqs);
   593				states[i].num = ops->get_vq_group(vdpa, idx);
   594				if (states[i].num >= vdpa->ngroups)
   595					return -EIO;
   596			}
   597	
   598			if (copy_to_user(argp, &states, sizeof(states)))
   599				return -EFAULT;
   600	
   601			return 0;
   602		default:
   603			r = ENOIOCTLCMD;
   604		}
   605	
   606		return r;
   607	}
   608	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
