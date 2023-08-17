Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8B91427B
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 21:25:14 +0000 (UTC)
Received: from eig-obgw-6009a.ext.cloudfilter.net ([10.0.30.184])
	by cmsmtp with ESMTP
	id WgHfqlavbez0CWkUFq51sB; Thu, 17 Aug 2023 21:25:00 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id WkUTqRX9w9DJVWkUTqIL53; Thu, 17 Aug 2023 21:25:13 +0000
X-Authority-Analysis: v=2.4 cv=UaxC9YeN c=1 sm=1 tr=0 ts=64de9039
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=UttIx32zK-AA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=8-QigG1ummv6mNus-HEA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=e8YoEXhrx8Kg5FTV+4AZj/HZVi/cqxAEu7i4SHZBseI=; b=JoiqbaIXFh10f+1xFU+cs1CRjL
	0wTnLOsSGUeDQLQDPn+PGp+gXAy/cj49WRuOduSrBAMXhYCqTOPm/ZR+ddowmNvOtb7okaLl+51pR
	Tb//b1dP1FFWN1CxkC/Mv/rZq4hNp86dxlEK9Zet3fWeFWtGEmiNim0TkmfLPRvhkq60n45UPWchJ
	NKTEqZ9dB7xR4H/CrCEArePagfgyf27UomxCzlqqZJf9dXviDD6YuXNswEehdHDFKkay/hlnZ5LcO
	/pK1W9Uz8flUiCTbcMOuOqT8aVFKDOUbDIzJES9+y1ixWY80iYccC4Ss7h8XNPaHZ27KIrM2CZdCu
	7xv0MRxQ==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:49904 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qWkUS-001nHK-13;
	Thu, 17 Aug 2023 16:25:12 -0500
Message-ID: <656be1ad-d2f2-91c5-b250-436699d8513b@embeddedor.com>
Date: Thu, 17 Aug 2023 15:26:14 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] io_uring/rsrc: Annotate struct io_mapped_ubuf with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Jens Axboe <axboe@kernel.dk>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230817212146.never.853-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230817212146.never.853-kees@kernel.org>
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
X-Exim-ID: 1qWkUS-001nHK-13
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:49904
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 147
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNQR+41CjnDRTfIBR6Eb6G/2BMwffNIMYSYgBFawjWNrO+sSxG4mp1q+Dx+INL6YUDJKEE4sgn8Ul4HYvipM5ScunTD3K2IDyOaaksjkvmcd2JrcIy1z
 SqQQhai60Pe8CCR5nr/kmvSmPubfK/THFfHdq+JKiB9MqxZ7XYdPf8vWuTRE6klpIE0D5rebkUuZj8PpfdD9KOhaFw2sJZaBnWI=



On 8/17/23 15:21, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct io_mapped_ubuf.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Pavel Begunkov <asml.silence@gmail.com>
> Cc: io-uring@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   io_uring/rsrc.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
> index 8afa9ec66a55..8625181fb87a 100644
> --- a/io_uring/rsrc.h
> +++ b/io_uring/rsrc.h
> @@ -54,7 +54,7 @@ struct io_mapped_ubuf {
>   	u64		ubuf_end;
>   	unsigned int	nr_bvecs;
>   	unsigned long	acct_pages;
> -	struct bio_vec	bvec[];
> +	struct bio_vec	bvec[] __counted_by(nr_bvecs);
>   };
>   
>   void io_rsrc_node_ref_zero(struct io_rsrc_node *node);
