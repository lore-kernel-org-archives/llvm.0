Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBF41B275
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:48:29 +0000 (UTC)
Received: from eig-obgw-5006a.ext.cloudfilter.net ([10.0.29.179])
	by cmsmtp with ESMTP
	id h8dcqzHHoDKaKhFjpqIdvc; Fri, 15 Sep 2023 20:48:29 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFjoqTgfjyBEYhFjoqk1Qc; Fri, 15 Sep 2023 20:48:28 +0000
X-Authority-Analysis: v=2.4 cv=durItns4 c=1 sm=1 tr=0 ts=6504c31c
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8 a=JfrnYn6hAAAA:8 a=cm27Pg_UAAAA:8
 a=VwQbUJbxAAAA:8 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=aeg5Gbbo78KNqacMgKqU:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=xmb-EsYY8bH0VWELuYED:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ljVoMDT3fFGAMSef/OopuanShscuW7+QQwLyyjRckT8=; b=KSXFCvIOUFi/RhjrTup8kiaDFp
	WgS1wG156Iyb/uYgzhM/o6Bux77EtUHGwWzSZpAJhsayL0WePJiayrACfhwT9eUUzxuyMRVopmuqb
	RT4P1tTJ2X6EqXgLk+qlFHTi73HPgE5i3+5G654f3PUYibxLY50o7ItlzghNpnYYIDNp0xT8yRc9U
	8/155j7HaAme14HtSbb93yD3MYcWlJIpTDpgZfuJK+7YQx6BNLdH6pscCQAzn+XjKvPT6DXcPP4mv
	Up5ckgJh81HrxbvKTlw+Av8FMVkCPIFz9ufDYIj5USPKfdC/5pb9RxjUBBO+OadaJ/0rSv8ZzY56P
	0HPZBpbg==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:41384 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFjn-002dcW-0C;
	Fri, 15 Sep 2023 15:48:27 -0500
Message-ID: <f3ff7e46-2c9b-e751-ad1e-53d1ee7f3a02@embeddedor.com>
Date: Fri, 15 Sep 2023 14:49:22 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] mtd: rawnand: marvell: Annotate struct marvell_nand_chip
 with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201243.never.235-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915201243.never.235-kees@kernel.org>
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
X-Exim-ID: 1qhFjn-002dcW-0C
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:41384
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 351
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLCXWDvan1/q5zmEAeiMv1nnr/Le2b4nsKkIAZOM4v1aALD9+sghlCFHh0jAaA42nK4xc5NcIvmAhdfEjO0sEekFbp8nRW5BfIPc3Se7mc4gp4T2bnBM
 zmn9MvpZgERrJUuffsYcX/pNv3NKT+oGR2AaRHa2CLqcyOo8ZnZbmH1MmQwFJrg733J0kRkFzb/dUBerxMBV0R4niFZ1dn0oCos=



On 9/15/23 14:12, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct marvell_nand_chip.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/mtd/nand/raw/marvell_nand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index b841a81cb128..a46698744850 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -348,7 +348,7 @@ struct marvell_nand_chip {
>   	int addr_cyc;
>   	int selected_die;
>   	unsigned int nsels;
> -	struct marvell_nand_chip_sel sels[];
> +	struct marvell_nand_chip_sel sels[] __counted_by(nsels);
>   };
>   
>   static inline struct marvell_nand_chip *to_marvell_nand(struct nand_chip *chip)
