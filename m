Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DF446A2
	for <llvm@lists.linux.dev>; Sun, 28 Jan 2024 02:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706407947; cv=none; b=utJFyCs1952G7ad/JwKDSVFcxcLyq8zDvZ/CxTmy2zls2TehLRcE9qkfBbnTD3Ss13/GlHquQ+59vg/GwOTa2w1dPJ6xLAouLIZ6vbZCfBlYWiehpKNot/EoCVpb0MXqeTrJQ3FUzeXIwAHBn+jPA3asmtDqrnuZY2Vt4VRwI6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706407947; c=relaxed/simple;
	bh=9FkkM0hWSfNgvycjkBk9G6d+gbIZbwtTlwMJBT/mtG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j1fgJsXNIaDH3TWIvIg7LlPHwUhfpl6fWKJge/pj8BvNjOcwA/mhw99J+VnZHX6mUYxrtWuRgv7Xv1xKmi55PrrpiX8kIxK5SbcDPseXg90g1Aqp/UUubyNkrPj64PH7JhqzPNLNekBqucNF9hmq3iaqe22ZMWnJv1CunITXSs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ABZPiWGT; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ABZPiWGT"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-42a8af3c724so4893241cf.2
        for <llvm@lists.linux.dev>; Sat, 27 Jan 2024 18:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706407945; x=1707012745; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3C7WQBZgNLZ3JFZZb+3FA3visUd8j+r0zGWZyg3Ybg=;
        b=ABZPiWGTPfDRIR7ojXMIe0B0hhUDMzTdbYDzMKl/1wSg6t2RBvAjVRiNZv2RitkZD4
         N5bLJ0b2CXAe9MnhbaijcFvLSmeJyRtAoYMP/elJJHCOhE1CSmwfRm06RhkkSfae+Wj/
         GiSOrkF6OuUJIYO/G2vnDlYj94rtp7dZBfm50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706407945; x=1707012745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3C7WQBZgNLZ3JFZZb+3FA3visUd8j+r0zGWZyg3Ybg=;
        b=Bn7o8bNMV/kp2keROrQuhikj4VKaaqyPoq5U6UnypSlzCbVdnrfY0Mjwfx1WNL9+aO
         4ECfEX0i2MHp1kgHb5DI4MRX4Idajy1MgrqYyUbO1CTO56Nqc3OJ3BGWAhOP8xAk7AKw
         vs7ui2KUYFl4DUerV92HW2nQGyYFi/I0wlUaCdB9w4t17NY8IDPYT7eH4QcveX43/nRB
         VJqXuFm7iSWTA/FcMOjFf+bgK4JwoZ5Q4h35NgyWAfnpCGpOYGa1RHSysESrnDCn/E40
         o1SkUFkmXuKnhm/OB4QsaZqWKIFs4/ceeCk5J/1zi3KGoqQCmdYqq1kgSVVI/vpouJYg
         rt+Q==
X-Gm-Message-State: AOJu0Yw0fhPx7P96Ac3sr1t0FRG+/6dWVNtFUZf6z3aFPvgXKOMcqhpM
	xYgU/+pQ8f95ycggdN7B0IAzpt4/dSpB2xeKgRjK9votSNuNstvnfH2FrBXz8Q==
X-Google-Smtp-Source: AGHT+IFQh4FaJ+1XI2IdQ76ww3xRTWTulNHZ3WBhfnSPiasZomtas55CswgU5xylWxHtrHsOrzM/jg==
X-Received: by 2002:ac8:4e96:0:b0:42a:87ff:4b0a with SMTP id 22-20020ac84e96000000b0042a87ff4b0amr4978445qtp.99.1706407944870;
        Sat, 27 Jan 2024 18:12:24 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id ka23-20020a05622a441700b0042a98bf0117sm568061qtb.78.2024.01.27.18.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 18:12:24 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 28 Jan 2024 02:12:22 +0000
Subject: [PATCH 3/3] media: mediatek: vcodedc: Fix
 Wcast-function-type-strict warnings
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240128-fix-clang-warnings-v1-3-1d946013a421@chromium.org>
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
drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c:38:32: warning: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsigned int, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned int, void *)') converts to incompatible function type [-Wcast-function-type-strict]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index 9f6e4b59455d..781a0359afdc 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -33,9 +33,11 @@ static int mtk_vcodec_vpu_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
 	 * The handler we receive takes a void * as its first argument. We
 	 * cannot change this because it needs to be passed down to the rproc
 	 * subsystem when SCP is used. VPU takes a const argument, which is
-	 * more constrained, so the conversion below is safe.
+	 * more constrained, so the conversion below is safe. We use the void
+	 * casting, to convince clang with -Wcast-function-type-sctrict that
+	 * this is safe.
 	 */
-	ipi_handler_t handler_const = (ipi_handler_t)handler;
+	ipi_handler_t handler_const = (ipi_handler_t)((void *)handler);
 
 	return vpu_ipi_register(fw->pdev, id, handler_const, name, priv);
 }

-- 
2.43.0.429.g432eaa2c6b-goog

