Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E35A7A
	for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 14:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650293373; x=1681829373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hO9x+3Og/ZjrfDqAqC1uLnluGQ8218lypDoryo99by8=;
  b=XWYg3i/cwsI83k6BhT0E70ntBv+x6n4EnlJ2a3Offl0nRPFCY3B0A7gU
   LTG33A6EWTfw83xxLA2lQN9DFgZZDuh9pLKIuIXFJiniHPGvZqdcoFwa2
   7okWmBFOqPT93tQVAybFg4J7OmKO4W26NPthAZIj4H9DBtxW4CYZS2L5A
   wyRwagLWhEhlKSsa+hYoAzKgISnuDZuS2r8c96Csm5VAtdzj6pRUNyTHP
   nPfcb0DCUMMkC98fiyIDGgmE8Iul1Jl+BIoABmqK143Z2wuETyXZZd8Oh
   +tEar678GmnKGoMGFoSGjjdCJ51M0JDXSSnstzRrkp6EVzPhHxf7JcF6J
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="263706444"
X-IronPort-AV: E=Sophos;i="5.90,270,1643702400"; 
   d="scan'208";a="263706444"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 07:49:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,270,1643702400"; 
   d="scan'208";a="529555677"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Apr 2022 07:49:30 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ngSh0-0004i5-4x;
	Mon, 18 Apr 2022 14:49:30 +0000
Date: Mon, 18 Apr 2022 22:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [PATCH v4 5/6] drm/i915/dgfx: OPROM OpRegion Setup
Message-ID: <202204182218.XPmTiUon-lkp@intel.com>
References: <20220418105408.13444-6-anshuman.gupta@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418105408.13444-6-anshuman.gupta@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Anshuman,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip v5.18-rc3 next-20220414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Gupta/DGFX-OpRegion/20220418-185531
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: x86_64-randconfig-a012-20220418 (https://download.01.org/0day-ci/archive/20220418/202204182218.XPmTiUon-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 429cbac0390654f90bba18a41799464adf31a5ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4747bc652593c372ca674195eb1d2a90000626b5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Anshuman-Gupta/DGFX-OpRegion/20220418-185531
        git checkout 4747bc652593c372ca674195eb1d2a90000626b5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_opregion.c:979: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * intel_spi_get_oprom_opreg() get OPROM OpRegion image.
   drivers/gpu/drm/i915/display/intel_opregion.c:1657: warning: Function parameter or member 'i915' not described in 'intel_opregion_init'


vim +979 drivers/gpu/drm/i915/display/intel_opregion.c

   977	
   978	/**
 > 979	 * intel_spi_get_oprom_opreg() get OPROM OpRegion image.
   980	 * @i915: pointer to i915 device.
   981	 *
   982	 * This function parses the DGFX OPROM to retieve the opregion.
   983	 * OPROM has bundled multiple images but i915 only interested
   984	 * in CSS and opregion image.
   985	 *
   986	 *	+        DGFX OPROM IMAGE LAYOUT             +
   987	 *	+--------+-------+---------------------------+
   988	 *	| Offset | Value |   ROM Header Fields       +-----> Image1 (CSS)
   989	 *	+--------------------------------------------+
   990	 *	|    0h  |  55h  |   ROM Signature Byte1     |
   991	 *	|    1h  |  AAh  |   ROM Signature Byte2     |
   992	 *	|    2h  |  xx   |        Reserved           |
   993	 *	|  18+19h|  xx   |  Ptr to PCI DataStructure |
   994	 *	+----------------+---------------------------+
   995	 *	|           PCI Data Structure               |
   996	 *	+--------------------------------------------+
   997	 *	|    .       .             .                 |
   998	 *	|    .       .             .                 |
   999	 *	|    10  +  xx   +     Image Length          |
  1000	 *	|    14  +  xx   +     Code Type             |
  1001	 *	|    15  +  xx   +  Last Image Indicator     |
  1002	 *	|    .       .             .                 |
  1003	 *	+--------------------------------------------+
  1004	 *	|         Signature and Public Key           |
  1005	 *	+--------+-------+---------------------------+
  1006	 *	|    .   |   .   |         .                 |
  1007	 *	|    .   |   .   |         .                 |
  1008	 *	+--------------------------------------------+
  1009	 *	| Offset | Value |   ROM Header Fields       +-----> Image2 (opregion, vbt) (Offset: 0x800)
  1010	 *	+--------------------------------------------+
  1011	 *	|    0h  |  55h  |   ROM Signature Byte1     |
  1012	 *	|    1h  |  AAh  |   ROM Signature Byte2     |
  1013	 *	|    2h  |  xx   |        Reserved           |
  1014	 *	|  18+19h|  xx   |  Ptr to PCI DataStructure |
  1015	 *	+----------------+---------------------------+
  1016	 *	|           PCI Data Structure               |
  1017	 *	+--------------------------------------------+
  1018	 *	|    .       .             .                 |
  1019	 *	|    .       .             .                 |
  1020	 *	|    10  +  xx   +     Image Length          |
  1021	 *	|    14  +  xx   +      Code Type            |
  1022	 *	|    15  +  xx   +   Last Image Indicator    |
  1023	 *	|    .       .             .                 |
  1024	 *	|    1A  +  3C   + Ptr to Opregion Signature |
  1025	 *	|    .       .             .                 |
  1026	 *	|    .       .             .                 |
  1027	 *	|   83Ch + IntelGraphicsMem                  | <---+ Opregion Signature
  1028	 *	+--------+-----------------------------------+
  1029	 *
  1030	 * Return : Returns the opregion image blob which starts from opregion
  1031	 * signature "IntelGraphicsMem". Error value in case of error
  1032	 */
  1033	static void *
  1034	intel_spi_get_oprom_opreg(struct drm_i915_private *i915)
  1035	{
  1036		struct expansion_rom_header *exprom_hdr;
  1037		struct pci_data_structure *exprom_pci_data;
  1038		u8 img_sig[sizeof(OPREGION_SIGNATURE)];
  1039		u32 oprom_offset, offset;
  1040		size_t img_len, opreg_len;
  1041		void *opreg = ERR_PTR(-ENXIO);
  1042		int ret;
  1043	
  1044		oprom_offset = intel_spi_oprom_offset(i915);
  1045	
  1046		exprom_hdr = kzalloc(sizeof(struct expansion_rom_header), GFP_KERNEL);
  1047		exprom_pci_data = kzalloc(sizeof(struct pci_data_structure), GFP_KERNEL);
  1048		if (!exprom_hdr || !exprom_pci_data) {
  1049			opreg = ERR_PTR(-ENOMEM);
  1050			goto err_free_hdr;
  1051		}
  1052	
  1053		for (offset = oprom_offset; exprom_pci_data->last_img != LAST_IMG_INDICATOR;
  1054		     offset = offset + img_len) {
  1055			intel_spi_read_oprom(i915, offset, sizeof(struct expansion_rom_header),
  1056					     exprom_hdr);
  1057			intel_spi_read_oprom(i915, offset + exprom_hdr->pcistructoffset,
  1058					     sizeof(struct pci_data_structure), exprom_pci_data);
  1059			ret = pci_exp_rom_check_signature(i915, exprom_hdr, exprom_pci_data);
  1060			if (ret) {
  1061				opreg = ERR_PTR(ret);
  1062				goto err_free_hdr;
  1063			}
  1064	
  1065			img_len = exprom_pci_data->img_len * OPROM_BYTE_BOUNDARY;
  1066	
  1067			/* CSS or OpReg signature is present at exprom_hdr->img_base offset */
  1068			intel_spi_read_oprom(i915, offset + exprom_hdr->img_base,
  1069					     sizeof(OPREGION_SIGNATURE) - 1, img_sig);
  1070	
  1071			if (!memcmp(img_sig, INTEL_CSS_SIGNATURE, NUM_CSS_BYTES)) {
  1072				ret = intel_verify_css(i915, exprom_hdr, exprom_pci_data);
  1073				if (ret) {
  1074					opreg = ERR_PTR(ret);
  1075					goto err_free_hdr;
  1076				}
  1077			} else if (!memcmp(img_sig, OPREGION_SIGNATURE, sizeof(OPREGION_SIGNATURE) - 1)) {
  1078				opreg_len = img_len - exprom_hdr->img_base;
  1079				opreg_len = ALIGN(opreg_len, 4);
  1080				opreg = kzalloc(opreg_len, GFP_KERNEL);
  1081	
  1082				if (!opreg) {
  1083					opreg = ERR_PTR(-ENOMEM);
  1084					goto err_free_hdr;
  1085				}
  1086	
  1087				intel_spi_read_oprom(i915, offset + exprom_hdr->img_base,
  1088						     opreg_len, opreg);
  1089				drm_dbg_kms(&i915->drm, "Found opregion image of size %zu\n", opreg_len);
  1090				break;
  1091			}
  1092		}
  1093	
  1094	err_free_hdr:
  1095	
  1096		kfree(exprom_pci_data);
  1097		kfree(exprom_hdr);
  1098	
  1099		return opreg;
  1100	}
  1101	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
