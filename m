Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1546630CFF
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:50:36 +0000 (UTC)
Received: from eig-obgw-6002a.ext.cloudfilter.net ([10.0.30.222])
	by cmsmtp with ESMTP
	id hAM2qXdR6yYOwhFlsq0wJ7; Fri, 15 Sep 2023 20:50:36 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFlrqx8uTZRGzhFlrqOV2l; Fri, 15 Sep 2023 20:50:35 +0000
X-Authority-Analysis: v=2.4 cv=PLscRNmC c=1 sm=1 tr=0 ts=6504c39b
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8
 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bGxhVUtgvEtIdv5fdJaFlvXT8/mXEEnYVeDX80O0mX8=; b=pVxo90MtuiavN6bEoVO6DwiSj9
	X7B/rqqGQsao/orbkh4UlEIIVyIl98hLd2mWBwQaUK9Z1mbR2G37nYMFvWZL3F71qEv7OY+oXglG5
	rA+J0kWnfqnIdkAItqbXTEPpBsqGmHPP5Jc8M77613D98okLcnMdKj9srH8sRAqY+w0eCAG/wwCqK
	zzFKVAe6wXu3WOabWWzdEVeTMvajCqeObw3OY84OAOeHiDP42lWwDkFvOadx5Msp39voUnAbjSrLe
	sX3emfdNDgH5fvEh52X9LkYtobJrqPOUnOge6pDGCUEteStwQgtX0V0q8LqC5G2yfWSjXHW6ixTQ3
	My8YkabQ==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:54838 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFlq-002fvY-1O;
	Fri, 15 Sep 2023 15:50:34 -0500
Message-ID: <631103a7-6119-145d-8230-5a97e1362785@embeddedor.com>
Date: Fri, 15 Sep 2023 14:51:30 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ceph: Annotate struct ceph_osd_request with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Ilya Dryomov <idryomov@gmail.com>
Cc: Xiubo Li <xiubli@redhat.com>, Jeff Layton <jlayton@kernel.org>,
 ceph-devel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201517.never.373-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915201517.never.373-kees@kernel.org>
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
X-Exim-ID: 1qhFlq-002fvY-1O
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:54838
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 481
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJwVRupSW3X5heyQj889Yr+MEp5Xz+1kn+DhBDcTLeu72SZZX2UUQrq3qjJ2/TnxxGpK3q9sRyc0hv61VStyidoQrr8h/E0AbI4ziND9wnUPsxdz0l7C
 RxxMqM8JM/YkwcgyT5mTCkMAJz5fYapq/hZGLP/nnNxiLXOw8taqiut97EBWRTvnoR1Jpfdrm1z1+BL9zmrmQF7Ct7dS1yCCUUM=



On 9/15/23 14:15, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct ceph_osd_request.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Ilya Dryomov <idryomov@gmail.com>
> Cc: Xiubo Li <xiubli@redhat.com>
> Cc: Jeff Layton <jlayton@kernel.org>
> Cc: ceph-devel@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   include/linux/ceph/osd_client.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/ceph/osd_client.h b/include/linux/ceph/osd_client.h
> index bf9823956758..b8610e9d2471 100644
> --- a/include/linux/ceph/osd_client.h
> +++ b/include/linux/ceph/osd_client.h
> @@ -278,7 +278,7 @@ struct ceph_osd_request {
>   	int r_attempts;
>   	u32 r_map_dne_bound;
>   
> -	struct ceph_osd_req_op r_ops[];
> +	struct ceph_osd_req_op r_ops[] __counted_by(r_num_ops);
>   };
>   
>   struct ceph_request_redirect {
