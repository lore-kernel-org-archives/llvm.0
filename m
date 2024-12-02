Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816FD55E53
	for <llvm@lists.linux.dev>; Mon,  2 Dec 2024 15:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154444; cv=none; b=HCraYbgNWj2Nl1eRAGHaqMAXKjp0xRONcp4tmDjwH+yDIaNX2CztH5B57tLIZol25wDALEOIATfnIVK8hMcLTsPqzr+XzO8MtPFSUvWv+T7aG0QQUVLzQI6xBxuvcmN5UX1bgJGlXz0A8GZKZvH/Z4mNEwf0GsbsPXVQk/fL/WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154444; c=relaxed/simple;
	bh=mtiQtlXyI3b6sJIsjA4TwpaNavz3zj9aF+MIz5P2kic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jYSJ/i9whFZU+JwKKo2n0wyELKAEYeKmotu9mqpjc0V5w5NnE5Hm56duyxpCfMWAaYCRrXsPEH05+jERCtx5WmKhv2q6n0CLckT6lPGUuJwDCO91HV9S/HPGCmywFliMY875risOGNYIM9SaU4XkdK2stWm9d+WwCBkY5PL1RGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZcPxR902; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZcPxR902"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-85ba8b1c7b9so1290048241.1
        for <llvm@lists.linux.dev>; Mon, 02 Dec 2024 07:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733154441; x=1733759241; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkEW/0Y6zT4/Atf/d+puMl0WcNDtT8U8UDsIe65uvgE=;
        b=ZcPxR902LlwKgGyKa80VkKcBvrxpLQThpoLox3hjQBE86upHqUf9OMwn7qOC9iFRjB
         njhV3OJZ1PkHl7yI3IYaC6GggAg1VBeMLqgxyk7uRcrqUoURiTiG00dRVP4mMS1pvzUk
         iOrUvwjjif0xcfUDa0RZPUU5gQrgYARAoxcsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154441; x=1733759241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkEW/0Y6zT4/Atf/d+puMl0WcNDtT8U8UDsIe65uvgE=;
        b=daLfQXuD1O8Nm6xwIEDr/7xAt6mhVinYe5IzPlz2MPKqeiH36ZPLAhHgpWO2gNF1j9
         dvZsgOuqxuf9FftIAp5AN85StzHvLCPXEVxCA3wFUnOiTg4Lff94hfxZ9kHt+pPLxner
         PEzom9PTRDwZqQIn/MIonqDfGPhrR59VEFE1Ax9rcsj5XC9qB5vMxvAGbjQTE2j2Dwwb
         oFLQQS0po1yyMHvhMxvOqziFJfxjdmEwi0uO8ZmoU0tD0xOU/fbRr3umhuVrfRAfSK9r
         UkPitoNSqRhVagS62uGXWHS/5g+fyB+TTO5YBBoN6kIUfCT9OqUPmLeP0N4+VpCRvIW3
         5BEg==
X-Forwarded-Encrypted: i=1; AJvYcCW2WeovYRoGhyk8nGr8J0J4skRMo3yTDShhxLxl57lFzzC9E8t/F4C0MdrmE+ZnJ0epG5Ae@lists.linux.dev
X-Gm-Message-State: AOJu0YzuqpndywYR1yU7lwPNNwFc/Oj22HXcjk5ifWASMeiTWU82bQgu
	L2NyPWuHTLOuUky1aKdiwhnDALtlR6AEyxrotZUyy1zvSu+vNB4GbQ5SW6iKEQ==
X-Gm-Gg: ASbGncs0pecmycQ4ILqvul5n1qvZRCTzBB8SBq95q4Cs/gxL+J6SFPnsFFQHlpR3bff
	WNHGQtE2NOfCkXP9k7+m5bng0mWI0+5w11XUB8sj7UQFGZY0pp1+eUgomVhpJ1ZWqpQRqr4EfHi
	V9KqqNIBLVrQB+90C5fp3Hj6i0qCPko3mdAKewPZjVdHFp8+HP2mVdAtruDPKjFuC85Y2bJvOKH
	XsppuKvBda8KON9qqygn1vpetUnNt24ILyyLEFNYZ13ynZ85eTMsT2ZLQsZ71FAF0U7FPJxy0am
	fVxrmB7xMTjreheip79Db6MB
X-Google-Smtp-Source: AGHT+IGBHPCXG9TwBD4LE/oxUh/BqCKafbDdQlV9UV4NbH/ohrUS+/WPS+6wYQbT3toO5YK2KCH6Sw==
X-Received: by 2002:a05:6122:500e:10b0:515:20e6:7861 with SMTP id 71dfb90a1353d-5156a8069d4mr18897232e0c.2.1733154441340;
        Mon, 02 Dec 2024 07:47:21 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0f8ad6sm1159729e0c.49.2024.12.02.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:47:20 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Dec 2024 15:47:15 +0000
Subject: [PATCH 1/3] media: cx231xx: Convert enum into a define
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fix-llvm9-v1-1-2a50f5acfd0b@chromium.org>
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

The code is running arithmentics with the enum, which when not done with
care makes the compiler a bit nervous.

Because those enums are only used as defines (no argument or variable
from that enumeration type), convert it into a define and move on.

It is required to build with llvm 9 without these warnings:
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:673:17: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:680:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:687:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:702:17: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:709:21: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:718:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:727:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:737:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:749:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
index 5bc44f194d0a..62ffa16bb82c 100644
--- a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
+++ b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
@@ -57,19 +57,17 @@ enum USB_SPEED{
 };
 
 #define TS_MASK         0x6
-enum TS_PORT{
-	NO_TS_PORT = 0x0,	/* 2'b00: Neither port used. PCB not a Hybrid,
+#define NO_TS_PORT	0x0	/* 2'b00: Neither port used. PCB not a Hybrid,
 				   only offers Analog TV or Video */
-	TS1_PORT = 0x4,		/* 2'b10: TS1 Input (Hybrid mode :
+#define TS1_PORT	0x4	/* 2'b10: TS1 Input (Hybrid mode :
 				Digital or External Analog/Compressed source) */
-	TS1_TS2_PORT = 0x6,	/* 2'b11: TS1 & TS2 Inputs
+#define TS1_TS2_PORT	0x6	/* 2'b11: TS1 & TS2 Inputs
 				(Dual inputs from Digital and/or
 				External Analog/Compressed sources) */
-	TS1_EXT_CLOCK = 0x6,	/* 2'b11: TS1 & TS2 as selector
+#define TS1_EXT_CLOCK	0x6	/* 2'b11: TS1 & TS2 as selector
 						to external clock */
-	TS1VIP_TS2_PORT = 0x2	/* 2'b01: TS1 used as 656/VIP Output,
+#define TS1VIP_TS2_PORT 0x2	/* 2'b01: TS1 used as 656/VIP Output,
 				   TS2 Input (from Compressor) */
-};
 
 #define EAVP_MASK       0x8
 enum EAV_PRESENT{
@@ -89,10 +87,8 @@ enum AT_MODE{
 };
 
 #define PWR_SEL_MASK    0x40
-enum POWE_TYPE{
-	SELF_POWER = 0x0,	/* 0: self power */
-	BUS_POWER = 0x40	/* 1: bus power */
-};
+#define SELF_POWER	0x0	/* 0: self power */
+#define BUS_POWER	0x40	/* 1: bus power */
 
 enum USB_POWE_TYPE{
 	USB_SELF_POWER = 0,

-- 
2.47.0.338.g60cca15819-goog

