Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C6325776
	for <llvm@lists.linux.dev>; Sun, 25 May 2025 19:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748199632; cv=none; b=tZ9cV+jv4C6LUbqlIdugxIv3ky2NQoF5D/4koZuNruZhgErKHlmaWGF7ajkuPWJRtINY6JKTDdiOTikN+x0pl5pSqz8WMrSxINVf1cMMDimlbRusIvQQaxFj73llXzQB69dA4fROKw7IH0QLEAh7q9zOcgcvHZf+TPYlIEQCkjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748199632; c=relaxed/simple;
	bh=B85VVTyqk8cVv2J2dpmt2w8VDVRnFq3MXX/CJMWFGXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=faIawJCdAiZQIY0FDgZGmRG4pJHCGGlfcOssCzMRpWTUZye11Z8SF+at3/MBqACiGlkkCxvDQusAsOQIc6738/yclKyJTxwnifvemnqY/F5jkyoLlPbUkPmiCbIQGFy6Z4sXINoFe74rp+st8hhgs9rWZq7LKywA7pkGR/eoDVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wkSA5akB; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wkSA5akB"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4d4504f75so13193f8f.3
        for <llvm@lists.linux.dev>; Sun, 25 May 2025 12:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748199629; x=1748804429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RjLFxqY7XnLccRUOwo/zYDqB3IdQnhxagjUTUuoSWKI=;
        b=wkSA5akB8XhcTkX6AKLxz1XboSFa+y9liDt9aDf9+TTcc55bcbxgAR0fTieZlj4MSV
         kANmrvIRPaq5lDKlMyLK55q8ObLTLnn0bMhWIr0Y7PtUExFJ0UEBFEUraKri2e0gh2i2
         vhG4GYxzuZ1ae9AiXcczm1fACMEhEp1czSY4rSoezyIOR50T6tbmL3YvPDlMpRRfJeyG
         Oq/0HIlyEj4PvaQdXyd7af5Ncl9tTRnoGr0SXEsYBm9pY+CPwJ7jz2uP4gxy4Bxy+C2K
         3uw8F3dWQs5YBhNhM/mrS9qbXpQZcegsFtLT0YOsaKV/xooAJ60xR0vnM3jggXeNlDMn
         XyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748199629; x=1748804429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjLFxqY7XnLccRUOwo/zYDqB3IdQnhxagjUTUuoSWKI=;
        b=ReeChCymwssIZmV/2t3bdp4MQ4BjIKf5KByDe2qwpicU6nZOcDMbMHbdjjZgUARRr6
         /noN2SBxbQq/xLJ1SSqRTeMTZVV3hD+hjhDtk+jHBIe4JQf9q/OebF7YVybNfthOXRil
         GDg8p0QUUYFQ4BehjWOHpLKQqyWc3BzlE5rBE7or/jkGs+A+BXPcFJVi3bRKqZIC50hz
         FzgUOi9k9jvxXVhMKSoeMjjHnRdh/8GkX+jkCJ6sroWjrxjrJjzAyq5zOPccAnBaSnuI
         Aw0Y+fKcEChz5rvOsMQ1rVxu/2ABshqiE1k9ezzlVQnuGGzMIdrX6TuKBoJXoYvZ+g1q
         R6YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq8+0lSTTeiPtykUF7EQBGS3LVPOe+50EHePgUIYrZu8XgvdF6f5CCNen+mcsxspNSxgwQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yytrgwrr14athrDkunvN2EFSW/06DTL6emVut2DXrvxUXKZzoiP
	WKMlJJkVNBUdWtgtLZdjibggGYWcyXtz7bnaqsW2akNmKeYaCdyE/jjQ/4oKEE+ndvo=
X-Gm-Gg: ASbGncs9QZs/41hhMqFH2NEANd//Hfkm+UMLVhdsOxnyZWSQ+zBHJcMckMo7FwFybqe
	b78FGSV36Lkwayu1T5KdndTWA7YIdO9b/XVkDODcAWnDbNaGvBJR0QWHAWrjnBkT5jIKfbusaTk
	c0zj42ilEpeDPshssDcXh+c9/1elJGjYs9Nwov1yEED0yEOjvl1J1DV4CvqwVcDDt2BAupZGsMn
	96cUrZIHAraIErTS90zk2NwACHAIyNIxpFWDQd+sUnmEPINHY3nQyE0LzltXQC+sH+hYV5ZaSSx
	/B5CElRAI/hj9Kw3GM+giFMKDPT0xha3ZwU4/Rs4tTBwJZirbdmpqncZfvNNY98pSj2o7dkt
X-Google-Smtp-Source: AGHT+IGcJtSyI6HBYQjTOimW44zIP6UUiFecVnILao/qEPMGVovWt4I3ZyyZO/nyuRGDWyrSto3LBQ==
X-Received: by 2002:a5d:40ce:0:b0:3a4:d8b6:ca78 with SMTP id ffacd0b85a97d-3a4d8b6ce1amr319886f8f.16.1748199628644;
        Sun, 25 May 2025 12:00:28 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d74843b2sm1629864f8f.53.2025.05.25.12.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 12:00:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Amitkumar Karwar <amitkumar.karwar@nxp.com>,
	Neeraj Kale <neeraj.sanjaykale@nxp.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] Bluetooth: btnxpuart: Fix missing devm_request_irq() return value check
Date: Sun, 25 May 2025 21:00:21 +0200
Message-ID: <20250525190020.27286-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=B85VVTyqk8cVv2J2dpmt2w8VDVRnFq3MXX/CJMWFGXo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoM2jEi82njqFcOjm2ocR19/nY4zOaTn8/mG2Vy
 BgID+c/ufuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDNoxAAKCRDBN2bmhouD
 1/j3D/4tNb9p4+zQ6Hy51btWhPjOGB3zxCxwZYTIz2whrJZiQ0sV4AHtn2jBjw1sOIJYf32h/Yi
 +LSNA+ITgfNYVhw1Ye02CL7nCchSnKJ0Lslhih42WkuZo/EAolSglMtvK0AT1I8mYRCNWQi0547
 v1ur1tv9oEDNyQ0ADBScIZXLMVGeLP6x0RhPItq75iCUcpsPK4o4nXwa4CRY/f2uO8waUPhhA/t
 S4Fy0E3uELhWvYTRm7WQkqRZwfeGLfLHqqj6CiNK6TNHvF5Kl79mobzMQawlrOpBekG5dUTwBrT
 yaf4myzQohHYey6aJo/3FV4hV30Zl6BP3/7xm90HnAkHc0PAJ0cstilFgZy6BZP33680diRZ2Vj
 YhGrHZnoq+D2Y/fLGQBP16kvnpSRVvGabhVZssF5tnvq6gFrR2gnn37rGRJ+lqzXg2F7cNtg1NG
 Gcqn7Rkvtcs54N7cjdLnQcZf/oWi8+yo61nF07wL/AanSZ4a2dOWsKpX0VsDbHuJ7QCAbuvjsED
 JFGVMuAnaeJsMv61vo0jzk3tlY/cgEvp9OxPBljFaEIgcIQkBkdm37tJ7Ut+Td6HHNV5b37YAOL
 wUzV4v8MeqGdDoDX1Pw8H+BjiL3csva7JinarnOyRnzUEUUj+keVYkyIMRyX/GEj+fRogJyQko2 V2f8Xhttd+LsepQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Return value of devm_request_irq() must be checked (function is even
annotated) and without it clang W=1 complains:

  btnxpuart.c:494:6: error: unused variable 'ret' [-Werror,-Wunused-variable]

Setting up wakeup IRQ handler is not really critical, because the
handler is empty, so just log the informational message so user could
submit proper bug report and silences the clang warning.

Fixes: c50b56664e48 ("Bluetooth: btnxpuart: Implement host-wakeup feature")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/bluetooth/btnxpuart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
index b34623a69b8a..6b13feed06df 100644
--- a/drivers/bluetooth/btnxpuart.c
+++ b/drivers/bluetooth/btnxpuart.c
@@ -533,6 +533,8 @@ static int ps_setup(struct hci_dev *hdev)
 					ps_host_wakeup_irq_handler,
 					IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
 					dev_name(&serdev->dev), nxpdev);
+		if (ret)
+			bt_dev_info(hdev, "error setting wakeup IRQ handler, ignoring\n");
 		disable_irq(psdata->irq_handler);
 		device_init_wakeup(&serdev->dev, true);
 	}
-- 
2.45.2

