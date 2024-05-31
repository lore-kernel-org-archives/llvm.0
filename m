Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E811135A4A;
	Fri, 31 May 2024 09:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717148577; cv=none; b=dsR9LyzMBBMonmm7Q95cNl0F0YI/73w02TSdN0G20Olmts2QtGcNMOyZsbusvnr5BwGp+ZF/4OVdzei867LDoiLC2C5nxBWoQkSqwk6jPfExY6rE/cU2r0g/WfPzOirB3a8/LE9vDmuofXWuPF52bEs83eblNXuV9q/blEwAsNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717148577; c=relaxed/simple;
	bh=l+TBXAtspYeLckh5M5Sh8QU3eQ8gkHI8RcI2dDxy/tc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bFf89wVxAaJOfPU68f5Gk06XL10/D8SWckzEMuKv4XRS/Na9zLLc1wNoX9sqFDX1JvOnQtvT/7HFk4SPv2603zU/n0mpb3TozBFPbLOr1wT+y5T98Su/r1OGZF+XyCxSkEUnWGwrA/6VgDdAsNbG8PJV36VIszbpRaqS9z/tg24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6w7msWF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6w7msWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717148576; x=1748684576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l+TBXAtspYeLckh5M5Sh8QU3eQ8gkHI8RcI2dDxy/tc=;
  b=A6w7msWF+H8C1I2egQ/dAHzNBIBaqVQ+B2czrdfyQnJrTba1q7b3geD6
   LRokiUcLO0hUaOCFTycuRbMK2IuMAQcKmb5OVaxPnUb7YyHQXohC4yfOm
   febgoazgAu7GKwTHCt6xS7hKuTmKLl8E7yUBgCV6JwuA5dQaDC2KwhhDJ
   3CDBMSFbIEudCE3fFyvRtboag0eqZGDvM1G7XOniOJEN+2RFcwrXrEsWH
   fXqjgRpQUuqO+3SuGKP9onBc7+0wMHmMQSDpN+68Fx53VFs+bw2rx8Kt+
   NBsdrlauClydiMWsgJ1/yk6Di12TKKr/fOpEC7wzJNJpTpR2WR1MfJ+9F
   A==;
X-CSE-ConnectionGUID: hEoiI4HsR9ql5dlEuJmT8A==
X-CSE-MsgGUID: aizH7V8CTAGWrqNNPi5r7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25089683"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="25089683"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 02:41:51 -0700
X-CSE-ConnectionGUID: 1zHe9n6PQTaKY+RIwJXQHQ==
X-CSE-MsgGUID: fVTBoEWaShOFzHFU/hTAkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="36046893"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 31 May 2024 02:41:49 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCylf-000GsZ-1l;
	Fri, 31 May 2024 09:41:47 +0000
Date: Fri, 31 May 2024 17:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 90/93]
 fs/bcachefs/thread_with_file.c:375:2: error: expected expression
Message-ID: <202405311714.YnZpPqdk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ce6297d0475422fa2de0db1d4f955633ba70d031
commit: 21091985987e4fcc4580030d896ac35906041d22 [90/93] bcachefs: bch2_stdio_redirect_readline_timeout()
config: hexagon-randconfig-002-20240531 (https://download.01.org/0day-ci/archive/20240531/202405311714.YnZpPqdk-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311714.YnZpPqdk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311714.YnZpPqdk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/thread_with_file.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/bcachefs/thread_with_file.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/bcachefs/thread_with_file.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> fs/bcachefs/thread_with_file.c:375:2: error: expected expression
           unsigned long t = timeout != MAX_SCHEDULE_TIMEOUT
           ^
>> fs/bcachefs/thread_with_file.c:379:2: error: use of undeclared identifier 't'
           t = min(t, sysctl_hung_task_timeout_secs * HZ / 2);
           ^
   fs/bcachefs/thread_with_file.c:379:10: error: use of undeclared identifier 't'
           t = min(t, sysctl_hung_task_timeout_secs * HZ / 2);
                   ^
   fs/bcachefs/thread_with_file.c:381:76: error: use of undeclared identifier 't'
           wait_event_timeout(buf->wait, stdio_redirect_has_more_input(stdio, seen), t);
                                                                                     ^
   fs/bcachefs/thread_with_file.c:381:76: error: use of undeclared identifier 't'
   6 warnings and 5 errors generated.


vim +375 fs/bcachefs/thread_with_file.c

   366	
   367	int bch2_stdio_redirect_readline_timeout(struct stdio_redirect *stdio,
   368						 darray_char *line,
   369						 unsigned long timeout)
   370	{
   371		unsigned long until = jiffies + timeout;
   372		struct stdio_buf *buf = &stdio->input;
   373		size_t seen = 0;
   374	again:
 > 375		unsigned long t = timeout != MAX_SCHEDULE_TIMEOUT
   376			? max_t(long, until - jiffies, 0)
   377			: timeout;
   378	
 > 379		t = min(t, sysctl_hung_task_timeout_secs * HZ / 2);
   380	
   381		wait_event_timeout(buf->wait, stdio_redirect_has_more_input(stdio, seen), t);
   382	
   383		if (stdio->done)
   384			return -1;
   385	
   386		spin_lock(&buf->lock);
   387		seen = buf->buf.nr;
   388		char *n = memchr(buf->buf.data, '\n', seen);
   389	
   390		if (!n && timeout != MAX_SCHEDULE_TIMEOUT && jiffies >= until) {
   391			spin_unlock(&buf->lock);
   392			return -ETIME;
   393		}
   394	
   395		if (!n) {
   396			buf->waiting_for_line = true;
   397			spin_unlock(&buf->lock);
   398			goto again;
   399		}
   400	
   401		size_t b = n + 1 - buf->buf.data;
   402		if (b > line->size) {
   403			spin_unlock(&buf->lock);
   404			int ret = darray_resize(line, b);
   405			if (ret)
   406				return ret;
   407			seen = 0;
   408			goto again;
   409		}
   410	
   411		buf->buf.nr -= b;
   412		memcpy(line->data, buf->buf.data, b);
   413		memmove(buf->buf.data,
   414			buf->buf.data + b,
   415			buf->buf.nr);
   416		line->nr = b;
   417	
   418		buf->waiting_for_line = false;
   419		spin_unlock(&buf->lock);
   420	
   421		wake_up(&buf->wait);
   422		return 0;
   423	}
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
