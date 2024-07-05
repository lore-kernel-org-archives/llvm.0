Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C922579;
	Fri,  5 Jul 2024 04:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720152111; cv=none; b=WcXhjHWKKHz+nV9OK/hQhuuYaK+k9riQ2j9OzPFIz9vPc/bCnIYi/1k1eertrAWjf8riBXPlob2jK7z/jzBmckOkWl9G5GqzMydTzB0//UK9/eWtRgFoterBhAomGwQyHx4EO8s/xdtk74GsBduVUYINBIwUbgAfCZaifhRM6Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720152111; c=relaxed/simple;
	bh=NqL4n89B/TP8Uw3KyjX9X3KoHq8ErIoWEbz92ytgSAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XAGwU2Ue0jWs/tyqulaTDRXLNzNDS81zGRC56++zal3nBH8SWBwtTORXI3l3n2kgv8gOa6zpYRZ8EZEZ501EyBtpwTLSGPA8azRDNWXJ209YQAxcyS8mBub1yFgjvs+Edeka3hmaspG2k1gDEiIawPgV77UzPZc13fXz8WyurLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6nvB/ic; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6nvB/ic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720152109; x=1751688109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NqL4n89B/TP8Uw3KyjX9X3KoHq8ErIoWEbz92ytgSAM=;
  b=n6nvB/icA5xbBIRND5+04n8f98fcRUq5ItBR5vKhD/zkWvk7yiSYbEfp
   U8k8x8fa6VsIFcfgvMdt9tDl5aQsc2EXM0CpCDj9MnZ0qUP/DTeVD8eY7
   ix8Md9T4xSD+kYL2gy+3A7SzOOE2RmoovirI0a3chBKSF+65J/mtHimuy
   nNKiiyGJATzIDoJnHYkbMyGJqZfHIW6ZQVyMBo9sIjFYb9FrJQja5OeBC
   UOqHojHtWeZTeM76//28KW7loshScSFR+eI9CXnpk7bBCy/pg9yj0cadJ
   +tcy3h45yk6BesN9w9tspkMMLTwkSOZGO7ZpurP5bfORHAWd1qPJihWyn
   g==;
X-CSE-ConnectionGUID: /KB0xer2Q7OYVu6e1DCyIg==
X-CSE-MsgGUID: gQYTugIiTlO23gpLZ7aBFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17304552"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="17304552"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 21:01:47 -0700
X-CSE-ConnectionGUID: xXyjZ3BhTHaJylICo66ysg==
X-CSE-MsgGUID: wx52re6nTaiUu/fzrk4XkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46542220"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jul 2024 21:01:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPa8m-000Rsu-0J;
	Fri, 05 Jul 2024 04:01:44 +0000
Date: Fri, 5 Jul 2024 12:01:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5016/10451] kernel/trace/trace.c:7534:37: error:
 unused variable 'last_boot_fops'
Message-ID: <202407051111.QCsntkxN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 7a1d1e4b9639ff08b2f42605c2950ae1ba4a43bf [5016/10451] tracing/ring-buffer: Add last_boot_info file to boot instance
config: x86_64-sof-customedconfig-amd-defconfig (https://download.01.org/0day-ci/archive/20240705/202407051111.QCsntkxN-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051111.QCsntkxN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051111.QCsntkxN-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace.c:2229:19: error: unused function 'run_tracer_selftest' [-Werror,-Wunused-function]
    2229 | static inline int run_tracer_selftest(struct tracer *type)
         |                   ^~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace.c:7534:37: error: unused variable 'last_boot_fops' [-Werror,-Wunused-const-variable]
    7534 | static const struct file_operations last_boot_fops = {
         |                                     ^~~~~~~~~~~~~~
   2 errors generated.


vim +/last_boot_fops +7534 kernel/trace/trace.c

  7533	
> 7534	static const struct file_operations last_boot_fops = {
  7535		.open		= tracing_open_generic_tr,
  7536		.read		= tracing_last_boot_read,
  7537		.llseek		= generic_file_llseek,
  7538		.release	= tracing_release_generic_tr,
  7539	};
  7540	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
