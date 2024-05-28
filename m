Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953722940D;
	Tue, 28 May 2024 23:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716939175; cv=none; b=AkODyWc8J1ghiwTgATKywR+F82trLKB3A5QvxR6okNzvSi43h4yU2jSRQG52HUZZ+3ONjbXQdBJOMt9U0syd1NSh50f50vy6hmceODbbyNb4j+ToP1+ykRjXVd2Dpg4jfBT59WWQtKI7Z6MsrD4bWJ8NW93Lok1PAFvB75Orfp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716939175; c=relaxed/simple;
	bh=ufvN3pUNYe6Q1J3ne+40KdYJEK72jHy1xBPQYxwB9ag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UrcsFuNSocHVLz1iYeDM80Rf0qFCtjdj8VX/KTYMZwQjvSB1CMosn1lTktdPMSkflSCvmaRYF8JGCPHzhgpDWZIsf8E8iftuqQIrNRzRCXrkNRO0qWZ1e1mojj4Th+N3J6eAzy4qRsNfTTE8kjQUnFggghFD5z5N5NTNH9CWOi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWkhNHiQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWkhNHiQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716939173; x=1748475173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ufvN3pUNYe6Q1J3ne+40KdYJEK72jHy1xBPQYxwB9ag=;
  b=LWkhNHiQ+1IVee00/xev4SPkUAs/fSfDaUcmT4Nhw0v/0dzP14q9VVM+
   96sU8TfEiCat6aNR2h8smUbrW+tpGUfkSi38iudzQuYAYTU2M1IF7V15q
   a1X6RofVYZ6yZ7GHj+u+MEFFMhGlOj3g7TmKbDYh5SFHNYc7sf8XyW8+s
   Qsr5xVZpAzuJfTBVHNMByQWjKIQ0Q1ScWLEfSA4odI4bZITUQsAdYSE+u
   By5Yyae4RUJTPYTALiJEvEojR1KbuAFzUtyzNn6X+QGHsl3un8Wg5OyPR
   C2skvFX1I/eHPbkVNRPe1XqoUmTz1Dy8Dkn87AKIvRCWByjoWpXYJHT0W
   A==;
X-CSE-ConnectionGUID: xZy/WbOVS1+hx/0NEQa8sg==
X-CSE-MsgGUID: cyD+VYF/Qt+UG25CrcZLeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30842627"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="30842627"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 16:32:53 -0700
X-CSE-ConnectionGUID: h4U7aXMRRK+yxMFoN4oBtg==
X-CSE-MsgGUID: M08j/SeDQhmJ2M/X9iQvoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="35302320"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 May 2024 16:32:51 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC6JF-000Cs8-0t;
	Tue, 28 May 2024 23:32:49 +0000
Date: Wed, 29 May 2024 07:31:56 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/gicv3-nmi-prio 4/4] drivers/irqchip/irq-gic-v3.c:40:43:
 error: use of undeclared identifier 'GICV3_PRIO_IRQ'
Message-ID: <202405290702.U3dhwDww-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/gicv3-nmi-prio
head:   3c0651daca34ea67b809bd2ef412779c94517811
commit: 3c0651daca34ea67b809bd2ef412779c94517811 [4/4] WIP: irqchip/gic-v3: choose priorities at boot time
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240529/202405290702.U3dhwDww-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290702.U3dhwDww-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290702.U3dhwDww-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v3.c:40:43: error: use of undeclared identifier 'GICV3_PRIO_IRQ'
   static u8 dist_prio_irq __ro_after_init = GICV3_PRIO_IRQ;
                                             ^
>> drivers/irqchip/irq-gic-v3.c:41:43: error: use of undeclared identifier 'GICV3_PRIO_NMI'
   static u8 dist_prio_nmi __ro_after_init = GICV3_PRIO_NMI;
                                             ^
   drivers/irqchip/irq-gic-v3.c:825:36: error: use of undeclared identifier 'GICV3_PRIO_NMI'
           return unlikely(gic_read_rpr() == GICV3_PRIO_NMI);
                                             ^
   3 errors generated.


vim +/GICV3_PRIO_IRQ +40 drivers/irqchip/irq-gic-v3.c

    39	
  > 40	static u8 dist_prio_irq __ro_after_init = GICV3_PRIO_IRQ;
  > 41	static u8 dist_prio_nmi __ro_after_init = GICV3_PRIO_NMI;
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
