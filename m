Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8DD2F5B;
	Tue, 14 Oct 2025 06:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760422988; cv=none; b=UWt8YqVCKgDFwybNlP1t3U4ZoiQydGyRJAqGWmxW+gJHSUyE03KwWPFc9Y1lIsrM2xsEqBJgyQ1lkpxTviwr7R5OMh6eTcNX2vSMFYQzp9lgIiaXxcbEceo6fvUm3VkuJGwF8bkva4Th7ftf5zXq1PaEsKUcc4Bv0Ok8qbFY800=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760422988; c=relaxed/simple;
	bh=spEB/JZzmHRISZA5+DzeisY5WNvPanwayUFvcSqKhCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kj+qDdgMhRkfcqR0KspWodVaENaho+oBP2AkKRK7kIi7M+vYprYSI6o3MtUbByk4LNOC/og6zRVSCvFrG5CIGe0EnN+fOu1hVv7JWAzyeu7xrHnH/73hby2c89Kp5UWxfzIV0PJr0aeAu/Fc4kKS76JPX6iYCvXyQeMUnkAFW1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SygXpIYl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SygXpIYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760422986; x=1791958986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=spEB/JZzmHRISZA5+DzeisY5WNvPanwayUFvcSqKhCE=;
  b=SygXpIYlnNlfayOoyp8rKUkSkACJ4sG1fQBpjCz/csgH4Fy31mNJi7Vq
   OpXxfqy46gilXJhrBgjVJWlCc13bvS/9dfmf3VfUmMC5dD1xoKnpS6npv
   hMGRME/2bep2J9APEkVCYbLUKRAP/CAZ349We1LOiP8LcW/yROecA344N
   nrL+qD17D9iNwy/bdP5ksths1mJjeot8tOUKH6I0kWFBL34Ma14SfiDS/
   lkLSigVP2rtOBdf313l6TqnXp7RaeWDi7a3hyd3vJ4SGxoK5xkKG2Z19h
   1sm0+QpLObHdFP5+MdafFsFs0acn21znrT40FpvzCzhB7AiCDVAwL37lw
   g==;
X-CSE-ConnectionGUID: g9f2iz1FQW2JQ9CTYD5zYA==
X-CSE-MsgGUID: 4D8q2ndFR2WfqTjsnsH8jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73177472"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="73177472"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 23:23:05 -0700
X-CSE-ConnectionGUID: hJDGKLnsRO2TlxJXCQ73cw==
X-CSE-MsgGUID: wV9pJmOrSTivKsIapCSF4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="187098682"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 13 Oct 2025 23:23:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8YQz-0002Sh-2J;
	Tue, 14 Oct 2025 06:22:59 +0000
Date: Tue, 14 Oct 2025 14:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: Eugene Korenevsky <ekorenevsky@aliyun.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] cifs: parse_dfs_referrals: prevent oob on malformed input
Message-ID: <202510141458.JVIIgm7M-lkp@intel.com>
References: <aO1HYr97mEwWZWkB@localhost.localdomain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO1HYr97mEwWZWkB@localhost.localdomain>

Hi Eugene,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cifs/for-next]
[also build test WARNING on linus/master v6.18-rc1 next-20251013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugene-Korenevsky/cifs-parse_dfs_referrals-prevent-oob-on-malformed-input/20251014-024102
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
patch link:    https://lore.kernel.org/r/aO1HYr97mEwWZWkB%40localhost.localdomain
patch subject: [PATCH] cifs: parse_dfs_referrals: prevent oob on malformed input
config: i386-randconfig-011-20251014 (https://download.01.org/0day-ci/archive/20251014/202510141458.JVIIgm7M-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510141458.JVIIgm7M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510141458.JVIIgm7M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/misc.c:922:25: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     921 |                          "%s: header is malformed (size is %u, must be %lu)\n",
         |                                                                        ~~~
         |                                                                        %u
     922 |                          __func__, rsp_size, sizeof(*rsp));
         |                                              ^~~~~~~~~~~~
   fs/smb/client/cifs_debug.h:77:36: note: expanded from macro 'cifs_dbg'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                                           ~~~    ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:66:23: note: expanded from macro 'cifs_dbg_func'
      65 |                 pr_debug_ ## ratefunc("%s: " fmt,                       \
         |                                              ~~~
      66 |                                       __FILE__, ##__VA_ARGS__);         \
         |                                                   ^~~~~~~~~~~
   include/linux/printk.h:691:38: note: expanded from macro 'pr_debug_once'
     691 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                     ~~~     ^~~~~~~~~~~
   include/linux/printk.h:135:18: note: expanded from macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ~~~    ^~~~~~~~~~~
>> fs/smb/client/misc.c:922:25: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     921 |                          "%s: header is malformed (size is %u, must be %lu)\n",
         |                                                                        ~~~
         |                                                                        %u
     922 |                          __func__, rsp_size, sizeof(*rsp));
         |                                              ^~~~~~~~~~~~
   fs/smb/client/cifs_debug.h:77:36: note: expanded from macro 'cifs_dbg'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                                           ~~~    ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:68:38: note: expanded from macro 'cifs_dbg_func'
      68 |                 pr_err_ ## ratefunc("VFS: " fmt, ##__VA_ARGS__);        \
         |                                             ~~~    ^~~~~~~~~~~
   include/linux/printk.h:668:38: note: expanded from macro 'pr_err_once'
     668 |         printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                     ~~~     ^~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/once_lite.h:31:9: note: expanded from macro 'DO_ONCE_LITE_IF'
      31 |                         func(__VA_ARGS__);                              \
         |                              ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> fs/smb/client/misc.c:922:25: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     921 |                          "%s: header is malformed (size is %u, must be %lu)\n",
         |                                                                        ~~~
         |                                                                        %u
     922 |                          __func__, rsp_size, sizeof(*rsp));
         |                                              ^~~~~~~~~~~~
   fs/smb/client/cifs_debug.h:77:36: note: expanded from macro 'cifs_dbg'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                                           ~~~    ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:70:32: note: expanded from macro 'cifs_dbg_func'
      70 |                 pr_debug_ ## ratefunc(fmt, ##__VA_ARGS__);              \
         |                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:691:38: note: expanded from macro 'pr_debug_once'
     691 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                     ~~~     ^~~~~~~~~~~
   include/linux/printk.h:135:18: note: expanded from macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ~~~    ^~~~~~~~~~~
>> fs/smb/client/misc.c:922:25: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     921 |                          "%s: header is malformed (size is %u, must be %lu)\n",
         |                                                                        ~~~
         |                                                                        %u
     922 |                          __func__, rsp_size, sizeof(*rsp));
         |                                              ^~~~~~~~~~~~
   fs/smb/client/cifs_debug.h:79:43: note: expanded from macro 'cifs_dbg'
      79 |                 cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
         |                                                  ~~~    ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:66:23: note: expanded from macro 'cifs_dbg_func'
      65 |                 pr_debug_ ## ratefunc("%s: " fmt,                       \
         |                                              ~~~
      66 |                                       __FILE__, ##__VA_ARGS__);         \
         |                                                   ^~~~~~~~~~~
   include/linux/printk.h:756:38: note: expanded from macro 'pr_debug_ratelimited'
     756 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                     ~~~     ^~~~~~~~~~~
   include/linux/printk.h:135:18: note: expanded from macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ~~~    ^~~~~~~~~~~
>> fs/smb/client/misc.c:922:25: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     921 |                          "%s: header is malformed (size is %u, must be %lu)\n",
         |                                                                        ~~~
         |                                                                        %u
     922 |                          __func__, rsp_size, sizeof(*rsp));
         |                                              ^~~~~~~~~~~~
   fs/smb/client/cifs_debug.h:79:43: note: expanded from macro 'cifs_dbg'
      79 |                 cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
         |                                                  ~~~    ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:68:38: note: expanded from macro 'cifs_dbg_func'
      68 |                 pr_err_ ## ratefunc("VFS: " fmt, ##__VA_ARGS__);        \
         |                                             ~~~    ^~~~~~~~~~~
   include/linux/printk.h:720:45: note: expanded from macro 'pr_err_ratelimited'
     720 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                            ~~~     ^~~~~~~~~~~
   include/linux/printk.h:706:17: note: expanded from macro 'printk_ratelimited'
     706 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> fs/smb/client/misc.c:922:25: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     921 |                          "%s: header is malformed (size is %u, must be %lu)\n",
         |                                                                        ~~~
         |                                                                        %u
     922 |                          __func__, rsp_size, sizeof(*rsp));
         |                                              ^~~~~~~~~~~~
   fs/smb/client/cifs_debug.h:79:43: note: expanded from macro 'cifs_dbg'
      79 |                 cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
         |                                                  ~~~    ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:70:32: note: expanded from macro 'cifs_dbg_func'
      70 |                 pr_debug_ ## ratefunc(fmt, ##__VA_ARGS__);              \
         |                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:756:38: note: expanded from macro 'pr_debug_ratelimited'
     756 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                     ~~~     ^~~~~~~~~~~
   include/linux/printk.h:135:18: note: expanded from macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ~~~    ^~~~~~~~~~~
   fs/smb/client/misc.c:940:5: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     938 |                          "%s: malformed buffer (size is %u, must be at least %lu)\n",
         |                                                                              ~~~
         |                                                                              %u
     939 |                          __func__, rsp_size,
     940 |                          sizeof(*rsp) + *num_of_nodes * sizeof(REFERRAL3));
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifs_debug.h:77:36: note: expanded from macro 'cifs_dbg'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                                           ~~~    ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:66:23: note: expanded from macro 'cifs_dbg_func'
      65 |                 pr_debug_ ## ratefunc("%s: " fmt,                       \
         |                                              ~~~
      66 |                                       __FILE__, ##__VA_ARGS__);         \
         |                                                   ^~~~~~~~~~~
   include/linux/printk.h:691:38: note: expanded from macro 'pr_debug_once'
     691 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                     ~~~     ^~~~~~~~~~~
   include/linux/printk.h:135:18: note: expanded from macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ~~~    ^~~~~~~~~~~
   fs/smb/client/misc.c:940:5: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     938 |                          "%s: malformed buffer (size is %u, must be at least %lu)\n",
         |                                                                              ~~~
         |                                                                              %u
     939 |                          __func__, rsp_size,
     940 |                          sizeof(*rsp) + *num_of_nodes * sizeof(REFERRAL3));
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifs_debug.h:77:36: note: expanded from macro 'cifs_dbg'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                                           ~~~    ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:68:38: note: expanded from macro 'cifs_dbg_func'
      68 |                 pr_err_ ## ratefunc("VFS: " fmt, ##__VA_ARGS__);        \
         |                                             ~~~    ^~~~~~~~~~~
   include/linux/printk.h:668:38: note: expanded from macro 'pr_err_once'
     668 |         printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                     ~~~     ^~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/once_lite.h:31:9: note: expanded from macro 'DO_ONCE_LITE_IF'
      31 |                         func(__VA_ARGS__);                              \
         |                              ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   fs/smb/client/misc.c:940:5: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     938 |                          "%s: malformed buffer (size is %u, must be at least %lu)\n",
         |                                                                              ~~~
         |                                                                              %u
     939 |                          __func__, rsp_size,
     940 |                          sizeof(*rsp) + *num_of_nodes * sizeof(REFERRAL3));
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifs_debug.h:77:36: note: expanded from macro 'cifs_dbg'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                                           ~~~    ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:70:32: note: expanded from macro 'cifs_dbg_func'
      70 |                 pr_debug_ ## ratefunc(fmt, ##__VA_ARGS__);              \
         |                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:691:38: note: expanded from macro 'pr_debug_once'
     691 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                                     ~~~     ^~~~~~~~~~~
   include/linux/printk.h:135:18: note: expanded from macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ~~~    ^~~~~~~~~~~
   fs/smb/client/misc.c:940:5: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     938 |                          "%s: malformed buffer (size is %u, must be at least %lu)\n",
         |                                                                              ~~~
         |                                                                              %u
     939 |                          __func__, rsp_size,
     940 |                          sizeof(*rsp) + *num_of_nodes * sizeof(REFERRAL3));
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/smb/client/cifs_debug.h:79:43: note: expanded from macro 'cifs_dbg'
      79 |                 cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
         |                                                  ~~~    ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:66:23: note: expanded from macro 'cifs_dbg_func'
      65 |                 pr_debug_ ## ratefunc("%s: " fmt,                       \
         |                                              ~~~
      66 |                                       __FILE__, ##__VA_ARGS__);         \
         |                                                   ^~~~~~~~~~~
   include/linux/printk.h:756:38: note: expanded from macro 'pr_debug_ratelimited'
     756 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)


vim +922 fs/smb/client/misc.c

   901	
   902	/* parses DFS referral V3 structure
   903	 * caller is responsible for freeing target_nodes
   904	 * returns:
   905	 * - on success - 0
   906	 * - on failure - errno
   907	 */
   908	int
   909	parse_dfs_referrals(struct get_dfs_referral_rsp *rsp, u32 rsp_size,
   910			    unsigned int *num_of_nodes,
   911			    struct dfs_info3_param **target_nodes,
   912			    const struct nls_table *nls_codepage, int remap,
   913			    const char *searchName, bool is_unicode)
   914	{
   915		int i, rc = 0;
   916		char *data_end;
   917		struct dfs_referral_level_3 *ref;
   918	
   919		if (rsp_size < sizeof(*rsp)) {
   920			cifs_dbg(VFS | ONCE,
   921				 "%s: header is malformed (size is %u, must be %lu)\n",
 > 922				 __func__, rsp_size, sizeof(*rsp));
   923			rc = -EINVAL;
   924			goto parse_DFS_referrals_exit;
   925		}
   926	
   927		*num_of_nodes = le16_to_cpu(rsp->NumberOfReferrals);
   928	
   929		if (*num_of_nodes < 1) {
   930			cifs_dbg(VFS | ONCE, "%s: [path=%s] num_referrals must be at least > 0, but we got %d\n",
   931				 __func__, searchName, *num_of_nodes);
   932			rc = -ENOENT;
   933			goto parse_DFS_referrals_exit;
   934		}
   935	
   936		if (sizeof(*rsp) + *num_of_nodes * sizeof(REFERRAL3) > rsp_size) {
   937			cifs_dbg(VFS | ONCE,
   938				 "%s: malformed buffer (size is %u, must be at least %lu)\n",
   939				 __func__, rsp_size,
   940				 sizeof(*rsp) + *num_of_nodes * sizeof(REFERRAL3));
   941			rc = -EINVAL;
   942			goto parse_DFS_referrals_exit;
   943		}
   944	
   945		ref = (struct dfs_referral_level_3 *) &(rsp->referrals);
   946		if (ref->VersionNumber != cpu_to_le16(3)) {
   947			cifs_dbg(VFS, "Referrals of V%d version are not supported, should be V3\n",
   948				 le16_to_cpu(ref->VersionNumber));
   949			rc = -EINVAL;
   950			goto parse_DFS_referrals_exit;
   951		}
   952	
   953		/* get the upper boundary of the resp buffer */
   954		data_end = (char *)rsp + rsp_size;
   955	
   956		cifs_dbg(FYI, "num_referrals: %d dfs flags: 0x%x ...\n",
   957			 *num_of_nodes, le32_to_cpu(rsp->DFSFlags));
   958	
   959		*target_nodes = kcalloc(*num_of_nodes, sizeof(struct dfs_info3_param),
   960					GFP_KERNEL);
   961		if (*target_nodes == NULL) {
   962			rc = -ENOMEM;
   963			goto parse_DFS_referrals_exit;
   964		}
   965	
   966		/* collect necessary data from referrals */
   967		for (i = 0; i < *num_of_nodes; i++) {
   968			char *temp;
   969			int max_len;
   970			struct dfs_info3_param *node = (*target_nodes)+i;
   971	
   972			node->flags = le32_to_cpu(rsp->DFSFlags);
   973			if (is_unicode) {
   974				__le16 *tmp = kmalloc(strlen(searchName)*2 + 2,
   975							GFP_KERNEL);
   976				if (tmp == NULL) {
   977					rc = -ENOMEM;
   978					goto parse_DFS_referrals_exit;
   979				}
   980				cifsConvertToUTF16((__le16 *) tmp, searchName,
   981						   PATH_MAX, nls_codepage, remap);
   982				node->path_consumed = cifs_utf16_bytes(tmp,
   983						le16_to_cpu(rsp->PathConsumed),
   984						nls_codepage);
   985				kfree(tmp);
   986			} else
   987				node->path_consumed = le16_to_cpu(rsp->PathConsumed);
   988	
   989			node->server_type = le16_to_cpu(ref->ServerType);
   990			node->ref_flag = le16_to_cpu(ref->ReferralEntryFlags);
   991	
   992			/* copy DfsPath */
   993			temp = (char *)ref + le16_to_cpu(ref->DfsPathOffset);
   994			max_len = data_end - temp;
   995			node->path_name = cifs_strndup_from_utf16(temp, max_len,
   996							is_unicode, nls_codepage);
   997			if (!node->path_name) {
   998				rc = -ENOMEM;
   999				goto parse_DFS_referrals_exit;
  1000			}
  1001	
  1002			/* copy link target UNC */
  1003			temp = (char *)ref + le16_to_cpu(ref->NetworkAddressOffset);
  1004			max_len = data_end - temp;
  1005			node->node_name = cifs_strndup_from_utf16(temp, max_len,
  1006							is_unicode, nls_codepage);
  1007			if (!node->node_name) {
  1008				rc = -ENOMEM;
  1009				goto parse_DFS_referrals_exit;
  1010			}
  1011	
  1012			node->ttl = le32_to_cpu(ref->TimeToLive);
  1013	
  1014			ref++;
  1015		}
  1016	
  1017	parse_DFS_referrals_exit:
  1018		if (rc) {
  1019			free_dfs_info_array(*target_nodes, *num_of_nodes);
  1020			*target_nodes = NULL;
  1021			*num_of_nodes = 0;
  1022		}
  1023		return rc;
  1024	}
  1025	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
