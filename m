Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CA528E27;
	Mon,  6 Nov 2023 16:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+MdFGq5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4715BC433C8;
	Mon,  6 Nov 2023 16:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699289392;
	bh=FkLLP7umHYA2ZgZnRDuKbnRHPHhP92sdNne9Dpxa34I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+MdFGq5bnmlLR+qqCHx7nX7BsOgiMDzswMD2s/52ibyCv/WUh2DcU2nkr8jNzteo
	 Hd+El6Sjh+NEsxHfzwjPq1a3IrS2h32iscEWCMhdY1E8KhV0G3HMUsvfadRNE9NQcH
	 DEkOveLzRdlg2D/tqhtP6102sl5snjDKP+C39YoeEg4bcBSaMwlYLX3UefmVEJKmU+
	 Dhssg+2VBBdwKxsPToPOUVmA08BWyk+bxE7TGrepuvFjAaS3Li5xF8kIGOrMRs/Ess
	 FsIc1Rhm2/zhZWbG3YTVyzXUwITemPcErqjijLe1kgFaSMTyUDMhAv3RIkmegDYwmW
	 8/2A/Zupo3IFQ==
Date: Mon, 6 Nov 2023 09:49:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Rob Herring <robh@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: Re:
 [broonie-ci:v2_20231004_robh_asoc_dt_matching_and_header_cleanups 90/90]
 sound/soc/tegra/tegra210_amx.c:553:10: warning: variable 'soc_data' is
 uninitialized when used here
Message-ID: <20231106164950.GA1218555@dev-arch.thelio-3990X>
References: <202311060343.4TQWWtdK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202311060343.4TQWWtdK-lkp@intel.com>

On Mon, Nov 06, 2023 at 03:40:17AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20231004_robh_asoc_dt_matching_and_header_cleanups
> head:   2e52f94da275deea7cf5f16b3d8fe9c43529a41d
> commit: 2e52f94da275deea7cf5f16b3d8fe9c43529a41d [90/90] ASoC: Use device_get_match_data()
> config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311060343.4TQWWtdK-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060343.4TQWWtdK-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311060343.4TQWWtdK-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> sound/soc/tegra/tegra210_amx.c:553:10: warning: variable 'soc_data' is uninitialized when used here [-Wuninitialized]
>      553 |                                             soc_data->regmap_conf);
>          |                                             ^~~~~~~~
>    include/linux/regmap.h:1104:45: note: expanded from macro 'devm_regmap_init_mmio'
>     1104 |         devm_regmap_init_mmio_clk(dev, NULL, regs, config)
>          |                                                    ^~~~~~
>    include/linux/regmap.h:1090:24: note: expanded from macro 'devm_regmap_init_mmio_clk'
>     1090 |                                 dev, clk_id, regs, config)
>          |                                                    ^~~~~~
>    include/linux/regmap.h:735:6: note: expanded from macro '__regmap_lockdep_wrapper'
>      735 |                 fn(__VA_ARGS__, &_key,                                  \
>          |                    ^~~~~~~~~~~
>    sound/soc/tegra/tegra210_amx.c:538:40: note: initialize the variable 'soc_data' to silence this warning
>      538 |         struct tegra210_amx_soc_data *soc_data;
>          |                                               ^
>          |                                                = NULL
>    1 warning generated.

Just for the record, this was fixed by commit 41cb1126bed1 ("ASoC:
tegra: Fix -Wuninitialized in tegra210_amx_platform_probe()").

Cheers,
Nathan
