Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31D015EFDF
	for <llvm@lists.linux.dev>; Wed,  5 Jun 2024 22:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717627520; cv=none; b=SPS9O+ZYbnZRUfHLmQ02wFTAKe4tuBOBlWuuUhZSo1QjhY23ZKyXl3leRUTpkAi3M4BzqRYHasIdv04SfQNP8QrS8wVbymPm4N9owwjj+NXNdL2gSGNXU9cxyOAFFKyxa0gZULZzdOwXmovJ0Ns+3EOERRc13VNwSNvHrZCtQK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717627520; c=relaxed/simple;
	bh=j5XNJ7qUSi4GOebAuUL6hEQaPBtrzJwnimSGC15Ifv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOdySKOYDhG4ea1sgU6VITenLDDThNyFm+iFGX7rjlnnnmwdl9Rnd8+7rMJpjyANX8f/hzBf79q5C3dA4Lg30bNqdT159IEailWEqk9pC0iibSYncNfe8mZJcbvbcUpLTAautmGz0Tfsx/gatRPEmiJciQN9hiE44XVEBXhjvXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C+P+aDSV; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C+P+aDSV"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-6bfd4b88608so248900a12.1
        for <llvm@lists.linux.dev>; Wed, 05 Jun 2024 15:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717627518; x=1718232318; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WFSJCEy6u4uqWSm/uIbCw8MODebn4cqaARhTPhnxhUo=;
        b=C+P+aDSV5laCwubhq0ue2+2Lzia4fhnMZg+lI96aDbZDELHP/tKLX4KE5d86xa3vUB
         nLIJ4dhMWvu8jf6WzPIwYwBXV1lQLic9kJNXz/1fDhLs++mIa68tarCpMFfRIylL6hfd
         s25p9G4HIfvBPykRnQcACfDT3YT8n3a2lRZguDE5DhbpBGsiQO1lUDJFZ1+3LS1R6btv
         knJzmFrXzwE0BiInB3vCvI5KDzO40kyzoi8ZK5ctu8EPoavJQK8/COySfh7bHAPJrlQu
         QXCpM7NVhWocqCpj2gbPBJQH4BIVY8zv70lQqZbgmJbaiHUuNaBJL/q9lzAALPfeo80o
         Xk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717627518; x=1718232318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFSJCEy6u4uqWSm/uIbCw8MODebn4cqaARhTPhnxhUo=;
        b=TlNo4RwBZq5iIRGNS7+FmarNeVqVTYko7oXbAhz5jq0oY6ASK83c3d04IM5oK/eiLH
         q+zE1r7wiFXwYc09pwc0g7H1RY3CV95Fu63aWpUuTO+/jJwLlo9f+vtpPqntAlectydN
         dWDLSxQftA8DPoeymAEe8HqFIVJxMzalB2KHfWU+tGnybX1wAJ5Z1t6u5Z3O8XuwOLXm
         Nf0oG9gvu7WdUNLguPhK+BeCXnQ7TgDRxMXiI9DplmlbGRtWzbYvVsB4UZIi2BDniwcS
         fTZZfC7DN+kqCq4ZlmoKvkn3giUKwbvwYpi3DtwSjgdj8leq7dRdfHpOio9Bug6uEPaY
         rn5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3hdAVw96Z23nntL0oi0k4iYFJJdMRybAQ+bwKTMpeWsPYQ1PmGsezfeV3gC6tZeEgnU1aLOBZZSt7QjVOrtQ0mmVrxg==
X-Gm-Message-State: AOJu0YzxsWKegwJRHSnfYJGGIJ4z3taijpl3Q95xePQaHIof27OVpnFS
	TIilmz/K8B+0zZYldVW+o3xD8V5jm+95DQz31njUszo9HRJgM0DW/AhIgpbpiw==
X-Google-Smtp-Source: AGHT+IFjCDvYFFF2wgJdE13PmmXi1cL2xUEC6TiDuuPu1y0FqnGaQUW2DXAfSAA3tRUDfbCP/YT6+g==
X-Received: by 2002:a05:6a20:2590:b0:1af:d4dd:65e5 with SMTP id adf61e73a8af0-1b2b6f94b13mr4916867637.21.1717627517578;
        Wed, 05 Jun 2024 15:45:17 -0700 (PDT)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd4f8847sm16039b3a.171.2024.06.05.15.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 15:45:17 -0700 (PDT)
Date: Wed, 5 Jun 2024 22:45:13 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Edward Liaw <edliaw@google.com>
Cc: shuah@kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@android.com, llvm@lists.linux.dev, linux-mm@kvack.org
Subject: Re: [PATCH v1 1/2] selftests/mm: Include linux/mman.h
Message-ID: <ZmDqeakspyvpXpLh@google.com>
References: <20240605223637.1374969-1-edliaw@google.com>
 <20240605223637.1374969-2-edliaw@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605223637.1374969-2-edliaw@google.com>

On Wed, Jun 05, 2024 at 10:36:34PM +0000, Edward Liaw wrote:
> thuge-gen defines MAP_HUGE_* macros that are provided by linux/mman.h
> since 4.15. Removes the macros and includes linux/mman.h instead.
> 
> Signed-off-by: Edward Liaw <edliaw@google.com>
> ---
>  tools/testing/selftests/mm/thuge-gen.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/thuge-gen.c b/tools/testing/selftests/mm/thuge-gen.c
> index ea7fd8fe2876..034635317935 100644
> --- a/tools/testing/selftests/mm/thuge-gen.c
> +++ b/tools/testing/selftests/mm/thuge-gen.c
> @@ -15,6 +15,7 @@
>  
>  #define _GNU_SOURCE 1
>  #include <sys/mman.h>
> +#include <linux/mman.h>
>  #include <stdlib.h>
>  #include <stdio.h>
>  #include <sys/ipc.h>
> @@ -28,10 +29,6 @@
>  #include "vm_util.h"
>  #include "../kselftest.h"
>  
> -#define MAP_HUGE_2MB    (21 << MAP_HUGE_SHIFT)
> -#define MAP_HUGE_1GB    (30 << MAP_HUGE_SHIFT)
> -#define MAP_HUGE_SHIFT  26
> -#define MAP_HUGE_MASK   0x3f
>  #if !defined(MAP_HUGETLB)
>  #define MAP_HUGETLB	0x40000
>  #endif
> -- 
> 2.45.1.467.gbab1589fc0-goog
> 

This makes sense to me, particularly when other mm selftests are using
the same include pattern.

Reviewed-by: Carlos Llamas <cmllamas@google.com>
