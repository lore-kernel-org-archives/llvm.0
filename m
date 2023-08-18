Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7D68478;
	Fri, 18 Aug 2023 03:54:27 +0000 (UTC)
Received: from eig-obgw-5002a.ext.cloudfilter.net ([10.0.29.215])
	by cmsmtp with ESMTP
	id WmuKqb7q7WU1cWqZ9qVDQE; Fri, 18 Aug 2023 03:54:27 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id WqZ8q9vMmqpuuWqZ8qybfW; Fri, 18 Aug 2023 03:54:27 +0000
X-Authority-Analysis: v=2.4 cv=XOgj9CtE c=1 sm=1 tr=0 ts=64deeb73
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=UttIx32zK-AA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=7U2zQXYeb2txnVgCXwAA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eQY7eDC80m9ueawTIc2Di+0+U+AtfXqsds2PmKWodwA=; b=qXEgSDyhtTdCPlGtX0luTEt9uK
	XAZka4p7hGGzJ5GQdnPwFYEuneC+5kN8psw04dH58nimNsYOLizuwvbr6tJ6RakZjpeq8PcI1/vPR
	cXms4asLXn1M+82iPQvYbiBiqsek2qnboH71bvR7y52WRheZmAYU51y1f04Ozxh8iOvvFSzxOR6qP
	eyAklbAm3XMskNcThFzT+jQJxIe31CCPAFe3iuiA5dnK/BcBlwwxCUgXWg3uI7/dXyurlCZSjNHSJ
	2Vm2tjSdANuKidDa0b25tCVEaHS/te143lRFPXk7iXBDBJjvvXCJ2TMV4z4CWMK5Bjjtq1zsrXDRB
	Os9SwCTA==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:54772 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qWoze-001AjK-2G;
	Thu, 17 Aug 2023 21:13:42 -0500
Message-ID: <eab36e1b-94e8-a78a-f240-56414dafbaf9@embeddedor.com>
Date: Thu, 17 Aug 2023 20:14:41 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 03/21] dmaengine: axi-dmac: Annotate struct axi_dmac_desc
 with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Vinod Koul <vkoul@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, dmaengine@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Zhou Wang
 <wangzhou1@hisilicon.com>, Jie Hai <haijie1@huawei.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Green Wan <green.wan@sifive.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Yu Kuai <yukuai3@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jordy Zomer <jordy@pwning.systems>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20230817235428.never.111-kees@kernel.org>
 <20230817235859.49846-3-keescook@chromium.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230817235859.49846-3-keescook@chromium.org>
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
X-Exim-ID: 1qWoze-001AjK-2G
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:54772
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 9
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGXdEGHXD7eoMoTcWwUewXRRzvJDk/IzmE3DustBxqFpjrNyxFhWMtMu6cIedPThxfQlWvTIGYsQR9uAd/ZAK8qt1B8r68GIAx8215h+i1d9ZapdNvJO
 tFDZA+LOtKaOneZmQ37ImQhAiKK/3ITLBACsbDCFzd4yE5emR1o7XnXV3zliAnvKCFb/zX2Sdw1/mhmA4hpkbrDn3kV7lF7rokwapMFRBONteOvjxw93/SwC
 5QepfbGz4+8bZBgzLiDliQ==



On 8/17/23 17:58, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct axi_dmac_desc.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: dmaengine@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/dma/dma-axi-dmac.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
> index fc7cdad37161..b9f85cb20d3e 100644
> --- a/drivers/dma/dma-axi-dmac.c
> +++ b/drivers/dma/dma-axi-dmac.c
> @@ -117,7 +117,7 @@ struct axi_dmac_desc {
>   	unsigned int num_submitted;
>   	unsigned int num_completed;
>   	unsigned int num_sgs;
> -	struct axi_dmac_sg sg[];
> +	struct axi_dmac_sg sg[] __counted_by(num_sgs);
>   };
>   
>   struct axi_dmac_chan {
> @@ -484,12 +484,11 @@ static struct axi_dmac_desc *axi_dmac_alloc_desc(unsigned int num_sgs)
>   	desc = kzalloc(struct_size(desc, sg, num_sgs), GFP_NOWAIT);
>   	if (!desc)
>   		return NULL;
> +	desc->num_sgs = num_sgs;
>   
>   	for (i = 0; i < num_sgs; i++)
>   		desc->sg[i].id = AXI_DMAC_SG_UNUSED;
>   
> -	desc->num_sgs = num_sgs;
> -
>   	return desc;
>   }
>   
