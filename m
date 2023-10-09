Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9D415AFF;
	Mon,  9 Oct 2023 10:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J8ZHx2Xw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696846272; x=1728382272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z8fmbK0qvlMiW8gOXAxAw84fmJJdFWzIXoYfwW3JOtM=;
  b=J8ZHx2XwJC+FxaiAPIMeli08LCAt+zJzPitDvEgh4nFiZm00uMKgjFTU
   T4c1MQPJl2fDxj6HhGdi8ygQobiShuYaY+FPjSVfGYRfq21M9NwKItbsb
   5pGVuohxdylzLM6/LHkgo7NPDrJI11eHy7cIGqrHoki2OdhDmikgbIe41
   sMwlj0sYuohtT9XQWZqIYp1LaDj0eDOH6ToveCk2K0XrROfm2lIEW5z19
   aXIRbOMEzx7286yc3grHSoH/cnwxHT7tuf3IFq8C6/t0rXt9FORZbdVub
   4BIugaDmoO92+mkT0Y2OtQdVC+or1BxAqh+XuILDaWn8juKV5d591Ug1X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="381374676"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="381374676"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 03:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="782438248"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="782438248"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 09 Oct 2023 03:11:04 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpnE5-00006X-3A;
	Mon, 09 Oct 2023 10:11:01 +0000
Date: Mon, 9 Oct 2023 18:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Mikhaylov <fr0st61te@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Ivan Mikhaylov <fr0st61te@gmail.com>
Subject: Re: [PATCH v5 2/2] iio: adc: Add driver support for MAX34408/9
Message-ID: <202310091704.gr3fx4Vo-lkp@intel.com>
References: <20231007234838.8748-3-fr0st61te@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007234838.8748-3-fr0st61te@gmail.com>

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v6.6-rc5 next-20231009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Mikhaylov/dt-bindings-adc-provide-max34408-9-device-tree-binding-document/20231008-074933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20231007234838.8748-3-fr0st61te%40gmail.com
patch subject: [PATCH v5 2/2] iio: adc: Add driver support for MAX34408/9
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231009/202310091704.gr3fx4Vo-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231009/202310091704.gr3fx4Vo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310091704.gr3fx4Vo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/max34408.c:240:31: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
     240 |                                          &max34408->input_rsense[i]);
         |                                                                  ^
   drivers/iio/adc/max34408.c:215:11: note: initialize the variable 'i' to silence this warning
     215 |         int rc, i;
         |                  ^
         |                   = 0
   1 warning generated.


vim +/i +240 drivers/iio/adc/max34408.c

   205	
   206	static int max34408_probe(struct i2c_client *client)
   207	{
   208		const struct max34408_adc_model_data *model_data;
   209		struct device *dev = &client->dev;
   210		const struct of_device_id *match;
   211		struct max34408_data *max34408;
   212		struct fwnode_handle *node;
   213		struct iio_dev *indio_dev;
   214		struct regmap *regmap;
   215		int rc, i;
   216	
   217		match = i2c_of_match_device(max34408_of_match, client);
   218		if (!match)
   219			return -EINVAL;
   220		model_data = i2c_get_match_data(client);
   221	
   222		regmap = devm_regmap_init_i2c(client, &max34408_regmap_config);
   223		if (IS_ERR(regmap)) {
   224			dev_err_probe(dev, PTR_ERR(regmap),
   225				      "regmap_init failed\n");
   226			return PTR_ERR(regmap);
   227		}
   228	
   229		indio_dev = devm_iio_device_alloc(dev, sizeof(*max34408));
   230		if (!indio_dev)
   231			return -ENOMEM;
   232	
   233		max34408 = iio_priv(indio_dev);
   234		max34408->regmap = regmap;
   235		max34408->dev = dev;
   236		mutex_init(&max34408->lock);
   237	
   238		device_for_each_child_node(dev, node) {
   239			fwnode_property_read_u32(node, "maxim,rsense-val-micro-ohms",
 > 240						 &max34408->input_rsense[i]);
   241			i++;
   242		}
   243	
   244		/* disable ALERT and averaging */
   245		rc = regmap_write(max34408->regmap, MAX34408_CONTROL_REG, 0x0);
   246		if (rc)
   247			return rc;
   248	
   249		indio_dev->channels = model_data->channels;
   250		indio_dev->num_channels = model_data->num_channels;
   251		indio_dev->name = model_data->model_name;
   252	
   253		indio_dev->info = &max34408_info;
   254		indio_dev->modes = INDIO_DIRECT_MODE;
   255	
   256		return devm_iio_device_register(dev, indio_dev);
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
