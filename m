Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A251F956
	for <llvm@lists.linux.dev>; Tue, 14 May 2024 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715676325; cv=none; b=eR51VnEFZQ6xxL98KUyRTxH3EdwUMCq71cKfjYL/3zsqSMJKRRyxRjoegCUWIGGGr/6bn9Vn1h/TdGCWX2jDEj98nxnE8yI7gTJ5sy5HiP/TPBDse+MKm1YUDBIK7qZvVufS5XYjf/tO9PzkzcBp8VkIL6slhcYyh1kdfgPvHLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715676325; c=relaxed/simple;
	bh=rJIazF0uPRtHdaouZBgz7iYU/9TUHu8dIhCf/WYXSRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGcu5EQpIPtl70N1ofx1Z4L0KS4xp6vRWRomUaXMSsy11JcHAXnmj9HfZOMHA5f+oxOdpgZEUKirpqKpnwu11ypP+yrCXbMTesuFbL8lqVqZZgIJ2wQd0Ct0DEakDzDRuXoH3CQwhKfdZJdr9QUGWvSgJxbSa5Kls/XIanfom1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IQvaMMPD; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IQvaMMPD"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a5a2d0d8644so1125197566b.1
        for <llvm@lists.linux.dev>; Tue, 14 May 2024 01:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715676322; x=1716281122; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S5pgGNiE0yFh18inZjwCGMxdi3PkHuc9sldyTkkwOOw=;
        b=IQvaMMPDH7CXScGNa6PNIqMCrkSmIR3PItopEHmojX3yIT4UNGrh1GsOzvceuWvE1E
         MJJzuaRlnKHBEo/eucT+/wbo/IOvTOXAAEn5yceCa45/uUUH2Gyl/mFgoyBoEmonr7YA
         Y2y55PP3sV5uFskd/Pi2w56IYSXFjj6/jGOw0RIZpRAT12cUvcXFepztO86U8MtKiwlM
         8x0h91qeK9rC6QjvJ3akM6Xt2hCR+hSWV1HN7cRnF5gtlCpP4oSQk03WkdF6RumFB82T
         wInGLpxrm0di7tSIQZCjKbTvxmWnI16e2fU0CjqszkP65Y69yiRD7R/Ehh79J2XdMc9W
         Dp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715676322; x=1716281122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5pgGNiE0yFh18inZjwCGMxdi3PkHuc9sldyTkkwOOw=;
        b=hrI3opz+kcwM0Qxwqtl91g6P2S3fkgvT3uExlJOEp8sa1Q9wLV1cB+gnfXZqgdCaK7
         XvopwLepKNptCk2qk14g93+Ht1CgyqVEZhR/+Z9tfFjUzULhubDeW8CMZamjmnySFC46
         hD5Po+B2PPA5DyAR6bz4oIFYhUyswvwJwCPC99GbSxYddJ/sytgdTYTm9yjhitlcyYvG
         oSGId1vNb98BbjuyyWSWG8TnKvD5fW5+NIbSW5MPuK4/0m4DSlkCGKBqg+d8piFT+XW6
         0T5CvaHW2c7QUvbIa94cV64nMcVvxToW9OKCyBQBKS/fT/5DsLMPLeiCK1lXYgRn+apK
         oBRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV12C0WxBNZdFZERNt7z9eG0e+n833Se0Gj3iCut7YELBg40k++MSA0WJh68iZ4t8xgz6XjM4A5mpIvNWun8HoDMSlIqA==
X-Gm-Message-State: AOJu0Yz4TWapqrLqjXIGnd6Z5qAJk2PznAaWrRihdwfCqZ7YPRl2J0lg
	lu7HyKtFW5+FU6ja+7jrHdKDgK7y4iEVHWt1jhk6Qjfe7bM6w90Fg3cMSH1CZpw=
X-Google-Smtp-Source: AGHT+IG/veYk/QiA4TlT19kc88WgCw8A4K1JllN2RbIelSwgiXW/5LElmvH1TSH3Org6cXh64TlRvQ==
X-Received: by 2002:a17:906:2b0d:b0:a59:be21:3575 with SMTP id a640c23a62f3a-a5a2d672ee4mr894591566b.51.1715676321589;
        Tue, 14 May 2024 01:45:21 -0700 (PDT)
Received: from localhost ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17892450sm700476866b.63.2024.05.14.01.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 01:45:20 -0700 (PDT)
Date: Tue, 14 May 2024 10:45:19 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [RFC] Mitigating unexpected arithmetic overflow
Message-ID: <0480d602-3ad7-4f8e-a480-9860d56eab30@suswa.mountain>
References: <202404291502.612E0A10@keescook>
 <039d54d6-8aa2-4e5b-829b-69002cff35d3@moroto.mountain>
 <202405131203.F7B97F5E38@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202405131203.F7B97F5E38@keescook>

Snipped all the bits where you are clearly correct.

On Mon, May 13, 2024 at 12:43:37PM -0700, Kees Cook wrote:
> > drivers/usb/class/usbtmc.c:852 usbtmc_generic_read() warn: potential integer overflow from user 'max_transfer_size + 1'
> >    842                   * wMaxPacketSize – 1) to avoid sending a zero-length
> >    843                   * packet
> >    844                   */
> >    845                  remaining = transfer_size;
> >    846                  if ((max_transfer_size % data->wMaxPacketSize) == 0)
> >    847                          max_transfer_size += (data->wMaxPacketSize - 1);
> >    848          } else {
> >    849                  /* round down to bufsize to avoid truncated data left */
> >    850                  if (max_transfer_size > bufsize) {
> >    851                          max_transfer_size =
> >    852                                  roundup(max_transfer_size + 1 - bufsize,
> >                                                 ^^^^^^^^^^^^^^^^^^^^^
> > This can overflow.  We should make it a rule that all size variables
> > have to be unsigned long.  That would have made this safe on 64 bit
> > systems.
> > 
> >    853                                          bufsize);
> >    854                  }
> >    855                  remaining = max_transfer_size;
> 
> Again, do we _want_ this to overflow? It looks like not. I'm not sure
> what this code is trying to do, though. The comment doesn't seem to
> match the code. Why isn't this just roundup(max_transfer_size, bufsize) ?
> 

roundup() has an integer overflow in it.


> > drivers/usb/misc/usbtest.c:1994 iso_alloc_urb() warn: potential integer overflow from user 'bytes + maxp'
> >   1974  static struct urb *iso_alloc_urb(
> >   1975          struct usb_device       *udev,
> >   1976          int                     pipe,
> >   1977          struct usb_endpoint_descriptor  *desc,
> >   1978          long                    bytes,
> >   1979          unsigned offset
> >   1980  )
> >   1981  {
> >   1982          struct urb              *urb;
> >   1983          unsigned                i, maxp, packets;
> >   1984  
> >   1985          if (bytes < 0 || !desc)
> >   1986                  return NULL;
> >   1987  
> >   1988          maxp = usb_endpoint_maxp(desc);
> >   1989          if (udev->speed >= USB_SPEED_SUPER)
> >   1990                  maxp *= ss_isoc_get_packet_num(udev, pipe);
> >   1991          else
> >   1992                  maxp *= usb_endpoint_maxp_mult(desc);
> >   1993  
> >   1994          packets = DIV_ROUND_UP(bytes, maxp);
> >                                        ^^^^^
> > The issue here is on a 32 bit system when bytes is INT_MAX.
> 
> All of these examples seem to be cases that should be mitigated. The
> earlier check should be expanded:
> 
> 		if (bytes < 0 || bytes >= INT_MAX || !desc)

This doesn't work on 32bit systems.

> 
> > 
> >   1995  
> >   1996          urb = usb_alloc_urb(packets, GFP_KERNEL);
> >   1997          if (!urb)
> >   1998                  return urb;
> > 
> > 
> > drivers/char/ppdev.c:344 pp_set_timeout() warn: potential integer overflow from user 'tv_sec * 100'
> >    343  static int pp_set_timeout(struct pardevice *pdev, long tv_sec, int tv_usec)
> >    344  {
> >    345          long to_jiffies;
> >    346  
> >    347          if ((tv_sec < 0) || (tv_usec < 0))
> >    348                  return -EINVAL;
> >    349  
> >    350          to_jiffies = usecs_to_jiffies(tv_usec);
> >                                               ^^^^^^^
> > 
> >    351          to_jiffies += tv_sec * HZ;
> >                               ^^^^^^^^^^^
> > Both of these can overflow
> > 
> >    352          if (to_jiffies <= 0)
> >                     ^^^^^^^^^^^^^^^
> > But they're checked here.
> > 
> >    353                  return -EINVAL;
> >    354  
> >    355          pdev->timeout = to_jiffies;
> >    356          return 0;
> >    357  }
> 
> This doesn't look like a wrapping-desired case either, but just for fun,
> let's assume we want it.

The original programmer assumed it would wrap so it was intentional/desired.

> (And why are any of these signed?) Annotation
> is added to the variables:
> 
> static int pp_set_timeout(struct pardevice *pdev, long __wraps tv_sec, int __wraps tv_usec)
> {
> 	long __wraps to_jiffies;

Sure.

> > drivers/i2c/i2c-dev.c:485 i2cdev_ioctl() warn: potential integer overflow from user (local copy) 'arg * 10'
> >    478          case I2C_TIMEOUT:
> >    479                  if (arg > INT_MAX)
> >    480                          return -EINVAL;
> >    481  
> >    482                  /* For historical reasons, user-space sets the timeout
> >    483                   * value in units of 10 ms.
> >    484                   */
> >    485                  client->adapter->timeout = msecs_to_jiffies(arg * 10);
> >                                                                     ^^^^^^^^^
> > This can overflow and then the msecs_to_jiffies() conversion also has
> > an integer overflow in it.
> 
> If we want these wrapping:
> 
> 		unsigned long __wraps timeout = arg * 10;
> 		client->adapter->timeout = msecs_to_jiffies(timeout);
> 
> and:
> 
> static inline unsigned long _msecs_to_jiffies(const unsigned int __wraps m)
> 
> 

Here we don't care about wrapping, but I wouldn't go so far as to say it
was intentional...  I guess this silences the warning.


> > drivers/hwmon/nct6775-core.c:2265 store_temp_offset() warn: potential integer overflow from user '__x + (__d / 2)'
> >   2251  static ssize_t
> >   2252  store_temp_offset(struct device *dev, struct device_attribute *attr,
> >   2253                    const char *buf, size_t count)
> >   2254  {
> >   2255          struct nct6775_data *data = dev_get_drvdata(dev);
> >   2256          struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> >   2257          int nr = sattr->index;
> >   2258          long val;
> >   2259          int err;
> >   2260  
> >   2261          err = kstrtol(buf, 10, &val);
> >   2262          if (err < 0)
> >   2263                  return err;
> >   2264  
> >   2265          val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
> >                                                   ^^^^^^^^^^
> > Overflow and then clamp.
> 
> Looks like DIV_ROUND_CLOSEST() needs to be made sane and use more modern
> helpers (it appears to be doing open-coded is_signed(), wants
> check_*_overflow(), etc).
> 

Sounds good.

regards,
dan carpenter
