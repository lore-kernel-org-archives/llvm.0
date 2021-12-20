Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D342C9D
	for <llvm@lists.linux.dev>; Mon, 20 Dec 2021 22:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640039368; x=1671575368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DxMcUMbioDOhOD93wmC5Rwexi0nOYA65S8MORrUrYfQ=;
  b=iCPwT6taZLMBgb30pXxiI49HkJNa9mQ1aa4n3s4/HNB366wjK//vmHLX
   RfrTivTMAhNaBtgyQ5zxgxlO3yif/NXGbeHfX2oCbY4/NZ9d1cQrZqh5m
   uXMDHRvFdkgsPCAuQJI+HM7qrZaeOhGJJmDeu2l/MhU5SuJRmIQzogDbo
   xnv3ykTciYra6qqbAuKEhMWZZ8CQL9bngjtrdDbr2k5k9CHK9Oq2ldgFp
   EosULjXMuP4uhd+12AacG/yWvkXFMRBYitXKGqnKUUTH960WD44kbfeP/
   i9LRbzIuEbXnL/fMrOT/GHsaB6DZe6UsRLu7tIrWeYoGnfFiHxV9jvMfw
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="237819981"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="237819981"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 14:29:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="466093938"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 20 Dec 2021 14:29:25 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzR9p-0008Kh-7R; Mon, 20 Dec 2021 22:29:25 +0000
Date: Tue, 21 Dec 2021 06:28:40 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 1/2] firmware: arm_scmi: Filter out negative results
 on scmi_reading_get
Message-ID: <202112210649.czZr6hoM-lkp@intel.com>
References: <20211220174155.40239-2-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220174155.40239-2-cristian.marussi@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Cristian,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linux/master]
[also build test WARNING on groeck-staging/hwmon-next soc/for-next linus/master v5.16-rc6 next-20211220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Cristian-Marussi/Sensor-readings-fixes/20211221-014235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 136057256686de39cc3a07c2e39ef6bc43003ff6
config: hexagon-randconfig-r041-20211220 (https://download.01.org/0day-ci/archive/20211221/202112210649.czZr6hoM-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 555eacf75f21cd1dfc6363d73ad187b730349543)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6f0ec7d066a305bdb889a75e772ef0be72f365f9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Cristian-Marussi/Sensor-readings-fixes/20211221-014235
        git checkout 6f0ec7d066a305bdb889a75e772ef0be72f365f9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/firmware/arm_scmi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/sensors.c:733:63: warning: shift count >= width of type [-Wshift-count-overflow]
           if (!ret && si->version > SCMIv2_SENSOR_PROTOCOL && *value & BIT(63)) {
                                                                        ^~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   1 warning generated.


vim +733 drivers/firmware/arm_scmi/sensors.c

   681	
   682	/**
   683	 * scmi_sensor_reading_get  - Read scalar sensor value
   684	 * @ph: Protocol handle
   685	 * @sensor_id: Sensor ID
   686	 * @value: The 64bit value sensor reading
   687	 *
   688	 * This function returns a single 64 bit reading value representing the sensor
   689	 * value; if the platform SCMI Protocol implementation and the sensor support
   690	 * multiple axis and timestamped-reads, this just returns the first axis while
   691	 * dropping the timestamp value.
   692	 * Use instead the @scmi_sensor_reading_get_timestamped to retrieve the array of
   693	 * timestamped multi-axis values.
   694	 *
   695	 * Return: 0 on Success
   696	 */
   697	static int scmi_sensor_reading_get(const struct scmi_protocol_handle *ph,
   698					   u32 sensor_id, u64 *value)
   699	{
   700		int ret;
   701		struct scmi_xfer *t;
   702		struct scmi_msg_sensor_reading_get *sensor;
   703		struct sensors_info *si = ph->get_priv(ph);
   704		struct scmi_sensor_info *s = si->sensors + sensor_id;
   705	
   706		ret = ph->xops->xfer_get_init(ph, SENSOR_READING_GET,
   707					      sizeof(*sensor), 0, &t);
   708		if (ret)
   709			return ret;
   710	
   711		sensor = t->tx.buf;
   712		sensor->id = cpu_to_le32(sensor_id);
   713		if (s->async) {
   714			sensor->flags = cpu_to_le32(SENSOR_READ_ASYNC);
   715			ret = ph->xops->do_xfer_with_response(ph, t);
   716			if (!ret) {
   717				struct scmi_resp_sensor_reading_complete *resp;
   718	
   719				resp = t->rx.buf;
   720				if (le32_to_cpu(resp->id) == sensor_id)
   721					*value =
   722						get_unaligned_le64(&resp->readings_low);
   723				else
   724					ret = -EPROTO;
   725			}
   726		} else {
   727			sensor->flags = cpu_to_le32(0);
   728			ret = ph->xops->do_xfer(ph, t);
   729			if (!ret)
   730				*value = get_unaligned_le64(t->rx.buf);
   731		}
   732	
 > 733		if (!ret && si->version > SCMIv2_SENSOR_PROTOCOL && *value & BIT(63)) {
   734			dev_warn_once(ph->dev,
   735				      "SCMI FW Sensor version:0x%X reported negative value %ld\n",
   736				      si->version, (long)*value);
   737			*value = 0;
   738			ret = -EIO;
   739		}
   740	
   741		ph->xops->xfer_put(ph, t);
   742		return ret;
   743	}
   744	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
