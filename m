Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28DC2F29
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 14:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643812326; x=1675348326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v3aLHoe8SF3yWsYVZzRl5M96PSKGbJ0p82qUxrK2yeE=;
  b=fF9OIXmsgEIEmeJK3Y17Oq8JWE6vNDcxLYfkvs+uKh2o35CjDfj1yhXY
   RbOBTtAGfDhGZztHzA3yImKnDqNYrfC/G1Fs7HGF6g5CasY7dd6690XFf
   rp9nsdNqChMAIeYteJBS2GMjGqnRkUanqN3ukJJeT+6vEF3NkPmsT72B9
   K5LcL0M3eJXqyBOIMAkYbM7y7yvdwuNx6hygTMD4gL/uL5y42uZVfWPDB
   TSu/Dft2fp4s46oNcUaAjLXouh7eVarEUOwMj9cmK404BGKKJ6PRvm+vD
   4fBjr0AkVos5B5ghxGlOnSQDMurOII69d7OTEfu0MTQ8krw4yBvn+Sub4
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="247877112"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="247877112"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2022 06:32:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
   d="scan'208";a="627083947"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2022 06:32:03 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nFGfz-000UhI-9E; Wed, 02 Feb 2022 14:32:03 +0000
Date: Wed, 2 Feb 2022 22:31:18 +0800
From: kernel test robot <lkp@intel.com>
To: ektor5 <ek5.chimenti@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Ettore Chimenti <ek5.chimenti@gmail.com>,
	linux-kernel@vger.kernel.org, linuxfancy@googlegroups.com
Subject: Re: [PATCH 1/2] media: cec: add SECO MEC-based cec driver
Message-ID: <202202022216.MCt6c52g-lkp@intel.com>
References: <20220201183734.224756-2-ek5.chimenti@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201183734.224756-2-ek5.chimenti@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi ektor5,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linux/master linus/master v5.17-rc2 next-20220202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/ektor5/Add-SECO-CEC-driver-for-MEC-Based-boards/20220202-023834
base:   git://linuxtv.org/media_tree.git master
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20220202/202202022216.MCt6c52g-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/8960cb39808a004dee84a2f955ed949b1a4da7a8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review ektor5/Add-SECO-CEC-driver-for-MEC-Based-boards/20220202-023834
        git checkout 8960cb39808a004dee84a2f955ed949b1a4da7a8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/cec/platform/seco/ drivers/net/wireless/ath/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/cec/platform/seco/seco-meccec.c:735:8: warning: variable 'adaps' is uninitialized when used here [-Wuninitialized]
                           if (adaps--)
                               ^~~~~
   drivers/media/cec/platform/seco/seco-meccec.c:634:11: note: initialize the variable 'adaps' to silence this warning
           int adaps, notifs = 0;
                    ^
                     = 0
   1 warning generated.


vim +/adaps +735 drivers/media/cec/platform/seco/seco-meccec.c

   626	
   627	static int seco_meccec_probe(struct platform_device *pdev)
   628	{
   629		struct seco_meccec_data *meccec;
   630		struct device *dev = &pdev->dev;
   631		struct device *hdmi_dev;
   632		const char * const *conn;
   633		int ret, idx;
   634		int adaps, notifs = 0;
   635	
   636		meccec = devm_kzalloc(dev, sizeof(*meccec), GFP_KERNEL);
   637		if (!meccec)
   638			return -ENOMEM;
   639	
   640		dev_set_drvdata(dev, meccec);
   641	
   642		meccec->pdev = pdev;
   643		meccec->dev = dev;
   644	
   645		ret = ec_get_version(meccec);
   646		if (ret) {
   647			dev_err(dev, "Get version failed\n");
   648			goto err;
   649		}
   650	
   651		if (!has_acpi_companion(dev)) {
   652			dev_err(dev, "Cannot find any ACPI companion\n");
   653			ret = -ENODEV;
   654			goto err;
   655		}
   656	
   657		ret = seco_meccec_acpi_probe(meccec);
   658		if (ret) {
   659			dev_err(dev, "ACPI probe failed\n");
   660			goto err;
   661		}
   662	
   663		ret = devm_request_threaded_irq(dev,
   664						meccec->irq,
   665						NULL,
   666						seco_meccec_irq_handler,
   667						IRQF_TRIGGER_RISING | IRQF_ONESHOT,
   668						dev_name(&pdev->dev), meccec);
   669	
   670		if (ret) {
   671			dev_err(dev, "Cannot request IRQ %d\n", meccec->irq);
   672			ret = -EIO;
   673			goto err;
   674		}
   675	
   676		hdmi_dev = seco_meccec_find_hdmi_dev(&pdev->dev, &conn);
   677		if (IS_ERR(hdmi_dev)) {
   678			dev_err(dev, "Cannot find HDMI Device\n");
   679			return PTR_ERR(hdmi_dev);
   680		}
   681		dev_dbg(dev, "HDMI device found\n");
   682	
   683		for (idx = 0; idx < MECCEC_MAX_CEC_ADAP; idx++) {
   684			if (meccec->channels & BIT_MASK(idx)) {
   685				ret = meccec_create_adapter(meccec, idx);
   686				if (ret)
   687					goto err_delete_adapter;
   688				dev_dbg(dev, "CEC adapter #%d allocated\n", idx);
   689			}
   690		}
   691	
   692		for (idx = 0; idx < MECCEC_MAX_CEC_ADAP; idx++) {
   693			if (meccec->channels & BIT_MASK(idx)) {
   694				struct cec_adapter *acec = meccec->cec_adap[idx];
   695				struct cec_notifier *ncec;
   696	
   697				if (!acec) {
   698					ret = -EINVAL;
   699					goto err_notifier;
   700				}
   701	
   702				ncec = cec_notifier_cec_adap_register(hdmi_dev,
   703								      conn[idx], acec);
   704	
   705				dev_dbg(dev, "CEC notifier #%d allocated %s\n", idx, conn[idx]);
   706	
   707				if (IS_ERR(ncec)) {
   708					ret = PTR_ERR(ncec);
   709					goto err_notifier;
   710				}
   711	
   712				meccec->notifier[idx] = ncec;
   713				notifs++;
   714			}
   715		}
   716	
   717		for (idx = 0; idx < MECCEC_MAX_CEC_ADAP; idx++) {
   718			if (meccec->channels & BIT_MASK(idx)) {
   719				ret = cec_register_adapter(meccec->cec_adap[idx], dev);
   720				if (ret)
   721					goto err_notifier;
   722	
   723				dev_dbg(dev, "CEC adapter #%d registered\n", idx);
   724			}
   725		}
   726	
   727		platform_set_drvdata(pdev, meccec);
   728		dev_dbg(dev, "Device registered\n");
   729	
   730		return ret;
   731	
   732	err_notifier:
   733		for (idx = 0; idx < MECCEC_MAX_CEC_ADAP; idx++) {
   734			if (meccec->channels & BIT_MASK(idx)) {
 > 735				if (adaps--)
   736					return ret;
   737	
   738				cec_notifier_cec_adap_unregister(meccec->notifier[idx],
   739								 meccec->cec_adap[idx]);
   740			}
   741		}
   742	err_delete_adapter:
   743		for (idx = 0; idx < MECCEC_MAX_CEC_ADAP; idx++) {
   744			if (meccec->channels & BIT_MASK(idx)) {
   745				if (notifs--)
   746					return ret;
   747	
   748				cec_delete_adapter(meccec->cec_adap[idx]);
   749			}
   750		}
   751	err:
   752		dev_err(dev, "%s device probe failed: %d\n", dev_name(dev), ret);
   753	
   754		return ret;
   755	}
   756	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
