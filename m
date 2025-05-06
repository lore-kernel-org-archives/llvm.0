Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA8828AB0A;
	Tue,  6 May 2025 04:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746504392; cv=none; b=SOASXqoQugQDtXcFHMMktAoTaG1P+PDkSCCnM4Lt84vFmj2My9vFBp0y05owmYXc/gb0HqNrOagWwbeqa5Z4U+5ViNzgapYgGU4e9D44Zzum+Zt9z9mvv3M8dxdjr6MlrNQPZYJ9LN6xH70mrdqbFJ1N+s28JoRBOeD5pZMxJUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746504392; c=relaxed/simple;
	bh=5bSdKrca0B+MqKH2cCE5XiY+9NnwJXX3thCEdAlNIdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZM/V/G2hMGPrU0bXAhmlcReBGWSvhwMdss7QANyijN2yLwuc4ASBbVCXcP7tW7PX/dkZddEUleW5Rof5GCxnmeUbMmBFuR3q7q88XIu3Wl2HLYUVDFmsZ8Hqhq2CPykDGqeNYt3BJdiqOE8nvHhPJVvUAPltuh2fLCjfWM6Blj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAIxDj1Y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAIxDj1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746504391; x=1778040391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5bSdKrca0B+MqKH2cCE5XiY+9NnwJXX3thCEdAlNIdQ=;
  b=AAIxDj1YWpX+oTkT14VAlConURRQAWzA59TRD7o0XyP+jjRasqXRQylL
   oZIFXRaiwiz1hpRKeSwZX0kCnWu/Gki2xaoigwpo17cLP2ZQo1+GgAlQy
   30sEYBBFi0iVa9YgeUz+5s7TUxDBPlhDlHIsSoDU0YCq+8msRsJNBkmhh
   EKhhkAF307uNk6SBDwKztl+GZyuLlc3QMlVx3cLlwt6aDB8Ho1eb0LOwZ
   EIGeBa67+L99YZHpjH2lODwPa6fD1OcQvhZFSsjg8WirXz8LojC6Zo5pi
   KSV1oNT9SoTl/o2qKXbj+XT7wtEXMSjS63m3b+GmhXBoeCzrDQRqMCGGo
   A==;
X-CSE-ConnectionGUID: c26IAkNXRlqxPCXf9+Lu3Q==
X-CSE-MsgGUID: y1LvkxLeTniP2H+pmSbFIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48023076"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="48023076"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 21:06:30 -0700
X-CSE-ConnectionGUID: 7cvG7Ba/Rg+xmRjtXGhGcg==
X-CSE-MsgGUID: JNAeArKSSgGVJNMsuspAZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="135186188"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 May 2025 21:06:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uC9ZZ-0006F7-2u;
	Tue, 06 May 2025 04:06:25 +0000
Date: Tue, 6 May 2025 12:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kevin Tian <kevin.tian@intel.com>
Subject: [sean-jc:sink 54/177] drivers/vhost/vdpa.c:219:32: error: no member
 named 'token' in 'struct irq_bypass_producer'
Message-ID: <202505061105.pA1KZRCK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux sink
head:   b64923e38c20d35f52d3e78fe87993306d912851
commit: 55503e04dc3db68bfba5486acee4a8baa0ef8765 [54/177] irqbypass: Take ownership of producer/consumer token tracking
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250506/202505061105.pA1KZRCK-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505061105.pA1KZRCK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061105.pA1KZRCK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vhost/vdpa.c:219:32: error: no member named 'token' in 'struct irq_bypass_producer'
     219 |                          qid, vq->call_ctx.producer.token, ret);
         |                               ~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   1 error generated.


vim +219 drivers/vhost/vdpa.c

776f395004d829 Zhu Lingshan        2020-06-05  197  
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  198  static void vhost_vdpa_setup_vq_irq(struct vhost_vdpa *v, u16 qid)
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  199  {
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  200  	struct vhost_virtqueue *vq = &v->vqs[qid];
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  201  	const struct vdpa_config_ops *ops = v->vdpa->config;
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  202  	struct vdpa_device *vdpa = v->vdpa;
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  203  	int ret, irq;
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  204  
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  205  	if (!ops->get_vq_irq)
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  206  		return;
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  207  
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  208  	irq = ops->get_vq_irq(vdpa, qid);
cce0ab2b2a3907 Zhu Lingshan        2022-02-22  209  	if (irq < 0)
cce0ab2b2a3907 Zhu Lingshan        2022-02-22  210  		return;
cce0ab2b2a3907 Zhu Lingshan        2022-02-22  211  
cce0ab2b2a3907 Zhu Lingshan        2022-02-22  212  	if (!vq->call_ctx.ctx)
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  213  		return;
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  214  
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  215  	vq->call_ctx.producer.irq = irq;
55503e04dc3db6 Sean Christopherson 2025-04-04  216  	ret = irq_bypass_register_producer(&vq->call_ctx.producer, vq->call_ctx.ctx);
e01afe36df1a9e Zhu Lingshan        2020-10-23  217  	if (unlikely(ret))
e01afe36df1a9e Zhu Lingshan        2020-10-23  218  		dev_info(&v->dev, "vq %u, irq bypass producer (token %p) registration fails, ret =  %d\n",
e01afe36df1a9e Zhu Lingshan        2020-10-23 @219  			 qid, vq->call_ctx.producer.token, ret);
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  220  }
2cf1ba9a4d15cb Zhu Lingshan        2020-07-31  221  

:::::: The code at line 219 was first introduced by commit
:::::: e01afe36df1a9e42cacdb9c5b99512ec69a6f14b vdpa: handle irq bypass register failure case

:::::: TO: Zhu Lingshan <lingshan.zhu@intel.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
