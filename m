Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1D421367
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 20:21:51 +0000 (UTC)
Received: from eig-obgw-6008a.ext.cloudfilter.net ([10.0.30.227])
	by cmsmtp with ESMTP
	id jnFfq8e8lyYOwk98Qq2WsQ; Sat, 23 Sep 2023 20:21:51 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id k98QqbrzCsKmik98QqPuJv; Sat, 23 Sep 2023 20:21:50 +0000
X-Authority-Analysis: v=2.4 cv=JOMoDuGb c=1 sm=1 tr=0 ts=650f48de
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dMtmtT6tX/J/Z9nN8F6wXmACJvxIhIjSA2EPSc7V54o=; b=nLSy7Yyg8X16vsP4+fNRB4Rotn
	66Cg4GycjlShrC9MRh6WTMvGPinJuZLxjOs9e7FizT69nAYp/OkhR/IhrDiNHjixOGY/4eQKAaoAX
	k5Mo8kidONlYLjZEvPv5x03+/cg8aCmfQvKmVYwJJLElNvPgHwbAr3yxCrtCiOdxlxn92geZB8iJJ
	XBNc4Flajgvmg6YhTs2c+QPVHTvFUWeE0RH4EULSQF2sBJ0kPOkstu9MQClUpd+K2JjCAdzdvLssr
	/wYuucKyHkJ8cnJPRYkXa3e+aPSVpAWxxoGE685mXoLtUsQXWVVXwa5l9DNTpIkhtmnfuc3VkZQ8v
	6sGqmEew==;
Received: from [94.239.20.48] (port=58218 helo=[192.168.1.98])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qjy3s-003bcu-2i;
	Sat, 23 Sep 2023 03:32:25 -0500
Message-ID: <f1aa9b5a-6867-6000-8f3c-9a15eb216961@embeddedor.com>
Date: Sat, 23 Sep 2023 10:33:29 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] video: mmp: Annotate struct mmp_path with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230922175141.work.450-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230922175141.work.450-kees@kernel.org>
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
X-Exim-ID: 1qjy3s-003bcu-2i
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:58218
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDN4dGDXPb/ZpUdLoI3dv7Y9I5fZF5El3olbmoeWmpBzH/l9Ej1V1SMM4e+0HQis1KtedE4SVYFxpVDI6n1XOHeDPnEZgG3DIcTvjTNwL1ClutJYZ73q
 fHHaik05KntmebUeRTrRY/NzbGfrzKCRdBt4nnWTvH2afD/Pisw3CEz3jUIzWzC+MJVXGYtU1CQVjb4WNRqHDFS1Fei7vu98AsQ=



On 9/22/23 11:51, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct mmp_path.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   include/video/mmp_disp.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/video/mmp_disp.h b/include/video/mmp_disp.h
> index 77252cb46361..a722dcbf5073 100644
> --- a/include/video/mmp_disp.h
> +++ b/include/video/mmp_disp.h
> @@ -231,7 +231,7 @@ struct mmp_path {
>   
>   	/* layers */
>   	int overlay_num;
> -	struct mmp_overlay overlays[];
> +	struct mmp_overlay overlays[] __counted_by(overlay_num);
>   };
>   
>   extern struct mmp_path *mmp_get_path(const char *name);
