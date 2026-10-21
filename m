Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576518;
	b=A3IRw/aYuN9SxjuzbGIvh5im8UFf6o0yy1DtdxalReNagVj4C0efGvsE7PR6wzQHI/eG
	 XHXDlue5dVLg3erRUhLjzZdA+Cd4yMP6GCqZzwHMgdqFFilvv86DTkX7prsA+JFBnX2tI
	 0Fa1FLZ8Lj07dqEn/PDbEZ6KzMk87+QOIO7eW990vNSDlP+MoUBa3KR4qvbsHMIEBH2Vh
	 LOHmpHFmwbxUReNDi70XTCuSsYk78Jt+GQAkXgRCsi5w7EPq+R/opQH+CcJ02rqQhToRJ
	 B1fPbTZoWf3KWW9uUUbQ5YPSeb6Wv6PHlNDOPIGsgMcptL5J/WlFJSVTVkqyCLgfxnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576518;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6PIMmiOU1qXyYQfk2Fo4+uPH8S3U7ef69opGGoBfNoQ=;
	b=SLpOIHTeyn7yECUxK8dI46bExvGlmGuPAWKyh0YxGU/MP0HTuJoCHEAFBzOjxK+cj2e5
	 qnUDuJ82mAxTCx42aGQXrav618UqllV9bAgFZFx+JVpYYgEsl6dTo3yZ5CuNkEuZwqtON
	 L57S5TPZlUcsex5BdEnzbmLDjCIWd0uPBAlUBuoWNPtL8UXC52LlvfZDD74efj1k52sQZ
	 LGFioeR0oL4Zyz9wlUXay3qL8jdvycouNRCECkPU4idZPpfUDZ5wTFcrjNIb02HOivkLo
	 awL4but2GMNwMGuxpEkaGoLBekvpqNtMXQu3npdIZz8m4MRwgI3o7Dh7WLIE9cOz3HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="geNkT5/H";
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B82606A31B;
	Wed, 21 Oct 2026 09:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3B82606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=geNkT5/H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792576516; x=1824112516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7XaWVNlZkzhLjy2X7YQLJZ55nLrLsjLuUCefqlPCRyY=;
  b=geNkT5/HkrP8pCphhgCX4yc89lfSdSGD4FFR2r3qQjVcA7IQaWDJNklN
   g4OvXeeNz7XFQJITSTKwhf8WgjxK+8jrZTmWi9BybMuzPePvC7FYq7MD8
   tHxOB7nL6YvDpLsvlHCgCmXX+XBwS6/rEJpdLIkIZ96cfmVNglAirgZp7
   YosyblwUhvJfjXTDFcSC2FDTrcWG1RSmXJj8cIpwlgAsF0o7kAuTEVZyA
   EdndyqN5ZK9+jXyl7JqrDwmdt3+V3C0r7V4irespSYyxnWjL3SFgmooI/
   pd0QXKjEiXV1IG9Qtra2Ift6gUmhICC5IOAIiU7HottkBmvNa39VTqKV/
   A==;
X-CSE-ConnectionGUID: bEVnC2oESquRsECwWyuzhg==
X-CSE-MsgGUID: PcqYtzURTf+UrRrx9UYEXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1198663"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1198663"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 02:55:16 -0700
X-CSE-ConnectionGUID: St5ELqOKQymMwmjBcEIoQg==
X-CSE-MsgGUID: +XokYbnPSwSHS3ozA7+Elg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3476125"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 Oct 2026 02:55:11 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJT2J-00000000PHW-3X6A;
	Wed, 21 Oct 2026 09:55:07 +0000
Date: Wed, 21 Oct 2026 17:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>, Jann Horn <jannh@google.com>,
	Kees Cook <kees@kernel.org>, Breno Leitao <leitao@debian.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH] kthread: Teach lockdep about kthread_flush_work()
 dependencies
Message-ID: <202610211757.UM0pu0Gh-lkp@intel.com>
References: <6dee36e290c2a3b85dcd7cdba2cab72fe57b25c4.camel@infradead.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6dee36e290c2a3b85dcd7cdba2cab72fe57b25c4.camel@infradead.org>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on chrome-platform/for-next]
[also build test WARNING on chrome-platform/for-firmware-next linus/master v7.3 next-20261019]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Woodhouse/kthread-Teach-lockdep-about-kthread_flush_work-dependencies/20261020-160400
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
patch link:    https://lore.kernel.org/r/6dee36e290c2a3b85dcd7cdba2cab72fe57b25c4.camel%40infradead.org
patch subject: [PATCH] kthread: Teach lockdep about kthread_flush_work() dependencies
config: s390-defconfig (https://download.01.org/0day-ci/archive/20261021/202610211757.UM0pu0Gh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610211757.UM0pu0Gh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610211757.UM0pu0Gh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vdpa/vdpa_sim/vdpa_sim.c:71:2: warning: unused variable '__work_key' [-Wunused-variable]
      71 |         kthread_init_work(work, vdpasim_mm_work_fn);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:219:32: note: expanded from macro 'kthread_init_work'
     219 |                 static struct lock_class_key __work_key;                \
         |                                              ^~~~~~~~~~
   drivers/vdpa/vdpa_sim/vdpa_sim.c:234:2: warning: unused variable '__work_key' [-Wunused-variable]
     234 |         kthread_init_work(&vdpasim->work, vdpasim_work_fn);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kthread.h:219:32: note: expanded from macro 'kthread_init_work'
     219 |                 static struct lock_class_key __work_key;                \
         |                                              ^~~~~~~~~~
   2 warnings generated.


vim +/__work_key +71 drivers/vdpa/vdpa_sim/vdpa_sim.c

4bb94d2de2fa90a Stefano Garzarella 2023-04-04  65  
4bb94d2de2fa90a Stefano Garzarella 2023-04-04  66  static void vdpasim_worker_change_mm_sync(struct vdpasim *vdpasim,
4bb94d2de2fa90a Stefano Garzarella 2023-04-04  67  					  struct vdpasim_mm_work *mm_work)
4bb94d2de2fa90a Stefano Garzarella 2023-04-04  68  {
4bb94d2de2fa90a Stefano Garzarella 2023-04-04  69  	struct kthread_work *work = &mm_work->work;
4bb94d2de2fa90a Stefano Garzarella 2023-04-04  70  
4bb94d2de2fa90a Stefano Garzarella 2023-04-04 @71  	kthread_init_work(work, vdpasim_mm_work_fn);
4bb94d2de2fa90a Stefano Garzarella 2023-04-04  72  	kthread_queue_work(vdpasim->worker, work);
4bb94d2de2fa90a Stefano Garzarella 2023-04-04  73  
4bb94d2de2fa90a Stefano Garzarella 2023-04-04  74  	kthread_flush_work(work);
4bb94d2de2fa90a Stefano Garzarella 2023-04-04  75  }
4bb94d2de2fa90a Stefano Garzarella 2023-04-04  76  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
