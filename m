Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF22130ADA
	for <llvm@lists.linux.dev>; Tue, 16 Apr 2024 15:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713280983; cv=none; b=tSyGXHsykcQAoId4QxDxZcppw1YOPXZc1r0oZIvDt3kAXaTasBlSfrSh3sXyZOaxA2bWQ4LIdl/nj1kboxAJZ8QM/2fWy7siXg15e37P++7Bwwjr99ikAWcEjfxz2lOVr1hLmcO+Nbh0W0Lp2sOSwlNfSDWMc2/+AEvbBxI1khc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713280983; c=relaxed/simple;
	bh=VgjJ1sQnYJM7vPGFLgOyl5MiheSdj8kCxc/E8B7aS+o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T1iLOyqwdNt5pwa7o7dkyxkr/50lciCZEpw+MqvEshP3ezBwQAJU7s1UmA6Rxyt5R5qPq2o5Q470rlZe8mbB1jyo+lMXKMr4CMkQrllkmOPMDW/88vJRtpo1iR3qT96DlLb58/7C0eg9+jqwFU+airiZbnK1I+A/uNl3oakaDQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ttR1ECF8; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ttR1ECF8"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1e604136b6dso23205125ad.1
        for <llvm@lists.linux.dev>; Tue, 16 Apr 2024 08:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713280982; x=1713885782; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zno1kdsfWaJ1DeTq0hPq9ZAZ6Z0lEil6bV0PacUdpzY=;
        b=ttR1ECF8fN9oFHHH8b5nZwGrLuqN+4GMnl9tTXb6oqYXXd4vgZzBF3bnYCQn50rexv
         Tt+Kj614nbxdZ9yXt7svhONVq04YpjNbQnCshf3Clu0ZY7eMnglnuYx68XLr2qvPQ4Fx
         JqOpKbbOt08P3YXkd+cKW5rOQUThIxLAzdgcvdXbyubuKLQu16cqeO5yZQyPmhhyG6ii
         jz0iEtxhVnxsS/Ebat5+u3meendGuZy8Fd4rbG0LI4e7d5Ss5LAK93BY4TBsIUqdKZV1
         vF07WicR/p7tiEpq3Xm7UI5Fr58rPavlzZWfMeFQ0uDxweEVs4b49gDW/ASvw3RyiVzl
         3vGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713280982; x=1713885782;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zno1kdsfWaJ1DeTq0hPq9ZAZ6Z0lEil6bV0PacUdpzY=;
        b=Ef1O0MvW8/exis8tCC71wi0gHYDhZCwnzHrBUoZ07CgEFKR84mvJIwWieOnc8ZyPga
         XlIdcy0kW6WphmPWrcDIcI+onwukLQnn0zaNkNnj+NdAQhXO54K/h+n7Vh43hr4ur8AI
         6KB4WUwTEqHPa5r2w9uYYU1UfJWDiECLfqc3kMco2e9GRkp228Aca6nQ/d310kWvgUL+
         1XatDoIBqjaxgBca6CmOrpL5UYpQ8pbdP3njS7bOzdug1qC0N8Baj3HpdyD15EkIz3DT
         4F6NZEFg/ZuUU9Bsk/rj9yzamgBG6CLo1q6C41s8Uw7N5XgHQu6jWz66Q0aGH6yLhC6S
         riVw==
X-Forwarded-Encrypted: i=1; AJvYcCVgQyRI7IpM7/6uYVPeGgyiPBxJGY5hCy68Lln2RFWxyKbgUJchxYe7ZrzPNGRSFeQ6e2fBobOmRYCdMqrDxjfe/1I1Kw==
X-Gm-Message-State: AOJu0YyeLsGEPJBlO/p6xnXao6WHGLK1hApHqJxUs4oWpOU9EYjW+OXf
	742F3+X3ynSCu+okDZaJboRo0c7Zor4LJ++D9tJQWI6xnJ+pJWzhCZVvGLvZyJkANwWHi28SDE/
	cpA==
X-Google-Smtp-Source: AGHT+IHT1pC5s1cugeqIXTNqxkxUA1cuAiRf5voHQMAwSwbg8G3jOgahsrnw3GT8HRend6+dNGkM2RXcehg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:1d2:b0:1e4:5896:55fe with SMTP id
 e18-20020a17090301d200b001e4589655femr374739plh.4.1713280981894; Tue, 16 Apr
 2024 08:23:01 -0700 (PDT)
Date: Tue, 16 Apr 2024 08:23:00 -0700
In-Reply-To: <20240416151048.1682352-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240416151048.1682352-1-kuba@kernel.org>
Message-ID: <Zh6X1NkQJd6ETTo7@google.com>
Subject: Re: [PATCH net] selftests: kselftest_harness: fix Clang warning about
 zero-length format
From: Sean Christopherson <seanjc@google.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, shuah@kernel.org, keescook@chromium.org, 
	usama.anjum@collabora.com, linux-kselftest@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 16, 2024, Jakub Kicinski wrote:
> Apparently it's more legal to pass the format as NULL, than
> it is to use an empty string. Clang complains about empty
> formats:
> 
> ./../kselftest_harness.h:1207:30: warning: format string is empty
> [-Wformat-zero-length]
>  1207 |            diagnostic ? "%s" : "", diagnostic);
>       |                                 ^~
> 1 warning generated.
> 
> Reported-by: Sean Christopherson <seanjc@google.com>
> Link: https://lore.kernel.org/all/20240409224256.1581292-1-seanjc@google.com
> Fixes: 378193eff339 ("selftests: kselftest_harness: let PASS / FAIL provide diagnostic")
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Thanks Jakub!

Tested-by: Sean Christopherson <seanjc@google.com>
