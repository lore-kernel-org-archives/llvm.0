Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645476;
	b=ZbSPA8cZNl9QzntrejnmGGc+NCZto4ZJG+7BPDwmazWH36rc1PSm+A/WH6Y4Qsa8JQ6I
	 6odvWscafBPL9wUeW26fK4oq9jn42yFjtFFv3dRkyYEyhX2x7TTvji+vUFiPXcUy5k1kv
	 XUBXYt9xSDvVDkpJSfTasQYSyjyep/eLBMbEdGi9ybCUHoaevc9QXnw1j1xDhb7K+o0dr
	 9Q5C7ZrrTkRkBn6a1NkD98hwOTPhg1UxBPmVVaSbIPOTT8BHW3xfY4EcE/AYubFB9lmsx
	 ai9Re8o4tbdDNpAFQqK8lIEgosWGYMPsh2QrSOWMx6lxpkNXVmnn6pbYvN6H3xDAtzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=VpmCZyaDhiCrjNxeAIXeOLBMLi9KQfBBj22GsCf5Hkc=;
	b=ftSp8gMxPJ1VR1yvHi9U6y/H4vpFQ+9rMgfj28q/qfG7gsoCxRoZOwSSdKtYmNgwMXyn
	 mN/1oy6EZExDDYf+e5EaSnGzDm/7jLEkVnZ0Z2Mbe5fQg8Me7XDqYapluF69zq5CRLHfx
	 h4B6F9kL4ouHpDyOnY8sBrZhLt0p5wn0H0UMO9LEcBp/04VZ3zFokLG2v0kI2pNmpaeng
	 SDTr+IBD9qzSPKlxdhlLjHf9XmvVF0AKMh7Mmj3+mU688dyxVkdSxap02np/6vilimFqz
	 1JbxBRGjZagidoktC+VyA5niwL65LhAVKx/WMAS9dEbcjfrRmt+PbrrO1X1FbLtCelA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NT8nZdnC;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBE8606A6A5
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FBE8606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NT8nZdnC
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a65fca25so5303944eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645474; x=1796250274; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpmCZyaDhiCrjNxeAIXeOLBMLi9KQfBBj22GsCf5Hkc=;
        b=NT8nZdnC/ThA4BqmuV7leApytR4HFwOcaw3Hkpen+XwOmoOFstXCRs7M7CPJwMyDhL
         jGhHlJLodfyX3d4fdZzPsim57I+cycBTH0LKSV549sj9oWNwKaUsIV27VKhJSbtX5YkW
         GSMBk6TZX3XaFfguEGAJtV40R2vrlh3FNkS4QiLZjdJZojMztiZ9LuSVY6rUnahQ1Yfv
         wOt4ZxcJaysuVgcmWsOIIVIK9viE+TtPrjWZ+LAmw5Bx2y3MmpcjEAMxGOVxoAkgintZ
         0rrFCFLCX+I35cyqn7TglUZ+SLc8kQhqJVDejplgVDeTJ8tMVyMHAERT5IZpAY2WoDr7
         +FeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645474; x=1796250274;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpmCZyaDhiCrjNxeAIXeOLBMLi9KQfBBj22GsCf5Hkc=;
        b=KtD+lt9im7TiL1GSnJPpRcyiL9W9Hgo6q5nKgY1BJbBekPsPpnj2EVarxa/eB9QDkS
         GtTME7xN3roDx9r+JkR6scRTotkwT/W/yG5PRLdozxv/DQ+P26/W0oelRnPwdK28gYx9
         IbnSHP943k7xB+cohaiCHMBIYioKqJ32wk5gJl73ciSJYgEoiBEEHk8PdEr3SOLVZ+4U
         Xkm4Xmmqx/AQdZw2YbM+HCM2LByTqfall9t+RN3k/DwrJRXbn0WpuBXrgrOCOdpd9UnP
         bFDgl5wezbGKI6L+6RCdELXhxpicLHIU/gkRO82qI1ujyeulysca51PWZyKcArYmG6yK
         OONQ==
X-Forwarded-Encrypted: i=1; AL+hErEws5equnDAx2nOM+mB3DiL2EOBgheNPmLSts9Um4sgtQ1092lczi3fKLNQHGIw4wgktbza@lists.linux.dev
X-Gm-Message-State: APuU4Z8r0vtlMWwjMP8UGMicPojTqY1Tq2sSdJ6XkkSQF9REgpibATpz
	X7RvyMzmMgKZ0OYDs+20xzXZIGLalh2x22NlqgsKGARr/MhYXW7U6HkSNyEV+S+bjwj77QaXyJN
	A4Q==
X-Received: from dyw15.prod.google.com ([2002:a05:7300:880f:b0:351:4a2a:1ece])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:2108:b0:386:b99:8ff9
 with SMTP id 5a478bee46e88-3860b999354mr17111901eec.40.1795645473196; Wed, 25
 Nov 2026 14:24:33 -0800 (PST)
Date: Wed, 25 Nov 2026 22:22:59 +0000
In-Reply-To: <20261125222300.1438398-1-elkin@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261125222300.1438398-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222300.1438398-5-elkin@google.com>
Subject: [PATCH net 4/4] nfc: st95hf: fix probe init order and remove teardown UAF
From: Elkin Cruz <elkin@google.com>
To: David Heidelberg <david@ixit.cz>, Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, oe-linux-nfc@lists.linux.dev, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In st95hf_probe(), exchange_lock, rm_lock, and ddev/nfcdev are
initialized only after devm_request_threaded_irq(), leaving the IRQ
thread exposed to uninitialized synchronization primitives and a NULL
ddev if an interrupt arrives during probe. On teardown, st95hf_remove()
frees ddev while the threaded IRQ is still registered, and the end:
path in st95hf_irq_thread_handler() still calls complete_cb() after
nfcdev_free is set.

Initialize locks and allocate ddev before requesting the IRQ, skip
complete_cb() when nfcdev_free is set, and synchronize/free the IRQ via
devm_free_irq() before calling nfc_digital_free_device() in both
st95hf_probe() error paths and st95hf_remove().

This issue was found while trying out new Clang static analysis checks for
kernel bug classes. The finding was triaged and fixed, and this commit
description was drafted with the help of AI, then verified by code
inspection and compile-tested against linux-next (not reproduced and not
runtime-tested on hardware).

Fixes: cab47333f0f7 ("NFC: Add STMicroelectronics ST95HF driver")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/nfc/st95hf/core.c | 118 +++++++++++++++++++-------------------
 1 file changed, 60 insertions(+), 58 deletions(-)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index ead0c342996c..f6384d9c4da8 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -869,9 +869,12 @@ static irqreturn_t st95hf_irq_thread_handler(int irq, void  *st95hfcontext)
 	kfree_skb(skb_resp);
 	wtx = false;
 	cb_arg->rats = false;
-	skb_resp = ERR_PTR(result);
-	/* call of callback with error */
-	cb_arg->complete_cb(stcontext->ddev, cb_arg->cb_usrarg, skb_resp);
+	if (!stcontext->nfcdev_free) {
+		skb_resp = ERR_PTR(result);
+		/* call of callback with error */
+		cb_arg->complete_cb(stcontext->ddev, cb_arg->cb_usrarg,
+				    skb_resp);
+	}
 	/* up the semaphore before returning */
 	up(&stcontext->exchange_lock);
 	mutex_unlock(&stcontext->rm_lock);
@@ -1076,10 +1079,9 @@ MODULE_DEVICE_TABLE(of, st95hf_spi_of_match);
 static int st95hf_probe(struct spi_device *nfc_spi_dev)
 {
 	struct device *dev = &nfc_spi_dev->dev;
-	int ret;
-
-	struct st95hf_context *st95context;
 	struct st95hf_spi_context *spicontext;
+	struct st95hf_context *st95context;
+	int ret;
 
 	nfc_info(&nfc_spi_dev->dev, "ST95HF driver probe called.\n");
 
@@ -1094,6 +1096,17 @@ static int st95hf_probe(struct spi_device *nfc_spi_dev)
 	st95context->fwi =
 		cmd_array[CMD_ISO14443A_PROTOCOL_SELECT].cmd_params[2];
 
+	init_completion(&spicontext->done);
+	mutex_init(&spicontext->spi_lock);
+	sema_init(&st95context->exchange_lock, 1);
+	mutex_init(&st95context->rm_lock);
+
+	/*
+	 * Store spicontext in spi device object for using it in
+	 * remove function
+	 */
+	dev_set_drvdata(&nfc_spi_dev->dev, spicontext);
+
 	if (device_property_present(&nfc_spi_dev->dev, "st95hfvin")) {
 		st95context->st95hf_supply =
 			devm_regulator_get(&nfc_spi_dev->dev,
@@ -1110,15 +1123,6 @@ static int st95hf_probe(struct spi_device *nfc_spi_dev)
 		}
 	}
 
-	init_completion(&spicontext->done);
-	mutex_init(&spicontext->spi_lock);
-
-	/*
-	 * Store spicontext in spi device object for using it in
-	 * remove function
-	 */
-	dev_set_drvdata(&nfc_spi_dev->dev, spicontext);
-
 	st95context->enable_gpiod = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
 	if (IS_ERR(st95context->enable_gpiod)) {
 		ret = PTR_ERR(st95context->enable_gpiod);
@@ -1130,22 +1134,37 @@ static int st95hf_probe(struct spi_device *nfc_spi_dev)
 	if (ret)
 		goto err_disable_regulator;
 
-	if (nfc_spi_dev->irq > 0) {
-		if (devm_request_threaded_irq(&nfc_spi_dev->dev,
-					      nfc_spi_dev->irq,
-					      st95hf_irq_handler,
-					      st95hf_irq_thread_handler,
-					      IRQF_TRIGGER_FALLING,
-					      "st95hf",
-					      (void *)st95context) < 0) {
-			dev_err(&nfc_spi_dev->dev, "err: irq request for st95hf is failed\n");
-			ret =  -EINVAL;
-			goto err_disable_regulator;
-		}
-	} else {
+	/* create NFC dev object before requesting IRQ */
+	st95context->ddev = nfc_digital_allocate_device(&st95hf_nfc_digital_ops,
+							ST95HF_SUPPORTED_PROT,
+							ST95HF_CAPABILITIES,
+							ST95HF_HEADROOM_LEN,
+							ST95HF_TAILROOM_LEN);
+	if (!st95context->ddev) {
+		ret = -ENOMEM;
+		goto err_disable_regulator;
+	}
+
+	st95context->nfcdev = st95context->ddev->nfc_dev;
+	nfc_digital_set_parent_dev(st95context->ddev, &nfc_spi_dev->dev);
+	nfc_digital_set_drvdata(st95context->ddev, st95context);
+
+	if (nfc_spi_dev->irq <= 0) {
 		dev_err(&nfc_spi_dev->dev, "not a valid IRQ associated with ST95HF\n");
 		ret = -EINVAL;
-		goto err_disable_regulator;
+		goto err_free_digital_device;
+	}
+
+	ret = devm_request_threaded_irq(&nfc_spi_dev->dev,
+					nfc_spi_dev->irq,
+					st95hf_irq_handler,
+					st95hf_irq_thread_handler,
+					IRQF_TRIGGER_FALLING,
+					"st95hf",
+					(void *)st95context);
+	if (ret < 0) {
+		dev_err(&nfc_spi_dev->dev, "err: irq request for st95hf is failed\n");
+		goto err_free_digital_device;
 	}
 
 	/*
@@ -1157,44 +1176,26 @@ static int st95hf_probe(struct spi_device *nfc_spi_dev)
 	ret = st95hf_send_spi_reset_sequence(st95context);
 	if (ret) {
 		dev_err(&nfc_spi_dev->dev, "err: spi_reset_sequence failed\n");
-		goto err_disable_regulator;
+		goto err_free_irq;
 	}
 
 	/* call PowerOnReset sequence of ST95hf to activate it */
 	ret = st95hf_por_sequence(st95context);
 	if (ret) {
 		dev_err(&nfc_spi_dev->dev, "err: por seq failed for st95hf\n");
-		goto err_disable_regulator;
-	}
-
-	/* create NFC dev object and register with NFC Subsystem */
-	st95context->ddev = nfc_digital_allocate_device(&st95hf_nfc_digital_ops,
-							ST95HF_SUPPORTED_PROT,
-							ST95HF_CAPABILITIES,
-							ST95HF_HEADROOM_LEN,
-							ST95HF_TAILROOM_LEN);
-	if (!st95context->ddev) {
-		ret = -ENOMEM;
-		goto err_disable_regulator;
+		goto err_free_irq;
 	}
 
-	st95context->nfcdev = st95context->ddev->nfc_dev;
-	nfc_digital_set_parent_dev(st95context->ddev, &nfc_spi_dev->dev);
-
-	ret =  nfc_digital_register_device(st95context->ddev);
+	ret = nfc_digital_register_device(st95context->ddev);
 	if (ret) {
 		dev_err(&st95context->nfcdev->dev, "st95hf registration failed\n");
-		goto err_free_digital_device;
+		goto err_free_irq;
 	}
 
-	/* store st95context in nfc device object */
-	nfc_digital_set_drvdata(st95context->ddev, st95context);
-
-	sema_init(&st95context->exchange_lock, 1);
-	mutex_init(&st95context->rm_lock);
-
-	return ret;
+	return 0;
 
+err_free_irq:
+	devm_free_irq(&nfc_spi_dev->dev, nfc_spi_dev->irq, st95context);
 err_free_digital_device:
 	nfc_digital_free_device(st95context->ddev);
 err_disable_regulator:
@@ -1206,18 +1207,16 @@ static int st95hf_probe(struct spi_device *nfc_spi_dev)
 
 static void st95hf_remove(struct spi_device *nfc_spi_dev)
 {
-	int result = 0;
-	unsigned char reset_cmd = ST95HF_COMMAND_RESET;
 	struct st95hf_spi_context *spictx = dev_get_drvdata(&nfc_spi_dev->dev);
-
 	struct st95hf_context *stcontext = container_of(spictx,
 							struct st95hf_context,
 							spicontext);
+	unsigned char reset_cmd = ST95HF_COMMAND_RESET;
+	int result = 0;
 
 	mutex_lock(&stcontext->rm_lock);
 
 	nfc_digital_unregister_device(stcontext->ddev);
-	nfc_digital_free_device(stcontext->ddev);
 	stcontext->nfcdev_free = true;
 
 	mutex_unlock(&stcontext->rm_lock);
@@ -1227,6 +1226,9 @@ static void st95hf_remove(struct spi_device *nfc_spi_dev)
 	if (result == -EINTR)
 		dev_err(&spictx->spidev->dev, "sleep for semaphore interrupted by signal\n");
 
+	devm_free_irq(&nfc_spi_dev->dev, nfc_spi_dev->irq, stcontext);
+	nfc_digital_free_device(stcontext->ddev);
+
 	/* next reset the ST95HF controller */
 	result = st95hf_spi_send(&stcontext->spicontext,
 				 &reset_cmd,
-- 
2.56.1.839.g22a8290db9-goog

