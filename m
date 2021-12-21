Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3499029CA
	for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 06:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91780C36AE2;
	Tue, 21 Dec 2021 06:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640069574;
	bh=96GuuOALDhdzlZe/EhLlh0pXfwbnGd0TKFENCB2Ca54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gsfar83xEaFstA4PEXPeyyCt7AAPF0pD3/9VCYbpXpnzbNrJe4cjy87J79qIuSN0R
	 D6h1NT5V01Nb4YCrB7PF3tMLmGMJ6Wo7PtIpnhUvCoidRDLB9bADhUb1Jzst5/0A/o
	 xLekIQ5DSM5QyhU+Yxe0jPJni/8BpTSVBVDpsV93pahYOFyKCPNh2XRGoYeYFYQV1r
	 HQRyXRXySX1GaJmn9wsk3K4oAF8d25gcry9E6bY4rSjjYeiQhgzNO8FSG2CcbZV3LP
	 0P3jW1bevCpCWo+FUNW53Ld5O8tL6ttq6/QQVQSA+mdRqp7O8Jm7qRMSlgigLsJoLA
	 xRDRk25+RNhkQ==
Date: Tue, 21 Dec 2021 14:52:48 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Adam Ford <aford173@gmail.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
	arm@kernel.org, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [soc:imx/drivers 7/7] drivers/soc/imx/imx8m-blk-ctrl.c:536:4:
 error: field designator 'mipi_phy_rst_mask' does not refer to any field in
 type 'const struct imx8m_blk_ctrl_domain_data'
Message-ID: <20211221065248.GA14131@dragon>
References: <202112211020.yQtfoIrI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202112211020.yQtfoIrI-lkp@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, Dec 21, 2021 at 10:43:48AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git imx/drivers
> head:   7f511d514e8c34b6dd0c17b5496e48b2a6a2626c
> commit: 7f511d514e8c34b6dd0c17b5496e48b2a6a2626c [7/7] soc: imx: imx8m-blk-ctrl: add i.MX8MN DISP blk-ctrl
> config: hexagon-randconfig-r045-20211220 (https://download.01.org/0day-ci/archive/20211221/202112211020.yQtfoIrI-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 555eacf75f21cd1dfc6363d73ad187b730349543)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=7f511d514e8c34b6dd0c17b5496e48b2a6a2626c
>         git remote add soc https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
>         git fetch --no-tags soc imx/drivers
>         git checkout 7f511d514e8c34b6dd0c17b5496e48b2a6a2626c
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/soc/imx/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/soc/imx/imx8m-blk-ctrl.c:536:4: error: field designator 'mipi_phy_rst_mask' does not refer to any field in type 'const struct imx8m_blk_ctrl_domain_data'
>                    .mipi_phy_rst_mask = BIT(17),
>                     ^

Thanks for reporting!

Arnd,

I overlooked that imx/drivers branch (commit 7f511d514e8c "soc: imx:
imx8m-blk-ctrl: add i.MX8MN DISP blk-ctrl") has a dependency on commit
042b67799e29 ("soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset"), which
has landed on Linus' tree as part of imx-fixes-5.16-2.  That said, this
is imx/drivers branch only issue.  linux-next and mainline should be
fine.

Sorry for the breakage.  I will be careful in the future.

Shawn
