Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E638AC147;
	Thu, 13 Feb 2025 03:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739418327; cv=none; b=gIMOwb3c1hyEh5p3Di1VR0xAj9vJYSeJ8HPlaC/B1wlgNcPt07/VTqiEGDDORIOdvhA1kKy97sKFu6Ar/x0RRzRYKbql6p3v/9YBCLrA4/sqRbrmhFjLmmZ6NCDPXyexYu946sMtuachhfiXqCsPiJYuVdKqNw8shlWVVOXaOqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739418327; c=relaxed/simple;
	bh=qsvQ+nLKcXBGfslTcsmS7LbJZ/L+89jQCcBQssUfqm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rNt/Yk2pRl3gKMYGiEiUO5mHG/9qOCxN5WV2SAmrbJTpeeZfeAiXzvrLITXegwo6ytLrBOtD20q8yzRA4NO8WL6WuGu2PB0DNe/uaL3cUla9JWYEIUAxw9sF0w72j4JbGeDroKGTzlrVqu31CkW6fq8Kl178G13z5JcPxZXR1co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/FcqplW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/FcqplW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739418326; x=1770954326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qsvQ+nLKcXBGfslTcsmS7LbJZ/L+89jQCcBQssUfqm0=;
  b=A/FcqplWserwbCtsuxTuEzOA7y4TqX5pGjMlERsV6fXA90sduWk+3yiV
   Y6cl0RPEXLtmuyY68EP9gi1LCDB49c54U4FHqjRSjiWxZp4Uz2P+1JcGg
   r4KxWSBM4CZzF0Ql7cSWB/YYErLi5aESFMEDgEsXZXPpHE+agU/IdJP6F
   ip1uzVcyAz6/V+t7tVa4IGIMdru1Vr9OwL4saiAMupp4FLoU6LiYTja9Q
   lOvk4vnmYzEbhzgHcnsY1eBU/fEwQ+t1EBztS1uc3wvBnf0oZXZcsNJ6Q
   cAvw1LU8H7S5u7l+bc0HtjnXt+tTQqScMNYjo47bkWj+kWn0fHKEG7JmO
   Q==;
X-CSE-ConnectionGUID: rYoapFFvS9umtSpIVN8S9A==
X-CSE-MsgGUID: 4AejohobQyy4W4PTfp6hMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39335897"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="39335897"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 19:45:25 -0800
X-CSE-ConnectionGUID: mVKyG2lfSzyY/MySw8Nsrg==
X-CSE-MsgGUID: kJBML35EQU6lhDHk8pmtVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="113013779"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Feb 2025 19:45:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiQAD-0016Sh-1e;
	Thu, 13 Feb 2025 03:45:21 +0000
Date: Thu, 13 Feb 2025 11:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wei Liu <wei.liu@kernel.org>, Michael Kelley <mhklinux@outlook.com>
Subject: [hyperv:hyperv-next 1/2] drivers/hv/hv_common.c:305:10: warning:
 format specifies type 'unsigned long' but the argument has type 'int'
Message-ID: <202502131118.yON58wQY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
head:   502b6d14188ee710e8e9bfbea8ecd90cf3187104
commit: bc57d252ddf0e4eafe1b9b51a7c69110372d094f [1/2] hyperv: Move hv_current_partition_id to arch-generic code
config: i386-buildonly-randconfig-004-20250213 (https://download.01.org/0day-ci/archive/20250213/202502131118.yON58wQY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131118.yON58wQY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131118.yON58wQY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hv/hv_common.c:305:10: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
     304 |                 pr_err("Hyper-V: failed to get partition ID: %#lx\n",
         |                                                              ~~~~
         |                                                              %#x
     305 |                        hv_result(status));
         |                        ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:544:33: note: expanded from macro 'pr_err'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +305 drivers/hv/hv_common.c

   288	
   289	void __init hv_get_partition_id(void)
   290	{
   291		struct hv_output_get_partition_id *output;
   292		unsigned long flags;
   293		u64 status, pt_id;
   294	
   295		local_irq_save(flags);
   296		output = *this_cpu_ptr(hyperv_pcpu_input_arg);
   297		status = hv_do_hypercall(HVCALL_GET_PARTITION_ID, NULL, &output);
   298		pt_id = output->partition_id;
   299		local_irq_restore(flags);
   300	
   301		if (hv_result_success(status))
   302			hv_current_partition_id = pt_id;
   303		else
   304			pr_err("Hyper-V: failed to get partition ID: %#lx\n",
 > 305			       hv_result(status));
   306	}
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
