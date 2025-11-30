Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D89C2E2667;
	Sun, 30 Nov 2025 23:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764544330; cv=none; b=Z6bHh6uJ1edfZhuBkoULz+e8uKOFD7doTyFpw1xMbqKoPoowxJH5nxkjLN7CeIwuseHDyeGzX/b7RBOBIT/lz3MFnevrNlqRKz4RUBs/DkApDLGd8hxoGln83v0wO+ETPgn2OgELs4DjVkfj+9q5fUFx65YzVQYI0/qE+f7OmyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764544330; c=relaxed/simple;
	bh=Uk1rJbVhVosX9YkqfKXg9+pEgBDW8ZsYJb06Nfvu2/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NekD6UQKmn5WfifsBBB182zc8jc0D7GkkNBYomMXvdwVGwxCFrpuFJ65S6zwtnCQHoiTC1lhDg+KR95KpfLLbuTzWJNsYZ92aXdlf1d27L7ygSu5QmD+AskGl3LyzeBMorSIzm47tySOJ3DRh0cAOTjo6OSsFTrmOjbXdyZRFvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EYyTJm1l; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EYyTJm1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764544328; x=1796080328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uk1rJbVhVosX9YkqfKXg9+pEgBDW8ZsYJb06Nfvu2/I=;
  b=EYyTJm1lbVihvARNoMfSUSkKN0ykipmgNJ+58nhk5OGCl3VoRtUuGL6Z
   ATOVzKCneGe7r/t+C+QaAbC5DWRmF6bZV0tXeaZl5Zwmbm60pG17Za/qI
   WpBdgALjXjUxQQKG96QdaPKIOMcoNWmxar7Krc5eiP5fyeA4x7IAM8U2V
   niGZKerafTM/bR0tZ/i5ZOD5jkyGP1Q51MoSZdOQX0SzzYd4fkJgmr5hU
   F53NDxzB/NZnYfHOniIeQa1S/fsorIywOsjFBSWD8no4XCQ26Pe+3bRL+
   bpbz8wp/iqx13CqRslZ9Gen2KlYZx4y8wsWk2uQ82N1xePTN6GjszTuEA
   g==;
X-CSE-ConnectionGUID: pSET5PO9Tf+KaXB0hN1sBQ==
X-CSE-MsgGUID: y3zH2pQlTWi4BRIJzoY2Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="65482917"
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="65482917"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 15:12:07 -0800
X-CSE-ConnectionGUID: 1tN3z/FYTUOSQYdpMHOVwQ==
X-CSE-MsgGUID: FE1lWn3iQLy+wotM4gxIXA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Nov 2025 15:12:06 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPqaK-000000008EP-1Ltj;
	Sun, 30 Nov 2025 23:12:04 +0000
Date: Mon, 1 Dec 2025 07:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [lwn:docs-next 64/66] Warning:
 sound/usb/usx2y/us144mkii_controls.c:8 This comment starts with '/**', but
 isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202512010746.EPe9Xcp5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.lwn.net/linux.git docs-next
head:   464257baf99200d1be1c053f15aa617056361e81
commit: 5f88f44d8427a97347afda3a6114aed0df472a0b [64/66] docs: kdoc: various fixes for grammar, spelling, punctuation
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251201/202512010746.EPe9Xcp5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512010746.EPe9Xcp5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512010746.EPe9Xcp5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: sound/usb/usx2y/us144mkii_controls.c:6 Cannot find identifier on line:
    * @brief Text descriptions for playback output source options.
   Warning: sound/usb/usx2y/us144mkii_controls.c:7 Cannot find identifier on line:
    *
>> Warning: sound/usb/usx2y/us144mkii_controls.c:8 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Used by ALSA kcontrol elements to provide user-friendly names for
   Warning: sound/usb/usx2y/us144mkii_controls.c:15 Cannot find identifier on line:
    * @brief Text descriptions for capture input source options.
   Warning: sound/usb/usx2y/us144mkii_controls.c:16 Cannot find identifier on line:
    *
   Warning: sound/usb/usx2y/us144mkii_controls.c:17 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Used by ALSA kcontrol elements to provide user-friendly names for
   Warning: sound/usb/usx2y/us144mkii_controls.c:100 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_line_out_control ='
   Warning: sound/usb/usx2y/us144mkii_controls.c:171 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_digital_out_control ='
   Warning: sound/usb/usx2y/us144mkii_controls.c:259 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_capture_12_control ='
   Warning: sound/usb/usx2y/us144mkii_controls.c:330 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_capture_34_control ='
   Warning: sound/usb/usx2y/us144mkii_controls.c:408 cannot understand function prototype: 'const struct snd_kcontrol_new tascam_samplerate_control ='
--
   Warning: sound/usb/usx2y/us144mkii.c:13 Cannot find identifier on line:
    * @brief Module parameters for ALSA card instantiation.
   Warning: sound/usb/usx2y/us144mkii.c:14 Cannot find identifier on line:
    *
>> Warning: sound/usb/usx2y/us144mkii.c:15 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * These parameters allow users to configure how the ALSA sound card
--
>> Warning: drivers/infiniband/hw/mlx5/umr.c:986 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * This function makes an mkey non-present by zapping the translation entries of

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
