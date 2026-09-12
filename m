Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395EE386C21
	for <llvm@lists.linux.dev>; Sat, 12 Sep 2026 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789204802; cv=none; b=GxSE9eTdQKmwGf95Co/ACFhKexOXbZ75ga28yahRpXSJf0+inKH2etH11iCu77T70GPLzzT/WnepIrD9BZ0IlzxK+ZZ2j2lWi/GGhXu/85f4pTqEBq6UAMP9kjfsM0yikM8ERIgZ31ssxGI27F66xx9M5akmVkt+ll0bMk9H60o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789204802; c=relaxed/simple;
	bh=6n2c6h4Hymm7Jn+sRJG1iAeOOVXTKyFCMG6SxCx6KGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/RbeTCqp3wPFttVycHVnsgXZDF6iMrRatRsjiEeIl2aOj0ENHEw+iPxYJ/SHbcLV16rbg0lIJgk63QCoKnznBpoT3SZoheymXeadYwD2/7CCXH3cuwvRxvscgloYVPFscJo/3CQQpr30D/RkxQ/vLAWGXzt3Lg28Kuz9GUA+7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lx7m9oGh; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lx7m9oGh"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-486955ae01eso1597971f8f.0
        for <llvm@lists.linux.dev>; Sat, 12 Sep 2026 02:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789204799; x=1789809599; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fdb87G5D2V+5j6YZ5rMK+AXQbXwNqx6jG61RGWA1bkQ=;
        b=Lx7m9oGhSXoTPQBcbtcpgajVvjYSqZ3ztgEvMwWOnvVxSldrqUW09wz0SpAYbik/Uv
         UHgTaRHki8R+JqCYavGk0wDUr1Kq/SQFM8e/bDOKaSVNQgdhChOWe8qHp3Lk/KWAM0OG
         mGo2RlUeeByaZ9m2XVJlecPi/fAx9bMHQUiOO+QqWo8gH0mgm8RW5eL86Fau+Y3oYxFc
         NhoYo2yb1sHdMHalO1UtCAZkOtV/dRkFrEBqW60jBzBazo+/Zbk6AhpCddo3hHMxpkQo
         FUOBKUOkiBTSWbslvjncMx6k9Bw1C22UA9esMRUXKTYr/VMvIOtSFzgM7V+0rO3R3dZB
         eRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789204799; x=1789809599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdb87G5D2V+5j6YZ5rMK+AXQbXwNqx6jG61RGWA1bkQ=;
        b=Kf+FewVmksqcY7dVV5t+/uUAOdaBxsNZ53qcRVUdLld9E62y9fsrXJjPC6DgSYuGIu
         wOjSBMzX0RthuZrebDuH0kefQNHCX3eGzppzAfGrRPivbbn9t5yVtBZrfcqWgRhKn3uW
         SWB1UVGp3EBUHO4hF5en7T7Rjtf4L4+9FtzmGHhZsbjG3RtTM2g2omcEX6wGE49kBSp7
         +x4UuUTGKTLyn6MLVmqQzK0CWjI6fgVS1pcmsV5jCDMONmAf6aIkZJ1b4liBrMtcTGwn
         D44y2IGi4N9c4BMqkaseXKft8tGBU7h4wqJTJ5LKyN8Lfhx7IL8WYUaJW160rlGmAQji
         FnnA==
X-Forwarded-Encrypted: i=1; AKwUvBxNcxLfY0ahlYjgpu3p/eY/1s+Ww5SfQx//6yZJqO6GwBJlT02EMM0zkuwM+28yOZOevhNs@lists.linux.dev
X-Gm-Message-State: AFuF++nYHhGRdAqrnVAfzxfKdqfKYXIg8FGxZv+CD1tZf7uAsgEClkox
	DQJW2nu0xwUJbBmw2SDk4t46xYQlDfqzv+gRu+QhW3YvrcUxeOFLSn7x
X-Gm-Gg: AYBFou1GaPl4nimhgLMLmBElQHWbgr8jz7Kikv51nlzzDxs4ncnWJAcXPOcWt3qc7kR
	jjkmW+7WuX3T6E4IlR4smLkLnYOzDL5CYYSP/txMFSRY4UKsMXE1RRuRfXHwxKx8g5EwGpP61f0
	Q/DDt9w94bS26iS7N42Lhn9sP6nZtw/X2JfZIelVF+yiS9zsALOl0t3gRvhPxv0XCNjZ/sgXa0B
	QRHn5JO+vrnUaqm1ygGguHRTaz1sxPeZpGp93PMx4S0LQDMyN/HW+PuwkUEqukp4bFAubT8MEIc
	+ZUR7TLEFK6I/hlMu+Nayf8pOL3u/lRjBiRu/1Uc8zMgRV/1IpiAsdpRslzeiJn2fRyn8SzxG0J
	We7B8gVxHbMHB8+Fh82TQXHhgg+4IqPwrdWe8aylUdNslMvD/pg3oR0NVcll3d7CLMfOjT1rpFN
	F1ErXazysDy1svMSY07ZhJQOzby+Fns90eTFWytE3oeNnwyr/gYmuvcF+o4JBkELHetQjqp9qd7
	0V6en9r+KUldPsTK6vOpl+p2howjdrn1cZ3FMSiTq/Od/VTWTOasgLCRykqrRYOjQGen9J0nN37
	vHgkpQNrJfxaEX7pPA6GfAGbxh+ND5JrGuvGqb1jMgH3uR/mx0qYhzk9+RmDupJEKvCW2N/zOe0
	=
X-Received: by 2002:a05:6000:186f:b0:482:e451:6810 with SMTP id ffacd0b85a97d-486eb2e2901mr9420469f8f.1.1789204798879;
        Sat, 12 Sep 2026 02:19:58 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb360409sm10716573f8f.36.2026.09.12.02.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 02:19:58 -0700 (PDT)
Date: Sat, 12 Sep 2026 11:19:57 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Dan Williams <djbw@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] memregion: fix cache invalidation warning message
Message-ID: <aqUY5Zho3sKFP_84@gmail.com>
References: <20260808121943.72939-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808121943.72939-1-kmehltretter@gmail.com>

On Sat, Aug 08, 2026 at 02:19:43PM +0100, Karl Mehltretter wrote:
> WARN_ON_ONCE() takes a condition, not a message. The string literal is
> always true, so the warning still triggers but the message is never
> printed.
> 
> Use WARN_ONCE(1, ...) instead to print the message and keep the
> once-only behavior.
> 
> Found with a Coccinelle script. Clang's -Wstring-conversion also flags
> such calls but is not enabled in kernel builds.
> 
> Fixes: 1156b4418db0 ("memregion: Add cpu_cache_invalidate_memregion() interface")
> Assisted-by: Claude:claude-fable-5 coccinelle
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Friendly ping on this patch.

Updating Jonathan's Cc address to jic23@kernel.org, as the original
submission bounced at his old Huawei address.

Thanks,
Karl
