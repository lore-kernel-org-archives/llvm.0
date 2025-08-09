Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F6E185E7F;
	Sat,  9 Aug 2025 15:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754755109; cv=none; b=W+Mp+TqGd2w7loBdLkBRSSjKwYiJfpg1dLYYaxukZecGvV/jdBNOiXHdk6JWHWS3isfJ24A/9j9AM73hKABUC4BUJMLa/ST5BNKS2N0iue3atkprYAwknHkIDf6t/3CDVXHuV3Ia0iQsVrq4DQoCZE4yD04BAWRmflRXMm2KqUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754755109; c=relaxed/simple;
	bh=8oMqUQcCj7807xg8q4FugL5aneXJXllnEIM5FfRg0kA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iNeFgNVrFP18i+eWRMSeVAAD1uDDYZL8BSt4qiDRJXIcEuNRb65tDQJjAIC7/k+8C4bhOcnvNuGV3DZRqbRc1rObTPwyexiQayuDFCamF/Uny2ve0hyFNQEU9c5hyEWPFkY84bOXssRUAoNKv56PMPrHKvyVep1ISmJM5nLejkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=co06f0tl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="co06f0tl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754755108; x=1786291108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8oMqUQcCj7807xg8q4FugL5aneXJXllnEIM5FfRg0kA=;
  b=co06f0tlZn8l2hbaWjCA3Mh9A5iO0FQqhd6pMy4TydP2BLWR/bXYTJYS
   kEm4JkUJzew0MXY6PKQoMRrORfMa1nWSPTFqRZBS0zHrRJlwYZ3PGtZlg
   2H30x+kwnNB0bmUKXLxdIKtTjYrZGdNOz1+3mQgGFMZOWXaNUExU+nldd
   QIbFLsLrm6BhLTSxZOfeUhEqapuxuIeFlhLsOO9LsiBsadyTjf3Ms+Nwo
   5KWqu0TQzPOoYFCaFWJQCwK536JPp5zwpZCO4KQSiUNL213NxxeJdnswM
   ULR01lOaPsU9AAp5yrMg7NiRhojwPgrsE3tS/0TJyDsqD5YhopfSVLf9P
   Q==;
X-CSE-ConnectionGUID: 6RR24PiLSlyGvqZ/wpwIOQ==
X-CSE-MsgGUID: gsndcvgNTz2z8m1fUGNpOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="60876413"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="60876413"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 08:58:27 -0700
X-CSE-ConnectionGUID: cXeVYyzCStqPMSUY3n7Xag==
X-CSE-MsgGUID: A5IBsZwxTgmXkbVaIOoWlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="170913817"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 09 Aug 2025 08:58:26 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uklxf-0002pb-1S;
	Sat, 09 Aug 2025 15:58:23 +0000
Date: Sat, 9 Aug 2025 17:57:32 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:to_build 21/21] drivers/mfd/ezx-pcap.c:197:11:
 error: call to undeclared function 'gpio_get_value'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202508091701.AhFNLKOZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git to_build
head:   c0a2b3cd5b78ddb721e53baf675d7164a118bc2d
commit: c0a2b3cd5b78ddb721e53baf675d7164a118bc2d [21/21] gpiolib: turn off legacy interface by default
config: sparc64-randconfig-2005-20250809 (https://download.01.org/0day-ci/archive/20250809/202508091701.AhFNLKOZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7d886fab74d4037d654d02bed24dd97c0ba863d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091701.AhFNLKOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508091701.AhFNLKOZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mfd/ezx-pcap.c:197:11: error: call to undeclared function 'gpio_get_value'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     197 |         } while (gpio_get_value(pdata->gpio));
         |                  ^
   drivers/mfd/ezx-pcap.c:197:11: note: did you mean 'gpiod_get_value'?
   include/linux/gpio/consumer.h:117:5: note: 'gpiod_get_value' declared here
     117 | int gpiod_get_value(const struct gpio_desc *desc);
         |     ^
   1 error generated.


vim +/gpio_get_value +197 drivers/mfd/ezx-pcap.c

13a09f93d2bf3a Daniel Ribeiro            2009-05-28  170  
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  171  static void pcap_isr_work(struct work_struct *work)
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  172  {
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  173  	struct pcap_chip *pcap = container_of(work, struct pcap_chip, isr_work);
334a41ce9b753e Jingoo Han                2013-07-30  174  	struct pcap_platform_data *pdata = dev_get_platdata(&pcap->spi->dev);
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  175  	u32 msr, isr, int_sel, service;
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  176  	int irq;
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  177  
b1148fd46c248c Daniel Ribeiro            2009-06-23  178  	do {
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  179  		ezx_pcap_read(pcap, PCAP_REG_MSR, &msr);
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  180  		ezx_pcap_read(pcap, PCAP_REG_ISR, &isr);
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  181  
25985edcedea63 Lucas De Marchi           2011-03-30  182  		/* We can't service/ack irqs that are assigned to port 2 */
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  183  		if (!(pdata->config & PCAP_SECOND_PORT)) {
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  184  			ezx_pcap_read(pcap, PCAP_REG_INT_SEL, &int_sel);
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  185  			isr &= ~int_sel;
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  186  		}
b1148fd46c248c Daniel Ribeiro            2009-06-23  187  
b1148fd46c248c Daniel Ribeiro            2009-06-23  188  		ezx_pcap_write(pcap, PCAP_REG_MSR, isr | msr);
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  189  		ezx_pcap_write(pcap, PCAP_REG_ISR, isr);
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  190  
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  191  		service = isr & ~msr;
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  192  		for (irq = pcap->irq_base; service; service >>= 1, irq++) {
73a6839fdb7f3f Thomas Gleixner           2011-03-25  193  			if (service & 1)
83d9b7e3955d32 Sebastian Andrzej Siewior 2022-02-11  194  				generic_handle_irq_safe(irq);
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  195  		}
b1148fd46c248c Daniel Ribeiro            2009-06-23  196  		ezx_pcap_write(pcap, PCAP_REG_MSR, pcap->msr);
59ee93a528b94e Arnd Bergmann             2012-08-05 @197  	} while (gpio_get_value(pdata->gpio));
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  198  }
13a09f93d2bf3a Daniel Ribeiro            2009-05-28  199  

:::::: The code at line 197 was first introduced by commit
:::::: 59ee93a528b94ef4e81a08db252b0326feff171f ARM: pxa: remove irq_to_gpio from ezx-pcap driver

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
