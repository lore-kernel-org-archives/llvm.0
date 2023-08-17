Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7A51643A
	for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 21:17:07 +0000 (UTC)
Received: from eig-obgw-6009a.ext.cloudfilter.net ([10.0.30.184])
	by cmsmtp with ESMTP
	id WgHtqYOFUWU1cWkMdqMOz5; Thu, 17 Aug 2023 21:17:07 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id WkMcqRKag9DJVWkMcqI8jq; Thu, 17 Aug 2023 21:17:06 +0000
X-Authority-Analysis: v=2.4 cv=UaxC9YeN c=1 sm=1 tr=0 ts=64de8e52
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=UttIx32zK-AA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=edGIuiaXAAAA:8 a=xVhDTqbCAAAA:8 a=K6HrmWtEAAAA:8 a=hBqU3vQJAAAA:8
 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10
 a=4kyDAASA-Eebq_PzFVE6:22 a=GrmWmAYt4dzCMttCBZOh:22 a=yV38gEssg_2GhkhKF82i:22
 a=WLjMIN4s_96MqnBbPenP:22 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XPrmBnGis32Q4Plsd5hHko1y81xn30PHQUauq/WHvYE=; b=j1YUKDz7wraUXWHGPd7VTuEae/
	Byk8pUT8yXEhDXuwemji864YtuYgeSgS1NcZzfKN4eMUZpiDU83w/kzCUY6sz20kx2UXpnj6WGE8B
	HMue5dVwt6HvqXAAwVHOWEAfiLzGLaE/G5rNbcgYlx603vNA4JDTDKXPzer3vx96Qns869F2nunBU
	52XoOlRv8x92H4zTANHgQtrni72bme3zfbjLfpnA9cxVMlzTsUxmqIRd9bkX62lKRnpe6SGyFnN18
	ye41BDVA7BnW/DmfGzyx2XuAVURRveQoMk3BWLhGK8n9sQZCfCMgZ46IkWWoGkNfNHEEhuYjyTYam
	G2XvhWBw==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:56616 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qWkMa-001gal-1N;
	Thu, 17 Aug 2023 16:17:04 -0500
Message-ID: <713066f1-1c03-94c4-c9d6-7b145a9ac00b@embeddedor.com>
Date: Thu, 17 Aug 2023 15:18:06 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] landlock: Annotate struct landlock_rule with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?=
 <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230817210257.never.920-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230817210257.never.920-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qWkMa-001gal-1N
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:56616
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 23
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIwkdkJMnLshyqe9goeaOTpTYWZB0m/5mStFfXq4yP3E+X8k+gFHB4hjLHrkJ6ZRDRbQhQjyGLaLtlEEsMBePhMMx+fxIQfwpY5jXYqqlwimGokkJR4g
 BPysV9K5d+ery12tEAuSNdwFH0JPjrErp8IW680ZrnQAeHh6rJInOVmPzX6/now4l2lBxeIh8oKgnBY2/qNXbCBbViUhZtG8B/I=



On 8/17/23 15:03, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct landlock_rule.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: "Mickaël Salaün" <mic@digikod.net>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Cc: linux-security-module@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   security/landlock/ruleset.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/landlock/ruleset.h b/security/landlock/ruleset.h
> index d43231b783e4..55b1df8f66a8 100644
> --- a/security/landlock/ruleset.h
> +++ b/security/landlock/ruleset.h
> @@ -67,7 +67,7 @@ struct landlock_rule {
>   	 * @layers: Stack of layers, from the latest to the newest, implemented
>   	 * as a flexible array member (FAM).
>   	 */
> -	struct landlock_layer layers[];
> +	struct landlock_layer layers[] __counted_by(num_layers);
>   };
>   
>   /**
