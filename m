Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FF17F
	for <llvm@lists.linux.dev>; Fri, 17 Jun 2022 02:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655431286; x=1686967286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RXAIbDFor1MhxYtU0bhLLC6fEyGVFdj9A9S8d/BDJyQ=;
  b=aqbARdsnWdBckzaZMl3w9jh3K0nABypc+E8jkl293JtzEwn2AMNC8LnU
   U4eEshFKHjG0JsdrPOFEsKI04MQTeOxLQGEXzL2/mFkGTFpmc7qAHb5gS
   HGhGcnVuPZY30fStPgx8xSFcYj/IvWeDRMDxVg6LW/hNcox06LynxIfgz
   H0nlrwoeJf7tXAlBtfObPotsHT9SQXLv/j+GaMYwQUU7BTcOxw9lNBihl
   hXAUaEvwNMxotRO+/jJ+Qb2Ef+6wl46qV6gYDaxYAnRAoTLQeIVdFYJlT
   lY+7FLxgCfxtm2sRMmikkIK4a/jc+WmKX0hb1gQUJeDWj+dj9q1XblJm/
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280429919"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="280429919"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 19:01:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="583864625"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Jun 2022 19:01:24 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o21IZ-000Oyj-EN;
	Fri, 17 Jun 2022 02:01:23 +0000
Date: Fri, 17 Jun 2022 10:00:28 +0800
From: kernel test robot <lkp@intel.com>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 760/1181]
 drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:1091:6: warning: format
 specifies type 'unsigned long long' but the argument has type 'dma_addr_t'
 (aka 'unsigned int')
Message-ID: <202206170917.IoB7tiDo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   59523b5c4aca0174f1f8cba2a07d3b3328b7c80e
commit: ae063a9e0b59f584573826b8bab401039d7b74d3 [760/1181] staging: xlnx_tsmux: Initial version of xlnx mpeg2tsmux driver
config: hexagon-randconfig-r014-20220617 (https://download.01.org/0day-ci/archive/20220617/202206170917.IoB7tiDo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d764aa7fc6b9cc3fbe960019018f5f9e941eb0a6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/ae063a9e0b59f584573826b8bab401039d7b74d3
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout ae063a9e0b59f584573826b8bab401039d7b74d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/staging/xlnx_tsmux/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:1091:6: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
                                           mpgmuxts->src_dmabufintl[i].dmabuf_addr,
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                           ~~~    ^~~~~~~~~~~
   drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c:1118:6: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
                                           mpgmuxts->dst_dmabufintl[i].dmabuf_addr,
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                           ~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +1091 drivers/staging/xlnx_tsmux/xlnx_mpg2tsmux.c

  1016	
  1017	static int xlnx_tsmux_ioctl_verify_dmabuf(struct xlnx_tsmux *mpgmuxts,
  1018						  void __user *arg)
  1019	{
  1020		struct dma_buf *dbuf;
  1021		struct dma_buf_attachment *attach;
  1022		struct sg_table *sgt;
  1023		struct xlnx_tsmux_dmabuf_info *dbuf_info;
  1024		s32 i;
  1025		int ret = 0;
  1026	
  1027		dbuf_info = kzalloc(sizeof(*dbuf_info), GFP_KERNEL);
  1028		if (!dbuf_info)
  1029			return -ENOMEM;
  1030	
  1031		ret = copy_from_user(dbuf_info, arg,
  1032				     sizeof(struct xlnx_tsmux_dmabuf_info));
  1033		if (ret) {
  1034			dev_err(mpgmuxts->dev, "Failed to copy from user");
  1035			goto dmak_free;
  1036		}
  1037		if (dbuf_info->dir != DMA_TO_MPG2MUX &&
  1038		    dbuf_info->dir != DMA_FROM_MPG2MUX) {
  1039			dev_err(mpgmuxts->dev, "Incorrect DMABUF direction %d",
  1040				dbuf_info->dir);
  1041			ret = -EINVAL;
  1042			goto dmak_free;
  1043		}
  1044		dbuf = dma_buf_get(dbuf_info->buf_fd);
  1045		if (IS_ERR(dbuf)) {
  1046			dev_err(mpgmuxts->dev, "dma_buf_get fail fd %d direction %d",
  1047				dbuf_info->buf_fd, dbuf_info->dir);
  1048			ret = PTR_ERR(dbuf);
  1049			goto dmak_free;
  1050		}
  1051		attach = dma_buf_attach(dbuf, mpgmuxts->dev);
  1052		if (IS_ERR(attach)) {
  1053			dev_err(mpgmuxts->dev, "dma_buf_attach fail fd %d dir %d",
  1054				dbuf_info->buf_fd, dbuf_info->dir);
  1055			ret = PTR_ERR(attach);
  1056			goto err_dmabuf_put;
  1057		}
  1058		sgt = dma_buf_map_attachment(attach,
  1059					     (enum dma_data_direction)(dbuf_info->dir));
  1060		if (IS_ERR(sgt)) {
  1061			dev_err(mpgmuxts->dev, "dma_buf_map_attach fail fd %d dir %d",
  1062				dbuf_info->buf_fd, dbuf_info->dir);
  1063			ret = PTR_ERR(sgt);
  1064			goto err_dmabuf_detach;
  1065		}
  1066	
  1067		if (sgt->nents > 1) {
  1068			ret = -EIO;
  1069			dev_dbg(mpgmuxts->dev, "Not contig nents %d fd %d direction %d",
  1070				sgt->nents, dbuf_info->buf_fd, dbuf_info->dir);
  1071			goto err_dmabuf_unmap_attachment;
  1072		}
  1073		dev_dbg(mpgmuxts->dev, "dmabuf %s is physically contiguous",
  1074			(dbuf_info->dir ==
  1075			 DMA_TO_MPG2MUX ? "Source" : "Destination"));
  1076	
  1077		if (dbuf_info->dir == DMA_TO_MPG2MUX) {
  1078			for (i = 0; i < XTSMUX_MAXIN_STRM; i++) {
  1079				if (!mpgmuxts->src_dmabufintl[i].buf_id) {
  1080					mpgmuxts->src_dmabufintl[i].dbuf = dbuf;
  1081					mpgmuxts->src_dmabufintl[i].attach = attach;
  1082					mpgmuxts->src_dmabufintl[i].sgt = sgt;
  1083					mpgmuxts->src_dmabufintl[i].dmabuf_addr =
  1084							sg_dma_address(sgt->sgl);
  1085					mpgmuxts->src_dmabufintl[i].dmabuf_fd =
  1086								dbuf_info->buf_fd;
  1087					mpgmuxts->src_dmabufintl[i].buf_id = i + 1;
  1088					dev_dbg(mpgmuxts->dev,
  1089						"%s: phy-addr=0x%llx for src dmabuf=%d",
  1090						__func__,
> 1091						mpgmuxts->src_dmabufintl[i].dmabuf_addr,
  1092						mpgmuxts->src_dmabufintl[i].dmabuf_fd);
  1093					break;
  1094				}
  1095			}
  1096			/* External src streams more than XTSMUX_MAXIN_STRM
  1097			 * can not be handled
  1098			 */
  1099			if (i == XTSMUX_MAXIN_STRM) {
  1100				ret = -EIO;
  1101				dev_dbg(mpgmuxts->dev, "src DMA bufs more than %d",
  1102					XTSMUX_MAXIN_STRM);
  1103				goto err_dmabuf_unmap_attachment;
  1104			}
  1105		} else {
  1106			for (i = 0; i < XTSMUX_MAXOUT_STRM; i++) {
  1107				if (!mpgmuxts->dst_dmabufintl[i].buf_id) {
  1108					mpgmuxts->dst_dmabufintl[i].dbuf = dbuf;
  1109					mpgmuxts->dst_dmabufintl[i].attach = attach;
  1110					mpgmuxts->dst_dmabufintl[i].sgt = sgt;
  1111					mpgmuxts->dst_dmabufintl[i].dmabuf_addr =
  1112							sg_dma_address(sgt->sgl);
  1113					mpgmuxts->dst_dmabufintl[i].dmabuf_fd =
  1114							dbuf_info->buf_fd;
  1115					mpgmuxts->dst_dmabufintl[i].buf_id = i + 1;
  1116					dev_dbg(mpgmuxts->dev,
  1117						"phy-addr=0x%llx for src dmabuf=%d",
  1118						mpgmuxts->dst_dmabufintl[i].dmabuf_addr,
  1119						mpgmuxts->dst_dmabufintl[i].dmabuf_fd);
  1120					break;
  1121				}
  1122			}
  1123			/* External dst streams more than XTSMUX_MAXOUT_STRM
  1124			 * can not be handled
  1125			 */
  1126			if (i == XTSMUX_MAXOUT_STRM) {
  1127				ret = -EIO;
  1128				dev_dbg(mpgmuxts->dev, "dst DMA bufs more than %d",
  1129					XTSMUX_MAXOUT_STRM);
  1130				goto err_dmabuf_unmap_attachment;
  1131			}
  1132		}
  1133	
  1134		return 0;
  1135	
  1136	err_dmabuf_unmap_attachment:
  1137		dma_buf_unmap_attachment(attach, sgt,
  1138					 (enum dma_data_direction)dbuf_info->dir);
  1139	err_dmabuf_detach:
  1140		dma_buf_detach(dbuf, attach);
  1141	err_dmabuf_put:
  1142		dma_buf_put(dbuf);
  1143	dmak_free:
  1144		kfree(dbuf_info);
  1145	
  1146		return ret;
  1147	}
  1148	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
