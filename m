Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645473;
	b=toYWi8NcRsXcts2KSebuqRR45fIYMwSYrp8YVSF4DpUZxsHBHQMzx1BvjVv8qE5frW9P
	 EnGdl3havcaYBfahYF4N/jmlk2mQlMcxWK6ONQW5bWvzkPr2Zqg/gdIVtNoUdV8UrwmRe
	 wPQUbMknjs+dnJDDhK5LYARgWasek9oXYHkypncUHxW+qRyhsHqoIm1KeyUyFyMPKRU8R
	 7Mqwlszbj9akFsS3tYnvuZzU2RHv+fB3fT705UxUZsS4+68nTHs1bJ/cv3iQVFfSvaOT+
	 lmSfuqvjRz4N4ZDGSL/5IqjpqTDmA0WHG60YIFksku+r10XI0qSODOruW/1+GGqX7Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=DuZqLd0vHMeJXiMehSGkBOlcmKTFco/So2rHwAIx94g=;
	b=iN7QhfHunJYv5Q+n20cvOABJST/p9e4PfNiz7i5ew1yqbGsy7FN7Fe7utDWIbZ5y1CwA
	 6ADVpHI1i7ZbLCcw9J6ZlPMDeyiFDLLe8vAJS0Gs+PX3tLKbpiziA36CgUvSycvObNMBk
	 x25EYFmgi2/P9FQFAqdiJB4aV52QLzisWnPH7PMy8wtUANFmI1zRMmkSO0jyRVe+um5xr
	 95iaEfAw8KYAOtV3OA2bBVvYrh9trMvR6fMTZrMf7vxsi4WsLbU4Lr+mRFxE52KnmyMlE
	 UZuOfhGFJvGvHOn2nvMahL22MF6rc0KSsa223O4dEC4ejN37T89RLNCcFed63HABsNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="eIp/rrhf";
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8292606A691
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8292606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eIp/rrhf
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386c3309469so2315556eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645472; x=1796250272; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DuZqLd0vHMeJXiMehSGkBOlcmKTFco/So2rHwAIx94g=;
        b=eIp/rrhfu6cm9NzURnzciuLGVWJWfllOmX9rLezerInfOvKkuleMXrvgxVqc1AhHFr
         8La0ZDfAe3fXbz1E5pjKF/GVH5Ldqdp9TcH54PX2JbYo6ABROQpN8M6kpi6+A8bhar9/
         Jvb66rPCFjjg6LBhr4fxBXNA0LoA9ufqZtUxmkVb+U0xgqdL74CIvkIwOmKnevTKbtYy
         zu+jNoXzYYx/z0Vz9AN7WTZJvQ4041rq2Wq3NhZ+87Vg++14SgnLU9FBJxv7XD7CssMw
         ts8RwehOK+DUM1uB3CojJ5OHKnrkRgrhppc80GTP292W3Cm/03Md2KVvw6j79MjgZ1Ci
         B04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645472; x=1796250272;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DuZqLd0vHMeJXiMehSGkBOlcmKTFco/So2rHwAIx94g=;
        b=VV+ClEjxpXkbf7xpM6+EuZCm0cXC36baqbCONnW+UTHyGrog2EWrBFRogqjs0KjutG
         pOhs+igRVr/uLfFzbUfpSxNNYrbdR7tQ4JifADXNagdykYfesTZpKMEw1YZQTpM9cCmX
         mO1+CCd/QbImPwDd/7dpTXrzaS91AnXOCBmfLeu6KVmrMIyCTQdMS+a7FTf5lvQ/gsQv
         3dp8ekFTb1izVHb79A0I3u5IcYYFzOh684zx+D5/VodOKMwW5kO2MVZwf8lkjur0HLr2
         5tJQ+b/hAMtYYlR5aZDymcs1YnYIp1+3ujilII2UuX1v22X/GhMHFMCL2D04alyNOl4s
         ZbIg==
X-Forwarded-Encrypted: i=1; AL+hErEHu6hPdO/bWkNbL8CZrmEGLEQHRC4Pa1A/85EY/rC1CI9Bi4Okh0/cJ61vctTCwinXYuRw@lists.linux.dev
X-Gm-Message-State: APuU4Z+/C2lYtxTRZmrZolizw2OqVYKdLYD44DsivR1oi9lpUVAsDNRh
	9D29BAZPKTzKJ51ME66zSgtXQlFQKQnUPlby/yFThXalceW+0i6j2gxz7WsIpfh7P8PwK24f2WY
	aOg==
X-Received: from dycuf5.prod.google.com ([2002:a05:7300:105:b0:386:9be5:2d95])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:de44:b0:375:c5e1:931d
 with SMTP id 5a478bee46e88-3857073ebabmr19368154eec.25.1795645471570; Wed, 25
 Nov 2026 14:24:31 -0800 (PST)
Date: Wed, 25 Nov 2026 22:22:58 +0000
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
Message-ID: <20261125222300.1438398-4-elkin@google.com>
Subject: [PATCH net 3/4] nfc: st95hf: validate async tag response frame lengths
From: Elkin Cruz <elkin@google.com>
To: David Heidelberg <david@ixit.cz>, Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, oe-linux-nfc@lists.linux.dev, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

st95hf_irq_thread_handler(), st95hf_error_handling(), and
st95hf_response_handler() index into skb_resp->data and subtract CRC
lengths in skb_trim() without verifying that the received frame is long
enough. Short responses from a tag or controller can underflow offsets
or read past the received frame.

Run st95hf_error_handling() before checking WTX_REQ_FROM_TAG, require
res_len >= 4 for WTX handling, and validate minimum frame lengths before
indexing CRC/RATS fields or trimming skb_resp.

This issue was found while trying out new Clang static analysis checks for
kernel bug classes. The finding was triaged and fixed, and this commit
description was drafted with the help of AI, then verified by code
inspection and compile-tested against linux-next (not reproduced and not
runtime-tested on hardware).

Fixes: cab47333f0f7 ("NFC: Add STMicroelectronics ST95HF driver")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/nfc/st95hf/core.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index d7ac7ede1259..ead0c342996c 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -667,6 +667,8 @@ static int st95hf_error_handling(struct st95hf_context *stcontext,
 	switch (stcontext->current_rf_tech) {
 	case NFC_DIGITAL_RF_TECH_106A:
 		if (stcontext->sendrcv_trflag == TRFLAG_NFCA_STD_FRAME_CRC) {
+			if (res_len < 3)
+				return -EIO;
 			error_byte = skb_resp->data[res_len - 3];
 			if (error_byte & ST95HF_NFCA_CRC_ERR_MASK) {
 				/* CRC error occurred */
@@ -678,6 +680,8 @@ static int st95hf_error_handling(struct st95hf_context *stcontext,
 		break;
 	case NFC_DIGITAL_RF_TECH_106B:
 	case NFC_DIGITAL_RF_TECH_ISO15693:
+		if (res_len < 1)
+			return -EIO;
 		error_byte = skb_resp->data[res_len - 1];
 		if (error_byte & ST95HF_NFCB_CRC_ERR_MASK) {
 			/* CRC error occurred */
@@ -714,7 +718,7 @@ static int st95hf_response_handler(struct st95hf_context *stcontext,
 
 	/* check if it is case of RATS request reply & FWI is present */
 	if (nfcddev->curr_protocol == NFC_PROTO_ISO14443 && cb_arg->rats &&
-	    (skb_resp->data[1] & RATS_TB1_PRESENT_MASK)) {
+	    skb_len >= 4 && (skb_resp->data[1] & RATS_TB1_PRESENT_MASK)) {
 		if (skb_resp->data[1] & RATS_TA1_PRESENT_MASK)
 			stcontext->fwi =
 				(skb_resp->data[3] & TB1_FWI_MASK) >> 4;
@@ -736,13 +740,20 @@ static int st95hf_response_handler(struct st95hf_context *stcontext,
 	/* Remove CRC bytes only if received frames data has an eod (CRC) */
 	switch (stcontext->current_rf_tech) {
 	case NFC_DIGITAL_RF_TECH_106A:
-		if (stcontext->sendrcv_trflag == TRFLAG_NFCA_STD_FRAME_CRC)
+		if (stcontext->sendrcv_trflag == TRFLAG_NFCA_STD_FRAME_CRC) {
+			if (skb_len < 5)
+				return -EIO;
 			skb_trim(skb_resp, (skb_len - 5));
-		else
+		} else {
+			if (skb_len < 3)
+				return -EIO;
 			skb_trim(skb_resp, (skb_len - 3));
+		}
 		break;
 	case NFC_DIGITAL_RF_TECH_106B:
 	case NFC_DIGITAL_RF_TECH_ISO15693:
+		if (skb_len < 3)
+			return -EIO;
 		skb_trim(skb_resp, (skb_len - 3));
 		break;
 	}
@@ -815,7 +826,11 @@ static irqreturn_t st95hf_irq_thread_handler(int irq, void  *st95hfcontext)
 		goto end;
 	}
 
-	if (skb_resp->data[2] == WTX_REQ_FROM_TAG) {
+	result = st95hf_error_handling(stcontext, skb_resp, res_len);
+	if (result)
+		goto end;
+
+	if (res_len >= 4 && skb_resp->data[2] == WTX_REQ_FROM_TAG) {
 		/* Request for new FWT from tag */
 		result = st95hf_handle_wtx(stcontext, true, skb_resp->data[3]);
 		if (result)
@@ -826,10 +841,6 @@ static irqreturn_t st95hf_irq_thread_handler(int irq, void  *st95hfcontext)
 		return IRQ_HANDLED;
 	}
 
-	result = st95hf_error_handling(stcontext, skb_resp, res_len);
-	if (result)
-		goto end;
-
 	result = st95hf_response_handler(stcontext, skb_resp, res_len);
 	if (result)
 		goto end;
-- 
2.56.1.839.g22a8290db9-goog

