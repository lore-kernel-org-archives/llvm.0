Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D01334C1B;
	Mon, 30 Mar 2026 19:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900361; cv=none; b=P2DqtBia9T9Jvn3zm37L3r9WpQPrNA/5Zy+LMkoM/FfSdbfNRT5qZwcg+S4vSjufabRFiAU9c42lRioePQeruLRymBza+i3zoDn0guzrwROlobdNlHR3nHvTMW8E0BT8jEItllg18385xqxE4HbfxY+5F9m9VzYJ4p0uDpJlzOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900361; c=relaxed/simple;
	bh=Un2iAwmGaeKx/c3VvdeE5Wmb6GcONXo33WEet1EDLmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XScoladAKHygrqke5//oo2WWJw/mAPBuRtbj0m8iMF8B2CxhST1BA5RauqgnDbsk7s2uGg76JkmYMEzumXiuWNAbxC8EIOhX1Gwta8j5iFr2l9OkZE5NFvmWDwEcuGH2s/1lgkzaMcXO17ZPf7KGJFYMAHHJAFKPGl+pEqY3Dro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eFxBlrF2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eFxBlrF2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774900361; x=1806436361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Un2iAwmGaeKx/c3VvdeE5Wmb6GcONXo33WEet1EDLmw=;
  b=eFxBlrF2tP/9SkznGcjEk3MqJmqiCQRKqURY+A7S0q+dOCixqDg6RZjQ
   xUVK+L/BwaYsI256QcHlUB4gtv1LEoSKrazgFR+Nrc4KHU0wDAUrGFRks
   uywgTv1ruI/BTmKZLyhEFwUIRb2ymjkluT6Mw8T5YMjce8BujLOzHELsa
   eB2dEkaXNkgJYVVr7SR+ceNej5JaI6LsMc+HMYzsEDb7Rgw0fqPIL2sR8
   obEoJYo33quJF1WHQjGCWmFyc/Ry/VrnVft95KOXyxqYD4w5HEbKmJQik
   hDTujTvD3iYb8LhIQkMnbaCNdSiCu7n8b/4eXjjbz4yx0bqjPa/Z/d+VY
   w==;
X-CSE-ConnectionGUID: N0qBpzccShq3xeUCISGDfw==
X-CSE-MsgGUID: UekmfaOKT6utcd8st2N6+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75618978"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="75618978"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 12:52:40 -0700
X-CSE-ConnectionGUID: Y/6vU5MaTKe5lYv92Ar41Q==
X-CSE-MsgGUID: +BBJGVwrQRyQqronh8fUIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="256648625"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Mar 2026 12:52:38 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7If5-000000001cD-3ed4;
	Mon, 30 Mar 2026 19:52:35 +0000
Date: Tue, 31 Mar 2026 03:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: wen.yang@linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 2/2] sysctl: convert kernel/sysctl-test.c to use
 CTLTBL_ENTRY_XXX()
Message-ID: <202603310301.Ogh6kR6N-lkp@intel.com>
References: <d2589e4a49044b0d857ee1b9da495ca73d19ae57.1774463505.git.wen.yang@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2589e4a49044b0d857ee1b9da495ca73d19ae57.1774463505.git.wen.yang@linux.dev>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on sysctl/sysctl-next]
[also build test WARNING on kees/for-next/pstore kees/for-next/kspp linus/master v7.0-rc6 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wen-yang-linux-dev/sysctl-introduce-CTLTBL_ENTRY_XXX-helper-macros/20260330-010040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git sysctl-next
patch link:    https://lore.kernel.org/r/d2589e4a49044b0d857ee1b9da495ca73d19ae57.1774463505.git.wen.yang%40linux.dev
patch subject: [RFC PATCH v5 2/2] sysctl: convert kernel/sysctl-test.c to use CTLTBL_ENTRY_XXX()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260331/202603310301.Ogh6kR6N-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310301.Ogh6kR6N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310301.Ogh6kR6N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sysctl-test.c:386:12: warning: implicit conversion from 'size_t' (aka 'unsigned long') to 'int' changes value from 18446744073709551615 to -1 [-Wconstant-conversion]
     386 |                 .table = CTLTBL_ENTRY_VNMH(ctltbl_str, "foo", 0644,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     387 |                                            proc_dostring),
         |                                            ~~~~~~~~~~~~~~
   include/linux/sysctl.h:413:2: note: expanded from macro 'CTLTBL_ENTRY_VNMH'
     413 |         __CTLTBL_ENTRY(__var, __name, __mode, __handler, NULL, NULL, -1)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:316:18: note: expanded from macro '__CTLTBL_ENTRY'
     312 | #define __CTLTBL_ENTRY(_var, _name, _mode, _handler, _min, _max, _maxlen) \
         |                                                                           ~
     313 | { \
     314 |         .procname     = __CTL_PROCNAME(_name),                          \
     315 |         .data         = __CTL_DATA(_var),                               \
     316 |         .maxlen       = __CTL_MAXLEN(_var, _maxlen),                    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:277:5: note: expanded from macro '__CTL_MAXLEN'
     277 |                                 __SYSCTL_MAXLEN_VAR(__var, __maxlen)    \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:264:21: note: expanded from macro '__SYSCTL_MAXLEN_VAR'
     264 |         ((__maxlen) >= 0 ? (size_t)(__maxlen) : (size_t)sizeof(__var))
         |                            ^~~~~~~~~~~~~~~~~~
   kernel/sysctl-test.c:376:12: warning: implicit conversion from 'size_t' (aka 'unsigned long') to 'int' changes value from 18446744073709551615 to -1 [-Wconstant-conversion]
     376 |                 .table = CTLTBL_ENTRY_V(ctltbl_bool),
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:347:2: note: expanded from macro 'CTLTBL_ENTRY_V'
     347 |         __CTLTBL_ENTRY(__var, #__var, 0444,                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     348 |                 __CTL_AUTO_HANDLER(__var), NULL, NULL, -1)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:316:18: note: expanded from macro '__CTLTBL_ENTRY'
     312 | #define __CTLTBL_ENTRY(_var, _name, _mode, _handler, _min, _max, _maxlen) \
         |                                                                           ~
     313 | { \
     314 |         .procname     = __CTL_PROCNAME(_name),                          \
     315 |         .data         = __CTL_DATA(_var),                               \
     316 |         .maxlen       = __CTL_MAXLEN(_var, _maxlen),                    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:277:5: note: expanded from macro '__CTL_MAXLEN'
     277 |                                 __SYSCTL_MAXLEN_VAR(__var, __maxlen)    \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:264:21: note: expanded from macro '__SYSCTL_MAXLEN_VAR'
     264 |         ((__maxlen) >= 0 ? (size_t)(__maxlen) : (size_t)sizeof(__var))
         |                            ^~~~~~~~~~~~~~~~~~
   kernel/sysctl-test.c:367:12: warning: implicit conversion from 'size_t' (aka 'unsigned long') to 'int' changes value from 18446744073709551615 to -1 [-Wconstant-conversion]
     367 |                 .table = CTLTBL_ENTRY_VMR(ctltbl_u8, 0644,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     368 |                                           &ctltbl_u8_min, &ctltbl_u8_max),
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:373:2: note: expanded from macro 'CTLTBL_ENTRY_VMR'
     373 |         __CTLTBL_ENTRY(__var, #__var, __mode,                           \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     374 |                 __CTL_AUTO_HANDLER_RANGE(__var), __min, __max, -1)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:316:18: note: expanded from macro '__CTLTBL_ENTRY'
     312 | #define __CTLTBL_ENTRY(_var, _name, _mode, _handler, _min, _max, _maxlen) \
         |                                                                           ~
     313 | { \
     314 |         .procname     = __CTL_PROCNAME(_name),                          \
     315 |         .data         = __CTL_DATA(_var),                               \
     316 |         .maxlen       = __CTL_MAXLEN(_var, _maxlen),                    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:277:5: note: expanded from macro '__CTL_MAXLEN'
     277 |                                 __SYSCTL_MAXLEN_VAR(__var, __maxlen)    \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:264:21: note: expanded from macro '__SYSCTL_MAXLEN_VAR'
     264 |         ((__maxlen) >= 0 ? (size_t)(__maxlen) : (size_t)sizeof(__var))
         |                            ^~~~~~~~~~~~~~~~~~
   kernel/sysctl-test.c:360:12: warning: implicit conversion from 'size_t' (aka 'unsigned long') to 'int' changes value from 18446744073709551615 to -1 [-Wconstant-conversion]
     360 |                 .table = CTLTBL_ENTRY_V(ctltbl_u8),
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:347:2: note: expanded from macro 'CTLTBL_ENTRY_V'
     347 |         __CTLTBL_ENTRY(__var, #__var, 0444,                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     348 |                 __CTL_AUTO_HANDLER(__var), NULL, NULL, -1)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:316:18: note: expanded from macro '__CTLTBL_ENTRY'
     312 | #define __CTLTBL_ENTRY(_var, _name, _mode, _handler, _min, _max, _maxlen) \
         |                                                                           ~
     313 | { \
     314 |         .procname     = __CTL_PROCNAME(_name),                          \
     315 |         .data         = __CTL_DATA(_var),                               \
     316 |         .maxlen       = __CTL_MAXLEN(_var, _maxlen),                    \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:277:5: note: expanded from macro '__CTL_MAXLEN'
     277 |                                 __SYSCTL_MAXLEN_VAR(__var, __maxlen)    \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:264:21: note: expanded from macro '__SYSCTL_MAXLEN_VAR'
     264 |         ((__maxlen) >= 0 ? (size_t)(__maxlen) : (size_t)sizeof(__var))
         |                            ^~~~~~~~~~~~~~~~~~
   kernel/sysctl-test.c:352:12: warning: implicit conversion from 'size_t' (aka 'unsigned long') to 'int' changes value from 18446744073709551615 to -1 [-Wconstant-conversion]
     352 |                 .table = CTLTBL_ENTRY_VNM(ctltbl_int, "my-sysctl", 0644),
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:398:2: note: expanded from macro 'CTLTBL_ENTRY_VNM'
     398 |         __CTLTBL_ENTRY(__var, __name, __mode,                           \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     399 |                 __CTL_AUTO_HANDLER(__var), NULL, NULL, -1)
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysctl.h:316:18: note: expanded from macro '__CTLTBL_ENTRY'
     312 | #define __CTLTBL_ENTRY(_var, _name, _mode, _handler, _min, _max, _maxlen) \
         |                                                                           ~


vim +386 kernel/sysctl-test.c

   318	
   319	static const struct ctltbl_param ctltbl_cases[] = {
   320		/* auto handler — int */
   321		{
   322			.desc  = "sysctl_test_api_ctltbl_entry_V_int",
   323			.table = CTLTBL_ENTRY_V(ctltbl_int),
   324			.expected = { .procname = "ctltbl_int", .mode = 0444,
   325				      .data = &ctltbl_int, .maxlen = sizeof(int),
   326				      .proc_handler = proc_dointvec },
   327		},
   328		{
   329			.desc  = "sysctl_test_api_ctltbl_entry_VM_int",
   330			.table = CTLTBL_ENTRY_VM(ctltbl_int, 0644),
   331			.expected = { .procname = "ctltbl_int", .mode = 0644,
   332				      .data = &ctltbl_int, .maxlen = sizeof(int),
   333				      .proc_handler = proc_dointvec },
   334		},
   335		{
   336			.desc  = "sysctl_test_api_ctltbl_entry_VMR_int",
   337			.table = CTLTBL_ENTRY_VMR(ctltbl_int, 0644,
   338						  SYSCTL_ZERO, SYSCTL_ONE_HUNDRED),
   339			.expected = { .procname = "ctltbl_int", .mode = 0644,
   340				      .data = &ctltbl_int, .maxlen = sizeof(int),
   341				      .proc_handler = proc_dointvec_minmax },
   342		},
   343		{
   344			.desc  = "sysctl_test_api_ctltbl_entry_VN_int",
   345			.table = CTLTBL_ENTRY_VN(ctltbl_int, "my-sysctl"),
   346			.expected = { .procname = "my-sysctl", .mode = 0444,
   347				      .data = &ctltbl_int, .maxlen = sizeof(int),
   348				      .proc_handler = proc_dointvec },
   349		},
   350		{
   351			.desc  = "sysctl_test_api_ctltbl_entry_VNM_int",
   352			.table = CTLTBL_ENTRY_VNM(ctltbl_int, "my-sysctl", 0644),
   353			.expected = { .procname = "my-sysctl", .mode = 0644,
   354				      .data = &ctltbl_int, .maxlen = sizeof(int),
   355				      .proc_handler = proc_dointvec },
   356		},
   357		/* auto handler — u8 */
   358		{
   359			.desc  = "sysctl_test_api_ctltbl_entry_V_u8",
   360			.table = CTLTBL_ENTRY_V(ctltbl_u8),
   361			.expected = { .procname = "ctltbl_u8", .mode = 0444,
   362				      .data = &ctltbl_u8, .maxlen = sizeof(u8),
   363				      .proc_handler = proc_dou8vec_minmax },
   364		},
   365		{
   366			.desc  = "sysctl_test_api_ctltbl_entry_VMR_u8",
   367			.table = CTLTBL_ENTRY_VMR(ctltbl_u8, 0644,
   368						  &ctltbl_u8_min, &ctltbl_u8_max),
   369			.expected = { .procname = "ctltbl_u8", .mode = 0644,
   370				      .data = &ctltbl_u8, .maxlen = sizeof(u8),
   371				      .proc_handler = proc_dou8vec_minmax },
   372		},
   373		/* auto handler — bool */
   374		{
   375			.desc  = "sysctl_test_api_ctltbl_entry_V_bool",
   376			.table = CTLTBL_ENTRY_V(ctltbl_bool),
   377			.expected = { .procname = "ctltbl_bool", .mode = 0444,
   378				      .data = &ctltbl_bool, .maxlen = sizeof(bool),
   379				      .proc_handler = proc_dobool },
   380		},
   381		/* VNMH — char[] cannot be auto-dispatched by _Generic (each char[N]
   382		 * is a distinct type); explicit handler is required for strings.
   383		 * .maxlen must be sizeof(array), not sizeof(char *). */
   384		{
   385			.desc  = "sysctl_test_api_ctltbl_entry_VNMH_string",
 > 386			.table = CTLTBL_ENTRY_VNMH(ctltbl_str, "foo", 0644,
   387						   proc_dostring),
   388			.expected = { .procname = "foo", .mode = 0644,
   389				      .data = ctltbl_str, .maxlen = sizeof(ctltbl_str),
   390				      .proc_handler = proc_dostring },
   391		},
   392	};
   393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
