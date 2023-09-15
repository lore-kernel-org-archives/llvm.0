Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB26D1B28A
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:31:14 +0000 (UTC)
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
	by cmsmtp with ESMTP
	id hAPaqzoS1DKaKhFT2qIX20; Fri, 15 Sep 2023 20:31:08 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFT1qL4w14x9chFT1qN6Cj; Fri, 15 Sep 2023 20:31:07 +0000
X-Authority-Analysis: v=2.4 cv=Cp6sz10D c=1 sm=1 tr=0 ts=6504bf0b
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=1rGUjaHSoLxGkM6IGjIA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Kkdv2FJEvxjxaC4VEgUyFSnp9zdXMhA+UqJk1lfUv04=; b=P1vZ9/BIZEmMhWZg6NtsSmsyS6
	k3+xBIz6F/xhUbnrdVN8g8vPBFzwSk+M16qQD4eEmQL0HsTExvEqX5NJHsohlKfYyDcugnNxT5h6y
	LlRECYdm7A1sOtzdEZliw4TPbjFV4La0MN7PasbA5J9UP0xi59IBO8wNLAdmGozU4T0aOu5lICqWs
	C5hSIXrswTxvCNAfvCZ3DLmzWB+Kk4i2XnCcr2beP4VvwLXl3RvEDdyiK5+1CPjIQloPR2Mf8s1EY
	VPAmExPwZMLWufnErsJpIrOsKsWyf2SsUxORhAAOLqvrpO+qMsz5Y9KG+jivItDudQoUbQu6yitDk
	3Wx4Rv9g==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:47108 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFT0-002MyN-0C;
	Fri, 15 Sep 2023 15:31:06 -0500
Message-ID: <7f1577d3-a3f4-3c5a-3761-f56a85eb9c8e@embeddedor.com>
Date: Fri, 15 Sep 2023 14:32:02 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dm: Annotate struct stripe_c with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Alasdair Kergon <agk@redhat.com>
Cc: Mike Snitzer <snitzer@kernel.org>, dm-devel@redhat.com,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915200352.never.118-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915200352.never.118-kees@kernel.org>
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
X-Exim-ID: 1qhFT0-002MyN-0C
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:47108
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 96
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGPL0/k+mnGJ3/ZIdVK3u9FmpT9K3ImRvrjAqAc5y1qP86TCcwr18oD416gbTGQxpGLhbtpFMcZBD0ILx7zkvrapx8FWc9IRbFtsFKKR2vUyBvs63Iag
 WS+/dn27alAKUTlk/hlGHCq9M03k9HtUG0q77NcvOplfdhImKbDvrrOgV5stmFGzj8SOWTGusSdifbtqg6jTwyyjMVRLzwy2S9c=



On 9/15/23 14:03, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct stripe_c.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Alasdair Kergon <agk@redhat.com>
> Cc: Mike Snitzer <snitzer@kernel.org>
> Cc: dm-devel@redhat.com
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/md/dm-stripe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
> index e2854a3cbd28..5e70f5ae394d 100644
> --- a/drivers/md/dm-stripe.c
> +++ b/drivers/md/dm-stripe.c
> @@ -44,7 +44,7 @@ struct stripe_c {
>   	/* Work struct used for triggering events*/
>   	struct work_struct trigger_event;
>   
> -	struct stripe stripe[];
> +	struct stripe stripe[] __counted_by(stripes);
>   };
>   
>   /*
