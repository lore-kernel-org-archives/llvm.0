Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ACF1B275
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:48:59 +0000 (UTC)
Received: from eig-obgw-6007a.ext.cloudfilter.net ([10.0.30.247])
	by cmsmtp with ESMTP
	id hFCtqdFpbez0ChFjwqBxMk; Fri, 15 Sep 2023 20:48:36 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFkHqfvUw7DhyhFkIqPFgH; Fri, 15 Sep 2023 20:48:58 +0000
X-Authority-Analysis: v=2.4 cv=fpfP2X0f c=1 sm=1 tr=0 ts=6504c33a
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8
 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=aeg5Gbbo78KNqacMgKqU:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9+YfmCRdOxV4l5YZYRTDTDswIsRzP0r4oOgTtdce9YU=; b=W0cwd4inAUdTCh2pnWAfsMnJBX
	SJwASOBFhvZt3FmzCmDC4a/WS6hgyWG/OCUM8gA3MULCN8JQMeO1+rA9ASZykzwOfhSbtpkNoPwzH
	3e1N2VGr/PRoCCeimc32acB0fkuDiIlCLp25Lu1qiIWZKCsDXoJq2eRoo9+1ngxxvUWW3srnmMZbF
	fHUaNP6rx86MXQ6V24YfBmVa2oBPP1ADC/ws1eJ79DeN+zqaLrQSk5nb31iur7qdmz2OlckOCh9ZF
	eZihd5C/zFDoaqCwqMqsTwy5JAm3mY9KrchePVdKK0aos2YK6DfwmvqEtjznkvjMDItK4wrbIvLrE
	u/pDC7cg==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:38640 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFkG-002e6L-0D;
	Fri, 15 Sep 2023 15:48:56 -0500
Message-ID: <d1189ce2-16ed-6932-94c1-8c6ef3788df7@embeddedor.com>
Date: Fri, 15 Sep 2023 14:49:51 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] mtd: rawnand: renesas: Annotate struct rnand_chip with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201254.never.511-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915201254.never.511-kees@kernel.org>
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
X-Exim-ID: 1qhFkG-002e6L-0D
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:38640
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 380
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKdw0Q7IM6YBXW1+2KUJz2QaRe3QNFCSzEt5nGrGe0e05VKYpfYCMVBA40Nlj16qQgg4ydFibP/Ms967zD4qcej1WZQx2D7/MlMd51SqtwvWaQtqhMQx
 8Wos49NNiSmpsmBOjBUHG7ZxEUI5dkYdQezcqqz5ZCtzyNRo357ScZGlJLMUUR9RjQQ9EzgMp3PcFnEeG4O7KZ27+qwdzrVMxh4=



On 9/15/23 14:12, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct rnand_chip.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/mtd/nand/raw/renesas-nand-controller.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/renesas-nand-controller.c b/drivers/mtd/nand/raw/renesas-nand-controller.c
> index 589021ea9eb2..c9a01feff8df 100644
> --- a/drivers/mtd/nand/raw/renesas-nand-controller.c
> +++ b/drivers/mtd/nand/raw/renesas-nand-controller.c
> @@ -210,7 +210,7 @@ struct rnand_chip {
>   	u32 tim_gen_seq1;
>   	u32 tim_gen_seq2;
>   	u32 tim_gen_seq3;
> -	struct rnand_chip_sel sels[];
> +	struct rnand_chip_sel sels[] __counted_by(nsels);
>   };
>   
>   struct rnandc {
