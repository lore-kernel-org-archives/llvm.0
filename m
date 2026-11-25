Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645427;
	b=x1O6WQcZNMWKS7pWMow5lvyJviUuhlvXWoonwZUcFHkdrpFbgP5dlDl2BgUph9MPr8Lx
	 Ou4ADoP19yV2Z4T6Q6hIrZxc5FIahegZnzNUdeBU2OaU4bR6+xW67ZooItm80THFh77G6
	 /7wUIwx6Ul7s8m/btrp1APkKBHrqABNm19wlyCR1tZUnkAk4JKbfqQchBbR3qSX7cSE0J
	 KrCGx2FVqYMoAqPez8CTh0lA00pnR7YPwxKvF/8JrCf2mGPFRJDcUulPAceRFpS5XbOMw
	 vW6SW94YyMW/uEqUajhNHbp6iViBmj5OXtg354fLImJrfmmHLUvvSqcQ3SRjrds70FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/tS6CVqz0bwQhURF3f4/c8xLuOeYAnVMzoUdEwuEpSs=;
	b=yhzooedvWrVMF8P2/N4pp3ci5ZsyaMzm7Ux15nDE0wfO09g+3Wq3STip5HEmAvedv6OK
	 roD3Vay6/kR4SeowWfi1JQRCKr9V5yosSDbtoUI7CcDMlfNDH9etYlW29ca5Mwnv4ccXV
	 XmA0TPVV4jW/DJuFdvKVMLX0hwyVmYGQfq5StT+Po3rEJ5zMsOBglq63A7P9XG06r5I/s
	 sglbCv+6jq98cvpJ7LmyGHuRNXXjNjJAjPOe0uPUAH5AnI6zCBs46z7awK0KMMeeFwICf
	 smNOshizpjEagMFExqAdGFqykyj/7TnINDhwejH4NXCorhbcVjto1tOiRaKrkhJDayw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CDov0XuG;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C087D606A333
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C087D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CDov0XuG
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38355b03cb8so5976103eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645426; x=1796250226; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/tS6CVqz0bwQhURF3f4/c8xLuOeYAnVMzoUdEwuEpSs=;
        b=CDov0XuGOCKQP92H97+K6wrMYOnfmqpxkmUPj2kvwcg35xueZDkoG5/xQhK9bhvSwQ
         qdnJA4xmJtSUdOZgSaFW5cuGvLcaCQOx9CLMGVyX7NWqLEiNBum5LEs+rHXS72qyiYjy
         ldhqXOn188X/LMgFX4fHQgTn2T6ENx2CBPlCuqwFjsAB/ID8zjKBD4ZuZDHjR4JdhRnF
         9u6MCP7nvHr5zn56P571HNYAQQ51cP6olG50hnT/yZef5+azs8NRuuUty6FjVn/Fo3JV
         CmRmn2sAfZXQra22mEcZjWYuNzEsISwvT0YR2rmK3rpYsAfScaIFbR9tWqLewjJg8i8X
         MyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645426; x=1796250226;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/tS6CVqz0bwQhURF3f4/c8xLuOeYAnVMzoUdEwuEpSs=;
        b=xGYU82Czappy0JfGpuWnMopavF6VwKqYhBwdJO6kNNji6bv+K4BPiJFhMZS5mETF4p
         JbDQiRcWzVsXNgHdXl/X2teZEf/QgiMTtbgzVF0GPz5Q8GKBb0J/yLQDb8J8G7he/4Sf
         i0eQnT/Kkj1iiBiCIw4iboN98xFLN8QsW3KiBwlQEX6evYwVUbdb0fVbYMf/eVOPRN38
         E2SF3H/i3JTpkdoXM/WekOel7Za4+yOJzSyqIpXHgkbmrhMR7G5Y6uHDinSsJZ6CjWFZ
         UT6uOJXw117o4aMeTiWM6S6MQmOAq362P4iC5er6BskIHqsy9LH+StJbLr/Td09B4FHk
         OIQg==
X-Forwarded-Encrypted: i=1; AL+hErHdFdojxSW9p3HIgry5yJ1t9MC5IX9j6SxZ0IjFuH+ppH76UEWw1Ql8M+2UUIIzZ8jBHLlJ@lists.linux.dev
X-Gm-Message-State: APuU4Z8hgrMyuGYug75euxb2lO02lDASVokHTGFd0cJ399xLlOxB86oq
	Joq2/QU3MU7BKY/BpW4LGS8SH0WblPgSDumnYMA5ERjpTqTIpanf6Sd88kPuEzvu+wd+5UFCLPM
	pKg==
X-Received: from dyblz33.prod.google.com ([2002:a05:7301:1621:b0:34c:9660:9612])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d205:b0:36a:1f8:a56e
 with SMTP id 5a478bee46e88-3856fe564a1mr19200647eec.23.1795645425499; Wed, 25
 Nov 2026 14:23:45 -0800 (PST)
Date: Wed, 25 Nov 2026 22:22:56 +0000
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
Message-ID: <20261125222300.1438398-2-elkin@google.com>
Subject: [PATCH net 1/4] nfc: st95hf: bound SPI receive length in st95hf_spi_recv_response()
From: Elkin Cruz <elkin@google.com>
To: David Heidelberg <david@ixit.cz>, Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, oe-linux-nfc@lists.linux.dev, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

st95hf_spi_recv_response() computes up to 1025 bytes of response length
from the 2-byte SPI header and reads the payload directly into
receivebuff without checking the destination buffer capacity. A
malformed or unexpected response overflows the 2-byte stack buffer in
st95hf_send_recv_cmd() or the 280-byte skb buffer in
st95hf_irq_thread_handler().

Pass the destination buffer capacity max_len to
st95hf_spi_recv_response() and reject lengths exceeding max_len with
-EMSGSIZE after deasserting chip-select via an empty trailing transfer.

This issue was found while trying out new Clang static analysis checks for
kernel bug classes. The finding was triaged and fixed, and this commit
description was drafted with the help of AI, then verified by code
inspection and compile-tested against linux-next (not reproduced and not
runtime-tested on hardware).

Fixes: cab47333f0f7 ("NFC: Add STMicroelectronics ST95HF driver")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/nfc/st95hf/core.c |  6 ++++--
 drivers/nfc/st95hf/spi.c  | 31 ++++++++++++++++++++++---------
 drivers/nfc/st95hf/spi.h  |  3 ++-
 3 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index dcc9e53815ca..d7ac7ede1259 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -283,7 +283,8 @@ static int st95hf_send_recv_cmd(struct st95hf_context *st95context,
 		unsigned char st95hf_response_arr[2];
 
 		ret = st95hf_spi_recv_response(&st95context->spicontext,
-					       st95hf_response_arr);
+					       st95hf_response_arr,
+					       sizeof(st95hf_response_arr));
 		if (ret < 0) {
 			dev_err(dev, "spi error from st95hf_spi_recv_response(), err = 0x%x\n",
 				ret);
@@ -800,7 +801,8 @@ static irqreturn_t st95hf_irq_thread_handler(int irq, void  *st95hfcontext)
 
 	mutex_lock(&stcontext->rm_lock);
 	res_len = st95hf_spi_recv_response(&stcontext->spicontext,
-					   skb_resp->data);
+					   skb_resp->data,
+					   MAX_RESPONSE_BUFFER_SIZE);
 	if (res_len < 0) {
 		dev_err(spidevice, "TISR spi response err = 0x%x\n", res_len);
 		result = res_len;
diff --git a/drivers/nfc/st95hf/spi.c b/drivers/nfc/st95hf/spi.c
index ffaf2789c406..a6599d65a3bf 100644
--- a/drivers/nfc/st95hf/spi.c
+++ b/drivers/nfc/st95hf/spi.c
@@ -66,21 +66,22 @@ EXPORT_SYMBOL_GPL(st95hf_spi_send);
 
 /* Function to Receive command Response */
 int st95hf_spi_recv_response(struct st95hf_spi_context *spicontext,
-			     unsigned char *receivebuff)
+			     unsigned char *receivebuff,
+			     size_t max_len)
 {
-	int len = 0;
-	struct spi_transfer tx_takedata;
-	struct spi_message m;
-	struct spi_device *spidev = spicontext->spidev;
 	unsigned char readdata_cmd = ST95HF_COMMAND_RECEIVE;
+	struct spi_device *spidev = spicontext->spidev;
+	struct spi_transfer tx_takedata;
 	struct spi_transfer t[2] = {
-		{.tx_buf = &readdata_cmd, .len = 1,},
-		{.rx_buf = receivebuff, .len = 2, .cs_change = 1,},
+		{ .tx_buf = &readdata_cmd, .len = 1 },
+		{ .rx_buf = receivebuff, .len = 2, .cs_change = 1 },
 	};
-
+	struct spi_message m;
+	int len = 0;
 	int ret = 0;
 
-	memset(&tx_takedata, 0x0, sizeof(struct spi_transfer));
+	if (max_len < 2)
+		return -EINVAL;
 
 	mutex_lock(&spicontext->spi_lock);
 
@@ -106,7 +107,19 @@ int st95hf_spi_recv_response(struct st95hf_spi_context *spicontext,
 	else
 		len += receivebuff[1];
 
+	if (len > max_len) {
+		dev_err(&spidev->dev, "spi_recv_resp, invalid response len = %d\n",
+			len);
+		memset(&tx_takedata, 0x0, sizeof(struct spi_transfer));
+		spi_message_init(&m);
+		spi_message_add_tail(&tx_takedata, &m);
+		spi_sync(spidev, &m);
+		mutex_unlock(&spicontext->spi_lock);
+		return -EMSGSIZE;
+	}
+
 	/* Now make a transfer to read only relevant bytes */
+	memset(&tx_takedata, 0x0, sizeof(struct spi_transfer));
 	tx_takedata.rx_buf = &receivebuff[2];
 	tx_takedata.len = len - 2;
 
diff --git a/drivers/nfc/st95hf/spi.h b/drivers/nfc/st95hf/spi.h
index 3ab678734c17..840f55f82899 100644
--- a/drivers/nfc/st95hf/spi.h
+++ b/drivers/nfc/st95hf/spi.h
@@ -45,7 +45,8 @@ int st95hf_spi_send(struct st95hf_spi_context *spicontext,
 		    enum req_type reqtype);
 
 int st95hf_spi_recv_response(struct st95hf_spi_context *spicontext,
-			     unsigned char *receivebuff);
+			     unsigned char *receivebuff,
+			     size_t max_len);
 
 int st95hf_spi_recv_echo_res(struct st95hf_spi_context *spicontext,
 			     unsigned char *receivebuff);
-- 
2.56.1.839.g22a8290db9-goog

