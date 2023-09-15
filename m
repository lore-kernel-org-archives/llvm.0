Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862B530CED
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:46:25 +0000 (UTC)
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
	by cmsmtp with ESMTP
	id hEvlqkKERbK1VhFhpqlL7U; Fri, 15 Sep 2023 20:46:25 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFhoqzjaftHuqhFhoqc9be; Fri, 15 Sep 2023 20:46:24 +0000
X-Authority-Analysis: v=2.4 cv=OcCLszfY c=1 sm=1 tr=0 ts=6504c2a0
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+wXeW0ragghP3nGDP8SJkQsnLXmnQqu6vCCdsCoKH9Y=; b=DgeAP64Z5TVnR8glrZTDMpVd8T
	P8xyb1XGyEjNg3h9Q9EcVbWA3O0rzGuVOHEVbRJH9frFGegCRLx+stNbYUbx+E5dbbK/Q6Adgc88s
	/ad1PxpmgiBk+hkOQl6Oqbxya/JEEARtNdS84AuYNE46kbALs22fHjQ3M3L1cbUDzcZtkNNfnFGaS
	O8mgbplOjENG4/9UquGPNHqCTEOrpeGgkW+Lr/NrqQbPCnCHEFM/5sGWvQQYywSFjmewYllAoXOHF
	59X63igBySkprxKFTcllhrtPCTHWTsq3+8jmHtPAzsguANp8/sgTjruLXgnsGCBRt5RcdHlk6nQyS
	6zlZ1VJw==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:43072 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFhn-002ajm-0j;
	Fri, 15 Sep 2023 15:46:23 -0500
Message-ID: <4b7aaf78-b8c5-784e-e01e-3bfa3ebdb5f9@embeddedor.com>
Date: Fri, 15 Sep 2023 14:47:19 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] leds: lm3697: Annotate struct lm3697 with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201010.never.399-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915201010.never.399-kees@kernel.org>
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
X-Exim-ID: 1qhFhn-002ajm-0j
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:43072
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 224
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHEfFW77UjDYoVoL+IudiTY/lvoFH/YIL2NUaVoW1hCQHlgFl1eiN8DaVM33HwLbmQVW8WRYi3elCin9Y8IIw7QXClu6lBYdGNZYkKnv9ENbvjptjMsl
 YI47Vg5Gk8PibBspoOtgn+TZxj3VKFTOj6caXbYqDx/SN22Huhw/aelEXK4kOuj9Vr0HXVx2ZS3JQWw2Bm+WKIwkgSVQFx/oAZo=



On 9/15/23 14:10, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct lm3697.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Lee Jones <lee@kernel.org>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/leds/leds-lm3697.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
> index cfb8ac220db6..380d17a58fe9 100644
> --- a/drivers/leds/leds-lm3697.c
> +++ b/drivers/leds/leds-lm3697.c
> @@ -89,7 +89,7 @@ struct lm3697 {
>   	int bank_cfg;
>   	int num_banks;
>   
> -	struct lm3697_led leds[];
> +	struct lm3697_led leds[] __counted_by(num_banks);
>   };
>   
>   static const struct reg_default lm3697_reg_defs[] = {
