Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE384653C;
	Fri, 31 May 2024 19:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717183681; cv=none; b=pplI1HJSJbCQUNS1UFkqCsobdaIh2H78Mqd0LmHSQiMoUbovTs3vS5sKT6MMYY/Oa0ie/wqraqgRuiv8Ql7hXHVcGRXVMQND3YjI7BKt8Pu6wNCARCRQgSGDxH4QxLPx3DU6+rH9T+CYPxmByOFNT//p7MNGuJK9hZ88Jdy/maI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717183681; c=relaxed/simple;
	bh=8/yWNoZLdZDQcadJeXDpKrSB4RsVw7uh0LQCfqxtg34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eouj2zJAp6ltWJBw+JW/NAkP84omKbJNF3fYR9Lf/DenuLlhvUQ9MAWlQfurqVo/UT6EZ/qxzERspIw8XOcDKSQctmJY0ZwNYkeXlI2UhhhmAakmd1l17fG5JbAtyGyPUUBdcwxRIvFdssCifTU5mgTwkRY+ak3cIrjY9PSVXOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QL7qPu4A; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QL7qPu4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717183680; x=1748719680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8/yWNoZLdZDQcadJeXDpKrSB4RsVw7uh0LQCfqxtg34=;
  b=QL7qPu4AHfcAow7Dyb/hosT8N5WdVT6+ESDr55KSR7nF3zrkYxm7iPHd
   NwTjYia130EcwK0pAyUYVLlzpssGqLJl4OLsNv2xLcGvqbswJTPuVdHja
   tvd/m/l168aTQuU4oNh6jch9QiJLfLdGigC8aBfqKiVY5JLJwSoSK7mq3
   WPqjRMaF1aZn7J9fm30LCyajFmYF29Mlboebo9yo/EcejVqPEzyOoqjZO
   QPKdSITjHL0pua90qtSPQdhe/dtV2zO5sJAWvMq2uUR5jb7NxiYx4wAgD
   8yNYQvVDL17wRIEO+lNdi9FJQ2JXvOH8M9i49vPRr97s4kpqXSwWjooKM
   g==;
X-CSE-ConnectionGUID: 0YR1GFkoQu2l+llDmmFt9g==
X-CSE-MsgGUID: WBASUqsXS8yZcpvSxXRdoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="16695364"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="16695364"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 12:27:59 -0700
X-CSE-ConnectionGUID: YCWjb3cRR26tACuoh4CCyQ==
X-CSE-MsgGUID: t7fYoT+XQjKJ9GD1o83lnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="41172513"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 31 May 2024 12:27:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD7ut-000His-11;
	Fri, 31 May 2024 19:27:55 +0000
Date: Sat, 1 Jun 2024 03:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Snowberg <eric.snowberg@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/8] clavis: Introduce a new system keyring called
 clavis
Message-ID: <202406010310.ki9XX61z-lkp@intel.com>
References: <20240531003945.44594-3-eric.snowberg@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531003945.44594-3-eric.snowberg@oracle.com>

Hi Eric,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Snowberg/certs-Introduce-ability-to-link-to-a-system-key/20240531-084602
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240531003945.44594-3-eric.snowberg%40oracle.com
patch subject: [RFC PATCH v2 2/8] clavis: Introduce a new system keyring called clavis
config: x86_64-randconfig-073-20240601 (https://download.01.org/0day-ci/archive/20240601/202406010310.ki9XX61z-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010310.ki9XX61z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010310.ki9XX61z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/clavis/clavis_keyring.c:83:13: warning: no previous prototype for function 'late_init_clavis_setup' [-Wmissing-prototypes]
      83 | void __init late_init_clavis_setup(void)
         |             ^
   security/clavis/clavis_keyring.c:83:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      83 | void __init late_init_clavis_setup(void)
         | ^
         | static 
   1 warning generated.


vim +/late_init_clavis_setup +83 security/clavis/clavis_keyring.c

    82	
  > 83	void __init late_init_clavis_setup(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
