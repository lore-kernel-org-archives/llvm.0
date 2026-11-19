Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108029;
	b=HpoDdcn8p0HnJlRzRzKK4ksLOoPm+C0MWOMmsTFwI7NfmqoLtFozJ4s1Q7RLsFZLYT1d
	 hVMognQcYYMZedXgFjMsGGtlC+aUpE8wwpfPA+rsGYQI03RFPAdAg2GENv1KuUoTZxTaz
	 BxhuY/BNGoTrzQI651OeRnLsnokn8bgTTbTBaJIPEk2ILm6ptpnF0q9Yiil7KIcuTJCSW
	 IQbq2EHcdTE97p/C+kbfX7el4TjJ2zLChiTkaw1WVyRug+T3PZfWoC6yiWgesncdRGPAp
	 XdbrdEUXYsckRpzcDcQN+YCsG04kXVGFCJwJGGJBVjl5P7/rip0X6nqqbqEo81Su7Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=4HXYvdAAUg6PhdIi6P7o7bJNHIqooKYEpFbbw0vh7ik=;
	b=E7g7HqxIkbWiXtr/5tzig2TQS1Rxm+UK7xUct5eW78Wx6blEjGvkN4jbiJnk+aQfOPc2
	 pulJX1GXZUMzNNJXYofHUbm7G0bu07P07zh9cAsrFtKTt2L2EiYBT5MnZdtezTQSNEEbJ
	 LB4AH+Aa39ho8DhqigyGwilvE+/SFKuw1pQbrzpJSn0ge0kiZCe5tBNocnehf8hD18u++
	 Qw/bUyAoJaHNN2SbYpApF8pNFizqVL3H1lbnRkygKE1ZF8jmifTojleETjkcFjuImGlqc
	 GGd9ZlDdAHGrZTOnUui160devPb61BKnN78ANO1+MNCJWhFkjhRAx4dtx2cxOQfzFPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FeFRnLdR;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C277606A326
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C277606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FeFRnLdR
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383f2d05c73so3881101eec.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108028; x=1795712828; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4HXYvdAAUg6PhdIi6P7o7bJNHIqooKYEpFbbw0vh7ik=;
        b=FeFRnLdRiUShNOKiFUcHqtDk7D0SPaUE2qUgrvuoiPxJ7arfsU2C0kRttD8IuRTqJH
         wVvE8LhGuzq7mC7jO9taRC8PMU5SiNajMz+2YJnGnCU2UU3RR/Vx/inutR8J9RSBkUJk
         mYiJfw7ayIEuT2w8bylG0xsC2RFZyGqIs1p15Fc4x0zA4208hzY1WLJAFIC0i1FWA0Z3
         +AKm6Ov8lWTVdQStCZhOM0gCbLMapBdzvo1vVFFpLmgmQJodiPGQ6wCHeNKluOVRJeQz
         sgsv+CfT8RJ1AMHWxb8DxdsOVwFmU7C54U+aKSihUe1ZYeIMm8aaOZbiFAhqRy8kSX4K
         hcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108028; x=1795712828;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HXYvdAAUg6PhdIi6P7o7bJNHIqooKYEpFbbw0vh7ik=;
        b=mA3vNkB56DL1xSGlZgVgi+kT79wOu1RwdSGdmj/kpuy5ycRHa48b+gCOOwPR+iGVCA
         Q3KDU5iGUwSAZF2pZW14+DlaEQgCT7P7Q6IBhbLIwHblBHx2PIXTJ1UuCCRh1+vmHUIL
         rzWLQ7z4DcwXezFRMZEOsvbD/HvdofEtAe7txhQ/a4WGHG5VoqtahKerUiiMy/DVT+un
         ivKYtayakGCAnQwa+/8V7UXma7KashyNJMdyLsUr4GIom5ifr700/aDv4ZaqD2ldHwsw
         vjArliOWpxcFwOkMFmThEuX0us68wkIGtRAu0RoFwB35w1QMiWfU+hTtloxJDMsUdjD8
         sPkQ==
X-Forwarded-Encrypted: i=1; AL+hErHlUMcNl7TbJBpIjd1CYu71vtphEIpZInJ3MtjOvDAAydc2OLfdaHdswVJiH5EP3Xbz8TJS@lists.linux.dev
X-Gm-Message-State: APuU4Z8EOW44hkRWVwWsGvHes/u+V/6415QBd5Mk5K8CbSR/ApifK98m
	Z32+uYhY8d15Ws4dwtZAOiK6wAStbnWizsl6rLgIlFfBHTPYy5RXZCYvAPhI/tFEHTyCbzV0uCJ
	GsMFs/b0eKg==
X-Received: from dycc23.prod.google.com ([2002:a05:693c:60d7:b0:383:9f52:e550])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:894c:20b0:381:2f5d:a696
 with SMTP id 5a478bee46e88-382815231femr6073879eec.34.1795108027821; Thu, 19
 Nov 2026 09:07:07 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:03 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <cover.1795106955.git.irogers@google.com>
Subject: [PATCH 0/2] drm/amdgpu: Initialize r in VM and TTM buffer helpers
From: Ian Rogers <irogers@google.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Two fixes in drm/amdgpu for uninitialized return-value regressions
found via Clang -Wconditional-uninitialized on an x86_64
allyesconfig build:

1. Initialize r = 0 in amdgpu_vm_bo_update().
2. Initialize r = 0 in amdgpu_ttm_clear_buffer().

Build-tested with LLVM=1 W=1 (-Werror); not runtime-tested on
AMDGPU hardware.

Ian Rogers (2):
  drm/amdgpu: initialize r in amdgpu_vm_bo_update()
  drm/amdgpu: initialize r in amdgpu_ttm_clear_buffer()

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.56.1.708.g77570a6a1d-goog

