Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DE5156993
	for <llvm@lists.linux.dev>; Mon,  6 May 2024 17:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715015392; cv=none; b=KiFj0snDmIXeQmEFPO2fyuoNw4XIzTsjpNAQp3QnyP5+mcUwHk0L00mE0vUv/7zuySRJp3r+t2meviY7LI2joWQk/Gi6WIiauf8L50rdfslXtqJ5dOYLHoRH5SamZ/Tnm17MjQUoDWJ9U1mi9hwYxAQrEFLQNYl2mMK1Ti3PChc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715015392; c=relaxed/simple;
	bh=FPfkrT81hp7EWZ9SSFPVunnBkdnOppvnIkzF9q8A2r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NeBdH+xaEaiJX/2BQINb/+GxlZnqZjYeVSBsOZIniBQ3KbBXhsIo7riC5oPcubjQlPEPkQTPGUuVjTOyk5moSCKAyzKWSpFfOup597BlXNB8jMT71pCsgtwNJ6tjjqQSGKZJkCPRcJz6wImeV/x64ecXaek/AaQouu7RdmGcWM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kctBthOC; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kctBthOC"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5d3907ff128so1748408a12.3
        for <llvm@lists.linux.dev>; Mon, 06 May 2024 10:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715015391; x=1715620191; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mdReYnfYpXbw8UTYqzLrE/VJPRPi8vsKw/zSYHi1u0E=;
        b=kctBthOCWPKvrAf0Yk1WsVC/zKSGoDteeY0tK9/Lk9s37b5L/B4OxJDLqAlzAqFCAU
         3pG+279PXmoqP2IvYqbt0TN8heavBk1cNuKByAceLqjNoTCZtRI5NUJMANIgnUSTsnBZ
         QOemJn2BUjUJR4DODq2BAxA2iMWRN2CjUzMyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715015391; x=1715620191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdReYnfYpXbw8UTYqzLrE/VJPRPi8vsKw/zSYHi1u0E=;
        b=kaGAO9UK0xlcB9/0desgrKs5tim00XSL5rE1+1fDON3k144WW85XDOQUYmUZ4I5orB
         a78tqi+RRi9PmLTDK/KhtbDNU5uv9NCybaxJS2ig5OEh5kSojchXo/tywe8at522NI+y
         eoOQjQ2xFtskNZqC25PAJVnWBXrk+nCA4ZHZEfQfSgG8/SqDqcbQhtNYkgWTzQLJfq5E
         as95ZBf4o8hOPMM2zYzl5oJzN9IGcZcLn5jBvyH0ij5isWuD61KxgzTKY8IvS6+ZX23K
         FMby2I8+wyNQU4CvObHGQ7Bj5iDHCFSLR9z18ZyyKU6I8Qj0pftqpaIFru5QKp3OkFTv
         gDLw==
X-Forwarded-Encrypted: i=1; AJvYcCU7Kpolf2nTXpKEXLQCujPNtjj2ZOWuz/IkMrmjjYlMt6+f5bOU8JgZuhX5V0SZ68mI3ftX3TUVhOalQV9cPxNKZbrg5Q==
X-Gm-Message-State: AOJu0YwK4wm+AtNNb0nXAGKgxqI99axwmaJqUl0IRLeB6ltQDLlwcigm
	ur9KQY/11FMlHqaxTRWSAjU3tp8tRE+2lQvpkmPaphZndklnPMJqtnefToLf+A==
X-Google-Smtp-Source: AGHT+IGxUieIOzFQ0Mko83hxGUk+gEzoGxA/1Ap+Bl/r+WCemjUK5IeIzFbSjiBsICA7ksrrUH4MtQ==
X-Received: by 2002:a17:90a:d496:b0:2b4:3679:183e with SMTP id s22-20020a17090ad49600b002b43679183emr10938107pju.21.1715015390728;
        Mon, 06 May 2024 10:09:50 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l9-20020a17090add8900b002b269962606sm8407951pjv.30.2024.05.06.10.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 10:09:50 -0700 (PDT)
Date: Mon, 6 May 2024 10:09:49 -0700
From: Kees Cook <keescook@chromium.org>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Shuah Khan <shuah@kernel.org>, Eric Biederman <ebiederm@xmission.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Mark Brown <broonie@kernel.org>, linux-mm@kvack.org,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kselftest@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH] selftests/exec: build with -fPIE instead of -pie, to
 make clang happy
Message-ID: <202405061007.F1A46E89@keescook>
References: <20240504022301.35250-1-jhubbard@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240504022301.35250-1-jhubbard@nvidia.com>

On Fri, May 03, 2024 at 07:23:01PM -0700, John Hubbard wrote:
> clang doesn't deal well with "-pie -static": it warns that -pie is an
> unused option here. Changing to "-fPIE -static" solves this problem for
> clang, while keeping the gcc results identical.
> 
> The problem is visible when building via:
> 
>     make LLVM=1 -C tools/testing/selftests
> 
> Again: gcc 13 produces identical binaries for all of these programs,
> both before and after this commit (using "-pie"), and after (using
> "-fPIE").
> 
> Also, the runtime results are the same for both clang and gcc builds.

Thanks for this! It got solved differently here:
https://lkml.kernel.org/r/20240416152831.3199999-1-usama.anjum@collabora.com

Does that work for you as well?

-Kees

-- 
Kees Cook
