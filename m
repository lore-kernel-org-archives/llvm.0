Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AC41482FC
	for <llvm@lists.linux.dev>; Tue,  4 Jun 2024 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717508331; cv=none; b=CI4jXsq1z8UBVT6MHhsiV3USP6dDr5T0ugkiZ3MHkd3JS57pyGBtLhgdEnHtwtoR+Dhjj4Yrmd7lA+z8dxBdSZCpjs6TBOUT5MhNCdbJR+6ZVtT5zgKe+zyWHvbWLnTNUH40zWkn+ylMVex1K8eE8vzVHw3DJKXMoaRmPQOXlcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717508331; c=relaxed/simple;
	bh=mLOB/pRDSaqep4kaNRLrvlUmHU00bgxlnVyjfSPtsEk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s/H/rEoZMhi1Mp0n0NYINituM2hR5OAqOXX4NzWaoBh92s/8hWsLHhLf+r9zV4gZJ4wZ6JNjpM/80kkdyzzv6/F3yr4tQhFI5zuzpfezOzmWbmvmSyh/iL50eR6Yr/UV7pRO+TlvCmeDHA1BJxeM/PNclzxJPR7jW1c5ItouoyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=XN1919te; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="XN1919te"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-6c53be088b1so496976a12.1
        for <llvm@lists.linux.dev>; Tue, 04 Jun 2024 06:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1717508329; x=1718113129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyXYBZ9yf/+pq+sDdhkihpXpTq6hpcaT1psfHyvcipQ=;
        b=XN1919terQZk61j08C4l6xI0OqyUA/B25GWuZI7Nw1QYlpLt3En1Z68okfhtgGOWq3
         Utj6h0faCZnDVu1DtyROsCleg50Of/iw6lwqj2vQUT6GYnMbi7aiFMKd7Md8wjdXUgkS
         sUA1OIezVH3VTLAXL2HgbzK0GwmORhHynOkPky8qTXOIWE2Y69u+ZqDXtn601mExTEoQ
         Rmlz2iUE0oeIsWM4b5x4jwQ80SMTSwkWbAeQp9vMh0X9f7VBt1p8JVGD9vHKDdF53cFZ
         Wtnvwjt7pgcT9mltTKmgaYwenATnyAN4fc3TmF+uKFhRaUF4v8hxLzCLxvi8t1zLZMrL
         12Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717508329; x=1718113129;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyXYBZ9yf/+pq+sDdhkihpXpTq6hpcaT1psfHyvcipQ=;
        b=viO3kyLm7961BcXpHMlM64QU2yQIlHsbWOPiRbbupMrnRBeXo/I1GXfD42cJbTSkoR
         2qQIb0TC7y831DH9LGUtQ566Rp766o6irKLZA8LyESck3t9chVsbfHDEcDkT5yiUx8nX
         3Ynhf1mG+ZptOqvb52pyDcSWc7XrrWpYGBQqAkYZ+HI/z5UxR+muLjKvaIwXD+TI50+U
         HzEnUwn5unxmY/AzihfWIBB7yurVMnjb2yyRTH8sBOqaW20jyCKZIomsSPkUuOXaD9pn
         tdUQfod7thC44HyeU0N/gy+3XAEk3qF/WnXCcJpfygxOUdq8Ojhdzm1NtD1Wx08dr63Q
         fJ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmX3WyyO97U2yhhiYZY++fdCaDAIcJhps8/bI08B7/1POKsQWtRB+FIifwN1MTh2F2X5qvNFXenSKG3Lss7pTRNl7GcA==
X-Gm-Message-State: AOJu0YzNq/ugvL+WNDJEYCyms69N6QVfaBsOIlK27uN4pBU6sj6mQLuO
	vypenc+vI9olZdO1d8SAOknYcUXZwy6ivfIPwmcnu/RdhfILewtUv/uQDG/RFVY=
X-Google-Smtp-Source: AGHT+IGgE1PUAohyvsVgmtFENCcomUvJIkWVXPFd7SdjzctUJnwKJA25eUqbhTVsMlgms0m7bEff7Q==
X-Received: by 2002:a05:6a21:338f:b0:1b2:53c5:9e67 with SMTP id adf61e73a8af0-1b2a46feafemr2610730637.4.1717508329280;
        Tue, 04 Jun 2024 06:38:49 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a77bab23sm10440745a91.48.2024.06.04.06.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 06:38:48 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: asml.silence@gmail.com, nathan@kernel.org, ndesaulniers@google.com, 
 morbo@google.com, justinstitt@google.com, Su Hui <suhui@nfschina.com>
Cc: haoxu@linux.alibaba.com, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240604121242.2661244-1-suhui@nfschina.com>
References: <20240604121242.2661244-1-suhui@nfschina.com>
Subject: Re: [PATCH] io_uring/io-wq: avoid garbge value of 'match' in
 io_wq_enqueue()
Message-Id: <171750832792.373240.8767021460699358833.b4-ty@kernel.dk>
Date: Tue, 04 Jun 2024 07:38:47 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd


On Tue, 04 Jun 2024 20:12:43 +0800, Su Hui wrote:
> Clang static checker (scan-build) warning:
> o_uring/io-wq.c:line 1051, column 3
> The expression is an uninitialized value. The computed value will
> also be garbage.
> 
> 'match.nr_pending' is used in io_acct_cancel_pending_work(), but it is
> not initialized. Change the order of assignment for 'match' to fix
> this problem.
> 
> [...]

Applied, thanks!

[1/1] io_uring/io-wq: avoid garbge value of 'match' in io_wq_enqueue()
      commit: e87863ed45a1c36b0d8a5b70134caf8c794d8d57

Best regards,
-- 
Jens Axboe



