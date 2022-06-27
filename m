Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A14120F3
	for <llvm@lists.linux.dev>; Mon, 27 Jun 2022 07:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38FCC341C8;
	Mon, 27 Jun 2022 07:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656313767;
	bh=HQWy+ZcbYsga3egfveuhTsMFNg3CDz1LdwyKcg2cAtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ctUtGF52BnLmiQCzRDzievl5iphkktdj44Vc1iMFio6p/XvNVD2aERRBjwA0ZgJNX
	 lEeCTBE6xufQ4S6ghhqzcXQ1H2iAOPjPHDeRJfchBaJKdA/rHeGt96FZArvswYInpN
	 yKoEn4vX6nMh2LQhdl5537lb+PaalMrShrc9MC5NTvUbNnwh0VAZF0zvKwGvSmmy1e
	 aqs4tqHVFDUETnLk2g9niZHH5OQch+XdEzN6mcE0YF82vggZlBV5HBg5ugGKACoXuL
	 BTjUbCx4h9bdiiOdMNXu7YNwk4Flxq1lzWkMP/YTIkEPU6kxaEwqK95G8flIpd7I0U
	 KlxvSQuHClFWg==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1o5is8-0007ke-Fa; Mon, 27 Jun 2022 09:09:24 +0200
Date: Mon, 27 Jun 2022 09:09:24 +0200
From: Johan Hovold <johan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Subject: Re: Error: arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi:23.19-20
 syntax error
Message-ID: <YrlXpKQN6fOrwlcp@hovoldconsulting.com>
References: <202206250721.5muaVLMF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202206250721.5muaVLMF-lkp@intel.com>

On Sat, Jun 25, 2022 at 10:59:46AM +0800, kernel test robot wrote:
> tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20220622-213010/Bjorn-Andersson/arm64-dts-qcom-Introduce-SC8280XP/20220622-121246
> head:   f75e13dde1b5cbb2f301d0f368bcedfd12037eaf
> commit: f75e13dde1b5cbb2f301d0f368bcedfd12037eaf arm64: dts: qcom: sc8280xp: add Lenovo Thinkpad X13s devicetree
> date:   2 days ago
> config: arm64-randconfig-r012-20220624
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6fa9120080c35a5ff851c3fc3358692c4ef7ce0d)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/f75e13dde1b5cbb2f301d0f368bcedfd12037eaf
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review UPDATE-20220622-213010/Bjorn-Andersson/arm64-dts-qcom-Introduce-SC8280XP/20220622-121246
>         git checkout f75e13dde1b5cbb2f301d0f368bcedfd12037eaf
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> Error: arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi:23.19-20 syntax error
>    FATAL ERROR: Unable to parse input tree

This is expected since v3 of this patch depends on a change being made
to the preparatory part of the series (as mentioned in the changelog) by
adding a missing include to sc8280xp-pmics.dtsi.

Johan
