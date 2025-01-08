Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64229188A18
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 03:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305205; cv=none; b=FnHbZm6HtC0dtRRJCno1Eq+XWbbJztFY+xnD5dQ58zJZ8/5mxDKwIZCo3xoS8xPpnLyhijuT3JjO9/KuEytqXfNRpsP5WkjmfyHdzfCWB7WhdwD2CgmZOtymYwSeUPdt94dfq4Cv6pXo6WP57Aaz+unQoCzSMvnjEPzyybqYISA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305205; c=relaxed/simple;
	bh=69dz34IdLIqLQT3UgEpRCau5EC1HjbOWvj4mF7yxFV4=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=fdYhiKBJSB/ZElOiMk0BSFgRNY5zvuqQla+w7Z4Yk38sQmcycdcJhK+zaOCpaa9IoYtmOi6tKQvJEYpfmGqZEE0+DYI34MmXzu6EXxyo+Tx3AbujJ3bpu+iPk6ZgSH9hPWG3IeA9lSDIX/yXCwX+/k0EWci43gTsNG6HfWFzQP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=FgLOLSp6; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="FgLOLSp6"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b6e8fe401eso1344268685a.2
        for <llvm@lists.linux.dev>; Tue, 07 Jan 2025 19:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736305202; x=1736910002; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvMVeu3O/Rrbai9L7v0w6uGtmvETU8SXM9vFjK6RCPw=;
        b=FgLOLSp62+oBfBkaZPjze8SBBHtDFQZm2oG5aYsXSnV4mEUeAAQfMxTu+O744lIJGL
         neVBWYy/aw0l4tKjL7a6Msk9lQmovGs9BUuDh1IIOSXCRngNRoBQKERsNiA1Q/SdhmKZ
         C3qffWTRXgfWkhCBlDEv6NlNYqO+uYUkkePVTHSdflvweGMQ04EZxY+F8+IO/vnvrvGQ
         0C5e9dRPykXL4CyLn3wNaMKbOmKI2ZDst47xU4WIaGYJmn/Kkp+3Zi0GKUJAo4tY6pXY
         YYF2OtygEu3N3VJ780B9SfWRZVPx68/+pC0G1lmyARBtRyAZqnyBVXrUEi39EYWRkM5L
         JBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736305202; x=1736910002;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NvMVeu3O/Rrbai9L7v0w6uGtmvETU8SXM9vFjK6RCPw=;
        b=QU3SjxzFC71Iau5yQ2bpRhK+WqBVEbtGed4NXwZSUgwvlRm4NcA9mP6xzK3lnrbR5m
         P+MCNzaIz9WVJ5au8p0hiYZV3WONeFLFl044cLhyhYkWEpFs58lwLRnqzMMshTzXceeD
         YLehedWzBTMjyLFmLVVUIFkSqG1mfLxAfP8g/SR0VGdunctiiVtZ2Hon5ufG6ZEq8Wr/
         yM7bjNYuZuRPDm2c/c/WkflSD2Cu3tmym5ybCf2o9OQnaGKNLNXluzxCQ0qxeIcvJpzH
         cyZbEo8yYKRobv+CImiOSyDG8Qv94laTElskU7RjrIs31ujXUb1uDu5V3XC4YcKQVTlk
         EWuA==
X-Forwarded-Encrypted: i=1; AJvYcCWjUHi/vzY4wQM5dptmO+9G0Mh74ag8tfGJeH6JAU4tWxS/9hyJILK5X/FPwdOdA4B2zsMb@lists.linux.dev
X-Gm-Message-State: AOJu0YxEqZesadxpsJCIi8VvUgwRrQ2PiRFhl68fGnKV4+n0nbcBCSKm
	uTnmWepAvAQe5BWLZ7+1u1p2yHEJt+Wb2Q9vw18RTBQopuKz35ANT7XMTw35FA==
X-Gm-Gg: ASbGncs4GTkzUSixqE3kSaqHSvnP9WOrfgRBvtAV7o1yUTaTJVOSONHNgo+anJPCJxx
	dxEmbY88tuzcHYS5FY46nuj4wWN6fVuBFK0lBI4arbXTqOMv4no7mFWg1tkdzpNwuW7m+dymBXn
	HOGBtN8RwioKXHVUtmfp3mGDh8qvIvqCKVSmwbNYkN9xvyBbmmtR/X2BEkAGCxJKFKVBiuf3pEj
	NHdMmdHRko3I70wSWO+rVZMcwBe0WYlYzQT6FzWdi+78Bh7yFc=
X-Google-Smtp-Source: AGHT+IE3tRjGPVkRuvsNe3q0WL+6uyZrJjkZzTaKRe75QWatS+285NESIcw8YdF9xcgdUJvGdfPLoQ==
X-Received: by 2002:a05:620a:298f:b0:7b6:d88e:f187 with SMTP id af79cd13be357-7bcd978938bmr158285385a.35.1736305202282;
        Tue, 07 Jan 2025 19:00:02 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb19684sm191470191cf.58.2025.01.07.19.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 19:00:01 -0800 (PST)
Date: Tue, 07 Jan 2025 22:00:01 -0500
Message-ID: <fdcd22493d49521390d09a2f8a464d20@paul-moore.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250107_1610/pstg-lib:20250107_1603/pstg-pwork:20250107_1610
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>, selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>, =?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Eric Suen <ericsu@linux.microsoft.com>, Canfeng Guo <guocanfeng@uniontech.com>
Subject: Re: [PATCH RFC v2 7/22] selinux: use known type instead of void  pointer
References: <20241216164055.96267-7-cgoettsche@seltendoof.de>
In-Reply-To: <20241216164055.96267-7-cgoettsche@seltendoof.de>

On Dec 16, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> Improve type safety and readability by using the known type.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
> v2:
>  - move one little diff from subsequent patch to this one
>  - reorder struct definition in policydb.h as suggested by Daniel
> ---
>  security/selinux/ss/avtab.c       |  8 +--
>  security/selinux/ss/avtab.h       |  9 +--
>  security/selinux/ss/conditional.c | 12 ++--
>  security/selinux/ss/conditional.h |  6 +-
>  security/selinux/ss/ebitmap.c     |  4 +-
>  security/selinux/ss/ebitmap.h     |  5 +-
>  security/selinux/ss/policydb.c    | 91 ++++++++++++++++---------------
>  security/selinux/ss/policydb.h    | 16 +++---
>  8 files changed, 77 insertions(+), 74 deletions(-)

Merged into selinux/dev, thanks.

--
paul-moore.com
