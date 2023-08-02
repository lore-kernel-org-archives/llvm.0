Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D656FC2;
	Wed,  2 Aug 2023 10:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13D3C433C8;
	Wed,  2 Aug 2023 10:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690972203;
	bh=icrV2iWRYzGOijkbBaIBlJibB5TFzlCFeWs5f2CsTTo=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=sYsFzPQqcNsntpoOjd9mf5FvrwB7vth5AHO6tLzHCeFz4UmLFIB7g83sgZicqLhCw
	 WXOKGs9fcc/z5fn7Wj2E/biMUZL3TUJbuCqNGuh5NeGmtxrEmSAvC0jXRjcNZ9RXn+
	 fVesafQD8AUtthxmhCmEDdsJQJOmZ8yUazgtAsRcLXcBdVwLQCIgXBb5115McNpnrw
	 3ciiXnRYnzvAElwR/YPARbPV+PbvBQuJljcrZflevdjFZgIh5K9MEilHc3Hy82njQF
	 JJJfyIyQH9Xouwawv46fCNMhTgkQ8FE9dS42+q7n6v7HA85/cEYQAweBe3DO4bVJjT
	 KQSEXHKwfyNYg==
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Aug 2023 13:29:59 +0300
Message-Id: <CUHZM83XY8SR.26DNCWK3OYNG0@suppilovahvero>
Subject: Re: [jarkko-tpmdd:next 2/2] drivers/char/tpm/tpm-interface.c:284:5:
 error: conflicting types for 'tpm_pcr_read'
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "kernel test robot" <lkp@intel.com>, "Tom Rix" <trix@redhat.com>
Cc: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
X-Mailer: aerc 0.14.0
References: <202308021728.fOa8AzbO-lkp@intel.com>
In-Reply-To: <202308021728.fOa8AzbO-lkp@intel.com>

On Wed Aug 2, 2023 at 12:13 PM EEST, kernel test robot wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.=
git next
> head:   d7f8088ec1a42c58d8cafdde40077db04608c497
> commit: d7f8088ec1a42c58d8cafdde40077db04608c497 [2/2] sysctl: set variab=
le key_sysctls storage-class-specifier to static
> config: i386-randconfig-r026-20230801 (https://download.01.org/0day-ci/ar=
chive/20230802/202308021728.fOa8AzbO-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git =
ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021728=
.fOa8AzbO-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308021728.fOa8AzbO-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from drivers/char/tpm/tpm-sysfs.c:16:
>    In file included from drivers/char/tpm/tpm.h:28:
>    include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' s=
et but not used [-Wunused-but-set-variable]
>            int mapping_size;
>                ^
> >> drivers/char/tpm/tpm-sysfs.c:368:42: error: too few arguments to funct=
ion call, expected 4, have 3
>            rc =3D tpm_pcr_read(chip, ha->pcr, &digest);
>                 ~~~~~~~~~~~~                       ^
>    include/linux/tpm.h:427:12: note: 'tpm_pcr_read' declared here
>    extern int tpm_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
>               ^
>    1 warning and 1 error generated.
> --
>    In file included from drivers/char/tpm/tpm-interface.c:28:
>    include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' s=
et but not used [-Wunused-but-set-variable]
>            int mapping_size;
>                ^
> >> drivers/char/tpm/tpm-interface.c:284:5: error: conflicting types for '=
tpm_pcr_read'
>    int tpm_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
>        ^
>    include/linux/tpm.h:427:12: note: previous declaration is here
>    extern int tpm_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
>               ^
>    1 warning and 1 error generated.
> --
>    In file included from drivers/char/tpm/tpm2-cmd.c:14:
>    In file included from drivers/char/tpm/tpm.h:28:
>    include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' s=
et but not used [-Wunused-but-set-variable]
>            int mapping_size;
>                ^
> >> drivers/char/tpm/tpm2-cmd.c:161:5: error: conflicting types for 'tpm2_=
pcr_read'
>    int tpm2_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
>        ^
>    drivers/char/tpm/tpm.h:291:5: note: previous declaration is here
>    int tpm2_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
>        ^
>    1 warning and 1 error generated.
>
>
> vim +/tpm_pcr_read +284 drivers/char/tpm/tpm-interface.c
>
> 954650efb79f99 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2015-05-3=
0  275 =20
> 659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-0=
2  276  /**
> aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-0=
5  277   * tpm_pcr_read - read a PCR value from SHA1 bank
> aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-0=
5  278   * @chip:	a &struct tpm_chip instance, %NULL for the default chip
> aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-0=
5  279   * @pcr_idx:	the PCR to be retrieved
> 879b589210a9a0 drivers/char/tpm/tpm-interface.c Roberto Sassu   2019-02-0=
6  280   * @digest:	the PCR bank and buffer current PCR value is written to
> 659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-0=
2  281   *
> aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-0=
5  282   * Return: same as with tpm_transmit_cmd()
> 659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-0=
2  283   */
> 879b589210a9a0 drivers/char/tpm/tpm-interface.c Roberto Sassu   2019-02-0=
6 @284  int tpm_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
> 879b589210a9a0 drivers/char/tpm/tpm-interface.c Roberto Sassu   2019-02-0=
6  285  		 struct tpm_digest *digest)
> 659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-0=
2  286  {
> 659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-0=
2  287  	int rc;
> 659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-0=
2  288 =20
> fc1d52b745bae6 drivers/char/tpm/tpm-interface.c Stefan Berger   2018-06-2=
6  289  	chip =3D tpm_find_get_ops(chip);
> aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-0=
5  290  	if (!chip)
> 659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-0=
2  291  		return -ENODEV;
> d4a31756320716 drivers/char/tpm/tpm-interface.c Tomas Winkler   2018-10-1=
9  292 =20
> 7a1d7e6dd76a20 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2014-12-1=
2  293  	if (chip->flags & TPM_CHIP_FLAG_TPM2)
> 879b589210a9a0 drivers/char/tpm/tpm-interface.c Roberto Sassu   2019-02-0=
6  294  		rc =3D tpm2_pcr_read(chip, pcr_idx, digest, NULL);
> 7a1d7e6dd76a20 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2014-12-1=
2  295  	else
> 879b589210a9a0 drivers/char/tpm/tpm-interface.c Roberto Sassu   2019-02-0=
6  296  		rc =3D tpm1_pcr_read(chip, pcr_idx, digest->digest);
> d4a31756320716 drivers/char/tpm/tpm-interface.c Tomas Winkler   2018-10-1=
9  297 =20
> 4e26195f240d73 drivers/char/tpm/tpm-interface.c Jason Gunthorpe 2016-02-1=
2  298  	tpm_put_ops(chip);
> 659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-0=
2  299  	return rc;
> 659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-0=
2  300  }
> 659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-0=
2  301  EXPORT_SYMBOL_GPL(tpm_pcr_read);
> 659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-0=
2  302 =20
>
> :::::: The code at line 284 was first introduced by commit
> :::::: 879b589210a9a0c9f77d301aaf0ddee20f2c5052 tpm: retrieve digest size=
 of unknown algorithms with PCR read
>
> :::::: TO: Roberto Sassu <roberto.sassu@huawei.com>
> :::::: CC: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
>
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Sorry I messed up my next branch, now it is fixed.

BR, Jarkko
