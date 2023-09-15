Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A2F101C6
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:36:38 +0000 (UTC)
Received: from eig-obgw-6010a.ext.cloudfilter.net ([10.0.30.248])
	by cmsmtp with ESMTP
	id h8dUqODeJWU1chFUjqTac5; Fri, 15 Sep 2023 20:32:53 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFUiqaV1HKPGkhFUjqw50i; Fri, 15 Sep 2023 20:32:53 +0000
X-Authority-Analysis: v=2.4 cv=Aur9YcxP c=1 sm=1 tr=0 ts=6504bf75
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=cm27Pg_UAAAA:8
 a=V47ufcyD4mhEMgMxg3EA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=AjGcO6oz07-iQ99wixmX:22 a=1CNFftbPRP8L7MoqJWF3:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XFEFDsUGcQuwzOD604Jfh3l18cRloCISW3j/XKCvcMY=; b=TfhYNDw9/XgtpqEaLGkQnL48Gb
	rgr/7PNrKsIg5+L9A6MSF4fqZSDRgrfVNEFotU9ELS9jKSZcTPY2UsqvZlbT73dteEuNro95hgjwk
	z7mtQnhR4pdpWPxjEoRNgKuNB3p2dWGHdfx4Oh96FPy6PaZS1yA6Y7LaEXeRGkFaA/RG1ZV9LRBEZ
	ZdfM4PDlelRFW1pVxiLmbjJUskRLVOclenMV+QKC+DZ4mW4fR25QsEphq/8V3ocWO6HFOBoPt1OD8
	msjYwWog1dc+3Q4K794BtpZIY1b46H+fFywZp9fCmK7vRcPwYJHzZsGp8ItBEZtQzbCbw0XquO8iE
	GwAXkGXg==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:40344 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFUh-002OkC-0c;
	Fri, 15 Sep 2023 15:32:51 -0500
Message-ID: <f1a4033a-e702-da0f-b16b-ff6df8e1451f@embeddedor.com>
Date: Fri, 15 Sep 2023 14:33:42 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: wcn36xx: Annotate struct wcn36xx_hal_ind_msg with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Loic Poulain <loic.poulain@linaro.org>
Cc: Kalle Valo <kvalo@kernel.org>, wcn36xx@lists.infradead.org,
 linux-wireless@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915200622.never.820-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915200622.never.820-kees@kernel.org>
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
X-Exim-ID: 1qhFUh-002OkC-0c
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:40344
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 173
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKfxsy/W+eLvqAtfCrkCWVcUuYlEiBWtrCFLxxIfNXXfW2r8SSVxnS1GE8Pa8hzg1Xx0o0uEGHZmRtOcBf+V3OmQnYpBbhSMNKrhhsJvNl/SHttPVzNO
 Z0NbcxfBFJTI7Bup5U3eK7jJtk8iR1SavVJQf+0YnOjjNDiZv+iG1OmL0Ys7oW8J3FL9VFGUyHR/iqkuEEV2uoQO04ylzIqSvvQ=



On 9/15/23 14:06, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct wcn36xx_hal_ind_msg.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: wcn36xx@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/net/wireless/ath/wcn36xx/smd.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/wcn36xx/smd.h b/drivers/net/wireless/ath/wcn36xx/smd.h
> index cf15cde2a364..2c1ed9e570bf 100644
> --- a/drivers/net/wireless/ath/wcn36xx/smd.h
> +++ b/drivers/net/wireless/ath/wcn36xx/smd.h
> @@ -47,7 +47,7 @@ struct wcn36xx_fw_msg_status_rsp {
>   struct wcn36xx_hal_ind_msg {
>   	struct list_head list;
>   	size_t msg_len;
> -	u8 msg[];
> +	u8 msg[] __counted_by(msg_len);
>   };
>   
>   struct wcn36xx;
