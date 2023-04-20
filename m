Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31808F44;
	Thu, 20 Apr 2023 17:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682013220; x=1713549220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gPUGsnCZZVrxTMLQ75P+O1/5TxBkW+4KY/+mePstM3s=;
  b=brZcvN5LoXku3jM2QgWGsvEFokAhLxSWD/aSMKCmkr2n/AKp1+EQzY3E
   ELv4qvPn0cqs/ycu8ANl38c4kGcf/yJQPJuf9t7VrFqi/bw0hhZhmV160
   Pul/LRG4LDU4Jn834rL8TiG7w4ThKfcVpgSz+0RLiVVysjw9RwvCTj5kt
   C9T6ODPqqGZaOyDYxVdhejEw8zUUPxe115q4UgBIpZqmrRgdnMz9fSow0
   hJLleFZUq9Sk3xsu/6Pf0geTs8HVwduXn+u2uLDtHzqFiiIjxvxEB9S3L
   Baj9L0cVOjKrqEJN+YpDedejNVvfu+1DlvcLi2Fx1qmrxHHD8dFpq7nv8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="348594481"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="348594481"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 10:38:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="692011281"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="692011281"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Apr 2023 10:38:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppYF6-000fz6-0p;
	Thu, 20 Apr 2023 17:38:48 +0000
Date: Fri, 21 Apr 2023 01:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_multi 1/21] kernel/trace/bpf_trace.c:3066:12:
 warning: variable 'old_inode' is uninitialized when used here
Message-ID: <202304210113.O7szsjHN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi
head:   f06f72609beded6df569274ef7a92843471904ed
commit: bce755e1c480a41c8528425d659c6b23ba839d67 [1/21] bpf: Add multi uprobe link
config: s390-randconfig-r036-20230416 (https://download.01.org/0day-ci/archive/20230421/202304210113.O7szsjHN-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=bce755e1c480a41c8528425d659c6b23ba839d67
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi
        git checkout bce755e1c480a41c8528425d659c6b23ba839d67
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304210113.O7szsjHN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/trace/bpf_trace.c:9:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from kernel/trace/bpf_trace.c:9:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from kernel/trace/bpf_trace.c:9:
   In file included from include/linux/bpf_verifier.h:9:
   In file included from include/linux/filter.h:12:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> kernel/trace/bpf_trace.c:3066:12: warning: variable 'old_inode' is uninitialized when used here [-Wuninitialized]
                           inode = old_inode;
                                   ^~~~~~~~~
   kernel/trace/bpf_trace.c:3016:33: note: initialize the variable 'old_inode' to silence this warning
           struct inode *inode, *old_inode;
                                          ^
                                           = NULL
   13 warnings generated.


vim +/old_inode +3066 kernel/trace/bpf_trace.c

  3007	
  3008	int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
  3009	{
  3010		void __user **upaths, __user *upath, __user *old_upath = NULL;
  3011		unsigned long __user *uoffsets, offset;
  3012		unsigned long __user *uref_ctr_offsets, ref_ctr_offset = 0;
  3013		struct bpf_uprobe_multi_link *link = NULL;
  3014		struct bpf_link_primer link_primer;
  3015		struct bpf_uprobe *uprobes = NULL;
  3016		struct inode *inode, *old_inode;
  3017		u32 flags, cnt, i;
  3018		int err;
  3019	
  3020		/* no support for 32bit archs yet */
  3021		if (sizeof(u64) != sizeof(void *))
  3022			return -EOPNOTSUPP;
  3023	
  3024		if (prog->expected_attach_type != BPF_TRACE_UPROBE_MULTI)
  3025			return -EINVAL;
  3026	
  3027		flags = attr->link_create.uprobe_multi.flags;
  3028		if (flags & ~BPF_F_UPROBE_MULTI_RETURN)
  3029			return -EINVAL;
  3030	
  3031		upaths = u64_to_user_ptr(attr->link_create.uprobe_multi.paths);
  3032		uoffsets = u64_to_user_ptr(attr->link_create.uprobe_multi.offsets);
  3033		if (!!upaths != !!uoffsets)
  3034			return -EINVAL;
  3035	
  3036		uref_ctr_offsets = u64_to_user_ptr(attr->link_create.uprobe_multi.ref_ctr_offsets);
  3037	
  3038		cnt = attr->link_create.uprobe_multi.cnt;
  3039		if (!cnt)
  3040			return -EINVAL;
  3041	
  3042		uprobes = kvcalloc(cnt, sizeof(*uprobes), GFP_KERNEL);
  3043		if (!uprobes)
  3044			return -ENOMEM;
  3045	
  3046		link = kzalloc(sizeof(*link), GFP_KERNEL);
  3047		if (!link) {
  3048			err = -ENOMEM;
  3049			goto error;
  3050		}
  3051	
  3052		for (i = 0; i < cnt; i++) {
  3053			if (uref_ctr_offsets && __get_user(ref_ctr_offset, uref_ctr_offsets + i)) {
  3054				err = -EFAULT;
  3055				goto error;
  3056			}
  3057			if (__get_user(offset, uoffsets + i)) {
  3058				err = -EFAULT;
  3059				goto error;
  3060			}
  3061			if (__get_user(upath, upaths + i)) {
  3062				err = -EFAULT;
  3063				goto error;
  3064			}
  3065			if (i && old_upath == upath) {
> 3066				inode = old_inode;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
