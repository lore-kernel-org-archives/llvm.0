Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1AA320CD3
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771496864; cv=none; b=ffa1yxqFpjZIRsqSuABlm9f5b3ydqZP/Qi3MXKBhvRbBZaW6FlCbUhjLff99BrJ2iWIEZ7Jnt94v1eYFWaNREU6GmXtFjcx5AHGAuA2vPdYcM3weJSEaSJJwCqcfUQ58OwR83Xf8OqNYfwERyY6SdhAPa/kTS5RaOP743+8ztpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771496864; c=relaxed/simple;
	bh=ee5d/mCDomKopEZqYC6zk/SC4+1mGi1VGHehStvSk1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gpms8PP0FT+eJJC5q2YDwKIhhhsiPu0K31zPF1F9vzPd+97aDGTt7xRRCX2nzr41Hr6LrL/S2VqYz/51hM1VHVrtV2/Sbh22pLhqkCnuIwOWKj9J6puNx89ve+2552MVYWdXO/1exeUzZa+WEpCAcPF1/v+AwGln95C1juhWlN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y196Xls1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y196Xls1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43622089851so708926f8f.3
        for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 02:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771496861; x=1772101661; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HNZVSXjVxH1eQkOT7lQSAOIyjM/HYvFDSZC+egPazHI=;
        b=y196Xls1+cw5fzDlPbm6aYMqR/dHYx9IUGPCEj4UQgvq40aOIggtdPSIezM5fmErfM
         gwqU+41BAW/ImrvuXMV+2zHfcDni+jYTx0241xzKter14Er385y60hfdyVj3nWklrEYh
         3i/0Zjy4xIWdSt9pycj3+YA5vf/s5hgCcgwFHISSXhegFEAMuZse75sq5hCmBnnRlUzh
         Qz5o9wYpijg4XdTZq/aSBvsX3a/ey84mOCOnBncWgroW3tg4PXUtQTTHCZDOdwqc+ABI
         HaySE0P4M3XiM8s6lCwRlOmNFnOrajKfMes/MDCaeg7cU6D9zNtT11gW7XvDc+hjlOHJ
         dz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771496861; x=1772101661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNZVSXjVxH1eQkOT7lQSAOIyjM/HYvFDSZC+egPazHI=;
        b=XZ/9/piCdfxPyv2YILDevCBtvSb6yKq9vXf9hT+KqE1vocNNA23iImH9ZoK6mr8a0z
         zP5IYIfvVav3qJ8j45WmwluSbIfzQAOZTj4VLblJ1WrZ5g/QBCy30NNTANhqts2zQnvJ
         rx79HabcAd/yF8XH22dd34az9ccLRSqPiaQDbC2Bc8m5UyZI70yqVchYMNJPFL2N6AnA
         9wbGDDpLEu6jGL/yhGHeAVVFyTiJEnmXDwjxoZxyeL9AxElP3HIiu0WQQiIDpfTZxwcz
         R3ZHk8wVwnmIN5qCEkSfT8OmFER7cOUqNWKrPEojItUikiMgj3ZDCCQ43EaJFzCfXF+p
         3kRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8+bVcMNxeFuZTIX1+5f0tDg3aa5OnHSkOWWB0VE7s0n8F46AGQRX0zkPezM0/TwAIFJjT@lists.linux.dev
X-Gm-Message-State: AOJu0YzMh91K8ky8BtJ1xYQFwHheTeZ+c744B9IWejNF1gchByhJsKVd
	38B0O0f5/lVcq8Dwm18XMt1rE7QiVGO47fAbQAbdz75PNBNjBXVm3hXAO6yw5Ucyoas=
X-Gm-Gg: AZuq6aJqVA95qsI5jyq5rDNKJ86knocqNBjxOnxesVWxARG3qLxFoQaeguW05yHFkfX
	Jod439x8kdX5AvBNV7STaZDT25PiGkSRlQl7R5DnkcxsIXAFHYIxfrRKK2oe+ASdA1610OfY1VU
	kvR9Tfrhj2MJLpHRRlP3nn4rH47lAkDQZFI88I5RUbe28iGlRYO0Gr4SjhAKftTqO0dwXAxrDeM
	VR44Hpfjr8tcIdwkNqeaz51TZB4Y9GEE8iyK9PRfzv3LgXMzemXlj3aT7IlXmUDxg/tSpv/Kwty
	JNE3TLblXhRrJDbnephmn8o/jHPXfQH0r7khp0CoyvbJ4OiiAgiKfmLGATbZPVYnHH783RIZeI6
	vpAqVysSTQrkk8kzucdb0NnlSi1ltr4DHy9ACDPfxPmoivXqT7H24wF11veq9c2690eweQPKVgN
	2ILCeJzoJxCrVvbqZcSnV8dZYwt84kOMo3
X-Received: by 2002:a5d:5d82:0:b0:436:da9:4371 with SMTP id ffacd0b85a97d-43958df1144mr9512620f8f.5.1771496860699;
        Thu, 19 Feb 2026 02:27:40 -0800 (PST)
Received: from [10.11.12.108] ([79.115.63.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abc8b1sm50341008f8f.23.2026.02.19.02.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 02:27:40 -0800 (PST)
Message-ID: <c9d056fb-b2ae-4631-a2b5-f55f214adecb@linaro.org>
Date: Thu, 19 Feb 2026 12:27:39 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/3] firmware: exynos-acpm: Count number of commands
 in acpm_xfer
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260214-firmare-acpm-counted-v1-0-32af5735470e@oss.qualcomm.com>
 <20260214-firmare-acpm-counted-v1-2-32af5735470e@oss.qualcomm.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260214-firmare-acpm-counted-v1-2-32af5735470e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/14/26 2:39 PM, Krzysztof Kozlowski wrote:
> Struct acpm_xfer holds two buffers with u32 commands - rxd and txd - and
> counts their size by rxlen and txlen.  "len" suffix is here ambiguous,
> so could mean length of the buffer or length of commands, and these are
> not the same since each command is u32.  Rename these to rxcnt and
> txcnt, and change their usage to count the number of commands in each
> buffer.
> 
> This will have a benafit of allowing to use __counted_by_ptr later.

                    ^typo, benefit.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/firmware/samsung/exynos-acpm-dvfs.c |  8 ++++----
>  drivers/firmware/samsung/exynos-acpm-pmic.c | 14 +++++++-------
>  drivers/firmware/samsung/exynos-acpm.c      | 12 +++++++-----
>  drivers/firmware/samsung/exynos-acpm.h      |  4 ++--
>  4 files changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm-dvfs.c b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> index 1c5b2b143bcc..55ec6ad9d87e 100644
> --- a/drivers/firmware/samsung/exynos-acpm-dvfs.c
> +++ b/drivers/firmware/samsung/exynos-acpm-dvfs.c
> @@ -25,11 +25,11 @@ static void acpm_dvfs_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
>  {
>  	xfer->acpm_chan_id = acpm_chan_id;
>  	xfer->txd = cmd;
> -	xfer->txlen = cmdlen;
> +	xfer->txcnt = cmdlen;
>  
>  	if (response) {
>  		xfer->rxd = cmd;
> -		xfer->rxlen = cmdlen;
> +		xfer->rxcnt = cmdlen;
>  	}
>  }
>  
> @@ -50,7 +50,7 @@ int acpm_dvfs_set_rate(const struct acpm_handle *handle,
>  	u32 cmd[4];
>  
>  	acpm_dvfs_init_set_rate_cmd(cmd, clk_id, rate);
> -	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, false);
> +	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, false);
>  
>  	return acpm_do_xfer(handle, &xfer);
>  }
> @@ -70,7 +70,7 @@ unsigned long acpm_dvfs_get_rate(const struct acpm_handle *handle,
>  	int ret;
>  
>  	acpm_dvfs_init_get_rate_cmd(cmd, clk_id);
> -	acpm_dvfs_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id, true);
> +	acpm_dvfs_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id, true);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> diff --git a/drivers/firmware/samsung/exynos-acpm-pmic.c b/drivers/firmware/samsung/exynos-acpm-pmic.c
> index 44265db34ae6..26a9024d8ed8 100644
> --- a/drivers/firmware/samsung/exynos-acpm-pmic.c
> +++ b/drivers/firmware/samsung/exynos-acpm-pmic.c
> @@ -63,8 +63,8 @@ static void acpm_pmic_set_xfer(struct acpm_xfer *xfer, u32 *cmd, size_t cmdlen,
>  {
>  	xfer->txd = cmd;
>  	xfer->rxd = cmd;
> -	xfer->txlen = cmdlen;
> -	xfer->rxlen = cmdlen;
> +	xfer->txcnt = cmdlen;
> +	xfer->rxcnt = cmdlen;
>  	xfer->acpm_chan_id = acpm_chan_id;
>  }
>  
> @@ -86,7 +86,7 @@ int acpm_pmic_read_reg(const struct acpm_handle *handle,
>  	int ret;
>  
>  	acpm_pmic_init_read_cmd(cmd, type, reg, chan);
> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> @@ -119,7 +119,7 @@ int acpm_pmic_bulk_read(const struct acpm_handle *handle,
>  		return -EINVAL;
>  
>  	acpm_pmic_init_bulk_read_cmd(cmd, type, reg, chan, count);
> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> @@ -159,7 +159,7 @@ int acpm_pmic_write_reg(const struct acpm_handle *handle,
>  	int ret;
>  
>  	acpm_pmic_init_write_cmd(cmd, type, reg, chan, value);
> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> @@ -199,7 +199,7 @@ int acpm_pmic_bulk_write(const struct acpm_handle *handle,
>  		return -EINVAL;
>  
>  	acpm_pmic_init_bulk_write_cmd(cmd, type, reg, chan, count, buf);
> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> @@ -229,7 +229,7 @@ int acpm_pmic_update_reg(const struct acpm_handle *handle,
>  	int ret;
>  
>  	acpm_pmic_init_update_cmd(cmd, type, reg, chan, value, mask);
> -	acpm_pmic_set_xfer(&xfer, cmd, sizeof(cmd), acpm_chan_id);
> +	acpm_pmic_set_xfer(&xfer, cmd, ARRAY_SIZE(cmd), acpm_chan_id);
>  
>  	ret = acpm_do_xfer(handle, &xfer);
>  	if (ret)
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 0cb269c70460..242745e8394c 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -205,7 +205,7 @@ static void acpm_get_saved_rx(struct acpm_chan *achan,
>  	rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, rx_data->cmd[0]);
>  
>  	if (rx_seqnum == tx_seqnum) {
> -		memcpy(xfer->rxd, rx_data->cmd, xfer->rxlen);
> +		memcpy(xfer->rxd, rx_data->cmd, xfer->rxcnt * sizeof(*xfer->rxd));
>  		clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
>  	}
>  }
> @@ -259,7 +259,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
>  		if (rx_data->response) {
>  			if (rx_seqnum == tx_seqnum) {
>  				__ioread32_copy(xfer->rxd, addr,
> -						xfer->rxlen / 4);
> +						xfer->rxcnt);

now __ioread32_copy fits on a single line, without bypassing 80 chars

>  				rx_set = true;
>  				clear_bit(seqnum, achan->bitmap_seqnum);
>  			} else {
> @@ -270,7 +270,7 @@ static int acpm_get_rx(struct acpm_chan *achan, const struct acpm_xfer *xfer)
>  				 * after the response is copied to the request.
>  				 */
>  				__ioread32_copy(rx_data->cmd, addr,
> -						xfer->rxlen / 4);
> +						xfer->rxcnt);
>  			}
>  		} else {
>  			clear_bit(seqnum, achan->bitmap_seqnum);
> @@ -425,7 +425,9 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
>  
>  	achan = &acpm->chans[xfer->acpm_chan_id];
>  
> -	if (!xfer->txd || xfer->txlen > achan->mlen || xfer->rxlen > achan->mlen)
> +	if (!xfer->txd || (xfer->txcnt * sizeof(*xfer->txd) > achan->mlen))
> +		return -EINVAL;
> +	if (xfer->rxcnt * sizeof(*xfer->rxd) > achan->mlen)
>  		return -EINVAL;

how about:
        if (!xfer->txd ||
            (xfer->txcnt * sizeof(*xfer->txd) > achan->mlen) ||
            (xfer->rxcnt * sizeof(*xfer->rxd) > achan->mlen))
                return -EINVAL;

>  
>  	if (!achan->poll_completion) {
> @@ -448,7 +450,7 @@ int acpm_do_xfer(const struct acpm_handle *handle, const struct acpm_xfer *xfer)
>  
>  		/* Write TX command. */
>  		__iowrite32_copy(achan->tx.base + achan->mlen * tx_front,
> -				 xfer->txd, xfer->txlen / 4);
> +				 xfer->txd, xfer->txcnt);
>  
>  		/* Advance TX front. */
>  		writel(idx, achan->tx.front);
> diff --git a/drivers/firmware/samsung/exynos-acpm.h b/drivers/firmware/samsung/exynos-acpm.h
> index 2d14cb58f98c..422fbcac7284 100644
> --- a/drivers/firmware/samsung/exynos-acpm.h
> +++ b/drivers/firmware/samsung/exynos-acpm.h
> @@ -10,8 +10,8 @@
>  struct acpm_xfer {
>  	const u32 *txd;
>  	u32 *rxd;
> -	size_t txlen;
> -	size_t rxlen;
> +	size_t txcnt;
> +	size_t rxcnt;
>  	unsigned int acpm_chan_id;
>  };
>  
> 

