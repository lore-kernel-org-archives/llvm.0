Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD15A63B4;
	Fri, 10 Nov 2023 04:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6yZ9eFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699590888; x=1731126888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6rPjgNdLm9P1GsH5aFoRapsyWJVU0NC9QYCgapwVwvw=;
  b=F6yZ9eFoO4AXEIq3E94c/NyqIJYHRfwRcu2ORtCriiYENnzDICEbcSOA
   Vyed8eJNEEIpOPzOcs3QFv52stDB/6c0IKjE7QOtVsProbfi3nc30o+V4
   hKw+FBrvb/ruFopQhGW/mVtYoPZ/pjDKW/uFBSICfSsn+v3nOa7XINLML
   dVr/MmjhQcwih7Le0Kpzn04bcALkNdxbasl2DC6cKuUIpfk7q12Pt7V1t
   /RlL5FzzzVV6WW/G8DL27kgp29XJNBcoM3u209U1bHnB5p8k17MhRa6bT
   G/E5T1AAosTA9jGcvlKHRJmrVQkuhTU6zE/dXdvXComA0recUBQSej2Wj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="454430535"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="454430535"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 20:34:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="11759952"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Nov 2023 20:34:44 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1JE9-0009QI-2X;
	Fri, 10 Nov 2023 04:34:41 +0000
Date: Fri, 10 Nov 2023 12:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: WoZ1zh1 <wozizhi@huawei.com>, viro@zeniv.linux.org.uk,
	brauner@kernel.org, akpm@linux-foundation.org, oleg@redhat.com,
	jlayton@kernel.org, dchinner@redhat.com, cyphar@cyphar.com,
	shr@devkernel.io
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	wozizhi@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH -next V2] proc: support file->f_pos checking in mem_lseek
Message-ID: <202311101239.ihy4cKpf-lkp@intel.com>
References: <20231109102658.2075547-1-wozizhi@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109102658.2075547-1-wozizhi@huawei.com>

Hi WoZ1zh1,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231108]

url:    https://github.com/intel-lab-lkp/linux/commits/WoZ1zh1/proc-support-file-f_pos-checking-in-mem_lseek/20231109-103353
base:   next-20231108
patch link:    https://lore.kernel.org/r/20231109102658.2075547-1-wozizhi%40huawei.com
patch subject: [PATCH -next V2] proc: support file->f_pos checking in mem_lseek
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231110/202311101239.ihy4cKpf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311101239.ihy4cKpf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311101239.ihy4cKpf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/proc/base.c:68:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/proc/base.c:68:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/proc/base.c:68:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> fs/proc/base.c:912:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     912 |         case SEEK_SET:
         |         ^
   fs/proc/base.c:912:2: note: insert '__attribute__((fallthrough));' to silence this warning
     912 |         case SEEK_SET:
         |         ^
         |         __attribute__((fallthrough)); 
   fs/proc/base.c:912:2: note: insert 'break;' to avoid fall-through
     912 |         case SEEK_SET:
         |         ^
         |         break; 
   13 warnings generated.


vim +912 fs/proc/base.c

   903	
   904	loff_t mem_lseek(struct file *file, loff_t offset, int orig)
   905	{
   906		loff_t ret = 0;
   907	
   908		spin_lock(&file->f_lock);
   909		switch (orig) {
   910		case SEEK_CUR:
   911			offset += file->f_pos;
 > 912		case SEEK_SET:
   913			/* to avoid userland mistaking f_pos=-9 as -EBADF=-9 */
   914			if ((unsigned long long)offset >= -MAX_ERRNO)
   915				ret = -EOVERFLOW;
   916			break;
   917		default:
   918			ret = -EINVAL;
   919		}
   920		if (!ret) {
   921			if (offset < 0 && !(unsigned_offsets(file))) {
   922				ret = -EINVAL;
   923			} else {
   924				file->f_pos = offset;
   925				ret = file->f_pos;
   926				force_successful_syscall_return();
   927			}
   928		}
   929	
   930		spin_unlock(&file->f_lock);
   931		return ret;
   932	}
   933	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
