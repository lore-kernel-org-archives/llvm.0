Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F07019890
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 21:02:40 +0000 (UTC)
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
	by cmsmtp with ESMTP
	id WZepqv6vVfaVXWk76qLpRj; Thu, 17 Aug 2023 21:01:04 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id Wk75qbIoND5qiWk76qWOWA; Thu, 17 Aug 2023 21:01:04 +0000
X-Authority-Analysis: v=2.4 cv=dMe1JcVb c=1 sm=1 tr=0 ts=64de8a90
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=UttIx32zK-AA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YHBjgijmaD4FytE/JAxc5g4bMOnGx8oPkzLVVzXQwAs=; b=q5lYgpZG+tU76CLdUEYkkiVf+S
	BIebq3Cjo897BpcjNlsYVrKBbsY5B+eu8hvya6JcvMe8GtUj7t5QQg+e8wD2pAP4ivkuUU3mcmmWU
	1RNI/4p1FgRvP+oMLP5ELITHCBg0/paYSvsoXNQ2XCa9d3YuQelQyDm+9SBywqPB/lQVbxEarXPmi
	oRnCVVFl2xvM/YTE4iNf4F7uHDuYROAPxj7wpbrJhXVYUghd5HhZ5PxjjtZ/VxFBM5gWDAXcAEp7a
	LP5NZipgWQrw+Gx0msH93SAlVYX19wpVoFacSieCxjQO4Gyq7NEKTYkhZJY4DVNLGoWtg+sE5dJ7V
	UCk/SDPA==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:38296 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qWk74-001RIE-0e;
	Thu, 17 Aug 2023 16:01:02 -0500
Message-ID: <75830fc8-82a6-6cf2-059d-4bea0fd4ed45@embeddedor.com>
Date: Thu, 17 Aug 2023 15:01:59 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] interconnect: Annotate struct icc_path with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Georgi Djakov <djakov@kernel.org>
Cc: linux-pm@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230817204144.never.605-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230817204144.never.605-kees@kernel.org>
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
X-Exim-ID: 1qWk74-001RIE-0e
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:38296
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNESjKvsOS3UMGRorzNE4XDO15Ed3vDiU0ZXEdLCz6tPLz1J/B57SldJ6pFus5HiiQfUArgkFbRgKSe2BbSdjpN4mVrp6M4az0ZDw23xr84X3UID/UZX
 VNY/j9D+qcbyKLGtWGgchtCPFnsmeNLqyWYcCZSKLMnsx40/3ComDoqn9MGJ17jNnEo4mr+zUUmtGEjYcfsYWtTNzNWva/F8xmI=



On 8/17/23 14:41, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct icc_path.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Georgi Djakov <djakov@kernel.org>
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/interconnect/internal.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/interconnect/internal.h b/drivers/interconnect/internal.h
> index f5f82a5c939e..b30856db523d 100644
> --- a/drivers/interconnect/internal.h
> +++ b/drivers/interconnect/internal.h
> @@ -38,7 +38,7 @@ struct icc_req {
>   struct icc_path {
>   	const char *name;
>   	size_t num_nodes;
> -	struct icc_req reqs[];
> +	struct icc_req reqs[] __counted_by(num_nodes);
>   };
>   
>   #endif
