Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7BE1C26;
	Sun,  9 Apr 2023 11:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681038572; x=1712574572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x0kS3DSlpfrOLBoflipxl2+W0lZBCHdKUzpOsF+x4+c=;
  b=HSV3/3pw0Gg9bFLF0+Cn7J8jkcmu64md43qN4evw6S118zgbsqGFVyfX
   ovg2VXVfl/Sz96G/8ttCdCjJHKwsU9+PucJjeN/OxpuumC3k4/ixl9g09
   bP02IL4xjtWLe+bUIqOn4HZj5kczsaiDNmszMGEFUI3hIKtK1Ey8k/NUX
   MKT1f7Pne3+efSP6Ptka0+SFhYjilgXVha1Mhjqb3a2POXIq9Kra7VH+x
   9g+y8Hhv3oSplJ1vco3jeXrYVr8TbIrVN86oP6kzBKlj4pYj6v2A5/dkS
   OgYlCpmWdz92ZpI1FdbG+DIqq4FRXnF6OYDKvXDkYr5WFWq6t4yjThohl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="406038898"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="406038898"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 04:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="777296543"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="777296543"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Apr 2023 04:09:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plSvI-000UTs-0o;
	Sun, 09 Apr 2023 11:09:28 +0000
Date: Sun, 9 Apr 2023 19:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [cxl:for-6.5/dcd-preview 13/15] drivers/cxl/core/mbox.c:1020:5:
 warning: format specifies type 'unsigned long long' but the argument has
 type 'resource_size_t' (aka 'unsigned int')
Message-ID: <202304091941.euqqkmz4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.5/dcd-preview
head:   f425bc34c600e2a3721d6560202962ec41622815
commit: 3113a430f1ccbad8340234cf38b00f271ccee103 [13/15] cxl/mem: Add support to handle DCD add and release capacity events.
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20230409/202304091941.euqqkmz4-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commit/?id=3113a430f1ccbad8340234cf38b00f271ccee103
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
        git fetch --no-tags cxl for-6.5/dcd-preview
        git checkout 3113a430f1ccbad8340234cf38b00f271ccee103
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304091941.euqqkmz4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/mbox.c:1020:5: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                                   dpa, size);
                                   ^~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                           ~~~    ^~~~~~~~~~~
   drivers/cxl/core/mbox.c:1020:10: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                                   dpa, size);
                                        ^~~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                           ~~~    ^~~~~~~~~~~
   drivers/cxl/core/mbox.c:1023:54: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                           dev_err(dev, "No extent found with DPA:0x%llx\n", dpa);
                                                                    ~~~~     ^~~
                                                                    %x
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   drivers/cxl/core/mbox.c:1036:10: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                                                                           dpa, size);
                                                                           ^~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                           ~~~    ^~~~~~~~~~~
   drivers/cxl/core/mbox.c:1036:15: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                                                                           dpa, size);
                                                                                ^~~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                           ~~~    ^~~~~~~~~~~
   5 warnings generated.


vim +1020 drivers/cxl/core/mbox.c

   900	
   901	static int cxl_prepare_ext_list(struct cxl_mbox_dc_response **res,
   902						int *n, struct resource *extent)
   903	{
   904		struct cxl_mbox_dc_response *dc_res;
   905		unsigned int size;
   906	
   907		if (!extent)
   908			size = struct_size(dc_res, extent_list, 0);
   909		else
   910			size = struct_size(dc_res, extent_list, *n + 1);
   911	
   912		dc_res = krealloc(*res, size, GFP_KERNEL);
   913		if (!dc_res)
   914			return -ENOMEM;
   915	
   916		if (extent) {
   917			dc_res->extent_list[*n].dpa_start = cpu_to_le64(extent->start);
   918			memset(dc_res->extent_list[*n].reserved, 0, 8);
   919			dc_res->extent_list[*n].length =
   920					cpu_to_le64(resource_size(extent));
   921			(*n)++;
   922		}
   923	
   924		*res = dc_res;
   925		return 0;
   926	}
   927	/**
   928	 * cxl_handle_dcd_event_records() - Read DCD event records.
   929	 * @cxlds: The device data for the operation
   930	 *
   931	 * Returns 0 if enumerate completed successfully.
   932	 *
   933	 * CXL devices can generate DCD events to add or remove extents in the list.
   934	 */
   935	int cxl_handle_dcd_event_records(struct cxl_dev_state *cxlds, struct cxl_event_record_raw *rec)
   936	{
   937		struct cxl_mbox_dc_response *dc_res = NULL;
   938		struct device *dev = cxlds->dev;
   939		uuid_t *id = &rec->hdr.id;
   940		struct dcd_event_dyn_cap *record =
   941				(struct dcd_event_dyn_cap *)rec;
   942		int extent_size = 0, rc = 0;
   943		struct cxl_dc_extent_data *extent;
   944		struct resource alloc_dpa_res, rel_dpa_res;
   945		resource_size_t dpa, size;
   946	
   947		if (!uuid_equal(id, &dc_event_uuid))
   948			return -EINVAL;
   949	
   950		switch (record->data.event_type) {
   951		case ADD_CAPACITY:
   952			extent = devm_kzalloc(dev, sizeof(*extent), GFP_ATOMIC);
   953			if (!extent) {
   954				dev_err(dev, "No memory available\n");
   955				return -ENOMEM;
   956			}
   957	
   958			extent->dpa_start = le64_to_cpu(record->data.extent.start_dpa);
   959			extent->length = le64_to_cpu(record->data.extent.length);
   960			memcpy(extent->tag, record->data.extent.tag,
   961					sizeof(record->data.extent.tag));
   962			extent->shared_extent_seq =
   963				le16_to_cpu(record->data.extent.shared_extn_seq);
   964			dev_dbg(dev, "Add DC extent DPA:0x%llx LEN:%llx\n",
   965						extent->dpa_start, extent->length);
   966			alloc_dpa_res = (struct resource) {
   967				.start = extent->dpa_start,
   968				.end = extent->dpa_start + extent->length - 1,
   969				.flags = IORESOURCE_MEM,
   970			};
   971	
   972			rc = cxl_add_dc_extent(cxlds, &alloc_dpa_res);
   973			if (rc < 0) {
   974				dev_dbg(dev, "unconsumed DC extent DPA:0x%llx LEN:%llx\n",
   975						extent->dpa_start, extent->length);
   976				rc = cxl_prepare_ext_list(&dc_res, &extent_size, NULL);
   977				if (rc < 0){
   978					dev_err(dev, "Couldn't create extent list %d\n",
   979										rc);
   980					devm_kfree(dev, extent);
   981					return rc;
   982				}
   983	
   984				rc = cxl_send_dc_cap_response(cxlds, dc_res,
   985						extent_size, CXL_MBOX_OP_ADD_DC_RESPONSE);
   986				if (rc < 0){
   987					devm_kfree(dev, extent);
   988					goto out;
   989				}
   990	
   991				kfree(dc_res);
   992				devm_kfree(dev, extent);
   993	
   994				return 0;
   995			}
   996	
   997			rc = xa_insert(&cxlds->dc_extent_list, extent->dpa_start, extent,
   998					GFP_KERNEL);
   999			if (rc < 0)
  1000				goto out;
  1001	
  1002			cxlds->num_dc_extents++;
  1003			rc = cxl_prepare_ext_list(&dc_res, &extent_size, &alloc_dpa_res);
  1004			if (rc < 0){
  1005				dev_err(dev, "Couldn't create extent list %d\n", rc);
  1006				return rc;
  1007			}
  1008	
  1009			rc = cxl_send_dc_cap_response(cxlds, dc_res,
  1010					extent_size, CXL_MBOX_OP_ADD_DC_RESPONSE);
  1011			if (rc < 0)
  1012				goto out;
  1013	
  1014			break;
  1015	
  1016		case RELEASE_CAPACITY:
  1017			dpa = le64_to_cpu(record->data.extent.start_dpa);
  1018			size = le64_to_cpu(record->data.extent.length);
  1019			dev_dbg(dev, "Release DC extents DPA:0x%llx LEN:%llx\n",
> 1020					dpa, size);
  1021			extent = xa_load(&cxlds->dc_extent_list, dpa);
  1022			if (!extent) {
  1023				dev_err(dev, "No extent found with DPA:0x%llx\n", dpa);
  1024				return -EINVAL;
  1025			}
  1026	
  1027			rel_dpa_res = (struct resource) {
  1028				.start = dpa,
  1029				.end = dpa + size - 1,
  1030				.flags = IORESOURCE_MEM,
  1031			};
  1032	
  1033			rc = cxl_release_dc_extent(cxlds, &rel_dpa_res);
  1034			if (rc < 0) {
  1035				dev_dbg(dev, "withhold DC extent DPA:0x%llx LEN:%llx\n",
  1036										dpa, size);
  1037				return 0;
  1038			}
  1039	
  1040			xa_erase(&cxlds->dc_extent_list, dpa);
  1041			devm_kfree(dev, extent);
  1042			cxlds->num_dc_extents--;
  1043			rc = cxl_prepare_ext_list(&dc_res, &extent_size, &rel_dpa_res);
  1044			if (rc < 0){
  1045				dev_err(dev, "Couldn't create extent list %d\n", rc);
  1046				return rc;
  1047			}
  1048	
  1049			rc = cxl_send_dc_cap_response(cxlds, dc_res,
  1050					extent_size, CXL_MBOX_OP_RELEASE_DC);
  1051			if (rc < 0)
  1052				goto out;
  1053	
  1054			break;
  1055	
  1056		default:
  1057			return -EINVAL;
  1058		}
  1059	out:
  1060		kfree(dc_res);
  1061		return rc;
  1062	}
  1063	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
