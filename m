Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB9A12F36D
	for <llvm@lists.linux.dev>; Mon, 26 Feb 2024 17:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708968773; cv=none; b=f+zCUPBp8fkQqjhLbAYp1ApWRheUVSDv60e8Upr667RQXC+rCi3lICD0VjdV4P26WkZV3FDePp1QJbp8FoA+SBO1sCYwY6ychcK3WMSX4lG7yY0eeB29efr7EtTs9egMgbeTdcYtfFwb3hZ3XxDvRj/f+IPHLm3So4wsU3+LjGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708968773; c=relaxed/simple;
	bh=Wy4cGPpVerRovklUcPnMhjmK9LuSlF+TSnH28VA7whs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JWC03D4ZdkcQpnOgnPfCg2tnGJj2OufkNNF8F3ZvTrpIHOaG7LSn2h7rlEbd8jNT8mLvSYG8UTIQHr9JHJVcGVurTLIg5AJlLHWsMuUTFCXn/ux0bi7uMZ7dzd6jJzbeiJ9O9RTV77Df4ybWACSazFrZ+BP8oyzG+VzQke1KVi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kg3wCmbu; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kg3wCmbu"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-787bc854a77so195665985a.3
        for <llvm@lists.linux.dev>; Mon, 26 Feb 2024 09:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708968770; x=1709573570; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZotKd2o47/oKAtdV1I26QivtjRepugTGHOJDDp/ZM4g=;
        b=kg3wCmbua7WYZZKcD8NpDCuSWsqsTZW/SDqihKpMjx43iiFlgiQ+tkkbmoq50xbDPD
         wjLl2Ew6RY0YUJwTdGBPFsUZBeetqqL1FS6UWnLOcdAElLBHN4ntD38nbFpMqK3W0Nn1
         qTYd128xsGS9gc2Q2i8595se3P29Rqij/MG7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708968770; x=1709573570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZotKd2o47/oKAtdV1I26QivtjRepugTGHOJDDp/ZM4g=;
        b=NFAe3BZmhWdgNaGlWPZC4Pq5L1zL0U7+PCTshJH6U/SmefC7J/HbiavQ1i6+JXgkRs
         nlRH1M8GZSwgboYHQsEI7ZFgmiNYSJYTYJV81SLlN3jCLSnFsEgk0gXiprNWGE0AbHuU
         IhlqVQ2S7youWsRg86GGTV/Z8ws31En/0/TH/65VNwi51YfAZbptwk0DCTl1PODSIQ2J
         ZLMAzPyXVqMhQXK55U3mo5lPCx6hzSifauTTnyjGbFYWZfWKQJ0Ucpg+OGas33uUI3UX
         7ueYB6QKpuCXvgO7omYuMVGrg/euznRvi6zNIbmgxdCx47SHzr+IOkDOg3Nn+QDYKulK
         HKmw==
X-Forwarded-Encrypted: i=1; AJvYcCXBs7E1kTuOTyfskN8M5FHN5E8cXgFvfcfnoH0GHBHN+Mq8H9pGXJ/WUCUtkZdRXzWQ3s+Y0IF/SiZoo9ibsq+G/1KWxA==
X-Gm-Message-State: AOJu0YxZJbDh0Tb9ccPSjFLxgrrPDl7pCfKH+/fl8bUZmDwgBJ75tywh
	D2CQZTeZGuhw5DdoAjG/umaKWn01PKI0pY3DRwVIhjsYg1IExy/4pyy2wxD5rw==
X-Google-Smtp-Source: AGHT+IH3rAwgd0NXJq8G/TBWJ93nsJy2+AmuJ1+7I538QjgTdtVQQDhSqF/spxCAW7zvWaoaCpSjOA==
X-Received: by 2002:a05:620a:9d7:b0:787:9a1c:fb32 with SMTP id y23-20020a05620a09d700b007879a1cfb32mr8021996qky.2.1708968769789;
        Mon, 26 Feb 2024 09:32:49 -0800 (PST)
Received: from denia.c.googlers.com (115.25.199.35.bc.googleusercontent.com. [35.199.25.115])
        by smtp.gmail.com with ESMTPSA id b11-20020a05620a04eb00b0078725d0345dsm2672669qkh.2.2024.02.26.09.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 09:32:49 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 26 Feb 2024 17:32:44 +0000
Subject: [PATCH v2 1/3] media: pci: sta2x11: Fix Wcast-function-type-strict
 warnings
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fix-clang-warnings-v2-1-fa1bc931d17e@chromium.org>
References: <20240226-fix-clang-warnings-v2-0-fa1bc931d17e@chromium.org>
In-Reply-To: <20240226-fix-clang-warnings-v2-0-fa1bc931d17e@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Mike Isely <isely@pobox.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Building with LLVM=1 throws the following warning:
drivers/media/pci/sta2x11/sta2x11_vip.c:1057:6: warning: cast from 'irqreturn_t (*)(int, struct sta2x11_vip *)' (aka 'enum irqreturn (*)(int, struct sta2x11_vip *)') to 'irq_handler_t' (aka 'enum irqreturn (*)(int, void *)') converts to incompatible function type [-Wcast-function-type-strict]

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/sta2x11/sta2x11_vip.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
index e4cf9d63e926d..a6456673be3f6 100644
--- a/drivers/media/pci/sta2x11/sta2x11_vip.c
+++ b/drivers/media/pci/sta2x11/sta2x11_vip.c
@@ -757,7 +757,7 @@ static const struct video_device video_dev_template = {
 /**
  * vip_irq - interrupt routine
  * @irq: Number of interrupt ( not used, correct number is assumed )
- * @vip: local data structure containing all information
+ * @data: local data structure containing all information
  *
  * check for both frame interrupts set ( top and bottom ).
  * check FIFO overflow, but limit number of log messages after open.
@@ -767,8 +767,9 @@ static const struct video_device video_dev_template = {
  *
  * IRQ_HANDLED, interrupt done.
  */
-static irqreturn_t vip_irq(int irq, struct sta2x11_vip *vip)
+static irqreturn_t vip_irq(int irq, void *data)
 {
+	struct sta2x11_vip *vip = data;
 	unsigned int status;
 
 	status = reg_read(vip, DVP_ITS);

-- 
2.44.0.rc0.258.g7320e95886-goog

