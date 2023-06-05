Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE6937C;
	Mon,  5 Jun 2023 01:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685927670; x=1717463670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tliCuN6xBjTezRjTokcpzSNg+ubzBClvUDqr1+Ngdpo=;
  b=ewM5kBAPRljjl50LS75bB6SfBQ+46ywMrhei+56mjt1533DW8wLzG296
   PPsNWM5/SDdTZensF9l1RY4UB+k3iStyxpZL8N1oIFau4qnBhsJ2b37w/
   6ZDTC/RHXTNNIb20lI8ExcjKa4T1fWG1YqlLJttlNJWOjzjcSm4OnJ2pc
   TlCTZX0kbXcior4n/F+77u0TLxbPv97wfr9FR3d/IvaWN8vpVHtw7j03G
   syzl8gWXKsQrDGmEpTWwohMqwUySrM9b3fBRRgZnRk5MiIV4Cw4CkY+Sh
   k8c8rkjsgvYm27C9l2eQ8XcfoN++Q4KKvAQARTlbLjvNhXTJ9ut42WZ9b
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="384547753"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="384547753"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 18:14:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="955142682"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="955142682"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jun 2023 18:14:28 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5ynj-0003e7-2k;
	Mon, 05 Jun 2023 01:14:27 +0000
Date: Mon, 5 Jun 2023 09:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 06/19] cxl/hdm: Default CXL_DEVTYPE_DEVMEM decoders to
 CXL_DECODER_DEVMEM
Message-ID: <202306050926.zKn5BTKk-lkp@intel.com>
References: <168592153054.1948938.12344684637653088842.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168592153054.1948938.12344684637653088842.stgit@dwillia2-xfh.jf.intel.com>

Hi Dan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9561de3a55bed6bdd44a12820ba81ec416e705a7]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/cxl-regs-Clarify-when-a-struct-cxl_register_map-is-input-vs-output/20230605-073402
base:   9561de3a55bed6bdd44a12820ba81ec416e705a7
patch link:    https://lore.kernel.org/r/168592153054.1948938.12344684637653088842.stgit%40dwillia2-xfh.jf.intel.com
patch subject: [PATCH 06/19] cxl/hdm: Default CXL_DEVTYPE_DEVMEM decoders to CXL_DECODER_DEVMEM
config: riscv-randconfig-r033-20230605 (https://download.01.org/0day-ci/archive/20230605/202306050926.zKn5BTKk-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/c10eec1d3096b7e244f6c40478b3c2c1bde921fc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dan-Williams/cxl-regs-Clarify-when-a-struct-cxl_register_map-is-input-vs-output/20230605-073402
        git checkout c10eec1d3096b7e244f6c40478b3c2c1bde921fc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306050926.zKn5BTKk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/hdm.c:863:7: warning: variable 'cxled' is uninitialized when used here [-Wuninitialized]
                   if (cxled) {
                       ^~~~~
   drivers/cxl/core/hdm.c:797:36: note: initialize the variable 'cxled' to silence this warning
           struct cxl_endpoint_decoder *cxled;
                                             ^
                                              = NULL
   1 warning generated.


vim +/cxled +863 drivers/cxl/core/hdm.c

   791	
   792	static int init_hdm_decoder(struct cxl_port *port, struct cxl_decoder *cxld,
   793				    int *target_map, void __iomem *hdm, int which,
   794				    u64 *dpa_base, struct cxl_endpoint_dvsec_info *info)
   795	{
   796		u64 size, base, skip, dpa_size, lo, hi;
   797		struct cxl_endpoint_decoder *cxled;
   798		bool committed;
   799		u32 remainder;
   800		int i, rc;
   801		u32 ctrl;
   802		union {
   803			u64 value;
   804			unsigned char target_id[8];
   805		} target_list;
   806	
   807		if (should_emulate_decoders(info))
   808			return cxl_setup_hdm_decoder_from_dvsec(port, cxld, dpa_base,
   809								which, info);
   810	
   811		ctrl = readl(hdm + CXL_HDM_DECODER0_CTRL_OFFSET(which));
   812		lo = readl(hdm + CXL_HDM_DECODER0_BASE_LOW_OFFSET(which));
   813		hi = readl(hdm + CXL_HDM_DECODER0_BASE_HIGH_OFFSET(which));
   814		base = (hi << 32) + lo;
   815		lo = readl(hdm + CXL_HDM_DECODER0_SIZE_LOW_OFFSET(which));
   816		hi = readl(hdm + CXL_HDM_DECODER0_SIZE_HIGH_OFFSET(which));
   817		size = (hi << 32) + lo;
   818		committed = !!(ctrl & CXL_HDM_DECODER0_CTRL_COMMITTED);
   819		cxld->commit = cxl_decoder_commit;
   820		cxld->reset = cxl_decoder_reset;
   821	
   822		if (!committed)
   823			size = 0;
   824		if (base == U64_MAX || size == U64_MAX) {
   825			dev_warn(&port->dev, "decoder%d.%d: Invalid resource range\n",
   826				 port->id, cxld->id);
   827			return -ENXIO;
   828		}
   829	
   830		cxld->hpa_range = (struct range) {
   831			.start = base,
   832			.end = base + size - 1,
   833		};
   834	
   835		/* decoders are enabled if committed */
   836		if (committed) {
   837			cxld->flags |= CXL_DECODER_F_ENABLE;
   838			if (ctrl & CXL_HDM_DECODER0_CTRL_LOCK)
   839				cxld->flags |= CXL_DECODER_F_LOCK;
   840			if (FIELD_GET(CXL_HDM_DECODER0_CTRL_TYPE, ctrl))
   841				cxld->target_type = CXL_DECODER_HOSTMEM;
   842			else
   843				cxld->target_type = CXL_DECODER_DEVMEM;
   844			if (cxld->id != port->commit_end + 1) {
   845				dev_warn(&port->dev,
   846					 "decoder%d.%d: Committed out of order\n",
   847					 port->id, cxld->id);
   848				return -ENXIO;
   849			}
   850	
   851			if (size == 0) {
   852				dev_warn(&port->dev,
   853					 "decoder%d.%d: Committed with zero size\n",
   854					 port->id, cxld->id);
   855				return -ENXIO;
   856			}
   857			port->commit_end = cxld->id;
   858		} else {
   859			if (FIELD_GET(CXL_HDM_DECODER0_CTRL_TYPE, ctrl) == 0) {
   860				ctrl |= CXL_HDM_DECODER0_CTRL_TYPE;
   861				writel(ctrl, hdm + CXL_HDM_DECODER0_CTRL_OFFSET(which));
   862			}
 > 863			if (cxled) {
   864				struct cxl_memdev *cxlmd = cxled_to_memdev(cxled);
   865				struct cxl_dev_state *cxlds = cxlmd->cxlds;
   866	
   867				if (cxlds->type == CXL_DEVTYPE_CLASSMEM)
   868					cxld->target_type = CXL_DECODER_HOSTMEM;
   869				else
   870					cxld->target_type = CXL_DECODER_DEVMEM;
   871			} else {
   872				/* To be overridden by region type at commit time */
   873				cxld->target_type = CXL_DECODER_HOSTMEM;
   874			}
   875		}
   876		rc = eiw_to_ways(FIELD_GET(CXL_HDM_DECODER0_CTRL_IW_MASK, ctrl),
   877				  &cxld->interleave_ways);
   878		if (rc) {
   879			dev_warn(&port->dev,
   880				 "decoder%d.%d: Invalid interleave ways (ctrl: %#x)\n",
   881				 port->id, cxld->id, ctrl);
   882			return rc;
   883		}
   884		rc = eig_to_granularity(FIELD_GET(CXL_HDM_DECODER0_CTRL_IG_MASK, ctrl),
   885					 &cxld->interleave_granularity);
   886		if (rc)
   887			return rc;
   888	
   889		dev_dbg(&port->dev, "decoder%d.%d: range: %#llx-%#llx iw: %d ig: %d\n",
   890			port->id, cxld->id, cxld->hpa_range.start, cxld->hpa_range.end,
   891			cxld->interleave_ways, cxld->interleave_granularity);
   892	
   893		if (!info) {
   894			lo = readl(hdm + CXL_HDM_DECODER0_TL_LOW(which));
   895			hi = readl(hdm + CXL_HDM_DECODER0_TL_HIGH(which));
   896			target_list.value = (hi << 32) + lo;
   897			for (i = 0; i < cxld->interleave_ways; i++)
   898				target_map[i] = target_list.target_id[i];
   899	
   900			return 0;
   901		}
   902	
   903		if (!committed)
   904			return 0;
   905	
   906		dpa_size = div_u64_rem(size, cxld->interleave_ways, &remainder);
   907		if (remainder) {
   908			dev_err(&port->dev,
   909				"decoder%d.%d: invalid committed configuration size: %#llx ways: %d\n",
   910				port->id, cxld->id, size, cxld->interleave_ways);
   911			return -ENXIO;
   912		}
   913		lo = readl(hdm + CXL_HDM_DECODER0_SKIP_LOW(which));
   914		hi = readl(hdm + CXL_HDM_DECODER0_SKIP_HIGH(which));
   915		skip = (hi << 32) + lo;
   916		cxled = to_cxl_endpoint_decoder(&cxld->dev);
   917		rc = devm_cxl_dpa_reserve(cxled, *dpa_base + skip, dpa_size, skip);
   918		if (rc) {
   919			dev_err(&port->dev,
   920				"decoder%d.%d: Failed to reserve DPA range %#llx - %#llx\n (%d)",
   921				port->id, cxld->id, *dpa_base,
   922				*dpa_base + dpa_size + skip - 1, rc);
   923			return rc;
   924		}
   925		*dpa_base += dpa_size + skip;
   926	
   927		cxled->state = CXL_DECODER_STATE_AUTO;
   928	
   929		return 0;
   930	}
   931	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
