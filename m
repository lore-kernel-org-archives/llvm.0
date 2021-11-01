Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC7D2C82
	for <llvm@lists.linux.dev>; Mon,  1 Nov 2021 14:23:12 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 24D551FD29;
	Mon,  1 Nov 2021 14:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1635776006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=why89enCaDF9WCGvUmo4lqZYsx6d3oL7d07jiR6kzCw=;
	b=jyKFE3+w5uVSoDF4UlMIdQRMKhWD7cCYTM7cCcVQK69pDErIlUBOQOOwrom25doY2ozNNe
	p+iTU24LKytJ0Cjh/6B5OJG5F4ZwiGU2XY7XKnO/mOeZxeKUqGVk87e9T15Fvq//DLPerE
	V5h30KJEkFSWkhx8jBG76eyxr/jfTjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1635776006;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=why89enCaDF9WCGvUmo4lqZYsx6d3oL7d07jiR6kzCw=;
	b=etmjCrwHhXCD7+tVX4fR5kSsgPWBAUoxj4EyJryR+p28UyNDAIBX55RYf6csXeJupNpeNR
	8OAyGNI0RMabvzBw==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 0AD23A3B81;
	Mon,  1 Nov 2021 14:13:26 +0000 (UTC)
Date: Mon, 1 Nov 2021 15:13:25 +0100 (CET)
From: Jiri Kosina <jkosina@suse.cz>
To: kernel test robot <lkp@intel.com>
cc: Roderick Colenbrander <roderick@gaikai.com>, llvm@lists.linux.dev, 
    kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 11496/12841] ld.lld: error: undefined symbol:
 led_mc_calc_color_components
In-Reply-To: <202110300524.TH5Nas3k-lkp@intel.com>
Message-ID: <nycvar.YFH.7.76.2111011513020.12554@cbobk.fhfr.pm>
References: <202110300524.TH5Nas3k-lkp@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 30 Oct 2021, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   bdcc9f6a568275aed4cc32fd2312432d2ff1b704
> commit: fc97b4d6a1a6d418fd4053fd7716eca746fdd163 [11496/12841] HID: playstation: expose DualSense lightbar through a multi-color LED.
> config: hexagon-randconfig-r013-20211028 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5db7568a6a1fcb408eb8988abdaff2a225a8eb72)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=fc97b4d6a1a6d418fd4053fd7716eca746fdd163
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout fc97b4d6a1a6d418fd4053fd7716eca746fdd163
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: devm_led_classdev_multicolor_register_ext
>    >>> referenced by hid-playstation.c
>    >>> hid/hid-playstation.o:(ps_lightbar_register) in archive drivers/built-in.a
>    >>> referenced by hid-playstation.c
>    >>> hid/hid-playstation.o:(ps_lightbar_register) in archive drivers/built-in.a
> --
> >> ld.lld: error: undefined symbol: led_mc_calc_color_components
>    >>> referenced by hid-playstation.c
>    >>> hid/hid-playstation.o:(dualsense_lightbar_set_brightness) in archive drivers/built-in.a
>    >>> referenced by hid-playstation.c
>    >>> hid/hid-playstation.o:(dualsense_lightbar_set_brightness) in archive drivers/built-in.a

From: Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH] HID: playstation: require multicolor LED functionality

The driver requires multicolor LED support; express that in Kconfig.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
---
 drivers/hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 3c33bf572d6d..d78b1c1fb97e 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -868,6 +868,7 @@ config HID_PLANTRONICS
 config HID_PLAYSTATION
 	tristate "PlayStation HID Driver"
 	depends on HID
+	depends on LEDS_CLASS_MULTICOLOR
 	select CRC32
 	select POWER_SUPPLY
 	help
-- 
Jiri Kosina
SUSE Labs
