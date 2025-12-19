Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616E319DF4F;
	Fri, 19 Dec 2025 00:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766104843; cv=none; b=WYz2IpmljNnTHiGsR8ZiAP2hgcubaDJ8NoCzKirQCOAUffIYvFaew0MjFFbFyMemNFaYgDAxerm9NEoxWRed5O4ppD6A6iU4TU5INCstjTDiYK2Zx7XJAdNnmZvdqknSmDVSpRa9HPCH6I8B9q5ki5FhQ8BhPxAMAnMKnfzV41E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766104843; c=relaxed/simple;
	bh=vxQk63A/fOKnwXCzCiDXgbPKWUi3Hr0AvJ+PmmRsnH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TQ5T9OrgrGXpum9nkrax2XvZlc3wgdLBK9nQFvjcbEeiHFCfiqW6BuMbtL45LG1eOe0z0MYbc1Dmb+gGdSP/yr6T+MVl+eN7i5PV2gLC+8Wt3VDBxoSCXH2hANQ4Fc2Flzbm4iDlLKHW3EiZMP+D+bLdtf/XJK6XMt7di8FUd5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzqGOUkQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzqGOUkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766104840; x=1797640840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vxQk63A/fOKnwXCzCiDXgbPKWUi3Hr0AvJ+PmmRsnH4=;
  b=YzqGOUkQaRz4Aau1z9NZTxrVYFNGXN0+FZvHYUwzo1ThmgvwlNLpb+0H
   kbrBvXuOvjCsIlA2n4u14AA/4UG3fYXNrTsuBCSz11MlI7rCTzi8YDwkg
   xLhxLI9F6jSF7FB5ecBau9/8CleASfL3pZqUVKr04WSIHrIgzMoY/4F9R
   nQLogsF3IIPfs9llMshKmxaMf60R5+Kd0EZhyan33MDAThVE/tl5w7Wrh
   ggTrUu12zC2RF5jV0mg4B3px2h9NS58PtWX3ono1GItBZbkNHfwyBJBjh
   2sBif0RTDT4wHNJ8PGD7cv2Nm9CovOCFSATuYZsc38r1HKohuYxxg+2LB
   Q==;
X-CSE-ConnectionGUID: /quwyQYLSh28a1Zf8RQFmw==
X-CSE-MsgGUID: Kzilb4M8SYKXKaw+y1bjNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68143351"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="68143351"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 16:40:40 -0800
X-CSE-ConnectionGUID: gMydyncaQ1OYqLKnujbRDA==
X-CSE-MsgGUID: pWNg8ZT1RyWxK8z+leCdvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="222142888"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Dec 2025 16:40:39 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWOXs-000000002oT-1Vvm;
	Fri, 19 Dec 2025 00:40:36 +0000
Date: Fri, 19 Dec 2025 08:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1917/2322] sound/core/pcm_native.c:3308:6: error:
 cannot jump from this asm goto statement to one of its possible targets
Message-ID: <202512190802.i4Jzbcsl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1058ca9db0edaedcb16480cc74b78ed06f0d1f54
commit: f3d233daf011abbad2f6ebd0e545b42d2f378a4f [1917/2322] ALSA: pcm: Relax __free() variable declarations
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20251219/202512190802.i4Jzbcsl-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190802.i4Jzbcsl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190802.i4Jzbcsl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/core/pcm_native.c:3308:6: error: cannot jump from this asm goto statement to one of its possible targets
           if (put_user(result, &_xfern->result))
               ^
   arch/riscv/include/asm/uaccess.h:403:3: note: expanded from macro 'put_user'
                   __put_user((x), __p) :                          \
                   ^
   arch/riscv/include/asm/uaccess.h:376:2: note: expanded from macro '__put_user'
           __put_user_error(__val, __gu_ptr, __pu_err);            \
           ^
   arch/riscv/include/asm/uaccess.h:340:2: note: expanded from macro '__put_user_error'
           __put_user_nocheck(x, ptr, err_label);                  \
           ^
   arch/riscv/include/asm/uaccess.h:321:3: note: expanded from macro '__put_user_nocheck'
                   __put_user_asm("sb", (x), __gu_ptr, label);     \
                   ^
   arch/riscv/include/asm/uaccess.h:282:2: note: expanded from macro '__put_user_asm'
           asm goto(                                               \
           ^
   sound/core/pcm_native.c:3295:6: note: possible target of asm goto statement
           if (put_user(0, &_xfern->result))
               ^
   arch/riscv/include/asm/uaccess.h:403:3: note: expanded from macro 'put_user'
                   __put_user((x), __p) :                          \
                   ^
   arch/riscv/include/asm/uaccess.h:376:2: note: expanded from macro '__put_user'
           __put_user_error(__val, __gu_ptr, __pu_err);            \
           ^
   arch/riscv/include/asm/uaccess.h:341:15: note: expanded from macro '__put_user_error'
           break;                                                  \
                                                                   ^
   sound/core/pcm_native.c:3300:8: note: jump exits scope of variable with __attribute__((cleanup))
           void *bufs __free(kfree) =
                 ^
   sound/core/pcm_native.c:3295:6: error: cannot jump from this asm goto statement to one of its possible targets
           if (put_user(0, &_xfern->result))
               ^
   arch/riscv/include/asm/uaccess.h:403:3: note: expanded from macro 'put_user'
                   __put_user((x), __p) :                          \
                   ^
   arch/riscv/include/asm/uaccess.h:376:2: note: expanded from macro '__put_user'
           __put_user_error(__val, __gu_ptr, __pu_err);            \
           ^
   arch/riscv/include/asm/uaccess.h:340:2: note: expanded from macro '__put_user_error'
           __put_user_nocheck(x, ptr, err_label);                  \
           ^
   arch/riscv/include/asm/uaccess.h:321:3: note: expanded from macro '__put_user_nocheck'
                   __put_user_asm("sb", (x), __gu_ptr, label);     \
                   ^
   arch/riscv/include/asm/uaccess.h:282:2: note: expanded from macro '__put_user_asm'
           asm goto(                                               \
           ^
   sound/core/pcm_native.c:3308:6: note: possible target of asm goto statement
           if (put_user(result, &_xfern->result))
               ^
   arch/riscv/include/asm/uaccess.h:403:3: note: expanded from macro 'put_user'
                   __put_user((x), __p) :                          \
                   ^
   arch/riscv/include/asm/uaccess.h:376:2: note: expanded from macro '__put_user'
           __put_user_error(__val, __gu_ptr, __pu_err);            \
           ^
   arch/riscv/include/asm/uaccess.h:341:15: note: expanded from macro '__put_user_error'
           break;                                                  \
                                                                   ^
   sound/core/pcm_native.c:3300:8: note: jump bypasses initialization of variable with __attribute__((cleanup))
           void *bufs __free(kfree) =
                 ^
   2 errors generated.


vim +3308 sound/core/pcm_native.c

67616feda99e32 Takashi Iwai 2017-08-30  3283  
67616feda99e32 Takashi Iwai 2017-08-30  3284  static int snd_pcm_xfern_frames_ioctl(struct snd_pcm_substream *substream,
67616feda99e32 Takashi Iwai 2017-08-30  3285  				      struct snd_xfern __user *_xfern)
67616feda99e32 Takashi Iwai 2017-08-30  3286  {
67616feda99e32 Takashi Iwai 2017-08-30  3287  	struct snd_xfern xfern;
67616feda99e32 Takashi Iwai 2017-08-30  3288  	struct snd_pcm_runtime *runtime = substream->runtime;
67616feda99e32 Takashi Iwai 2017-08-30  3289  	snd_pcm_sframes_t result;
67616feda99e32 Takashi Iwai 2017-08-30  3290  
f0061c18c169f0 Takashi Iwai 2022-09-26  3291  	if (runtime->state == SNDRV_PCM_STATE_OPEN)
67616feda99e32 Takashi Iwai 2017-08-30  3292  		return -EBADFD;
67616feda99e32 Takashi Iwai 2017-08-30  3293  	if (runtime->channels > 128)
67616feda99e32 Takashi Iwai 2017-08-30  3294  		return -EINVAL;
67616feda99e32 Takashi Iwai 2017-08-30  3295  	if (put_user(0, &_xfern->result))
67616feda99e32 Takashi Iwai 2017-08-30  3296  		return -EFAULT;
67616feda99e32 Takashi Iwai 2017-08-30  3297  	if (copy_from_user(&xfern, _xfern, sizeof(xfern)))
67616feda99e32 Takashi Iwai 2017-08-30  3298  		return -EFAULT;
67616feda99e32 Takashi Iwai 2017-08-30  3299  
f3d233daf011ab Takashi Iwai 2025-12-16  3300  	void *bufs __free(kfree) =
f3d233daf011ab Takashi Iwai 2025-12-16  3301  		memdup_array_user(xfern.bufs, runtime->channels, sizeof(void *));
67616feda99e32 Takashi Iwai 2017-08-30  3302  	if (IS_ERR(bufs))
40a024b81d1cba Takashi Iwai 2024-09-02  3303  		return PTR_ERR(bufs);
67616feda99e32 Takashi Iwai 2017-08-30  3304  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
67616feda99e32 Takashi Iwai 2017-08-30  3305  		result = snd_pcm_lib_writev(substream, bufs, xfern.frames);
67616feda99e32 Takashi Iwai 2017-08-30  3306  	else
67616feda99e32 Takashi Iwai 2017-08-30  3307  		result = snd_pcm_lib_readv(substream, bufs, xfern.frames);
ebe6976d3634a3 Al Viro      2020-03-19 @3308  	if (put_user(result, &_xfern->result))
ebe6976d3634a3 Al Viro      2020-03-19  3309  		return -EFAULT;
67616feda99e32 Takashi Iwai 2017-08-30  3310  	return result < 0 ? result : 0;
67616feda99e32 Takashi Iwai 2017-08-30  3311  }
67616feda99e32 Takashi Iwai 2017-08-30  3312  

:::::: The code at line 3308 was first introduced by commit
:::::: ebe6976d3634a311367f72c2402f148ab9f23920 pcm_native: result of put_user() needs to be checked

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
