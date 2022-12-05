Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D3E15C8B;
	Mon,  5 Dec 2022 20:20:38 +0000 (UTC)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88343589;
	Mon,  5 Dec 2022 21:20:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1670271629;
	bh=iSP+2rDHGpQBGKye/R5g7M3Xo8ozyNXCDY5nD2esdYM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RRvdo/Rn+HIm44YVnb4Lpaa8XvAvFFCB0aO95dKUjWzScWLnECt7lTufVA2zclLhD
	 aimfumSUleAd5D7cjAikvCT4iHcZ8ZkNkNOqRucfsDbNL0q+dsm9mwRzkRgqwiVr08
	 +sc+Mw3h8tdlMzSHbfhyVepX+WOFARWzaqaqTrjM=
Message-ID: <926df743-9c43-9471-3c67-3df9f4e18204@ideasonboard.com>
Date: Mon, 5 Dec 2022 20:20:25 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [usb:usb-testing 2/2] drivers/usb/gadget/legacy/webcam.c:174:3:
 error: field designator 'bmInterfaceFlags' does not refer to any field in
 type 'const struct uvc_format_uncompressed'; did you mean 'bmInterlaceFlags'?
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <202212060347.MaTRoCo0-lkp@intel.com>
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <202212060347.MaTRoCo0-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Oops, forgot all about the legacy version. Sorry Greg - let me send a v2.

On 05/12/2022 19:33, kernel test robot wrote:
> Hi Daniel,
>
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   751fbcc59a16ece5d1fb35ae6b25ef79ffa92d0c
> commit: 751fbcc59a16ece5d1fb35ae6b25ef79ffa92d0c [2/2] usb: gadget: uvc: Rename bmInterfaceFlags -> bmInterlaceFlags
> config: arm-randconfig-r012-20221205
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 6e4cea55f0d1104408b26ac574566a0e4de48036)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install arm cross compiling tool for clang build
>          # apt-get install binutils-arm-linux-gnueabi
>          # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=751fbcc59a16ece5d1fb35ae6b25ef79ffa92d0c
>          git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
>          git fetch --no-tags usb usb-testing
>          git checkout 751fbcc59a16ece5d1fb35ae6b25ef79ffa92d0c
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/usb/gadget/legacy/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> drivers/usb/gadget/legacy/webcam.c:174:3: error: field designator 'bmInterfaceFlags' does not refer to any field in type 'const struct uvc_format_uncompressed'; did you mean 'bmInterlaceFlags'?
>             .bmInterfaceFlags       = 0,
>              ^~~~~~~~~~~~~~~~
>              bmInterlaceFlags
>     include/uapi/linux/usb/video.h:469:8: note: 'bmInterlaceFlags' declared here
>             __u8  bmInterlaceFlags;
>                   ^
>>> drivers/usb/gadget/legacy/webcam.c:225:3: error: field designator 'bmInterfaceFlags' does not refer to any field in type 'const struct uvc_format_mjpeg'; did you mean 'bmInterlaceFlags'?
>             .bmInterfaceFlags       = 0,
>              ^~~~~~~~~~~~~~~~
>              bmInterlaceFlags
>     include/uapi/linux/usb/video.h:525:8: note: 'bmInterlaceFlags' declared here
>             __u8  bmInterlaceFlags;
>                   ^
>     2 errors generated.
>
>
> vim +174 drivers/usb/gadget/legacy/webcam.c
>
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  160
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  161  static const struct uvc_format_uncompressed uvc_format_yuv = {
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  162  	.bLength		= UVC_DT_FORMAT_UNCOMPRESSED_SIZE,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  163  	.bDescriptorType	= USB_DT_CS_INTERFACE,
> bbafc0cb6c52c40 drivers/usb/gadget/webcam.c Laurent Pinchart 2010-07-10  164  	.bDescriptorSubType	= UVC_VS_FORMAT_UNCOMPRESSED,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  165  	.bFormatIndex		= 1,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  166  	.bNumFrameDescriptors	= 2,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  167  	.guidFormat		=
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  168  		{ 'Y',  'U',  'Y',  '2', 0x00, 0x00, 0x10, 0x00,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  169  		 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71},
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  170  	.bBitsPerPixel		= 16,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  171  	.bDefaultFrameIndex	= 1,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  172  	.bAspectRatioX		= 0,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  173  	.bAspectRatioY		= 0,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02 @174  	.bmInterfaceFlags	= 0,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  175  	.bCopyProtect		= 0,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  176  };
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  177
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  178  DECLARE_UVC_FRAME_UNCOMPRESSED(1);
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  179  DECLARE_UVC_FRAME_UNCOMPRESSED(3);
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  180
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  181  static const struct UVC_FRAME_UNCOMPRESSED(3) uvc_frame_yuv_360p = {
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  182  	.bLength		= UVC_DT_FRAME_UNCOMPRESSED_SIZE(3),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  183  	.bDescriptorType	= USB_DT_CS_INTERFACE,
> bbafc0cb6c52c40 drivers/usb/gadget/webcam.c Laurent Pinchart 2010-07-10  184  	.bDescriptorSubType	= UVC_VS_FRAME_UNCOMPRESSED,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  185  	.bFrameIndex		= 1,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  186  	.bmCapabilities		= 0,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  187  	.wWidth			= cpu_to_le16(640),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  188  	.wHeight		= cpu_to_le16(360),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  189  	.dwMinBitRate		= cpu_to_le32(18432000),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  190  	.dwMaxBitRate		= cpu_to_le32(55296000),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  191  	.dwMaxVideoFrameBufferSize	= cpu_to_le32(460800),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  192  	.dwDefaultFrameInterval	= cpu_to_le32(666666),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  193  	.bFrameIntervalType	= 3,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  194  	.dwFrameInterval[0]	= cpu_to_le32(666666),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  195  	.dwFrameInterval[1]	= cpu_to_le32(1000000),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  196  	.dwFrameInterval[2]	= cpu_to_le32(5000000),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  197  };
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  198
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  199  static const struct UVC_FRAME_UNCOMPRESSED(1) uvc_frame_yuv_720p = {
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  200  	.bLength		= UVC_DT_FRAME_UNCOMPRESSED_SIZE(1),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  201  	.bDescriptorType	= USB_DT_CS_INTERFACE,
> bbafc0cb6c52c40 drivers/usb/gadget/webcam.c Laurent Pinchart 2010-07-10  202  	.bDescriptorSubType	= UVC_VS_FRAME_UNCOMPRESSED,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  203  	.bFrameIndex		= 2,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  204  	.bmCapabilities		= 0,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  205  	.wWidth			= cpu_to_le16(1280),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  206  	.wHeight		= cpu_to_le16(720),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  207  	.dwMinBitRate		= cpu_to_le32(29491200),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  208  	.dwMaxBitRate		= cpu_to_le32(29491200),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  209  	.dwMaxVideoFrameBufferSize	= cpu_to_le32(1843200),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  210  	.dwDefaultFrameInterval	= cpu_to_le32(5000000),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  211  	.bFrameIntervalType	= 1,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  212  	.dwFrameInterval[0]	= cpu_to_le32(5000000),
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  213  };
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  214
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  215  static const struct uvc_format_mjpeg uvc_format_mjpg = {
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  216  	.bLength		= UVC_DT_FORMAT_MJPEG_SIZE,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  217  	.bDescriptorType	= USB_DT_CS_INTERFACE,
> bbafc0cb6c52c40 drivers/usb/gadget/webcam.c Laurent Pinchart 2010-07-10  218  	.bDescriptorSubType	= UVC_VS_FORMAT_MJPEG,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  219  	.bFormatIndex		= 2,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  220  	.bNumFrameDescriptors	= 2,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  221  	.bmFlags		= 0,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  222  	.bDefaultFrameIndex	= 1,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  223  	.bAspectRatioX		= 0,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  224  	.bAspectRatioY		= 0,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02 @225  	.bmInterfaceFlags	= 0,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  226  	.bCopyProtect		= 0,
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  227  };
> a9914127e834acf drivers/usb/gadget/webcam.c Laurent Pinchart 2010-05-02  228
>
> :::::: The code at line 174 was first introduced by commit
> :::::: a9914127e834acf648a96c72b4e271dc0c1c7c74 USB gadget: Webcam device
>
> :::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> :::::: CC: Greg Kroah-Hartman <gregkh@suse.de>
>
