Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3F618C322;
	Wed,  9 Oct 2024 08:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463906; cv=none; b=JkLaM2CRj11gQKnH9FXqVFFy8A5lNVzJw1rZb2k5rTtRxxNusqeqYirvFl6Va0IJ9+4awcNlEbUA355jelzR6Haos+uufqxuOc9f8QzGwHu5kW3itqDzRhqKQPNky9b7oZu7F4c57ETwbXX4bPMrwj78wyhG7QirY4aBE1ppyqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463906; c=relaxed/simple;
	bh=cVzlW9XzqOJKWJPIM8hjgHkAlSZH7W84lA6wCrhOJXk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VQ9DgV3biUX3PJaWA7siQpU+iOmLTfkxKYJlbzUuwJ2qRs875lUCaRPsurKlhYHHTWP0X1lT14hMQnBuZEDpxJ9Rou40nQRce7EnNVXCWZMTaTyA++E2/IM9os2mPBjhaynwzt/g/Tub6013336DTXGLTmsAW5Jn8gDX6SLov9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CitejcST; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CitejcST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728463905; x=1759999905;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cVzlW9XzqOJKWJPIM8hjgHkAlSZH7W84lA6wCrhOJXk=;
  b=CitejcSTfDv8mzi4KUdDzT8zFfI1Qj0jW+oADL1pT0PV4kKc/IW+8Bac
   ZTgIBQPIFxbnh5+dCQyAbQQ9+xR4Twjwg16nCpFwrO7ZhSsiwyeK39EMQ
   +DEIg693tO91PS2svi0Lj6OPBA8X+geOtEkUBQ/yDzjCde3VnvU/88mNB
   0vh0REA3RaQcEoz5NQgTPqnA+RFP1zDqtpYWlMnXBp6uue7T0qyYSHHyD
   O3q/KPTf4/Ubiy/pMySYAlquQuaUXEZ4rdqxNlEYUVoySKzW5aaQ9XoQG
   PGoFQFprqYiqgTMUZGGfxKzea8QVnY2VvpgDTUgIWKenEa0UYEgvIcBmc
   g==;
X-CSE-ConnectionGUID: SOzDCl2TQM+Ha5KsZpemEQ==
X-CSE-MsgGUID: JT3TVhwdTTatTqoDQieSNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="39104255"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="39104255"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 01:51:44 -0700
X-CSE-ConnectionGUID: qvjEl37ARkCpT4HpxJQwRQ==
X-CSE-MsgGUID: Z+XIBQurR9mssjukKa/a/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="76057807"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Oct 2024 01:51:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sySQ0-00091A-2w;
	Wed, 09 Oct 2024 08:51:40 +0000
Date: Wed, 9 Oct 2024 16:51:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 1936/2853] drivers/hid/hid-core.o: warning:
 objtool: hid_scan_report+0x1e5: sibling call from callable instruction with
 modified stack frame
Message-ID: <202410091654.50IJV143-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Benjamin Tissoires <bentiss@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33ce24234fca4c083e6685a18b460a18ebb5d5c1
commit: 61595012f28036a58293df5a2ab75f80ca15c327 [1936/2853] HID: simplify code in fetch_item()
config: x86_64-randconfig-004-20241009 (https://download.01.org/0day-ci/archive/20241009/202410091654.50IJV143-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410091654.50IJV143-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410091654.50IJV143-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-core.o: warning: objtool: hid_open_report() falls through to next function hid_parser_main()
>> drivers/hid/hid-core.o: warning: objtool: hid_scan_report+0x1e5: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
