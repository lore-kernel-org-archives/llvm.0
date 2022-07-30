Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667F028E8
	for <llvm@lists.linux.dev>; Sat, 30 Jul 2022 11:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB801C433C1;
	Sat, 30 Jul 2022 11:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1659179306;
	bh=RFCjEIXYtlsw0dHGNFpOiQWzJCSmz+sziuYk25gdzf8=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=zlf3jV1iEv/KZ41B6aCeByR1ALRNOGb2PcKLD+qouI5CbbsBcYxkFtxYPoSop0RYj
	 DmsrIs8SG0K6TCs7TIzNRXJ14P/EZDhFLk80exNE2Illh7ltx6QYld0N7D6ESw0obl
	 WrLRL5hN3/cewfLL5A9g+ltHgfUcNaXZ/r+nqsbU=
Date: Sat, 30 Jul 2022 13:08:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>,
	Phillip Potter <phil@philpotter.co.uk>, devel@driverdev.osuosl.org,
	llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: Re: [staging:staging-testing 54/54]
 drivers/staging/r8188eu/core/rtw_pwrctrl.c:400:6: warning: variable 'ret' is
 used uninitialized whenever 'if' condition is false
Message-ID: <YuURJ8ecN1cN56v/@kroah.com>
References: <202207301623.BfMKLfhv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202207301623.BfMKLfhv-lkp@intel.com>

On Sat, Jul 30, 2022 at 04:14:57PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-testing
> head:   f3a76018dd55d8ddcd28cb47049f46ae5c0ce557
> commit: f3a76018dd55d8ddcd28cb47049f46ae5c0ce557 [54/54] staging: r8188eu: remove initializer from ret in rtw_pwr_wakeup
> config: hexagon-randconfig-r015-20220729 (https://download.01.org/0day-ci/archive/20220730/202207301623.BfMKLfhv-lkp@intel.com/config)
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?id=f3a76018dd55d8ddcd28cb47049f46ae5c0ce557
>         git remote add staging https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
>         git fetch --no-tags staging staging-testing
>         git checkout f3a76018dd55d8ddcd28cb47049f46ae5c0ce557
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/staging/r8188eu/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/staging/r8188eu/core/rtw_pwrctrl.c:400:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>            if (padapter->bDriverStopped || !padapter->bup || !padapter->hw_init_completed) {
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/staging/r8188eu/core/rtw_pwrctrl.c:409:9: note: uninitialized use occurs here
>            return ret;
>                   ^~~
>    drivers/staging/r8188eu/core/rtw_pwrctrl.c:400:2: note: remove the 'if' if its condition is always true
>            if (padapter->bDriverStopped || !padapter->bup || !padapter->hw_init_completed) {
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/staging/r8188eu/core/rtw_pwrctrl.c:384:9: note: initialize the variable 'ret' to silence this warning
>            int ret;
>                   ^
>                    = 0
>    1 warning generated.

Phillip, can you send a follow-up patch for this issue?

thanks,

greg k-h
