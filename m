Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395957CF1F;
	Thu,  8 Feb 2024 13:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707400371; cv=none; b=SzOdKFd4nowhMdIPa3EnG26559fJk+fyo5cwgpfDoplZI5JwZsOqgEFA5LsRY4PQIns64BLNSwVtbkQRJkfQdMXPyccTmgQTNFPhQLVTCQzcoPs+iurW9ZEF/bQPI7Kz8QzPg7OVF0c6/F4fwnfxyx4sax+p6iXH4CdIQrlpsCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707400371; c=relaxed/simple;
	bh=9xl/xf5Zm2xj1VG07G8QhuS3IcaSc1uWPaXLLQ05TAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pS5Kpqc7+8ylzW0d6aOP6htxNZVxejIH5qrjYK7Sj3B7RJ09OedX56DZkZSjCqxn8hr/+VLunyDULlldTlICmLewbt3hCiWEkLjhp8uG7dHimCoL+b6UVZtfqYkVcs3UVzl6yjm4aClVvzsoDUEz9jaFrwoSCxchkv98+FyVH2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=epH+nkwh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epH+nkwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707400367; x=1738936367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9xl/xf5Zm2xj1VG07G8QhuS3IcaSc1uWPaXLLQ05TAw=;
  b=epH+nkwhKGKjCz/j7FI+fFYl8G5W9o+AEl4qKnIJWEus3L59xBjVMni5
   2wN/7eBDLDLOmfFXbhjh7GgYIW/drwcxVaUdMVagl14PMsNlzR+0U9Qrq
   cGXkfR9lOg3dutgTKiPyyKwRH+7NeOGmk8VO3M65INpTgbJrZHlcMGBsm
   vKXNx9hxTdFrGBKGEElirCYQ28wNT6vjU1BQLTOqeLNgsillqM9N2BzBb
   YHt1grogBhcDgoB8qFZ8cSPHd5pvSAe7WzeFoXj7hkWfcxQhrdqVZuL9W
   r1fuzjxAh2cW8DwGHHsskwueiLzPFQ3uiYdwqEOsu8u5pDaezLSq89efG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="5001933"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="5001933"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 05:52:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6283423"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Feb 2024 05:52:43 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY4pU-0003n6-0i;
	Thu, 08 Feb 2024 13:52:40 +0000
Date: Thu, 8 Feb 2024 21:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/fam0-next20240207 1/1]
 ./usr/include/linux/seg6_hmac.h:12:17: warning: field 'tlvhdr' with variable
 sized type 'struct sr6_tlv' not at the end of a struct or class is a GNU
 extension
Message-ID: <202402082103.XZKY73Gh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/fam0-next20240207
head:   8fbd8ae9e6d71833931c62ad11ca636ccb833387
commit: 8fbd8ae9e6d71833931c62ad11ca636ccb833387 [1/1] treewide: Replace zero-length arrays with flex-array members
config: i386-randconfig-013-20240208 (https://download.01.org/0day-ci/archive/20240208/202402082103.XZKY73Gh-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402082103.XZKY73Gh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402082103.XZKY73Gh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/seg6_hmac.h:12:17: warning: field 'tlvhdr' with variable sized type 'struct sr6_tlv' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
      12 |         struct sr6_tlv tlvhdr;
         |                        ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
