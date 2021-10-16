Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A999F29CA
	for <llvm@lists.linux.dev>; Sat, 16 Oct 2021 07:40:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFCAC610D1;
	Sat, 16 Oct 2021 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634370016;
	bh=AjseRBNiL+8gW7D0eW+3auxbapp78QPhYDegRvMSpds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EWmR281oJmrhXn3Um1HXBDaX4T/IhWlQryURWr96dqvu5GaJcBrR+qfLcZmZWFu7n
	 rCslP3OueWmX6Le6s0Oeoqtr1S9KhTxuKMAYf5Mzk19Ioav09I5sf47ogzEXWiKNoP
	 1W2qLt0icMBe7gPl6BxOfiZ0diVgSDM/69Ry7qQGplvFyCC9LmufkT8Kn0HOSvaDbe
	 zQseUip8ZXHhzu4UrZspEa14skRuc3aQZzn8oyLx8OLUzKmmTDBqUfT3PSFxMACQST
	 l5AaEV4ozK/hbm2ikt+Zf0rZWTYl7BBFqN1xLIOPXgI/nbo+MnfJLNFOjed5MWMlS/
	 MzBM1m4S7MdOQ==
Date: Sat, 16 Oct 2021 15:40:10 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [shawnguo:imx/drivers 10/12]
 drivers/soc/imx/imx8m-blk-ctrl.c:401:3: error: use of undeclared identifier
 'IMX8MM_VPUBLK_PD_G1'
Message-ID: <20211016074009.GA25810@dragon>
References: <202110151646.C5aKbTIN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202110151646.C5aKbTIN-lkp@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Oct 15, 2021 at 04:10:51PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/drivers
> head:   72949f76565c9ea9f4231c977774a31d4713c386
> commit: 2684ac05a8c4d2d5c49e6c11eb6206b30a284813 [10/12] soc: imx: add i.MX8M blk-ctrl driver
> config: hexagon-randconfig-r045-20211014 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project acb3b187c4c88650a6a717a1bcb234d27d0d7f54)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/commit/?id=2684ac05a8c4d2d5c49e6c11eb6206b30a284813
>         git remote add shawnguo https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
>         git fetch --no-tags shawnguo imx/drivers
>         git checkout 2684ac05a8c4d2d5c49e6c11eb6206b30a284813
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

The dependency goes via a different branch than imx/drivers, and
for-next branch should be fine.

Shawn

> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/soc/imx/imx8m-blk-ctrl.c:401:3: error: use of undeclared identifier 'IMX8MM_VPUBLK_PD_G1'
>            [IMX8MM_VPUBLK_PD_G1] = {
>             ^
> >> drivers/soc/imx/imx8m-blk-ctrl.c:409:3: error: use of undeclared identifier 'IMX8MM_VPUBLK_PD_G2'
>            [IMX8MM_VPUBLK_PD_G2] = {
>             ^
> >> drivers/soc/imx/imx8m-blk-ctrl.c:417:3: error: use of undeclared identifier 'IMX8MM_VPUBLK_PD_H1'
>            [IMX8MM_VPUBLK_PD_H1] = {
>             ^
> >> drivers/soc/imx/imx8m-blk-ctrl.c:431:17: error: invalid application of 'sizeof' to an incomplete type 'const struct imx8m_blk_ctrl_domain_data []'
>            .num_domains = ARRAY_SIZE(imx8mm_vpu_blk_ctl_domain_data),
>                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/kernel.h:44:32: note: expanded from macro 'ARRAY_SIZE'
>    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>                                   ^~~~~
>    4 errors generated.
> 
> 
> vim +/IMX8MM_VPUBLK_PD_G1 +401 drivers/soc/imx/imx8m-blk-ctrl.c
> 
>    399	
>    400	static const struct imx8m_blk_ctrl_domain_data imx8mm_vpu_blk_ctl_domain_data[] = {
>  > 401		[IMX8MM_VPUBLK_PD_G1] = {
>    402			.name = "vpublk-g1",
>    403			.clk_names = (const char *[]){ "g1", },
>    404			.num_clks = 1,
>    405			.gpc_name = "g1",
>    406			.rst_mask = BIT(1),
>    407			.clk_mask = BIT(1),
>    408		},
>  > 409		[IMX8MM_VPUBLK_PD_G2] = {
>    410			.name = "vpublk-g2",
>    411			.clk_names = (const char *[]){ "g2", },
>    412			.num_clks = 1,
>    413			.gpc_name = "g2",
>    414			.rst_mask = BIT(0),
>    415			.clk_mask = BIT(0),
>    416		},
>  > 417		[IMX8MM_VPUBLK_PD_H1] = {
>    418			.name = "vpublk-h1",
>    419			.clk_names = (const char *[]){ "h1", },
>    420			.num_clks = 1,
>    421			.gpc_name = "h1",
>    422			.rst_mask = BIT(2),
>    423			.clk_mask = BIT(2),
>    424		},
>    425	};
>    426	
>    427	static const struct imx8m_blk_ctrl_data imx8mm_vpu_blk_ctl_dev_data = {
>    428		.max_reg = 0x18,
>    429		.power_notifier_fn = imx8mm_vpu_power_notifier,
>    430		.domains = imx8mm_vpu_blk_ctl_domain_data,
>  > 431		.num_domains = ARRAY_SIZE(imx8mm_vpu_blk_ctl_domain_data),
>    432	};
>    433	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


