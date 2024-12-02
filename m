Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAAA137C2A
	for <llvm@lists.linux.dev>; Mon,  2 Dec 2024 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154448; cv=none; b=AesSwWHvo3TthyUiFLOrSbA1kBmN0FasQ5AGa1YZQoE5pIYn1iIy5bskuBZC23cubC2qEgrVYeiKH+GXzyAvVGhmUKs9ptwvomnLNjTN6MjI4P7yweXOplj6D/7/qx/cTqhzK6HKFbgfj1g3C0KUPKWUTxgSJ77+0SXxhjkLOPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154448; c=relaxed/simple;
	bh=NQt98Z0M5QNA/TsO8gh1YDS9GMK76KynhZ9aabRaUlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YI4zS8Fc+NHwbT5HB2RoT8eRWpu0mecqlRrWlkRL4XgQQgOk3m9mNYM0gevTKAWXoZPacrJPwIFuKrqI14Feux6f7K8b3hSEQcyJ5EwhEsQQmcdkhfl16vuYjouZnXN4Q/B4sZtHGOT/FddOA7UpbTWMO05Fdx+2Vg+PpsfTdJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IFJZIJkc; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IFJZIJkc"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6d89a727a19so14992746d6.0
        for <llvm@lists.linux.dev>; Mon, 02 Dec 2024 07:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733154445; x=1733759245; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2F2lVT/48t59mZz2zC2oH5sxyMbSECeGcR5hkq1C/k=;
        b=IFJZIJkcdUunOJgW66LMoNGUsppja64dND/BXG+90D6AHPpXiSYOlELx/AUo5gtjFx
         rzIcCPe+p1IlndxFiPkMcvdBOsr77XlN1ZVMTMNpvHzROdvCOdpZWCrOlvX2ZvDqTB5e
         /DwjqYXOWKUY6kNsj5Orp6uhBOVJ5f+9TNYK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154445; x=1733759245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2F2lVT/48t59mZz2zC2oH5sxyMbSECeGcR5hkq1C/k=;
        b=apkGoIPoT2sbekbzELHORLbYKDXj9tgRKqEywoCmaCETZxlDzjRhEs/jKmnuzdOO3f
         sHc8LL6FuAUUg4IDw+L96J06Omxsl7qUD6pkVm6LBBsdPqV0F7w5dfeOg1Y4UR5Cewf6
         MQ3oBm+MlqWmaiK+o65ndxZzZMS6ubqTCVcIETQx5kTTXEdRy9HIZs4GBiFkw50ctFml
         7TgJje9k5eMiI6IKermFzJM9I8+2iRoGgMrdtSMQ1FZIyMQCg2iAJJKnZGf/R8r/7OP+
         mJcbiV++ojUyrkwntjRh5NB8phsYC4aOvlMudRMN1MVNjVg7sUXGROJM9+UiND767xh5
         JgOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx/rtgkQFPsTz5nw8umSIfyxw9sV9R13jAm+owKefKpziENvTiry1rCRpxGVkYQPJwyv7o@lists.linux.dev
X-Gm-Message-State: AOJu0YwwPrsd2Eyr8xU5ePsq+gb4V1wYWz03LgJpabVnILZgYeQP07Me
	eG+4AbDg5AOLWU4fkGqaXJIbQmnriB36eosuBij5VnHKNdpdjvCRy+i3XyeTpA==
X-Gm-Gg: ASbGnctZMLudXZoe6UuQWsim6VlyDHl1Web/oV7P32cgrgkK7csN0wwbXHwN1lrA2AX
	uUN7XNC3ykg0W6OjmMqpHNagdpeZSOi3fYtgCLrQT8Ti8JSeM+2yAfuW0FTYfWpBbyhHUs7F2/T
	0+81pSqZUfTX6cPxvdTqFjfluTqETLiswJ2Eipu+09G1/8Azty/WyrGzYUijovRGIZFG8FrI+l3
	ioaQIUCUUAvOsSCRAQ0zGFHt4FJBhnPyCXEDhe4cDeK/67FQYWJE5ynHxNcqbq+HrYE25Tdbf7z
	922fa4FEDaBfoCYCgejUy0KP
X-Google-Smtp-Source: AGHT+IGi/PMi7HKxN0drYRNoeMrQehkEDZgCgHDgtdOzyjj8HEWJDMxx4Dj3/iwSYHFuTdJy9nQktg==
X-Received: by 2002:a05:6214:626:b0:6d8:a1b4:b58f with SMTP id 6a1803df08f44-6d8a1b4bb2amr99633466d6.11.1733154445272;
        Mon, 02 Dec 2024 07:47:25 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0f8ad6sm1159729e0c.49.2024.12.02.07.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:47:24 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Dec 2024 15:47:17 +0000
Subject: [PATCH 3/3] media: mediatek: vcodec: Workaround a compiler warning
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fix-llvm9-v1-3-2a50f5acfd0b@chromium.org>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
In-Reply-To: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

llvm identifies that the SCP_IPI_VENC_H264 and IPI_VENC_H264 are from
the same enum type, but their are part of the same ternary operator.

vpu_inst.id is of type int, so we can just rewrite a bit the code and
avoid the following llvm9 warning:
drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29: warning: conditional expression between different enumeration types ('enum scp_ipi_id' and 'enum ipi_id') [-Wenum-compare-conditional]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
index f8145998fcaf..4786062e879a 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
@@ -584,7 +584,6 @@ static void h264_encode_filler(struct venc_h264_inst *inst, void *buf,
 
 static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
 {
-	const bool is_ext = MTK_ENC_CTX_IS_EXT(ctx);
 	int ret = 0;
 	struct venc_h264_inst *inst;
 
@@ -594,7 +593,10 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
 
 	inst->ctx = ctx;
 	inst->vpu_inst.ctx = ctx;
-	inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
+	if (MTK_ENC_CTX_IS_EXT(ctx))
+		inst->vpu_inst.id = SCP_IPI_VENC_H264;
+	else
+		inst->vpu_inst.id = IPI_VENC_H264;
 	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
 
 	ret = vpu_enc_init(&inst->vpu_inst);

-- 
2.47.0.338.g60cca15819-goog

