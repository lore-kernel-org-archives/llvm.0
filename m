Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A1033A00C
	for <llvm@lists.linux.dev>; Sun, 11 Oct 2026 02:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791687479; cv=none; b=E1ORD6hNEZ5gnRY3PMErX15/Reh99uIBqP2pC8glxVlfn6qauM4HiiVTJTK3ALUfgflalIm9GyGdHsrLxOqMpu0josnIk9AmRfs4rMu7ID5HqGRDmt8w9zSE+8XmUXl9f30+6HFafCzi8Se7BudsaOjBJHR/6XjIgSBM9WPgGhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791687479; c=relaxed/simple;
	bh=sghXvtTDPEzJRg8/9muWYo5VMD1FxRyf/W4rKI9KsFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xu5wIJyq3QQqcuC0rGzYofOUulSYB1Grq5/KZhlwsuBUgkXa3c2fzykQIMzFPt5ee1PG4mEycw++WvTDDvRHoLvJApHW/ocYiufewTraKvvBmbvM+hL8nEEnyAUNifRuRH94t6qz3ZRNntZucXES08/5L1/MXOoUn6qJfFemw1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbfOExH8; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbfOExH8"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so936945ad.3
        for <llvm@lists.linux.dev>; Sat, 10 Oct 2026 19:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791687474; x=1792292274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sghXvtTDPEzJRg8/9muWYo5VMD1FxRyf/W4rKI9KsFU=;
        b=AbfOExH8u2R5FB/vgyVMkr+zze1DnWBXwIMruu42Czjm3nGit9EjOgPHpzyVKdaFTm
         uUf3n7/ZlYmA5YMIFbswI7TSo5FHYw2kc6Dsm7dOuRIfLPb9VHo6i956K4mK+ScZbrRg
         vtUQmESvT7KzNaIqR/A5zKewxY/eF2bCO4Uk5iPqW5JPLr/IZkG2P2mBWvHgkN03z89o
         V4eNIb12ZvW+BxLaUKEThAOd+6mcSosN/4Cj5S+yapDvncu5fT4BvsXQqkUh1WMpkS96
         w5l/tVc2I6bKIwoa8ns0MDP4D0rRJQ/srv3QZ1/QdxQKI2B5bGIK8NjvsA7wjb0Dpk3D
         +ICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791687474; x=1792292274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sghXvtTDPEzJRg8/9muWYo5VMD1FxRyf/W4rKI9KsFU=;
        b=KCfItZ8BRkMweWQ4IU3f/s8rifEe8gbcwHfdsb2CnFp8mzLBWCiA1/y1zXceMQdqTy
         r2Un0OIHdmQkgal/meNuY72XWdIHFF5sUAIMZHiJDbVPWbVGFz3bksDcuKEyUy0HdzQq
         /8Y1jCESZ0/59tfgT4tHsEqqcYna9EMsH8V9kkHbrQotamIrMQTg0KqXYNsN/cEfshXT
         cqIPR/mZ7Sqwp5gU/lHC6UNlejuScuT0IX5cQWPL2YgtXqrlBIJr0kcQsoGg9zfq8CEn
         QsRblyqt+2lvPYF5/x+eu3cMNREfvTRiOYFUUA3KFyfwbWKP3rfP5x9NQCcEt/d+Pu+s
         vhgw==
X-Forwarded-Encrypted: i=1; AKwUvBxqsRcKL87uhj0EUSlxz4o8sVhhxUrTO004yNEiDseslWBf/UAOUOaSdXJptGcjD78A+6CX@lists.linux.dev
X-Gm-Message-State: AFq9FYL/Yxy41OHcjnRB036kikD1vIp3QU1B9lJvE8Q6v0PkK6evv+x6
	FOS4c4HvGxrFP0Abj8olwYqIk3erDqmK1iNbQfqoAZnqstPPf26UkEzs
X-Gm-Gg: AYBFou16gUj3wtXmPBJruzh3nwOESpTLNdausXyM848+T1hHPzQ/qEkNHqxgNO55jD8
	nFX1MNiTEo8zVLdGsooxPmhsqtamNTaScdEgCOBgKOLzMiJOhzVz9UkfsIQ/YVvhdKBJeW3kJMm
	0vitd+mTWRxrl7EiJTF/wVk0juxqjyHdDmfxXHe49ZHaMlNZCEpOwqH22JTak972ewUAzC00pkz
	A0ooYzgY+1Uq8IFODb14fqAFVwA8ml/rNVJu5K/RyEbfyaE3/ONhGalsAng8fPNRd8SrPdFXs3H
	SRrnK54TZPSomyD8ZfM6cH0XOevwx4DBmMQpFaWzrlOYT0Mk3jDocE7sMV8WreocUL/AlZP2Y+T
	mpg+U4+O8duoXqdvZkZcrQU2tC2EUWwY74mwmkkBklqxFbTCFXx+IHBmJlD7+pZRVEo/Ln8iRnG
	uQAXJ0gDTyrkS58+9ekgjUNhD2tEthVz/0iCI5J8hhjwZT5JcrgZ9byDofgwmYvUg1ZolDSJMm5
	t5SaDw5PpFn
X-Received: by 2002:a17:90b:4fcd:b0:3a8:6b84:234e with SMTP id 98e67ed59e1d1-3ab3a7467a1mr4832096a91.28.1791687474219;
        Sat, 10 Oct 2026 19:57:54 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45a:16c8::245:79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39392e9bsm6403592a91.2.2026.10.10.19.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 19:57:53 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Tingmao Wang <m@maowtm.org>,
	linux-security-module@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	syzbot+a0eecb22de4d821a9e5d@syzkaller.appspotmail.com
Subject: Re: [PATCH] landlock: Drop __counted_by from landlock_domain.layers
Date: Sun, 11 Oct 2026 09:57:48 +0700
Message-ID: <20261011025748.8853-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010184640.GA40038@ax162>
References: <20261010184640.GA40038@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Nathan, Alex,

Thanks for the pointers. I wasn't aware of the earlier thread, so please
disregard my patch in favor of the one from Qualcomm and the Clang
version gating of __counted_by.

To answer Alex's question: I only tested with Clang 22.1.8 (Debian
22.1.8-1~deb13u4, same as the syzbot build). I did not try Clang 23 or
later, so I can't say whether it is fixed there.

Thanks,
Nguyen
