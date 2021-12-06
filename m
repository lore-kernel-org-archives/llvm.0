Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301142CA8
	for <llvm@lists.linux.dev>; Mon,  6 Dec 2021 14:11:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10189"; a="234833066"
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; 
   d="scan'208";a="234833066"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2021 06:05:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; 
   d="scan'208";a="461820677"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 06 Dec 2021 06:05:09 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1muEc8-000LKH-Ea; Mon, 06 Dec 2021 14:05:08 +0000
Date: Mon, 6 Dec 2021 22:04:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>,
	linux-usb@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, balbi@kernel.org,
	laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
	kernel@pengutronix.de
Subject: Re: [PATCH v4 7/7] usb: gadget: uvc: add format/frame handling code
Message-ID: <202112062124.HEJZJ0fR-lkp@intel.com>
References: <20211205225803.268492-8-m.grzeschik@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211205225803.268492-8-m.grzeschik@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Michael,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on usb/usb-testing v5.16-rc4 next-20211206]
[cannot apply to balbi-usb/testing/next peter-chen-usb/for-usb-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Grzeschik/usb-gadget-uvc-use-configfs-entries-for-negotiation-and-v4l2-VIDIOCS/20211206-070014
base:   git://linuxtv.org/media_tree.git master
config: riscv-randconfig-r024-20211205 (https://download.01.org/0day-ci/archive/20211206/202112062124.HEJZJ0fR-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6e8678903523019903222e4521a5e41af743cab0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/8fdc5cd9a8845e9a061b42155d8d05ddb8514921
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Grzeschik/usb-gadget-uvc-use-configfs-entries-for-negotiation-and-v4l2-VIDIOCS/20211206-070014
        git checkout 8fdc5cd9a8845e9a061b42155d8d05ddb8514921
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/usb/gadget/function/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/usb/gadget/function/uvc_v4l2.c:73:2: warning: variable 'uformat' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
           list_for_each_entry(format, &uvc->header->formats, entry) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:631:7: note: expanded from macro 'list_for_each_entry'
                !list_entry_is_head(pos, head, member);                    \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/uvc_v4l2.c:81:9: note: uninitialized use occurs here
           return uformat;
                  ^~~~~~~
   drivers/usb/gadget/function/uvc_v4l2.c:73:2: note: remove the condition if it is always true
           list_for_each_entry(format, &uvc->header->formats, entry) {
           ^
   include/linux/list.h:631:7: note: expanded from macro 'list_for_each_entry'
                !list_entry_is_head(pos, head, member);                    \
                ^
   drivers/usb/gadget/function/uvc_v4l2.c:70:29: note: initialize the variable 'uformat' to silence this warning
           struct uvcg_format *uformat;
                                      ^
                                       = NULL
   drivers/usb/gadget/function/uvc_v4l2.c:139:2: warning: variable 'uformat' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
           list_for_each_entry(format, &uvc->header->formats, entry) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:631:7: note: expanded from macro 'list_for_each_entry'
                !list_entry_is_head(pos, head, member);                    \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/uvc_v4l2.c:148:9: note: uninitialized use occurs here
           return uformat;
                  ^~~~~~~
   drivers/usb/gadget/function/uvc_v4l2.c:139:2: note: remove the condition if it is always true
           list_for_each_entry(format, &uvc->header->formats, entry) {
           ^
   include/linux/list.h:631:7: note: expanded from macro 'list_for_each_entry'
                !list_entry_is_head(pos, head, member);                    \
                ^
   drivers/usb/gadget/function/uvc_v4l2.c:137:29: note: initialize the variable 'uformat' to silence this warning
           struct uvcg_format *uformat;
                                      ^
                                       = NULL
>> drivers/usb/gadget/function/uvc_v4l2.c:334:14: error: use of undeclared identifier 'video'
                   spin_lock(&video->frame_lock);
                              ^
   drivers/usb/gadget/function/uvc_v4l2.c:339:16: error: use of undeclared identifier 'video'
                   spin_unlock(&video->frame_lock);
                                ^
   2 warnings and 2 errors generated.


vim +/video +334 drivers/usb/gadget/function/uvc_v4l2.c

   305	
   306	static int
   307	uvc_v4l2_enum_frameintervals(struct file *file, void *fh,
   308			struct v4l2_frmivalenum *fival)
   309	{
   310		struct video_device *vdev = video_devdata(file);
   311		struct uvc_device *uvc = video_get_drvdata(vdev);
   312		struct uvcg_format *uformat = NULL;
   313		struct uvcg_frame *uframe = NULL;
   314		struct uvcg_frame_ptr *frame;
   315	
   316		uformat = find_format_by_pix(uvc, fival->pixel_format);
   317		if (!uformat)
   318			return -EINVAL;
   319	
   320		list_for_each_entry(frame, &uformat->frames, entry) {
   321			if (frame->frm->frame.w_width == fival->width &&
   322			    frame->frm->frame.w_height == fival->height) {
   323				uframe = frame->frm;
   324				break;
   325			}
   326		}
   327		if (!uframe)
   328			return -EINVAL;
   329	
   330		if (uvc->streamon) {
   331			if (fival->index >= 1)
   332				return -EINVAL;
   333	
 > 334			spin_lock(&video->frame_lock);
   335	
   336			fival->discrete.numerator =
   337				uframe->dw_frame_interval[uvc->video.cur_ival - 1];
   338	
   339			spin_unlock(&video->frame_lock);
   340		} else {
   341			if (fival->index >= uframe->frame.b_frame_interval_type)
   342				return -EINVAL;
   343	
   344			fival->discrete.numerator =
   345				uframe->dw_frame_interval[fival->index];
   346		}
   347	
   348		/* TODO: handle V4L2_FRMIVAL_TYPE_STEPWISE */
   349		fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
   350		fival->discrete.denominator = 10000000;
   351		v4l2_simplify_fraction(&fival->discrete.numerator,
   352			&fival->discrete.denominator, 8, 333);
   353	
   354		return 0;
   355	}
   356	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
