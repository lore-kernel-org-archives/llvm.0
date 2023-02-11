Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D668A10E3;
	Sat, 11 Feb 2023 08:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A450C433D2;
	Sat, 11 Feb 2023 08:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1676105222;
	bh=+FMf7SM35Vwebc9PQX5xFXzoWFizobalos00oIOLcJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rKNHlTxPc6xRGVpn33VmiCweDhn1rD1lKdNROTLwdoIzefnJUF+6gxbzBxJKreuf1
	 IKRiiwZyHiCAP70wgouCtCFd/D+dC8Dpc3sBpAtQxxyWKMIqRaqigAcUdjYGrsirH+
	 +aSD7DqZNNyvk6r3zgHAy8qMRevj7mCVN/q9LYLo=
Date: Sat, 11 Feb 2023 09:46:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Longlong Xia <xialonglong1@huawei.com>, devel@driverdev.osuosl.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [driver-core:driver-core-testing 77/77]
 drivers/base/base.h:221:63: error: void function 'devtmpfs_delete_node'
 should not return a value
Message-ID: <Y+dWA9pfCuUZC4XB@kroah.com>
References: <202302102345.UQfDskhW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302102345.UQfDskhW-lkp@intel.com>

On Fri, Feb 10, 2023 at 11:38:45PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-testing
> head:   ecfd9f08fe2ef7616477c089dce1b0f05dcee13c
> commit: ecfd9f08fe2ef7616477c089dce1b0f05dcee13c [77/77] devtmpfs: remove return value of devtmpfs_delete_node()
> config: arm-randconfig-r006-20230210 (https://download.01.org/0day-ci/archive/20230210/202302102345.UQfDskhW-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=ecfd9f08fe2ef7616477c089dce1b0f05dcee13c
>         git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
>         git fetch --no-tags driver-core driver-core-testing
>         git checkout ecfd9f08fe2ef7616477c089dce1b0f05dcee13c
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202302102345.UQfDskhW-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/base/core.c:35:
> >> drivers/base/base.h:221:63: error: void function 'devtmpfs_delete_node' should not return a value [-Wreturn-type]
>    static inline void devtmpfs_delete_node(struct device *dev) { return 0; }
>                                                                  ^      ~
>    1 error generated.

I've fixed this up by hand by modifying the original commit and pushing
out an update.  No need for a separate patch.

thanks,

greg k-h
