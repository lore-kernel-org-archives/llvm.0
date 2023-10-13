Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0B8A2A;
	Fri, 13 Oct 2023 00:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxmjWTvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697155468; x=1728691468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5JnUabcwpa5mD5fEcqQ1R8HJiM7dwqRqvBIQimbOgqk=;
  b=TxmjWTvd73WRfDoMhGTXFMHOVx4qcSIPJRsUtCUdGncwiTpn2czqJc8U
   paly9hlsGGnp0SPbCasbImI45mY8zHWWtxwJAVPwN5qXwXfmkaUhAEnO/
   4UpbnxTJIUB8n2H24EtxBEgPuiND8cPkJH68mjF8J7b5hK3972rCdBVWA
   knQHjYKAEJT4MIu9MrlAs+J92a/mEuZgbrpEpjLCzu8NS2FD8yjUTcs9v
   SLDkpP/l9VlBm1LwOlt6hDVwjAV5Y4O6TIwqL6HYiAYPHnmqmvL5mSlPX
   f6Arlxa45hzF42ypsyHkVLF8IOc0zwI0VlTmbBfBOBS2PZd8BUIreBf9u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387922527"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="387922527"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 17:04:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001713783"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="1001713783"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 17:04:17 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr5f4-00045v-1u;
	Fri, 13 Oct 2023 00:04:14 +0000
Date: Fri, 13 Oct 2023 08:03:47 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [legion:sysctl-next 1/5] fs/proc/proc_sysctl.c:599:29: error:
 incompatible pointer types passing 'struct file *' to parameter of type
 'struct file *'
Message-ID: <202310130818.DMKmTq1E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git sysctl-next
head:   5db649a3f876dee97af2da8462e4314424a04675
commit: b3d9978143d4fa8d26fb6efee0a4e615ad987715 [1/5] sysctl: API extension for handling sysctl
config: um-randconfig-r001-20230831 (https://download.01.org/0day-ci/archive/20231013/202310130818.DMKmTq1E-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130818.DMKmTq1E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130818.DMKmTq1E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/proc/proc_sysctl.c:6:
   include/linux/sysctl.h:148:38: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
           int (*open) (struct inode *, struct file *);
                                               ^
   include/linux/sysctl.h:149:41: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
           int (*release) (struct inode *, struct file *);
                                                  ^
   include/linux/sysctl.h:150:26: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
           ssize_t (*read) (struct file *, char *, size_t *, loff_t *);
                                   ^
   include/linux/sysctl.h:151:27: warning: declaration of 'struct file' will not be visible outside of this function [-Wvisibility]
           ssize_t (*write) (struct file *, char *, size_t *, loff_t *);
                                    ^
   In file included from fs/proc/proc_sysctl.c:17:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:31:
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
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/proc/proc_sysctl.c:17:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:31:
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
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/proc/proc_sysctl.c:17:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:31:
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
>> fs/proc/proc_sysctl.c:599:29: error: incompatible pointer types passing 'struct file *' to parameter of type 'struct file *' [-Werror,-Wincompatible-pointer-types]
                   error = table->fops.write(iocb->ki_filp, kbuf, &count, &iocb->ki_pos);
                                             ^~~~~~~~~~~~~
   fs/proc/proc_sysctl.c:601:28: error: incompatible pointer types passing 'struct file *' to parameter of type 'struct file *' [-Werror,-Wincompatible-pointer-types]
                   error = table->fops.read(iocb->ki_filp, kbuf, &count, &iocb->ki_pos);
                                            ^~~~~~~~~~~~~
   fs/proc/proc_sysctl.c:656:33: error: incompatible pointer types passing 'struct file *' to parameter of type 'struct file *' [-Werror,-Wincompatible-pointer-types]
                   ret = table->fops.open(inode, filp);
                                                 ^~~~
   fs/proc/proc_sysctl.c:677:36: error: incompatible pointer types passing 'struct file *' to parameter of type 'struct file *' [-Werror,-Wincompatible-pointer-types]
                   ret = table->fops.release(inode, filp);
                                                    ^~~~
   16 warnings and 4 errors generated.


vim +599 fs/proc/proc_sysctl.c

   550	
   551	static ssize_t proc_sys_call_handler(struct kiocb *iocb, struct iov_iter *iter,
   552			int write)
   553	{
   554		struct inode *inode = file_inode(iocb->ki_filp);
   555		struct ctl_table_header *head = grab_header(inode);
   556		struct ctl_table *table = PROC_I(inode)->sysctl_entry;
   557		size_t count = iov_iter_count(iter);
   558		char *kbuf;
   559		ssize_t error;
   560	
   561		if (IS_ERR(head))
   562			return PTR_ERR(head);
   563	
   564		/*
   565		 * At this point we know that the sysctl was not unregistered
   566		 * and won't be until we finish.
   567		 */
   568		error = -EPERM;
   569		if (sysctl_perm(head, table, write ? MAY_WRITE : MAY_READ))
   570			goto out;
   571	
   572		/* if that can happen at all, it should be -EINVAL, not -EISDIR */
   573		error = -EINVAL;
   574		if (!table->proc_handler && !table->fops.read && !table->fops.write)
   575			goto out;
   576	
   577		/* don't even try if the size is too large */
   578		error = -ENOMEM;
   579		if (count >= KMALLOC_MAX_SIZE)
   580			goto out;
   581		kbuf = kvzalloc(count + 1, GFP_KERNEL);
   582		if (!kbuf)
   583			goto out;
   584	
   585		if (write) {
   586			error = -EFAULT;
   587			if (!copy_from_iter_full(kbuf, count, iter))
   588				goto out_free_buf;
   589			kbuf[count] = '\0';
   590		}
   591	
   592		error = BPF_CGROUP_RUN_PROG_SYSCTL(head, table, write, iocb->ki_filp,
   593						   &kbuf, &count, &iocb->ki_pos);
   594		if (error)
   595			goto out_free_buf;
   596	
   597		/* careful: calling conventions are nasty here */
   598		if (write && table->fops.write)
 > 599			error = table->fops.write(iocb->ki_filp, kbuf, &count, &iocb->ki_pos);
   600		else if (!write && table->fops.read)
   601			error = table->fops.read(iocb->ki_filp, kbuf, &count, &iocb->ki_pos);
   602		else if (table->proc_handler)
   603			error = table->proc_handler(table, write, kbuf, &count, &iocb->ki_pos);
   604		else
   605			error = -EINVAL;
   606	
   607		if (error)
   608			goto out_free_buf;
   609	
   610		if (!write) {
   611			error = -EFAULT;
   612			if (copy_to_iter(kbuf, count, iter) < count)
   613				goto out_free_buf;
   614		}
   615	
   616		error = count;
   617	out_free_buf:
   618		kvfree(kbuf);
   619	out:
   620		sysctl_head_finish(head);
   621	
   622		return error;
   623	}
   624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
