Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA12C2918
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 20:58:44 +0000 (UTC)
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
	by cmsmtp with ESMTP
	id We1mqgRQuyYOwWk4qqtApm; Thu, 17 Aug 2023 20:58:44 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id Wk4pqSWKz234eWk4pqF3g6; Thu, 17 Aug 2023 20:58:43 +0000
X-Authority-Analysis: v=2.4 cv=cPzzD3SN c=1 sm=1 tr=0 ts=64de8a03
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=UttIx32zK-AA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=xVhDTqbCAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8
 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10 a=GrmWmAYt4dzCMttCBZOh:22
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QK5+XSk7+Wct2AffyLxNmzx6pirn15+jfPRh1mvX+Mw=; b=dsqPO8ni2pkAlyrwRzGlplPlMP
	S8p5GFNG1Lun0m+l/taUZ9GySpWTrhPvMpv0uMxJfDqCP/6PiqWu/uWonmRLM6RLcDHlj5xVCAjkm
	WFIY1ECkAp11DztXLybMs9hq0aXUCpToXgDdrSH0kW6a7/s8sqi2kKTCLxTCDM/jwWdZi19eI4pHg
	MN58QTgPdq1G31rq1Ne03UZN0Gb+kR+xxVF9ktXp7zB5cpaIxHMQ6mWqbVMAkEDvi8mUNhLm9EYWs
	/AemahcF1oPMZbOtdV4mF142ySoXZ2E057pVqNfoiOtQpRDm5h/iuQWz4MEfHu/Iv++fDSkn0iCOi
	ziNRXIQw==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:36284 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qWk4o-001OYb-0q;
	Thu, 17 Aug 2023 15:58:42 -0500
Message-ID: <429e0417-67c3-0187-a588-ca53a3d6c9ff@embeddedor.com>
Date: Thu, 17 Aug 2023 14:59:44 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] audit: Annotate struct audit_chunk with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Paul Moore <paul@paul-moore.com>
Cc: Eric Paris <eparis@redhat.com>, audit@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230817203501.never.279-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230817203501.never.279-kees@kernel.org>
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
X-Exim-ID: 1qWk4o-001OYb-0q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:36284
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 90
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNGxerCiBKR1zUMCguWNmzUMIY0xOcWuyG1iwj+ayeX0iC/ABL0f22uen2fGCL4wzZnBC9l+tR/SvBSBeQwhlPws2EAPBomNkVPLuUFkSKopuDczWJQv
 0SVX4nlwvNfMmWcplrkjjdMZNadc3ThkDAu3Uk3V2yxlIAMnHm8XXY5pfeEBSh+sr4AuNh13CYmY2TZQimqzlavOmcYd7G0p+nY=



On 8/17/23 14:35, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct audit_chunk.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: Eric Paris <eparis@redhat.com>
> Cc: audit@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   kernel/audit_tree.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/audit_tree.c b/kernel/audit_tree.c
> index e867c17d3f84..85a5b306733b 100644
> --- a/kernel/audit_tree.c
> +++ b/kernel/audit_tree.c
> @@ -34,7 +34,7 @@ struct audit_chunk {
>   		struct list_head list;
>   		struct audit_tree *owner;
>   		unsigned index;		/* index; upper bit indicates 'will prune' */
> -	} owners[];
> +	} owners[] __counted_by(count);
>   };
>   
>   struct audit_tree_mark {
