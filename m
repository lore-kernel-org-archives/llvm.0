Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC252F1FEA;
	Tue, 19 May 2026 02:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156799; cv=none; b=qyGrHgo0j0vAJv6RR0X71ZCglvBj/v/GcT+yrIA8AYq4yOmV83MEijn+RGOMXhcw9Bk615dPOeJ3WNMphMzpqAQn7yGzjbZnTVkqJPgW7klMqqDfG0RZ97SPrCDAYCuxUd+NFF8swrxCIypQ1UTvIUIKk1XyoDNylDIqFZRpBa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156799; c=relaxed/simple;
	bh=KNEi9Z6fIzPPdjyS6gMZBxegnw+gYNTkMPxY7aoCyBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4R/5dqJ/e4rvG1FOBKrz/VbuUUYXca13rLNU9mPa/PQyaiMZPgybA6BIkx65cueV4xBZmJH8sx8jMBktabQTp8be9nRZ66l88QxfqaaLmFYanjwXIalwvQUlG5lvWGvRpFToANAwMdtVGGIDTBODTJf96OywRUBY33wrzCufxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPA7sZ2Q; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPA7sZ2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779156798; x=1810692798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KNEi9Z6fIzPPdjyS6gMZBxegnw+gYNTkMPxY7aoCyBE=;
  b=CPA7sZ2QlwqqntRjfFAP4d/h7DTPrU+8CvviuvWPriZNo6rlpYKQZCMC
   3BmhoxM7g3lKxeR7SDnjSKA9+bWmT8s/OATdkywTQR1wPjV93g8KTczXa
   IPPsdGfbqKb9+dfEsdIpxG/2RUmd7+/Jo3CwOQ9zlI9j+aRBaqmOloRsd
   dAAJoopIO+eOLkZkZ7jj9Pg8MbSbPkxGkJaoLVycezP+yMEInM2CQGbsE
   ClFFBNmYSc+p7OqzfUmVxpgJmWUb9wamwqzt3Rh24AxYJo6ay2WF/Q9WQ
   EK1K0VpwM9SsIWdofGpDFthlvtb4hjldt13YvMddeN9mqRuwUfEsNrHdu
   Q==;
X-CSE-ConnectionGUID: sCrq5fsgRZOI4jhVSG7uYA==
X-CSE-MsgGUID: ZT850Ry6S7qeX7pn1WjTKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79876128"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79876128"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:13:16 -0700
X-CSE-ConnectionGUID: t7ZnljPdT/OSq+BVcp6Xlg==
X-CSE-MsgGUID: L4xx6vjTS3WhirUt0xsi5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235167793"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 May 2026 19:13:12 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP9xF-00000000013-3rH0;
	Tue, 19 May 2026 02:13:09 +0000
Date: Tue, 19 May 2026 08:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Guangshuo Li <lgs201920130244@gmail.com>
Subject: Re: [PATCH] media: mediatek: mdp: avoid double free on video
 register failure
Message-ID: <202605190845.KlMSPp80-lkp@intel.com>
References: <20260518125500.1000083-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518125500.1000083-1-lgs201920130244@gmail.com>

Hi Guangshuo,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master linus/master v7.1-rc4 next-20260518]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/media-mediatek-mdp-avoid-double-free-on-video-register-failure/20260518-211648
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260518125500.1000083-1-lgs201920130244%40gmail.com
patch subject: [PATCH] media: mediatek: mdp: avoid double free on video register failure
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260519/202605190845.KlMSPp80-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190845.KlMSPp80-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190845.KlMSPp80-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c:1217:33: error: expected ';' after expression
    1217 |         video_device_release(mdp->vdev)
         |                                        ^
         |                                        ;
   1 error generated.


vim +1217 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c

  1172	
  1173	int mtk_mdp_register_m2m_device(struct mtk_mdp_dev *mdp)
  1174	{
  1175		struct device *dev = &mdp->pdev->dev;
  1176		int ret;
  1177	
  1178		mdp->variant = &mtk_mdp_default_variant;
  1179		mdp->vdev = video_device_alloc();
  1180		if (!mdp->vdev) {
  1181			dev_err(dev, "failed to allocate video device\n");
  1182			ret = -ENOMEM;
  1183			goto err_video_alloc;
  1184		}
  1185		mdp->vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
  1186		mdp->vdev->fops = &mtk_mdp_m2m_fops;
  1187		mdp->vdev->ioctl_ops = &mtk_mdp_m2m_ioctl_ops;
  1188		mdp->vdev->release = video_device_release_empty;
  1189		mdp->vdev->lock = &mdp->lock;
  1190		mdp->vdev->vfl_dir = VFL_DIR_M2M;
  1191		mdp->vdev->v4l2_dev = &mdp->v4l2_dev;
  1192		snprintf(mdp->vdev->name, sizeof(mdp->vdev->name), "%s:m2m",
  1193			 MTK_MDP_MODULE_NAME);
  1194		video_set_drvdata(mdp->vdev, mdp);
  1195	
  1196		mdp->m2m_dev = v4l2_m2m_init(&mtk_mdp_m2m_ops);
  1197		if (IS_ERR(mdp->m2m_dev)) {
  1198			dev_err(dev, "failed to initialize v4l2-m2m device\n");
  1199			ret = PTR_ERR(mdp->m2m_dev);
  1200			goto err_m2m_init;
  1201		}
  1202	
  1203		ret = video_register_device(mdp->vdev, VFL_TYPE_VIDEO, 2);
  1204		if (ret) {
  1205			dev_err(dev, "failed to register video device\n");
  1206			goto err_vdev_register;
  1207		}
  1208		mdp->vdev->release = video_device_release;
  1209	
  1210		v4l2_info(&mdp->v4l2_dev, "driver registered as /dev/video%d",
  1211			  mdp->vdev->num);
  1212		return 0;
  1213	
  1214	err_vdev_register:
  1215		v4l2_m2m_release(mdp->m2m_dev);
  1216	err_m2m_init:
> 1217		video_device_release(mdp->vdev)
  1218		mdp->vdev = NULL;
  1219	err_video_alloc:
  1220	
  1221		return ret;
  1222	}
  1223	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
