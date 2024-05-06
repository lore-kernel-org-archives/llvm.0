Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8436348CCD
	for <llvm@lists.linux.dev>; Mon,  6 May 2024 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714977822; cv=none; b=BT1IBpJAPSRxzzCDr+oufJjg+zhpWuNluAnruKqXibpfjuZdn42ooQZb08GDBRGPzcEpG898mK2uBY+aBFTvCgTVugwnxjCTL+W9kYD8+9E8PQqkUfVkXWgoXErNViSsrvRRBRVl46bo5Gp2rTgWAlIfuFaB0vqmf4ntFbi3Njw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714977822; c=relaxed/simple;
	bh=TTtQyHcx8HkIEEBoI/wvFIf+0GYqPB/yGd00nQkF9Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QlsV2ranDcKwYX0ALR74IPHIHsOy33fOZvCT1TWu1b6tRN2X+2vCnUyB+BgaX0El0unI1HIf4jCTz92Nahfkxk+8AqUZktvSQ8Ke9LxbsC+u92vXX6MNufbKDzpze5Y95d8zjAGGoFc3sXXBzyVJNHMy04XGA3CfrZeMGBrUPAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X/+nB2zi; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X/+nB2zi"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-60585faa69fso932332a12.1
        for <llvm@lists.linux.dev>; Sun, 05 May 2024 23:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714977821; x=1715582621; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Awh0YX9sFOZlmXGVWv7TrQyTmY6KwzUZh2FsqtFN28s=;
        b=X/+nB2zi0CqUC5Mzlz282PC4mHW108sT2OtTmKz+9Fd9on2jbkmo60IH0vHSOfmAOF
         KhrjD21cctvjRQ9R22k5ydWBHhSWrVok9SO2rt0UnFH7+6elbLk3Kyym+hTFqEefSYpJ
         +OSOy/lOXR/P4HwEnfac0PZJo0fsUszBsikcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714977821; x=1715582621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Awh0YX9sFOZlmXGVWv7TrQyTmY6KwzUZh2FsqtFN28s=;
        b=kmKkoRImWVBlwJKaNhFJg2bFSitAVr+iYyF8EIU4VBN0O80yVFCq2Xj28qFNQSBcfv
         29rsIQtYi66xv1vBw9kWXXVYbGqt10cGw+rtu7AxqGGmmWZWmHSl9p36O50HkbbdVDXQ
         pdm6jLiUJPe4ay9QkL5rAt5qVbbQjUKiNW/TJp7lOhf3vPwPDrV1TfmI7jZhJxwQ0qea
         oJTHWYrab2e6NGf6DR5JY1lsSOBLe9b3dWljgY3IEJ7+1DdTWTP1JgSP3mEboO9lsKFE
         6FI/j70UtU8BnwI+yinyrZZEOukePZSl6Cw9vyWPS3hY384AKwSgUEtAJX5JmiXkJWUL
         XW4g==
X-Forwarded-Encrypted: i=1; AJvYcCUjebLt1ggYxmsmY7unKE+Ee89RNxOZUAVUjvIRXNg2Ky2bXfrK8QqVae/qCrKr/mzTMNhStobg9QY5nj+7qqPooE+U/A==
X-Gm-Message-State: AOJu0YyDy8C67o1LBjM4FQjSIljRTbwG0p8AA5ofe5zfvzQvUT/Peo5+
	wWhcfgda4swKs02ugtFNdtLg1lVlXZU3XOicMHBHY/QJ7RwtMPTbidC+9oV5XQ==
X-Google-Smtp-Source: AGHT+IH9/hiNrPAZgMq5yCe0qsmK1lm2LH0SwY8LB+Tn+zX2oS8PqcHxJee+fl5rH8OfTgRdDd1VYA==
X-Received: by 2002:a17:90b:124b:b0:2b0:763b:370e with SMTP id gx11-20020a17090b124b00b002b0763b370emr18238105pjb.18.1714977820818;
        Sun, 05 May 2024 23:43:40 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:4e24:10c3:4b65:e126])
        by smtp.gmail.com with ESMTPSA id rr3-20020a17090b2b4300b002b113ad5f10sm9316590pjb.12.2024.05.05.23.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 23:43:40 -0700 (PDT)
Date: Mon, 6 May 2024 15:43:35 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kbuild@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Minchan Kim <minchan@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 08/14] zram: check that backends array has at least one
 backend
Message-ID: <20240506064335.GE8623@google.com>
References: <20240503091823.3616962-9-senozhatsky@chromium.org>
 <202405041440.UTBQZAaf-lkp@intel.com>
 <20240504071416.GH14947@google.com>
 <20240504161004.f5a0aab5e5aa1033d4696c20@linux-foundation.org>
 <20240505043957.GA8623@google.com>
 <20240505051305.GB8623@google.com>
 <20240505064832.GC8623@google.com>
 <20240506032207.GD8623@google.com>
 <CAK7LNARUBuR3gDtX6GfB7Zv6dydt1+qzBB_XT58wOg3WeCTVvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARUBuR3gDtX6GfB7Zv6dydt1+qzBB_XT58wOg3WeCTVvA@mail.gmail.com>

On (24/05/06 14:20), Masahiro Yamada wrote:
> config ZRAM_BACKEND_FORCE_LZO
>         def_bool !ZRAM_BACKEND_LZ4 && !ZRAM_BACKEND_LZ4HC && \
>                  !ZRAM_BACKEND_ZSTD && !ZRAM_BACKEND_DEFLATE
> 
> config ZRAM_BACKEND_LZO
>         bool "lzo and lzo-rle compression support" if !ZRAM_BACKEND_FORCE_LZO
>         depends on ZRAM
>         default ZRAM_BACKEND_FORCE_LZO
>         select LZO_COMPRESS
>         select LZO_DECOMPRESS

I'll take this one. Thank you.

> BTW, "default n" you are adding are redundant.

OK.
