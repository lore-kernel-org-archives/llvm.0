Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2596E10E8
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 06:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628D0C385A7;
	Fri, 29 Apr 2022 06:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651213217;
	bh=LXfrj0WIcgM+fFTTDm5ZeG40FfDnkdZUKI03ybfl4u8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=trmOQwsRaxq25R6opRqhDeInct/K4YUWCFYmiwe1ldrcsJqwFBb2i/I4dnWMNbPNu
	 KXkaQn32zKB0Qw0RQjX9ICuVSDxT/2cMIjkr557ZV46qincIw7HcuBJpXzDA8LblLH
	 GdTsUcbFws3hbW/CnRVy212V8rmoF1NicAMDX9iZfpNnFZ4mnQTeEIcqoPxe/aVtsz
	 w25gFru7yf7IQKtGfofSy9Exo6n7SRlJsj404GSIO6KWBlySMR6Gu04ZHZ7kxPAq/c
	 rI06xAyTasTAz2PZLE5Cq5VxHnv8TxcCt1X2OWnYKCQeeYyN6DS70bRfNd6JO7QSdl
	 bTPPbFDzRs0TA==
Message-ID: <0fffaa30-6e4c-177c-d757-e7e4608f4557@kernel.org>
Date: Fri, 29 Apr 2022 08:20:13 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] pinctrl: tegra: Add pinmux support for Tegra194
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Prathamesh Shete <pshete@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Thierry Reding <treding@nvidia.com>
References: <20211018121815.3017-2-pshete@nvidia.com>
 <202111060119.T02XJFAA-lkp@intel.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <202111060119.T02XJFAA-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/11/2021 18:49, kernel test robot wrote:
> Hi Prathamesh,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on tegra/for-next]
> [also build test WARNING on v5.15]
> [cannot apply to linusw-pinctrl/devel next-20211105]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]

(...)

                        \
>                               ^~
>>> drivers/pinctrl/tegra/pinctrl-tegra194.c:1113:27: warning: unused variable 'sdmmc1_hv_trim_pins' [-Wunused-const-variable]
>    static const unsigned int sdmmc1_hv_trim_pins[] = {
>                              ^
>>> drivers/pinctrl/tegra/pinctrl-tegra194.c:1119:27: warning: unused variable 'sdmmc3_hv_trim_pins' [-Wunused-const-variable]
>    static const unsigned int sdmmc3_hv_trim_pins[] = {
>                              ^
>>> drivers/pinctrl/tegra/pinctrl-tegra194.c:1128:27: warning: unused variable 'sys_reset_n_pins' [-Wunused-const-variable]
>    static const unsigned int sys_reset_n_pins[] = {
>                              ^

Hi Prathamesh,

I stumbled on issue with your commit and now I found that this was
already reported 4 times to you:
https://lore.kernel.org/all/?q=sys_reset_n_pins

Never fixed by the author.

Why these reports about errors in your commit where ignored? It's your
commit so leaving it as is in kernel is not responsible...

Best regards,
Krzysztof
