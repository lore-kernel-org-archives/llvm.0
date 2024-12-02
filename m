Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E531126C03
	for <llvm@lists.linux.dev>; Mon,  2 Dec 2024 15:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154447; cv=none; b=OOGJpCUTZslA6l2m0md3/MO2t//pFUtxikD4zKAr/OLdnqh2kLNPLdOzXr+vvFe6Tj564KQfZjKSKKcuECuDfjmuBiejihah38u+YnVEyxG8jOEQV+9oh9eZ29TfHDXWabK8talD90gu1j9imYpOLKNE8sZwfj5yKIrE+ikISKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154447; c=relaxed/simple;
	bh=rjvM8q19fcbBsiIYtenn0hKh0vxaDX+5kJuh6tcl068=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FIMO5mcImE8c6C1URRuvBz98+hH6IUB1kshB+P+qsvxQdoYuWEIIB5xQl8vPMWInHYbrDCglapv0hR+Wxy/bTTV4kTWhHtCyYuwRK7t5UC8ZhzcDjUDEdAY+ckIIAsbKiA2ScGDMrHpIi1bBR2S57nPMaXTBcY/37tKL+wTtqro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dlmht49I; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dlmht49I"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-85ba22d390fso424505241.0
        for <llvm@lists.linux.dev>; Mon, 02 Dec 2024 07:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733154443; x=1733759243; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pxSoz1ajcI3n8y8uPzRsEcpmfNX2HaWKguXvR+KRDQ=;
        b=dlmht49IUoWMRDgmpUqbO5Z1zSFDuCJBjmThGpyoLQtmJ0YjrvJ/7ByghkLHDQTLYc
         uGATbrmZvgu3wXvchhHeqRhATIFRemVm5izWDHJ3jGeUrAAD49qmxWJm0L8jsoHowX+j
         D6Jqhf+fu+z99kldO0xwCZcChbTvmdkatzEtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154443; x=1733759243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pxSoz1ajcI3n8y8uPzRsEcpmfNX2HaWKguXvR+KRDQ=;
        b=BeO0bymiO+ywwDQsoAzcFY1/SulVTPkWRjX/G+IcvQaSWgXWbUldPK2ayYuwmnJzcy
         7a3BTO6qL96yqoZq8xntb+1PH799lCCNb2EgM1KnJx09R9AGb1d3UK2DAkTzRxO2CIZQ
         lCBtoDz69tJ4oug9B8PaEHssByq8wfgf6SQjPyh+P51E1oTUCDNnHlLGofXGlq/ui/d9
         YoqRBQg1INvOzYu/KaBKVtTCw1D6HAg2p6Ie4vsNadPi9EJBokIlsDmLBJAop7VQfGMc
         bB//W6EpVbvpjdHXcRF9o8zBCwqcEgF067KTX/DsFQX+icKBczY6+rGPlkOguVyhbbyK
         IRqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI0SSbVoiqyGw2/Exn54p6mZVzmY+oj7qKo/ROesptqTObfHxrrVlmP+xfeQa83TrH4IDU@lists.linux.dev
X-Gm-Message-State: AOJu0YwE+7HgIkzMOVIxjkLeJDaG+feOYIZWw6fYCPyMldJXA+vZbLtF
	PooAxr7ouMJvSCt7CnHrP+vIy5shy6WP2Tk2BzFIDY0AVOzmbhQK/Iny2ygdUg==
X-Gm-Gg: ASbGnctfETFc0w8viS+7HtFYTFMe/ueUdJvjy8HBWmTZ2uRVLzNHASa/QBo2WXQ4Osd
	Rb7O2W1wG+aS/yz8LGKhI42HwozIPD1/jSWOnde7/26mWG7fT240HQoU5jxYzA6CaH5BE6lEFBw
	7voyWbfYU4H4MA9SwJ+ZJvqORPrzEVNUmsN47kApuPyJQL1pksHBjQbcpGpIElfhFS2CFAzLCuj
	7mjHisdRIA0qPEX/hGrGVzvWx+nQTW535jiqnQcWtw/Xn2uChNEG3nhJzt/IERSmsFRsR6s1yMN
	oAo4Z28xvin5iogrw1pgJDVA
X-Google-Smtp-Source: AGHT+IGaWcZbV6qtojnjaBkX2eRGECUPG2dd+i3FQicKN4gnW5JGkqWcKAek6j+Ilms9M2b0vFq/qA==
X-Received: by 2002:a05:6122:3c4f:b0:515:3bfb:c7b7 with SMTP id 71dfb90a1353d-515568dab17mr30842699e0c.3.1733154443629;
        Mon, 02 Dec 2024 07:47:23 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0f8ad6sm1159729e0c.49.2024.12.02.07.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:47:22 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Dec 2024 15:47:16 +0000
Subject: [PATCH 2/3] media: atomisp: Use the actual value of the enum
 instead of the enum
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fix-llvm9-v1-2-2a50f5acfd0b@chromium.org>
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

hrt_isp_css_irq_sw_pin_0 has a different enum type than
irq_sw_channel_id_t.

Replace it with the actual value of hrt_isp_css_irq_sw_pin_0 to avoid
arithmetic operations between different enum types (and make the
compiler happy).

It is required to build with llvm 9 without these warnings:
drivers/staging/media/atomisp/pci/sh_css_hrt.c:68:19: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
drivers/staging/media/atomisp/pci/sh_css.c:1233:40: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
drivers/staging/media/atomisp/pci/sh_css.c:1237:40: warning: arithmetic between different enumeration types ('irq_sw_channel_id_t' and 'enum hrt_isp_css_irq') [-Wenum-enum-conversion]
ro

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h b/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
index 2c47e7820bd7..69e68ecd6bc3 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/irq_global.h
@@ -18,7 +18,7 @@
 #endif
 
 /* The IRQ is not mapped uniformly on its related interfaces */
-#define	IRQ_SW_CHANNEL_OFFSET	hrt_isp_css_irq_sw_pin_0
+#define	IRQ_SW_CHANNEL_OFFSET	HIVE_GP_DEV_IRQ_SW_PIN_0_BIT_ID
 
 typedef enum {
 	IRQ_SW_CHANNEL0_ID = hrt_isp_css_irq_sw_pin_0 - IRQ_SW_CHANNEL_OFFSET,

-- 
2.47.0.338.g60cca15819-goog

