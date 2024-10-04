Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2201FBCA0
	for <llvm@lists.linux.dev>; Fri,  4 Oct 2024 19:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728069169; cv=none; b=n1m/MD+icyC1dYgDPiR8anjGBgFx5oUR0hdI+Hr6LUTlDQbdrAD/3mwn7CzCG8/LMmUYlvjXPQKIOEPFfcuyyZ/MeJDWfs2nCm8IVEtuTOYxCJYYdAfA/fCZZnHC25nvDDjW791SMvVwBbWr2zyuWjWCa0Iq0HCIIHl7U1oj4Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728069169; c=relaxed/simple;
	bh=/M1ZjTmABJbh4MwRycydLtqA1KHIs1Qq3zaDKYdOVWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f5Z8ED7+2Zjf1nW+zTfGcjjLDdOTPpkSv02SAF5Lxmk0O3ybzE0hh3g4WyZEy4xiafnjMGUwYX1O2pKL+fYhOk6D4mohVdtNyeYJ6fENFFpA5n03pSfTp2eBrMssAoIoUZyHd6uIYYimylt8GPX9OG3Pzrkg4Z0LiuxnHjf5+L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DdLd74jY; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DdLd74jY"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5e1c65eb68aso1424909eaf.2
        for <llvm@lists.linux.dev>; Fri, 04 Oct 2024 12:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728069165; x=1728673965; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X8E/75Ze8LWS+oGsxT4cv2r0PKvnIHpyk0O4+fHPIOA=;
        b=DdLd74jYPBvzFPPzezfH1o4dhs0FA7ciprI6dfR4dFV8DqWNXtHxnIQRjcfBscCA2l
         zqxPXEBzrMzGDUrKtILSfOiAYNczXm3Im8VY5/k6WIHC19M/T4M7mjFTYkHH+++PM9xw
         7gF9DmlWYzm2JY1+m62IYqm9XnPoXkiDqddDyvJnjNvHl3P+fQxr8/nQ4C5OTuXACtQ+
         hecJ1C5h+RXTmXcjK8ogTYIqoiKkj3U+kl9yFblG9iTVmLDO2nlQrNd6Kf1cwOz9lSac
         QetlCexCakVI2/mZoVBuauUop2OtYytnfRTIZ8M2k2znR6vG502sVCBU3N6XL+ZX1M94
         7PLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728069165; x=1728673965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X8E/75Ze8LWS+oGsxT4cv2r0PKvnIHpyk0O4+fHPIOA=;
        b=uqXp4jyU+I/veWZe5tXDdbWe1pIQiH7YSQfX2kuwyrR7gMRgGOyG06lnXKTro5gXuy
         8h9PrbwoGxBiIWax80UxjpXHmazG+qNWXcIB/+41Pif/ZVd5W/HoH/mO0lKFQd3cOx7i
         Y4wlPIyR8ue0JeCOSBcx5VMjpYWFBFPfzadAwEAe7hd8U6IC3K4sNEri7GMiz2gJzhGz
         +jB3iQVtlYCYwCkVSYhnexMpncaTMlK/YCAQXfzIEWRBvjcqo/GFA3bBSVC1yG6STKwB
         vska/IZG3H+f5s5R7mqudZP9eAxf8jXilOc1E7ndMAgHJf01y9oyVXmLQsQ4555p2mG6
         /2Xw==
X-Gm-Message-State: AOJu0Ywlvk1Y20xmjATFn0RVIpgvJilFLWD06EGy5UupsTSuVxZmQaV4
	uFcrG9/Zn2het0qvcsGB4O+n13Mro9vY9R0+ZdiM4hwBQokXuCWgGLdhpWLUVZ4=
X-Google-Smtp-Source: AGHT+IFauv67y1n9nX22pC/6NEemDgp2UqXjYbZLEVPwPcm0WP0X9oCZ9xusSoOdx+Ve9A4mDrHazg==
X-Received: by 2002:a05:6870:3913:b0:278:14bf:2fb with SMTP id 586e51a60fabf-287c228bee8mr2703044fac.34.1728069165246;
        Fri, 04 Oct 2024 12:12:45 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7155674599dsm137977a34.9.2024.10.04.12.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 12:12:44 -0700 (PDT)
Message-ID: <0ce9a516-dee5-49cd-bb74-62166c16e644@baylibre.com>
Date: Fri, 4 Oct 2024 14:12:44 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: core: make iio_device_claim_direct_mode()
 __must_check
To: Dan Williams <dan.j.williams@intel.com>, kernel test robot
 <lkp@intel.com>, Jonathan Cameron <jic23@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241002-iio-must-check-claim-direct-v1-1-ab94ce728731@baylibre.com>
 <202410040721.upAHwZJm-lkp@intel.com>
 <67002c9cdb068_10a0a294a7@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <67002c9cdb068_10a0a294a7@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/4/24 12:57 PM, Dan Williams wrote:
> kernel test robot wrote:
>> Hi David,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on 431c39f6d3edbab14f48dbf37a58ccdc0ac3be1e]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/iio-core-make-iio_device_claim_direct_mode-__must_check/20241002-233644
>> base:   431c39f6d3edbab14f48dbf37a58ccdc0ac3be1e
>> patch link:    https://lore.kernel.org/r/20241002-iio-must-check-claim-direct-v1-1-ab94ce728731%40baylibre.com
>> patch subject: [PATCH] iio: core: make iio_device_claim_direct_mode() __must_check
> [..]
>>>> include/linux/iio/iio.h:669:50: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
>>      669 | DEFINE_GUARD(iio_claim_direct, struct iio_dev *, iio_device_claim_direct_mode(_T),
> 
> So I think this points to the fact that iio_device_claim_direct_mode()
> should not be using DEFINE_GUARD() in the first instance. I think
> iio_claim_direct() really wants to be using DEFINE_CLASS() directly.
> Skip usage of DEFINE_GUARD() which I now see is unable to interoperate
> with a __must_check locking function.
> 
> Perhaps the new class can be something like:
> 
>     DEFINE_GUARD_EXCL_COND()
> 
> ...which creates a guard that is exclusively conditional and has no
> unconditional flavor. However, maybe that only lives in iio unless and
> until another user arrives.

Hmm... I see what you mean. All other conditional guards (e.g.
mutex_trylock) have an unconditional counterpart (mutex_lock)
that is used with DEFINE_GUARD.


