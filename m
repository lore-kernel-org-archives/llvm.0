Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC4F3DEFFB
	for <llvm@lists.linux.dev>; Tue, 25 Aug 2026 09:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648781; cv=none; b=gzNh8DnjPXAKhY5AmBrXPkAcxrkAxv0TwAH6gsqSKeSn28nOH/2JvHTj4JXzwfChEEF8XCPowFW8VW+q2fwSrEy5v8Q2SnkDdqdlqc+tO0k6yWiy4cc5Ay3IGOCVYqUsq0yGOWWmT3Zs+Ja6j6aq3n1K47NvwJ81tH881GX0hxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648781; c=relaxed/simple;
	bh=Lvv7/z9o2Wm59EYbTrsQPugocMRVt//3Pg6FiGvjUAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdRXAdjU//F8+oG+Pa5kPlmzD2oQzOhQiZqy1TLFDc0v0XKPntQex7Xk/+LGzTFHeixUn+ErYtCca5gb9XikrDfV/o1vOk/ZD4yZJXQekRFinsSruIGUZEQ4H/EewtV+pmeREU12a2FneQsVYOyx8xHss5rtY7FmEs0RvHk/9tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8M6v1oW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8M6v1oW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787648780; x=1819184780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lvv7/z9o2Wm59EYbTrsQPugocMRVt//3Pg6FiGvjUAc=;
  b=U8M6v1oWeM5dR2C/Y2ePnt7APmCs1CFFZEqcX4doDPOtjHyOmUGDbACP
   6mx7ZTABdHqzUCN0L3NyNOoVka2KPsJwN26m4QYjn73dhtRQoU2QcxDzU
   /QxGzKCFBnpOarDNZwe3eUTiMJo3q6bISQQeJPQJojYm5caFWiyKt9LAC
   dTXcaRqCOvkHe4sxDQo7zP5a4r0eI5Y0F3OyT5ixNyUilo7kkNwHa+OBe
   Qp9iEQiOdDL9zgV0IOjV1wxiwUVWib5eE+NoYgbVaBKszg9uaU6KmgHQY
   JOjHkUXoGBQPQqowHpTsS4yxl7IgCufUjyCZk9o76YIS+AUDah/EYXkWI
   g==;
X-CSE-ConnectionGUID: IiZTzi2WSj6dvySqNlNAYA==
X-CSE-MsgGUID: WYO7sMQUTEyS0ixWf52G4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88128270"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="88128270"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 02:06:18 -0700
X-CSE-ConnectionGUID: n774xPITSzCcB3CSFHJxkw==
X-CSE-MsgGUID: FNIQKLxaRzeN031b9xV7ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="263495206"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.59])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 02:06:14 -0700
Date: Tue, 25 Aug 2026 12:06:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 4/6] iio: pressure: dps310: add triggered buffer
 support
Message-ID: <ao1bBFkLXIIgNl49@ashevche-desk.local>
References: <20260824201203.396651-1-zoone.rupert@gmail.com>
 <20260824201203.396651-5-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824201203.396651-5-zoone.rupert@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 24, 2026 at 11:12:01PM +0300, Rupesh Majhi wrote:
> Add a triggered buffer in order to capture continuously on both channels
> instead of one sysfs read at a time.
> 
> Raw register value is not useful on its own, pressure has to go through
> the compensation polynomial and needs a temperature reading. Report raw
> in Pa with 1/1000 scale to keep full resolution in the buffer without
> changing what the existing processed attribute reports.
> 
> Raw and processed reads return -EBUSY while buffer is on, so does any
> reconfiguration.

...

> +struct dps310_scan {
> +	s32 channels[2];
> +	aligned_s64 ts;
> +};

Wondering if using macro here would make sense...

...

>  static const struct iio_chan_spec dps310_channels[] = {
>  	{
>  		.type = IIO_TEMP,
>  		.info_mask_separate = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) |
>  			BIT(IIO_CHAN_INFO_SAMP_FREQ) |
>  			BIT(IIO_CHAN_INFO_PROCESSED),
> +		.scan_index = DPS310_SCAN_TEMP,
> +		.scan_type = {
> +			.sign = 's',
> +			.realbits = 32,
> +			.storagebits = 32,
> +			.endianness = IIO_CPU,
> +		},
>  	},
>  	{
>  		.type = IIO_PRESSURE,
> +		/*
> +		 * Pressure is only meaningful once the raw register value has
> +		 * been run through the compensation polynomial in section 4.9.1
> +		 * of the datasheet, which needs a temperature reading as well.
> +		 * So what is reported as _raw here is already compensated, in
> +		 * Pa, and _scale converts it to the kPa the ABI asks for. The
> +		 * _processed attribute reports the same value and predates
> +		 * buffer support, so it has to stay.
> +		 *
> +		 * Do not copy this pattern into other drivers. A raw attribute
> +		 * that is not the raw register value is only tolerable here
> +		 * because the alternative is either losing resolution in the
> +		 * buffer or breaking existing users of _processed.
> +		 */
>  		.info_mask_separate = BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO) |
>  			BIT(IIO_CHAN_INFO_SAMP_FREQ) |

> -			BIT(IIO_CHAN_INFO_PROCESSED),
> +			BIT(IIO_CHAN_INFO_PROCESSED) |

Leave it untouched, squeeze the new ones above this.

> +			BIT(IIO_CHAN_INFO_RAW) |
> +			BIT(IIO_CHAN_INFO_SCALE),
> +		.scan_index = DPS310_SCAN_PRESSURE,
> +		.scan_type = {
> +			.sign = 's',
> +			.realbits = 32,
> +			.storagebits = 32,
> +			.endianness = IIO_CPU,
> +		},
>  	},
> +	IIO_CHAN_SOFT_TIMESTAMP(2),
>  };

...

> static int dps310_read_pressure(struct dps310_data *data, int *val, int *val2,

>  		*val2 = 1000; /* Convert Pa to KPa per IIO ABI */

Side note, at some point makes sense to move from 1000 to KILO.

>  		return IIO_VAL_FRACTIONAL;
>  
> +	case IIO_CHAN_INFO_SCALE:
> +		/* The raw value is in Pa, the ABI wants kPa */
> +		*val = 1;
> +		*val2 = 1000;

Ditto.

> +		return IIO_VAL_FRACTIONAL;

...

> +static int dps310_fill_scan(struct dps310_data *data,
> +			    const unsigned long *scan_mask,
> +			    struct dps310_scan *scan)
> +	__must_hold(&data->lock)
> +{
> +	int rc;

> +	int i = 0;

Why is 'i' signed? Also, move assignment closer to its first user.

> +	/*
> +	 * The pressure compensation needs a temperature reading, so temperature
> +	 * is sampled even when only the pressure channel is enabled.
> +	 */
> +	rc = dps310_read_temp_raw_locked(data);
> +	if (rc)
> +		return rc;
> +
> +	if (test_bit(DPS310_SCAN_TEMP, scan_mask)) {
> +		/* Millidegrees Celsius */
> +		rc = dps310_calculate_temp(data, &scan->channels[i]);
> +		if (rc)
> +			return rc;
> +
> +		i++;

Wouldn't

		rc = dps310_calculate_temp(data, &scan->channels[i++]);

work?

> +	}
> +
> +	if (test_bit(DPS310_SCAN_PRESSURE, scan_mask)) {
> +		rc = dps310_read_pres_raw_locked(data);
> +		if (rc)
> +			return rc;
> +
> +		/* Pascals, see the comment on the channel definition */
> +		rc = dps310_calculate_pressure(data, &scan->channels[i]);

For the consistency's sake

		rc = dps310_calculate_pressure(data, &scan->channels[i++]);

> +		if (rc)
> +			return rc;
> +	}
> +
> +	return 0;
> +}

...

> +static irqreturn_t dps310_trigger_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf = p;
> +	struct iio_dev *iio = pf->indio_dev;
> +	struct dps310_data *data = iio_priv(iio);
> +	struct dps310_scan scan = { };
> +	int rc;
> +
> +	mutex_lock(&data->lock);
> +	rc = dps310_fill_scan(data, iio->active_scan_mask, &scan);
> +	mutex_unlock(&data->lock);

Hmm... Is scoped_guard() too bad here?

> +	if (rc)
> +		goto err;

> +	iio_push_to_buffers_with_ts(iio, &scan, sizeof(scan),
> +				    iio_get_time_ns(iio));

I would go with a single line.

> +err:
> +	iio_trigger_notify_done(iio->trig);

> +	return IRQ_HANDLED;
> +}

-- 
With Best Regards,
Andy Shevchenko


