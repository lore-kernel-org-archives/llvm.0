Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B870A45F69
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 23:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="hfleqODQ"
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
	by cmsmtp with ESMTP
	id orRcqHAMJaLCxotqSqoZsP; Fri, 06 Oct 2023 23:02:56 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id otqRqIoOfiS2XotqRqLADT; Fri, 06 Oct 2023 23:02:56 +0000
X-Authority-Analysis: v=2.4 cv=V61ubMri c=1 sm=1 tr=0 ts=65209220
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=Dx1Zrv+1i3YEdDUMOX3koA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=wYkD_t78qR0A:10 a=mK_AVkanAAAA:8
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=cm27Pg_UAAAA:8 a=0yL73Cyy68KADmUz8mEA:9
 a=QEXdDO2ut3YA:10 a=3gWm3jAn84ENXaBijsEo:22 a=AjGcO6oz07-iQ99wixmX:22
 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ckZ+2ni0ap9A3fZ0AsoDx3MuEYvELQsfTGY0z3qXUm8=; b=hfleqODQEvWoPvdpqcmjoMGFS5
	LBprket2n/51h4OP+E/tdKLiOEkv4pzsCaVM3ymKvIkxjVUOE/YocphM2rXOt8ulZSl+tIz4CtpCr
	tPEg9W+i2X2KYw+p/gLWTk3/ZjysFC90zN902iQwC6KM1Jd634+J9gdxbnUtMAgSqlSuX2h2RnFAF
	c9uzF7Rsuy+y4xyhbwKIdWCJ2KrkQgKH3S45tBuIEaFlwDIjIkGWN7+7smKtLlWC4Cc7BekfR5bVF
	aJL7ecPrx8Tae5PMIhsr0T6CPZG4BxPU9zuRkpGGRdQpxuT3YhOxUam+A2XgkSwe5Sv06Q3I8mnHX
	taJ/4HeA==;
Received: from 94-238-9-39.abo.bbox.fr ([94.238.9.39]:47408 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qorlC-001Bge-2D;
	Fri, 06 Oct 2023 15:49:22 -0500
Message-ID: <d152533b-e4a8-4881-a10b-31835d3a32d9@embeddedor.com>
Date: Fri, 6 Oct 2023 22:49:20 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: p54: Annotate struct p54_cal_database with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Christian Lamparter <chunkeey@googlemail.com>
Cc: Kalle Valo <kvalo@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, linux-wireless@vger.kernel.org,
 linux-hardening@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20231006201719.work.356-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231006201719.work.356-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.238.9.39
X-Source-L: No
X-Exim-ID: 1qorlC-001Bge-2D
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 94-238-9-39.abo.bbox.fr ([192.168.1.98]) [94.238.9.39]:47408
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfE1kx3qk3mHs5KUjSXMtxD6H26OSGhiUee9tUBp3Ml3Nb88KOd22tGqkxgboCBL3YSmt30Hx0b7noyZlzd3L0Mt+Yp0oU1gAKBPnDexBcD0H+X0yPg58
 cI4AAgm7w64Qcj4Jq9h2jnBO6pGGubhNpVhUJ7fJz8dyWEcDzEWnMbURY21+1dJqdK3hLNyjbcpa8quzMOXytgsdAsrK3fFXbY4=



On 10/6/23 22:17, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct p54_cal_database.
> 
> Cc: Christian Lamparter <chunkeey@googlemail.com>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-wireless@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
> Signed-off-by: Kees Cook <keescook@chromium.org>


Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
-- 
Gustavo

> ---
>   drivers/net/wireless/intersil/p54/p54.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/intersil/p54/p54.h b/drivers/net/wireless/intersil/p54/p54.h
> index 3356ea708d81..770e348d1f6c 100644
> --- a/drivers/net/wireless/intersil/p54/p54.h
> +++ b/drivers/net/wireless/intersil/p54/p54.h
> @@ -126,7 +126,7 @@ struct p54_cal_database {
>   	size_t entry_size;
>   	size_t offset;
>   	size_t len;
> -	u8 data[];
> +	u8 data[] __counted_by(entries);
>   };
>   
>   #define EEPROM_READBACK_LEN 0x3fc
