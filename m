Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF3A7E;
	Wed, 15 Mar 2023 01:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678845483; x=1710381483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dBqrCU20tlu6LXfstZSYCLCaAg6v1/DeCAl32Lzd5FE=;
  b=a+pmg7i4QwRPWynmND6hPUVkmGbQOVfztv3QmjcyeKkQscADlT1Kl2NF
   uJteTYF6MLzzxKX9EgS4YtDaikXDeEPlL2uGPmOqAwfVwImAacRGDLz4C
   J8wEEXLHviZ55815A0MvUztA/D6W1d1Mg28p45WRjlzuGdx3MX1Pxz1lC
   A4Ayg0IKRYHK0UwgwTQXcaOZ5Jr0nR67GdCE/l2UIF+EnIGGmOpCvSPb1
   i7inzA4Gh+EeABif/SqQx9d+AL+uXb+QL1dsbdK7Z58D3dfk6CVZTOfkW
   0sTDFn2igpU6PLEpZ3hRouNqE+njWexA43tdn+S4DeuZX3Gs0k/akw1BI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="325950359"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; 
   d="scan'208";a="325950359"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 18:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="789605949"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; 
   d="scan'208";a="789605949"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2023 18:58:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcGOu-0007Kt-1s;
	Wed, 15 Mar 2023 01:58:00 +0000
Date: Wed, 15 Mar 2023 09:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/4] media: videobuf2: Replace bufs array by a list
Message-ID: <202303150924.yFreJjHP-lkp@intel.com>
References: <20230313135916.862852-3-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313135916.862852-3-benjamin.gaignard@collabora.com>

Hi Benjamin,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master v6.3-rc2 next-20230314]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/media-videobuf2-Use-vb2_get_buffer-as-helper-everywhere/20230313-220116
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230313135916.862852-3-benjamin.gaignard%40collabora.com
patch subject: [RFC 2/4] media: videobuf2: Replace bufs array by a list
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230315/202303150924.yFreJjHP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c6ebf39fc540139888f85f470b6984f2387d714b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Gaignard/media-videobuf2-Use-vb2_get_buffer-as-helper-everywhere/20230313-220116
        git checkout c6ebf39fc540139888f85f470b6984f2387d714b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303150924.yFreJjHP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/atomisp/pci/atomisp_ioctl.c:1098:22: error: no member named 'bufs' in 'struct vb2_queue'
           vb = pipe->vb_queue.bufs[buf->index];
                ~~~~~~~~~~~~~~ ^
   1 error generated.


vim +1098 drivers/staging/media/atomisp/pci/atomisp_ioctl.c

ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1083  
cb48ae89be3b6e9 drivers/staging/media/atomisp/pci/atomisp_ioctl.c          Hans de Goede         2022-10-08  1084  static int atomisp_dqbuf_wrapper(struct file *file, void *fh, struct v4l2_buffer *buf)
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1085  {
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1086  	struct video_device *vdev = video_devdata(file);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1087  	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1088  	struct atomisp_sub_device *asd = pipe->asd;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1089  	struct atomisp_device *isp = video_get_drvdata(vdev);
cb48ae89be3b6e9 drivers/staging/media/atomisp/pci/atomisp_ioctl.c          Hans de Goede         2022-10-08  1090  	struct ia_css_frame *frame;
cb48ae89be3b6e9 drivers/staging/media/atomisp/pci/atomisp_ioctl.c          Hans de Goede         2022-10-08  1091  	struct vb2_buffer *vb;
f315c1acba84fe1 drivers/staging/media/atomisp/pci/atomisp_ioctl.c          Hans de Goede         2022-09-03  1092  	int ret;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1093  
cb48ae89be3b6e9 drivers/staging/media/atomisp/pci/atomisp_ioctl.c          Hans de Goede         2022-10-08  1094  	ret = vb2_ioctl_dqbuf(file, fh, buf);
f315c1acba84fe1 drivers/staging/media/atomisp/pci/atomisp_ioctl.c          Hans de Goede         2022-09-03  1095  	if (ret)
f315c1acba84fe1 drivers/staging/media/atomisp/pci/atomisp_ioctl.c          Hans de Goede         2022-09-03  1096  		return ret;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1097  
cb48ae89be3b6e9 drivers/staging/media/atomisp/pci/atomisp_ioctl.c          Hans de Goede         2022-10-08 @1098  	vb = pipe->vb_queue.bufs[buf->index];
cb48ae89be3b6e9 drivers/staging/media/atomisp/pci/atomisp_ioctl.c          Hans de Goede         2022-10-08  1099  	frame = vb_to_frame(vb);
cf223056fb29772 drivers/staging/media/atomisp/pci/atomisp_ioctl.c          Hans de Goede         2022-09-02  1100  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1101  	buf->reserved = asd->frame_status[buf->index];
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1102  
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1103  	/*
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1104  	 * Hack:
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1105  	 * Currently frame_status in the enum type which takes no more lower
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1106  	 * 8 bit.
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1107  	 * use bit[31:16] for exp_id as it is only in the range of 1~255
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1108  	 */
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1109  	buf->reserved &= 0x0000ffff;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1110  	if (!(buf->flags & V4L2_BUF_FLAG_ERROR))
cb48ae89be3b6e9 drivers/staging/media/atomisp/pci/atomisp_ioctl.c          Hans de Goede         2022-10-08  1111  		buf->reserved |= frame->exp_id;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1112  	buf->reserved2 = pipe->frame_config_id[buf->index];
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1113  
eaa399eb542cdfc drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1114  	dev_dbg(isp->dev,
eaa399eb542cdfc drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1115  		"dqbuf buffer %d (%s) for asd%d with exp_id %d, isp_config_id %d\n",
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1116  		buf->index, vdev->name, asd->index, buf->reserved >> 16,
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1117  		buf->reserved2);
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1118  	return 0;
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1119  }
ad85094b293e40e drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c Mauro Carvalho Chehab 2020-04-19  1120  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
