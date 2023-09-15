Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B8C11CAA
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:45:40 +0000 (UTC)
Received: from eig-obgw-6004a.ext.cloudfilter.net ([10.0.30.197])
	by cmsmtp with ESMTP
	id hAOdqzo6sDKaKhFh5qIci6; Fri, 15 Sep 2023 20:45:39 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFh4qEX2Tp9rehFh5qaRfK; Fri, 15 Sep 2023 20:45:39 +0000
X-Authority-Analysis: v=2.4 cv=Ztv+lv3G c=1 sm=1 tr=0 ts=6504c273
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
	bh=THcbAJFdx33gBO1MOq6Px2lR54qlr2l+Ip9xfdyyl3E=; b=tYRc1rc6gSEdsGWkdPGjQcdL+u
	4GBJQuUoziMuoygvT/hYgpkE64TlGr5i5iepg9F2+gHo3kkGZGqeD/bjcEYxD644JcLXUJ/hZBPh2
	jLv+QB/6nPeMM0pPvbE6iXZ1PLN+3GwMOJUTKCUtm6filW+HXlO19mpwyRH0SqvUyOtR1XzBISg8h
	f4u4UkpbgFkQcw+toJhP9X0YWb+8DBGn23xVvvVLZd9iOz3lS2oXQoTZXO26ECr8JRvuigv/RFElD
	1sRKzARtP2uNl/ZJRKgnrgTPkQpST24I/NsU7XdDUQYD9c+dg5pJt+0enAx+zrKrUKxaQNCxe2PIj
	dcW/1dsg==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:60304 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFh3-002a1b-2a;
	Fri, 15 Sep 2023 15:45:37 -0500
Message-ID: <59945a80-0d50-1df0-43cb-eda68b07f93d@embeddedor.com>
Date: Fri, 15 Sep 2023 14:46:33 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] leds: cr0014114: Annotate struct cr0014114 with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915200948.never.728-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915200948.never.728-kees@kernel.org>
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
X-Exim-ID: 1qhFh3-002a1b-2a
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:60304
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 194
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEYflG/1J5Ug6G5MfuUYDi7pIxgwVep+0LkgvLMvM/RtRlxEsIbKOJcWneJk8RUyoaB3/U8Zicp5OySIjbfXony+Y9v5XuAFyhj3ZFzlAUdyEabIWxde
 ftVPcCR/yxgOgghDdcP9JbUlL5mi3ugob8t8qzpOZA+VlJJGQw+SrIPPCubIi89dFYEGcWTFbBJNIOu2Pa9Bm5O7qssQhhiNX7c=



On 9/15/23 14:09, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct cr0014114.
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
>   drivers/leds/leds-cr0014114.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
> index b33bca397ea6..c9914fc51f20 100644
> --- a/drivers/leds/leds-cr0014114.c
> +++ b/drivers/leds/leds-cr0014114.c
> @@ -56,7 +56,7 @@ struct cr0014114 {
>   	struct spi_device	*spi;
>   	u8			*buf;
>   	unsigned long		delay;
> -	struct cr0014114_led	leds[];
> +	struct cr0014114_led	leds[] __counted_by(count);
>   };
>   
>   static void cr0014114_calc_crc(u8 *buf, const size_t len)
