Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8328C04;
	Tue, 31 Jan 2023 15:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93531C433D2;
	Tue, 31 Jan 2023 15:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675178369;
	bh=R7MRKH92+BcxDHB0UXCf4d671vCDR0/6DYFMi0daeoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h+eFVERnwW6onaLDCwawJoVuQlSjOd0KP8G10NVceNo+KTvXiMlRp82dwbGX8bBiH
	 fDJCg4ZfsL/+7pxlxj9mUWZ994i4EdV8ElvDCgRmlhEcscwKRmrxGGV21UClUzcpal
	 Sy/JzUE0z2V7Z4BpYs9wzk5n/JpLvK4oT6hbLwAmO9dcgKnDyvjfwmYHFbpVUXROiO
	 5h7jNv6/rRASTiTGss1y8w5AchNs75/+DXnze+wSBelgoPtcrx+evLkmY6h1JGydKT
	 /c6hRdiva35F7S1M7ZNPFxiXuRFAgmI4yFltvhLeJCi6P3vW4Ht2EpzxkJL/IV7ZOI
	 TGjOheb9f7i9w==
Date: Tue, 31 Jan 2023 23:19:26 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>
Subject: Re: drivers/platform/chrome/cros_ec_proto_test.c:2530:13: warning:
 stack frame size (1040) exceeds limit (1024) in
 'cros_ec_proto_test_get_sensor_count_legacy'
Message-ID: <Y9kxfi4jtEN6YMe0@google.com>
References: <202301311846.Y75Dbssa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301311846.Y75Dbssa-lkp@intel.com>

On Tue, Jan 31, 2023 at 06:22:29PM +0800, kernel test robot wrote:
> Hi Tzung-Bi,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   22b8077d0fcec86c6ed0e0fce9f7e7e5a4c2d56a
> commit: 33f0fdba6066b504ee0b5f1480b1f93b06050df6 platform/chrome: cros_ec_proto: add Kunit tests for get_sensor_count
> date:   7 months ago
> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230131/202301311846.Y75Dbssa-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc cross compiling tool for clang build
>         # apt-get install binutils-powerpc-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=33f0fdba6066b504ee0b5f1480b1f93b06050df6
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 33f0fdba6066b504ee0b5f1480b1f93b06050df6
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/net/ethernet/mellanox/mlx5/core/steering/ drivers/platform/chrome/ drivers/staging/media/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/platform/chrome/cros_ec_proto_test.c:2530:13: warning: stack frame size (1040) exceeds limit (1024) in 'cros_ec_proto_test_get_sensor_count_legacy' [-Wframe-larger-than]
>    static void cros_ec_proto_test_get_sensor_count_legacy(struct kunit *test)
>                ^
>    140/1040 (13.46%) spills, 900/1040 (86.54%) variables
>    1 warning generated.
> 
> 
> vim +/cros_ec_proto_test_get_sensor_count_legacy +2530 drivers/platform/chrome/cros_ec_proto_test.c
> 
>   2529	
> > 2530	static void cros_ec_proto_test_get_sensor_count_legacy(struct kunit *test)
>   2531	{
>   2532		struct cros_ec_proto_test_priv *priv = test->priv;
>   2533		struct cros_ec_device *ec_dev = &priv->ec_dev;
>   2534		struct ec_xfer_mock *mock;
>   2535		int ret, i;
>   2536		struct cros_ec_dev ec;

The issue has been fixed in linux-next by [1].

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git/commit/?h=for-next&id=6514bac4a321daaf2fdf3a116a644c77e4908f20
