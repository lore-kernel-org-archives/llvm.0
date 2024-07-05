Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0E4146A96
	for <llvm@lists.linux.dev>; Fri,  5 Jul 2024 11:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720179080; cv=none; b=HG2BhcjM/5MTI7aF2/ROC2oRLwsLTF/5Z16+u0jOPGJ27iF7csjw3sEYO4BxjuJAKAMfJ3sWLBghg862xoo+TW/MyEkYNOgSsMZtZD3CeliEQl/OwXfo65fDKztq/JrLFOZWTUEBKybvi+tQc0SzAEE7AxQ11VMbmV8hQc+SH+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720179080; c=relaxed/simple;
	bh=FuBrajrqQG9XnSm84KCc44rCbv9kqxWntaHnPCAb3kM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FZuY0OkIxACrCR0WTSirmcNLLJFu1ZPyCh/u3qKnr9z/nkSp3xntPK1mbx593eVjAaUvQrVr0UxjaO2PQC1GeZYb7Ae73reJEcty6C3r+1OKgI5+2AwxEarBvm8ncjCYRSZiD5B9+ZaRA1N1G6+jpQu1BzCudxvj9aKHSnTDXpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RRaW4BAV; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RRaW4BAV"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52caebc6137so1378475e87.0
        for <llvm@lists.linux.dev>; Fri, 05 Jul 2024 04:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720179077; x=1720783877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4KHOTg83zzFfVGaUl4+JK0iTPEEAglfxmKaKcO2W6Q4=;
        b=RRaW4BAVv7ysVfshBAZwy4W1X+x0g2P6gO/Cj8omh5qjok8RZNdbhXo8z6si7tZuVI
         OpGLBOln99sNm7BQJMLG/ZNvYookp4ZQwfUgYe9/JDg+c+CKU9OvievsXqpdxpHXDsx5
         ThnOR4NkipjDWoue1jTFXRCxAmpw8Zxtz1+nPydsX8zIZzMK97T24jgBBN5luRM+NHFF
         WbCS/IdIIZ5FrGfLRR+cXXwPPfy60XN4ABfHmh5YRodrTICZpV04VPVaaV3n4KD2VGA3
         eT/1IN87z1qkA+uGhRMjp2tpYXIi8GtildUsRAKlJ5FNtsKVyIaFFff+eipn48iXKMIx
         aoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720179077; x=1720783877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KHOTg83zzFfVGaUl4+JK0iTPEEAglfxmKaKcO2W6Q4=;
        b=hvHyrunmFfWXQ2BH45I42Y35uxtb4AqojESTnmdr7AjnJbVHGyVAo9V5i+LQT4U7Yo
         lFSsoitkTYeg/sGzEqsf0dgBKoSRV/ghONNKG8Fcofo6Xlda5DtuYMsLIf6eRIdNBVLQ
         qIHRflmDFp+cVvIn2fPGsQ199I5Rfbdj19Lrv8xWETTlmzMeTd/QFBBuqGfiNcL5YED7
         5vTa2YoTZvLuNjk7lwLoHPPaqPDOHmAGA9v62JCxwjLZjjNLk8FOTFd/EJZH7snoPOtv
         48wSFtuHnOnQr+VHjyaY5MC2CDZXzQnmzZAPsOCxEGt/NCNkQh9s/3vDT9Sfno/6kRg+
         OIhw==
X-Forwarded-Encrypted: i=1; AJvYcCVL/7To8V5y46kUNwb/qV1X3rQkEPxHcqVTbGLhp4+i1gruDpngyaOf2CyFH/qUoNRwno4CnpbNe9thQ7oOC5gHNby8Tw==
X-Gm-Message-State: AOJu0YwpvaltQUIG8oXAAaFeASgYWhRKEkhalnSenV/tUcc9nQwJFCn0
	RwDE+pO67PLODXsPrAlbWOQO3ox6IN6+W/BzJmcSfGkZguPEyHVW3jk59nnWr9k=
X-Google-Smtp-Source: AGHT+IHu8JpvSRGOprQzL81TsvGKBnMmQCKqCq82+aGtEZ11VImpyhljjvm/eD9bz0xqu6/70v7QyQ==
X-Received: by 2002:a19:ac45:0:b0:52d:b1c9:34e with SMTP id 2adb3069b0e04-52ea062e361mr2952258e87.21.1720179077159;
        Fri, 05 Jul 2024 04:31:17 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2fc942sm58090725e9.42.2024.07.05.04.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 04:31:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sebastian Reichel <sre@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] power: supply: core: simplify with cleanup.h
Date: Fri,  5 Jul 2024 13:31:12 +0200
Message-ID: <20240705113113.42851-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate the memory with scoped/cleanup.h to reduce error handling and
make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/power/supply/power_supply_core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
index 8f6025acd10a..2b845ac51157 100644
--- a/drivers/power/supply/power_supply_core.c
+++ b/drivers/power/supply/power_supply_core.c
@@ -9,6 +9,7 @@
  *  Modified: 2004, Oct     Szabolcs Gyurko
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/init.h>
@@ -756,10 +757,10 @@ int power_supply_get_battery_info(struct power_supply *psy,
 
 	for (index = 0; index < len; index++) {
 		struct power_supply_battery_ocv_table *table;
-		char *propname;
 		int i, tab_len, size;
 
-		propname = kasprintf(GFP_KERNEL, "ocv-capacity-table-%d", index);
+		char *propname __free(kfree) = kasprintf(GFP_KERNEL, "ocv-capacity-table-%d",
+							 index);
 		if (!propname) {
 			power_supply_put_battery_info(psy, info);
 			err = -ENOMEM;
@@ -768,13 +769,11 @@ int power_supply_get_battery_info(struct power_supply *psy,
 		list = of_get_property(battery_np, propname, &size);
 		if (!list || !size) {
 			dev_err(&psy->dev, "failed to get %s\n", propname);
-			kfree(propname);
 			power_supply_put_battery_info(psy, info);
 			err = -EINVAL;
 			goto out_put_node;
 		}
 
-		kfree(propname);
 		tab_len = size / (2 * sizeof(__be32));
 		info->ocv_table_size[index] = tab_len;
 
-- 
2.43.0

