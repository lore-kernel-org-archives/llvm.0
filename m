Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645471;
	b=aJ9X7bmIWwfIb3ILIiTgUiUGnJF9wkZw+NU4Gi1/ZFWxxaduWC8G7Fxcz+wqjbR8pRfT
	 yv4f+ugvOxS5HXoWDql6WNkQRhafx8pKtP15G/ggoIEBmB/JcD4MDkUjD3beuhenpnybx
	 7qhU2wrFPtLu9uuyI4Q9ssGLNLRsMNPBCa965dcfxxxJkCU7e2R9zcdaWWPFDtLYskBvW
	 EwsHDiTb7GZHtoAcdc6qcCgAN5nnxyWscUiGNq4KEsc8DVqlBfSAf5c1PTvujfHXYfcA5
	 8YWz6162xZWH3jiZSkbaLMaEmd3o4G07EiY7Jt6yF6HuIpEzUvrGp5NDX2ed4OsTmTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=YDYS9n9lT5gSkIV69W1btVTMHd2XxfQrN36gTu5mxFk=;
	b=Kt26edUHUPU/M3RTykdWRLtm2GCJAcbgNJF23WWv8ExDnteLN3gAOib6xwyUqCef8Ek/
	 ftvsPB8ShlmLpofoSCzq+xqtXqHIY6X0eLcQtT05riKq7n37MIMWwzoU4zL75w2adUTmk
	 VsvQkGj7PUQkDOgq3mehEpCHP7hK4j/ObW+Fa1ztyCyU+lTZeRQh1wqb/2mXZIMSJHYUM
	 LgGZfB9Sa0NpGE1r4dPLXF1I3zIl/0dBanpmzk/bNzVKVMWPmS9ZjOxEh/AhniqJTCASa
	 j3CggEI0J2BplGMYH7pOF7LCMkO31oeO/lGrnnuZpUbUCmzcgQbqxrm4DEKIe+x1dfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DFDn8rfa;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53989606A33B
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53989606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DFDn8rfa
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-382af5cfc58so1802323eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645469; x=1796250269; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDYS9n9lT5gSkIV69W1btVTMHd2XxfQrN36gTu5mxFk=;
        b=DFDn8rfau3E30FZXhyKn1tK/fRbFuogif0eiImgHPmOYkuGkSODwBAYiPweyCUszK/
         Z8+jNGVPLW3B1QryRYGP4+jY0+aRfKsPvE6JWIM6bjaVL/4o8yAn9xzp5NoPM7zMe6a6
         gItvvGS91/NNwiC7zdyAppsTh1cMHipbJmCwD4X5BywtMhgjsNl23tXUyGToDDesEnSC
         gBnEsAUnd8V0OsSbppT9CUENUKYNSZQoVXckwSqtb3ZWljIf6AHxlKz9YBzQczWBD25O
         8hTNVYQEusjGNC5j0OatstfmSB1HFiEMsrXtZsQTxuuQrmTs/7TEFWG25HTMb7PWxtqa
         k9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645469; x=1796250269;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDYS9n9lT5gSkIV69W1btVTMHd2XxfQrN36gTu5mxFk=;
        b=095qcjjW9AxEaGwXw2KOeipsq+qnqO3udKcUHV2cfjhK8ZHK+LurerEazrzQ7wYeIF
         hWiuq2cfdmzkvtgh8pb8nYKSj7gaU/yv48RFcQw1fL+rDMMG3RU62UMvlMAPVQcrZ8M5
         Vvw7oeBWHx0YVNeN62n161CV9J7f5UzYhne+mUn4io13YE2ecMoBY+SqXdOzWrs69nRM
         CWmZ1cckOtdqTe8QuvJVpgmVKHp+GarlfM9Jx8fLJPM/QDzwC2Rk9Mzzd2cjCJ1Ct3fR
         vxQfsPeiiLZ9VGIbr8PVB8bUvmWWDWLGLsqm8DQwASJiKY24lfXD7aMp66wmtbPz2FDK
         YPxA==
X-Forwarded-Encrypted: i=1; AL+hErEyjUfPW2VV5AI0bY/68W5EvgX7OYmBxEzGnSmXRDSP0sOn5DLAmiDxizQDuduanJc8zeAe@lists.linux.dev
X-Gm-Message-State: APuU4Z8wvi+aNvXDmg+csFFC1EASOIQLwam+2oPvTvIUneMiNwy32cMA
	ptWros2ST//GK6KtlGdZTnJLyYf8Z0WrgYYDL+y0KgnHIzVNOS2rCx9r0RH383PxzgIJ2hPurPO
	l+Q==
X-Received: from dybsl8.prod.google.com ([2002:a05:7301:7308:b0:379:1aaf:7a27])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:460f:b0:386:c850:1f25
 with SMTP id 5a478bee46e88-386c8502211mr5715418eec.21.1795645468936; Wed, 25
 Nov 2026 14:24:28 -0800 (PST)
Date: Wed, 25 Nov 2026 22:22:57 +0000
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
Message-ID: <20261125222300.1438398-3-elkin@google.com>
Subject: [PATCH net 2/4] nfc: st95hf: use DMA-safe buffers for SPI transfers
From: Elkin Cruz <elkin@google.com>
To: David Heidelberg <david@ixit.cz>, Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, oe-linux-nfc@lists.linux.dev, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

st95hf_spi_send(), st95hf_spi_recv_response(), and
st95hf_spi_recv_echo_res() pass stack-allocated buffers from core.c and
spi.c directly to spi_sync(), violating kernel DMA safety requirements
on DMA-capable SPI controllers and CONFIG_VMAP_STACK kernels.

Use kmemdup() in st95hf_spi_send(), spi_write_then_read() in
st95hf_spi_recv_echo_res(), and DMA-cacheline-isolated cmd_buf and
rx_buf members (via __dma_from_device_group_begin/end) in
struct st95hf_spi_context for st95hf_spi_recv_response().

This issue was found while trying out new Clang static analysis checks for
kernel bug classes. The finding was triaged and fixed, and this commit
description was drafted with the help of AI, then verified by code
inspection and compile-tested against linux-next (not reproduced and not
runtime-tested on hardware).

Fixes: cab47333f0f7 ("NFC: Add STMicroelectronics ST95HF driver")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/nfc/st95hf/spi.c | 52 +++++++++++++++++++++-------------------
 drivers/nfc/st95hf/spi.h | 10 ++++++++
 2 files changed, 37 insertions(+), 25 deletions(-)

diff --git a/drivers/nfc/st95hf/spi.c b/drivers/nfc/st95hf/spi.c
index a6599d65a3bf..8bd7eccc34d3 100644
--- a/drivers/nfc/st95hf/spi.c
+++ b/drivers/nfc/st95hf/spi.c
@@ -14,13 +14,18 @@ int st95hf_spi_send(struct st95hf_spi_context *spicontext,
 		    int datalen,
 		    enum req_type reqtype)
 {
-	struct spi_message m;
-	int result = 0;
 	struct spi_device *spidev = spicontext->spidev;
 	struct spi_transfer tx_transfer = {
-		.tx_buf = buffertx,
 		.len = datalen,
 	};
+	unsigned char *tx_buf;
+	struct spi_message m;
+	int result = 0;
+
+	tx_buf = kmemdup(buffertx, datalen, GFP_KERNEL);
+	if (!tx_buf)
+		return -ENOMEM;
+	tx_transfer.tx_buf = tx_buf;
 
 	mutex_lock(&spicontext->spi_lock);
 
@@ -35,6 +40,7 @@ int st95hf_spi_send(struct st95hf_spi_context *spicontext,
 	spi_message_add_tail(&tx_transfer, &m);
 
 	result = spi_sync(spidev, &m);
+	kfree(tx_buf);
 	if (result) {
 		dev_err(&spidev->dev, "error: sending cmd to st95hf using SPI = %d\n",
 			result);
@@ -69,12 +75,11 @@ int st95hf_spi_recv_response(struct st95hf_spi_context *spicontext,
 			     unsigned char *receivebuff,
 			     size_t max_len)
 {
-	unsigned char readdata_cmd = ST95HF_COMMAND_RECEIVE;
 	struct spi_device *spidev = spicontext->spidev;
 	struct spi_transfer tx_takedata;
 	struct spi_transfer t[2] = {
-		{ .tx_buf = &readdata_cmd, .len = 1 },
-		{ .rx_buf = receivebuff, .len = 2, .cs_change = 1 },
+		{ .len = 1 },
+		{ .len = 2, .cs_change = 1 },
 	};
 	struct spi_message m;
 	int len = 0;
@@ -85,6 +90,10 @@ int st95hf_spi_recv_response(struct st95hf_spi_context *spicontext,
 
 	mutex_lock(&spicontext->spi_lock);
 
+	spicontext->cmd_buf = ST95HF_COMMAND_RECEIVE;
+	t[0].tx_buf = &spicontext->cmd_buf;
+	t[1].rx_buf = spicontext->rx_buf;
+
 	/* First spi transfer to know the length of valid data */
 	spi_message_init(&m);
 	spi_message_add_tail(&t[0], &m);
@@ -102,12 +111,13 @@ int st95hf_spi_recv_response(struct st95hf_spi_context *spicontext,
 	len = 2;
 
 	/* Support of long frame */
-	if (receivebuff[0] & 0x60)
-		len += (((receivebuff[0] & 0x60) >> 5) << 8) | receivebuff[1];
+	if (spicontext->rx_buf[0] & 0x60)
+		len += (((spicontext->rx_buf[0] & 0x60) >> 5) << 8) |
+		       spicontext->rx_buf[1];
 	else
-		len += receivebuff[1];
+		len += spicontext->rx_buf[1];
 
-	if (len > max_len) {
+	if (len > max_len || len > ST95HF_MAX_RESPONSE_BUFFER_SIZE) {
 		dev_err(&spidev->dev, "spi_recv_resp, invalid response len = %d\n",
 			len);
 		memset(&tx_takedata, 0x0, sizeof(struct spi_transfer));
@@ -120,21 +130,23 @@ int st95hf_spi_recv_response(struct st95hf_spi_context *spicontext,
 
 	/* Now make a transfer to read only relevant bytes */
 	memset(&tx_takedata, 0x0, sizeof(struct spi_transfer));
-	tx_takedata.rx_buf = &receivebuff[2];
+	tx_takedata.rx_buf = &spicontext->rx_buf[2];
 	tx_takedata.len = len - 2;
 
 	spi_message_init(&m);
 	spi_message_add_tail(&tx_takedata, &m);
 
 	ret = spi_sync(spidev, &m);
-
-	mutex_unlock(&spicontext->spi_lock);
 	if (ret) {
 		dev_err(&spidev->dev, "spi_recv_resp, data read error = %d\n",
 			ret);
+		mutex_unlock(&spicontext->spi_lock);
 		return ret;
 	}
 
+	memcpy(receivebuff, spicontext->rx_buf, len);
+	mutex_unlock(&spicontext->spi_lock);
+
 	return len;
 }
 EXPORT_SYMBOL_GPL(st95hf_spi_recv_response);
@@ -143,21 +155,11 @@ int st95hf_spi_recv_echo_res(struct st95hf_spi_context *spicontext,
 			     unsigned char *receivebuff)
 {
 	unsigned char readdata_cmd = ST95HF_COMMAND_RECEIVE;
-	struct spi_transfer t[2] = {
-		{.tx_buf = &readdata_cmd, .len = 1,},
-		{.rx_buf = receivebuff, .len = 1,},
-	};
-	struct spi_message m;
 	struct spi_device *spidev = spicontext->spidev;
-	int ret = 0;
+	int ret;
 
 	mutex_lock(&spicontext->spi_lock);
-
-	spi_message_init(&m);
-	spi_message_add_tail(&t[0], &m);
-	spi_message_add_tail(&t[1], &m);
-	ret = spi_sync(spidev, &m);
-
+	ret = spi_write_then_read(spidev, &readdata_cmd, 1, receivebuff, 1);
 	mutex_unlock(&spicontext->spi_lock);
 
 	if (ret)
diff --git a/drivers/nfc/st95hf/spi.h b/drivers/nfc/st95hf/spi.h
index 840f55f82899..6fbace4412d9 100644
--- a/drivers/nfc/st95hf/spi.h
+++ b/drivers/nfc/st95hf/spi.h
@@ -9,6 +9,7 @@
 #ifndef __LINUX_ST95HF_SPI_H
 #define __LINUX_ST95HF_SPI_H
 
+#include <linux/dma-mapping.h>
 #include <linux/spi/spi.h>
 
 /* Basic ST95HF SPI CMDs */
@@ -17,6 +18,7 @@
 #define ST95HF_COMMAND_RECEIVE	0x2
 
 #define ST95HF_RESET_CMD_LEN	0x1
+#define ST95HF_MAX_RESPONSE_BUFFER_SIZE	280
 
 /*
  * structure to contain st95hf spi communication specific information.
@@ -25,12 +27,20 @@
  * @done: completion structure to wait for st95hf response
  *	for synchronous calls.
  * @spi_lock: mutex to allow only one spi transfer at a time.
+ * @cmd_buf: DMA-safe buffer for command byte.
+ * @rx_buf: DMA-safe buffer for response transfers.
  */
 struct st95hf_spi_context {
 	bool req_issync;
 	struct spi_device *spidev;
 	struct completion done;
 	struct mutex spi_lock;
+	__dma_from_device_group_begin(cmd);
+	u8 cmd_buf;
+	__dma_from_device_group_end(cmd);
+	__dma_from_device_group_begin(rx);
+	u8 rx_buf[ST95HF_MAX_RESPONSE_BUFFER_SIZE];
+	__dma_from_device_group_end(rx);
 };
 
 /* flag to differentiate synchronous & asynchronous spi request */
-- 
2.56.1.839.g22a8290db9-goog

