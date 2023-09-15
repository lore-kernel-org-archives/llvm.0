Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE2310947
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:29:20 +0000 (UTC)
Received: from eig-obgw-5006a.ext.cloudfilter.net ([10.0.29.179])
	by cmsmtp with ESMTP
	id h8dGqbD6mez0ChFPUqBogX; Fri, 15 Sep 2023 20:27:28 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFPpqTSDUyBEYhFPqqjoTZ; Fri, 15 Sep 2023 20:27:50 +0000
X-Authority-Analysis: v=2.4 cv=durItns4 c=1 sm=1 tr=0 ts=6504be46
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
	bh=a6FgjMylHXWTpHsDUs+9t/FgxU+P0Q11ISaPe1Rcv8w=; b=xWE1ePG1pJ/MBNbTKML7mWpv7+
	hTvnsr9J5+w66OSudqoVfFSRzjW5ualO3+2HxahufVMkVae2VyPglsd2DeLXLnuV1Ne268PVqoGBF
	gzuKSPgYIz+MgtmJ26p20dnfLIo8DVRgTtenBjGhRAdS2bJkRkrHDxTBcIuUxSVjYrRF49gs3R7ua
	Ms4rqhUu2JQbzLFgPadTU4xcpViBtzieu9urP9YXMOfwBdpmznz+9rr/BLun/ZoSUCOGOjhB1NZ6s
	mqxNn7VZdQMxomnxvX9BExnhmVSfJ0i9xHBOyYo9Tb+JkulIc3GUeS+WVY2uAjoqv0pbx1mT0eyBI
	HuQ4ktjA==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:51030 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFPo-002Jct-1H;
	Fri, 15 Sep 2023 15:27:48 -0500
Message-ID: <6bf23c7f-9f7f-1d9e-9aa0-e163608447ae@embeddedor.com>
Date: Fri, 15 Sep 2023 14:28:44 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dm raid: Annotate struct raid_set with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Alasdair Kergon <agk@redhat.com>
Cc: Mike Snitzer <snitzer@kernel.org>, dm-devel@redhat.com,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915200335.never.098-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915200335.never.098-kees@kernel.org>
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
X-Exim-ID: 1qhFPo-002Jct-1H
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:51030
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 76
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDHCY3vvTAyWfGG/Ua3saMmPScQjbeTYomdk+okGRJYBIrUKYz1GJm21p6BEKkcej69EFbddKOMC1Bh1Xdt6o2ImhPm0ddU2UvXEP7e9vI4tQnG45dZr
 PzH1xIwi3LEUVfmVSLl6zxaakCdlUfL1kDWYm9amzNyT4PT07YyhE2WPRt3vRA0y7pNqAR7fPQxTIMzAFZ7gu/uMRqEnINPHNWk=



On 9/15/23 14:03, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct raid_set.
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
>   drivers/md/dm-raid.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
> index 5f9991765f27..9755788e8b78 100644
> --- a/drivers/md/dm-raid.c
> +++ b/drivers/md/dm-raid.c
> @@ -254,7 +254,7 @@ struct raid_set {
>   		int mode;
>   	} journal_dev;
>   
> -	struct raid_dev dev[];
> +	struct raid_dev dev[] __counted_by(raid_disks);
>   };
>   
>   static void rs_config_backup(struct raid_set *rs, struct rs_layout *l)
