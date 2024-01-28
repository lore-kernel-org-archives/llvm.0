Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9264A15A7
	for <llvm@lists.linux.dev>; Sun, 28 Jan 2024 02:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706407946; cv=none; b=NFi1DOzeOIKEqejJxEOC1hepbZ5L1V8kvJE/pbnNmKvtvojkNyyq41qKSpP6Bex6LuVX08thSzKXjz6sVuvFQto+BFuaYe0yE/PwfqzjcH2abCjbVz0BMa96CoLS/WUTRAggYH9grZRT5wIN0hU0N4iXtfoxGbgIrKOnGhSzpjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706407946; c=relaxed/simple;
	bh=Nh29uFhKJi602G3prs8tELRuSaiBp8xa7lI2rXd2Wvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SB2V1KGm8kV6QpIJsOdWNEme8+N9m/1GUgIWCKMWu8uXOMz+EeVG+qUUfq3Vu0d7IgRcm8jkcYfN1Pip0GUF4fUYVGs+L6wZ9SfBea8ebzoTdhlbHRCAQp7S6JRTu4CXlYr4WoV4ORwSHpmUEFhMqjCdQD9hSd0hzjWMhD6X5+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FbN1NO42; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FbN1NO42"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-42a4516ec5dso16597501cf.3
        for <llvm@lists.linux.dev>; Sat, 27 Jan 2024 18:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706407942; x=1707012742; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJ/tXyO7amkyPth0LbHgT/YZ0y8KfOoM1IDJtLvky2Q=;
        b=FbN1NO42N0XMwnUTlZC4YXIoKwLOKaOCAIHm0RcqT5qaoGFgBH3WgZjrApFveE7zek
         WjIDOs7yt3CqpTEg89u8zsT0NaFPAsct5v4Cxa0M66L8i7ICicS0hJpN/ZpFG+TFacBi
         oQf2/6A4ONlqXApuftBKb+93j6RU/E8EocrpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706407942; x=1707012742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JJ/tXyO7amkyPth0LbHgT/YZ0y8KfOoM1IDJtLvky2Q=;
        b=Xt4DEG+tCNzVifHu2fVuMbJC8NyN8UBXysv84CGjRMBpQna9zi/U6Jmu/XhI8JCNBL
         CKRSL0byMYWTiSzcdc1w+yO3xKTT256P9tVJtEuEhIITji71yEhisfhxUj2CbFavf9n1
         uKaEk6NZa3iQz8E4IeDzoJwLDLDZ5Nb9pHm4roV5/AIyi31J/fLdqXvsPR083kf2uLgG
         zFW2MxKo+lfdw7fXjbUPkUdkLAQQK7CVa37uSccsvKaH+rASHbNCMq0wa0P6gFqYaTar
         rcBtAgFXGQox3oy86VsKToqyIRbQ0gZqOXC74uJ26JpkzvYYG09bX3JnNruWJ3ZZPkya
         pIFg==
X-Gm-Message-State: AOJu0Yzehk8KULHcudufcHUtx0I38Evft+TZFk954nZThWaV6ox5HNUd
	Zsc99wtApDnLpxz9WLlu3WxyOt/1eTpozHqMUP3YpRqBnbrmRtxZNcQsZLvfHQ==
X-Google-Smtp-Source: AGHT+IEEZr/G/RgBFCi06b4c43fIXB0Odt7evUICu34JTHlyZ3GvGTVQDDbpNKHMg99SUGIH+6qSbA==
X-Received: by 2002:a05:622a:49:b0:42a:8630:3dfd with SMTP id y9-20020a05622a004900b0042a86303dfdmr2871708qtw.87.1706407942502;
        Sat, 27 Jan 2024 18:12:22 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id ka23-20020a05622a441700b0042a98bf0117sm568061qtb.78.2024.01.27.18.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 18:12:21 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 28 Jan 2024 02:12:20 +0000
Subject: [PATCH 1/3] media: pci: sta2x11: Fix Wcast-function-type-strict
 warnings
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240128-fix-clang-warnings-v1-1-1d946013a421@chromium.org>
References: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
In-Reply-To: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Mike Isely <isely@pobox.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3

Building with LLVM=1 throws the following warning:
drivers/media/pci/sta2x11/sta2x11_vip.c:1057:6: warning: cast from 'irqreturn_t (*)(int, struct sta2x11_vip *)' (aka 'enum irqreturn (*)(int, struct sta2x11_vip *)') to 'irq_handler_t' (aka 'enum irqreturn (*)(int, void *)') converts to incompatible function type [-Wcast-function-type-strict]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/sta2x11/sta2x11_vip.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
index e4cf9d63e926..0a3827575753 100644
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
@@ -767,9 +767,10 @@ static const struct video_device video_dev_template = {
  *
  * IRQ_HANDLED, interrupt done.
  */
-static irqreturn_t vip_irq(int irq, struct sta2x11_vip *vip)
+static irqreturn_t vip_irq(int irq, void *data)
 {
 	unsigned int status;
+	struct sta2x11_vip *vip = data;
 
 	status = reg_read(vip, DVP_ITS);
 

-- 
2.43.0.429.g432eaa2c6b-goog

