Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2168722126E;
	Sat, 26 Jul 2025 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753516413; cv=none; b=kgv3BueOWKFGXa8wcQB1rp8sVoRYY6lEeFlQgRlVogh234stYI2oMtwonoqQqk3x4+t7QTXpNwOp70jBBEMERgt6n+q4F7ifNcSplt0ofNRjXnbMRXjJkkjETxqtTU195KsZmkUyNeNmiHfUoxbNmU1qbrGNSvlycrbjC8oz8os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753516413; c=relaxed/simple;
	bh=8lW0FT+ajGfnaFktrf6Ri42a5YHuN/0ryZeZh5gSR8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h689TLbSlhNi8J6BzLFbc6wVHxs1sGnVEVRKfV6+TWgFoHr1HEoC9QbwUbSOmhtOk2I3WS0ZFkFsEyY7CQ1Fs7cVYQHc4VpkNKGdmnuBFWWudxIdbxNvFH8rSzeX6O0McKfkJQLPfdVY7MXB6dkq4TKkPslU7lUwmTl+mp+EJ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3zc2ro/; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3zc2ro/"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31a93a4b399so2451648a91.0;
        Sat, 26 Jul 2025 00:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753516410; x=1754121210; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbVhOvrEHD79IFkFX+s0ts9glhzmC/IrVv2w0Cn+ND0=;
        b=H3zc2ro/K5xQAogz17BCZ4yYjo630WFNKbVwH81M2bedr71h/sVi4KeH/hiQkIfojV
         HSJkgQqrUNLN29D7TwaEtEy+GVxBoCOSRD06UAGGXooF2H9d2R5CxeCuguMkOV5KG7uo
         g0siO3sHVsIXekYwDecYdG3o18Pa0XByvktFEUfYRG06w7moYiOW9GtLkIaQJctYkYne
         CxyNDrLYDJNTVj/FAXO1ZenCI8a6sAyGKio+coR910kTtOkDCUORivjrvlhFQpQiFKgV
         wOpGzLQQVaz90yBeS3DQselip3Asjpuk03C9s/ibUofq5YncGcH/qZWtUpoyru3tTpjQ
         Nbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753516410; x=1754121210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbVhOvrEHD79IFkFX+s0ts9glhzmC/IrVv2w0Cn+ND0=;
        b=U07foIhndH3bkdWhdAaSVQqGRJGsHMM40h+zrGT/o/re88aing2AKdqaVaBKG6S6/H
         PUCoOqIGfNDRLH6kfcCb1M40yxrFMO44ePKlHk+O8bkWD8YrQYyjxoD3GceVR7VSZbeE
         /sE1GquOh+tyKIKl3jAa2YjpmKI7bkVKd81C1GdROtehucJRfzoXM9iEqbSahyn+PJg2
         sJmxP3TFpI2Hx6GZPEaXxehucg9OJyAJPxobAyR8jE3/4CCl5yIKVzIEqkoYPid8G9Q9
         /mxyA+IDCZOfziqSNDSgRUwYWqLgNaV3gT0+8L/HvIfoFJGYsDrjxAoN2gNmrmlKl/fZ
         qlVg==
X-Forwarded-Encrypted: i=1; AJvYcCUrS5kQNiobnJd3b5LT539K0Cc8V6e9d4EY6XZRCqkQfsM3O9BimZFG8vP7RuMfguI0vStCf9qcY9oLq+iU@lists.linux.dev, AJvYcCWdGgYNbD+0uA+EZfGoiDuO2a5a3h3mmSRRmXDYfVyEz86C/b/PDXfp6hbwYZaArdGpQL60HA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhsfJpb02b9qcsrdzDMbhoy8VnbeYXvZd7tpz86TJop6lmPNHY
	yII9OLmaOLLBiZvxTqxQQnYD0U2BRXBU8J/IIDmqbWAjcCaavDgM48+e
X-Gm-Gg: ASbGncsOxh5J6Yx+fKnm9aXO9VjdQFtg6rprS4H+JUBzDaLOME/GGWbAAcLhukSdy+G
	6YiqfqxYec7M+6EE9yF2rV1XdJ8RuoNtZyAx8hVYIllGF4sVsqDIeTEsEhK7rg2x4T+NfBvGbAi
	+j0dYgEhbhH5q0yrLecjW36tFPci6b7No0sHy6MZJtXPRqMHvl7ZNN1+qGp+auQvBHrn7v8IF/M
	KqzDgnMcXwGF8fQSgS3PHg2RmBnf4O1GxeAktS4vOlI1UAYqVo8U1Mu/1Fr1i9CmjIFOr5FKjXI
	6nwt8Yju91ARYY273Wq6N3PbjxSfTpkCB6R+8t31Jpr9y0zEMLIfXiX27eihBZ4lflxweYVxhbV
	vlX5G8j4bxpmdc3JaZ1BiTs5IIH4W1GBdmw/R9GkPfEYO884sTQhaTa+TUuKJ+Tp1N6G0rmqbhk
	KLR4C1phHIsg==
X-Google-Smtp-Source: AGHT+IFmlk7XXVSMK3hNd32GHRMHBVCZAZZ7o6LG/w9Q3uWyVv9bdoRY1q42nhwjVoQFJpQmqbXmrg==
X-Received: by 2002:a17:90b:5107:b0:2fa:17e4:b1cf with SMTP id 98e67ed59e1d1-31e765ab632mr7648749a91.2.1753516410213;
        Sat, 26 Jul 2025 00:53:30 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm1234979a91.1.2025.07.26.00.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 00:53:29 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Sat, 26 Jul 2025 15:53:14 +0800
Subject: [PATCH v11 4/4] staging: media: atomisp: fix indentation in bh
 host files
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250726-new_atomisp-v11-4-46eba1953fba@gmail.com>
References: <20250726-new_atomisp-v11-0-46eba1953fba@gmail.com>
In-Reply-To: <20250726-new_atomisp-v11-0-46eba1953fba@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, llvm@lists.linux.dev, 
 LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753516395; l=2576;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=8lW0FT+ajGfnaFktrf6Ri42a5YHuN/0ryZeZh5gSR8s=;
 b=FpAPIRhKcJ5aQrsXmb3ZqlV1+MoowmEJAPvHkLxx8h4kxCQV+9Ynx3OVzR0RYVQ5KhxKwrIzy
 cX+lC7RRN+GBYXWOEzhc2CS8biUHjG/FT8G9CIEE1I/M8CWXXjhq/Vy
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Fix inconsistent tab/space usage and bring function definitions
into a single-line format, matching kernel coding style.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c | 14 +++++---------
 .../media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h | 14 +++++---------
 2 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
index 69c87e53f3c22fade6c4c7914d1550f68dd8f5c2..b87eb1a21b216dc6132331d2a48d7cb56ddaea24 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
@@ -12,10 +12,8 @@
 
 #include "ia_css_bh.host.h"
 
-void
-ia_css_bh_hmem_decode(
-    struct ia_css_3a_rgby_output *out_ptr,
-    const struct ia_css_bh_table *hmem_buf)
+void ia_css_bh_hmem_decode(struct ia_css_3a_rgby_output *out_ptr,
+			   const struct ia_css_bh_table *hmem_buf)
 {
 	int i;
 
@@ -37,11 +35,9 @@ ia_css_bh_hmem_decode(
 	}
 }
 
-void
-ia_css_bh_encode(
-    struct sh_css_isp_bh_params *to,
-    const struct ia_css_3a_config *from,
-    unsigned int size)
+void ia_css_bh_encode(struct sh_css_isp_bh_params *to,
+		      const struct ia_css_3a_config *from,
+		      unsigned int size)
 {
 	(void)size;
 	/* coefficients to calculate Y */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
index 36b360cfe62e65037522e0037cf51fca0fabdfba..964d658ceec31b0b22fc3bc6d19b40b07b2fc06c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
@@ -10,15 +10,11 @@
 #include "ia_css_bh_param.h"
 #include "s3a/s3a_1.0/ia_css_s3a_types.h"
 
-void
-ia_css_bh_hmem_decode(
-    struct ia_css_3a_rgby_output *out_ptr,
-    const struct ia_css_bh_table *hmem_buf);
+void ia_css_bh_hmem_decode(struct ia_css_3a_rgby_output *out_ptr,
+			   const struct ia_css_bh_table *hmem_buf);
 
-void
-ia_css_bh_encode(
-    struct sh_css_isp_bh_params *to,
-    const struct ia_css_3a_config *from,
-    unsigned int size);
+void ia_css_bh_encode(struct sh_css_isp_bh_params *to,
+		      const struct ia_css_3a_config *from,
+		      unsigned int size);
 
 #endif /* __IA_CSS_BH_HOST_H */

-- 
2.43.0

