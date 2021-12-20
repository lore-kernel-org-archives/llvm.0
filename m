Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4D32C9D
	for <llvm@lists.linux.dev>; Mon, 20 Dec 2021 20:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640033844; x=1671569844;
  h=date:from:cc:subject:message-id:mime-version;
  bh=7OyOnIf+Jd2MsV8Hy66PWALG1YoRZgvQ11f/R0gUTwI=;
  b=c8RZVg8zJJ+Hkmw9AVJ6nfZR1VwmAsjVeEAOCy3vLJie0vmeyX6qlXXN
   ez04uv2GFCkufnW6xTvdKx2IishzEegWTChh3KI9I656tL72JhOlfylYX
   FcG5YfqQo5d1XvUqA/mrLfrtWi70JiGdRL9hea9I0DL+R1tJzlctG6RdB
   5ZKeAsRUROK/+6L5IDw9lMBoBQvx2I8DKSZf4/k/5YZVE0QLsEqwcHa9V
   6TqA6OGl7MhNxD9xbkkdP2/Xp58mymDjqTzM/ET9SVVyc9o8LKMiQeQMh
   Lo+XRMGsvdCjZwIPAeeRzsBjx8hiWNX7Nm4Cig8z84QY9nvTc93ktzZVg
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="227122099"
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="227122099"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 12:57:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,221,1635231600"; 
   d="scan'208";a="684415327"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Dec 2021 12:57:22 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzPik-0008En-5x; Mon, 20 Dec 2021 20:57:22 +0000
Date: Tue, 21 Dec 2021 04:56:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 4811/8898] drivers/media/usb/s2255/s2255drv.o:
 warning: objtool: read_pipe_completion()+0x151c: unreachable instruction
Message-ID: <202112210449.O7OgseCD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   07f8c60fe60f84977dc815ec8a6b1100827c34dd
commit: ee1806beff85d4f1a3d7f22aa1bcdc8ffb59b36c [4811/8898] media: videobuf2: add WARN_ON_ONCE if bytesused is bigger than buffer length
config: x86_64-randconfig-r026-20211220 (https://download.01.org/0day-ci/archive/20211221/202112210449.O7OgseCD-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 555eacf75f21cd1dfc6363d73ad187b730349543)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ee1806beff85d4f1a3d7f22aa1bcdc8ffb59b36c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ee1806beff85d4f1a3d7f22aa1bcdc8ffb59b36c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/ fs// mm//

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/usb/s2255/s2255drv.o: warning: objtool: read_pipe_completion()+0x151c: unreachable instruction
--
>> drivers/media/usb/uvc/uvc_queue.o: warning: objtool: uvc_queue_buffer_release()+0x1db: unreachable instruction
--
>> drivers/media/usb/gspca/gspca.o: warning: objtool: gspca_frame_add()+0x4d5: unreachable instruction
--
>> drivers/media/usb/pwc/pwc-uncompress.o: warning: objtool: pwc_decompress()+0x433: unreachable instruction
--
>> drivers/media/usb/cx231xx/cx231xx-video.o: warning: objtool: cx231xx_copy_video_line()+0x437: unreachable instruction
--
>> drivers/media/pci/dt3155/dt3155.o: warning: objtool: dt3155_buf_prepare()+0x97: unreachable instruction
--
>> drivers/media/pci/tw5864/tw5864-video.o: warning: objtool: tw5864_handle_frame_task()+0x6c8: unreachable instruction
--
>> drivers/input/touchscreen/atmel_mxt_ts.o: warning: objtool: mxt_buffer_queue()+0x5b2: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
