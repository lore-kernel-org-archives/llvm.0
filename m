Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DF81B26D
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:16:54 +0000 (UTC)
Received: from eig-obgw-6004a.ext.cloudfilter.net ([10.0.30.197])
	by cmsmtp with ESMTP
	id hAOdqk3iSQFHRhFFAqvKnp; Fri, 15 Sep 2023 20:16:48 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id hFFAqEDEap9rehFFAqa9cO; Fri, 15 Sep 2023 20:16:48 +0000
X-Authority-Analysis: v=2.4 cv=Ztv+lv3G c=1 sm=1 tr=0 ts=6504bbb0
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=pGLkceISAAAA:8 a=Q-fNiiVtAAAA:8 a=VwQbUJbxAAAA:8 a=PW-KNzBFAAAA:8
 a=20KFwNOVAAAA:8 a=bUQKSiCPAAAA:8 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9
 a=QEXdDO2ut3YA:10 a=Fp8MccfUoT0GBdDC_Lng:22 a=AjGcO6oz07-iQ99wixmX:22
 a=84zbTXrhsdUYOv-GFPQN:22 a=-fHZXUhsFbuwFN3fwQAr:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KtMnX6dW2uHowtokVprvS0xbcPmVacza6Mwf4ovlm7w=; b=EbirQaotkGX6sWPICYXtUjafnE
	K5Fz5wFHy8qSGnU7st/4bZkpJoi5AJfGYoJKDWVSm3LPzpyZF4jjD0wLj3bXnxT2E0gpilJ2nAnzc
	oAAuuTwxVYi7E9AAvHJDoLKJ2n0ljTRHjrgjaEAeq8sbzwzrpUD3YU5Uwh7U5TYrrgyHJrmu1R2na
	F7ultmNNhHqszIdAVJOTRmQARekSBr3yjtewPZIecgO+q82YmmCcMZkuZIWHebH0QROncxbQCywdi
	QfGw9PbYmgrTces/Oq2tr50AgwqXOGY0i26gmG46us4VYrSk+OHM2X1LyT/mAnr7VVGxxAYFN0GGD
	5Ppbrtnw==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:59654 helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>)
	id 1qhFF6-002AbG-2w;
	Fri, 15 Sep 2023 15:16:44 -0500
Message-ID: <fe901465-7820-104c-1761-2095d45cb96a@embeddedor.com>
Date: Fri, 15 Sep 2023 14:17:39 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: brcmfmac: Annotate struct brcmf_gscan_config with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Arend van Spriel <aspriel@gmail.com>
Cc: Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Hector Martin <marcan@marcan.st>, Ryohei Kondo <ryohei.kondo@cypress.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-wireless@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com, SHA-cyfmac-dev-list@infineon.com,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20230915200542.never.417-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915200542.never.417-kees@kernel.org>
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
X-Exim-ID: 1qhFF6-002AbG-2w
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:59654
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFCec9m/78bXvm7BSbNasS0AviIUyRgMkevpRa6NSdvY2r8oxBfOFC3PbW0ycyfSRWekNERqLR50I9szyYbY9+Db5IR38nes2uXt4A5c1rT39Hr8KED+
 Obff/2WYCIzWNVHEVatZmPYXXYvsuSI1qDcPI/b3uHrBHBG0u59F9zK5/WrnxObI14zY75OsvfnjHajyb+eD0mt7k4o0ndaxQkk=



On 9/15/23 14:05, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct brcmf_gscan_config.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Arend van Spriel <aspriel@gmail.com>
> Cc: Franky Lin <franky.lin@broadcom.com>
> Cc: Hante Meuleman <hante.meuleman@broadcom.com>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: Ryohei Kondo <ryohei.kondo@cypress.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: linux-wireless@vger.kernel.org
> Cc: brcm80211-dev-list.pdl@broadcom.com
> Cc: SHA-cyfmac-dev-list@infineon.com
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h
> index bece26741d3a..6eef6bc430e2 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h
> @@ -1209,7 +1209,7 @@ struct brcmf_gscan_config {
>   	u8 count_of_channel_buckets;
>   	u8 retry_threshold;
>   	__le16  lost_ap_window;
> -	struct brcmf_gscan_bucket_config bucket[];
> +	struct brcmf_gscan_bucket_config bucket[] __counted_by(count_of_channel_buckets);
>   };
>   
>   /**
