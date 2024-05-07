Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B22637
	for <llvm@lists.linux.dev>; Tue,  7 May 2024 00:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715040322; cv=none; b=ZKQeiqfHkPZfruG5o9QtWjEffBwVBZ+JmSeHaqAMrbWIirUSjWmwEZmxrETDrI+DmYnGTBl+cbQpWzIWtiwpn6Gn2Gw6yOVzPRxcHa7rbO8iNVeb6p9+er8HTKdOQtU1DeyoV6WAYA7gysvWPhAEf6DvOtlqw0WE/6LfZEu0Bs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715040322; c=relaxed/simple;
	bh=HPz//ch8ZRi2x8WCzJmSVsNjI/8HfUnEKKxsvoVrGaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FH/smcJ6CfBWkcWMfYF3oKO8/Q0+MWTop/rzQoQxd2FA+h7eJMjj/zB6yVoo8dkuQG13If6Oa/lbl7eofjpqPhdSfvBM2tAy85aW2Ep0ejeBtdn/KHiSS5z7J8KYSI6sGqTiEs+Y20kLmEMm2S7YS0ZvKnzER3616kkJS6Hb2d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fD+Z/VHZ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fD+Z/VHZ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1eb24e3a2d9so24387975ad.1
        for <llvm@lists.linux.dev>; Mon, 06 May 2024 17:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715040319; x=1715645119; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KlvDANCVrZHWMQYFIBtkDUG6BaCteNwh6wwcOjijmC0=;
        b=fD+Z/VHZ8tzekMepD11zAlQH3HlUa+ot/KmKFc+XmIpXuOJVsztU52Va1u+Of97ciJ
         jW6MWVDlbjaBqa+thR7qtKToomjYEa2HI3SsVIZOWz1pIy++8OIut8laOyi2+bSbv9Qf
         M+WdnbazYdaEdwCsjMiOYMikjwEkeIifLEbIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715040319; x=1715645119;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KlvDANCVrZHWMQYFIBtkDUG6BaCteNwh6wwcOjijmC0=;
        b=L9cMGAS8YzMdVXFJEVeGg3yu2uWRqRrcumyjyOGsJ8vOArX0SX99qQytBA9m3PTHpl
         1Zz+jOm+KymBhLSNCCwvk0Rf8hFodcdbP5TivkrXfqXF8qL2mxINGCGen5hDgPeO96JF
         2u+mxdO6C692EiWDWBypldC1pa8Be7DdrD+TxJeft+fccj4dp0OkBcBSLYYmrqe3/1kq
         JpegPT7G4pnTeBSX5u7AmmZyKLZnjspDg1bIZ10xZmHhiKmEQ4rJQhN5ej9OnYFKjE2M
         8cXLVooyfIs93AcXvjKZH8cPhAhoomWsaCed2gEHUD4VAeu7uyjp00jPfdwxSEk+iPIi
         cHmA==
X-Forwarded-Encrypted: i=1; AJvYcCUkMyr/EA5idshhhQJhGMkGU/fZJiB9qYgip+p7cs6+JhtV19GIBHFRSdh6UGFVkXkt3k+zY/xop2c//923iEsThcWJxQ==
X-Gm-Message-State: AOJu0YwcYjnzcIuU28c+o7/rYuWoklscyoDCL/aINC/Od9yO3gxULysu
	1/Wph/1aZdU75GA9VM0KEm0RIqyYeJ4ToQMioZ0pQODGehgy/qUKxjo/cKQb0Q==
X-Google-Smtp-Source: AGHT+IFhCMIL115zdj8pY5gtzUEO5BqoE/SHP70FTQHqPl7M/NDkraWKJXcYOem7iaZCavnsw+unMA==
X-Received: by 2002:a17:902:eb86:b0:1e4:a667:5528 with SMTP id q6-20020a170902eb8600b001e4a6675528mr16349817plg.3.1715040319219;
        Mon, 06 May 2024 17:05:19 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jz7-20020a170903430700b001eb17af8493sm8832219plb.184.2024.05.06.17.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 17:05:18 -0700 (PDT)
Date: Mon, 6 May 2024 17:05:18 -0700
From: Kees Cook <keescook@chromium.org>
To: Fangrui Song <maskray@google.com>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yang Yingliang <yangyingliang@huawei.com>, kernel@collabora.com,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] selftests: exec: make binaries position independent
Message-ID: <202405061704.DD3AF674@keescook>
References: <20240416152831.3199999-1-usama.anjum@collabora.com>
 <202404161027.63F4D4FDEB@keescook>
 <CAFP8O3Jjkh0U94CbS=epXELMtCBpYt4fGejX3spH4=GdF7zVSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFP8O3Jjkh0U94CbS=epXELMtCBpYt4fGejX3spH4=GdF7zVSw@mail.gmail.com>

On Mon, May 06, 2024 at 04:30:27PM -0700, Fangrui Song wrote:
> On Tue, Apr 16, 2024 at 10:28 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Tue, Apr 16, 2024 at 08:28:29PM +0500, Muhammad Usama Anjum wrote:
> > > The -static overrides the -pie and binaries aren't position independent
> > > anymore. Use -static-pie instead which would produce a static and
> > > position independent binary. This has been caught by clang's warnings:
> > >
> > >   clang: warning: argument unused during compilation: '-pie'
> > >   [-Wunused-command-line-argument]
> > >
> > > Tested with both gcc and clang after this change.
> > >
> > > Fixes: 4d1cd3b2c5c1 ("tools/testing/selftests/exec: fix link error")
> > > Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> >
> > Thanks for this!
> >
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> >
> > --
> > Kees Cook
> 
> GCC versions before 8.1 do not support -static-pie,
> while https://www.kernel.org/doc/html/next/process/changes.html says
> the minimal version is GCC 5.1.
> Is this a problem?
> 
> If not, and CFLAGS is guaranteed to include -fpie/-fpic/-fPIE/-fPIC
> (PIC), using -static-pie looks good to me.

Should we use this alternative, which may be more portable?
https://lore.kernel.org/all/20240504022301.35250-1-jhubbard@nvidia.com/

-Kees

-- 
Kees Cook
