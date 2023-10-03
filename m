Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF7B81C
	for <llvm@lists.linux.dev>; Wed,  4 Oct 2023 01:53:21 +0000 (UTC)
Received: from eig-obgw-5003a.ext.cloudfilter.net ([10.0.29.159])
	by cmsmtp with ESMTP
	id npJ5qMQ7GqBU3nr4jq3jGV; Wed, 04 Oct 2023 01:53:21 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id nr4iqezTn3WvEnr4iqm1Si; Wed, 04 Oct 2023 01:53:20 +0000
X-Authority-Analysis: v=2.4 cv=U+yBsMnu c=1 sm=1 tr=0 ts=651cc590
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=Dx1Zrv+1i3YEdDUMOX3koA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=wYkD_t78qR0A:10 a=J1Y8HTJGAAAA:8
 a=1XWaLZrsAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=NEAV23lmAAAA:8
 a=cm27Pg_UAAAA:8 a=YSKGN3ub9cUXa_79IdMA:9 a=QEXdDO2ut3YA:10
 a=y1Q9-5lHfBjTkpIzbSAN:22 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EWowgCo6Jaqfnu4yfj8jnGH8w3mBI4yI1LPs54X3rg0=; b=h/OElHGxhqfPCpTefoffiusH9y
	eVZVym6+lToWuYsaqt2jhYciELXfJfK9I+eCpnlGKUrxoooRwfX/GACl0LpohN6O9z/Y6LvfK/VXA
	erqDkxrPKpGbfsYf1LMTv/MzHTFauUht4DX2ELneacOcCasukX55marDh7a3fGV0913Ud3rtmfqw6
	M3Q2tiU+DdsIlJKdZpcKvP3T2Xyp8F+HdYrA45gUUMt27z4ULFA0sorbWarJYwQCw+6ZU6jNRXj8V
	ymF8bPvBnNTMXWtA2/dtGBYAmg7NaUN+R6Hx1ff8LVLdkP2t/A0fw4aJrFQXF0/ZGzWDPV9IXmOKC
	PTv6yLgQ==;
Received: from 94-238-9-39.abo.bbox.fr ([94.238.9.39]:44320 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qnoys-001TRc-2W;
	Tue, 03 Oct 2023 18:39:10 -0500
Message-ID: <58e41869-1e2f-a28d-1bbc-1de1e033359e@embeddedor.com>
Date: Wed, 4 Oct 2023 01:39:05 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] flow_offload: Annotate struct flow_action_entry with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev
References: <20231003231833.work.027-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231003231833.work.027-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.238.9.39
X-Source-L: No
X-Exim-ID: 1qnoys-001TRc-2W
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 94-238-9-39.abo.bbox.fr ([192.168.1.98]) [94.238.9.39]:44320
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfL4T6M1GZQqZMeNI+hz1xn5P/u3iAM73mtLX7aXoZeMAQWBPk2MWtosXZ0G38LmpZBeB1lejK8AHVQbXUdHC1xuMbY5xC7fTfuQXovSSC+FtZCqBz17O
 +L6ivhz6o6cqbvbv12osih5VHWGURaqxoWu66UCpAIKLB22DONOc4SCV3HSdWjXDx2gRwoKEwYMuu4z6dRv3J067Vog9jUDLqX0=



On 10/4/23 01:18, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct flow_action_entry.
> 
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: netdev@vger.kernel.org
> Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   include/net/flow_offload.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/net/flow_offload.h b/include/net/flow_offload.h
> index 9efa9a59e81f..314087a5e181 100644
> --- a/include/net/flow_offload.h
> +++ b/include/net/flow_offload.h
> @@ -333,7 +333,7 @@ struct flow_action_entry {
>   
>   struct flow_action {
>   	unsigned int			num_entries;
> -	struct flow_action_entry	entries[];
> +	struct flow_action_entry	entries[] __counted_by(num_entries);
>   };
>   
>   static inline bool flow_action_has_entries(const struct flow_action *action)
