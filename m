Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB35A93B;
	Mon,  8 May 2023 09:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683539372; x=1715075372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w042wTQBiEIVxcg3YStNPzuYG+sn3RWl76EyF7cq+3s=;
  b=jWvNVrKrGUINHJfP7cdsNKENKKvpE15wqb+I3S9VHsMzEFXBTS7zFa7P
   6/Jyp6g+t/fsgmnImRGBtyaRZYlrdLTmUnBOJzsenK63VDKHOOlWAyl4+
   V4+8HHWLaWfIza9WSxtq0H8WQ4pw+gLWwXnKqK7Q7NCx/GqS5QjX+o3GC
   5OX6e4Qb/VIAY9UCdvscxyIJdHfp+YvNzJX7OitUGoC5AD2x21tgFuC1v
   hLmHZ0JoSeFwdCx8ZnNh7zr3CbexHk8yhTaHmFiI3BfwnRWSFYH+au2pI
   ZwgKsZK1LXt9+it7GEykxC6k7sgs9Aq5DazfnOR99s5/5QWSeKwfW352y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="415163399"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="415163399"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 02:49:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="729016233"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="729016233"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 May 2023 02:49:30 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvxUn-0001Ar-1x;
	Mon, 08 May 2023 09:49:29 +0000
Date: Mon, 8 May 2023 17:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/1] media: pci: ipu3-cio2: Obtain remote pad from
 endpoint
Message-ID: <202305081739.XqGimPpf-lkp@intel.com>
References: <20230508064123.979451-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508064123.979451-1-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on sailus-media-tree/streams linus/master v6.4-rc1 next-20230508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-pci-ipu3-cio2-Obtain-remote-pad-from-endpoint/20230508-144532
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230508064123.979451-1-sakari.ailus%40linux.intel.com
patch subject: [PATCH v2 1/1] media: pci: ipu3-cio2: Obtain remote pad from endpoint
config: x86_64-buildonly-randconfig-r002-20230508 (https://download.01.org/0day-ci/archive/20230508/202305081739.XqGimPpf-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/68c87524825aee53569c763e18948d5571271fa9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sakari-Ailus/media-pci-ipu3-cio2-Obtain-remote-pad-from-endpoint/20230508-144532
        git checkout 68c87524825aee53569c763e18948d5571271fa9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/pci/intel/ipu3/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305081739.XqGimPpf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu3/ipu3-cio2-main.c:1428:9: error: passing 'const struct fwnode_handle *' to parameter of type 'struct fwnode_handle *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                                                     s_asd->endpoint.local_fwnode,
                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/media-entity.h:1082:27: note: passing argument to parameter 'fwnode' here
                                   struct fwnode_handle *fwnode,
                                                         ^
   1 error generated.


vim +1428 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c

  1412	
  1413	/* .complete() is called after all subdevices have been located */
  1414	static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
  1415	{
  1416		struct cio2_device *cio2 = to_cio2_device(notifier);
  1417		struct device *dev = &cio2->pci_dev->dev;
  1418		struct sensor_async_subdev *s_asd;
  1419		struct v4l2_async_subdev *asd;
  1420		struct cio2_queue *q;
  1421		int ret;
  1422	
  1423		list_for_each_entry(asd, &cio2->notifier.asd_list, asd_list) {
  1424			s_asd = to_sensor_asd(asd);
  1425			q = &cio2->queue[s_asd->csi2.port];
  1426	
  1427			ret = media_entity_get_fwnode_pad(&q->sensor->entity,
> 1428							  s_asd->endpoint.local_fwnode,
  1429							  MEDIA_PAD_FL_SOURCE);
  1430			if (ret < 0) {
  1431				dev_err(dev, "no endpoint for %pfw (%d)\n",
  1432					s_asd->endpoint.local_fwnode, ret);
  1433				return ret;
  1434			}
  1435	
  1436			ret = media_create_pad_link(&q->sensor->entity, ret,
  1437						    &q->subdev.entity, CIO2_PAD_SINK,
  1438						    0);
  1439			if (ret) {
  1440				dev_err(dev, "failed to create link for %s (endpoint %pfw, error %d)\n",
  1441					q->sensor->name, s_asd->endpoint.local_fwnode,
  1442					ret);
  1443				return ret;
  1444			}
  1445		}
  1446	
  1447		return v4l2_device_register_subdev_nodes(&cio2->v4l2_dev);
  1448	}
  1449	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
