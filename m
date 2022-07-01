Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2740C1855
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 08:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1CFC3411E;
	Fri,  1 Jul 2022 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656665961;
	bh=Cp+VKrrZ5YR+oIkwv5yfto2VBhn5YWAggfrsVnGgAJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VGZAOKEoR1mdokjuWTdCEVkGdj5IQz8U19GroifZMlSyofONTzzsFLt7OtNgEVR/m
	 tl7YfdD98PG+xIk2GIwPfaPej7zFEzYuP9nQwC+sVqGR0156Ozl2Nvv/JiYTnnKqiK
	 87rQtKgtR4vIlXGXjxFoyug0d2gu1nN2urnKgUPQ=
Date: Fri, 1 Jul 2022 10:59:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Subject: Re: [char-misc:char-misc-linus 3/3]
 drivers/misc/cardreader/rtsx_usb.c:639:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is true
Message-ID: <Yr63Zyvj49o8U/ti@kroah.com>
References: <202207011658.rHJFVLWA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202207011658.rHJFVLWA-lkp@intel.com>

On Fri, Jul 01, 2022 at 04:49:50PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-linus
> head:   3776c78559853fd151be7c41e369fd076fb679d5
> commit: 3776c78559853fd151be7c41e369fd076fb679d5 [3/3] misc: rtsx_usb: use separate command and response buffers
> config: arm-buildonly-randconfig-r006-20220629 (https://download.01.org/0day-ci/archive/20220701/202207011658.rHJFVLWA-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a9119143a2d1f4d0d0bc1fe0d819e5351b4e0deb)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/commit/?id=3776c78559853fd151be7c41e369fd076fb679d5
>         git remote add char-misc https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
>         git fetch --no-tags char-misc char-misc-linus
>         git checkout 3776c78559853fd151be7c41e369fd076fb679d5
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/misc/cardreader/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/misc/cardreader/rtsx_usb.c:639:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>            if (!ucr->rsp_buf)
>                ^~~~~~~~~~~~~
>    drivers/misc/cardreader/rtsx_usb.c:678:9: note: uninitialized use occurs here
>            return ret;
>                   ^~~
>    drivers/misc/cardreader/rtsx_usb.c:639:2: note: remove the 'if' if its condition is always false
>            if (!ucr->rsp_buf)
>            ^~~~~~~~~~~~~~~~~~
>    drivers/misc/cardreader/rtsx_usb.c:622:9: note: initialize the variable 'ret' to silence this warning
>            int ret;
>                   ^
>                    = 0
>    1 warning generated.

Odd, gcc doesn't show this for me.  Shuah, can you send a follow-on
patch to fix this?  The warning does look correct.

thanks,

greg k-h
