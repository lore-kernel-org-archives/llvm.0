Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D2E21368;
	Sat, 23 Sep 2023 20:21:49 +0000 (UTC)
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
	by cmsmtp with ESMTP
	id k2v8qbsaKDKaKk98IqKDxI; Sat, 23 Sep 2023 20:21:43 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id k98HqrQsT8unvk98Iqn9Ju; Sat, 23 Sep 2023 20:21:42 +0000
X-Authority-Analysis: v=2.4 cv=NpDCzuRJ c=1 sm=1 tr=0 ts=650f48d6
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=Ikd4Dj_1AAAA:8 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=HvF037n1xESchLcPDVoA:9
 a=QEXdDO2ut3YA:10 a=xmb-EsYY8bH0VWELuYED:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mDPsy6zOFKzGEAQrBMZNIHmEMotwQ5IX96a0BW3Jho0=; b=vgiYfPeZV/vP3n6tKjO2L7IEpo
	CkChvIFq2/3AKpG6MNrdqiDFkQpXU+O5xuZUU8RGSEPJC1wvrJ63xg5Tnte3zbhyRjaCnRjvlfr2Y
	Q6Qap6NgsYe+zM3yqEviGjYMnCuGls4YRgnXMUWXPEn5pFQ/bNlDfjzymLuAbg7PXEBwWbmXbA/uQ
	CiGhmcHOOwTq73fV4Rd0U8PSn/vOUwRyxFg9dhaKbCkYGbRELJUp7oZoVm75yfhD2kjV2scbSj3LW
	vcceHZnGGHfvaeUXwClvBimkIgI+OsdAdqk+kniSZqGlloqo4VSITxBiZSCfw3HcbxkrLbb0Q/QnA
	E/jyWZlw==;
Received: from [94.239.20.48] (port=55436 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qjy7t-003hDN-1B;
	Sat, 23 Sep 2023 03:36:33 -0500
Message-ID: <0d9a5fc1-1481-2c62-2a77-c8d46ee54f92@embeddedor.com>
Date: Sat, 23 Sep 2023 10:37:39 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] hte: Annotate struct hte_device with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Dipen Patel <dipenp@nvidia.com>
Cc: timestamp@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230922175344.work.987-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175344.work.987-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.239.20.48
X-Source-L: No
X-Exim-ID: 1qjy7t-003hDN-1B
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:55436
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLqImk9/mCqFgTZFbZu82KxWH0aKawrsN13FyedN6Oqdk8Va8n9nAPdNJT29nVP0fsKQ55TN0fZy0MHwXGMzzYgK/rwz6PamQxQOAOpNkM1ZT9+eTl6y
 zDhMNOIilGdsDZFeLoQzEFY6ItBgYSGQHhOoS1lzDv3Z9EVtWvHVuc4Seau89Ll7//DPMAr+v2mJquJm2eSouOzo9ctUrPAD20LNIxQ0ghZEb2bRO/6uTvki
 F9El3YCzVoqhANNeJ1rtZQ==



On 9/22/23 11:53, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct hte_device.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Dipen Patel <dipenp@nvidia.com>
> Cc: timestamp@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/hte/hte.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hte/hte.c b/drivers/hte/hte.c
> index 598a716b7364..1fd8d2d4528b 100644
> --- a/drivers/hte/hte.c
> +++ b/drivers/hte/hte.c
> @@ -88,7 +88,7 @@ struct hte_device {
>   	struct list_head list;
>   	struct hte_chip *chip;
>   	struct module *owner;
> -	struct hte_ts_info ei[];
> +	struct hte_ts_info ei[] __counted_by(nlines);
>   };
>   
>   #ifdef CONFIG_DEBUG_FS
