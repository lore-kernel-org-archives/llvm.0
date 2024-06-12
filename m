Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB812C1BA;
	Wed, 12 Jun 2024 05:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718168793; cv=none; b=UH4u5RBFdRRMo9APN74r34qBLXXh01OAxynTwxNfyiswNSDjF8Oe9SB3QglssZSA/NSZxV3HXQXsvSqcPH2I8Pse+9VgVj33c3mq/7+5aj01y2PzD69sQM89LffbkysNkML7LzWtJpkTeNzqYHr/v8V/1cvGaxVztWwrosIVgQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718168793; c=relaxed/simple;
	bh=38zqwIIKdmGlSNidCDHFhd5BF9l2X+wYajy8grFrcKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fe4RaZOGx8mGPzFmtQhzJbDzDysyaaI6muNqsDOg0JtgTUugDescoZiCnxha+AszOD2nwqk9JRSs2QHdWGE/SLQ1gqJFfF1ozcu1p5gaYr6+WUewvbKvRV4/sIya9qCVMdZChvfXnaaFM5NQjxrmQPQWeRVoyBzTWaedwtYduyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQUPI5Bf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQUPI5Bf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718168792; x=1749704792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=38zqwIIKdmGlSNidCDHFhd5BF9l2X+wYajy8grFrcKc=;
  b=cQUPI5BfcTHObnNiILwtdruMCgsy4ZHWat9KxjTxUF3+fvgOXJVkoVhY
   hh7rdzBDyJTOPwZxIpcfzwvDhPSp/e4US+dLLNOcHqdiw3UU7Gi++JL2l
   JM4Seqlbo40fuXyqApUZnznhHFhE59xUX1sUdJ037TkfEq/Sn2LgIPfin
   H1VH/PTPC3iwf3DcS1S6Qf5djutJso8eOl/pa9EVgLCU2yGpjKJqR8sY5
   30m2mFka4nZ83xDLVwTf+/nHD7gjnOTOttWGqGHv05l482T04o04OsrUn
   sWKar3T1b1AEMsnTr2hZQi6cHM7PERQ2KRDtgVsaJLJI8MnYmxus8OByd
   A==;
X-CSE-ConnectionGUID: j7SpAznHSGeueNHCKVkNMA==
X-CSE-MsgGUID: rnikpx7eRci5Bhxd1XJ22w==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37437531"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="37437531"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 22:06:29 -0700
X-CSE-ConnectionGUID: lzjtve59TOmxqVYOe9hIpA==
X-CSE-MsgGUID: WzLz+wGmQdq/13dviRm/Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="44607818"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jun 2024 22:06:28 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHGBl-0001Dm-1n;
	Wed, 12 Jun 2024 05:06:25 +0000
Date: Wed, 12 Jun 2024 13:06:14 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:clocks 22/22] drivers/ptp/ptp_vmclock.c:229:36: error:
 incomplete definition of type 'struct acpi_device'
Message-ID: <202406121205.YbUYFB71-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux clocks
head:   271bd03d9ae077ef80973de134409b507e76193e
commit: 271bd03d9ae077ef80973de134409b507e76193e [22/22] ptp: Add vDSO-style vmclock support
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240612/202406121205.YbUYFB71-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121205.YbUYFB71-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121205.YbUYFB71-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/ptp/ptp_vmclock.c:20:
   In file included from include/linux/ptp_clock_kernel.h:15:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/ptp/ptp_vmclock.c:20:
   In file included from include/linux/ptp_clock_kernel.h:15:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/ptp/ptp_vmclock.c:20:
   In file included from include/linux/ptp_clock_kernel.h:15:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/ptp/ptp_vmclock.c:41:30: warning: variable 'sec' set but not used [-Wunused-but-set-variable]
      41 |         uint64_t cycle, delta, seq, sec, delta_s32;
         |                                     ^
>> drivers/ptp/ptp_vmclock.c:79:4: warning: variable 'sec' is uninitialized when used here [-Wuninitialized]
      79 |                         sec += delta_hi * period_hi;
         |                         ^~~
   drivers/ptp/ptp_vmclock.c:41:33: note: initialize the variable 'sec' to silence this warning
      41 |         uint64_t cycle, delta, seq, sec, delta_s32;
         |                                        ^
         |                                         = 0
>> drivers/ptp/ptp_vmclock.c:229:36: error: incomplete definition of type 'struct acpi_device'
     229 |         status = acpi_evaluate_object(adev->handle, "ADDR", NULL, &parsed);
         |                                       ~~~~^
   include/linux/acpi.h:794:8: note: forward declaration of 'struct acpi_device'
     794 | struct acpi_device;
         |        ^
   14 warnings and 1 error generated.


vim +229 drivers/ptp/ptp_vmclock.c

    36	
    37	static int vmclock_get_crosststamp(struct vmclock_state *st,
    38					   struct system_counterval_t *system_counter,
    39					   struct timespec64 *tspec)
    40	{
  > 41		uint64_t cycle, delta, seq, sec, delta_s32;
    42		int ret = 0;
    43	
    44		preempt_disable_notrace();
    45	
    46		do {
    47			uint64_t delta_lo, delta_hi, period_lo, period_hi, frac_sec_lo, frac_sec_hi;
    48	
    49			seq = st->clk->seq_count & ~1ULL;
    50			virt_rmb();
    51	
    52			if (st->clk->clock_status == VMCLOCK_STATUS_UNRELIABLE) {
    53				ret = -EINVAL;
    54				virt_rmb();
    55				continue;
    56			}
    57	
    58			cycle = get_cycles();
    59	
    60			tspec->tv_sec = st->clk->utc_time_sec;
    61			frac_sec_lo = st->clk->utc_time_frac_sec & 0xffffffff;
    62			frac_sec_hi = st->clk->utc_time_frac_sec >> 32;
    63	
    64			delta = cycle - st->clk->counter_value;
    65			delta_lo = delta & 0xffffffff;
    66			delta_hi = delta >> 32;
    67			period_lo = st->clk->counter_period_frac_sec & 0xffffffff;
    68			period_hi = st->clk->counter_period_frac_sec >> 32;
    69	
    70			/* Delta in units of (second >> 32) */
    71			delta_s32 = delta_lo * period_hi;
    72			tspec->tv_sec += delta_s32 >> 32;
    73			delta_s32 &= 0xffffffff;
    74	
    75			if (delta_hi) {
    76				uint64_t delta_s32b;
    77	
    78				/* Top 32 bits of delta * low 32 bits of period_frac_sec: seconds */
  > 79				sec += delta_hi * period_hi;
    80	
    81				/* Top 32 bits of delta * top 32 bits of period_frac_sec: seconds >> 32 */
    82				delta_s32b = delta_hi * period_lo;
    83				sec += delta_s32b >> 32;
    84				delta_s32 += delta_s32b & 0xffffffff;
    85			}
    86	
    87			delta_s32 += ((period_lo * delta_lo) + frac_sec_lo) >> 32;
    88			delta_s32 += frac_sec_hi;
    89	
    90			tspec->tv_sec += delta_s32 >> 32;
    91			tspec->tv_nsec = (delta_s32 * NSEC_PER_SEC) >> 32;
    92	
    93			ret = 0;
    94	
    95			virt_rmb();
    96		} while (seq != st->clk->seq_count);
    97	
    98		preempt_enable_notrace();
    99	
   100		if (ret)
   101			return ret;
   102	
   103		if (system_counter) {
   104			system_counter->cycles = cycle;
   105			system_counter->cs_id = st->cs_id;
   106		}
   107	
   108		return 0;
   109	}
   110	
   111	static int ptp_vmclock_get_time_fn(ktime_t *device_time,
   112					   struct system_counterval_t *system_counter,
   113					   void *ctx)
   114	{
   115		struct vmclock_state *st = ctx;
   116		struct timespec64 tspec;
   117		int ret;
   118	
   119		ret = vmclock_get_crosststamp(st, system_counter, &tspec);
   120		if (!ret)
   121			*device_time = timespec64_to_ktime(tspec);
   122	
   123		return ret;
   124	}
   125	
   126	
   127	static int ptp_vmclock_getcrosststamp(struct ptp_clock_info *ptp,
   128					      struct system_device_crosststamp *xtstamp)
   129	{
   130		struct vmclock_state *st = container_of(ptp, struct vmclock_state,
   131							ptp_clock_info);
   132	
   133		return get_device_system_crosststamp(ptp_vmclock_get_time_fn, st,
   134						     NULL, xtstamp);
   135	}
   136	
   137	/*
   138	 * PTP clock operations
   139	 */
   140	
   141	static int ptp_vmclock_adjfine(struct ptp_clock_info *ptp, long delta)
   142	{
   143		return -EOPNOTSUPP;
   144	}
   145	
   146	static int ptp_vmclock_adjtime(struct ptp_clock_info *ptp, s64 delta)
   147	{
   148		return -EOPNOTSUPP;
   149	}
   150	
   151	static int ptp_vmclock_settime(struct ptp_clock_info *ptp,
   152				   const struct timespec64 *ts)
   153	{
   154		return -EOPNOTSUPP;
   155	}
   156	
   157	static int ptp_vmclock_gettime(struct ptp_clock_info *ptp, struct timespec64 *ts)
   158	{
   159		struct vmclock_state *st = container_of(ptp, struct vmclock_state,
   160							ptp_clock_info);
   161	
   162		return vmclock_get_crosststamp(st, NULL, ts);
   163	}
   164	
   165	static int ptp_vmclock_enable(struct ptp_clock_info *ptp,
   166				  struct ptp_clock_request *rq, int on)
   167	{
   168		return -EOPNOTSUPP;
   169	}
   170	
   171	static const struct ptp_clock_info ptp_vmclock_info = {
   172		.owner		= THIS_MODULE,
   173		.max_adj	= 0,
   174		.n_ext_ts	= 0,
   175		.n_pins		= 0,
   176		.pps		= 0,
   177		.adjfine	= ptp_vmclock_adjfine,
   178		.adjtime	= ptp_vmclock_adjtime,
   179		.gettime64	= ptp_vmclock_gettime,
   180		.settime64	= ptp_vmclock_settime,
   181		.enable		= ptp_vmclock_enable,
   182		.getcrosststamp = ptp_vmclock_getcrosststamp,
   183	};
   184	
   185	static int vmclock_miscdev_mmap(struct file *fp, struct vm_area_struct *vma)
   186	{
   187		struct vmclock_state *st = container_of(fp->private_data,
   188							struct vmclock_state, miscdev);
   189	
   190		if ((vma->vm_flags & (VM_READ|VM_WRITE)) != VM_READ)
   191			return -EROFS;
   192	
   193		if (vma->vm_start - vma->vm_end != PAGE_SIZE || vma->vm_pgoff)
   194			return -EINVAL;
   195	
   196	        if (io_remap_pfn_range(vma, vma->vm_start,
   197				       st->phys_addr >> PAGE_SHIFT, PAGE_SIZE,
   198	                               vma->vm_page_prot))
   199	                return -EAGAIN;
   200	
   201	        return 0;
   202	}
   203	
   204	static const struct file_operations vmclock_miscdev_fops = {
   205	        .mmap = vmclock_miscdev_mmap,
   206	};
   207	
   208	/* module operations */
   209	
   210	static void vmclock_remove(struct platform_device *pdev)
   211	{
   212		struct device *dev = &pdev->dev;
   213		struct vmclock_state *st = dev_get_drvdata(dev);
   214	
   215		if (st->ptp_clock)
   216			ptp_clock_unregister(st->ptp_clock);
   217	
   218		if (st->miscdev.minor == MISC_DYNAMIC_MINOR)
   219			misc_deregister(&st->miscdev);
   220	}
   221	
   222	static int vmclock_probe_acpi(struct device *dev, struct vmclock_state *st)
   223	{
   224		struct acpi_buffer parsed = { ACPI_ALLOCATE_BUFFER };
   225		struct acpi_device *adev = ACPI_COMPANION(dev);
   226		union acpi_object *obj;
   227		acpi_status status;
   228	
 > 229		status = acpi_evaluate_object(adev->handle, "ADDR", NULL, &parsed);
   230		if (ACPI_FAILURE(status)) {
   231			ACPI_EXCEPTION((AE_INFO, status, "Evaluating ADDR"));
   232			return -ENODEV;
   233		}
   234		obj = parsed.pointer;
   235		if (!obj || obj->type != ACPI_TYPE_PACKAGE || obj->package.count != 2 ||
   236		    obj->package.elements[0].type != ACPI_TYPE_INTEGER ||
   237		    obj->package.elements[1].type != ACPI_TYPE_INTEGER)
   238			return -EINVAL;
   239	
   240		st->phys_addr = (obj->package.elements[0].integer.value << 0) |
   241			(obj->package.elements[1].integer.value << 32);
   242	
   243		return 0;
   244	}
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
