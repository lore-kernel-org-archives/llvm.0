Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B356630CED
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:49:20 +0000 (UTC)
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
	by cmsmtp with ESMTP
	id hFjjqMNjWEoVshFkeqHyXZ; Fri, 15 Sep 2023 20:49:20 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFkdq6IvelWQAhFkeqzVuL; Fri, 15 Sep 2023 20:49:20 +0000
X-Authority-Analysis: v=2.4 cv=INMRtyjG c=1 sm=1 tr=0 ts=6504c350
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=iox4zFpeAAAA:8 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=PN5XkUvCLqoqEaR2be0A:9
 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22 a=xmb-EsYY8bH0VWELuYED:22
 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hYpEA/a0nYCN+dxDO1fQXq4rAKGRzZrtl0k6uVZ1AeE=; b=UJ7yPfFOpUGx5kNv0igW/tIhQw
	kvDXUQFzpxc08aTS6P2Nno6ei1reKQtKw6uwz1egbDBXKKN10ljPPUwKNvzARMtqJoPvH3hDuIRVn
	upa0AueL7k3DOOtzQp484XDfw9AcwQ8H4T0ZehYEka92VzQZ8LuVVLBI6wYtbk0+XVcbk1pYpmaa0
	6ZWXNxyUCluOi/nrBmXJ2ThheKh+2cnsclffbKB+qbxKViQH+8iSk4zXQPPb0px7WWtZQxE4YJpGG
	lftn0SvUU+2H0Fm2ue+vjbs16sYJcOSBwoRztW26UBuN5sm0pBVhDdAnE3AUO+aF7WjqGCXMZnha5
	EebIj/7g==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:46604 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFkc-002ebv-0A;
	Fri, 15 Sep 2023 15:49:18 -0500
Message-ID: <118576aa-a667-8c91-821a-351562dc4c61@embeddedor.com>
Date: Fri, 15 Sep 2023 14:50:14 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] udf: Annotate struct udf_bitmap with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201404.never.574-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915201404.never.574-kees@kernel.org>
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
X-Exim-ID: 1qhFkc-002ebv-0A
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:46604
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 415
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEKndVCdaUSwFI36BoxZbPiQGncL0im6m83o5BmeDab5AGcjUOsYQEDDMy1FnMb5zG0M37W+mKgrlOqsL+uFn2ni73z8hJufLpqWiCU70xjB3N9MD1hk
 5Nx519JrP/qlpV2L748xsTUVG5bELEzEVWJ+tmoycCncozjahz5IjJbTROLmKUNkagR9/kptrrh7mrpdCatTGLTk5w3TwJhINQ8=



On 9/15/23 14:14, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct udf_bitmap.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Jan Kara <jack@suse.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   fs/udf/udf_sb.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/udf/udf_sb.h b/fs/udf/udf_sb.h
> index 9af6ff7f9747..f9a60bc1abcf 100644
> --- a/fs/udf/udf_sb.h
> +++ b/fs/udf/udf_sb.h
> @@ -86,7 +86,7 @@ struct udf_virtual_data {
>   struct udf_bitmap {
>   	__u32			s_extPosition;
>   	int			s_nr_groups;
> -	struct buffer_head	*s_block_bitmap[];
> +	struct buffer_head	*s_block_bitmap[] __counted_by(s_nr_groups);
>   };
>   
>   struct udf_part_map {
