Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2649209F5B
	for <llvm@lists.linux.dev>; Wed,  4 Dec 2024 14:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733323176; cv=none; b=usjYPkSAFU8DGvoqtJ9cfhW1rNZOzB7MkUYjvr11dIQ+8kUor+gyYshtKAreBbBJ3sW5YoZd715wEghQoYKBdSTLCFC1T8D6ZoQN9sdYuXnSfuwZpTmBoJc7/9EeV9jbPYFvDwXpINuEIWHrjaLY/bVcXbZWCQOxIf4KTYVaBa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733323176; c=relaxed/simple;
	bh=7vm+GgU7IzYoJVoPQmQEkbgSGw3DdebIEtgOIlj7sr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TIxAOg3tTV4HXzli3C3M+cNcsFl+4GhFdzFZKOqmR0kWzYJBBzL3w1HLW1Eddc+3NIfxtrcM7oS6aRYZ/tE6kTMx5pqMgmXjziPd4u/jcB5WsVazbsZPpL14LHhUKiY7ppMgKgPfJO+7hDcOMInFPB9S0neq2/Pnkmzls3lk6Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nZWoaJBj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nZWoaJBj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434a1833367so6178195e9.1
        for <llvm@lists.linux.dev>; Wed, 04 Dec 2024 06:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733323173; x=1733927973; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u7Deb6ozPBCd5HaUFhdz6hCVVIOvpic/u3v2HTGhW9U=;
        b=nZWoaJBjL7LstkzmXqUUJkeB5L7A8MfEtoYgRJYnZL9l8DE8FXigFzgwFWbmhcmM8E
         uzmXoTRm2bo6a4Z26awUK/ckOpfz+JOCG/pTk6K63mfk+dMM2ZfR93UMsiqNYDLARGHr
         3vf9fQ5nLEMKrYc6rQt9ufMupwZ/k22L3FztIpCNN4mmvRHITD59GvkvgpnMBghCgck6
         CK/c9BRJAfILJqgVfHDDGXgKrHAxixpATX84sVMHh9qVMFCwyg9tZVpOm7QOmc2i160o
         0S0Msefzz55kRxMPmg4eTMRfxMZ0/cHnIT1XaKB0KATg+FsT23tJefnNtrxAJmPsO+Ce
         OMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733323173; x=1733927973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7Deb6ozPBCd5HaUFhdz6hCVVIOvpic/u3v2HTGhW9U=;
        b=SCfxN8rbgAWScXye5rDvpJ5y2DrQ6s3UKfOkliK3z8i46o49rydhHfxl3gyczdRMfw
         mHOROehkATjkaKJsklxk/nq9tAKvWE7vOcuzj8i+z6A0O5OBsKQsEwfVGwCf/Jszq9Zz
         Jvv/QeJ2Vo0yL7lCnw/hcnKjA5pv4LstWpXjyxP+Le5pASGbIPt9PqkciMRDk6Hhkpm6
         PND5xybZ/SVXMukLv9B5blktFq7a2hNAuREHoBn3PvFu8SgXoWXZyr0qFK/T9rVUF1WG
         N88iErgt/TRAsKhlHrqP52r5YkK2Ge6uU7vJ8Fj1BnaJW4b5dv9wpLw1lpz2OmoU6eAW
         JLjg==
X-Forwarded-Encrypted: i=1; AJvYcCVAnB6Hx9rkeaAKk/hQhiKC8PmRtnxzcYKWczIkdk9UTD1ZzoUSkZ+JUtczT011txD7GUAh@lists.linux.dev
X-Gm-Message-State: AOJu0YxoXpMzjhofIyC1I5Z62a69f+lteKPEM8nM0c1tGN0ews0Ucuyz
	vD6JSLuxCkBquShRa8SBpGzG2PGNAcaLGyReBaEnAXJEYnKAyg1+fun2FeL4uX4=
X-Gm-Gg: ASbGncvzz+4h/K1YOYM8LcKD317ZcRHCYdvnI9UU4WYKClMkHY2qHzLJ+cWTzTIYcwL
	4TQkg0599rqV2HCkjCpWgYX9mN00H2r1N4dJN0CVUDQiN17G+rh39BF/ZpqiXLreNDC6GEvyoPv
	9rmwOS5MiGIJk0QUYAsr0oYAoO2XL9koO3NnKaZqtakyK6ilLoR3N3QQCN/DLtJeFvhuNgt2UWL
	PQOoagWsf8ma+cnrZcOo1kg44qAOEg+ajKdd+CE0UCtrYGwp2pzkj8=
X-Google-Smtp-Source: AGHT+IFgNAhlHmTZM9dIRgErvl8+0lGzD3UNMNEnIcEA1d5Rnbb0Ap2o8TKx3zX6wtjKyR3FwkoocA==
X-Received: by 2002:a05:600c:198e:b0:434:9cf6:a2a5 with SMTP id 5b1f17b1804b1-434afb9ecc7mr229792735e9.8.1733323173202;
        Wed, 04 Dec 2024 06:39:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d528ab4esm26074105e9.26.2024.12.04.06.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:39:32 -0800 (PST)
Date: Wed, 4 Dec 2024 17:39:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	David Laight <David.Laight@aculab.com>
Cc: linux-s390@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>,
	linux-block <linux-block@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>, Jens Axboe <axboe@kernel.dk>
Subject: Re: s390: block/blk-iocost.c:1101:11: error: call to
 '__compiletime_assert_557' declared with 'error' attribute: clamp() low
 limit 1 greater than high limit active
Message-ID: <5ffa868f-cbf0-42ae-ae10-5c39b0de05e7@stanley.mountain>
References: <CA+G9fYsD7mw13wredcZn0L-KBA3yeoVSTuxnss-AEWMN3ha0cA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYsD7mw13wredcZn0L-KBA3yeoVSTuxnss-AEWMN3ha0cA@mail.gmail.com>

Let's add David to the Cc list because he's the expert on clamp().

regards,
dan carpenter

On Wed, Dec 04, 2024 at 04:01:09PM +0530, Naresh Kamboju wrote:
> The s390 builds failed with clang-19 with defconfig on the
> Linux next-20241203 tag due to following build warnings / errors.
> Build pass with gcc-13 defconfig for s390.
> 
> First seen on Linux next-20241203 tag
> GOOD: Linux next-20241128 tag
> BAD: Linux next-20241203 tag
> 
> List of arch and toolchains :
>   s390 defconfig with clang-19
> 
> s390:
>   build:
>     * clang-19-defconfig
>     * korg-clang-19-lkftconfig-lto-full
>     * korg-clang-19-lkftconfig-hardening
>     * korg-clang-19-lkftconfig-lto-thing
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Build log:
> ===========
> block/blk-iocost.c:1101:11: error: call to '__compiletime_assert_557'
> declared with 'error' attribute: clamp() low limit 1 greater than high
> limit active
>  1101 |                 inuse = clamp_t(u32, inuse, 1, active);
>       |                         ^
> include/linux/minmax.h:218:36: note: expanded from macro 'clamp_t'
>   218 | #define clamp_t(type, val, lo, hi) __careful_clamp(type, val, lo, hi)
>       |                                    ^
> include/linux/minmax.h:195:2: note: expanded from macro '__careful_clamp'
>   195 |         __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_),
> __UNIQUE_ID(l_), __UNIQUE_ID(h_))
>       |         ^
> include/linux/minmax.h:188:2: note: expanded from macro '__clamp_once'
>   188 |         BUILD_BUG_ON_MSG(statically_true(ulo > uhi),
>                  \
>       |         ^
> note: (skipping 2 expansions in backtrace; use
> -fmacro-backtrace-limit=0 to see all)
> include/linux/compiler_types.h:530:2: note: expanded from macro
> '_compiletime_assert'
>   530 |         __compiletime_assert(condition, msg, prefix, suffix)
>       |         ^
> include/linux/compiler_types.h:523:4: note: expanded from macro
> '__compiletime_assert'
>   523 |                         prefix ## suffix();
>          \
>       |                         ^
> <scratch space>:38:1: note: expanded from here
>    38 | __compiletime_assert_557
>       | ^
> block/blk-iocost.c:1101:11: error: call to '__compiletime_assert_557'
> declared with 'error' attribute: clamp() low limit 1 greater than high
> limit active
> include/linux/minmax.h:218:36: note: expanded from macro 'clamp_t'
>   218 | #define clamp_t(type, val, lo, hi) __careful_clamp(type, val, lo, hi)
>       |                                    ^
> include/linux/minmax.h:195:2: note: expanded from macro '__careful_clamp'
>   195 |         __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_),
> __UNIQUE_ID(l_), __UNIQUE_ID(h_))
>       |         ^
> include/linux/minmax.h:188:2: note: expanded from macro '__clamp_once'
>   188 |         BUILD_BUG_ON_MSG(statically_true(ulo > uhi),
>                  \
>       |         ^
> note: (skipping 2 expansions in backtrace; use
> -fmacro-backtrace-limit=0 to see all)
> include/linux/compiler_types.h:530:2: note: expanded from macro
> '_compiletime_assert'
>   530 |         __compiletime_assert(condition, msg, prefix, suffix)
>       |         ^
> include/linux/compiler_types.h:523:4: note: expanded from macro
> '__compiletime_assert'
>   523 |                         prefix ## suffix();
>          \
>       |                         ^
> <scratch space>:38:1: note: expanded from here
>    38 | __compiletime_assert_557
>       | ^
> 2 errors generated.
> 
> Links:
> ---
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26188938/suite/build/test/clang-19-defconfig/log
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26188938/suite/build/test/clang-19-defconfig/history/
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241203/testrun/26188938/suite/build/test/clang-19-defconfig/details/
> 
> Steps to reproduce:
> ------------
> # tuxmake --runtime podman --target-arch s390 --toolchain clang-19
> --kconfig defconfig LLVM_IAS=1
> 
> metadata:
> ----
>   git describe: next-20241203
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   git sha: c245a7a79602ccbee780c004c1e4abcda66aec32
>   kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAPS9UrJkbAKFHktQei7eqW4Y/config
>   build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2pjAPS9UrJkbAKFHktQei7eqW4Y/
>   toolchain: clang-19
>   config: clang-19-defconfig
>   arch: s390
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
