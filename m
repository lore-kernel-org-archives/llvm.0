Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895D0101C6
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:32:12 +0000 (UTC)
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
	by cmsmtp with ESMTP
	id hAPdqXen3yYOwhFU3q0oxC; Fri, 15 Sep 2023 20:32:11 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFU2qkEm1xtb5hFU3qfODe; Fri, 15 Sep 2023 20:32:11 +0000
X-Authority-Analysis: v=2.4 cv=IOERtyjG c=1 sm=1 tr=0 ts=6504bf4b
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=U9+Z5kqd3SQMUNig0uit61bC7VdG43K/YosIHe/hnq4=; b=zymKur+Gu0+dZbpiW7vE0s5nIR
	f+aG7BFDCnBjCE0TJWLY8vMZiNOQvThbgcnB/E25XbVifOBqTyfZ7evYWelmQJW0Lrloh6ePS94dV
	Ad3Wj1eOmlu8PBrXj00jSQWSuTbvIse+T4LMNInRymNfJHEk7S1yTG8bTcxtChDTlWJWOXQvLIpWm
	r797AYqnO0CRbY6IvVdP6MKouiQQ7HQfELjij4W4uNzqwJjxjqK1ucCZIGzyYoFsB+QlLIN3kFkJt
	Veg7sHMkb81mxNvK6fcWsqfkQH9JbBnAu71ux2PNt8isMvq7d4lljWupsWgVhvS5HZXBRrGiQDUDi
	76NhBF4A==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:50806 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFU1-002OEj-2e;
	Fri, 15 Sep 2023 15:32:09 -0500
Message-ID: <cc676b45-05d4-09a9-360e-fc908e41f809@embeddedor.com>
Date: Fri, 15 Sep 2023 14:33:05 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ipw2x00: Annotate struct libipw_txb with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>
Cc: Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915200602.never.582-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915200602.never.582-kees@kernel.org>
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
X-Exim-ID: 1qhFU1-002OEj-2e
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:50806
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 145
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJjA6G52UeMi7bugbbnPtBHWt7ttfgI/8JsXUL/NUwLl0GCVguxNJywU4Utcv7psrhYWQQhGEZlNylNrmNSkGoCuZ3iUfqSxKvSfxXW5+haGO4i9/goG
 51L/Wwsnr3KDlvBuhmaZpjPrCsA6VzFq6XFBVQGBQF11zZ762jK+LOi/FJuyazHks4xxkUcFX4LdYtboupAp/c8RgdepM/TytAk=



On 9/15/23 14:06, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct libipw_txb.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Stanislav Yakovlev <stas.yakovlev@gmail.com>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: linux-wireless@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/net/wireless/intel/ipw2x00/libipw.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/intel/ipw2x00/libipw.h b/drivers/net/wireless/intel/ipw2x00/libipw.h
> index bec7bc273748..9065ca5b0208 100644
> --- a/drivers/net/wireless/intel/ipw2x00/libipw.h
> +++ b/drivers/net/wireless/intel/ipw2x00/libipw.h
> @@ -488,7 +488,7 @@ struct libipw_txb {
>   	u8 reserved;
>   	u16 frag_size;
>   	u16 payload_size;
> -	struct sk_buff *fragments[];
> +	struct sk_buff *fragments[] __counted_by(nr_frags);
>   };
>   
>   /* SWEEP TABLE ENTRIES NUMBER */
