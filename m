Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41356748E;
	Mon, 21 Aug 2023 23:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692662189; x=1724198189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u04jyXkmuGXu5YF2ziLU3+PkXmbptgCxiwLItCi0SX8=;
  b=RqolW9nvsrMn2g5J03hWwkCY13HysFEocFKazeYR7pbLDixbc6tjytlj
   Rajl2t331vbvTq1GFcJvRlxOT17B6kJopzV3HTTb4BkKu4wBrFqOlgsES
   0w3lE6eruEgdHYY8cCuFEdrWy9zna0KRhiaRh8oZNBPIfu4JCw14QqW6i
   VecaSoxA1/VAOsRWRW7oFaZ3e8TQO/ZiUq5RTymfj8+dJ8az9F6cnkfXg
   bFlmFdWylm99HO1fZ40mgp5mIJaTVr3Pm9eeHrhQ0OdoSA3tlK6m7HGwS
   A9q8P8I61iUFl8x8ohL1wqZIVGwbQ1FxQXC8+/3L7oCitxRQfH7IpN2Vs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="440100600"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="440100600"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 16:56:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="685838329"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="685838329"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 Aug 2023 16:56:27 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYEks-00014u-32;
	Mon, 21 Aug 2023 23:56:21 +0000
Date: Tue, 22 Aug 2023 07:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm_buf 19/22] drivers/char/tpm/tpm-interface.c:362:
 warning: Function parameter or member 'length' not described in 'tpm_send'
Message-ID: <202308220753.4SmhBjcU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm_buf
head:   0cc7499219745d3654fee78abcfb1ccf0051738b
commit: 96ca71c8cb2d9fff4f7a64135ff7380a770a6e49 [19/22] tpm: Store TPM buffer length
config: arm-randconfig-001-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220753.4SmhBjcU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220753.4SmhBjcU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220753.4SmhBjcU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/tpm-interface.c:362: warning: Function parameter or member 'length' not described in 'tpm_send'
>> drivers/char/tpm/tpm-interface.c:362: warning: Excess function parameter 'cmdlen' description in 'tpm_send'
--
>> drivers/char/tpm/tpm-buf.c:51: warning: Function parameter or member 'buf' not described in 'tpm_buf_length'


vim +362 drivers/char/tpm/tpm-interface.c

659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  352  
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  353  /**
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  354   * tpm_send - send a TPM command
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  355   * @chip:	a &struct tpm_chip instance, %NULL for the default chip
96ca71c8cb2d9f drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2023-08-11  356   * @data:	command blob
96ca71c8cb2d9f drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2023-08-11  357   * @cmdlen:	length of the command
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  358   *
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  359   * Return: same as with tpm_transmit_cmd()
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  360   */
96ca71c8cb2d9f drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2023-08-11  361  int tpm_send(struct tpm_chip *chip, void *data, size_t length)
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23 @362  {
412eb585587a1d drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2018-10-26  363  	struct tpm_buf buf;
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23  364  	int rc;
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23  365  
fc1d52b745bae6 drivers/char/tpm/tpm-interface.c Stefan Berger   2018-06-26  366  	chip = tpm_find_get_ops(chip);
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  367  	if (!chip)
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23  368  		return -ENODEV;
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23  369  
96ca71c8cb2d9f drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2023-08-11  370  	buf.flags = 0;
96ca71c8cb2d9f drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2023-08-11  371  	buf.length = length;
96ca71c8cb2d9f drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2023-08-11  372  	buf.data = data;
47a6c28b6861b1 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2018-11-05  373  	rc = tpm_transmit_cmd(chip, &buf, 0, "attempting to a send a command");
e13cd21ffd50a0 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2019-09-16  374  
4e26195f240d73 drivers/char/tpm/tpm-interface.c Jason Gunthorpe 2016-02-12  375  	tpm_put_ops(chip);
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23  376  	return rc;
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23  377  }
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23  378  EXPORT_SYMBOL_GPL(tpm_send);
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23  379  

:::::: The code at line 362 was first introduced by commit
:::::: c749ba912e87ccebd674ae24b97462176c63732e key: add tpm_send command

:::::: TO: Mimi Zohar <zohar@linux.vnet.ibm.com>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
