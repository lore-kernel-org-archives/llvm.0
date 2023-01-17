Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8131FB2;
	Tue, 17 Jan 2023 08:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1070FC433D2;
	Tue, 17 Jan 2023 08:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673943068;
	bh=3VeHFq1M6ph27cKYLc0GP6LGGDuQ0Jo6pw/Q7JfWUlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zg+apXeEQJLAaDphQWKt25vRKsSUrgpsCRLBhWX0J0wXZHzWVuSqt5EYGpSeZnVUt
	 KNk+qD2hyPnWoMFID7YxlT020RaqrNhoFjZo2wBbuCXoUCASoSeP9EUPiuxw/3hwY0
	 CGrhTyNQwTeewBJXiDQ0+bpyqPvin94BDg/hhK2PpOx+DvatBntxbPLIYQn1KRi2yD
	 Zecy0SDAE6evuwp+OF44pU6CTuSKjv50uFauNv2K4NK1hA/1Q6X3l7NGapT9dY3VRE
	 1vzAWff2/2ETRmYXG8qdurDJQjVbIAl6kDLG9FNcKoWmGfU4RcJaHDImrYWcVQw0TY
	 Qcx1sSF4YT64Q==
Date: Tue, 17 Jan 2023 16:11:04 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>
Subject: Re: drivers/platform/chrome/cros_ec_proto_test.c:2530:13: warning:
 stack frame size (1040) exceeds limit (1024) in
 'cros_ec_proto_test_get_sensor_count_legacy'
Message-ID: <Y8ZYGKpEopzDUbAQ@google.com>
References: <202301141043.DtsZqxIr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301141043.DtsZqxIr-lkp@intel.com>

On Sat, Jan 14, 2023 at 10:28:29AM +0800, kernel test robot wrote:
> Hi Tzung-Bi,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   97ec4d559d939743e8af83628be5af8da610d9dc
> commit: 33f0fdba6066b504ee0b5f1480b1f93b06050df6 platform/chrome: cros_ec_proto: add Kunit tests for get_sensor_count
> date:   6 months ago
> config: powerpc-allmodconfig
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 8d9828ef5aa9688500657d36cd2aefbe12bbd162)
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
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/platform/chrome/ drivers/staging/media/
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

This is the 3rd time to see the warning.  I wasn't able to reproduce the
warning in my environment until I figured out a way by leveraging docker.

Anyway, the proposed fix is at [1].

[1]: https://patchwork.kernel.org/project/chrome-platform/patch/20230117080254.2725536-1-tzungbi@kernel.org/.
