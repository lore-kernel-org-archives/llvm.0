Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB425683;
	Wed,  2 Aug 2023 09:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690967604; x=1722503604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WfqMuBHjS0VmzVBVwBU9mQqaIU1uBAtlpGcHaJAJwLs=;
  b=h4+rXcAQfJc7we+Z0zdbizVdm10G0eM0wymN5CRvvZyJvTeyo/QoK+2g
   XQT9ZVbHkKhLMHJ5aGN7JtZxcq8IJKs+S37so9sazqM1BLLcclpPaJ2NH
   pc2oqBdERblv+bohBshZm1QLKJjXpVs9W55SM9JOx7ETajV/DU74x9dvR
   VNecL2D/T9lGi0VsHxcVhEdetagh8j6X8V4vBudtOMLLU1UvoyWjidQpZ
   NDTz05aWfTbGTUo+ynJ9dQz8dyzlnN/9e2ri3BXp1S/9K9VOuURXlLqAC
   MHGhM9tGc23iunQDkcZ9NhbfxklqxKDW5YIzXNnS2cPKTO+QwiMkE/KGP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="368430461"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="368430461"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 02:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="1059751925"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="1059751925"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Aug 2023 02:13:21 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qR7uy-000147-37;
	Wed, 02 Aug 2023 09:13:20 +0000
Date: Wed, 2 Aug 2023 17:13:05 +0800
From: kernel test robot <lkp@intel.com>
To: Tom Rix <trix@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:next 2/2] drivers/char/tpm/tpm-interface.c:284:5:
 error: conflicting types for 'tpm_pcr_read'
Message-ID: <202308021728.fOa8AzbO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git next
head:   d7f8088ec1a42c58d8cafdde40077db04608c497
commit: d7f8088ec1a42c58d8cafdde40077db04608c497 [2/2] sysctl: set variable key_sysctls storage-class-specifier to static
config: i386-randconfig-r026-20230801 (https://download.01.org/0day-ci/archive/20230802/202308021728.fOa8AzbO-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021728.fOa8AzbO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021728.fOa8AzbO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm-sysfs.c:16:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
           int mapping_size;
               ^
>> drivers/char/tpm/tpm-sysfs.c:368:42: error: too few arguments to function call, expected 4, have 3
           rc = tpm_pcr_read(chip, ha->pcr, &digest);
                ~~~~~~~~~~~~                       ^
   include/linux/tpm.h:427:12: note: 'tpm_pcr_read' declared here
   extern int tpm_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
              ^
   1 warning and 1 error generated.
--
   In file included from drivers/char/tpm/tpm-interface.c:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
           int mapping_size;
               ^
>> drivers/char/tpm/tpm-interface.c:284:5: error: conflicting types for 'tpm_pcr_read'
   int tpm_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
       ^
   include/linux/tpm.h:427:12: note: previous declaration is here
   extern int tpm_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
              ^
   1 warning and 1 error generated.
--
   In file included from drivers/char/tpm/tpm2-cmd.c:14:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
           int mapping_size;
               ^
>> drivers/char/tpm/tpm2-cmd.c:161:5: error: conflicting types for 'tpm2_pcr_read'
   int tpm2_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
       ^
   drivers/char/tpm/tpm.h:291:5: note: previous declaration is here
   int tpm2_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
       ^
   1 warning and 1 error generated.


vim +/tpm_pcr_read +284 drivers/char/tpm/tpm-interface.c

954650efb79f99 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2015-05-30  275  
659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  276  /**
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  277   * tpm_pcr_read - read a PCR value from SHA1 bank
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  278   * @chip:	a &struct tpm_chip instance, %NULL for the default chip
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  279   * @pcr_idx:	the PCR to be retrieved
879b589210a9a0 drivers/char/tpm/tpm-interface.c Roberto Sassu   2019-02-06  280   * @digest:	the PCR bank and buffer current PCR value is written to
659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  281   *
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  282   * Return: same as with tpm_transmit_cmd()
659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  283   */
879b589210a9a0 drivers/char/tpm/tpm-interface.c Roberto Sassu   2019-02-06 @284  int tpm_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
879b589210a9a0 drivers/char/tpm/tpm-interface.c Roberto Sassu   2019-02-06  285  		 struct tpm_digest *digest)
659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  286  {
659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  287  	int rc;
659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  288  
fc1d52b745bae6 drivers/char/tpm/tpm-interface.c Stefan Berger   2018-06-26  289  	chip = tpm_find_get_ops(chip);
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  290  	if (!chip)
659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  291  		return -ENODEV;
d4a31756320716 drivers/char/tpm/tpm-interface.c Tomas Winkler   2018-10-19  292  
7a1d7e6dd76a20 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2014-12-12  293  	if (chip->flags & TPM_CHIP_FLAG_TPM2)
879b589210a9a0 drivers/char/tpm/tpm-interface.c Roberto Sassu   2019-02-06  294  		rc = tpm2_pcr_read(chip, pcr_idx, digest, NULL);
7a1d7e6dd76a20 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2014-12-12  295  	else
879b589210a9a0 drivers/char/tpm/tpm-interface.c Roberto Sassu   2019-02-06  296  		rc = tpm1_pcr_read(chip, pcr_idx, digest->digest);
d4a31756320716 drivers/char/tpm/tpm-interface.c Tomas Winkler   2018-10-19  297  
4e26195f240d73 drivers/char/tpm/tpm-interface.c Jason Gunthorpe 2016-02-12  298  	tpm_put_ops(chip);
659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  299  	return rc;
659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  300  }
659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  301  EXPORT_SYMBOL_GPL(tpm_pcr_read);
659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  302  

:::::: The code at line 284 was first introduced by commit
:::::: 879b589210a9a0c9f77d301aaf0ddee20f2c5052 tpm: retrieve digest size of unknown algorithms with PCR read

:::::: TO: Roberto Sassu <roberto.sassu@huawei.com>
:::::: CC: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
