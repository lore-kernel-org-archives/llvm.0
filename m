Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0CB13086;
	Thu,  6 Jul 2023 12:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688647528; x=1720183528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rcBm1zXVFDUpkpnbvsLGgMw12LDwJ72wAxlMU0bVJeQ=;
  b=ZMjNw/nm9/ErihXS0noqJ5vxQb+o1IUui9J3WvsunTWKP8fhh//SIs4O
   YMujx2EP7czWRjHGVsiMMsIUQp+EHLAYvQmxAjLP6IamYNVWhsid3ICTG
   jaImuHv0NkEVF4xULQt0dfa2ARwesbWaDGAeunRW33Kt5/QoTXDlXG8lh
   W0IPP+2pVK6XGABZqcl++XQ3vw6JOdFn8Qb5nppXAoIrw0ygOI5V4caJo
   4pdG6bvm+n2VDIgafHNMGgoaee18IQY84gFAQvzHAlqzrOBfkGpz5gBIZ
   gtBrjbGp2LKDQzpXi4DjCn1xmRhMEZ5HkoneJRg7sIPtFY232P3H9hSPN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="343923170"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="343923170"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 05:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="719569677"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="719569677"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Jul 2023 05:45:25 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHOMO-0001KO-2m;
	Thu, 06 Jul 2023 12:45:24 +0000
Date: Thu, 6 Jul 2023 20:45:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: [pinchartl:rpi/v6.4/unicam 15/28]
 drivers/media/platform/broadcom/bcm2835-unicam.c:1572:43: warning: variable
 'i' is uninitialized when used here
Message-ID: <202307062023.cLyDGta1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git rpi/v6.4/unicam
head:   dd34b42b348e2d3a455cf6ffb69b15309dd0e7d7
commit: 7a95bd4fa794cb979820fd0b1ff9aa874557b88a [15/28] media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20230706/202307062023.cLyDGta1-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307062023.cLyDGta1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307062023.cLyDGta1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/broadcom/bcm2835-unicam.c:1572:43: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
    1572 |                 dev_dbg(unicam->dev, "buffer %d: %p\n", i, buf);
         |                                                         ^
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:272:19: note: expanded from macro 'dynamic_dev_dbg'
     272 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:59: note: expanded from macro '_dynamic_func_call'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:246:65: note: expanded from macro '_dynamic_func_call_cls'
     246 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:222:15: note: expanded from macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/media/platform/broadcom/bcm2835-unicam.c:1540:16: note: initialize the variable 'i' to silence this warning
    1540 |         unsigned int i;
         |                       ^
         |                        = 0
   1 warning generated.


vim +/i +1572 drivers/media/platform/broadcom/bcm2835-unicam.c

  1531	
  1532	static int unicam_start_streaming(struct vb2_queue *vq, unsigned int count)
  1533	{
  1534		struct unicam_node *node = vb2_get_drv_priv(vq);
  1535		struct unicam_device *unicam = node->dev;
  1536		dma_addr_t buffer_addr[UNICAM_MAX_NODES] = { 0 };
  1537		struct unicam_buffer *buf;
  1538		struct v4l2_subdev_state *state;
  1539		unsigned long flags;
  1540		unsigned int i;
  1541		int ret;
  1542		u32 pad, stream;
  1543		u32 remote_pad_index = is_image_node(node) ? UNICAM_SD_PAD_SOURCE_IMAGE
  1544							   : UNICAM_SD_PAD_SOURCE_METADATA;
  1545	
  1546		/* Look for the route for the given pad and stream. */
  1547		state = v4l2_subdev_lock_and_get_active_state(&unicam->subdev.sd);
  1548	
  1549		ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
  1550							    remote_pad_index, 0,
  1551							    &pad, &stream);
  1552		if (ret)
  1553			goto err_streaming;
  1554	
  1555		v4l2_subdev_unlock_state(state);
  1556	
  1557		dev_dbg(unicam->dev, "Starting stream 0 on pad %d on subdev %s\n",
  1558			remote_pad_index, unicam->subdev.sd.name);
  1559	
  1560		/* The metadata node can't be started alone. */
  1561		if (is_metadata_node(node)) {
  1562			if (!unicam->node[UNICAM_IMAGE_NODE].streaming) {
  1563				dev_err(unicam->dev,
  1564					"Can't start metadata without image\n");
  1565				return -EINVAL;
  1566			}
  1567			dev_dbg(unicam->dev, "starting metadata node\n");
  1568	
  1569			spin_lock_irqsave(&node->dma_queue_lock, flags);
  1570			buf = list_first_entry(&node->dma_queue,
  1571					       struct unicam_buffer, list);
> 1572			dev_dbg(unicam->dev, "buffer %d: %p\n", i, buf);
  1573			node->cur_frm = buf;
  1574			node->next_frm = buf;
  1575			list_del(&buf->list);
  1576			spin_unlock_irqrestore(&node->dma_queue_lock, flags);
  1577	
  1578			buffer_addr[UNICAM_METADATA_NODE] =
  1579				vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
  1580	
  1581			unicam_start_metadata(unicam, buffer_addr);
  1582			node->streaming = true;
  1583			return 0;
  1584		}
  1585	
  1586		ret = pm_runtime_resume_and_get(unicam->dev);
  1587		if (ret < 0) {
  1588			dev_err(unicam->dev, "PM runtime resume failed: %d\n", ret);
  1589			goto err_streaming;
  1590		}
  1591	
  1592		ret = media_pipeline_start(node->video_dev.entity.pads, &unicam->pipe);
  1593		if (ret < 0) {
  1594			dev_dbg(unicam->dev, "Failed to start media pipeline: %d\n", ret);
  1595			goto err_pm_put;
  1596		}
  1597	
  1598		ret = unicam_video_check_format(node);
  1599		if (ret < 0) {
  1600			dev_err(unicam->dev, "Video format is incorrect: %d\n", ret);
  1601			goto error_pipeline;
  1602		}
  1603	
  1604		dev_dbg(unicam->dev, "node %s\n", node->video_dev.name);
  1605	
  1606		spin_lock_irqsave(&node->dma_queue_lock, flags);
  1607		buf = list_first_entry(&node->dma_queue,
  1608				       struct unicam_buffer, list);
  1609		dev_dbg(unicam->dev, "buffer %d: %p\n", i, buf);
  1610		node->cur_frm = buf;
  1611		node->next_frm = buf;
  1612		list_del(&buf->list);
  1613		spin_unlock_irqrestore(&node->dma_queue_lock, flags);
  1614	
  1615		buffer_addr[UNICAM_IMAGE_NODE] =
  1616				vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
  1617	
  1618		unicam_start_rx(unicam, buffer_addr);
  1619	
  1620		v4l2_subdev_enable_streams(&unicam->subdev.sd, remote_pad_index, BIT(0));
  1621		if (ret < 0) {
  1622			dev_err(unicam->dev, "stream on failed in subdev\n");
  1623			goto error_pipeline;
  1624		}
  1625	
  1626		node->streaming = true;
  1627	
  1628		return 0;
  1629	
  1630	error_pipeline:
  1631		media_pipeline_stop(node->video_dev.entity.pads);
  1632	err_pm_put:
  1633		pm_runtime_put_sync(unicam->dev);
  1634	err_streaming:
  1635		v4l2_subdev_unlock_state(state);
  1636		return ret;
  1637	}
  1638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
