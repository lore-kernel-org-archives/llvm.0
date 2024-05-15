Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263233B28F
	for <llvm@lists.linux.dev>; Wed, 15 May 2024 05:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715749632; cv=none; b=GuJUctQf00JJwWGj34mIZJ82jRmyutLKUTH+p9GrLNPSUHQJLCh4CNDoWjEQo+Lm96IV61hMDJtb6SdNYsLKolipERf0YPF82weqdQD5MLYQRnnuOEwM6ykudM9b63PJhBlSOQ7dwUbwgcPA2b8gr8n7vX5wEHfUgYuynmmSnGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715749632; c=relaxed/simple;
	bh=r22Ecb1HjRi1JsHgO9EEQEtHjCyx+qtUYvZ4+U2lkZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJREEpOyYzGL8Hfo/N+hm+TviaxloswSuZhbrGLfaI144IT49fZ5K1xw42HSG8iW+FrR0wO+Feuvcx6NOD6Bd/xaU5nN54UMI46ML2z7ogsRDD5wZni3w3hLkYnpX5P4nuO+rHauWZgUg04Gjot6C9SGMobzXaQnnTXjqSrxHzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bmxnd/Il; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bmxnd/Il"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6f4178aec15so5489025b3a.0
        for <llvm@lists.linux.dev>; Tue, 14 May 2024 22:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715749630; x=1716354430; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SzRi7BBK8Kzi4+jUS/kWK3iSCsA+f0xRAjzzQIW1Bf8=;
        b=bmxnd/IlrXluJ3UE36C8bJrueXW4pFbg5rlexbyi1wun29AMzjpZFcwc42N8VYanoL
         jze9C/3fTDHm02+Mn4cGAo8WE4CAozzpRGbOQDyCV44TqBjUFz8VQi4YocugqfNhhdrb
         bzeV+nInA3Stfy035kiGgvT8BS2utaQmXH7YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715749630; x=1716354430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzRi7BBK8Kzi4+jUS/kWK3iSCsA+f0xRAjzzQIW1Bf8=;
        b=kRifjlvZUS4dpYt3KAgQ77moBR3EagbO4iPbiUMYc4Q+/AP2srsxJispN3fVp/mreq
         fMn3OpBbtNUVCZT3r2q8bub4egsFtkRUlX7lZ3eNvtz1Udm9xzvIow1RiFXrkUE8ISmN
         WY4y9xnSieBuQBLWnlACIM88rzg8f//DtaBIO2TqXFqIRlscGT5n//MwTATqWTZlv607
         I2lN0b2sUXk3bPI3CnsQugCwiad6gnozXnj7thIH9Rm3s87o5eQopAVG2ryx3k1cThSA
         Lzo/mFxaITc8zxINSzY0wjWF9LPNV9Z/ef7F5ed7SqG1EFOJAR/FJwHz+2HspU/YHXHR
         c+Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUROVVwgTxCQ//fePoTnSC4zzUU1viJCnmiXlYj8VK5B/69yU5WdOKKwAQ2opQIyEYhE94G0FanqhW8AEEKCXw9lWkDZg==
X-Gm-Message-State: AOJu0YxduSo48/htfTGrNwxVX5A4NnSzYmvleROUj32diM1nM+vj+Ar8
	+LVPgcAqB2oiA6ank6nr034FRCxDp7DZtIXtV/wKbX4A5J7SCnmCFjruJFkywQ==
X-Google-Smtp-Source: AGHT+IFzghujq4lUG5F8pX/TiqRbgCGgm0mozqz8fwsdeFoDVeXza7aCH/TT4k7CROrcXZWoBRaIoA==
X-Received: by 2002:a05:6a00:4f86:b0:6f3:e6ac:1a3f with SMTP id d2e1a72fcca58-6f4e02ad970mr17673879b3a.11.1715749630446;
        Tue, 14 May 2024 22:07:10 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:111d:a618:3172:cd5b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a663aesm10092200b3a.33.2024.05.14.22.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 22:07:09 -0700 (PDT)
Date: Wed, 15 May 2024 14:07:05 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: kernel test robot <lkp@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org,
	"linux-block@vger.kernel.org Nick Terrell" <terrelln@fb.com>
Subject: Re: [PATCHv3 02/19] zram: add lzo and lzorle compression backends
 support
Message-ID: <20240515050705.GF950946@google.com>
References: <20240508074223.652784-3-senozhatsky@chromium.org>
 <202405091921.320BxOyE-lkp@intel.com>
 <20240510053333.GJ8623@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510053333.GJ8623@google.com>

On (24/05/10 14:33), Sergey Senozhatsky wrote:
> On (24/05/09 19:23), kernel test robot wrote:
> > config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240509/202405091921.320BxOyE-lkp@intel.com/config)
> [..]
> > >> ERROR: modpost: "backend_lzorle" [drivers/block/zram/zram.ko] undefined!
> > >> ERROR: modpost: "backend_lzo" [drivers/block/zram/zram.ko] undefined!
> 
> ... and that's how learned that my .config has ZRAM=y

This has revealed several problems. First, lz4hc misses one symbol
export, an easy fix. Second, zstd misses pretty much all of the
advanced c/d dict, c/d ctx API that we need in order to use dicts
in a module. I have fixes for both in v4 on this series (I'll Cc
Nick on lz4/zstd patches). I think I'll just send out v4 today, simply
because there are patches there that we can re-use even if we scratch
zram backends and continue using crypto API.
