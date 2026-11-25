Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645533;
	b=OjWzKrqY/n5tNvgdGh8kTlxD0/BGWYftKTEnttlIhn/BDLMRi5hvzzPz9eklIytI6xZW
	 JoLZAmygF709iBmfnxEhZi3xvKPDRRIDxVedk/zb8xqoQyfIj9mH5ala1UA2rafjZrBoH
	 8aBeafsyKpwMB+CaycHrCpDBlR0vsds/JsvZYolQ5A2/y9wQyUSnFCUdnGCccKoWRegaQ
	 vkOqt28I0wEb/pcWG1S/DB8TStftvDc9Yd95nyIYITYOrj/uU/5RaWR4zW6t0SijpeN+X
	 kUOrmq9fgLXrCaXQ+crp1VtYsmJ9vhZd79SVDQyK58R9e1cZU8nb5U8P+TcoxXscaLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=AOwnGeEvMBKI7TRyjGtfXvp7wm6CBN9E9DeU964AMeM=;
	b=45JHSG9p2URvILjlpspkt2o4wGYPKWCsie/mWbO+0v7XVMP1QZfG/VpSaZHLMsw8TB7A
	 0BcB6gCSjmrhvo8n6c3DCwxiGHq6jgwhPeiQOP2oVx6722MV4EgVBNFx2VkQman2IKyQs
	 CalY9lXGa0g28UBV5egrG7c7wuuwLzqsrCFgNer9jaJUnjYQ9uxhywKMMGvKkfcouDdSU
	 riz7+ruDQ/Kx+jpMNf5nwK8LQu6KgQAhnfHNSNeyS7Sf+SpXn79pac7lcZ7BNb8j2RGbb
	 SQpTNzPlstfIBWv3BWzq0DLY9rf07KF21AHPsldAXa8SOUNsdcnmQVDiFXqtwq8fDEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YD3EZTdf;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9AE60A383B
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A9AE60A383B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YD3EZTdf
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b45597c7so1895313c88.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645532; x=1796250332; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOwnGeEvMBKI7TRyjGtfXvp7wm6CBN9E9DeU964AMeM=;
        b=YD3EZTdfIIOSX5s+Io0EZcfwK3ybWiQ8wLZjqSNuu7aXB9OR+iaoJssSqU7h++tkfr
         2EgJ2dlC/jaz21b1JSb8PfNZgL/7i1SLlEIRtodt7YXLMu9/RSQYQt0WFBlXr1hHqEn4
         Z1CO4ao0v9HS/M4C+XND7UrhjYPWO39Z6nbY/wJoW44Z0dkurSLb+jIM6h9bAljQBS12
         N017CL3OiRirP8qCxYN++ncGaHEKUzm3Ak/0u5NnmqjbtckuSNubh1b/zDd+SYahIF/U
         aybgRaPTsSjO/v9F9qNTR+wk2dvDxAzq7GdEGLJdtZgySmgnM6ihyh0Vi8gWnOmJr5Av
         +VVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645532; x=1796250332;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOwnGeEvMBKI7TRyjGtfXvp7wm6CBN9E9DeU964AMeM=;
        b=SxnU7cpvLR99ZExuRU9Hev/lo5FnndZ5O0+c1c//nQ8KQM2gOJn6U9fXck0+a6OTqB
         Nw/q0aknTndIOx2sXLQUnwaAzpblU2vhFHJVClCkfjc38n0bwouiIuN9tfGeAd2bgDP5
         s3rel9UAFEhR1Ugp0u8uXdReMr7cmDfFWqQX5Z8976umuB7tU12SZEIGvraum5pjblwg
         hmTqYZLmeNQZy7ZxQuyfujprHONW3oi2wp5fzIh9EmheUf0AE1JBaubyfuoq13w1NI+F
         97PDZ1JHB30XNIga3IHGTeL2kFc9IcFBypAPDBhRI4KC5t6I5RMjFt0uxlanDdfseXiC
         BEJg==
X-Forwarded-Encrypted: i=1; AL+hErF7qA0ndGEJ+uYVBU4fu1Dy6l4Ep/J+dZOJtV9VorVdlZblnDUGyrv8dgkGPOO7o6cg788o@lists.linux.dev
X-Gm-Message-State: APuU4Z8c2dY+6r6kplvNz+Lvf8+jyY7qfGZKRl4htTAdUonRuXUDaXyC
	gFpZ4DDp26HQwQX/e6DY/N01ydO+qSY/450ZxASxCNwYEXN388zZy7GjDMrxvtgSoMXjUj3l4YT
	lcg==
X-Received: from dldz4-n1.prod.google.com ([2002:a05:701b:4184:10b0:1b3:af3d:1632])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ed02:b0:149:50cb:2175
 with SMTP id a92af1059eb24-1b5568fda53mr18476947c88.33.1795645532051; Wed, 25
 Nov 2026 14:25:32 -0800 (PST)
Date: Wed, 25 Nov 2026 22:25:11 +0000
In-Reply-To: <20261125222513.1446099-1-elkin@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261125222513.1446099-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222513.1446099-2-elkin@google.com>
Subject: [PATCH 1/3] drm/sitronix: st7920: Use DMA-safe serialized TX buffer
 for SPI writes
From: Elkin Cruz <elkin@google.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In st7920_spi_write(), u8 reg[CMD_SIZE] is allocated on the stack and
passed directly to spi_write(), violating SPI DMA safety requirements
when CONFIG_VMAP_STACK is enabled or an IOMMU is in use.

Embed an ARCH_DMA_MINALIGN-aligned TX buffer at the end of
struct st7920_device protected by a DRM-managed mutex, and pass
st7920 to st7920_spi_write().

Fixes: 88b09229f34a ("drm: Add driver for Sitronix ST7920 LCD displays")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/gpu/drm/sitronix/st7920.c | 43 +++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7920.c b/drivers/gpu/drm/sitronix/st7920.c
index 616d83387d31..091e80d8bda5 100644
--- a/drivers/gpu/drm/sitronix/st7920.c
+++ b/drivers/gpu/drm/sitronix/st7920.c
@@ -7,9 +7,12 @@
  */
 
 #include <linux/bitrev.h>
+#include <linux/cache.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/spi/spi.h>
 
@@ -24,6 +27,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -86,6 +90,10 @@ struct st7920_device {
 
 	u32 height;
 	u32 width;
+
+	/* Serializes SPI command and GDRAM transfers using tx_buf */
+	struct mutex tx_lock;
+	u8 tx_buf[CMD_SIZE] __aligned(ARCH_DMA_MINALIGN);
 };
 
 struct st7920_plane_state {
@@ -165,16 +173,21 @@ static int st7920_store_others(int cmd, const void *data, u8 *reg)
 	return i;
 }
 
-static void st7920_spi_write(struct spi_device *spi, int cmd, const void *data,
-			     int delay_us, struct spi7920_error *err)
+static void st7920_spi_write(struct st7920_device *st7920, int cmd,
+			     const void *data, int delay_us,
+			     struct spi7920_error *err)
 {
-	u8 reg[CMD_SIZE] = {0};
+	u8 *reg = st7920->tx_buf;
 	int size = 0;
 	int ret;
 
 	if (err->errno)
 		return;
 
+	guard(mutex)(&st7920->tx_lock);
+
+	memset(reg, 0, CMD_SIZE);
+
 	/*
 	 * First the sync bits are sent: 11111WS0.
 	 * Where W is the read/write (RW) bit and S is the register/data (RS) bit.
@@ -190,7 +203,7 @@ static void st7920_spi_write(struct spi_device *spi, int cmd, const void *data,
 	else
 		size = st7920_store_others(cmd, data, reg);
 
-	ret = spi_write(spi, reg, size);
+	ret = spi_write(st7920->spi, reg, size);
 	if (ret) {
 		err->errno = ret;
 		return;
@@ -232,14 +245,14 @@ MODULE_DEVICE_TABLE(spi, st7920_spi_id);
 static void st7920_power_on(struct st7920_device *st7920,
 			    struct spi7920_error *err)
 {
-	st7920_spi_write(st7920->spi, SET_DISPLAY_ON, NULL, 72, err);
+	st7920_spi_write(st7920, SET_DISPLAY_ON, NULL, 72, err);
 }
 
 static void st7920_power_off(struct st7920_device *st7920,
 			     struct spi7920_error *err)
 {
-	st7920_spi_write(st7920->spi, SET_DISPLAY_CLEAR, NULL, 1600, err);
-	st7920_spi_write(st7920->spi, SET_DISPLAY_OFF, NULL, 72, err);
+	st7920_spi_write(st7920, SET_DISPLAY_CLEAR, NULL, 1600, err);
+	st7920_spi_write(st7920, SET_DISPLAY_OFF, NULL, 72, err);
 }
 
 static void st7920_hw_reset(struct st7920_device *st7920)
@@ -257,10 +270,10 @@ static int st7920_init(struct st7920_device *st7920)
 {
 	struct spi7920_error err = {0};
 
-	st7920_spi_write(st7920->spi, SET_BASIC_INSTRUCTION_SET, NULL, 72, &err);
+	st7920_spi_write(st7920, SET_BASIC_INSTRUCTION_SET, NULL, 72, &err);
 	st7920_power_on(st7920, &err);
-	st7920_spi_write(st7920->spi, SET_GRAPHICS_DISPLAY, NULL, 72, &err);
-	st7920_spi_write(st7920->spi, SET_DISPLAY_CLEAR, NULL, 1600, &err);
+	st7920_spi_write(st7920, SET_GRAPHICS_DISPLAY, NULL, 72, &err);
+	st7920_spi_write(st7920, SET_DISPLAY_CLEAR, NULL, 1600, &err);
 
 	return err.errno;
 }
@@ -296,8 +309,8 @@ static int st7920_update_rect(struct st7920_device *st7920,
 			data_array[array_idx++] = line_buffer[j];
 		}
 
-		st7920_spi_write(st7920->spi, SET_GDRAM_ADDRESS, &i, 72, &err);
-		st7920_spi_write(st7920->spi, SET_GDRAM_DATA, line_buffer, 72, &err);
+		st7920_spi_write(st7920, SET_GDRAM_ADDRESS, &i, 72, &err);
+		st7920_spi_write(st7920, SET_GDRAM_DATA, line_buffer, 72, &err);
 	}
 
 	return err.errno;
@@ -309,7 +322,7 @@ static void st7920_clear_screen(struct st7920_device *st7920, u8 *data_array)
 
 	memset(data_array, 0, BYTES_IN_DISPLAY);
 
-	st7920_spi_write(st7920->spi, SET_DISPLAY_CLEAR, NULL, 1600, &err);
+	st7920_spi_write(st7920, SET_DISPLAY_CLEAR, NULL, 1600, &err);
 }
 
 static int st7920_fb_blit_rect(struct drm_framebuffer *fb,
@@ -812,6 +825,10 @@ static int st7920_probe(struct spi_device *spi)
 	st7920->width = ST7920_DEFAULT_WIDTH;
 	st7920->height = ST7920_DEFAULT_HEIGHT;
 
+	ret = drmm_mutex_init(drm, &st7920->tx_lock);
+	if (ret)
+		return ret;
+
 	st7920->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(st7920->reset_gpio)) {
 		ret = PTR_ERR(st7920->reset_gpio);
-- 
2.56.1.839.g22a8290db9-goog

