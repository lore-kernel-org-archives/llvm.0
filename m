Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202435;
	b=i6UrXTxChRkdiS5JUW9vqEo21TmERPjnMOKL+JzIGqYBa1HwlDtlDt0FmxDqEdyNg1Eo
	 tJXkuvK62SOSibYZ48sQ29aFF8+CfllmF0e0DDwdVvyBwlWVzldpZboC1pqO3V1HfIwfW
	 apOzcG7AOcws38IMH+zqgkRHiNk+LhQ2j/hNTJYIrXD7B5Gj2Pt1j8BgSCaWHjyWny44X
	 HYnQoeNRqYhdWR32EJAOCMAB6j/yaDPu0MXtyP8byPeAFQ/kH7L3nWALJoEuuhKS9cnPZ
	 QffaEglTTEu3naRPHH4AV4jKzicmCbHsFPML9kdsOT2LRGN9NGkFIyyuAbEhlmxHZNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=KO/bgS9573WdL9OckehiaeYLsdBAM3AUhNlncBXYYkQ=;
	b=xv4sqBpVGNGZfDxvaP4CwR0g/ylEigzmMkqMMJzyt7f0vqom0Xx3Khhh4L1BQ/1nnARA
	 0/fsuZ1gnm2h74vM7qlDKCC5LphRt56URCQRVcYaf7YQPBH+VhArikso4q2rd84kNEiu2
	 vM5Z9BCiUsjMiTuxM0tzFVTyuV4IekjMixe7CzWmDGrdDgenZW7v43Q0QQlLyiSHjCt0j
	 pwKOFt9lxieT5o7IvJej0ETMt+CdGJouiInDRjF2LIQiOD5b2Q+7aTkik7kTii/Qgsrhm
	 JuNpmdwpegrrdlPr87TxAc2+Ku+RD/i01HUlRO3VkR+i7zktk3Ca2hIOeJw8ihiY+CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lNiTUgcG;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637F160A2605
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 19:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 637F160A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lNiTUgcG
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso2819066c88.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202431; x=1795807231; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO/bgS9573WdL9OckehiaeYLsdBAM3AUhNlncBXYYkQ=;
        b=lNiTUgcGCaIiPFUgjQizifXkXxeWNtwGsfCKGMNqOiJLDtCPspv0hkfrWo/nF+sIpA
         scRIZVjV79KdRKj4gFDCDbiWEx0VwHXh3tQJCyve4ODPuz5PAjcopkIBa0gQ7ujdWdMC
         6oi3kk+cdzN0bXvZp567hZ/ct9aUOlhtDV40JAe2AB158RjvCezf9RUCDXTEPyAnsg7i
         zjNLKhi7CD2O5wWnS+OX5JVajPtseFUFreTuYIpoAXKkKcR/UtDZ7TenSwTakqRdi2fl
         f/nX1v5nqMRlfXas1AYOpEvdRX8rJH+2GFQNLUEOOODb2FPtN0l0KRvXdeyUgkD4t8t6
         yJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202431; x=1795807231;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KO/bgS9573WdL9OckehiaeYLsdBAM3AUhNlncBXYYkQ=;
        b=q+P7mf2iMgZHSIKAw/VEZ2jT3pW2tdmqf/trl2q0BpRj5teRpYTI185U8CJJHeAWY9
         KSvUe/kSbVSJRsuyq6ge3Sms1IS43ka5eim8oM4cofr3sX+aqP/crMjL3Q4sFBgIIUGU
         sYX1MmlPjBJFvV3vQPe7r6ML2OGZVIvbZjfQc05KKCC2hCocN6X7vuhTdmy2LqOpOnoQ
         gC0FnMDXCW1RA2eOoS8KWT7+hBhcqgABuZ6g+m6bRVGUMyb48L0qEO7r3q1jFBZqxKj8
         ffTnhaUtOzoYntBT4+UGod4nyceKF0yurl3wyChpf00kvD4IDvvrDw/pham6BJaHmq7y
         J8jg==
X-Forwarded-Encrypted: i=1; AL+hErGVzVN0VOSTo8Ecnl/teN0DIdFXmFtkZdUkRGFcnnmCQIdCpwJJmgw3Rhb5oEdyE+rGWJd6@lists.linux.dev
X-Gm-Message-State: APuU4Z+8U2D3OwOwcVN9/UXKXWRoCBLaNwRNR2/7j0i3cma42RdVYBCs
	XkwUtnRtYfhRN7qLpCXqFDrazk4OH6X6NTOv9LO2Vwe2NooBlzqhaLM5OBXrmm4dRMtvs7LINwd
	dwg==
X-Received: from dlbvv25.prod.google.com ([2002:a05:7022:5f19:b0:1a4:c892:b166])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:907:b0:193:9aa3:474c
 with SMTP id a92af1059eb24-1b5568a9271mr3806499c88.21.1795202429856; Fri, 20
 Nov 2026 11:20:29 -0800 (PST)
Date: Fri, 20 Nov 2026 19:18:31 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120191831.2865901-1-elkin@google.com>
Subject: [PATCH] drm/rockchip: dw_hdmi: check IS_ERR() on drm_atomic_get_bridge_state()
From: Elkin Cruz <elkin@google.com>
To: Sandy Huang <hjc@rock-chips.com>, "=?UTF-8?q?Heiko=20St=C3=BCbner?=" <heiko@sntech.de>, Andy Yan <andyshrk@163.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>, Damon Ding <damon.ding@rock-chips.com>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

drm_atomic_get_bridge_state() returns an ERR_PTR() on failure rather
than NULL. dw_hdmi_rockchip_get_bus_format() checks !bridge_state and
then dereferences bridge_state->input_bus_cfg.format, which faults if an
error pointer is returned.

Use IS_ERR(bridge_state) instead of !bridge_state.

Fixes: dc70272cc184 ("drm/rockchip: dw_hdmi: Propagate bus format to display driver")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index b6e154c35e7c..30191927593b 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -286,7 +286,7 @@ static u32 dw_hdmi_rockchip_get_bus_format(struct drm_encoder *encoder,
 		return 0;
 
 	bridge_state = drm_atomic_get_bridge_state(conn_state->state, bridge);
-	if (!bridge_state)
+	if (IS_ERR(bridge_state))
 		return 0;
 
 	if (bridge_state->input_bus_cfg.format != MEDIA_BUS_FMT_FIXED)
-- 
2.56.1.750.gf70dc682cf-goog

