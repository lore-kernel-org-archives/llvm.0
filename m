Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7173D1869
	for <llvm@lists.linux.dev>; Sun,  5 May 2024 05:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714885992; cv=none; b=LZMQFnF1ixRclciVQrqwxoQs/dW0IKmyk2CSb2YN9EgIjwA8AN2jLoradBSl5R+NNgsrz46HT/l/Hua+ubQNnPIzhg8l2Jus3m/UhWfpcADM5ev9yxzhiVjFM1biuH2hcC+F9fMqFlBWbW6f2G/3aw4bklI6HzzMb2EhaaxS3Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714885992; c=relaxed/simple;
	bh=lehZe/7AZUPc+TY69M7+JDOOMjWhzo3PGggFRdj3IxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ueOIYktWdD436K+XIiVVHDfzWGktBQJ953XJKFub965y1a75KAsOk8KI/TbBknApTLyrbHCO0/i4KGsz9YwhAPLrs5l5ZAp8QnrysOHKWX1hTmZs85VsBwQYoUMKrMEN3stOY7EZm2tsHd6XFZn+aSoUdBD6siW0b+i1JoZ/liw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JTscZUcD; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JTscZUcD"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f44a2d1e3dso765130b3a.3
        for <llvm@lists.linux.dev>; Sat, 04 May 2024 22:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714885991; x=1715490791; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NsfIaMjECuvVC7Z9W0Sqg9Q69W+YCDdoNBcIXl2QIwk=;
        b=JTscZUcDwHg1XQ11sB1v0Hja0cgPZy87gf4XJTzgCvP7VZpfzSRH/VLEUdneBy2DlI
         BZaz7tJbwdCN+wKSkkG748z35+lp6/zEoLSpebWWjYKa+XPq0npXHn3ndZJorfcnX2Yk
         j7FeYPFSCb5GegJSDpRsgJiiB92UG2MCz+KFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714885991; x=1715490791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsfIaMjECuvVC7Z9W0Sqg9Q69W+YCDdoNBcIXl2QIwk=;
        b=Sb+KEysT80vHD0VDlcy4/1wsjG5lfS1KwKKrOitH060NEkNWL8yPvtwhG+kINycg5R
         GymT05lS9YFfcIbNQtbJU5UY4Pi8ZkMVJ1M/+RhAemrpbQh6ttf8S/HaHmhQd56m9NtZ
         th9B1iWBX8n9AEXLG5jpn7BJeVQA3yQbdrVzp6khUvWFs85JbhnOv3YWhLkcORdMqi7o
         6Y45c9NEs98GSG8Cnjm4JkQT1OtJw8HC8PWstGcWEEbWdCsW2vOBtmdN7VJjexZM6gEX
         SNr7nBmxtw/2DgFS0wA4dTdPPXLcVgWVc+E+DnaCHi+bq/QcQVCJi9oxoACfZehlcbq5
         mgHA==
X-Forwarded-Encrypted: i=1; AJvYcCXev94EcbrOTgMVlirfoY703s+ZOzzpZRtmbgdMhj8wzYUMwB8226Aka9aE2ZUA+0KOVP1D3mm0FeFkpKORQTBZLDze1w==
X-Gm-Message-State: AOJu0Yzhr/3McrRw08lUP38dVYqGvy1bDotZWl8HT2n2dF+TVgqjro/c
	SNN2ew00nLIsxR9gJy23oNzQKCt5Omhdpls8MVJF3bT4dR/qlwvB1rjw7RKK5A==
X-Google-Smtp-Source: AGHT+IGx2K+j9TsopgjG/72ja+WbDJMY4Wn9iAnqvKY7ERj2M9PxcHA1IZC2lVKSrAM72Djm/H4zqw==
X-Received: by 2002:a05:6a21:3405:b0:1af:8fa8:3116 with SMTP id yn5-20020a056a21340500b001af8fa83116mr2671010pzb.42.1714885990672;
        Sat, 04 May 2024 22:13:10 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8263:3b89:bcee:2ed4])
        by smtp.gmail.com with ESMTPSA id jw19-20020a170903279300b001eab3ba8ccfsm5839237plb.285.2024.05.04.22.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 22:13:10 -0700 (PDT)
Date: Sun, 5 May 2024 14:13:05 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Minchan Kim <minchan@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH 08/14] zram: check that backends array has at least one
 backend
Message-ID: <20240505051305.GB8623@google.com>
References: <20240503091823.3616962-9-senozhatsky@chromium.org>
 <202405041440.UTBQZAaf-lkp@intel.com>
 <20240504071416.GH14947@google.com>
 <20240504161004.f5a0aab5e5aa1033d4696c20@linux-foundation.org>
 <20240505043957.GA8623@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240505043957.GA8623@google.com>

On (24/05/05 13:39), Sergey Senozhatsky wrote:
[..]
> > I guess just pick one if none were selected.

How do I pick one if none were selected? Does Kconfig support
something like that?

> : config ZRAM
> :        tristate "Compressed RAM block device support"
> :        depends on BLOCK && SYSFS && MMU
> :        select ZSMALLOC
> :        depends on (LZO_COMPRESS && LZO_DECOMPRESS) || \
> :                (LZ4_COMPRESS && LZ4_DECOMPRESS) || \
> :                (LZ4HC_COMPRESS && LZ4_DECOMPRESS) || \
> :                (ZSTD_COMPRESS && ZSTD_DECOMPRESS) || \
> :                (ZLIB_DEFLATE && ZLIB_INFLATE)

The problem I'm having with this is that FOO_COMPRESS can be M while
zram needs Y.
