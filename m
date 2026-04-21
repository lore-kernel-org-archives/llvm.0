Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8F5351C03;
	Tue, 21 Apr 2026 19:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776800019; cv=none; b=jqJuDK9Zy0L6H4eCBD1gtB0bHV8td2isaef+OyFBZo3v6OD4PBQaxkCu2qYzNttnk+yo5+T3495u/Lf0hLKV9Z6qJoyKQZwJ20jB2No7FMTLIVAFUYkSNToQ30g02IjT06oUxDvASX84HoiQNaFaWWnP9mHNKCWr+/KQFo+c8NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776800019; c=relaxed/simple;
	bh=EodzOw099fBLPHA+FoPk6IybrQpy3PL/jN5TTS/wIZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTt8HazJidbLI7GkbreqehITtqDA6A+uI5ZQ4v9QNprKJGZA+jCgron3E0RV2cO4GoxUQFl2Rjqn0pbY++ZJqW4FELT/w1l4xxzxiwCZW/6j963ZPA2L8mXgJA4NXCeEO5C+9QrwH5AY0Z692istIyCX24EnKBrPo1gjj6kbTrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsr413GM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsr413GM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776800018; x=1808336018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EodzOw099fBLPHA+FoPk6IybrQpy3PL/jN5TTS/wIZM=;
  b=gsr413GMcPuqhEEQRdDSnqCVD/fGg4KzYs0sgdrtqBUBoQls8JGrv2If
   rZ/IC6dHdVPKp46QkXeGYnxEhLiKG6am5HRjxkQvvnK7hJ6nQSteMSY6p
   WU/9Hmr9Gvn5tC47P8MDyvJi+yX6b6w80dMZS4Gp35ntzMV3Jhv1G/bCW
   SC2IeBGx3Kv157k1WgvIekX7WKkW2yqAkBqfMl8JB/MM/hEnxgg7PB3Az
   CuBRjVDzx000N5y95cFyEWmexXQSLy58diA4D0jqb+RS2UCcQxilVOMym
   el/VKnLbYAVTLuQ2bXTducFgKTz1+8Naq8MM5JXPXr/U27X+TJbyqpdrX
   g==;
X-CSE-ConnectionGUID: zxJykClSTeOqmwIQVOWGAw==
X-CSE-MsgGUID: fGehl0qWQPOzKI58xIDwpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="76780799"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="76780799"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 12:33:37 -0700
X-CSE-ConnectionGUID: ljT4FAQ4RNGrLowVQzmhyw==
X-CSE-MsgGUID: 0Yl7qQdVRAutyyQJGhYAig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="233904186"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Apr 2026 12:33:35 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFGqi-000000003u8-3I28;
	Tue, 21 Apr 2026 19:33:32 +0000
Date: Wed, 22 Apr 2026 03:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: zhaoguohan@kylinos.cn, jgross@suse.com, sstabellini@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, GuoHan Zhao <zhaoguohan@kylinos.cn>
Subject: Re: [PATCH] xen/manage: unwind partial shutdown watcher setup on
 error
Message-ID: <202604220332.2gWBxnrF-lkp@intel.com>
References: <20260407022443.12971-1-zhaoguohan@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407022443.12971-1-zhaoguohan@kylinos.cn>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.0]
[cannot apply to xen-tip/linux-next linus/master next-20260421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoguohan-kylinos-cn/xen-manage-unwind-partial-shutdown-watcher-setup-on-error/20260416-185003
base:   v7.0
patch link:    https://lore.kernel.org/r/20260407022443.12971-1-zhaoguohan%40kylinos.cn
patch subject: [PATCH] xen/manage: unwind partial shutdown watcher setup on error
config: arm64-randconfig-001-20260421 (https://download.01.org/0day-ci/archive/20260422/202604220332.2gWBxnrF-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604220332.2gWBxnrF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604220332.2gWBxnrF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/xen/manage.c:380:1: warning: unused label 'err_unregister_shutdown' [-Wunused-label]
     380 | err_unregister_shutdown:
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/err_unregister_shutdown +380 drivers/xen/manage.c

   353	
   354		for (idx = 0; idx < ARRAY_SIZE(shutdown_handlers); idx++) {
   355			if (!shutdown_handlers[idx].flag)
   356				continue;
   357			snprintf(node, FEATURE_PATH_SIZE, "feature-%s",
   358				 shutdown_handlers[idx].command);
   359			err = xenbus_printf(XBT_NIL, "control", node, "%u", 1);
   360			if (err) {
   361				pr_err("%s: Error %d writing %s\n", __func__,
   362					err, node);
   363				goto err_remove_features;
   364			}
   365		}
   366	
   367		return 0;
   368	
   369	err_remove_features:
   370		while (--idx >= 0) {
   371			if (!shutdown_handlers[idx].flag)
   372				continue;
   373			snprintf(node, FEATURE_PATH_SIZE, "feature-%s",
   374				 shutdown_handlers[idx].command);
   375			xenbus_rm(XBT_NIL, "control", node);
   376		}
   377	#ifdef CONFIG_MAGIC_SYSRQ
   378		unregister_xenbus_watch(&sysrq_watch);
   379	#endif
 > 380	err_unregister_shutdown:
   381		unregister_xenbus_watch(&shutdown_watch);
   382		return err;
   383	}
   384	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
