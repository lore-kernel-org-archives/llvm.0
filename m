Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF9B2FD1D5;
	Mon,  8 Dec 2025 20:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765224308; cv=none; b=Y04Po4o5RzNMVIItV8AdPPe9x1xS4ybtTRah5HzxIp3NVCtx1R1JKYgsjU8ft9lVhCEqX8qtUvkUcKvR+Uc4fu1N9EbPEGDK+Qlto91gHcm+XGHNrwB1bWUnoum1+yWKiXnnUZowuHQ36H94ju+kYaE/BmAkkQc+4uaCoudonXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765224308; c=relaxed/simple;
	bh=wQ3eTaEYcu1JVjVUrOcsFXSocQ+TRlIlf2hbja8Qduo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T3DA095NzqtTVJbcyUJ6SuJ624QRDGaKHcbOTW0fMalyffXgl6qvO+le47g/MgMKy1P97Va8oPwwBD/CHgMFD72XhzJZWOS6OEBGypI3Ol2fkRsIEWyF2yrfUSxY7iUNpcVKasTtSKlnwIHXfDBCh2UO16gN92U/4l03fKz9ZQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=niZwMRpR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="niZwMRpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765224305; x=1796760305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wQ3eTaEYcu1JVjVUrOcsFXSocQ+TRlIlf2hbja8Qduo=;
  b=niZwMRpRvwDdxrWu4r6tMs/w3B+1p41u3LCXivMZJEPW8lmleKnVwN40
   +wwTpM0qXy+vMkDUP7FsWS09dXlTduyB/JS/ahFTqZWKBzZAg3EOZ6qzj
   ZnoNR0oAMhGYeMmfFk+pxpcMFzIOcZvDw4MlVDMRqx/Nlsx0+gIVf5TI2
   FvdpBE0evRW5fTSuX9c2/0A9eT8tIT3whQgPOy8C0OywQSwaGgQE8An1l
   cJS6jQIx/Pdd7H7/TJnJMxSkNleVKDIWTXUplJNlVWra9Mc63vqJJcx5w
   BtiL84KXOfF+pDsxWmICexEHAH1O6XhbC4Ks8y6aJ+cXIAtCOlkZtdGAo
   w==;
X-CSE-ConnectionGUID: WGsb0LCFQm2QNe49LgkJJg==
X-CSE-MsgGUID: oy/uulyhTMuomRjFdHvN+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="77499022"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="77499022"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 12:05:05 -0800
X-CSE-ConnectionGUID: Y1kstbn5QZq2QEwDaC59FA==
X-CSE-MsgGUID: tNXfHkP5Qi2TR2+pSC1Ydg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="195088601"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Dec 2025 12:05:03 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vShTg-000000000oH-3mOa;
	Mon, 08 Dec 2025 20:05:00 +0000
Date: Tue, 9 Dec 2025 04:04:34 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
	Kees Cook <kees@kernel.org>
Subject: kernel/sched/ext.c:6942:27: warning: diagnostic behavior may be
 improved by adding the 'format(printf, 4, 0)' attribute to the declaration
 of '__bstr_format'
Message-ID: <202512090407.VxRO6xAS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andy,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2f2b01b74be8b40a2173372bcd770723f87e7b2
commit: 7bf819aa992faee980610e9021aec0c38aac53be vsnprintf: Mark binary printing functions with __printf() attribute
date:   9 months ago
config: sparc64-randconfig-001-20251209 (https://download.01.org/0day-ci/archive/20251209/202512090407.VxRO6xAS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090407.VxRO6xAS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090407.VxRO6xAS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:63:
   kernel/sched/ext.c:1809:9: warning: default initialization of an object of type 'typeof (b->scx.dsq_vtime)' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    1809 |         return time_before64(a->scx.dsq_vtime, b->scx.dsq_vtime);
         |                ^
   include/linux/jiffies.h:212:28: note: expanded from macro 'time_before64'
     212 | #define time_before64(a,b)      time_after64(b,a)
         |                                 ^
   include/linux/jiffies.h:199:3: note: expanded from macro 'time_after64'
     199 |         (typecheck(__u64, a) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   In file included from kernel/sched/build_policy.c:63:
   kernel/sched/ext.c:1809:9: warning: default initialization of an object of type 'typeof (a->scx.dsq_vtime)' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
   include/linux/jiffies.h:212:28: note: expanded from macro 'time_before64'
     212 | #define time_before64(a,b)      time_after64(b,a)
         |                                 ^
   include/linux/jiffies.h:200:3: note: expanded from macro 'time_after64'
     200 |          typecheck(__u64, b) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   In file included from kernel/sched/build_policy.c:63:
>> kernel/sched/ext.c:6942:27: warning: diagnostic behavior may be improved by adding the 'format(printf, 4, 0)' attribute to the declaration of '__bstr_format' [-Wmissing-format-attribute]
    6915 |                           bprintf_data.bin_args);
         |                                                ^
   kernel/sched/ext.c:6915:12: note: '__bstr_format' declared here
    6915 | static s32 __bstr_format(u64 *data_buf, char *line_buf, size_t line_size,
         |            ^
>> kernel/sched/ext.c:6957:28: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'bstr_format' [-Wmissing-format-attribute]
    6953 | static s32 bstr_format(struct scx_bstr_buf *buf,
         | __attribute__((format(printf, 2, 0))) 
    6954 |                        char *fmt, unsigned long long *data, u32 data__sz)
    6955 | {
    6956 |         return __bstr_format(buf->data, buf->line, sizeof(buf->line),
    6957 |                              fmt, data, data__sz);
         |                                                 ^
   kernel/sched/ext.c:6953:12: note: 'bstr_format' declared here
    6953 | static s32 bstr_format(struct scx_bstr_buf *buf,
         |            ^
>> kernel/sched/ext.c:6978:57: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'scx_bpf_exit_bstr' [-Wmissing-format-attribute]
    6972 | __bpf_kfunc void scx_bpf_exit_bstr(s64 exit_code, char *fmt,
         | __attribute__((format(printf, 2, 0))) 
    6973 |                                    unsigned long long *data, u32 data__sz)
    6974 | {
    6975 |         unsigned long flags;
    6976 | 
    6977 |         raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
    6978 |         if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
         |                                                                ^
   kernel/sched/ext.c:6972:18: note: 'scx_bpf_exit_bstr' declared here
    6972 | __bpf_kfunc void scx_bpf_exit_bstr(s64 exit_code, char *fmt,
         |                  ^
>> kernel/sched/ext.c:6999:57: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 0)' attribute to the declaration of 'scx_bpf_error_bstr' [-Wmissing-format-attribute]
    6993 | __bpf_kfunc void scx_bpf_error_bstr(char *fmt, unsigned long long *data,
         | __attribute__((format(printf, 1, 0))) 
    6994 |                                     u32 data__sz)
    6995 | {
    6996 |         unsigned long flags;
    6997 | 
    6998 |         raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
    6999 |         if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
         |                                                                ^
   kernel/sched/ext.c:6993:18: note: 'scx_bpf_error_bstr' declared here
    6993 | __bpf_kfunc void scx_bpf_error_bstr(char *fmt, unsigned long long *data,
         |                  ^
>> kernel/sched/ext.c:7031:59: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 0)' attribute to the declaration of 'scx_bpf_dump_bstr' [-Wmissing-format-attribute]
    7017 | __bpf_kfunc void scx_bpf_dump_bstr(char *fmt, unsigned long long *data,
         | __attribute__((format(printf, 1, 0))) 
    7018 |                                    u32 data__sz)
    7019 | {
    7020 |         struct scx_dump_data *dd = &scx_dump_data;
    7021 |         struct scx_bstr_buf *buf = &dd->buf;
    7022 |         s32 ret;
    7023 | 
    7024 |         if (raw_smp_processor_id() != dd->cpu) {
    7025 |                 scx_ops_error("scx_bpf_dump() must only be called from ops.dump() and friends");
    7026 |                 return;
    7027 |         }
    7028 | 
    7029 |         /* append the formatted string to the line buf */
    7030 |         ret = __bstr_format(buf->data, buf->line + dd->cursor,
    7031 |                             sizeof(buf->line) - dd->cursor, fmt, data, data__sz);
         |                                                                                ^
   kernel/sched/ext.c:7017:18: note: 'scx_bpf_dump_bstr' declared here
    7017 | __bpf_kfunc void scx_bpf_dump_bstr(char *fmt, unsigned long long *data,
         |                  ^
   7 warnings generated.


vim +6942 kernel/sched/ext.c

f0e1a0643a59bf Tejun Heo    2024-06-18  6914  
f0e1a0643a59bf Tejun Heo    2024-06-18  6915  static s32 __bstr_format(u64 *data_buf, char *line_buf, size_t line_size,
f0e1a0643a59bf Tejun Heo    2024-06-18  6916  			 char *fmt, unsigned long long *data, u32 data__sz)
f0e1a0643a59bf Tejun Heo    2024-06-18  6917  {
f0e1a0643a59bf Tejun Heo    2024-06-18  6918  	struct bpf_bprintf_data bprintf_data = { .get_bin_args = true };
f0e1a0643a59bf Tejun Heo    2024-06-18  6919  	s32 ret;
f0e1a0643a59bf Tejun Heo    2024-06-18  6920  
f0e1a0643a59bf Tejun Heo    2024-06-18  6921  	if (data__sz % 8 || data__sz > MAX_BPRINTF_VARARGS * 8 ||
f0e1a0643a59bf Tejun Heo    2024-06-18  6922  	    (data__sz && !data)) {
f0e1a0643a59bf Tejun Heo    2024-06-18  6923  		scx_ops_error("invalid data=%p and data__sz=%u",
f0e1a0643a59bf Tejun Heo    2024-06-18  6924  			      (void *)data, data__sz);
f0e1a0643a59bf Tejun Heo    2024-06-18  6925  		return -EINVAL;
f0e1a0643a59bf Tejun Heo    2024-06-18  6926  	}
f0e1a0643a59bf Tejun Heo    2024-06-18  6927  
f0e1a0643a59bf Tejun Heo    2024-06-18  6928  	ret = copy_from_kernel_nofault(data_buf, data, data__sz);
f0e1a0643a59bf Tejun Heo    2024-06-18  6929  	if (ret < 0) {
f0e1a0643a59bf Tejun Heo    2024-06-18  6930  		scx_ops_error("failed to read data fields (%d)", ret);
f0e1a0643a59bf Tejun Heo    2024-06-18  6931  		return ret;
f0e1a0643a59bf Tejun Heo    2024-06-18  6932  	}
f0e1a0643a59bf Tejun Heo    2024-06-18  6933  
f0e1a0643a59bf Tejun Heo    2024-06-18  6934  	ret = bpf_bprintf_prepare(fmt, UINT_MAX, data_buf, data__sz / 8,
f0e1a0643a59bf Tejun Heo    2024-06-18  6935  				  &bprintf_data);
f0e1a0643a59bf Tejun Heo    2024-06-18  6936  	if (ret < 0) {
f0e1a0643a59bf Tejun Heo    2024-06-18  6937  		scx_ops_error("format preparation failed (%d)", ret);
f0e1a0643a59bf Tejun Heo    2024-06-18  6938  		return ret;
f0e1a0643a59bf Tejun Heo    2024-06-18  6939  	}
f0e1a0643a59bf Tejun Heo    2024-06-18  6940  
f0e1a0643a59bf Tejun Heo    2024-06-18  6941  	ret = bstr_printf(line_buf, line_size, fmt,
f0e1a0643a59bf Tejun Heo    2024-06-18 @6942  			  bprintf_data.bin_args);
f0e1a0643a59bf Tejun Heo    2024-06-18  6943  	bpf_bprintf_cleanup(&bprintf_data);
f0e1a0643a59bf Tejun Heo    2024-06-18  6944  	if (ret < 0) {
f0e1a0643a59bf Tejun Heo    2024-06-18  6945  		scx_ops_error("(\"%s\", %p, %u) failed to format",
f0e1a0643a59bf Tejun Heo    2024-06-18  6946  			      fmt, data, data__sz);
f0e1a0643a59bf Tejun Heo    2024-06-18  6947  		return ret;
f0e1a0643a59bf Tejun Heo    2024-06-18  6948  	}
f0e1a0643a59bf Tejun Heo    2024-06-18  6949  
f0e1a0643a59bf Tejun Heo    2024-06-18  6950  	return ret;
f0e1a0643a59bf Tejun Heo    2024-06-18  6951  }
f0e1a0643a59bf Tejun Heo    2024-06-18  6952  
f0e1a0643a59bf Tejun Heo    2024-06-18 @6953  static s32 bstr_format(struct scx_bstr_buf *buf,
f0e1a0643a59bf Tejun Heo    2024-06-18  6954  		       char *fmt, unsigned long long *data, u32 data__sz)
f0e1a0643a59bf Tejun Heo    2024-06-18  6955  {
f0e1a0643a59bf Tejun Heo    2024-06-18  6956  	return __bstr_format(buf->data, buf->line, sizeof(buf->line),
f0e1a0643a59bf Tejun Heo    2024-06-18 @6957  			     fmt, data, data__sz);
f0e1a0643a59bf Tejun Heo    2024-06-18  6958  }
f0e1a0643a59bf Tejun Heo    2024-06-18  6959  
f0e1a0643a59bf Tejun Heo    2024-06-18  6960  __bpf_kfunc_start_defs();
f0e1a0643a59bf Tejun Heo    2024-06-18  6961  
f0e1a0643a59bf Tejun Heo    2024-06-18  6962  /**
f0e1a0643a59bf Tejun Heo    2024-06-18  6963   * scx_bpf_exit_bstr - Gracefully exit the BPF scheduler.
f0e1a0643a59bf Tejun Heo    2024-06-18  6964   * @exit_code: Exit value to pass to user space via struct scx_exit_info.
f0e1a0643a59bf Tejun Heo    2024-06-18  6965   * @fmt: error message format string
f0e1a0643a59bf Tejun Heo    2024-06-18  6966   * @data: format string parameters packaged using ___bpf_fill() macro
f0e1a0643a59bf Tejun Heo    2024-06-18  6967   * @data__sz: @data len, must end in '__sz' for the verifier
f0e1a0643a59bf Tejun Heo    2024-06-18  6968   *
f0e1a0643a59bf Tejun Heo    2024-06-18  6969   * Indicate that the BPF scheduler wants to exit gracefully, and initiate ops
f0e1a0643a59bf Tejun Heo    2024-06-18  6970   * disabling.
f0e1a0643a59bf Tejun Heo    2024-06-18  6971   */
f0e1a0643a59bf Tejun Heo    2024-06-18 @6972  __bpf_kfunc void scx_bpf_exit_bstr(s64 exit_code, char *fmt,
f0e1a0643a59bf Tejun Heo    2024-06-18  6973  				   unsigned long long *data, u32 data__sz)
f0e1a0643a59bf Tejun Heo    2024-06-18  6974  {
f0e1a0643a59bf Tejun Heo    2024-06-18  6975  	unsigned long flags;
f0e1a0643a59bf Tejun Heo    2024-06-18  6976  
f0e1a0643a59bf Tejun Heo    2024-06-18  6977  	raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
f0e1a0643a59bf Tejun Heo    2024-06-18 @6978  	if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
f0e1a0643a59bf Tejun Heo    2024-06-18  6979  		scx_ops_exit_kind(SCX_EXIT_UNREG_BPF, exit_code, "%s",
f0e1a0643a59bf Tejun Heo    2024-06-18  6980  				  scx_exit_bstr_buf.line);
f0e1a0643a59bf Tejun Heo    2024-06-18  6981  	raw_spin_unlock_irqrestore(&scx_exit_bstr_buf_lock, flags);
f0e1a0643a59bf Tejun Heo    2024-06-18  6982  }
f0e1a0643a59bf Tejun Heo    2024-06-18  6983  
f0e1a0643a59bf Tejun Heo    2024-06-18  6984  /**
f0e1a0643a59bf Tejun Heo    2024-06-18  6985   * scx_bpf_error_bstr - Indicate fatal error
f0e1a0643a59bf Tejun Heo    2024-06-18  6986   * @fmt: error message format string
f0e1a0643a59bf Tejun Heo    2024-06-18  6987   * @data: format string parameters packaged using ___bpf_fill() macro
f0e1a0643a59bf Tejun Heo    2024-06-18  6988   * @data__sz: @data len, must end in '__sz' for the verifier
f0e1a0643a59bf Tejun Heo    2024-06-18  6989   *
f0e1a0643a59bf Tejun Heo    2024-06-18  6990   * Indicate that the BPF scheduler encountered a fatal error and initiate ops
f0e1a0643a59bf Tejun Heo    2024-06-18  6991   * disabling.
f0e1a0643a59bf Tejun Heo    2024-06-18  6992   */
f0e1a0643a59bf Tejun Heo    2024-06-18 @6993  __bpf_kfunc void scx_bpf_error_bstr(char *fmt, unsigned long long *data,
f0e1a0643a59bf Tejun Heo    2024-06-18  6994  				    u32 data__sz)
f0e1a0643a59bf Tejun Heo    2024-06-18  6995  {
f0e1a0643a59bf Tejun Heo    2024-06-18  6996  	unsigned long flags;
f0e1a0643a59bf Tejun Heo    2024-06-18  6997  
f0e1a0643a59bf Tejun Heo    2024-06-18  6998  	raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
f0e1a0643a59bf Tejun Heo    2024-06-18 @6999  	if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
f0e1a0643a59bf Tejun Heo    2024-06-18  7000  		scx_ops_exit_kind(SCX_EXIT_ERROR_BPF, 0, "%s",
f0e1a0643a59bf Tejun Heo    2024-06-18  7001  				  scx_exit_bstr_buf.line);
f0e1a0643a59bf Tejun Heo    2024-06-18  7002  	raw_spin_unlock_irqrestore(&scx_exit_bstr_buf_lock, flags);
f0e1a0643a59bf Tejun Heo    2024-06-18  7003  }
f0e1a0643a59bf Tejun Heo    2024-06-18  7004  
07814a9439a3b0 Tejun Heo    2024-06-18  7005  /**
987ce79b5242c0 Randy Dunlap 2025-01-10  7006   * scx_bpf_dump_bstr - Generate extra debug dump specific to the BPF scheduler
07814a9439a3b0 Tejun Heo    2024-06-18  7007   * @fmt: format string
07814a9439a3b0 Tejun Heo    2024-06-18  7008   * @data: format string parameters packaged using ___bpf_fill() macro
07814a9439a3b0 Tejun Heo    2024-06-18  7009   * @data__sz: @data len, must end in '__sz' for the verifier
07814a9439a3b0 Tejun Heo    2024-06-18  7010   *
07814a9439a3b0 Tejun Heo    2024-06-18  7011   * To be called through scx_bpf_dump() helper from ops.dump(), dump_cpu() and
07814a9439a3b0 Tejun Heo    2024-06-18  7012   * dump_task() to generate extra debug dump specific to the BPF scheduler.
07814a9439a3b0 Tejun Heo    2024-06-18  7013   *
07814a9439a3b0 Tejun Heo    2024-06-18  7014   * The extra dump may be multiple lines. A single line may be split over
07814a9439a3b0 Tejun Heo    2024-06-18  7015   * multiple calls. The last line is automatically terminated.
07814a9439a3b0 Tejun Heo    2024-06-18  7016   */
07814a9439a3b0 Tejun Heo    2024-06-18  7017  __bpf_kfunc void scx_bpf_dump_bstr(char *fmt, unsigned long long *data,
07814a9439a3b0 Tejun Heo    2024-06-18  7018  				   u32 data__sz)
07814a9439a3b0 Tejun Heo    2024-06-18  7019  {
07814a9439a3b0 Tejun Heo    2024-06-18  7020  	struct scx_dump_data *dd = &scx_dump_data;
07814a9439a3b0 Tejun Heo    2024-06-18  7021  	struct scx_bstr_buf *buf = &dd->buf;
07814a9439a3b0 Tejun Heo    2024-06-18  7022  	s32 ret;
07814a9439a3b0 Tejun Heo    2024-06-18  7023  
07814a9439a3b0 Tejun Heo    2024-06-18  7024  	if (raw_smp_processor_id() != dd->cpu) {
07814a9439a3b0 Tejun Heo    2024-06-18  7025  		scx_ops_error("scx_bpf_dump() must only be called from ops.dump() and friends");
07814a9439a3b0 Tejun Heo    2024-06-18  7026  		return;
07814a9439a3b0 Tejun Heo    2024-06-18  7027  	}
07814a9439a3b0 Tejun Heo    2024-06-18  7028  
07814a9439a3b0 Tejun Heo    2024-06-18  7029  	/* append the formatted string to the line buf */
07814a9439a3b0 Tejun Heo    2024-06-18  7030  	ret = __bstr_format(buf->data, buf->line + dd->cursor,
07814a9439a3b0 Tejun Heo    2024-06-18 @7031  			    sizeof(buf->line) - dd->cursor, fmt, data, data__sz);
07814a9439a3b0 Tejun Heo    2024-06-18  7032  	if (ret < 0) {
07814a9439a3b0 Tejun Heo    2024-06-18  7033  		dump_line(dd->s, "%s[!] (\"%s\", %p, %u) failed to format (%d)",
07814a9439a3b0 Tejun Heo    2024-06-18  7034  			  dd->prefix, fmt, data, data__sz, ret);
07814a9439a3b0 Tejun Heo    2024-06-18  7035  		return;
07814a9439a3b0 Tejun Heo    2024-06-18  7036  	}
07814a9439a3b0 Tejun Heo    2024-06-18  7037  
07814a9439a3b0 Tejun Heo    2024-06-18  7038  	dd->cursor += ret;
07814a9439a3b0 Tejun Heo    2024-06-18  7039  	dd->cursor = min_t(s32, dd->cursor, sizeof(buf->line));
07814a9439a3b0 Tejun Heo    2024-06-18  7040  
07814a9439a3b0 Tejun Heo    2024-06-18  7041  	if (!dd->cursor)
07814a9439a3b0 Tejun Heo    2024-06-18  7042  		return;
07814a9439a3b0 Tejun Heo    2024-06-18  7043  
07814a9439a3b0 Tejun Heo    2024-06-18  7044  	/*
07814a9439a3b0 Tejun Heo    2024-06-18  7045  	 * If the line buf overflowed or ends in a newline, flush it into the
07814a9439a3b0 Tejun Heo    2024-06-18  7046  	 * dump. This is to allow the caller to generate a single line over
07814a9439a3b0 Tejun Heo    2024-06-18  7047  	 * multiple calls. As ops_dump_flush() can also handle multiple lines in
07814a9439a3b0 Tejun Heo    2024-06-18  7048  	 * the line buf, the only case which can lead to an unexpected
07814a9439a3b0 Tejun Heo    2024-06-18  7049  	 * truncation is when the caller keeps generating newlines in the middle
07814a9439a3b0 Tejun Heo    2024-06-18  7050  	 * instead of the end consecutively. Don't do that.
07814a9439a3b0 Tejun Heo    2024-06-18  7051  	 */
07814a9439a3b0 Tejun Heo    2024-06-18  7052  	if (dd->cursor >= sizeof(buf->line) || buf->line[dd->cursor - 1] == '\n')
07814a9439a3b0 Tejun Heo    2024-06-18  7053  		ops_dump_flush();
07814a9439a3b0 Tejun Heo    2024-06-18  7054  }
07814a9439a3b0 Tejun Heo    2024-06-18  7055  

:::::: The code at line 6942 was first introduced by commit
:::::: f0e1a0643a59bf1f922fa209cec86a170b784f3f sched_ext: Implement BPF extensible scheduler class

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
