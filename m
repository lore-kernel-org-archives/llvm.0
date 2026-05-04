Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF1513B293;
	Mon,  4 May 2026 03:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777865794; cv=none; b=IouuB0oPK4Lfos6d+RMiFmNQCO++pVCrnFs3HC6X2OHmlVLnOevHVNRGtpDKvJ0ZLovSxy7vQM0gv6qfpxXV7Bp0N7UuCcZEUPaB1AoyzSUCabyAvnqNTasda0Y2/Duz43f2Oq7ysb466iSvPcdGgwL0aaPn/Kmu3Chw/FBqdsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777865794; c=relaxed/simple;
	bh=1u1sEfCWrhYBvhdd/X10kYrMJXiElWQaNLNy4W4xStY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=af3gmDRFUqNhWmdFerafVuoiQ+D7nFhscMlnEFf0tnjPnEPg1c8/987949oTfJ8Vh8FwT4AIonFmMkCfzIOS/ZMU0PuDEg2waIicCmM65VAXeXnm0hn2ZA8duZ1FIU4QqEKMbmSeYrJsAgnA7/BR0QkiUApE6uvJa/2wyKDpuoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKKoBqEj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKKoBqEj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777865792; x=1809401792;
  h=date:from:to:cc:subject:message-id;
  bh=1u1sEfCWrhYBvhdd/X10kYrMJXiElWQaNLNy4W4xStY=;
  b=UKKoBqEjv8r/Dztwa4EzJ3M44Zq9Ujc/MHhVXs5vWA5tTtg8FF6qc341
   mpd4+BJywvTLIteycpz3tUKrPV1zStQ491Z+baapbuG41WuP8Qvr5oJQn
   mq4kUD92ScYQj1frX+N65yq/kqwPVRYdZkU28uz5hbDW3Obwi6iDEU8nP
   6yiz3FfFZ9hPaZmm4lj1pv/Znz4QZU8OftWNskzQoxtBxZRdpu7UZVIkV
   443KlqalbaYYqpCo+rXjUKWqCoBfQa0j77yM94rG40ESRSr1GHKxGiEhE
   BMSpBdOpC5X8k+UNWBN8+WgCC0mrHDC/PBM4yCWVs1LCoWzbOE622a+mW
   w==;
X-CSE-ConnectionGUID: CWcgUEIlSG+Jv0EipX6QHg==
X-CSE-MsgGUID: AdkLoN5SSPGBRjipq4cxhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="90184467"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="90184467"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 20:36:32 -0700
X-CSE-ConnectionGUID: f8fV7z90TqGPa97f3ed00g==
X-CSE-MsgGUID: mt1hvccDQyGvfT0uxkClbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="232253395"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 May 2026 20:36:29 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJk6V-000000003Qb-4BU7;
	Mon, 04 May 2026 03:36:22 +0000
Date: Mon, 04 May 2026 11:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext.c:5291:49: warning: diagnostic behavior may
 be improved by adding the 'format(printf, 3, 0)' attribute to the declaration
 of 'scx_vexit'
Message-ID: <202605041112.Y6OG7v9r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Tejun,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d35786de28116ecf78797a62b84e6bf3c45aa5a
commit: c4c286d747971c410739afc216972f1cc0923270 sched_ext: Cleanup [__]scx_exit/error*()
date:   12 months ago
config: s390-randconfig-001-20260504 (https://download.01.org/0day-ci/archive/20260504/202605041112.Y6OG7v9r-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605041112.Y6OG7v9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c4c286d74797 ("sched_ext: Cleanup [__]scx_exit/error*()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605041112.Y6OG7v9r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:370:9: note: previous definition is here
     370 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from kernel/sched/build_policy.c:63:
   kernel/sched/ext.c:1877:9: warning: default initialization of an object of type 'typeof (b->scx.dsq_vtime)' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
    1877 |         return time_before64(a->scx.dsq_vtime, b->scx.dsq_vtime);
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
   kernel/sched/ext.c:1877:9: warning: default initialization of an object of type 'typeof (a->scx.dsq_vtime)' (aka 'const unsigned long long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
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
>> kernel/sched/ext.c:5291:49: warning: diagnostic behavior may be improved by adding the 'format(printf, 3, 0)' attribute to the declaration of 'scx_vexit' [-Wmissing-format-attribute]
    1139 |         vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
         |                                                        ^
   kernel/sched/ext.c:1139:13: note: 'scx_vexit' declared here
    1139 | static void scx_vexit(enum scx_exit_kind kind, s64 exit_code, const char *fmt,
         |             ^
   kernel/sched/ext.c:7094:27: warning: diagnostic behavior may be improved by adding the 'format(printf, 4, 0)' attribute to the declaration of '__bstr_format' [-Wmissing-format-attribute]
    7068 |                           bprintf_data.bin_args);
         |                                                ^
   kernel/sched/ext.c:7068:12: note: '__bstr_format' declared here
    7068 | static s32 __bstr_format(u64 *data_buf, char *line_buf, size_t line_size,
         |            ^
   kernel/sched/ext.c:7108:28: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'bstr_format' [-Wmissing-format-attribute]
    7104 | static s32 bstr_format(struct scx_bstr_buf *buf,
         | __attribute__((format(printf, 2, 0))) 
    7105 |                        char *fmt, unsigned long long *data, u32 data__sz)
    7106 | {
    7107 |         return __bstr_format(buf->data, buf->line, sizeof(buf->line),
    7108 |                              fmt, data, data__sz);
         |                                                 ^
   kernel/sched/ext.c:7104:12: note: 'bstr_format' declared here
    7104 | static s32 bstr_format(struct scx_bstr_buf *buf,
         |            ^
   kernel/sched/ext.c:7129:57: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'scx_bpf_exit_bstr' [-Wmissing-format-attribute]
    7123 | __bpf_kfunc void scx_bpf_exit_bstr(s64 exit_code, char *fmt,
         | __attribute__((format(printf, 2, 0))) 
    7124 |                                    unsigned long long *data, u32 data__sz)
    7125 | {
    7126 |         unsigned long flags;
    7127 | 
    7128 |         raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
    7129 |         if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
         |                                                                ^
   kernel/sched/ext.c:7123:18: note: 'scx_bpf_exit_bstr' declared here
    7123 | __bpf_kfunc void scx_bpf_exit_bstr(s64 exit_code, char *fmt,
         |                  ^
   kernel/sched/ext.c:7149:57: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 0)' attribute to the declaration of 'scx_bpf_error_bstr' [-Wmissing-format-attribute]
    7143 | __bpf_kfunc void scx_bpf_error_bstr(char *fmt, unsigned long long *data,
         | __attribute__((format(printf, 1, 0))) 
    7144 |                                     u32 data__sz)
    7145 | {
    7146 |         unsigned long flags;
    7147 | 
    7148 |         raw_spin_lock_irqsave(&scx_exit_bstr_buf_lock, flags);
    7149 |         if (bstr_format(&scx_exit_bstr_buf, fmt, data, data__sz) >= 0)
         |                                                                ^
   kernel/sched/ext.c:7143:18: note: 'scx_bpf_error_bstr' declared here
    7143 | __bpf_kfunc void scx_bpf_error_bstr(char *fmt, unsigned long long *data,
         |                  ^
   kernel/sched/ext.c:7180:59: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 0)' attribute to the declaration of 'scx_bpf_dump_bstr' [-Wmissing-format-attribute]
    7166 | __bpf_kfunc void scx_bpf_dump_bstr(char *fmt, unsigned long long *data,
         | __attribute__((format(printf, 1, 0))) 
    7167 |                                    u32 data__sz)
    7168 | {
    7169 |         struct scx_dump_data *dd = &scx_dump_data;
    7170 |         struct scx_bstr_buf *buf = &dd->buf;
    7171 |         s32 ret;
    7172 | 
    7173 |         if (raw_smp_processor_id() != dd->cpu) {
    7174 |                 scx_error("scx_bpf_dump() must only be called from ops.dump() and friends");
    7175 |                 return;
    7176 |         }
    7177 | 
    7178 |         /* append the formatted string to the line buf */
    7179 |         ret = __bstr_format(buf->data, buf->line + dd->cursor,
    7180 |                             sizeof(buf->line) - dd->cursor, fmt, data, data__sz);
         |                                                                                ^
   kernel/sched/ext.c:7166:18: note: 'scx_bpf_dump_bstr' declared here
    7166 | __bpf_kfunc void scx_bpf_dump_bstr(char *fmt, unsigned long long *data,
         |                  ^
   9 warnings generated.


vim +5291 kernel/sched/ext.c

f0e1a0643a59bf Tejun Heo    2024-06-18  5269  
c4c286d747971c Tejun Heo    2025-05-14  5270  static void scx_vexit(enum scx_exit_kind kind, s64 exit_code, const char *fmt,
c4c286d747971c Tejun Heo    2025-05-14  5271  		      va_list args)
f0e1a0643a59bf Tejun Heo    2024-06-18  5272  {
c8fafb34854af4 Andrea Righi 2025-04-30  5273  	struct scx_sched *sch;
c8fafb34854af4 Andrea Righi 2025-04-30  5274  	struct scx_exit_info *ei;
f0e1a0643a59bf Tejun Heo    2024-06-18  5275  	int none = SCX_EXIT_NONE;
f0e1a0643a59bf Tejun Heo    2024-06-18  5276  
c8fafb34854af4 Andrea Righi 2025-04-30  5277  	rcu_read_lock();
c8fafb34854af4 Andrea Righi 2025-04-30  5278  	sch = rcu_dereference(scx_root);
c8fafb34854af4 Andrea Righi 2025-04-30  5279  	if (!sch)
c8fafb34854af4 Andrea Righi 2025-04-30  5280  		goto out_unlock;
c8fafb34854af4 Andrea Righi 2025-04-30  5281  	ei = sch->exit_info;
c8fafb34854af4 Andrea Righi 2025-04-30  5282  
c8fafb34854af4 Andrea Righi 2025-04-30  5283  	if (!atomic_try_cmpxchg(&sch->exit_kind, &none, kind))
c8fafb34854af4 Andrea Righi 2025-04-30  5284  		goto out_unlock;
f0e1a0643a59bf Tejun Heo    2024-06-18  5285  
f0e1a0643a59bf Tejun Heo    2024-06-18  5286  	ei->exit_code = exit_code;
62d3726d4cd66f Tejun Heo    2024-09-23  5287  #ifdef CONFIG_STACKTRACE
f0e1a0643a59bf Tejun Heo    2024-06-18  5288  	if (kind >= SCX_EXIT_ERROR)
f0e1a0643a59bf Tejun Heo    2024-06-18  5289  		ei->bt_len = stack_trace_save(ei->bt, SCX_EXIT_BT_LEN, 1);
62d3726d4cd66f Tejun Heo    2024-09-23  5290  #endif
f0e1a0643a59bf Tejun Heo    2024-06-18 @5291  	vscnprintf(ei->msg, SCX_EXIT_MSG_LEN, fmt, args);
f0e1a0643a59bf Tejun Heo    2024-06-18  5292  
07814a9439a3b0 Tejun Heo    2024-06-18  5293  	/*
07814a9439a3b0 Tejun Heo    2024-06-18  5294  	 * Set ei->kind and ->reason for scx_dump_state(). They'll be set again
1a2469403eb26c Tejun Heo    2025-04-04  5295  	 * in scx_disable_workfn().
07814a9439a3b0 Tejun Heo    2024-06-18  5296  	 */
07814a9439a3b0 Tejun Heo    2024-06-18  5297  	ei->kind = kind;
07814a9439a3b0 Tejun Heo    2024-06-18  5298  	ei->reason = scx_exit_reason(ei->kind);
07814a9439a3b0 Tejun Heo    2024-06-18  5299  
c8fafb34854af4 Andrea Righi 2025-04-30  5300  	irq_work_queue(&sch->error_irq_work);
c8fafb34854af4 Andrea Righi 2025-04-30  5301  out_unlock:
c8fafb34854af4 Andrea Righi 2025-04-30  5302  	rcu_read_unlock();
f0e1a0643a59bf Tejun Heo    2024-06-18  5303  }
f0e1a0643a59bf Tejun Heo    2024-06-18  5304  

:::::: The code at line 5291 was first introduced by commit
:::::: f0e1a0643a59bf1f922fa209cec86a170b784f3f sched_ext: Implement BPF extensible scheduler class

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
