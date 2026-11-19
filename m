Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108032;
	b=yVdo0HhvCgbXf4tMQ3eku5A+zdZ/9epNe29w3Ffjl9ondZwB2OGsBL1Fo/RvDFxzvcso
	 8G8djQa+bFYHxIoKGAYAhb7BjzDZ8S8KrqdvZ86tWkkA8PYi6SzEtNtFPSrnAQHNpWO4F
	 zjSsbviRy+IvkQKu06Se4YdVTaEWQ8WlcL7dC5mft5vcNiAFVhuGnuqcAmkwBsWqW/ptP
	 tv2DP6T7tqgaHG1xWHVxxJrkAgqwxNi2yLRV2B0Ay5aMdSdHlo7qwsWsaqaEInaDMpCps
	 hbIWj9V3IOraWc7A5lh4QC9nW6S+9uCIIpgzwTeRH4jSscnPbXAzZ11Alk+Y0BX4eWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+O5fTVKRKtM/LnTlOc2xLfq4r025GdIDtJ3B9d4nmVw=;
	b=lkNa6tY1inWk3Y3OpYPae5WdRz4cLzvxV/jiptB2w5SyeOx/gHHvd3TDkoBW/TJ/Of0Y
	 T2ynLDFBx4y/Nm9gDyPkyJ0o6YoW+UlKGb3b37SRfsEVGZ+hCPlopMBqxsNZfOdonpLBh
	 FbxiM0Y/zFo5wRdo3nmnuGoOBnpmmgAYCsEani167QNI2VWDfzRR7UMSKEY5Rs0kyqz4a
	 nQ10StP3An7Skfkf++y+mMNYec41IW4j58mhzc0pxty+pYlGTYyhV8rSPuOXQJDGBJMyS
	 jXb9LPmaldCfMakGUxvl1brWQTBLASIsqxUtyUtZt+ndvS/pUW3hjyOsB3u9bRT2sLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gf1NQyOz;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1FF606A33C
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF1FF606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gf1NQyOz
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b45597c7so4723465c88.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108031; x=1795712831; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+O5fTVKRKtM/LnTlOc2xLfq4r025GdIDtJ3B9d4nmVw=;
        b=Gf1NQyOz+zAlFhHWDFuI2piKSGcjnP6lmE7ujU3HhySQ3Tce10sakWv7beKgfcFO+4
         VSL/KTElPXLJ3bg7rx3PkvdwwBnu2DGFTJ+1Uq48BK8jTwoHQ/4M+f7gTbz04AMK7XvI
         2Rcx52HP0O2pwvMFDHgBqU33UdmazN6ONwfoqTdmHg9FLMwgUBlN3AG3puHJrgHn+6Y+
         v6Y0auYCSRj5THOwj4bxOOSB2ojsSPHf7qBCxlba3ShgXfBw0sX1FZAoGqNSZqwejr7o
         qnpFglNZs9xh2unPf/HgbdnTx12yFwX/OUznPRakBUTeclwP9reIMPTCY37u8Qr1bTUR
         EkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108031; x=1795712831;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+O5fTVKRKtM/LnTlOc2xLfq4r025GdIDtJ3B9d4nmVw=;
        b=en7X7XLiJLE67LNaqJ/J6naZYgOIaM3unAiqqiR8854Ru46WAOwAnzaXgErBvdsBvY
         Y8mN6eP9PBwo9f1YWYFNCAx3OEfzmpFDdjjYC+MDdzEveCvCoG+9ZrCcDzgbFn8I5y7U
         bvbjEzKR1rxau0MTPaqEOIvh7x6nXvQAnkPAbPmOU9sL8m4fou7hbuUmvHtCY6Ki8ErZ
         fazSxAQfi0eQtd5UKafHBtnhnoPVIek/Po7n7Lg0qudUuGFeTaPDQlEMS08ja9g5uuWZ
         FmmhL5avkkfXSa3585NfXublSARzH+fmf2Zq+cSbPTtTUQ4y7jANeRWPwAU85U2NoGDR
         5j/g==
X-Forwarded-Encrypted: i=1; AL+hErEahq5O1LybhYBAgni3kK/Ibd1tPPN2sY3LDzbKF4iIMCWi2bpfVcqptrSl2c+CDGw5SnPC@lists.linux.dev
X-Gm-Message-State: APuU4Z+eB9TbKOZcp3CYRcHZwHgjBUhSxokrGipuKlRaV6pPC6GGIj1b
	lWSUMT6oQFZYG8pJv1USNiWCfIT0N7VxnZJ1FWGOcgf/eWhhWnds28XB8mA8p26aouLO4abdpo4
	/ou01odh/Qw==
X-Received: from dlai6.prod.google.com ([2002:a05:701b:2706:b0:1b2:375c:814])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea56:20b0:149:1feb:6d9d
 with SMTP id a92af1059eb24-1b55689e6femr287285c88.19.1795108030586; Thu, 19
 Nov 2026 09:07:10 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:04 -0800
In-Reply-To: <cover.1795106955.git.irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <cover.1795106955.git.irogers@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <e8d983aa6f81be52ea1bb9afc9c0f47d4632c1db.1795106955.git.irogers@google.com>
Subject: [PATCH 1/2] drm/amdgpu: initialize r in amdgpu_vm_bo_update()
From: Ian Rogers <irogers@google.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit bc566781845b ("drm/amdgpu: stop syncing PRT map operations") added
an 'else if (!bo)' branch in amdgpu_vm_bo_update() that does not assign
'r'. Because fpriv->prt_va has bo == NULL and is updated on every command
submission, userqueue validation, and KFD VM restore, calling
amdgpu_vm_bo_update(adev, fpriv->prt_va, false) when bo_va->invalids is
empty skips the mapping loop and returns uninitialized stack variable 'r'.

Initialize 'r' to 0.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not runtime-tested on AMD GPU hardware.

Fixes: bc566781845b ("drm/amdgpu: stop syncing PRT map operations")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 82b9b2d5d0cf..091589b2c524 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1303,7 +1303,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
 	uint64_t vram_base;
 	uint64_t flags;
 	bool uncached;
-	int r;
+	int r = 0;
 
 	amdgpu_sync_create(&sync);
 	if (clear) {
-- 
2.56.1.708.g77570a6a1d-goog

