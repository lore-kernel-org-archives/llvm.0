Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109220;
	b=m9Pb6ow8TapgknH7j7Y0H6TSK5SCTuRDZocyfxgpsN8edABHuzRACf0+ON5vm+plAr2Y
	 xXP/i6wvKLgOqP7U2GQq31Gpw1CSg7/UqS7Qa56sWRkY98ufCLXcHy7hdZdPyCcsIyMkV
	 UDGdjZfVdRS1zfuchFfIU74WTZGOSLZcv6Nt3s0CD9g/aCyKrWm57WBkaW5cu71j8RCRj
	 FEVmqsXTmKe17AwO4030I6ONxseTWPS97DtDoeK2Lp82mS1pRHgULRW8W4AwmUI3dYFxp
	 osYrDplPeEMS5zdgYSPGY3oIBg6UEUqrBL8gkZhDSyuVsE0+Wrq6yMMqq6JYJl0vWkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109220;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=b161FkFDAsvC3jLoVNbOzXrl68eIJRUz4QoBplXQxk4=;
	b=sdwblFex9sA0YYe4ZUnv8FqXXU/eXkqlNPmwlxHaZhAQcw4+xBI3dGZVQjC1jKIN0gQg
	 OP+BvduNk03TktvzZ9oq4IvTReLKEdMsE04e1QlWK10LokXSnNOfY12q2W6xTlHHtdbNm
	 zxHEcczJe59cE/rgAm3c3MnIORwpiqK7A/CD3zPehl5g1QXTZ6llhjwjpcvxGGhnITKLF
	 S5/IJFbiVMahMyZxjRrEHrEK7oMTanQTrAy/sVLXiaPTFcVbQ7TMUHmeVSghKx2IH+xEL
	 oh+hbc6b8gUMAvjF5sQ5cgJs0HflTXATTjQBpakY7m68DOaSUi7ucWZ3FGNqfespMfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yJX3ZqxI;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E8E606A326
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7E8E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=yJX3ZqxI
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2BDBB4E4166B;
	Thu, 19 Nov 2026 17:26:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E43526035B;
	Thu, 19 Nov 2026 17:26:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4350411BC0C8D;
	Thu, 19 Nov 2026 18:26:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795109213; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=b161FkFDAsvC3jLoVNbOzXrl68eIJRUz4QoBplXQxk4=;
	b=yJX3ZqxIhcynpdAQbXlLlxaOXqSO382sx/sCL/eq8nZVnWspuXBkUexQO4SJFbD6qvS+/L
	B1BzqyEvReve55MWDIi+O73Cu84NnPpwjXK5m3ndBRj7OAgSXhgNbzFVe5FW8RQx52bX5m
	OX2LqMC8kg+ZWfHXVDCvZaIjKMZqYa1aaVMJUhU1gC8IozHiarfxPK9BLGUcFQLRWjn27P
	698Ua4lbIC55S7fNuiGyWkTylUuh0hvEujPegOPzcRLMnpto9PdjKx+1+2CLADPedloe/n
	to7KeLr9QlS+Wh89octwOv6xzqCZhUOdR0dEkmWfweVwIvJOdOedqLhiPTfntg==
Message-ID: <f712f16f-dd35-4afc-81db-4e93232846aa@bootlin.com>
Date: Thu, 19 Nov 2026 18:26:48 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH net] net: pse-pd: pd692x0: Return fw_upload_err codes from
 firmware upload ops
To: Ian Rogers <irogers@google.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>
References: <20261119171014.1534691-1-irogers@google.com>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261119171014.1534691-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/19/26 18:10, Ian Rogers wrote:
> pd692x0_fw_reset() and pd692x0_fw_write() return negative errno values
> from i2c_master_send() directly as enum fw_upload_err instead of
> FW_UPLOAD_ERR_RW_ERROR, and pd692x0_fw_recv_resp() ignores negative
> errors from its trailing i2c_master_recv(). When a negative errno is
> propagated to the firmware upload core, fw_upload_error() rejects it
> as >= FW_UPLOAD_ERR_MAX, logs an invalid error code message, and
> reports "unknown-error" instead of "read-write-error" via sysfs.
> 
> Return FW_UPLOAD_ERR_RW_ERROR on I2C transfer failures and use
> enum fw_upload_err consistently across the PD692x0 firmware upload
> helpers.

Please write a readable commit message with human hands.

> Found via Clang -Wimplicit-int-enum-cast on an x86_64 allyesconfig
> build. Verified by building drivers/net/pse-pd/pd692x0.o with LLVM=1
> W=1 (-Werror) and -Wimplicit-int-enum-cast, and with a standalone C
> reproducer; not runtime-tested on PD692x0 hardware.
> 
> Fixes: 9a9938451890 ("net: pse-pd: Add PD692x0 PSE controller driver")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   drivers/net/pse-pd/pd692x0.c | 81 ++++++++++++++++++------------------
>   1 file changed, 40 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/net/pse-pd/pd692x0.c b/drivers/net/pse-pd/pd692x0.c
> index 7958f5741463..94a857eaa3de 100644
> --- a/drivers/net/pse-pd/pd692x0.c
> +++ b/drivers/net/pse-pd/pd692x0.c
> @@ -1455,6 +1455,8 @@ pd692x0_fw_recv_resp(const struct i2c_client *client, unsigned long ms_timeout,
>   
>   	/* Read remaining characters */
>   	ret = i2c_master_recv(client, fw_msg_buf + 1, msg_size - 1);
> +	if (ret < 0)
> +		return FW_UPLOAD_ERR_RW_ERROR;
>   	if (strncmp(fw_msg_buf, msg_ok, msg_size)) {

The error will be catch anyway by the string comparison. If you want to 
add a check on ret then add another error message.
This is not a fix.

>   		dev_err(&client->dev,
>   			"Wrong FW download process answer (%*pE)\n",
> @@ -1465,9 +1467,10 @@ pd692x0_fw_recv_resp(const struct i2c_client *client, unsigned long ms_timeout,
>   	return FW_UPLOAD_ERR_NONE;
>   }
>   
> -static int pd692x0_fw_write_line(const struct i2c_client *client,
> -				 const char line[PD692X0_FW_LINE_MAX_SZ],
> -				 const bool last_line)
> +static enum fw_upload_err
> +pd692x0_fw_write_line(const struct i2c_client *client,
> +		      const char line[PD692X0_FW_LINE_MAX_SZ],
> +		      const bool last_line)
>   {
>   	int ret;
>   
> @@ -1478,19 +1481,12 @@ static int pd692x0_fw_write_line(const struct i2c_client *client,
>   		line++;
>   	}
>   
> -	if (last_line) {
> -		ret = pd692x0_fw_recv_resp(client, 100, "TP\r\n",
> -					   sizeof("TP\r\n") - 1);
> -		if (ret)
> -			return ret;
> -	} else {
> -		ret = pd692x0_fw_recv_resp(client, 100, "T*\r\n",
> -					   sizeof("T*\r\n") - 1);
> -		if (ret)
> -			return ret;
> -	}
> +	if (last_line)
> +		return pd692x0_fw_recv_resp(client, 100, "TP\r\n",
> +					    sizeof("TP\r\n") - 1);
>   
> -	return FW_UPLOAD_ERR_NONE;
> +	return pd692x0_fw_recv_resp(client, 100, "T*\r\n",
> +				    sizeof("T*\r\n") - 1);

This is not a fix, just moving code around.

For the rest, FW_UPLOAD_ERR_NONE is similar to ret = 0 so there is no 
real issue, only some type mismatch and I am not sure these changes 
should land as a fix.

Regards
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

