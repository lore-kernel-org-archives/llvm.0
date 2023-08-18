Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB125380;
	Fri, 18 Aug 2023 03:19:46 +0000 (UTC)
Received: from eig-obgw-5001a.ext.cloudfilter.net ([10.0.29.139])
	by cmsmtp with ESMTP
	id WmuKqHTlADKaKWq1ZqKpUB; Fri, 18 Aug 2023 03:19:45 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id Wq1YqZDVLZReaWq1ZqL6vw; Fri, 18 Aug 2023 03:19:45 +0000
X-Authority-Analysis: v=2.4 cv=WtA4jPTv c=1 sm=1 tr=0 ts=64dee351
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=UttIx32zK-AA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=c-n4J4-pAAAA:8 a=JfrnYn6hAAAA:8 a=cm27Pg_UAAAA:8
 a=qjWHau5h7Oqj65Zv8QkA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=L0NDqeB7ZLmQzAogN4cw:22 a=1CNFftbPRP8L7MoqJWF3:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sQ30Ovr09Lgt/qeIl/nptDbt/kIRZBZ47Tzj0AxpNF0=; b=l2vTi2kOVga2bMsCnBTxK/Kkr2
	zBfV8oMnGXhoeZeYL01VY59r8sDSAxwET73X/K0vn5vOyPtFhe6CDcYOGRpcnZ3L9ZD2JVVEtVOGr
	dqs9JJ3sq6zbIhsh0ZFoYtAuWu0OWc7A6jN0PS4e7T7GIkc+NSnfNgqNNguHCuk/74dp6Rf+8HEVt
	VUwxza1nVVEMfKe+1fCBvxf1iX/0DpiOyN1H/q+dDIpSjxaq77fVmM2KshKizL64+SBbmikVyi2Ag
	v704SB3dDffPxyyOZ99OjFxKjnnUnGdDS8RSccxVM2Hf1ntVMHJZ3+Wg2B/k4toOqJv2xopf+CVeM
	DCAwUjDg==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:53190 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qWp0s-001Dea-1q;
	Thu, 17 Aug 2023 21:14:58 -0500
Message-ID: <3afdda82-052b-69fc-02d8-ef4a9670e481@embeddedor.com>
Date: Thu, 17 Aug 2023 20:15:57 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 19/21] dmaengine: uniphier-xdmac: Annotate struct
 uniphier_xdmac_desc with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Vinod Koul <vkoul@kernel.org>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
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
 Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Yu Kuai <yukuai3@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jordy Zomer <jordy@pwning.systems>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230817235428.never.111-kees@kernel.org>
 <20230817235859.49846-19-keescook@chromium.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230817235859.49846-19-keescook@chromium.org>
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
X-Exim-ID: 1qWp0s-001Dea-1q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:53190
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNsgZWdtcV+vprQKVlaqK/tgcNpm7PmPDWKNAWlRCmBr6yFy9vtyyBe0L8WTYjYWoE17BFkDBdDXPnQv+5xT6YeN7u4YPn9+z8b+6/qhpBKztsZItafn
 SiLJWK51wkHomRlWBkJQiKWoTfWKhRcEdftoeHsRZ0ZjNlsFP6nHxmLgC21mvLzSJzf3dVsUg+z3JWujUmIjExa04aF2M253koImNC+cnKLsf14ZPURIn+nw
 107NntgztbMNCc5EGwTiFA==



On 8/17/23 17:58, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct uniphier_xdmac_desc.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: dmaengine@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/dma/uniphier-xdmac.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/uniphier-xdmac.c b/drivers/dma/uniphier-xdmac.c
> index 290836b7e1be..dd51522879a7 100644
> --- a/drivers/dma/uniphier-xdmac.c
> +++ b/drivers/dma/uniphier-xdmac.c
> @@ -80,7 +80,7 @@ struct uniphier_xdmac_desc {
>   	unsigned int nr_node;
>   	unsigned int cur_node;
>   	enum dma_transfer_direction dir;
> -	struct uniphier_xdmac_desc_node nodes[];
> +	struct uniphier_xdmac_desc_node nodes[] __counted_by(nr_node);
>   };
>   
>   struct uniphier_xdmac_chan {
> @@ -295,6 +295,7 @@ uniphier_xdmac_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dst,
>   	xd = kzalloc(struct_size(xd, nodes, nr), GFP_NOWAIT);
>   	if (!xd)
>   		return NULL;
> +	xd->nr_node = nr;
>   
>   	for (i = 0; i < nr; i++) {
>   		burst_size = min_t(size_t, len, XDMAC_MAX_WORD_SIZE);
> @@ -309,7 +310,6 @@ uniphier_xdmac_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dst,
>   	}
>   
>   	xd->dir = DMA_MEM_TO_MEM;
> -	xd->nr_node = nr;
>   	xd->cur_node = 0;
>   
>   	return vchan_tx_prep(vc, &xd->vd, flags);
> @@ -351,6 +351,7 @@ uniphier_xdmac_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>   	xd = kzalloc(struct_size(xd, nodes, sg_len), GFP_NOWAIT);
>   	if (!xd)
>   		return NULL;
> +	xd->nr_node = sg_len;
>   
>   	for_each_sg(sgl, sg, sg_len, i) {
>   		xd->nodes[i].src = (direction == DMA_DEV_TO_MEM)
> @@ -385,7 +386,6 @@ uniphier_xdmac_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
>   	}
>   
>   	xd->dir = direction;
> -	xd->nr_node = sg_len;
>   	xd->cur_node = 0;
>   
>   	return vchan_tx_prep(vc, &xd->vd, flags);
