Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E817B15BD
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 10:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652351596; x=1683887596;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j2jLl94ZVv6+GyAHgqDQMoLNb5is4/daKLdqORUvrdg=;
  b=HSUUTHSCgBKoW5wC0NH59wRiXOjDz/74sS1tS+psytTMGpv1pRUfUf5L
   oheXRnyyBBrDIkSgExAhN6enZfxvHJBCM+Ozmwls09BFxM7WRFTds3D9i
   LlxsOC6b/BMO2nfpx84yzKjhux7eV6wndoe6RKPzgBdjPDpoBLlUShNmr
   tm1io7ZkYGMGSF7G0JZRN+VybdgE35LYfqmdRm62ecHfiyHoLnIEG6+LN
   NEWW0KMffC94BA5ZDLuCRynii3kCp7/7NcvihJRJaTgYjZ+6hfpFb0HVb
   JFw4bHMgIR+0aLSn1d3AI5f7NGFKGBtwY4F6V/tFK3g+EAowrAr3zSRyi
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="267546258"
X-IronPort-AV: E=Sophos;i="5.91,219,1647327600"; 
   d="scan'208";a="267546258"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 03:33:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,219,1647327600"; 
   d="scan'208";a="711867159"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 May 2022 03:33:11 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1np686-000KIM-T5;
	Thu, 12 May 2022 10:33:10 +0000
Date: Thu, 12 May 2022 18:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: Markuss Broks <markuss.broks@gmail.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Markuss Broks <markuss.broks@gmail.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Song Qiang <songqiang1304521@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/5] proximity: vl53l0x: Prefer already initialized
 interrupt flags
Message-ID: <202205121820.qRBa5PNP-lkp@intel.com>
References: <20220511214718.50879-3-markuss.broks@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511214718.50879-3-markuss.broks@gmail.com>

Hi Markuss,

I love your patch! Yet something to improve:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on robh/for-next linux/master linus/master v5.18-rc6 next-20220511]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Markuss-Broks/Add-support-for-ToF-sensor-on-Yoshino-platform/20220512-054917
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
config: s390-randconfig-r032-20220509 (https://download.01.org/0day-ci/archive/20220512/202205121820.qRBa5PNP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/b4103f031e2c0265ae4f15f107341bcfc83008f0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Markuss-Broks/Add-support-for-ToF-sensor-on-Yoshino-platform/20220512-054917
        git checkout b4103f031e2c0265ae4f15f107341bcfc83008f0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/iio/proximity/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/iio/proximity/vl53l0x-i2c.c:60:18: error: call to undeclared function 'irq_get_trigger_type'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           int irq_flags = irq_get_trigger_type(client->irq);
                           ^
   1 error generated.


vim +/irq_get_trigger_type +60 drivers/iio/proximity/vl53l0x-i2c.c

    56	
    57	static int vl53l0x_configure_irq(struct i2c_client *client,
    58					 struct iio_dev *indio_dev)
    59	{
  > 60		int irq_flags = irq_get_trigger_type(client->irq);
    61		struct vl53l0x_data *data = iio_priv(indio_dev);
    62		int ret;
    63	
    64		if (!irq_flags)
    65			irq_flags = IRQF_TRIGGER_FALLING;
    66	
    67		ret = devm_request_irq(&client->dev, client->irq, vl53l0x_handle_irq,
    68				irq_flags, indio_dev->name, indio_dev);
    69		if (ret) {
    70			dev_err(&client->dev, "devm_request_irq error: %d\n", ret);
    71			return ret;
    72		}
    73	
    74		ret = i2c_smbus_write_byte_data(data->client,
    75				VL_REG_SYSTEM_INTERRUPT_CONFIG_GPIO,
    76				VL_REG_SYSTEM_INTERRUPT_GPIO_NEW_SAMPLE_READY);
    77		if (ret < 0)
    78			dev_err(&client->dev, "failed to configure IRQ: %d\n", ret);
    79	
    80		return ret;
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
