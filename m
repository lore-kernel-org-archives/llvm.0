Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9C12918
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 20:53:45 +0000 (UTC)
Received: from eig-obgw-6007a.ext.cloudfilter.net ([10.0.30.247])
	by cmsmtp with ESMTP
	id We1iqXab7WU1cWjySqLfI2; Thu, 17 Aug 2023 20:52:08 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id WjyRqjP0mh9i0WjyRqJtFf; Thu, 17 Aug 2023 20:52:07 +0000
X-Authority-Analysis: v=2.4 cv=ZMPEJF3b c=1 sm=1 tr=0 ts=64de8877
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=UttIx32zK-AA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=xVhDTqbCAAAA:8 a=pGLkceISAAAA:8 a=77d_1CzMAAAA:8 a=20KFwNOVAAAA:8
 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10
 a=GrmWmAYt4dzCMttCBZOh:22 a=QN4qkdld4szc5MSp8JWP:22 a=AjGcO6oz07-iQ99wixmX:22
 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VioEz5G8YTOEnVp9KTSVuftAiGJ+QqIcrXKXiyfBXxo=; b=gRfj77ASVgwk7W9vj9NUd5LT59
	x2/zDeRrxkJDlOexjziQTrEXg9RvoGfgTQbIRnbKHs8VDFX5DdyC2IcAfxcfPhzQR0X6sbNcS8/jX
	+ajCNDc0xvIWbU8xHxkalORbTahdOyEkySt1Tm5z2TCOITNMTadT07SwjyJkCtbsvTQyVb5JTQtZ/
	9G71q4cbbM8cofQtQPjE9jDldyHRTMmsNBfVj/L8xPV0vEGq8UrqMtA1OCSc3wpv/VYo9wxSFMvPl
	OCHRhv3pGiieTrdO9LGdNj7yeDAaBY7suszXDHmIYKccIli+AvBhchfm0g7ueBx58HMlfmDqof/9h
	FrsLBRWw==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:39854 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qWjyP-001JbT-22;
	Thu, 17 Aug 2023 15:52:05 -0500
Message-ID: <ae4756a2-55a4-fe0b-50e0-b87c17151354@embeddedor.com>
Date: Thu, 17 Aug 2023 14:53:07 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] selinux: Annotate struct sidtab_str_cache with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Paul Moore <paul@paul-moore.com>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>,
 Eric Paris <eparis@parisplace.org>, Ondrej Mosnacek <omosnace@redhat.com>,
 selinux@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 "GONG, Ruiqi" <gongruiqi1@huawei.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20230817202210.never.014-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230817202210.never.014-kees@kernel.org>
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
X-Exim-ID: 1qWjyP-001JbT-22
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:39854
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 54
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKBmvH937+czqEZy3UPdL6xX5XgpjbWawoETSs9bzjYq4gbYvKjGjsP+3JKioRA5B4Hk7msucVtGZlp1nLezDkDcBjQsm9apjkjy0xWtWIsKg3U7mvPz
 14bQAddKPwW/YBLrFLt9x/GCdSqXT7BiBmQgan47x3xALziWNu5MdlxLIpMtbAf4+sLJt2mIiIy1ye9tlf5tpuCtW2BhjHblZak=



On 8/17/23 14:22, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct sidtab_str_cache.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
> Cc: Eric Paris <eparis@parisplace.org>
> Cc: Ondrej Mosnacek <omosnace@redhat.com>
> Cc: selinux@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   security/selinux/ss/sidtab.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/selinux/ss/sidtab.c b/security/selinux/ss/sidtab.c
> index d8ead463b8df..732fd8e22a12 100644
> --- a/security/selinux/ss/sidtab.c
> +++ b/security/selinux/ss/sidtab.c
> @@ -25,7 +25,7 @@ struct sidtab_str_cache {
>   	struct list_head lru_member;
>   	struct sidtab_entry *parent;
>   	u32 len;
> -	char str[];
> +	char str[] __counted_by(len);
>   };
>   
>   #define index_to_sid(index) ((index) + SECINITSID_NUM + 1)
