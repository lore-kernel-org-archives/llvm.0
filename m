Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F715217A
	for <llvm@lists.linux.dev>; Fri, 10 May 2024 05:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715319220; cv=none; b=V9+IQs4eaX66eBNl92B3kdu+xDnZVjf8jkd7hYHCGjCQ69U5rCKq2QHHGF+Js67F1v4G5zVGgKqs61b+jMM5jC+1vdmVtXf8nWEz1NjybMD4C7sfq0vlkcj9wFIB8tewSsaUAROj2Cp9hgPE0XoQ9hFKRbzwGCHKL7+PeqEndXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715319220; c=relaxed/simple;
	bh=lNJnk/IwO5G1DeyXGQQshC+4Yf6eHRgkO8qVDqyoQL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXrBpxXnY55DfeI0aM0c+7BEir8bMhm3hVCcj0N9w5x4cUW232DwdvCLVrRXnAchDUM0bvyRpJhaD1fn9e3HP/qb/xCs9o+/SBhO8EBompxbm/7dmqr8PxFeiE8iixBkvYGgfZo0ksqC17SmBLqr/YyyJhv21QU+ui4NzUAlxmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Eeejs1DN; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Eeejs1DN"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5b27c5603ddso444345eaf.1
        for <llvm@lists.linux.dev>; Thu, 09 May 2024 22:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715319218; x=1715924018; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lNJnk/IwO5G1DeyXGQQshC+4Yf6eHRgkO8qVDqyoQL4=;
        b=Eeejs1DN0ewUgcZphznOgBgyYAPeUJYalNUQrksbNTtr38TuFMriPc8dRnI4on3zAM
         p0J75hnEDqSNfAG94Wo4jxG5olSw3augR6P9m5p0hoJ31Heuuqqi3CfvMvhO/N7xrSMm
         no0Vi6GmiG5WLIssNDjSEe17lZvYXcmEpJA/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715319218; x=1715924018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNJnk/IwO5G1DeyXGQQshC+4Yf6eHRgkO8qVDqyoQL4=;
        b=whrE/dK6ixS9TiOhhJ108BCf/Ut3ieFZSIdNgWkYSriLySmcWpArHE8qbspquoBID9
         yrA4w+GK4S2dYIdqxeDUQs8GR/DNK7nTx04sFTHVCqLZGJ3NzhcVlrM0p9QloJRqXwMf
         wJjitN7sA2nXYzz1N+qKQ2VePI5hkLnJa+SxJ95oNUPRbv8fj/ycXnQE+5ofososEuql
         vFgJIfYyjYfzEVmAmJNnTJDR/AXZtv26PrZilpuJ/mKNUPuPZFt5N9hCR9iy52sRAnsK
         eSjKonCrWTuMFIqbgTVrQ1CzTqFJtHXKZy6X2AjRtb8Dk7CGZyp6fVD0xJqG9fjghwig
         YlJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9+339mmwmpEzjcYAbllYLv1q7U5UrrMdDZzJhLRg1oEiOrhHs2gcYCaLO/3qIF5i6IbJL0ckUd3E2Xd4vSa/L6tXSMg==
X-Gm-Message-State: AOJu0Yze8FJIikRV1CAjbUFGJYq+ztRYx60fzBHVXk3u2iyOsuS2uh8q
	qFUovpkjqcid5vXXtiCMGfEIN2AFXBgEcAL7ujR0Bby3igEeARd7oK8Wc3GrHw==
X-Google-Smtp-Source: AGHT+IFCQqwUjXeObeIhefjgn08J4INBR3l9e7EL0ARvLx+ZWaw2vg+uMR0UfMEm8ujEuFv/PHtCPA==
X-Received: by 2002:a4a:588e:0:b0:5ac:bdbe:10fd with SMTP id 006d021491bc7-5b281a5cfc3mr1616558eaf.9.1715319218091;
        Thu, 09 May 2024 22:33:38 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:de58:3aa6:b644:b8e9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a6660bsm2190608b3a.8.2024.05.09.22.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 22:33:37 -0700 (PDT)
Date: Fri, 10 May 2024 14:33:33 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCHv3 02/19] zram: add lzo and lzorle compression backends
 support
Message-ID: <20240510053333.GJ8623@google.com>
References: <20240508074223.652784-3-senozhatsky@chromium.org>
 <202405091921.320BxOyE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405091921.320BxOyE-lkp@intel.com>

On (24/05/09 19:23), kernel test robot wrote:
> config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240509/202405091921.320BxOyE-lkp@intel.com/config)
[..]
> >> ERROR: modpost: "backend_lzorle" [drivers/block/zram/zram.ko] undefined!
> >> ERROR: modpost: "backend_lzo" [drivers/block/zram/zram.ko] undefined!

... and that's how learned that my .config has ZRAM=y
