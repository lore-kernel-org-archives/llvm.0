Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853036;
	b=JxgE3PBPKuDmFW19uzWE5vcUFggMccEQNXDM8AIJ7Fn5Hq3DAehMviQGdE7tun5wxTBk
	 9lcmJYbd44c91nKYdPOVMHkRUvvtPMi7Q3GRPzWaIjD1xgPXsLebx10/+kDG23guNfURX
	 6/Wulkyoh9BM8QMN6CfTsoV24Lged4fT3U2RzLO2BzJa1SfKwmXpbMCqx9Mv7ugqqnFSi
	 cc9CErDTUC9RmXGbs04iOOUtDSxXLIgbd0a5q1zQADaX2HaLX7hBF8Ip+3dj/OczsB18+
	 eXN5/L/JsXlG5sqQY3wkBjE38oCXwC+3ckeoTSWdj1Ol1jSDBfDSp1F7RenmLBe9q6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gdtJsINmNYNnzAIaY46IB+pxpQ6KX2atpqMRoNK0SJo=;
	b=D8P73gj1aCULW6AbIyIHVIFGi7GKFYudVel2ADa/Fw/uZjY77pcvZ3LjEbZvo2Rlwb7Y
	 Tglqxh+QmgcR+fvenQLHrRiic4LNPe2dton+jPId00g1umb1bX5pQjk1VsNtpaXGD93cQ
	 vyHikQs/vpwq6+667nn4IcMoNQsutGSKLTdQZNbudTcf7nlC3JukRAcGBZbr4yY31JmhU
	 sQt4TdmHGLKWTZKIZxzncZQQSUMz5MXBDK2GnaHr/CVqtfIg6jLcCzk8igJ0Hiy9f1oQs
	 +3z8ssKigFX0QTlvYSkgFcOM4Je6Bb/PfoptJFnA76gF9fMliaVVliyieDCvuevIzNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WKOuYygf;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E8B606A337
	for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 18:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6E8B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WKOuYygf
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b179528d56so1775249a91.3
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 10:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794853035; x=1795457835; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gdtJsINmNYNnzAIaY46IB+pxpQ6KX2atpqMRoNK0SJo=;
        b=WKOuYygfTX5VsprlOE6vZKwiK46mmqkYDdgd++ei7T7v3FX/lYvnc1cDN8wFeLjb+U
         PKRMFFpMY+QHC7S7R/qh2LJ1AIAZSNEjMTlEKkxcJyf+S0VIS/7nhjozu+9wGNG2KQ/X
         OFpsl+lVZ3uB3HDae0lFCSupBBSIdDHR0AoZ3o+6MVqJslhxi8d6rqP8BV5raj4IvMEv
         GJBe2epUIe1RziqrKcj9oE5ZYRp/Z6lOz1yk4+pK0OVy2kkKOF6iGavZ86uWaIEg50zU
         mf+appsujmG2pmxLzk1si/92MVl1LJaNEwQ0UcjoIEEnBsMT3yq0jhXrUda0pijSsWaW
         fUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853035; x=1795457835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gdtJsINmNYNnzAIaY46IB+pxpQ6KX2atpqMRoNK0SJo=;
        b=g3fgMTNQ4esJnWralCW/gNbJ9ahPwOOs9joWMezuTc6tdChzjMBUnGY/EosOkX9OmW
         Qzz3pLNR0zdS0eMXdJFVL99kLCskXpzHkrDhMQ+6XLjIl8INmFMjVDvTqkdXO4EGSvwj
         vZwyvikRuH6CdcFer0hAXQcnkMt5gq7CkcrunWqmzwqXnrgGJS2oQJelLFgGxefkbKVH
         k3UD/4wjmU7eVEL/irlKmRdgY68WVaXlaDsBH4KiLxkc2VPs6/5OCjNc1rAXd4i+zc1o
         VJKl2rKDTX08hT46+EK2vCWrjz8sGZesMLFrKG+w7dzxBxUo8j1QDHKeUZ8s01YDW61T
         9pfA==
X-Forwarded-Encrypted: i=1; AL+hErHjeyeKC+ZmMN/VwP0+hyBwilecO1DLbF5BJIbdamg8VI31dN8bgUK9U7U41u30XQ7dqTu1@lists.linux.dev
X-Gm-Message-State: APuU4Z95STxVXFXWxi00hqDG2fF8VY3tVaCql3c3bcEzuPbKk221XcAq
	XkqC2h+a1WKEdUX6PPO4HLG03CU4RgKuGTZAnIb8Se5XUwLeBWdlCE848xVWtaASbA==
X-Gm-Gg: AZFdTZcj1DT09ESLpQ9n9TJwLDVyxupYGAMbKaIgCs1n+COd3bx/tHpfTKeoGdmJp0/
	xA3fQ+ilBWjVKyp8IEI1pgIDAT5pwuMsSn++AC1Nv0SPHwFo+0GjdtAucU77uNZ0LdBTIdcOiBN
	XA8m157pFaFABCI+JerttSAlEDYTGqSZh2F1a/pAuSZRAqSArDV+cOwGxGoQiw6a/4Wr51EnZp+
	9Btv9VI57PvicrJu9B9HKlDWtpPVZbp7yyDHo2CBRmPYxPoUh0lVrPfyH6g+c5UZJNT9m7n6Vwt
	54niCHolEixeSHAFjC0ESEpY6xwx2vDISraa03JJT5je1q/r4mCsbrAyi7uEkKAUe2YYHtG8+KB
	Hq8+jqHA/AOS4fc14bT8jRNEdQ7mNHA6cOLHEwGc7fKuB/IVWY/0KGqjtr1/1xAB2jv97kihMtF
	wATgjk+zNvnWixugK9apgbiKyl8iD2mjsPQnF+ynwyHeK+5HK+sDZ27EJ4rpOzZuLiYK70m5NQ3
	mc3v5sLw1y+1QeQTtaEkeauoFGnlnuYlrZlivifmc02jo9JxXtqBQ1gW1TCuDUco+jw/RbQB0yW
	jiBp+0XhRqexMiAcrkG365cg5o1Br3VQ6NDht07Q4DPMVgL+/8DOej9LGSyHrVbUtwGAIGn1XMK
	a0iGI8PR7QWYOac9b+R3biu308OevDVHRKWgbaPsiWsEqjJbBa7zxdwpuuh04r/rHkXsFQg3kWc
	9QgteicfZkDzJwUQf8D8S01xolyd1hI+5UUvvLPwmuzSkE/FrfFG8GTrI=
X-Received: by 2002:a17:90b:28cf:b0:3ac:8dfe:8ec9 with SMTP id 98e67ed59e1d1-3b1b0b47416mr9375279a91.47.1794853034181;
        Mon, 16 Nov 2026 10:17:14 -0800 (PST)
Received: from google.com ([2a00:79e0:2e87:6:9050:473d:cdf:7c63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac70ea45sm272890a91.17.2026.11.16.10.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:17:12 -0800 (PST)
Date: Mon, 16 Nov 2026 10:17:07 -0800
From: Nick Desaulniers <ndesaulniers@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH net v2] qca_spi: Avoid unsequenced accesses to jiffies in
 qcaspi_netdev_tx_timeout()
Message-ID: <avtIOfLOG3x0TRey@google.com>
References: <20261115-qca_spi-wunsequenced-v2-1-8cf32f12d546@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115-qca_spi-wunsequenced-v2-1-8cf32f12d546@kernel.org>

On Sun, Nov 15, 2026 at 09:45:22PM -0700, Nathan Chancellor wrote:
> After a recent improvement in clang to warn on unsequenced accesses to
> volatile variables [1], an instance appears in
> qcaspi_netdev_tx_timeout(), which can break the build with
> CONFIG_WERROR=y / W=e:
> 
>   drivers/net/ethernet/qualcomm/qca_spi.c:805:16: error: unsequenced accesses to volatile qualified 'jiffies' [-Werror,-Wunsequenced]
>     805 |                     jiffies, jiffies - dev_trans_start(dev));
>         |                     ~~~~~~~  ^
> 
> Per C11 5.1.2.3.2, accessing a volatile object is a side effect. Per C11
> 6.5.2, unsequenced side effects on the same scalar object are undefined
> behavior. Per C11 6.5.2.2.10/12, the evaluation of arguments in a
> function call is indeterminately sequenced, meaning any side effects in
> the arguments are unsequenced.
> 
> Printing jiffies on its own is not that useful for debugging transmit
> timeouts, so get rid of it to clear up the warning.
> 
> Cc: stable@vger.kernel.org
> Fixes: 291ab06ecf67 ("net: qualcomm: new Ethernet over SPI driver for QCA7000")
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2197

Just hit a handful of these last week; thanks for getting issues filed
per (I thought it was just one instance; having one issue per makes its
clearer this is flagging a few more cases. Thanks for sending fixes for
these, too).

> Link: https://github.com/llvm/llvm-project/commit/955715460eaf9188c241c74750637fc82dfcc423 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> Changes in v2:
> - Eliminate printing jiffies entirely rather than using a local variable
>   (Stefan)
> - Link to v1: https://patch.msgid.link/20261114-qca_spi-wunsequenced-v1-1-6b219b906db7@kernel.org
> ---
>  drivers/net/ethernet/qualcomm/qca_spi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/qualcomm/qca_spi.c b/drivers/net/ethernet/qualcomm/qca_spi.c
> index 38a779f4b866..249b4b549a12 100644
> --- a/drivers/net/ethernet/qualcomm/qca_spi.c
> +++ b/drivers/net/ethernet/qualcomm/qca_spi.c
> @@ -801,8 +801,8 @@ qcaspi_netdev_tx_timeout(struct net_device *dev, unsigned int txqueue)
>  {
>  	struct qcaspi *qca = netdev_priv(dev);
>  
> -	netdev_info(qca->net_dev, "Transmit timeout at %ld, latency %ld\n",
> -		    jiffies, jiffies - dev_trans_start(dev));
> +	netdev_info(qca->net_dev, "Transmit timeout, latency %ld\n",
> +		    jiffies - dev_trans_start(dev));
>  	qca->net_dev->stats.tx_errors++;
>  	/* Trigger tx queue flush and QCA7000 reset */
>  	set_bit(SPI_RESET, &qca->flags);
> 
> ---
> base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
> change-id: 20261114-qca_spi-wunsequenced-a81e54616844
> 
> Best regards,
> --  
> Cheers,
> Nathan
> 
