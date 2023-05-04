Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EDA7C;
	Thu,  4 May 2023 20:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683232674; x=1714768674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iMnt368wKhWGIoYHS+ZZOrPdI1k/gxyzl+kPiQhQ+Wk=;
  b=NicP+cy8XUqa+vfy0sB4NtKEAdHFIVieNWrqKShgeNurp7NdUs3kf8iC
   X2isvGYighWfkOO+vUZX0q2NS2Ca7C0k2MK5H5xjj7xtOEHIqG0cj0I8p
   92FcWyLJDIV9vEda9BH/4vejIk55N2EO2X4CQ6fScMkuwkvQV1dTaL0g0
   o1bHo0Ex/SfH8XRXR03Ms4Z6QnqYF7GyEQFuppuEzpMZ1mTZun49dLeuq
   PJe01DRwj2POqwMdYCeaARwH1rd8Thq+0AXChnApRMlFnD8HdHVzWDp4l
   JatGssvErHUyXsY8BtnpHp/nPijmg0ZFVJzk8udiFGARk5qRzQfUOGQbH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="329413343"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="329413343"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 13:37:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="871489807"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="871489807"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 May 2023 13:37:52 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pufi3-00008A-1O;
	Thu, 04 May 2023 20:37:51 +0000
Date: Fri, 5 May 2023 04:37:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 14/28] drivers/cxl/acpi.c:228:11: warning: variable
 'entries' set but not used
Message-ID: <202305050435.mm0pWJZl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   c09d294a320a41a687ff2881bc080bf7d9ee5ce2
commit: c858b2d3eecde666304c4dbee7e32bc781971dfd [14/28] cxl: Add support for _DSM Function for retrieving QTG ID
config: i386-randconfig-a012-20230501 (https://download.01.org/0day-ci/archive/20230505/202305050435.mm0pWJZl-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=c858b2d3eecde666304c4dbee7e32bc781971dfd
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout c858b2d3eecde666304c4dbee7e32bc781971dfd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cxl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050435.mm0pWJZl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/acpi.c:228:11: warning: variable 'entries' set but not used [-Wunused-but-set-variable]
           int len, entries;
                    ^
   1 warning generated.


vim +/entries +228 drivers/cxl/acpi.c

   200	
   201	/**
   202	 * cxl_acpi_evaluate_qtg_dsm - Retrieve QTG ids via ACPI _DSM
   203	 * @handle: ACPI handle
   204	 * @input: bandwidth and latency data
   205	 *
   206	 * Issue QTG _DSM with accompanied bandwidth and latency data in order to get
   207	 * the QTG IDs that are suitable for the performance point in order of most
   208	 * suitable to least suitable. Return first QTG ID.
   209	 */
   210	static int cxl_acpi_evaluate_qtg_dsm(acpi_handle handle,
   211					     struct qtg_dsm_input *input)
   212	{
   213		union acpi_object *out_obj, *out_buf, *pkg;
   214		union acpi_object in_buf = {
   215			.buffer = {
   216				.type = ACPI_TYPE_BUFFER,
   217				.pointer = (u8 *)input,
   218				.length = cpu_to_le32(sizeof(*input)),
   219			},
   220		};
   221		union acpi_object in_obj = {
   222			.package = {
   223				.type = ACPI_TYPE_PACKAGE,
   224				.count = cpu_to_le32(1),
   225				.elements = &in_buf
   226			},
   227		};
 > 228		int len, entries;
   229		u16 max_qtg;
   230		int rc = 0;
   231	
   232		out_obj = acpi_evaluate_dsm(handle, &acpi_cxl_qtg_id_guid, 1, 1, &in_obj);
   233		if (!out_obj)
   234			return -ENXIO;
   235	
   236		if (out_obj->type != ACPI_TYPE_PACKAGE) {
   237			rc = -ENXIO;
   238			goto out;
   239		}
   240	
   241		/* Check Max QTG ID */
   242		pkg = &out_obj->package.elements[0];
   243		if (pkg->type != ACPI_TYPE_BUFFER) {
   244			rc = -ENXIO;
   245			goto out;
   246		}
   247	
   248		if (le32_to_cpu(pkg->buffer.length) != sizeof(u16)) {
   249			rc = -ENXIO;
   250			goto out;
   251		}
   252	
   253		max_qtg = le16_to_cpu(*(__le16 *)pkg->buffer.pointer);
   254	
   255		/* Retrieve QTG IDs package */
   256		pkg = &out_obj->package.elements[1];
   257		if (pkg->type != ACPI_TYPE_PACKAGE) {
   258			rc = -ENXIO;
   259			goto out;
   260		}
   261	
   262		out_buf = &pkg->package.elements[0];
   263		if (out_buf->type != ACPI_TYPE_BUFFER) {
   264			rc = -ENXIO;
   265			goto out;
   266		}
   267	
   268		len = le32_to_cpu(out_buf->buffer.length);
   269	
   270		/* It's legal to have 0 QTG entries */
   271		if (len == 0) {
   272			rc = -EEXIST;
   273			goto out;
   274		}
   275	
   276		/* Malformed package, not multiple of WORD size */
   277		if (len % sizeof(u16)) {
   278			rc = -ENXIO;
   279			goto out;
   280		}
   281	
   282		entries = len / sizeof(u16);
   283		rc = le16_to_cpu(*(__le16 *)out_buf->buffer.pointer);
   284		if (rc > max_qtg) {
   285			rc = -ERANGE;
   286			pr_warn("QTG ID %u greater than MAX %u\n", rc, max_qtg);
   287		}
   288	
   289	out:
   290		ACPI_FREE(out_obj);
   291		return rc;
   292	}
   293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
