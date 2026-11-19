Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108132;
	b=TyNPbjpPBYXb71/vwN+zM43b+MceTcibeky+qDb0E9Id1u3hzmdnJ9lfqEwLOefSdDO4
	 v/7BnKAAw5GqVZfsfphijvRUlnQoflyaQioLp8hGa2QB8MeTys02mDcYTVShsCLJpYAR4
	 oP5XJCEHHRCIKH/9J/AkXmsveu0rAZA1y0OEvmgRhjgkoI66X0dbE4aMjFw6qUdgTLjpH
	 3irv9hcUrjrYAPwvCKH9atZFFFXXO2YXciuoJIhpxJ2k36Q3Sy2AEgGu1RP1R7aOp/KO/
	 AvBWy7M2pVxtRQOxAhCBiOia/nf/Lpoh+5ScAFbntdZGdT7YJR59PdrgSowBZ89Yhgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=leZoYmjJmyNxHBhQX+s+ycI0JfAwE3smojnVnGGLUJM=;
	b=KiykAuQDDRRtHLqXlxhiKj+tRbXgTUgxqD0Cm9oo6VB7dS+zQT93iMigntbrq7HYdJrJ
	 Z1UNpHXq7Jz1wZyuBOIVV6b51dNPxi8Qjm0n40eOUiM2qcI6sONgrUAgA5OOTm/AnSqwA
	 /GTjQgdRzN1n9F8wpNI7idIinpwOGb8lrx9HfIx9Fiy84A3Z76j9qBaQygnPJrfWwKlpB
	 IRuNelSpDHfPb37B5Ukpb+2UcZX19HtW0pFNXbUUkIRte+3UbesbAkJtQiM96v1ZWfUnX
	 3ICKfa2d60pA3YO+IZe1tvWSZjsXMa9Bpf3H4NSyXKzdTbRflGjhOO4NgMcYQMM7MnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CZhNhmX5;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772FC606A32C
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 772FC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CZhNhmX5
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed2c307e62so31464615ad.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108132; x=1795712932; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=leZoYmjJmyNxHBhQX+s+ycI0JfAwE3smojnVnGGLUJM=;
        b=CZhNhmX5RKy6nZqVOQ6Fopt4rBVY/jADCUTIHnP7vrRh0bV8jadUVx6X/x5g/ZzYTu
         LpD8xH4PMBGBBOB8P28MDF2Z8D6b1gN4pucqQtxO2omAkCy9b28Q1d5K/qtR8uVtMaIU
         08ecbbA+3hwz69KdxCPIsD5+sopECUZZLuhCtwfXXIIyK4F2K4290dAftNy7aYP+BblU
         wCB53S3I4jS0n3oZTwCv2IK0bWm9i7vcB3bL1Xxq5Gh9unhCr2JAXv4EtFy26Ca6iT3D
         FR9tLs/V2PMSGvf3lY7ZXELNcU76/+JHxbEl4+CusttAxvAaRrerSne7T2cEuSD+NcWu
         P2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108132; x=1795712932;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=leZoYmjJmyNxHBhQX+s+ycI0JfAwE3smojnVnGGLUJM=;
        b=ZeeY/uO2McbtWudG/VXlbXdYe9EXZQNTIUAOobgU/xjKzhOKlVMnKpjhx5pILMq0lx
         Ok8QEECncfXB7BK9Zw+hwV5ahpxx/Xb3wLtm5LTOmDgmilViTQb3wMNBRLAwMcQ3tSX5
         EE94wvfuvRlsqA7+KeiEQyxwoIedI7Hou8cIwBPl8YHfYkw1Jvm7lr0vwB4nvrp8gTDy
         TSp/34hYNpHbvCUSK5etgPbHPfhwc0ygBbOOb+Y7CK3cgYs/iPfLKvr9AyxcVhO8Rz2Z
         S00dqw9EqKX18bGTf4Di8qShqaX2Cc3xXaljIWSgvA0lYUd7OEeL4xWTraK4g6+lKV/0
         YuSQ==
X-Forwarded-Encrypted: i=1; AL+hErGLotqxM7pGgYPLJ9HDe7prfDkERo0IgOx4vLHNx/w59/1PYoMlTTvNDw5wdnOt7aNoYV8X@lists.linux.dev
X-Gm-Message-State: APuU4Z8TwOX8yRZA6foJMj6GOFNIWRVsdghQNlAPWYX94QnNqi/vkOtf
	AkWlrw4ZTQ0Gw3dUz07nfj92WpsQF/PN33KQCjX3vLd86dHV4y2ZKmwx1qdLW5DbGSWHE8qQpps
	bk4C9dkeKGA==
X-Received: from plri11.prod.google.com ([2002:a17:903:32cb:b0:2ed:a98:181b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e807:b0:2ee:1fab:158f
 with SMTP id d9443c01a7336-2f03f167d4emr5365765ad.43.1795108131385; Thu, 19
 Nov 2026 09:08:51 -0800 (PST)
Date: Thu, 19 Nov 2026 09:08:18 -0800
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
Message-ID: <20261119170818.1528087-1-irogers@google.com>
Subject: [PATCH] drm/panel: dsi-cm: Normalize mipi_dsi_dcs_read/write() return values
From: Ian Rogers <irogers@google.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When commit d4cf15372868 ("drm/omap: panel-dsi-cm: use DSI helpers")
converted dsicm_dcs_read_1() and dsicm_dcs_write_1() to
mipi_dsi_dcs_read() and mipi_dsi_dcs_write(), all callers in panel-dsi-cm
continued to check 'if (r)' expecting 0 on success and a negative errno on
failure. While OMAP's dsi_vc_dcs_read() populates the buffer and returns 0
on a successful read, mipi_dsi_dcs_read() on standard MIPI DSI hosts and
mipi_dsi_dcs_write() return the positive byte count transferred on
success:

1. A 1-byte DCS read returning 1 causes dsicm_get_id(),
   num_dsi_errors_show(), and hw_revision_show() to treat success as a
   non-zero return value (exposing 1 byte of uninitialized sysfs buffer).
2. If a DSI host returns 0 without writing the output byte,
   dsicm_power_on() and hw_revision_show() read uninitialized stack bytes
   (id1, id2, id3).
3. A successful 2-byte DCS write returns 2, causing dsicm_power_on() to
   abort at 'if (r) goto err;'.

Normalize both dsicm_dcs_read_1() and dsicm_dcs_write_1() to propagate
negative error codes and return 0 on non-negative return values (handling
both OMAP DSI returning 0 and standard DSI hosts returning byte counts),
zero-initialize *data in dsicm_dcs_read_1(), and zero-initialize id1,
id2, and id3 in hw_revision_show().

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Verified with a C unit test and build-tested under
LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized; not tested on DSI
command-mode panel hardware.

Fixes: d4cf15372868 ("drm/omap: panel-dsi-cm: use DSI helpers")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index ae6e9ffc46cb..1b40fe4f08d8 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -109,12 +109,25 @@ static void hw_guard_wait(struct panel_drv_data *ddata)
 
 static int dsicm_dcs_read_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 *data)
 {
-	return mipi_dsi_dcs_read(ddata->dsi, dcs_cmd, data, 1);
+	ssize_t ret;
+
+	*data = 0;
+	ret = mipi_dsi_dcs_read(ddata->dsi, dcs_cmd, data, 1);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int dsicm_dcs_write_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 param)
 {
-	return mipi_dsi_dcs_write(ddata->dsi, dcs_cmd, &param, 1);
+	ssize_t ret;
+
+	ret = mipi_dsi_dcs_write(ddata->dsi, dcs_cmd, &param, 1);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int dsicm_sleep_in(struct panel_drv_data *ddata)
@@ -238,7 +251,7 @@ static ssize_t hw_revision_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
-	u8 id1, id2, id3;
+	u8 id1 = 0, id2 = 0, id3 = 0;
 	int r = -ENODEV;
 
 	mutex_lock(&ddata->lock);
-- 
2.56.1.708.g77570a6a1d-goog

