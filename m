Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B8F20B3B
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 17:41:55 +0000 (UTC)
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
	by cmsmtp with ESMTP
	id jnFeq8e7xyYOwk6deq1yOa; Sat, 23 Sep 2023 17:41:54 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id k6ddqYseAsKmik6deqOQJL; Sat, 23 Sep 2023 17:41:54 +0000
X-Authority-Analysis: v=2.4 cv=JOMoDuGb c=1 sm=1 tr=0 ts=650f2362
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=H4JREhYHBOAGWkRiGPUdzLOI0Q+X9gKq6OB7uMuTe1I=; b=MFwqU9oovIy23L0FWzwPeiuZaF
	pOuzFavWPqSrM6dWy7o1Y102OD/SxZHV2NguGty0Zdk6ijy/u5VxQm3mOLdd4jZfMpBsSgXGc1/TG
	3uh1l09NQKqRtbVd55eU/2Xb8O0FSKR3drSQGF9JjMOXFNEZBuIMZ/sigDM1kbxCCmqcXmVBmqJHb
	Hi5j6CMi2zHOOISwg/FevzUW2Mu+X9u2WYbKSu3NCLuy6TNzt/RmQzpheTpQuCR+/oIvyG/QBB+up
	iXgHha4UIzczUEeiCGMK0HdlhPVDJXdfKf9/WrGUM5uHzaG0JMSf7ns8Hfjl8c9bgiTpjMYc+H/S2
	0v72OciQ==;
Received: from [94.239.20.48] (port=47370 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qjy33-003ahi-1V;
	Sat, 23 Sep 2023 03:31:33 -0500
Message-ID: <e8ff2426-66dc-3357-da9f-af818720b2a0@embeddedor.com>
Date: Sat, 23 Sep 2023 10:32:36 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] KVM: Annotate struct kvm_irq_routing_table with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230922175121.work.660-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175121.work.660-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.239.20.48
X-Source-L: No
X-Exim-ID: 1qjy33-003ahi-1V
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:47370
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAK97+yIfnrPqbw7rgENCEZ163bZ3jIJA+a5chfXDJz5QyWspyalwXWPoB7Xo6/iyw5pUuKofyixGjRk/FfN5twyGRWy0nsKn488rWqVjZRsC5FrYMMl
 gF0xNvhChIBjwIK+OLjCVIRqWUT2LdvaDZZu213Qr+TJlZ7GinAHt/QYHtkHIV++16PgsWc1WqgiwQvCFvJAi0EL8Y4jsOYnKb8=



On 9/22/23 11:51, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct kvm_irq_routing_table.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: kvm@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   include/linux/kvm_host.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index fb6c6109fdca..4944136efaa2 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -664,7 +664,7 @@ struct kvm_irq_routing_table {
>   	 * Array indexed by gsi. Each entry contains list of irq chips
>   	 * the gsi is connected to.
>   	 */
> -	struct hlist_head map[];
> +	struct hlist_head map[] __counted_by(nr_rt_entries);
>   };
>   #endif
>   
