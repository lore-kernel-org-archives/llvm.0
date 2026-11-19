Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108253;
	b=lLJQBhurMCkKBxXa+PESzb95nHYGKf9KffESG9Tz489E+UIvAiVlKmiucRjlo+LCLrkA
	 8B8olG3KilUTdGlGxeLO8OYShNRNKS9ETBWIjmHjOHMWDMvaMoibDeFYVDPviuH+io2Nk
	 eeNXQ2GWmHaHJdCTOHpqrWIHFNyVJ10umlGomsdKLz5bBbQ9voXy8GkloxcHxmt86zO06
	 e+Hv7JRTS3ArMsiafrwe6jsdCFxHzm7DjnTwoWoj3L71NrVm2k9pXgR1ANS1ZkDj1SC0y
	 aSamoUQX9TZJr1PqYd4f6tpH+h15n5SGVDvhitgFx7qyUF9n1TQHOBppXexVMuKhRRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=UgCYURNKZXvnpxT2x6kH2Yd3H2eYME7sOBjpX93BA1E=;
	b=nIORytBcZ+S3xQstqb3PdywaSHwzf0jIMrUmf1zElKWkaHv1iH3PKviHYhSGtdERpjjs
	 8OwxPiEM6ANTNkrQXEjpDIbf78Yrc+Yp0uBq0LaS2Sf5j2iwnR9UEHyH+TAi3eRBW1pA0
	 aiV3FhfzGr1YWHnWSCNEY26pUrY2XlLQyEd1J/6VTXtm8y2vtHhfHQmz/PTLS0xr0k8rf
	 U76+vUkZO2Swski9h0DLE3/m39BTaDFrrnsJ2bSjHHFAZP9tRzuDrxrY8zkpEwUnJ1moG
	 MUloJae5BbwCiwEgy30dyoj3nyHNVQ9qV6ja1CSNJnr1xDjLtna/d/4Sd/B7u0n3/0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IrN5guVh;
	arc=none smtp.remote-ip=209.85.160.71
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DDA606A624
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99DDA606A624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IrN5guVh
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-45e83fd0663so36306fac.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108251; x=1795713051; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UgCYURNKZXvnpxT2x6kH2Yd3H2eYME7sOBjpX93BA1E=;
        b=IrN5guVhPH9oE9WgiH4BeQLBHQASliap1vAynBQXb1d1W6TcSXSj+GOr/0sbaHjiDJ
         9/1yexWJiSLltHAxxjVFd/Uvu4a2yTVjEKT+hU0tOPl8FEheSFMB17jQwm8i32Q5MnQe
         NqJAWOr0U/Tgh5hCRTapeeIHsOLzKerUTFhIHEWdtA8jJEBo5eYAZNggO5lgm/r51quq
         eEtNAVgzsYXfYFsxc7pa34duXhkN6sgtzfNSs5coXj1Kgw4/lV8G1qCZeJE+vdtmtCr+
         DffRvKfX9Ozb4Qudzadoyt+9mxb3ueTyR73foBzmM4+oZwYsXbETNedLAhgp4vwPvdkc
         5f7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108251; x=1795713051;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgCYURNKZXvnpxT2x6kH2Yd3H2eYME7sOBjpX93BA1E=;
        b=J2Rh4CPVpXjKcpIBc/I4cenWsla265oFt9RQ9jFm3giGVChDvEvHZcSttn6/3bc62s
         YjxkMW0LrI77BC7tjAYHBROu0EHhLBY5VhtcghdrHg4NCt/mO9PqqwMhyh55MtxLt8RS
         Y4ypuR53MyKvQDwnqXYSOPdztrNS+nz9uMQ7QJmKKKgpVuk4bVZAdVYb5vS6UApGObct
         7RO/SxEms6134vgpPLG+tJTnHzlTfBXf3YixG7xUs1yK8rRjVryJYf/46wFVgdUWcSPE
         bzT6qLg0Qa5xENUYv6gdlEAhAU2doAUBhLkwoVtIJ7WdRrvrng4TEBuO/QhQz0o7/NIR
         sAkA==
X-Forwarded-Encrypted: i=1; AL+hErFx9UGEhpbpkpRJLqYNKOpb3bB6suzYG5v+SECWqL5rToUhP83YY9QVp9OOwuLRzKcUPJjr@lists.linux.dev
X-Gm-Message-State: APuU4Z9QpjJWAyzdnlceKc7gC01IojQ2mB5ABt9GvJqlSiuZqOFZ/BVu
	OwsR/cOVAfVMx8eam1z/0lBnLXLvzhQ/YnPXsoEQ8+ZrUPJXUMGWiODZ/F3b+gBPEMs8HngbBMa
	jbWxAfaQ/iw==
X-Received: from oadxh9-n1.prod.google.com ([2002:a05:6871:ed09:10b0:4a7:1cc1:e72])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:b14d:b0:4a2:47f6:3cbf
 with SMTP id 586e51a60fabf-4bc7d56ee04mr238017fac.8.1795108251216; Thu, 19
 Nov 2026 09:10:51 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:46 -0800
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
Message-ID: <20261119171046.1536673-1-irogers@google.com>
Subject: [PATCH] drm/msm/dp: Return MODE_BAD instead of -EINVAL from
 mode_valid callbacks
From: Ian Rogers <irogers@google.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

msm_dp_display_mode_valid() and msm_edp_bridge_mode_valid() have
return type enum drm_mode_status, but return -EINVAL (-22) when dp,
dp->connector, or mode->clock is zero/NULL. If a mode with zero pixel
clock is validated and pruned, passing -22 to
drm_get_mode_status_name() computes a negative array index and fires
WARN_ON().

Return MODE_BAD instead of -EINVAL in both callbacks.

Found via Clang -Wassign-enum on an x86_64 allyesconfig build.
Verified by building drivers/gpu/drm/msm/dp/dp_display.o and dp_drm.o
with LLVM=1 W=1 (-Werror) and -Wassign-enum; not runtime-tested on
Qualcomm Snapdragon DP/eDP hardware.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Fixes: 05d001352733 ("drm/msm/dp: use the eDP bridge ops to validate eDP modes")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c0c150e2c575..51649b584573 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -759,7 +759,7 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 
 	if (!dp || !mode_pclk_khz || !dp->connector) {
 		DRM_ERROR("invalid params\n");
-		return -EINVAL;
+		return MODE_BAD;
 	}
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index c1e4147bfef1..dd4e8426cfe0 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -251,7 +251,7 @@ static enum drm_mode_status msm_edp_bridge_mode_valid(struct drm_bridge *bridge,
 
 	if (!dp || !mode_pclk_khz || !dp->connector) {
 		DRM_ERROR("invalid params\n");
-		return -EINVAL;
+		return MODE_BAD;
 	}
 
 	if (msm_dp_wide_bus_available(dp))
-- 
2.56.1.708.g77570a6a1d-goog

