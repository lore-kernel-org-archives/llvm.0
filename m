Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B85375
	for <llvm@lists.linux.dev>; Fri, 18 Aug 2023 01:15:11 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-565f8b23151so84317a12.0
        for <llvm@lists.linux.dev>; Thu, 17 Aug 2023 18:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1692321310; x=1692926110;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0OZI4NJnVebNM6+xyzwnKsD1iMAOA59kDaPSqooa2s=;
        b=o63LFo902MW3jOMihEhTthkAapz32a8B14io7B4LRVjqDuG13Ue5OxpXnJBUZGVnyG
         03RA88lMAR6UKQX8vGB8lj0F+tLePgx5ynoUORrZAD4gY//TsVr38UUC9Z3rpPKj8JQ4
         Lt2gngGzRIE7p0mXq4yTNP2tRoTWKjfs0Ncp8lPvTnaz0WT/ZRucUlCIWeutorLT8uQS
         YqzndBepB4nOWt85vsREbBi/5VuL0m95ikk1N4tNtynrlrEixZ9SCMAXKFQmAx4trnWQ
         BH8LNsc/8cHblRZ8LRtHSkm+6meWhuMs/a63NmbNMPyKyf2OWcfJV3u9ElV1sOOWVXqt
         urfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692321310; x=1692926110;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0OZI4NJnVebNM6+xyzwnKsD1iMAOA59kDaPSqooa2s=;
        b=AMJoc02TK25f0KQuuLiLnXQf2qBDsRNe796KTst1hGDp+3GfjvglDHsZk4kbTYXQOH
         gZvDHNgbx6Z+M5WWhT5Ld2Jp6cQaLRtwMyiXByc8eh0NSBDB3XPx1oAe8elMSQuM+Y2l
         AMd19RLHuVVdXD3ZOczWn+A91mWJxGvM/8p9NSXLbObKDjsySQI1fNuY5lvdDec3dI+E
         pFlS4Ihf1J1ozhbd23P4gzFFDuAEgUYDev2Wq6jqO5X5ysi2+yoKT5LGz8CZ9jB0rawC
         9TGz0O4UaRicg35XB2PVTp0W+35R7MIdnSTmr5RsJcjcUf47VT3OeM6h6rc+vj5Wp3FY
         krFA==
X-Gm-Message-State: AOJu0Yw7BV6GT/X6Mgt365/BEfD2mdhb5RC+gwdeLYZkswWPv5IkuAyy
	9VhMd/uS9HXEsM/gAsh3A9M10w==
X-Google-Smtp-Source: AGHT+IGQubHAAfLcM9gFxNKvlfXNaq4wEeNmXlj6d+JqwuLxwHoSVzghFX4bWwVbT5cYfcDW4zVlnQ==
X-Received: by 2002:a05:6a00:1d85:b0:681:9fe0:b543 with SMTP id z5-20020a056a001d8500b006819fe0b543mr1234120pfw.2.1692321310699;
        Thu, 17 Aug 2023 18:15:10 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id j12-20020aa7800c000000b0068842ebfd10sm358490pfi.160.2023.08.17.18.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 18:15:09 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Kees Cook <keescook@chromium.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20230817212146.never.853-kees@kernel.org>
References: <20230817212146.never.853-kees@kernel.org>
Subject: Re: [PATCH] io_uring/rsrc: Annotate struct io_mapped_ubuf with
 __counted_by
Message-Id: <169232130924.700993.10043093294166679219.b4-ty@kernel.dk>
Date: Thu, 17 Aug 2023 19:15:09 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2


On Thu, 17 Aug 2023 14:21:47 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct io_mapped_ubuf.
> 
> [...]

Applied, thanks!

[1/1] io_uring/rsrc: Annotate struct io_mapped_ubuf with __counted_by
      commit: 04d9244c9420db33149608a566399176d57690f8

Best regards,
-- 
Jens Axboe



