Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080001B278
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:49:11 +0000 (UTC)
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
	by cmsmtp with ESMTP
	id hAJfqXcMpyYOwhFkVq0vhE; Fri, 15 Sep 2023 20:49:11 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFkVqzlj6tHuqhFkVqcB58; Fri, 15 Sep 2023 20:49:11 +0000
X-Authority-Analysis: v=2.4 cv=OcCLszfY c=1 sm=1 tr=0 ts=6504c347
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8 a=zu6OG0ZhAAAA:8 a=pGLkceISAAAA:8
 a=FlkJ-zHRAAAA:8 a=JfrnYn6hAAAA:8 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8
 a=6jf_rtzPGzjKtfs0wCQA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
 a=aeg5Gbbo78KNqacMgKqU:22 a=pAN39diAhXWuPx0-Vjn3:22 a=rcJ5IfC3ewqtVv14NVGK:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=xmb-EsYY8bH0VWELuYED:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CclFJTPt/kQYr7DtGTorOj0xv3gEfRWPWq0sGa9nXxU=; b=JfYzhAMbESaXEFIgyujVndTe2G
	bR6japwiVCeKiPhHmpOiFA161I2Os9qCf5XyhjoKFsx6xN6vkJraT/QSZnk760duUDC9J8TSNSveU
	yyxCw5AfmC4XiILekTv91ydYFlQI9uvYbNIIynvhjQ9UoftRO1LevL6OqeMZMUp9vMksQNaGm2AdB
	WQxjTc7MST2NriLbt7fim+9tU7AsHPFLgOUzD/JZaQF96yYPX1vPw+FlvalvrtwhF8Le4Vq4KXEq6
	qd1K6WeAu284dVHzFyAquroAqf6RBdnfZ7hsbAxhY6lGly7Yix580DQCw7KI79PFmlIbNg+vorlvQ
	R/xSmPcQ==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:42002 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFkR-002eMw-2X;
	Fri, 15 Sep 2023 15:49:07 -0500
Message-ID: <4f318e62-b0e1-a1d2-9850-890b93a97bb3@embeddedor.com>
Date: Fri, 15 Sep 2023 14:50:02 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] mtd: rawnand: sunxi: Annotate struct sunxi_nand_chip with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Manuel Dipolt <mdipolt@robart.cc>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Yangtao Li <frank.li@vivo.com>, Li Zetao <lizetao1@huawei.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201300.never.057-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915201300.never.057-kees@kernel.org>
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
X-Exim-ID: 1qhFkR-002eMw-2X
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:42002
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 392
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNkGO2YSVtFlL2MFhBe62XMxY+q5sEueDHvkHPAz2B3qYR5sxlao1pEaSTktaMGNWFprxcWs7/hbQoafzWIpb60Wx4arev2uO2rtWnQXJfbfb/qTzeQ4
 8ZTcqoIRGT32kjn0F3HP3fk1D385aLcwJRRB5Ebqb9iP6At+dPe6aELYSmbZ1VPpJ8Hm0bl3ryzIhVNOVRoxJ/YXZSgBJ5D5NsY=



On 9/15/23 14:13, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct sunxi_nand_chip.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Manuel Dipolt <mdipolt@robart.cc>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index 9abf38049d35..4ec17c8bce5a 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -197,7 +197,7 @@ struct sunxi_nand_chip {
>   	u32 timing_cfg;
>   	u32 timing_ctl;
>   	int nsels;
> -	struct sunxi_nand_chip_sel sels[];
> +	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
>   };
>   
>   static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
