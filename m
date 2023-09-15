Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C89F101C6
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:33:13 +0000 (UTC)
Received: from eig-obgw-5007a.ext.cloudfilter.net ([10.0.29.141])
	by cmsmtp with ESMTP
	id hFDAqMEwDEoVshFTUqHrN0; Fri, 15 Sep 2023 20:31:37 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFTTqIxrmHoqXhFTUqdxTy; Fri, 15 Sep 2023 20:31:36 +0000
X-Authority-Analysis: v=2.4 cv=VP7OIvDX c=1 sm=1 tr=0 ts=6504bf28
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=YoX3If6DFWHe0apXbcEA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cWX46vWVpx+665oxq6ukgOT3sTNVyqzHepobvBTppu8=; b=kBxe0TfxNLJfSiSFl5mYKuxkfa
	BJgznUheHQ0NM+RzA1nKCDRq36WV9mGnkAVLJ2STM9Civg4rKYMq2Ue4JxUNepjltoLEK+jXJb2b7
	86ZvNDN0QulEbboPu+x2rdsn1M+/jNNZDopmxGSErfxg5yg9wdY8YcxzSatW5y3p2euUHG4phVa7J
	44jnAlK3bHUDaGTwJHjKNbbc5PnMZE/RY4H8/1Qk+2gQNRsj0pAwpwH+wbpJNtdCTTP3dr4fxjAvd
	hGIsUGd6xyMulOzK2E/maLsaMykZffihcFuKk+AhYycyjXPtOywLaj7IdFaCJXgYp8VTsT3AoWSaN
	Ci6/USXQ==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:56308 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFTS-002NUI-34;
	Fri, 15 Sep 2023 15:31:35 -0500
Message-ID: <6f1ff9ac-e0cb-68f0-fa2f-91780a3eedb7@embeddedor.com>
Date: Fri, 15 Sep 2023 14:32:31 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dm: Annotate struct dm_bio_prison with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Alasdair Kergon <agk@redhat.com>
Cc: Mike Snitzer <snitzer@kernel.org>, dm-devel@redhat.com,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915200407.never.611-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915200407.never.611-kees@kernel.org>
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
X-Exim-ID: 1qhFTS-002NUI-34
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:56308
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 116
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOtG0Ls4xTvfmkqES1CBUyx6mlQ9fsZ6rNcjZFVarBlvnV4BIYQKp2XB1llQnyywNtDWxE8MrW2lngCoypfI0sC17DJpSnlLib39v5WUL7JtD0nz2Wj2
 o37Yx/ESlSqEch6xtKb1fhBwzd3dwIwVestZ+sSoLx/Vm4KhP3qqYjKjWFjNFY92ax+tGpYCgDQyHfPwRZpwbyf3mTiUIhg7A1E=



On 9/15/23 14:04, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct dm_bio_prison.
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
>   drivers/md/dm-bio-prison-v1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-bio-prison-v1.c b/drivers/md/dm-bio-prison-v1.c
> index 92afdca760ae..9ab32abe5ed4 100644
> --- a/drivers/md/dm-bio-prison-v1.c
> +++ b/drivers/md/dm-bio-prison-v1.c
> @@ -26,7 +26,7 @@ struct prison_region {
>   struct dm_bio_prison {
>   	mempool_t cell_pool;
>   	unsigned int num_locks;
> -	struct prison_region regions[];
> +	struct prison_region regions[] __counted_by(num_locks);
>   };
>   
>   static struct kmem_cache *_cell_cache;
