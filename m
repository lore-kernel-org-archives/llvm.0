Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2501D041B
	for <llvm@lists.linux.dev>; Thu, 21 Nov 2024 12:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732191142; cv=none; b=qcJXyRus53HI0TCIvUt7iyaO8QhR0+ZeLHntIrAtMgs0kFlmlXys/jRlOZUtLTA6/CXVHB+2v40v2Lq+90PP1F8oslrWTZ26/asUXbAIxLCrgrowETODn+scTLpQtAkw4nWeyC9gkxq/kcaaP/zHdXm5/W0bmy5jCJGpuMVId+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732191142; c=relaxed/simple;
	bh=6lZJfyn/kHRQnhS0J6EOOfgo9qdHUV3QfefJKYnl1tI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4Rcqbli7FGaR06wDgyArrYc2h0nCnci9KuxIcO1WGIlbR3COaBer1L21oPO4UvLvZioSeXiugIcfr3ly2Kwlxxl3PPJIOpZu3cmY7bVOGTlC7WTjkgNy4cr+b8irz8nyeOOJ5H3nLuTlvu33KmwG+0cdwH1u4xwX6rghbqwkPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvLaNXBy; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvLaNXBy"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cf9ef18ae9so3724391a12.1
        for <llvm@lists.linux.dev>; Thu, 21 Nov 2024 04:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732191138; x=1732795938; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+F8zuB1/KXMHxiBc/j3bHml8rN9MzuOmzg1mIDkrOEA=;
        b=TvLaNXByXcEwQlP9RPboMBN7b8ZUFSK9vNSv2kbjAzjIQ2kaE6EMQWlFTCKWa0c5pM
         hF2bdXfgccRtMQPKm+cCxHqhHBIMhLDBmH3A0yV9XkkdCc3kPyUAEqZdDjeveUb33VdE
         n+oVi6Cb+STDP1bbXAZxqVqHZFWL0ai0VqyUPQeLg7OcbLjPD5tXapMjFeEBBzVGegLG
         RcgKE1qHi696ALvaMoY03FQ4nxa1nzJ5UMLt+4bMa59dnLJ5+49ZKkAnj5IV6K/RFrWb
         ehHMJ+s59E8OpHrCyF08FtBDpXUepQunGJD3qm85Hrt+jPLJvF0/LmZF/62Nm8X6ITC3
         G5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732191138; x=1732795938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+F8zuB1/KXMHxiBc/j3bHml8rN9MzuOmzg1mIDkrOEA=;
        b=EErMNAYxHyVMqu/0bpx1SHi+GQH0Stv9vZA9/ul2JtxhquMmpc+QW0Ks6UVZpCdd5e
         VGCUuOnOGYTdZXlbPe6XnI9jedXsswfRNg9KZhQzoH+d/Sjb5MXuCB73zdwUu4FKD3Xs
         +MZ9YGshepKSzlEfCC25sAJI7mS2+u2kVoa4M3yePeS8Uba6mPS1Q8yAtsb4u4yzidci
         zQ8w0I6IQSIn0yKCPcpY/vD3bT8V3ZQWILFo5v8rgIV5+AmCvHjtlv1A8XH5Cz4cp0GV
         z4XEXxcVLaXGi4W28Bqw9OIq+2agSZUFBkc4uiUNQr+F3askpWDE4uc9JxEFNc08UNQD
         BaOA==
X-Forwarded-Encrypted: i=1; AJvYcCWHy8Wx9LhtzMe8n6jYeeiPgiWqcIq6PZRnYT9yq3GIc228oV5rvhzCZgwj9mYzZj7y+5ah@lists.linux.dev
X-Gm-Message-State: AOJu0YwuiuUQUa9v3Hk8Mslq/mncnxXGNFuxwvBds/lPAPXSZ6g4ADvr
	DTytLSBvSwkDwigSjuLF6LMd044eMfGrm+/99IeWfFUWH2IST61c
X-Google-Smtp-Source: AGHT+IFX25LpafsfOgQKeciNFXNPD4CoElchAGaqtiKyRCcLsdDbU7LqGaAnw4Ee0mmoYyfGgDFQFQ==
X-Received: by 2002:a17:907:3f02:b0:a99:6265:ed35 with SMTP id a640c23a62f3a-aa4efb8ccefmr324942466b.10.1732191138284;
        Thu, 21 Nov 2024 04:12:18 -0800 (PST)
Received: from [10.10.40.97] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa4f4181818sm73858866b.82.2024.11.21.04.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 04:12:17 -0800 (PST)
Message-ID: <a3bd83fb-589e-4814-9595-8f6343ecda83@gmail.com>
Date: Thu, 21 Nov 2024 13:12:15 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: light: Add APDS9160 ALS & Proximity sensor
 driver
To: mgonellabolduc@dimonoff.com, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Mikael Gonella-Bolduc <m.gonella.bolduc@gmail.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
References: <20241119-apds9160-driver-v1-0-fa00675b4ea4@dimonoff.com>
 <20241119-apds9160-driver-v1-2-fa00675b4ea4@dimonoff.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20241119-apds9160-driver-v1-2-fa00675b4ea4@dimonoff.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mikael,

a few comments inline to add to what Krzysztof pointed out.

On 19/11/2024 21:36, Mikael Gonella-Bolduc via B4 Relay wrote:
> From: Mikael Gonella-Bolduc <mgonellabolduc@dimonoff.com>
> 
> APDS9160 is a combination of ALS and proximity sensors.
> 
> This patch add supports for:
>     - Intensity clear data and illuminance data
>     - Proximity data
>     - Gain control, rate control
>     - Event thresholds
> 
> Signed-off-by: Mikael Gonella-Bolduc <mgonellabolduc@dimonoff.com>
> ---
>  MAINTAINERS                  |    7 +
>  drivers/iio/light/Kconfig    |   13 +
>  drivers/iio/light/Makefile   |    1 +
>  drivers/iio/light/apds9160.c | 1420 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1441 insertions(+)
> 

...

> +config APDS9160
> +	tristate "APDS9160 combined als and proximity sensors"
> +	select REGMAP_I2C
> +	select IIO_BUFFER
> +	select IIO_KFIFO_BUF
> +	depends on I2C
> +	help
> +	   Say Y here if you want to build a driver for Broadcom APDS9160
> +	   combined ambient light and proximity sensor chip.
> +

You can drop that "If unsure, say N here." as it is not common for such
drivers in IIO. There are a couple of entries in the whole subsystem
(not in this Kconfig, though) with this sentence, and some of them could
be dropped too.

> +	   To compile this driver as a module, choose M here: the
> +	   module will be called apds9160. If unsure, say N here.
> +
>  config APDS9300
>  	tristate "APDS9300 ambient light sensor"
>  	depends on I2C

...


> +
> +static int apds9160_write_raw(struct iio_dev *indio_dev,
> +			      struct iio_chan_spec const *chan, int val,
> +			      int val2, long mask)
> +{
> +	struct apds9160_chip *data = iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_INT_TIME:
> +		if (val2 != 0)
> +			return -EINVAL;
> +		switch (chan->type) {
> +		case IIO_INTENSITY:
> +			return apds9160_set_als_int_time(data, val);
> +		default:
> +			return -EINVAL;
> +		}
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		if (val2 != 0)
> +			return -EINVAL;
> +		switch (chan->type) {
> +		case IIO_PROXIMITY:
> +			return apds9160_set_ps_rate(data, val);
> +		default:
> +			return -EINVAL;
> +		}
> +	case IIO_CHAN_INFO_HARDWAREGAIN:
> +		if (val2 != 0)
> +			return -EINVAL;
> +		switch (chan->type) {
> +		case IIO_INTENSITY:
> +			return apds9160_set_als_gain(data, val);
> +		case IIO_PROXIMITY:
> +			return apds9160_set_ps_gain(data, val);
> +		default:
> +			return -EINVAL;
> +		}
> +	case IIO_CHAN_INFO_CALIBSCALE:
> +		if (val2 != 0)
> +			return -EINVAL;
> +		switch (chan->type) {
> +		case IIO_PROXIMITY:
> +			return apds9160_set_ps_cancellation_level(data, val);
> +		default:
> +			return -EINVAL;
> +		}
> +	case IIO_CHAN_INFO_CALIBBIAS:
> +		if (val2 != 0)
> +			return -EINVAL;
> +		switch (chan->type) {
> +		case IIO_PROXIMITY:
> +			return apds9160_set_ps_analog_cancellation(data, val);
> +		default:
> +			return -EINVAL;
> +		}
> +	case IIO_CHAN_INFO_RAW:
> +		if (val2 != 0)
> +			return -EINVAL;
> +		switch (chan->type) {
> +		case IIO_CURRENT:
> +			return apds9160_set_ps_current(data, val);
> +		default:
> +			return -EINVAL;
> +		}
> +	default:
> +		return -EINVAL;
> +	}
> +

If you only have a switch with a return in every path, this return 0
can't be reached.

> +	return 0;
> +}
> +
> +static inline int apds9160_get_thres_reg(const struct iio_chan_spec *chan,
> +					 enum iio_event_direction dir, u8 *reg)
> +{
> +	switch (dir) {
> +	case IIO_EV_DIR_RISING:
> +		switch (chan->type) {
> +		case IIO_PROXIMITY:
> +			*reg = APDS9160_REG_PS_THRES_HI_LSB;
> +			break;
> +		case IIO_INTENSITY:
> +			*reg = APDS9160_REG_LS_THRES_UP_LSB;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		break;
> +	case IIO_EV_DIR_FALLING:
> +		switch (chan->type) {
> +		case IIO_PROXIMITY:
> +			*reg = APDS9160_REG_PS_THRES_LO_LSB;
> +			break;
> +		case IIO_INTENSITY:
> +			*reg = APDS9160_REG_LS_THRES_LO_LSB;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int apds9160_read_event(struct iio_dev *indio_dev,
> +			       const struct iio_chan_spec *chan,
> +			       enum iio_event_type type,
> +			       enum iio_event_direction dir,
> +			       enum iio_event_info info, int *val, int *val2)
> +{
> +	u8 reg;
> +
> +	int ret = 0;
> +	struct apds9160_chip *data = iio_priv(indio_dev);
> +
> +	if (info != IIO_EV_INFO_VALUE)
> +		return -EINVAL;
> +
> +	ret = apds9160_get_thres_reg(chan, dir, &reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (chan->type == IIO_PROXIMITY) {
> +		__le16 buf;
> +
> +		ret = regmap_bulk_read(data->regmap, reg, &buf, 2);
> +		if (ret < 0)
> +			return ret;
> +		*val = le16_to_cpu(buf);
> +	} else if (chan->type == IIO_INTENSITY) {
> +		__le32 buf = 0;
> +
> +		ret = regmap_bulk_read(data->regmap, reg, &buf, 3);
> +		if (ret < 0)
> +			return ret;
> +		*val = le32_to_cpu(buf);

Missing braces for that else (use them in all arms if you need them in one).

> +	} else
> +		return -EINVAL;
> +
> +	*val2 = 0;
> +
> +	return IIO_VAL_INT;
> +}
> +
> +static int apds9160_write_event(struct iio_dev *indio_dev,
> +				const struct iio_chan_spec *chan,
> +				enum iio_event_type type,
> +				enum iio_event_direction dir,
> +				enum iio_event_info info, int val, int val2)
> +{
> +	u8 reg;
> +	int ret = 0;
> +	struct apds9160_chip *data = iio_priv(indio_dev);
> +
> +	if (info != IIO_EV_INFO_VALUE)
> +		return -EINVAL;
> +
> +	ret = apds9160_get_thres_reg(chan, dir, &reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (chan->type == IIO_PROXIMITY) {
> +		if (val < 0 || val > APDS9160_PS_THRES_MAX)
> +			return -EINVAL;
> +		__le16 buf;
> +
> +		buf = cpu_to_le16(val);
> +		ret = regmap_bulk_write(data->regmap, reg, &buf, 2);
> +		if (ret < 0)
> +			return ret;
> +	} else if (chan->type == IIO_INTENSITY) {
> +		if (val < 0 || val > APDS9160_LS_THRES_MAX)
> +			return -EINVAL;
> +		__le32 buf = 0;
> +
> +		buf = cpu_to_le32(val);
> +		ret = regmap_bulk_write(data->regmap, reg, &buf, 3);
> +		if (ret < 0)
> +		

Same here.

	return ret;
> +	} else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int apds9160_read_event_config(struct iio_dev *indio_dev,
> +				      const struct iio_chan_spec *chan,
> +				      enum iio_event_type type,
> +				      enum iio_event_direction dir)
> +{
> +	struct apds9160_chip *data = iio_priv(indio_dev);
> +
> +	switch (chan->type) {
> +	case IIO_PROXIMITY:
> +		return data->ps_int;
> +	case IIO_INTENSITY:
> +		return data->als_int;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +

The 'state' argument is now a bool. To avoid issues, please rebase to
newer branches like linux-next, iio/testing iio/togreg. Otherwise it
will not compile with that modification. data->ps_int should then become
a bool too.

> +static int apds9160_write_event_config(struct iio_dev *indio_dev,
> +				       const struct iio_chan_spec *chan,
> +				       enum iio_event_type type,
> +				       enum iio_event_direction dir, int state)
> +{
> +	struct apds9160_chip *data = iio_priv(indio_dev);
> +	int ret;
> +
> +	state = !!state;
> +
> +	switch (chan->type) {
> +	case IIO_PROXIMITY:
> +		if (data->ps_int == state)
> +			return -EINVAL;
> +
> +		ret = regmap_field_write(data->reg_int_ps, state);
> +		if (ret)
> +			return ret;
> +		data->ps_int = state;
> +		break;
> +	case IIO_INTENSITY:
> +		if (data->als_int == state)
> +			return -EINVAL;
> +
> +		ret = regmap_field_write(data->reg_int_als, state);
> +		if (ret)
> +			return ret;
> +		data->als_int = state;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}


Best regards,
Javier Carrasco
