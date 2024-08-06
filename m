Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A3415C12F
	for <llvm@lists.linux.dev>; Tue,  6 Aug 2024 04:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722919917; cv=none; b=YAsDuCQ0oSxSYvg/D2hX1vdi2vXacQC1F27qnA/hrhMRMuIb019uZ3EseDzndh1lEBigwxpCnc+JIVqyR9cRiZLEDFIRgl3eu88/wKUWRiIpttTz4JI+8wVdwKF78ly5j3hH1tFm0CVUS38jCh8mP4nw5oMNaFELfwqqxzB0xjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722919917; c=relaxed/simple;
	bh=OiMv1fqLHwMe/meg9xscd4zfQKOekgsO4UZ5+YCHlIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcFjQr32FQk7LnT8qTJBOiozMK0tJGIpoLUNsUG3ln13brALrCdcwOVRhLQ4Gfs/W04tz7u5fL+oiDGe1VBQpicCqGAKoaHly4TNiLQiGKhIwuPacg045pUhAljjwsGlTR6gLE+LNLqLNoKHAIY00TjB2VqhUjrLGfC01BSvWbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rte6IwKv; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rte6IwKv"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7104f939aa7so176624b3a.1
        for <llvm@lists.linux.dev>; Mon, 05 Aug 2024 21:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722919915; x=1723524715; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t9lT0XdB5mcDq9zC4EQAHNJ7RkoUaPk1qdyqjjuk+Mc=;
        b=rte6IwKvyqP316VqOaDYwm5H7PwFE3skRFILm8bGjc4eWFCGdIcrMaK/Hv6M3CFD/a
         BEXdqwNrd7Ddfy2DKvVwojqfg2eHT1HfDj1C59rzQTYmgsDW9uFJDoIID9aBovwAjA3i
         erxd3nIxbuHvigjnNyxpKTVX0TWbBmUfRi5+XLwMQnNMOiEq/V1vn2zefO7S2Sc5ST/K
         MlhJfr9nFo8scBhRiLtJVakoc4kQkMEIyYwyj1999ssR0JkZd7OV5X8YjP2xcleP+6yl
         c8Ysw8FmWgytLGgfzsfmjBJH6AjL884OBXJcwkpgAPSNoUka++p2ZwIrHKXxHTt8OH90
         NUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722919915; x=1723524715;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9lT0XdB5mcDq9zC4EQAHNJ7RkoUaPk1qdyqjjuk+Mc=;
        b=S1y5owpQECBoG7OXFy0HU9y07hLbJCSjK4+Ai68T3sOaSjLd+OPuEN5XtTCWKNIq/+
         qySE5ayk4b0S9X+WiUu6UODuFuO6eMZtkzgtrL+JwAHG3UlWFjiF5dkrcrON/ssmkVZv
         f0VWAPAc6UpWpBy5nKHVqOxAtpHoQmx36fuVSQgOPN92AOc1xIfacmpXL9iy3ZuHqQvX
         jKfYwm+PpkSS7mWTibM0uzLINcmz2up32UZZSpruzDKTAtsPZXdyea6lR2fS7cmhAed+
         YsmvB7cbgGQckUG1Wv9DU3Ui8IClVHzO8yocQY9zBDEjCzwu4kV74xK/DLVmwNF47G6e
         CxEg==
X-Forwarded-Encrypted: i=1; AJvYcCUaPnDiikEWQxGc+3n3DIXQe2vV+GKCJaCE2jbeAbptqkZvWe6Dm7mstvA89ACsVjHizrJxbHCz7pGU+Kg3kqUPiooQjA==
X-Gm-Message-State: AOJu0YzDxU53e2tdOHyrtPOAYsiiTrONhafQp/m+oYzE1ViJwU5hipeJ
	hyWD4pT3s/n5UyMP7nA4qbgdM/rVeVHP5/UOpR96+jzROykuoczQriGOpZy54oY=
X-Google-Smtp-Source: AGHT+IGMW9pFn8MBD0M6wG6DiJhwIDtq1qEITbJ7PtGwS4U+HOetoCD2Lm6eaLPi3qLOwjgegXo48w==
X-Received: by 2002:a05:6a20:1588:b0:1c4:986a:ddb8 with SMTP id adf61e73a8af0-1c69966b784mr21687022637.43.1722919915127;
        Mon, 05 Aug 2024 21:51:55 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec40f5asm6241853b3a.51.2024.08.05.21.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 21:51:54 -0700 (PDT)
Date: Tue, 6 Aug 2024 10:21:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [vireshk-pm:cpufreq/arm/linux-next 2/2]
 drivers/cpufreq/spear-cpufreq.c:202:12: warning: variable 'i' is
 uninitialized when used here
Message-ID: <20240806045152.g5xker6gy2ad6jxt@vireshk-i7>
References: <202408030418.gnJDcCpm-lkp@intel.com>
 <20240805104758.52obllbjvuvtmd4n@vireshk-i7>
 <CAL_Jsq+evBH2+XVeMAGXy9Ucof=G574+sFKcG94MqSUdgzFSgw@mail.gmail.com>
 <CAL_JsqK6rY7S3X9sNSZFqhKPqz1wYz3QdgaQu42pnaKVA0HrwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqK6rY7S3X9sNSZFqhKPqz1wYz3QdgaQu42pnaKVA0HrwA@mail.gmail.com>

On 05-08-24, 17:02, Rob Herring wrote:
> On Mon, Aug 5, 2024 at 8:00 AM Rob Herring <robh@kernel.org> wrote:
> > Is there some reason COMPILE_TEST is not enabled for almost everything
> > in cpufreq/?

Not sure why.

> Pushed this out for builders to test:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/log/?h=cpufreq-compile-test

Thanks. Would be good to get these merged.

-- 
viresh
