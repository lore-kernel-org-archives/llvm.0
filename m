Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434E715AD;
	Mon, 17 Jul 2023 06:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689574547; x=1721110547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kmazPv2jCJTdy/eDps3PGFFO7DZeo9izsn+ofDOzdfk=;
  b=nTDkCDXngm90O6jUsJr3qsdC21eKZyslkqSYVzYQtJOLQ5ecTBE66PyN
   JIB7wAAk3aiMXMiIyyUW8JZoDED+iez9b79x4TWPf3SyvBrIVzLh6KUAH
   ndJAOEpZqvxc7nDQ7svvglJ9q6g4suhr9TqXT9gDX6vCJ6hc8Hq1eCawz
   9UVRXo5UFugL/cVWKEcoU9ViZAhjwlKqITIjBdHsb8aKnkzmM6BBB8n5A
   cIpv8aF4ydJNKG1BfAUvsl/5KgHARVyIJFwowyLwK755MRKrh0aUcmtY9
   0/xR09+4RUolOxw1YiPNv/Ew9MpMDRdosNSMLrGEq+rYtjf69jpnhpYO4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="364726463"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="364726463"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 23:15:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="813176035"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="813176035"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Jul 2023 23:15:44 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLHWJ-0009DI-0O;
	Mon, 17 Jul 2023 06:15:43 +0000
Date: Mon, 17 Jul 2023 14:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Alison Schofield <alison.schofield@intel.com>
Subject: [linux-next:master 2870/3252] drivers/cxl/acpi.c:300:4: warning:
 format specifies type 'unsigned long long' but the argument has type
 'resource_size_t' (aka 'unsigned int')
Message-ID: <202307171416.dMlpHle6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2205be537aeb1ca2ace998e2fefaa2be04e393e4
commit: 3840e10e8dcafc89a2d96ab7dbb640434c8da8cf [2870/3252] cxl/acpi: Fix a use-after-free in cxl_parse_cfmws()
config: i386-randconfig-i004-20230717 (https://download.01.org/0day-ci/archive/20230717/202307171416.dMlpHle6-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307171416.dMlpHle6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307171416.dMlpHle6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/acpi.c:300:4: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                           res->start, res->end);
                           ^~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   drivers/cxl/acpi.c:300:16: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                           res->start, res->end);
                                       ^~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +300 drivers/cxl/acpi.c

   196	
   197	static int cxl_parse_cfmws(union acpi_subtable_headers *header, void *arg,
   198				   const unsigned long end)
   199	{
   200		int target_map[CXL_DECODER_MAX_INTERLEAVE];
   201		struct cxl_cfmws_context *ctx = arg;
   202		struct cxl_port *root_port = ctx->root_port;
   203		struct resource *cxl_res = ctx->cxl_res;
   204		struct cxl_cxims_context cxims_ctx;
   205		struct cxl_root_decoder *cxlrd;
   206		struct device *dev = ctx->dev;
   207		struct acpi_cedt_cfmws *cfmws;
   208		cxl_calc_hb_fn cxl_calc_hb;
   209		struct cxl_decoder *cxld;
   210		unsigned int ways, i, ig;
   211		struct resource *res;
   212		int rc;
   213	
   214		cfmws = (struct acpi_cedt_cfmws *) header;
   215	
   216		rc = cxl_acpi_cfmws_verify(dev, cfmws);
   217		if (rc) {
   218			dev_err(dev, "CFMWS range %#llx-%#llx not registered\n",
   219				cfmws->base_hpa,
   220				cfmws->base_hpa + cfmws->window_size - 1);
   221			return 0;
   222		}
   223	
   224		rc = eiw_to_ways(cfmws->interleave_ways, &ways);
   225		if (rc)
   226			return rc;
   227		rc = eig_to_granularity(cfmws->granularity, &ig);
   228		if (rc)
   229			return rc;
   230		for (i = 0; i < ways; i++)
   231			target_map[i] = cfmws->interleave_targets[i];
   232	
   233		res = kzalloc(sizeof(*res), GFP_KERNEL);
   234		if (!res)
   235			return -ENOMEM;
   236	
   237		res->name = kasprintf(GFP_KERNEL, "CXL Window %d", ctx->id++);
   238		if (!res->name)
   239			goto err_name;
   240	
   241		res->start = cfmws->base_hpa;
   242		res->end = cfmws->base_hpa + cfmws->window_size - 1;
   243		res->flags = IORESOURCE_MEM;
   244	
   245		/* add to the local resource tracking to establish a sort order */
   246		rc = insert_resource(cxl_res, res);
   247		if (rc)
   248			goto err_insert;
   249	
   250		if (cfmws->interleave_arithmetic == ACPI_CEDT_CFMWS_ARITHMETIC_MODULO)
   251			cxl_calc_hb = cxl_hb_modulo;
   252		else
   253			cxl_calc_hb = cxl_hb_xor;
   254	
   255		cxlrd = cxl_root_decoder_alloc(root_port, ways, cxl_calc_hb);
   256		if (IS_ERR(cxlrd))
   257			return 0;
   258	
   259		cxld = &cxlrd->cxlsd.cxld;
   260		cxld->flags = cfmws_to_decoder_flags(cfmws->restrictions);
   261		cxld->target_type = CXL_DECODER_HOSTONLYMEM;
   262		cxld->hpa_range = (struct range) {
   263			.start = res->start,
   264			.end = res->end,
   265		};
   266		cxld->interleave_ways = ways;
   267		/*
   268		 * Minimize the x1 granularity to advertise support for any
   269		 * valid region granularity
   270		 */
   271		if (ways == 1)
   272			ig = CXL_DECODER_MIN_GRANULARITY;
   273		cxld->interleave_granularity = ig;
   274	
   275		if (cfmws->interleave_arithmetic == ACPI_CEDT_CFMWS_ARITHMETIC_XOR) {
   276			if (ways != 1 && ways != 3) {
   277				cxims_ctx = (struct cxl_cxims_context) {
   278					.dev = dev,
   279					.cxlrd = cxlrd,
   280				};
   281				rc = acpi_table_parse_cedt(ACPI_CEDT_TYPE_CXIMS,
   282							   cxl_parse_cxims, &cxims_ctx);
   283				if (rc < 0)
   284					goto err_xormap;
   285				if (!cxlrd->platform_data) {
   286					dev_err(dev, "No CXIMS for HBIG %u\n", ig);
   287					rc = -EINVAL;
   288					goto err_xormap;
   289				}
   290			}
   291		}
   292		rc = cxl_decoder_add(cxld, target_map);
   293	err_xormap:
   294		if (rc)
   295			put_device(&cxld->dev);
   296		else
   297			rc = cxl_decoder_autoremove(dev, cxld);
   298		if (rc) {
   299			dev_err(dev, "Failed to add decode range [%#llx - %#llx]\n",
 > 300				res->start, res->end);
   301			return 0;
   302		}
   303		dev_dbg(dev, "add: %s node: %d range [%#llx - %#llx]\n",
   304			dev_name(&cxld->dev),
   305			phys_to_target_node(cxld->hpa_range.start),
   306			cxld->hpa_range.start, cxld->hpa_range.end);
   307	
   308		return 0;
   309	
   310	err_insert:
   311		kfree(res->name);
   312	err_name:
   313		kfree(res);
   314		return -ENOMEM;
   315	}
   316	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
