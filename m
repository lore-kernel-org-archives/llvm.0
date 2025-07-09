Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AC22561D9
	for <llvm@lists.linux.dev>; Wed,  9 Jul 2025 23:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752102499; cv=none; b=Ujp+I9+zmX9u1DpQeRIlc5kTud7XGPiGjSCyS2oz0OhqMxD1p/i4yE3GqU2R6sagI9/UVz7lTzPy8r8ghoIUuKxKDFjOzs3GIRw0gOn6e2NLhFBcmtXoWrKmJI8qCY46bu3ln5EAAXPXkUQaIZunJdM7St+S1ypskQGJR/lKJDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752102499; c=relaxed/simple;
	bh=mZl56jeQbW9Xvr9xTCgxdcRYV56NqWzRc1L2rgedtB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2qkBSEnGVDP4mGPqB2vtOorH/dx6OJxbA4AvUyDLFQcqygUyEO2Jsp7UjEn3XXcqP6QQU6qpjicSwZFr/Pz2oSctGlSGwqYNlWEF/qmLVoH3IW/+7VSZInOMkGtQGuUwZrkeQiDv1p7Z6aqLuha64X3wKxmjyXHnQjtyulFi8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DzbMZRZ0; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DzbMZRZ0"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-73cddf31cb2so110629a34.1
        for <llvm@lists.linux.dev>; Wed, 09 Jul 2025 16:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752102495; x=1752707295; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w1RcS7SBZRxs2/wBGM7GrLmqpxOmLpCSrNvWXY1tKsY=;
        b=DzbMZRZ0HVq8+bkEE1QWYGestUBINm+9G8h4I7+scXqKM7hg9hRRdcOPcq6A/okCXb
         O40lqS9J5lFmO0/cCm0ueIMSf2FiinKxPAINqkGYQ9fBNFhXEY1+HfCTCh+lVV7gBiOr
         e0bz1bS1eYpemqDiYhCX7OgiYtnenigIkGlTgj/yqFAOXGRxAyS2aNiwsojmibQ/h09f
         92pceKQI6/hGQWWJFVUrPMhfuIY9TL94ubI/V2J9RdpOc7L/jjoNADxUmMHcuwEp9ATh
         0SiUjUq2zvluo66ywRGb/mIDGwurddgZh+2Fsv78WbpisRip0AGIpQzvLqI/pbuZvScp
         dACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752102495; x=1752707295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w1RcS7SBZRxs2/wBGM7GrLmqpxOmLpCSrNvWXY1tKsY=;
        b=OIllVcxQCYpnQuuXGJE/dB8SvALUq0oxHwd5ZqBy+J827cKhIbLtIfEkY55rMYra9N
         tTAF4LAB+4+lszGhc7hqdjW4nZFJVh6l4si+MieRB9Z1sG5Ob0eDIp8XVb6QmbJzFJwB
         vkwqUzfYSBQk1gbGTdHS4cwocnFxLE9f0wRbHnOldXkY2U73nOpBfyRMekjUJ9Nql5Dc
         PQJjJAP1pW3Hiyl/2dsrPAvYzCPa6/jWWuqB8AMBHUDzFtovDBeLF6rSQdA8dy36n76n
         U1ztjMaoO/nbQd0PNwRJsY10lBruVdb6JKH3Z77yswCK0WrLAx9WWkf0um9Bgz0vGuPg
         ItfA==
X-Gm-Message-State: AOJu0YwkE4Lu830nsvJaRF6QXdVsUKaZc/NlBGtV/2mK0WlAQmEB52eM
	DejDiPPBG3LUAh+PBVtVMocJbCzsf3gIg/GSGNogao29JN3vUq3sLOz14n6aDpD7vSA=
X-Gm-Gg: ASbGncs0nR48OaDkisEYr+HTrQNoxDiRa3WyG5S+/SftS+lMxuTwCgASoCc/g2ZMO8w
	1j7Gw/piFs2Zl2N45lilwM7NWPXofuje7Q3McZIP6fnkwjgy/urQx204ekz1ChKBYvW6L/ZVsfZ
	AhDXnmIVwCUulir6Xp7QHp6Iyu19SzDehh6W/otTrc5IY7CRa/X/BPk6day5porziN7JyWqtEt9
	vo81HdddVFdzrwVNShK4D0i4Lx8zpYPVC6JD2Di4Qz3DiZGAgG1I2RD6vzSYEf73gaP4OoStu1r
	kptwvzMHR+xsx1jhH7xH13eFBOaA/xn7Ys3AfDyKYC9MwOQsgeOVCNMOUvaroFIzYXHD/pSqcjS
	GSWAbs1glV4vpmk5Fr2U0lxEcB9+z+8FoD+8kszM=
X-Google-Smtp-Source: AGHT+IFZi/zEziFv80QyIZv++mamp4w+QdYbR7qXvclTwX77OPlh+xnTobi+5iqQq7KgZZ33u9w84g==
X-Received: by 2002:a05:6830:6c8b:b0:73c:c4c0:7f46 with SMTP id 46e09a7af769-73ce637484fmr3458606a34.21.1752102494741;
        Wed, 09 Jul 2025 16:08:14 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:6f38:cf8f:abb1:34f7? ([2600:8803:e7e4:1d00:6f38:cf8f:abb1:34f7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf12a4c12sm29217a34.47.2025.07.09.16.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 16:08:14 -0700 (PDT)
Message-ID: <1129c84e-31ab-45dd-89da-d37c9df2f8a4@baylibre.com>
Date: Wed, 9 Jul 2025 18:08:13 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [jic23-iio:testing 132/187] vmlinux.o: warning: objtool:
 bno055_get_regmask(): unexpected end of section .text.bno055_get_regmask
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <202507100510.rGt1YOOx-lkp@intel.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <202507100510.rGt1YOOx-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/9/25 4:48 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
> head:   f8f559752d573a051a984adda8d2d1464f92f954
> commit: 486300b45b81df9079fc2cea6179116c65c22ab5 [132/187] iio: imu: bno055: make bno055_sysfs_attr const
> config: x86_64-buildonly-randconfig-006-20250710 (https://download.01.org/0day-ci/archive/20250710/202507100510.rGt1YOOx-lkp@intel.com/config)
> compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507100510.rGt1YOOx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507100510.rGt1YOOx-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> vmlinux.o: warning: objtool: bno055_get_regmask(): unexpected end of section .text.bno055_get_regmask
> 

Well, the error message on it's own is useless, but searching for the same
error message reveals that it possibly means that optimized code was found
to be doing something sketchy. So with that in mind, I think I see the problem.

(The commit referenced here didn't cause the problem, but rather revealed
it since more optimizations could be made because of the const modifier.)

Given...

struct bno055_sysfs_attr {
	const int *vals;
	int len;
	const int *fusion_vals;
	const int *hw_xlate;
	int type;
};

static const int bno055_gyr_scale_vals[] = {
	125, 1877467, 250, 1877467, 500, 1877467,
	1000, 1877467, 2000, 1877467,
};

static const struct bno055_sysfs_attr bno055_gyr_scale = {
	.vals = bno055_gyr_scale_vals,
	.len = ARRAY_SIZE(bno055_gyr_scale_vals),
	.fusion_vals = (const int[]){1, 900},
	.hw_xlate = (const int[]){4, 3, 2, 1, 0},
	.type = IIO_VAL_FRACTIONAL,
};

static int bno055_get_regmask(struct bno055_priv *priv, int *val, int *val2,
			      int reg, int mask,
			      const struct bno055_sysfs_attr *attr)
{
	const int shift = __ffs(mask);
	int hwval, idx;
	int ret;
	int i;

	ret = regmap_read(priv->regmap, reg, &hwval);
	if (ret)
		return ret;

	idx = (hwval & mask) >> shift;
	if (attr->hw_xlate)
		for (i = 0; i < attr->len; i++)
			if (attr->hw_xlate[i] == idx) {
				idx = i;
				break;
			}
	if (attr->type == IIO_VAL_INT) {
		*val = attr->vals[idx];
	} else { /* IIO_VAL_INT_PLUS_MICRO or IIO_VAL_FRACTIONAL */
		*val = attr->vals[idx * 2];
		*val2 = attr->vals[idx * 2 + 1];
	}

	return attr->type;
}

We can see that attr->len is used to iterate over attr->hw_xlate[]
but attr->len is the length of attr->vals[] and is not the same as
the length of attr->hw_xlate[].

