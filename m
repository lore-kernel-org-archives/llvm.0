Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032391FAF
	for <llvm@lists.linux.dev>; Tue, 18 Oct 2022 07:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DF36C433D6;
	Tue, 18 Oct 2022 07:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666077389;
	bh=BJvYHhMON3X8Dpi7AQnigwItrwWZ4Jwk3LAjqDnCHog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRaQpBlLLFe8295yY98Tw41uooJAfjXQtT+rtLbri5UcazDmO8319XUEjk8DTQ8kp
	 h6pVRrpZTXk4zxSaqUHmYoagrdkNvlMEso/VWgj5Yix5ZPOp41/g86MuhP9jzV8RL3
	 ZxtT1Km7/NBoynREaj8KFRrjY9Ake5OZA1T4EJYNc6o/8ly+2qJQ4fIXySItg0j1ec
	 a7rRzAUJDgPvuZfRfwflmDzBYeMMAWUar9TdnfMJ9MBxFQYoHntu/zXX/GRrkp25jZ
	 qi6z0avwDBq716XD5BAkb75n9VSl6TdnEIMni9LFo05Xnjnktfh6xcLdreMk29ZzBM
	 27G4dIi7j1JbQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1okgpl-0007tw-IR; Tue, 18 Oct 2022 09:16:17 +0200
Date: Tue, 18 Oct 2022 09:16:17 +0200
From: Johan Hovold <johan@kernel.org>
To: kernel test robot <lkp@intel.com>, Sasha Levin <sashal@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [linux-stable-rc:linux-5.19.y 2987/3450]
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts:12:10: fatal error:
 'sc8280xp.dtsi' file not found
Message-ID: <Y05Swd1ZRAF4SnTV@hovoldconsulting.com>
References: <202210181441.Uo9b9Ie7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202210181441.Uo9b9Ie7-lkp@intel.com>

On Tue, Oct 18, 2022 at 02:50:44PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.19.y
> head:   28b57a08d7fd284fdeb0c92ce4aeea9bcd023911
> commit: c4c72ceb23b538b6cbcc9cbf9463b71c3e2ae933 [2987/3450] arm64: dts: qcom: sc8280xp: Add reference device
> config: arm64-randconfig-r011-20221017
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=c4c72ceb23b538b6cbcc9cbf9463b71c3e2ae933

Sasha, why on earth are you backporting commit ccd3517faf18 ("arm64:
dts: qcom: sc8280xp: Add reference device")?!

It seems your implementation of the stable-tree process has gone
completely off rails.

Johan
