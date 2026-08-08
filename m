Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAD8126C02
	for <llvm@lists.linux.dev>; Sat,  8 Aug 2026 12:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786191548; cv=none; b=sip9s34iID97LyRqjTMCDJhOaOGY75yaTG49gfsbEM9zpdOCFlgKlQHcqK7maBb/QUlX2U9psiILE/dGaYw9i/K/LvpZ1zNziHJGeuPDP4p1H1YUNf+CHbF/o6WU2YUUrvGfcOY8rGvNDhWbD1rzZKCz4jq4Sumdbpt00ZmqLe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786191548; c=relaxed/simple;
	bh=QCtL85J2Iq5Kaj2qkyZecqzvZw4O2YgB8I7SK/QDQgI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BZ1EiObG5gppEQWLFzkDpitqGuWa+q68lA+x7yx6XNWAvV23qE0HNwQiAaM4ctRDKPlahzJvSJ13PuyVYED06B5647HnO+iAuVI+fJwMcd4yMORM+oxV4NTEvxCdLEz7eu5bhWZLFJqg4YRVn+kuynj8+C7qsID4ifbJCcZPmjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/pr6bWE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/pr6bWE"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48000c5d6d3so113872f8f.1
        for <llvm@lists.linux.dev>; Sat, 08 Aug 2026 05:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786191545; x=1786796345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kFo+FAm9dOuD7sRaxc5XvG2wnDlTsCrM8DjnwJd9TPY=;
        b=Q/pr6bWE7EV0bRhjb9Fdvt/h4Hzi6Q0rqihcr140sngPGe15ICWa4E1cDtigLhlDjW
         x4w/AeOOk7OysScg15payOfTN7ObHKGIuTlplqh6fSaPKNKMxPWO/XdsT2uBqFXwg86e
         wW2HO8OHogE9KL+Kiz+ehkZbS4BB9Ia2ayQJgwGw+QPosKaUHMtZ6XYoYcZN65xI58wq
         iayJhyCDY5qiwc1c3UtAlE1t/q1KKVG8wQFmQrnCg+YTWFuNnFPHjBeC36TOavaOouzZ
         oWCAftQx3HrrPkK0fHfTkFSOa6oaFb4tumjcX6Y5OOy6vojJBJ2E4XMEFo1N9BwwBZCR
         yM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786191545; x=1786796345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFo+FAm9dOuD7sRaxc5XvG2wnDlTsCrM8DjnwJd9TPY=;
        b=M4c1fBtoBSzpJ3scGDU+HFShOejvx6UZYFAbj25Xv1ccd9c7Vgrm9VdE5lfJ29xWK+
         ttTutCPMbniDLkJ8/Xkt6f5LvS4CA8ZHHU2QKj9kdU5rZHHuOGWQRKjFfpsHzm/79Obt
         1YIzRzaBRDuYfleiyN9r1FWltd+PIw3RbVMgvmvg0GTc0HRPgcdL2MgQIIgj/byg7Iti
         Vm2WEXD6xBCF0TmExNrIIdqGXEyZqePNCmcttDJm2vl6fWqgO0ynYqeltrY5LNolPMQW
         hODMN8vb7pw5oeP3zmtDO5HRLuFBAfc98brxAVLMAaRR+RBlGWVb8hrUtb7pi59uru4q
         kW9Q==
X-Forwarded-Encrypted: i=1; AHgh+RqRNvAupyGZm7szXrK1YJvSgwo3kbPjcNCNtYjNLJS9S4+ylhTQDy5ERbulMcPH9FfNACVs@lists.linux.dev
X-Gm-Message-State: AOJu0YwVXObDhSCJtOR89rwxkGETQRqzaAd/U5SO6lgBgJb08c5k5RHA
	iUXA4GesGCsURHZ17pWsfyDFpB2edl9TgZyZUaWzoBXsUnxHCApHs4rC
X-Gm-Gg: AR+sD12eFtELqmFsjePs0aS4E0Tw5bhv4zlxpShQJrm1QZYKHJ0nB99PNggOi13CX6U
	89Fom9tKU9vM2vk0yCuW+t4cp+8vHM/juKCd3Tyo2TnpjMW/qH7WKimKWDu92i2YI4B5Tp7mUHf
	GTBazd2LqdiPAQsdcbef3UI7qOdX5HzxwMNPT+ujXOufHvded+sOARnmhE+oVzouP6vawuDRewn
	g00MPlplWByY0xriEltw9NeZKptM0Iu2UCuKAHM5JI0YE49F6/n6RlcubkNdTnT5++z4nmsaAr5
	B/PKX3G3fniMa4RqAyGzAAXp6Tw9l7V05G0pIF3BoU4R1TiwVutHAZVgpdYusNW/9bJupZLf738
	JH9oyVrhR6VVaDKVjpHhd0iNmqSURqYdES4DyZZ0ZQkjYrH6BPM+OAVFF6uX+wH7dtG3sFOAK+K
	C0PmISvJ5kXuR17eUFszIGn9unzDlyY2wAkK0Xgpa6QDBli7TjjvxhasvmmesyNw5FkGPTHnCAH
	uMCjuxerUOLu5nTSyE+lqvUFZ6ST66ab5Ccg4SmGeqlEnrs0aDkFKl+reowD4kqDHM1aHcXbgRn
	TFORj+vgm+QaUnRUTjGYLVHh4+rmhzk=
X-Received: by 2002:a05:600c:470a:b0:493:f318:3bc6 with SMTP id 5b1f17b1804b1-4995e0df176mr112874695e9.13.1786191545414;
        Sat, 08 Aug 2026 05:19:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-004-134.77.7.pool.telefonica.de. [77.7.4.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995421fee8sm212371525e9.7.2026.08.08.05.19.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Aug 2026 05:19:05 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] drm/amdgpu: fix GTT manager warning message
Date: Sat,  8 Aug 2026 14:17:45 +0200
Message-Id: <20260808121745.72691-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WARN_ON_ONCE() takes a condition, not a message. The string literal is
always true, so the warning still triggers but the message is never
printed.

Use WARN_ONCE(1, ...) instead to print the message and keep the
once-only behavior.

Found with a Coccinelle script. Clang's -Wstring-conversion also flags
such calls but is not enabled in kernel builds.

Fixes: 7554886daa31 ("drm/amdgpu: Fix size validation for non-exclusive domains (v4)")
Assisted-by: Claude:claude-fable-5 coccinelle
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index f98bfba59a2c..f2ea881d39e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -565,7 +565,8 @@ static bool amdgpu_bo_validate_size(struct amdgpu_device *adev,
 
 	if (!man) {
 		if (domain & AMDGPU_GEM_DOMAIN_GTT)
-			WARN_ON_ONCE("GTT domain requested but GTT mem manager uninitialized");
+			WARN_ONCE(1,
+				  "GTT domain requested but GTT mem manager uninitialized");
 		return false;
 	}
 
-- 
2.39.5 (Apple Git-154)

