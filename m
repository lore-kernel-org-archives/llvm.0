Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0961B288
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:30:52 +0000 (UTC)
Received: from eig-obgw-5003a.ext.cloudfilter.net ([10.0.29.159])
	by cmsmtp with ESMTP
	id hAPUqiySsbK1VhFSmqlF5r; Fri, 15 Sep 2023 20:30:52 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFSlqalOnPsxChFSlqus07; Fri, 15 Sep 2023 20:30:52 +0000
X-Authority-Analysis: v=2.4 cv=BuqOfKb5 c=1 sm=1 tr=0 ts=6504befc
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
	bh=kqpFc+6WUDnssAblCEJx9AOlPnNTHAR7+vmbVqfjYCw=; b=A2cpeTa8LyHMnqW5epBJVnKoth
	Gp+/9Lk7FQ8D4FVKxWi19O6M0d540ICzsDM6YBsqCbUCi7s20XnaGCi+/D/+JibzAtaovUMhmnZcd
	y9gRyf1xEK+AUUL6SV2MGxXLXZl3ML0Vhw2saf+47hulOKzMUguUBo+6jp5BH+TgRN+T6h52kDC28
	s1KQozrbTsdOZf6T55kAM5Sifb1Sc7nQZ2ezhlIW19I8CVE+UfhFDsbQifQrOSWKp9Z7XN/ptLti/
	Wm7iG927k61ueZAb4IXu2rVFrAZpDAB0jN4tvLXdMu3lUy2dwyzEBqNui9V5YqFGPPKPnluo+Lgin
	IURVOC6A==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:55922 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFSk-002MlD-1G;
	Fri, 15 Sep 2023 15:30:50 -0500
Message-ID: <030807ff-5fc0-3461-565e-be06bf0906dd@embeddedor.com>
Date: Fri, 15 Sep 2023 14:31:46 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dm crypt: Annotate struct crypt_config with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Alasdair Kergon <agk@redhat.com>
Cc: Mike Snitzer <snitzer@kernel.org>, dm-devel@redhat.com,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915200344.never.272-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915200344.never.272-kees@kernel.org>
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
X-Exim-ID: 1qhFSk-002MlD-1G
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:55922
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 86
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfADpQx2CacKiXYddXDsGLyfAO7PM8JVE1hPhDSr0OLyJsn6ylKxRsvhOf+BE79RXfMqOqNJpFrTtVgf6+oLR+yn4LZW5mTvUvw7OxFZ0lNz8Zi8MfHL7
 WAqBlSMN6UWW34MIsGgQeKm14sqB6Y2D+k7Rl8BfusuDDLUnuaBUHMWx/arA9bm7/xMopYv7+QCgHvE1LVV008Rcvu373Yue+Vw=



On 9/15/23 14:03, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct crypt_config.
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
>   drivers/md/dm-crypt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index f2662c21a6df..f276e9460feb 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -224,7 +224,7 @@ struct crypt_config {
>   	struct mutex bio_alloc_lock;
>   
>   	u8 *authenc_key; /* space for keys in authenc() format (if used) */
> -	u8 key[];
> +	u8 key[] __counted_by(key_size);
>   };
>   
>   #define MIN_IOS		64
