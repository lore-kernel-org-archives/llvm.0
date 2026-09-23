Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C9347534F;
	Wed, 23 Sep 2026 23:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790204575; cv=none; b=Gdajf38Tu9L5dDk4mZL4hWkubGM2qhDfoLkWGUWNw3L8xpKbMy6K+5RCmK1T/iVJqhSJFqHGT4tVydra0jSHqxFlvCiy31Dog96J33zL++NXP9te6xBP12FX+iaZk1SsECgoVa3OLzQN93AIZdmR7ikKNfoiinSPQkwQjkGmTKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790204575; c=relaxed/simple;
	bh=uAugRGH16wsmxqcx1FqDZnuGBAp7pwo//J+Mwq4oFEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osaonTi76xgyZ4+PcZVO7ZdrnIocsnPMsZfHYFBqTdtDWpyPp86Z5Xls0ftKoEXgrMaMlTBopyHUh9Dlpd5cAisboKgU0ir35pf4DjgOoRx3tuifz35aPUU99u4MUYN8VPujixYuw4rguxHdJAA4RuW6hrSYvTmI+pQ9oJoJISM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5/7ZiI3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5/7ZiI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790204574; x=1821740574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uAugRGH16wsmxqcx1FqDZnuGBAp7pwo//J+Mwq4oFEc=;
  b=d5/7ZiI3IGeg+ITowGCQQhzv9fVURtIExVItz6SnAJx86gzLVwCzRYnW
   4NTOoZjOFrpaoEdlUPDicpxpJzSiX79fAv3Sb/AOjEkLqNTTVtlhp3+O0
   cbyOIJwAFT3yIRihaB1sNb1KW4E9T0wP8VzBjU8ySzKrRN8KVRLAWgllm
   XIbOOndzHj8Jj20I5MXK7wg38V5BRx7uYRySug06i+FzS3h1rTMeVc5H8
   BDxbynOyipFJa5A5mfuEUIcvY1Z+O5lrf5S51WeOdWHR6vqOda7MThoPG
   QNfxfUpi7R01Kx2EFvb6zDvL1mjFETEl3Qoxnm9VDZw9zlDeiyHzTUPcC
   Q==;
X-CSE-ConnectionGUID: 5YJTbrHATR2hy9vyMBWusg==
X-CSE-MsgGUID: p0efD8v9SNWf8W2uKLVFdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93454289"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="93454289"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 16:02:51 -0700
X-CSE-ConnectionGUID: oPAwhSaNQ8OV80vqHZFIwg==
X-CSE-MsgGUID: tpjFAtejQumZhlCrR36mjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="273998590"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Sep 2026 16:02:49 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9VzC-00000000HvW-2OuA;
	Wed, 23 Sep 2026 23:02:46 +0000
Date: Thu, 24 Sep 2026 07:02:33 +0800
From: kernel test robot <lkp@intel.com>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+1075f6dc93f398c1857e@syzkaller.appspotmail.com
Subject: Re: [PATCH] Input: serio - don't sleep on serio_mutex from
 drvctl_store()
Message-ID: <202609240622.tn7TrVy2-lkp@intel.com>
References: <20260919124604.210505-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919124604.210505-1-ngocthang2710.1999@gmail.com>

Hi Nguyen,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus linus/master v7.3-rc4 next-20260922]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nguyen-Ngoc-Thang/Input-serio-don-t-sleep-on-serio_mutex-from-drvctl_store/20260919-194604
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20260919124604.210505-1-ngocthang2710.1999%40gmail.com
patch subject: [PATCH] Input: serio - don't sleep on serio_mutex from drvctl_store()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260924/202609240622.tn7TrVy2-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240622.tn7TrVy2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240622.tn7TrVy2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/serio/serio.c:361:38: error: call to undeclared function 'restart_syscall'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     361 |         scoped_cond_guard(mutex_try, return restart_syscall(), &serio_mutex) {
         |                                             ^
   1 error generated.


vim +/restart_syscall +361 drivers/input/serio/serio.c

   353	
   354	static ssize_t drvctl_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
   355	{
   356		struct serio *serio = to_serio_port(dev);
   357		struct device_driver *drv;
   358		int error;
   359	
   360		/* Port removal holds serio_mutex and drains us: don't wait for it. */
 > 361		scoped_cond_guard(mutex_try, return restart_syscall(), &serio_mutex) {
   362			if (!strncmp(buf, "none", count)) {
   363				serio_disconnect_port(serio);
   364			} else if (!strncmp(buf, "reconnect", count)) {
   365				serio_reconnect_subtree(serio);
   366			} else if (!strncmp(buf, "rescan", count)) {
   367				serio_disconnect_port(serio);
   368				serio_find_driver(serio);
   369				serio_remove_duplicate_events(serio, SERIO_RESCAN_PORT);
   370			} else if ((drv = driver_find(buf, &serio_bus)) != NULL) {
   371				serio_disconnect_port(serio);
   372				error = serio_bind_driver(serio, to_serio_driver(drv));
   373				serio_remove_duplicate_events(serio, SERIO_RESCAN_PORT);
   374				if (error)
   375					return error;
   376			} else {
   377				return -EINVAL;
   378			}
   379		}
   380	
   381		return count;
   382	}
   383	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
