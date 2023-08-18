Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C06EAFA;
	Fri, 18 Aug 2023 03:27:23 +0000 (UTC)
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
	by cmsmtp with ESMTP
	id WmuKqjqwJyYOwWq8wq282W; Fri, 18 Aug 2023 03:27:22 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id Wq8wqkxrRD5qiWq8wqfuBr; Fri, 18 Aug 2023 03:27:22 +0000
X-Authority-Analysis: v=2.4 cv=dMe1JcVb c=1 sm=1 tr=0 ts=64dee51a
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=UttIx32zK-AA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=pGLkceISAAAA:8 a=cm27Pg_UAAAA:8
 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XbHhoaMV1A5PFRjmbPAVWbKEqbP19+yPSsLA0Z9QwNQ=; b=wPrYo/FoqPKaYfGL2zf96uXJeD
	18FoakBijHKvCCo3zew1dfLaIjkuW2o30kWz7/h2sRbH3RwMTbgolAtsfDQIzSjLxObRXOT5UzRjX
	vCuiW+QQESjAhHsqxKBlw69nW+jU7FfBaMX/5XZFbyg7NIaapSlfQLvpPIMyx/vi5wKtO8PQpITcH
	zc4u3e4hqQx7OmnzJaXL7vOSG+/R4AOoRTmYjJAR1H8IIlPdVVb/x9sRglj6ceUlieZmeDRlkuuzb
	itrGcpna0kW51LuudgGi8H1s72NJDWCJIFFz/HX21wOlSnwidan16EzrjUBnz4Y8jqaeTFJjVVIPl
	VftOMYFQ==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:60186 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qWp0B-001BiV-3A;
	Thu, 17 Aug 2023 21:14:16 -0500
Message-ID: <669608a3-407a-91b6-7bdc-92a0f5670d5f@embeddedor.com>
Date: Thu, 17 Aug 2023 20:15:14 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 16/21] dmaengine: tegra210-adma: Annotate struct
 tegra_adma with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Vinod Koul <vkoul@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter
 <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>,
 dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Zhou Wang <wangzhou1@hisilicon.com>,
 Jie Hai <haijie1@huawei.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Green Wan <green.wan@sifive.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Yu Kuai <yukuai3@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jordy Zomer <jordy@pwning.systems>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230817235428.never.111-kees@kernel.org>
 <20230817235859.49846-16-keescook@chromium.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230817235859.49846-16-keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qWp0B-001BiV-3A
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:60186
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIgHR70J3nyHJ5DciI7oP2lVx2dPS5IGktsm5D5AGO/EREFSavu8FGNyT2iHJh3UsT9YThu+5dJt10mtCJIHNA6ydzCKE0JyzMJ8I0p01TtHznMRnZnR
 JghIuby0lRLQw/Q7p6JCAn8+MifZudsC06v3z7mk0F1Tr3s1uBt5f96MHZBSNjcK/hZiXvtqm0fDPpxBOSJ6o9GFk0n93pnIB+D1vt+n33KoFpp47RUwRWOK
 jt9z+ugD+IP82Q9xkPvDlA==



On 8/17/23 17:58, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct tegra_adma.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: dmaengine@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/dma/tegra210-adma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
> index e557bada1510..cea33912a4c9 100644
> --- a/drivers/dma/tegra210-adma.c
> +++ b/drivers/dma/tegra210-adma.c
> @@ -162,7 +162,7 @@ struct tegra_adma {
>   	const struct tegra_adma_chip_data *cdata;
>   
>   	/* Last member of the structure */
> -	struct tegra_adma_chan		channels[];
> +	struct tegra_adma_chan		channels[] __counted_by(nr_channels);
>   };
>   
>   static inline void tdma_write(struct tegra_adma *tdma, u32 reg, u32 val)
