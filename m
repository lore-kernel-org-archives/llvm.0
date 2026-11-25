Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645635;
	b=AL3O22OlQOwdtAxA/lQmookVux+zioWir0VT+C9dbQFWV3kgYlrmM4hd7YsiRNtGmVEs
	 c3VjosasxdgSvfSwvrxxdOLmhLqlPYpnqBeI4lPczBDFos3zjJYNStNL1K2whz4kJOwJg
	 8lAToM7u/N1lybfxtGOGmNcQmu/IewhcvLbytCpxue2MWwyTx/PFopmvC3sNzzc9fP8v4
	 4u5tOD2TrAG47CY82YDtJByvGxESsrbDKoukQPI47G2GvPyl9tEPon783k2B17AyM1iH0
	 fOb8DstAEiHzc/+8oFJ0g0vP0gasaf4+PuePWYfytiko+++vPjMtlzLnmbAOY9J+MSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=0tzFeKCwOoFb6bvhWfk3Oe+1P7rt3PYjl4BuN72k99w=;
	b=igcdvsFWQ9Qvmoie78CEl4Zs3/7vguv9O2B/mfIJRfK7xQ/vpYARP7z3INVsH54n2ZQf
	 RHb6GBfN4IOoGPC6rVlIJc3n6X7oARNZ0KTE/wi9Cuey/8mR3VXZkkADUtp8W/ZGSN30r
	 V0P4qa/CJNeMdqi7htXhuIUlFGuWIPeMPzkDKxUR2BtfrBaFpAsA2aXQJ+QwlQlksYC97
	 D+UkjUDioJBno1NGflP5t6e/VEMTbuAvU45CEgJqAecV+y+BcoOJw1JijSuXsZo3ZGqwH
	 pMNOGJ3HVKFzPNucPwboqHNUjPrEz0uh0RjJxNvODu7DR7rus+Jwz0VR8lfQe3we33A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X3+IKsOF;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38513606A32C
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38513606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=X3+IKsOF
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-384c78aa0dbso8371281eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645633; x=1796250433; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0tzFeKCwOoFb6bvhWfk3Oe+1P7rt3PYjl4BuN72k99w=;
        b=X3+IKsOF0gi+1ALG2n5DNZiifAyZ0zm4XKW2G4vDFgoQGBF5OYJKlNrn6dRu25QPc2
         WdIapT6v7uq08CEHl4fBeXg+K/Af8W6+MkHtum1gmAnVcy6cBFamtQ5GO685aNIDJATq
         s6sXDvrCuG8/yUHN4L8Wi9CRFU5Og24Uy5Dq1Wt18ru6GR5qAvbooNJJJrD3diIBzKmf
         pLvc72zFatrVSGNm+yg7fEWoH8VUEu7bL3LU4qQAqr62ZmgPZLd9qUDIerSLXvB8PqPO
         lzSsvqN1TBpIrpNMumdT9NteA8luK70PKpG+dx7SFlGMqZzCqMVEHmoaPnHwgkMrv76N
         qKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645633; x=1796250433;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tzFeKCwOoFb6bvhWfk3Oe+1P7rt3PYjl4BuN72k99w=;
        b=fZ9J2+Ymi+su5N2mCI5DDqDmRh68Y5uG3jlsZKknYE7gBYBbFuQUgs/jnc3N2Zgtm4
         4yGxWWDJEGGs0jpRmzwsjqu8vSDgpJ3cUUkzXHfMYeVSruYIPvjJJUvguIQ7MScB+g5q
         MIcVGiQmk71l1Ma24Tqe1o01Z7LbS0PFyI9LXrl+X62ieDs9b7Gqn7a56+t53QyV8AAa
         Q/5PYpbLZob5DfYb3qSJTcacvCVLYnIdJdzBXIiOUB6fcL10QEKrZFDVVbn+p/kFuZ4C
         5LrhscSINb8eM1eWprHVbqh7qNMXJHBtf2z2PREp0mTbAtb89Mc2TzXxHewgSYnA4v3p
         yQtA==
X-Forwarded-Encrypted: i=1; AL+hErFU5eoryYWwIXvd19C1X16wXsjBD1sM/JRkkV/72GI9PpK9ebcNGLB7/Mbm+wQY+oDswYRt@lists.linux.dev
X-Gm-Message-State: APuU4Z+lrBq4bPF0jX1ogguOC1NRwcTI37a1u8UrCuaiVzYAUPDV0qEg
	SPAZ1EgLsnIV01aIgxfQZx/wB3CLpzJEyrf9bBSADG1664vSVXg73nJmo020NCmQrX1r558AXi6
	NIQ==
X-Received: from dycnb22.prod.google.com ([2002:a05:7301:b16:b0:386:af9c:96b6])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:d81c:b0:386:b7d2:a279
 with SMTP id 5a478bee46e88-386b7d2aba6mr8835631eec.34.1795645633028; Wed, 25
 Nov 2026 14:27:13 -0800 (PST)
Date: Wed, 25 Nov 2026 22:26:06 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222606.1448637-1-elkin@google.com>
Subject: [PATCH] pinctrl: nomadik: validate DT pin config property read and range
From: Elkin Cruz <elkin@google.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In nmk_pinctrl_dt_get_config(), of_property_read_u32() is only checked
for (ret != -EINVAL), passing an uninitialized val to
nmk_dt_pin_config() on other error returns. In addition, val is signed
and nmk_dt_pin_config() returns 0 even when val is out of bounds for
nmk_cfg_params[index].choice.

Check (!ret) after of_property_read_u32(), make val unsigned (u32), and
return -EINVAL when val >= nmk_cfg_params[index].size.

Fixes: e32af8894588 ("pinctrl/nomadik: add device tree support")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 24 +++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 617ad259f62c..400009929dbd 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -693,18 +693,21 @@ static const struct nmk_cfg_param nmk_cfg_params[] = {
 	NMK_CONFIG_PIN_ARRAY("ste,sleep-pull-disable",	nmk_pin_sleep_pdis_modes),
 };
 
-static int nmk_dt_pin_config(int index, int val, unsigned long *config)
+static int nmk_dt_pin_config(int index, u32 val, unsigned long *config)
 {
 	if (!nmk_cfg_params[index].choice) {
 		*config = nmk_cfg_params[index].config;
-	} else {
-		/* test if out of range */
-		if  (val < nmk_cfg_params[index].size) {
-			*config = nmk_cfg_params[index].config |
-				nmk_cfg_params[index].choice[val];
-		}
+		return 0;
 	}
-	return 0;
+
+	/* test if out of range */
+	if (val < nmk_cfg_params[index].size) {
+		*config = nmk_cfg_params[index].config |
+			nmk_cfg_params[index].choice[val];
+		return 0;
+	}
+
+	return -EINVAL;
 }
 
 static const char *nmk_find_pin_name(struct pinctrl_dev *pctldev, const char *pin_name)
@@ -724,11 +727,12 @@ static bool nmk_pinctrl_dt_get_config(struct device_node *np,
 {
 	bool has_config = 0;
 	unsigned long cfg = 0;
-	int i, val, ret;
+	int i, ret;
+	u32 val;
 
 	for (i = 0; i < ARRAY_SIZE(nmk_cfg_params); i++) {
 		ret = of_property_read_u32(np, nmk_cfg_params[i].property, &val);
-		if (ret != -EINVAL) {
+		if (!ret) {
 			if (nmk_dt_pin_config(i, val, &cfg) == 0) {
 				*configs |= cfg;
 				has_config = 1;
-- 
2.56.1.839.g22a8290db9-goog

