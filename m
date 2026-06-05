Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C376E410D30;
	Fri,  5 Jun 2026 06:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780642455; cv=none; b=WA/xrsFKZ6z/cChqzvXdeGA0JtEakvNUvLoLwOr784bCH3C8gZqyBjbNqLc1DpsnmSIxbXqUu/bCC0qIsh+OFoeGvqYKFRCizbwFUMdTkxRAeOPJZZhCrC8eQuF2jWkX2XFRP6EEFostD2fiaRtuhwPndi+q8jTRnTimQZtd+Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780642455; c=relaxed/simple;
	bh=Bfhxyeh0I+nLYaM2G8L9iOBrMI/5fCXfZhtYUW4UmJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRLAOcsYGOKBZHE2+4zcXWzFBqOAFHOZYvPLv7sWZzICwYG4u1KXUl1OjEaTbzvq0HotSCPu6I+5EqbrIVM4i4Jc3KYsPV0oZHzZ4p0gCS8sIINEkwAslJ2O9P9UaErUEUm8r2mnmHNre+CkxsiuXi5Fi3fRgHAtze1d+anlDLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6Xgq5kk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6Xgq5kk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780642454; x=1812178454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bfhxyeh0I+nLYaM2G8L9iOBrMI/5fCXfZhtYUW4UmJY=;
  b=J6Xgq5kklws8g8/3b5+KYtlQa9T9dvORb0OhvF9yDCbo+0m+sld+PYpt
   uY3irBSxmLRAQA+8Pc0g5uBjifZ+uSC0R0oe4b+ZbttipPrRwcAIzRfJx
   pNsv6FVRe1Do9wsNDOS2QLGsxLySoye6/QumnNNnrZZdzMftqH5dsFNf6
   U8glVMH4Qedtqrs6PRRlYtOgydJzwSe/Ku7ocPz2gez8kzePEhbV+LTPQ
   tFLpP9WTEnCg3kMiaDgYM/DcRGAUk4T4mc5wSDC3ddPtvqLHReMn/YhDm
   9+5T8tB0mMg0ElW07OdUCQU0/3TzSk5K/+KfFMAhAuu8sF6z6KA36PX1J
   w==;
X-CSE-ConnectionGUID: XbyS7aJSQROu7k6P11tCPA==
X-CSE-MsgGUID: WeWYZ3upTPy+I7oYB4bopA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81474440"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81474440"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 23:54:14 -0700
X-CSE-ConnectionGUID: igsVH0E/Q920RoFFPu5r2g==
X-CSE-MsgGUID: Mv2TdVCjQlahbFrWexy6Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="238412207"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jun 2026 23:54:10 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVORU-000000002Uv-18Ka;
	Fri, 05 Jun 2026 06:54:08 +0000
Date: Fri, 5 Jun 2026 08:54:01 +0200
From: kernel test robot <lkp@intel.com>
To: Adam Young <admiyo@os.amperecomputing.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>, Len Brown <lenb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-acpi@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Huisong Li <lihuisong@huawei.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v01] mailbox/pcc.c:  add query channel function
Message-ID: <202606050825.2uv1FZrY-lkp@intel.com>
References: <20260604203749.168752-1-admiyo@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604203749.168752-1-admiyo@os.amperecomputing.com>

Hi Adam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jassibrar-mailbox/for-next]
[also build test WARNING on rafael-pm/linux-next rafael-pm/bleeding-edge soc/for-next linus/master v6.16-rc1 next-20260604]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adam-Young/mailbox-pcc-c-add-query-channel-function/20260605-044323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20260604203749.168752-1-admiyo%40os.amperecomputing.com
patch subject: [PATCH v01] mailbox/pcc.c:  add query channel function
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260605/202606050825.2uv1FZrY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050825.2uv1FZrY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050825.2uv1FZrY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mailbox/pcc.c:358 function parameter 'q_chan' not described in 'pcc_mbox_query_channel'
>> Warning: drivers/mailbox/pcc.c:358 function parameter 'subspace_id' not described in 'pcc_mbox_query_channel'
>> Warning: drivers/mailbox/pcc.c:358 function parameter 'q_chan' not described in 'pcc_mbox_query_channel'
>> Warning: drivers/mailbox/pcc.c:358 function parameter 'subspace_id' not described in 'pcc_mbox_query_channel'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
