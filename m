Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DD038B131
	for <llvm@lists.linux.dev>; Mon,  1 Jun 2026 14:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323842; cv=none; b=TqBwkpQlanqE2H1PaiKugO9bnwflaSfjgsDZk1b3IVtSylef5o9spw4LFo8DMy3CBttLjNwZE6UQDjHjjCOrndwzXa0hVSVYvOuUbZMhfVU1WIDhjecutsTNMOAcq3SQ3+TRpFzKvYa0sCCLyH/LIoSbKjm6HCaYOCPQP9V793s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323842; c=relaxed/simple;
	bh=qOimUxJ53KcSLGVbxV1DywR5xcf/0MPygEdvcHcIyII=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=htiZjZ97QAmjB4yrJg3X1o9Ayr3FieKQRkD8XSbP47lmaGEBLqKjLknxXoUb2G96GlXtLDjfwKZBd5zZeVYrL2PZu/oS6M5WQJKPpkk1nkjeeSeFBeaFc44Fk4fz3P07Qlw1Gr+d0FO+FdOEUMymfmNOoyf+GLgL8svjEP4j5ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=rsZoXXsA; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="rsZoXXsA"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-43b70c501a7so6661466fac.2
        for <llvm@lists.linux.dev>; Mon, 01 Jun 2026 07:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1780323839; x=1780928639; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZ21QY8dl+1eznQFP7IkNssuFzjReRTu6OvtZmgp4rE=;
        b=rsZoXXsAhsSJ53oq2OpAzEFHbTjDv7izYo9H0qGYpTxuEQ1zzuaQcVIKgRZMBVlO0b
         u1hyT9Qfpqh5x9XpWyXsL/yhgMadBHfBfzABvxVhk+t3u3b/dpWG45LEtWCO20WkPlIw
         Xm+11TOLC9wIbMyRWnbzjJlTLR8tmBcw1dO9RUHChu8VKzWcC65aROc4olseoxttWAxk
         iut1idGZEJs+tDvQFfegLrBbgIOxZUSWdqo6SUxxZdwXcjWLwzkvmomOdyoXyyqOLaIy
         e0xMc7FvPEcfRqfmOWtuLjBHNs+Rc/eOT2K6u+YnQ3kMgPQj6EzN3nwHO+yyQjWhUbmp
         xfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780323839; x=1780928639;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nZ21QY8dl+1eznQFP7IkNssuFzjReRTu6OvtZmgp4rE=;
        b=fws0+K81dILtR/48/JTX++T8ycZb4TIs1mrsLvubmovuCxuAmvAAfMtMaaGmXN3Njo
         NZdAkcvPkAAN3NJyrlQ/97eaXUvSdWq1p81YVq9rZwjaTaTmIHPEuyo7enq7rwco7gbq
         RStS1zB/3e/7luxiwkoMxWQycMEFd+ql9IGgs0pLiYa2ufa9mhuX6C6Ms0uzBB45IV0R
         QkypfYn3Gx61yxLIU133xQqbgTZjYk7KQbWfXR/s204ibk2/pU7l+2HV53pLEKxvTaI1
         1vle4QrpWZmLUY5ybBNkQc40uJFPTXlbwOZ9r3V8nZ5uZReCPEluho3kL4y5FxZK9c7s
         +IhA==
X-Forwarded-Encrypted: i=1; AFNElJ8nBg5QqeGW+Ab+AZ/OcgJmMprtGSKnVkoq04D3OVoheWnnImdFZQGFQQF/w+dzMtGdjQ2y@lists.linux.dev
X-Gm-Message-State: AOJu0Yx68Vc8WgRC/8HwgO94Kk1Bq01WyJYlonF1XcMwhJ7TWTj/nK2e
	jJGXF4B1ebYHw6c3iYfqgz9OClmgvJBW5+znT/iDGpEHXRGxVTRMFqXT5UGMj07ATrs=
X-Gm-Gg: Acq92OHYtvkV635UdVa8dd5+YxSlOKS7oa9MlFd+n4dKFPq6PCnFIVICEtLoAo9/Ge7
	JwxGRidXvgQIwmU0ZtQvwKIc7QLX/QfB+1/FiqHRCSX8fTdWldHd9I2r1epkau/ZXKETydtbE3S
	tAkBqDLtFYaTc0Lx9dXZE8xXpd33tYvMOCbN4N82KGzOtFM4TIoBy4AzJSxtKKjHDUEvGghFRaI
	Jc0AwXG7Sq4LLmrwzLn+jsWttmoU1D3JMEAAVDvbzA2x/3BMaJhLRG20PiS4hSNhcRWyHhW+nBq
	4sVhsjMPek4phSP0xHEXFqkW3KH3NzYcFQNVfNrhEolUzNzQUWJmH1mYL3OkLXmTUyuxv5AKMX+
	mJXSil6utAS4gJHX8AloepzJpJX4qgTMIjT7tXuZltpZMF4D2zzxxoEs2wSzLvM9yCezZUbC+U9
	xG8lssmxXuH6Upsbh2/k05k0LJfV3WLJbT5uMR/xjmVnue3zSJaZPbEvYXKmgA9h0kP7NxeAQ87
	bSJ8SFa9LGkmA==
X-Received: by 2002:a05:6870:9a93:b0:435:9a81:f35f with SMTP id 586e51a60fabf-43ca421d3c5mr6646133fac.21.1780323839410;
        Mon, 01 Jun 2026 07:23:59 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43c93ae5342sm7818948fac.7.2026.06.01.07.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:23:57 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Ilya Dryomov <idryomov@gmail.com>, 
 Dongsheng Yang <dongsheng.yang@linux.dev>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <20260530011255.52916-1-rosenp@gmail.com>
References: <20260530011255.52916-1-rosenp@gmail.com>
Subject: Re: [PATCH] rbd: check snap_count against RBD_MAX_SNAP_COUNT
Message-Id: <178032383731.395085.5307833564708936991.b4-ty@b4>
Date: Mon, 01 Jun 2026 08:23:57 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 29 May 2026 18:12:55 -0700, Rosen Penev wrote:
> snap_count is u32 but the comparison is against a SIZE_MAX-derived value
> (~2^61 on 64-bit), which clang flags as always false with
> -Wtautological-constant-out-of-range-compare.
> 
> The proper check here should be that snap_count does not go over
> RBD_MAX_SNAP_COUNT.
> 
> [...]

Applied, thanks!

[1/1] rbd: check snap_count against RBD_MAX_SNAP_COUNT
      commit: 2e1b3f4c51ace14f67201bd2a92ca6312a3c3724

Best regards,
-- 
Jens Axboe



