Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB375EEBB;
	Thu, 25 Apr 2024 02:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714010801; cv=none; b=vGK27VVPIhFh2eJ6cxvV0aebhCkEY4NSAK1H9NP1ClBL+bEsxet/HsdURAJqYzwEh0PUYc9WIFa/1ExEnueun1Qym8Hauv3T2RAGCjmH6zLZZ84vqCInnTTOyBIc4AzqbsTou2bKHQZUW5Wv89XEKxd4575bhfkz0HM3MQR/3Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714010801; c=relaxed/simple;
	bh=tB1cNhvPbDA6tFIgVtq97kIWZQLqfJ0vPrQKJlMGpRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jGSakuq/VeiCJkJW+CS4xKWgYL7xUlUtGhZBafmNSPf8mf+lyL3FG4xUI3ZEm07e9upUmgVLFJhjHJSni75DFKYDmouG80sFsL2y5IY+IEfa3eBpXBJ/ds46e0RJWAAOcUeApHx3sM7z4ck49t77CpdNeSpHOoDu9+4ymrjgh6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHHJN/1I; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHHJN/1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714010800; x=1745546800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tB1cNhvPbDA6tFIgVtq97kIWZQLqfJ0vPrQKJlMGpRQ=;
  b=RHHJN/1IjlS3MLCLQtVhaPk9LpMpanYV7is1+Vjgh9Ijgp2P2tshH1EH
   oYxzQQLQko7nlHaXWrhQs1iHumJmj4gvfR5NYADMOnMUJoPfpJB7w4ly/
   K6tM82igDNiTAI7INyrGd3AJbWMhq1hpFrQLRB6Bf1ycZ6RI5rxg0z4q1
   0qgxz75mDapEItYtRiG8xchHHSVdSuh2a7Ld7GYnbH8U3vUcycoqvL91z
   EoCA8U5WYdsKXqZ23Q/GZb1FoaWD2+6hFVSHRjUu51O8mWW8lHrBzinbu
   aVD0g0ZOMDvu+K8r0j5P5B2Dxg3izMGyVW28r9db5f582K7ZEuX5cIEkB
   w==;
X-CSE-ConnectionGUID: BaNwMhjlS420T+O+AeALWw==
X-CSE-MsgGUID: rphHaQkpQqmUrqTBSXWIVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9501292"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="9501292"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 19:06:40 -0700
X-CSE-ConnectionGUID: NLfvrKN0SOipXXDQbY/BYQ==
X-CSE-MsgGUID: DXDGZVdZTZCsrRYePgwIow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="25414971"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Apr 2024 19:06:38 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzoVP-0001qm-2K;
	Thu, 25 Apr 2024 02:06:35 +0000
Date: Thu, 25 Apr 2024 10:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:vivid-kthread 28/28]
 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:755:3: error:
 incompatible pointer types passing 'unsigned long *' to parameter of type
 'uint64_t *' (aka 'unsigned long long *')
Message-ID: <202404251001.3KAREyKB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git vivid-kthread
head:   404b51a535929c9a450789672159370d1c11d48f
commit: 404b51a535929c9a450789672159370d1c11d48f [28/28] media: vivid: make the timestamps/seq numbers reliable
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240425/202404251001.3KAREyKB-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404251001.3KAREyKB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404251001.3KAREyKB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/media/test-drivers/vivid/vivid-kthread-cap.c:755:3: warning: comparison of distinct pointer types ('typeof ((next_jiffies)) *' (aka 'unsigned long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
                   do_div(next_jiffies, denominator);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
           (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
                  ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> drivers/media/test-drivers/vivid/vivid-kthread-cap.c:755:3: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
                   do_div(next_jiffies, denominator);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
                   __rem = __div64_32(&(n), __base);       \
                                      ^~~~
   arch/arm/include/asm/div64.h:24:45: note: passing argument to parameter 'n' here
   static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
                                               ^
>> drivers/media/test-drivers/vivid/vivid-kthread-cap.c:755:3: warning: shift count >= width of type [-Wshift-count-overflow]
                   do_div(next_jiffies, denominator);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) == 0)) {          \
                                  ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   2 warnings and 1 error generated.
--
>> drivers/media/test-drivers/vivid/vivid-kthread-out.c:224:3: warning: comparison of distinct pointer types ('typeof ((next_jiffies)) *' (aka 'unsigned long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
                   do_div(next_jiffies, denominator);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
           (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
                  ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> drivers/media/test-drivers/vivid/vivid-kthread-out.c:224:3: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
                   do_div(next_jiffies, denominator);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
                   __rem = __div64_32(&(n), __base);       \
                                      ^~~~
   arch/arm/include/asm/div64.h:24:45: note: passing argument to parameter 'n' here
   static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
                                               ^
>> drivers/media/test-drivers/vivid/vivid-kthread-out.c:224:3: warning: shift count >= width of type [-Wshift-count-overflow]
                   do_div(next_jiffies, denominator);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) == 0)) {          \
                                  ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   2 warnings and 1 error generated.
--
>> drivers/media/test-drivers/vivid/vivid-kthread-touch.c:128:3: warning: comparison of distinct pointer types ('typeof ((next_jiffies)) *' (aka 'unsigned long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
                   do_div(next_jiffies, denominator);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
           (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
                  ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> drivers/media/test-drivers/vivid/vivid-kthread-touch.c:128:3: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
                   do_div(next_jiffies, denominator);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
                   __rem = __div64_32(&(n), __base);       \
                                      ^~~~
   arch/arm/include/asm/div64.h:24:45: note: passing argument to parameter 'n' here
   static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
                                               ^
>> drivers/media/test-drivers/vivid/vivid-kthread-touch.c:128:3: warning: shift count >= width of type [-Wshift-count-overflow]
                   do_div(next_jiffies, denominator);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) == 0)) {          \
                                  ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   2 warnings and 1 error generated.


vim +755 drivers/media/test-drivers/vivid/vivid-kthread-cap.c

   660	
   661	static int vivid_thread_vid_cap(void *data)
   662	{
   663		struct vivid_dev *dev = data;
   664		u64 start_time;
   665		u64 numerators_since_start;
   666		u64 buffers_since_start;
   667		u64 f_time;
   668		u32 seq_offset = 0;
   669		unsigned long next_jiffies;
   670		unsigned long jiffies_since_start;
   671		unsigned long cur_jiffies;
   672		unsigned numerator;
   673		unsigned denominator;
   674		int dropped_bufs;
   675	
   676		dprintk(dev, 1, "Video Capture Thread Start\n");
   677	
   678		set_freezable();
   679	
   680		/* Resets frame counters */
   681		dev->cap_seq_count = 0;
   682		dev->cap_seq_resync = false;
   683		dev->jiffies_vid_cap = jiffies;
   684		start_time = ktime_get_ns();
   685		if (dev->time_wrap)
   686			dev->time_wrap_offset = dev->time_wrap - start_time;
   687		else
   688			dev->time_wrap_offset = 0;
   689		vivid_cap_update_frame_period(dev);
   690	
   691		for (;;) {
   692			try_to_freeze();
   693			if (kthread_should_stop())
   694				break;
   695	
   696			if (!mutex_trylock(&dev->mutex)) {
   697				schedule();
   698				continue;
   699			}
   700	
   701			cur_jiffies = jiffies;
   702			if (dev->cap_seq_resync) {
   703				dev->jiffies_vid_cap = cur_jiffies;
   704				seq_offset = dev->cap_seq_count + 1;
   705				dev->cap_seq_count = 0;
   706				start_time += dev->cap_frame_period * seq_offset;
   707				vivid_cap_update_frame_period(dev);
   708				dev->cap_seq_resync = false;
   709			}
   710			numerator = dev->timeperframe_vid_cap.numerator;
   711			denominator = dev->timeperframe_vid_cap.denominator;
   712	
   713			if (dev->field_cap == V4L2_FIELD_ALTERNATE)
   714				denominator *= 2;
   715	
   716			/* Calculate the number of jiffies since we started streaming */
   717			jiffies_since_start = cur_jiffies - dev->jiffies_vid_cap;
   718			/* Get the number of buffers streamed since the start */
   719			buffers_since_start = (u64)jiffies_since_start * denominator;
   720			do_div(buffers_since_start, HZ * numerator);
   721			f_time = start_time + dev->time_wrap_offset +
   722				buffers_since_start * dev->cap_frame_period;
   723	
   724			/*
   725			 * After more than 0xf0000000 (rounded down to a multiple of
   726			 * 'jiffies-per-day' to ease jiffies_to_msecs calculation)
   727			 * jiffies have passed since we started streaming reset the
   728			 * counters and keep track of the sequence offset.
   729			 */
   730			if (jiffies_since_start > JIFFIES_RESYNC) {
   731				dev->jiffies_vid_cap = cur_jiffies;
   732				seq_offset = buffers_since_start;
   733				buffers_since_start = 0;
   734			}
   735			dropped_bufs = buffers_since_start + seq_offset - dev->cap_seq_count;
   736			dev->cap_seq_count = buffers_since_start + seq_offset;
   737			dev->vid_cap_seq_count = dev->cap_seq_count - dev->vid_cap_seq_start;
   738			dev->vbi_cap_seq_count = dev->cap_seq_count - dev->vbi_cap_seq_start;
   739			dev->meta_cap_seq_count = dev->cap_seq_count - dev->meta_cap_seq_start;
   740	
   741			vivid_thread_vid_cap_tick(dev, dropped_bufs, f_time);
   742			mutex_unlock(&dev->mutex);
   743	
   744			/*
   745			 * Calculate the number of 'numerators' streamed since we started,
   746			 * including the current buffer.
   747			 */
   748			numerators_since_start = ++buffers_since_start * numerator;
   749	
   750			/*
   751			 * Calculate when that next buffer is supposed to start
   752			 * in jiffies since we started streaming.
   753			 */
   754			next_jiffies = numerators_since_start * HZ + denominator - 1;
 > 755			do_div(next_jiffies, denominator);
   756			next_jiffies += dev->jiffies_vid_cap;
   757	
   758			while (time_is_after_jiffies(next_jiffies) &&
   759			       !kthread_should_stop())
   760				schedule();
   761		}
   762		dprintk(dev, 1, "Video Capture Thread End\n");
   763		return 0;
   764	}
   765	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
