Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9094223F31E
	for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 18:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733943257; cv=none; b=R5McOz82EDs7CBopiFckbH2N/QV3GggaMnzdyX53ApX/1WkEHqgDimaZ9uBhyn8O0b3ilptwojfYx+QUjOkdSWqSV37/y6Tq57Uq+FHKtlcj86R2AoFGT5+sp0WpyroDhJDwZ0vr+V3fhWysWBv8qheN/bB0xJD31HgAOZqMJYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733943257; c=relaxed/simple;
	bh=ytIXkitzIgnaQXw1DgIpHBXtGpsP36TUADendYz/D8w=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=ZbDEAgJzUjDShsvAX6g1GLkc2URco/A3UQ1LGrUAE8Dg62o17d6tfJ0C/Wd5tc2/aDP/0o41+/L9Bt1J7f8byWLtxzJuFCQQUT1DVN1xHF8z4axUKCaCMuGfBHuj27Lo1IgfpYT9qy8dhw+a526rbxraBf3lsZ5nHUl5fWxntSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=EC5Ssgn0; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="EC5Ssgn0"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4675fc06969so47089451cf.3
        for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 10:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1733943254; x=1734548054; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XevGW6C4cKdzpoiOoSBk/jtqXJQOxnp3pV3eD14Kncw=;
        b=EC5Ssgn0tixE6Wriv50p+CA5qmUZE9L5zG0VwR4a3JlH0Ak2fuEl2mfsHExS5Y73na
         3KSBE1lnw7wr9gtuLkQyybuBoscv77z/2iNW9QER4rxmyWA4v9L0FfCZkT+qzEn4S1tx
         TuneRH15M022FTEvC6cEatX+tP/GOjeqpFwPRmmOXA6+syWDqG95qjka8vx2RmOCOtuZ
         eBls0A4E4FQnrUTU8D4CfTqKSrP7RRJAHa3CbOqyiCvbO8CeTS8wZOd9GUFJLXTTw+x9
         w4j9n1ssPCcRrwJ05+KjCdPxbGeJg6knW2NmiFLLQM0tjyMxhJNMdc4aewNQL549clwQ
         CBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733943254; x=1734548054;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XevGW6C4cKdzpoiOoSBk/jtqXJQOxnp3pV3eD14Kncw=;
        b=eL7+kiIRZq+g9W/t3QsThszu28juZkDT4QqCfa2UZaHJxELcwkPZKKyCMtGQcLyMKg
         mlufbZs+aiMggh4pPUZFc34NBRy+o+P5aADl7nFfCOh1Uo3uxElj8NWA55cowDjbH03E
         XqPAKvYO07GxsgJc27BeP0TuNrhtab5yWxQbg0VzkApHHTorFFpsUNeCnWuQsSIQrD6b
         fbJsKmF+LpvjSHn5bR9OIIuWOIRETPod4YYMELGeZXEeKoBVbGF+8afppznUW+Rsp1/n
         QuuJ4YPZgPF3/1A7h2CElyUMdmpsp++mATMEKvH22pTCWD/RRPPTKfUZQhILEhH3+fPS
         RhBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfq33VregwR3wa8+QAmkAWiaHUmhITV0qMvay4lRrhG/3X40LmwirKzNkCrNiSJxZuUXM5@lists.linux.dev
X-Gm-Message-State: AOJu0YyCBMYVG9Qh8uICUq4EPdmauoOY3bidTFVvqIjscEFLJ+qUkvdj
	FjEMgMou6S8DO7Wqr/mfC72jmS3pc/JrYLe8/PRN3Qb+Rd3AJs/3GCFTdR4gqw==
X-Gm-Gg: ASbGncuX2AWRERJNWfC4h0qFNfBsrhDmRgE9DDA+eZCKT5usQAxk5rOOmzdzN/jWl1t
	1jD+xN0u4dpmWY8Sw2CWTk/eybcaSQBJhwu0X4IBU91kIMq0jTdtrRdS1wgNUa9xt3a+XI56pIe
	MEGJ6LUnJoqsK9Bcuc/S3Glw7jQ0sWIL+6pYhR3IMVCoGOglvODqWwA2HYQXbYDcfIwF23WjXfx
	n621o154prqipR4/N0MveaAOdCsowTGHDhuDVJsk+ILXV80
X-Google-Smtp-Source: AGHT+IFZrtArQk5gSvhPTSsM3vS4f/5WaozCWQBNYMA0H/wDIeqaekdqq8xGvtO0/3PS/0d/l016Gg==
X-Received: by 2002:ac8:58ce:0:b0:466:b29a:9b10 with SMTP id d75a77b69052e-46796234999mr7410631cf.42.1733943254155;
        Wed, 11 Dec 2024 10:54:14 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4676a25e32esm31050801cf.21.2024.12.11.10.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 10:54:13 -0800 (PST)
Date: Wed, 11 Dec 2024 13:54:13 -0500
Message-ID: <e43da8418fc54a5eba7cdbb594b24bb9@paul-moore.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20241211_1304/pstg-lib:20241211_1304/pstg-pwork:20241211_1304
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] selinux: use native iterator types
References: <20241125110646.50799-1-cgoettsche@seltendoof.de>
In-Reply-To: <20241125110646.50799-1-cgoettsche@seltendoof.de>

On Nov 25, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> Use types for iterators equal to the type of the to be compared values.
> 
> Reported by clang:
> 
>     security/selinux/ss/sidtab.c:126:2: warning: comparison of integers of different signs: 'int' and 'unsigned long' [-Wsign-compare]
>       126 |         hash_for_each_rcu(sidtab->context_to_sid, i, entry, list) {
>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     ./include/linux/hashtable.h:139:51: note: expanded from macro 'hash_for_each_rcu'
>       139 |         for ((bkt) = 0, obj = NULL; obj == NULL && (bkt) < HASH_SIZE(name);\
>           |                                                     ~~~  ^ ~~~~~~~~~~~~~~~
> 
>     security/selinux/selinuxfs.c:1520:23: warning: comparison of integers of different signs: 'int' and 'unsigned int' [-Wsign-compare]
>      1520 |         for (cpu = *idx; cpu < nr_cpu_ids; ++cpu) {
>           |                          ~~~ ^ ~~~~~~~~~~
> 
>     security/selinux/hooks.c:412:16: warning: comparison of integers of different signs: 'int' and 'unsigned long' [-Wsign-compare]
>       412 |         for (i = 0; i < ARRAY_SIZE(tokens); i++) {
>           |                     ~ ^ ~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/selinux/hooks.c     | 2 +-
>  security/selinux/selinuxfs.c | 2 +-
>  security/selinux/ss/sidtab.c | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

Merged into selinux/dev, thanks Christian.

--
paul-moore.com
