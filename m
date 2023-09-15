Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F661B275
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 21:18:40 +0000 (UTC)
Received: from eig-obgw-5006a.ext.cloudfilter.net ([10.0.29.179])
	by cmsmtp with ESMTP
	id h8dGqbD6cez0ChGCfqC8v4; Fri, 15 Sep 2023 21:18:17 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hGD1qU1ooyBEYhGD1qkK99; Fri, 15 Sep 2023 21:18:39 +0000
X-Authority-Analysis: v=2.4 cv=durItns4 c=1 sm=1 tr=0 ts=6504ca2f
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=JfrnYn6hAAAA:8 a=cm27Pg_UAAAA:8
 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=TjNXssC_j7lpFel5tvFf:22 a=1CNFftbPRP8L7MoqJWF3:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CXlqlVJ2RnzYBwdo5oCwVhnF8JLWfHkjHPjJ0VvcV1w=; b=aLBYatBt5iYb4xj6Pn/c9wMvEZ
	/HxBtzx6jwiRBqbGYYsX564tIlBz3kFBagXbWnwtSt0IMy0XyKmg6JCK7yy5JFg95QXK8lpYxN9kE
	kKt7WNA7o017D0OxRYiHftQI4wuvKmZwiM1xAAu5RyA0Wn4S+Ylfe+PKdV8c4HCU8QOT9FfA03z5z
	JloX3i4mtdWE9Uo6cS6ltEWPptP2YxEIn3eaizObNk8UhsXJGAVbXUfOF6xae85EQSf6tmByY8the
	TO9ac7JDzVtioDfII4XGBo1vFx7oq+Xf3M0ztckuLxEsBEk0XijlzQO6D08Am8FXQeoG3MKboqV5t
	Yg7IrYbg==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:55304 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhGD0-0036gT-12;
	Fri, 15 Sep 2023 16:18:38 -0500
Message-ID: <8d28f285-1a92-2635-f0f3-8a46b8f0c8d0@embeddedor.com>
Date: Fri, 15 Sep 2023 15:19:34 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath10k: Annotate struct ath10k_ce_ring with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915200636.never.762-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915200636.never.762-kees@kernel.org>
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
X-Exim-ID: 1qhGD0-0036gT-12
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:55304
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDZHyWhef4CG7OpEeubWeU7PAdXkU/R/UezpSxn2IQzRDp1UoZpzF+jDv38GDk/XiQG1/PSZWQ6WuzZHhixMAONxMBvstHX0BBK2PPeKNcjDTZDTl8Ec
 bgGXsziJNcI8bttRYnaZEun641Amkj/w1dlbmFBmzXaDT2k8WmQ4SeuY+QRQ/yV3EWphYDcv8DP0w2nNdbW5+aMwamTFuTvBnhc=



On 9/15/23 14:06, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct ath10k_ce_ring.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: Jeff Johnson <quic_jjohnson@quicinc.com>
> Cc: ath10k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/net/wireless/ath/ath10k/ce.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
> index 666ce384a1d8..27367bd64e95 100644
> --- a/drivers/net/wireless/ath/ath10k/ce.h
> +++ b/drivers/net/wireless/ath/ath10k/ce.h
> @@ -110,7 +110,7 @@ struct ath10k_ce_ring {
>   	struct ce_desc_64 *shadow_base;
>   
>   	/* keep last */
> -	void *per_transfer_context[];
> +	void *per_transfer_context[] __counted_by(nentries);
>   };
>   
>   struct ath10k_ce_pipe {
