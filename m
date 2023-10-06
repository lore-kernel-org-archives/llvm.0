Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88C844472
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 20:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="bJlEBsDz"
Received: from eig-obgw-6002a.ext.cloudfilter.net ([10.0.30.222])
	by cmsmtp with ESMTP
	id opbnqktgBIBlVork2qYWWn; Fri, 06 Oct 2023 20:48:10 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id orkTqeHkPQ8G7orkTqz2TJ; Fri, 06 Oct 2023 20:48:37 +0000
X-Authority-Analysis: v=2.4 cv=M/pelg8s c=1 sm=1 tr=0 ts=652072a5
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=Dx1Zrv+1i3YEdDUMOX3koA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=wYkD_t78qR0A:10 a=P-IC7800AAAA:8
 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=mK_AVkanAAAA:8 a=XYAwZIGsAAAA:8
 a=Ikd4Dj_1AAAA:8 a=i0EeH86SAAAA:8 a=T1oDNNq1AAAA:8 a=1RTuLK3dAAAA:8
 a=JfrnYn6hAAAA:8 a=NEAV23lmAAAA:8 a=cm27Pg_UAAAA:8 a=0yL73Cyy68KADmUz8mEA:9
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=aeg5Gbbo78KNqacMgKqU:22
 a=AjGcO6oz07-iQ99wixmX:22 a=3gWm3jAn84ENXaBijsEo:22 a=E8ToXWR_bxluHZ7gmE-Z:22
 a=RDR0i3bhJUuoZSeB_ChE:22 a=kRpfLKi8w9umh8uBmg1i:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4QrkZaC8I3x+NYPAvbO6PQjOx4YgS6vmJGhsbvHZz6U=; b=bJlEBsDz1hqI5968UGUp4/OqSs
	w37DXwT5z/QF2u+CJ+69fe0W1KOlticXzJC7x5TKCPWEbfL8nJ0DWX01of6UBL7G6GJZjAV74wKhx
	HKRiRHZcX3SLHP1k4y25URrB/7zaQqUfFxQrbDu2YOeeVG3YZ9TrdKKy6mFufaXM0aOyozQsLSQAh
	W6GY9OoQXk+uIeYryRdfXT/9mKDSkOL2/qmPTuOs7EDqf9j4NMtjM1yKoQ02Gh9jQ6tUKDWXXsR1B
	XqWo+vFkBCXhkbVwIfuCUpWM10KUXvPzi9CcW5YGbREPfrBIFzVmwnVJ2N/C4mymoCwfHJyuqC9Q6
	3QEytMCA==;
Received: from 94-238-9-39.abo.bbox.fr ([94.238.9.39]:47408 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qorkQ-001Bge-1H;
	Fri, 06 Oct 2023 15:48:34 -0500
Message-ID: <bc89b149-8a93-4677-823a-72302a1876ef@embeddedor.com>
Date: Fri, 6 Oct 2023 22:48:29 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: cadence: Annotate struct cdns_nand_chip
 with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Roger Quadros <rogerq@kernel.org>, Thierry Reding <treding@nvidia.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Valentin Korenblit <vkorenblit@sequans.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20231006201734.work.060-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231006201734.work.060-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.238.9.39
X-Source-L: No
X-Exim-ID: 1qorkQ-001Bge-1H
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 94-238-9-39.abo.bbox.fr ([192.168.1.98]) [94.238.9.39]:47408
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 78
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfG+UJQ0CDpTVGZJlezQaoEdSOSaDr20SzK2dsMhuWYpe9aH8mNyEm6/WmI3/PIDXEytTG4Sv1+z0xYkLKtsyZ1vih0bGs9WqpGsB5MfC3r1W1AlCWUOt
 bPn8WxiZL2/HBs18hT/hpterGSfcwmHX/2ZGDjWCKXmhYSBiAC2viobfRzXAn84la5W8rTHz1jWKDr8XRypO3Nse4VfK9mHktx4=



On 10/6/23 22:17, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct cdns_nand_chip.
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Roger Quadros <rogerq@kernel.org>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Yang Yingliang <yangyingliang@huawei.com>
> Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
> Cc: Valentin Korenblit <vkorenblit@sequans.com>
> Cc: ye xingchen <ye.xingchen@zte.com.cn>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-hardening@vger.kernel.org
> Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
-- 
Gustavo

> ---
>   drivers/mtd/nand/raw/cadence-nand-controller.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
> index 034ec564c2ed..7d5ef7ffe0fe 100644
> --- a/drivers/mtd/nand/raw/cadence-nand-controller.c
> +++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
> @@ -526,7 +526,7 @@ struct cdns_nand_chip {
>   	/* ECC strength index. */
>   	u8 corr_str_idx;
>   
> -	u8 cs[];
> +	u8 cs[] __counted_by(nsels);
>   };
>   
>   struct ecc_info {
