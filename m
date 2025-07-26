Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B1F21C16B;
	Sat, 26 Jul 2025 07:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753516406; cv=none; b=PjC4mxnztn/kPdTmjUZGke9ufPg37VSaJ/t2gWZJvcFXLvxfEZeZP/gyGF+z/mrQIp0gKzTQrtPw07hZYXb0gBhjHWulgxsVePl1GPAn+As+4Vgw3ulES8fFshckXyv8s8bID10rN2OcLuO8Mr6cEI6PSPsL3H7OLqYZtBUE6aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753516406; c=relaxed/simple;
	bh=ZULe9obZ09AITQHO9BPnUCZXts9FE3eLccsfGy5RX0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fyj19zyoNbjx6ucdhUYCZiYHcYrqv86q7NF74F4IVsdVJ/GhU3znQ4iKBRiIngWBzQlAPg1l/356D/TLr9XhOAsNxyINhjxlJGTJjW/LHnRRwG2pXMkEPH8Fryh6sH45u9OG6/00Aa8B75iapKaKeo6cZv/XnagA+YeWZS1tmqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHjzYxIL; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHjzYxIL"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b31d578e774so2694524a12.1;
        Sat, 26 Jul 2025 00:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753516404; x=1754121204; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Yt4HAobT14RazfW63r3vFdQaxxPOup80rKFVAFgqHA=;
        b=QHjzYxILLO1aw8kjkbgmu8ChLzhCjICKZIAFToqYptXsfYnTbjrKJaBCmW/UulJbIz
         NMZsPMjHr6BAj3vP7HFfkXLdD4icE65TeX1ph1hY5Ns4YA9uWK20dhtJ157jGPcTRQXX
         QBxTSkyFiXtINXhMPPFjey6cFNKTU8FiXXYeL0vRqhRzhMYl8rkLpZGZuomZ7Fzx89xL
         v7Tk5fIftawN9aznSkg9kzDWcWVn6ATCfF6loPDth/TE10LoaE9iiCRV2Dd31IBswOIs
         Tg8nhDfL5gG5YQb8NaQt/QAWdASlfQW9LTNGLHs2C+S5qkBV0/qUKBhMqaD6dur48tAF
         XaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753516404; x=1754121204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Yt4HAobT14RazfW63r3vFdQaxxPOup80rKFVAFgqHA=;
        b=R64MsBKfiHLGoBnNsv29pTGvV7mlZsHwIB6oSe8FaSDm+QCK6qD9U8WCxdgYCdBFz8
         mXnpMp02RzWUlCvtQ+ogZG44KTzCGioyoeCOqykCfwsa/5RYU72TAsKV7QyxXK6Oez9R
         DbRBwMbzHgxLEu//kyhUXrQClMAOs30BNjfZEv1vdD9c+i9nAGnMuTYr9t7PGyePCKV4
         I+x04TIexpHDQlSx3juBROoq5UU9s8ADizIG1dWvmCtwOP9B+x5OpgDMg8JqSSDCUKs3
         c6jFlihv4qR8XykseOJ04Uf4/FNCC3LknTkv6BBuk8iYjv0Mb3t3c5eKcaM8OLEwwiKA
         FHgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX616Lzxj5QgTNRyGPnxCwxB9TVcqp2q2dU8gXdifOy2fPHSOFdnDK9gfn+X2jHBvbYFVQG2w==@lists.linux.dev, AJvYcCXpPJ3Yuc953APfzI8eFEyK8o35YFi0MaBlG9crOu1g+GWDkhApevGwa2K+63lmPXIeXir7o6IjHSo5DK3o@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo0IBCIlfpWbQ6DwfPmWFaG8SPevnnQyXEreD6rDwIJEkTRKJY
	Kk4jSKcbaIb/ycie0ZeD5RvYAu0qbfwVWzHRTs3fT56jvzbDeSgFY+ot
X-Gm-Gg: ASbGncs4EjtjbpIqCSYt59OrOYhe+58tgj8n/lcF/CBTo4xJOP0uKtstEtqKiZRq0j4
	h+4Mao1T9QhicLTCq7CV+1QI89dk7Dh2LyUPYzKBiWC7ondV2ePHrxUxke4bgAOEsHOqRAf8nJD
	X8jf9kMMHGnDHPM4vbM40kvZNywtdT9wo/QsqtpButVZrGGwAtrz2F/i2yjZyjQZvZKCTsmOLBq
	3A5PQvhd7BtLHZaykyfPhpboKxLRmAxqi3T0oP1FjzMK5Bgjd1oqR1Y52bO7gUK2mz/D5MC6+oT
	XPhqBAzYu+qY7THyxJYtJk+BEkTHdXwticfzCrIAELgovtO4qUh7A0GKXKEPgQzd9l+9U2ywW0G
	a1IncfoSZZOUi7+N2CJTJtL0WE+C01V90E3tvD3VceECw+jAT8/niytDJ3H/eesisIcquqdjw9K
	cz3LKG73H/+QLtS4Md5Nl7
X-Google-Smtp-Source: AGHT+IEPgjn/mmIAH6VpRWah8+yxJ+DkOYJ7QQBBBEaP/6OKMlER0ABmom9pxqmiU946l5nzGW9YHw==
X-Received: by 2002:a17:90b:17ca:b0:313:d342:448c with SMTP id 98e67ed59e1d1-31e766b2893mr8107395a91.17.1753516404208;
        Sat, 26 Jul 2025 00:53:24 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm1234979a91.1.2025.07.26.00.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 00:53:23 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Sat, 26 Jul 2025 15:53:12 +0800
Subject: [PATCH v11 2/4] staging: media: atomisp: fix indentation in anr
 files
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250726-new_atomisp-v11-2-46eba1953fba@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753516395; l=5441;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=ZULe9obZ09AITQHO9BPnUCZXts9FE3eLccsfGy5RX0U=;
 b=AgtRwFex1T15UFET84o7CWlbPodZi1H5beaOHwVBcLcLILBSLkTC1scspv3/Tne+sg1CU9lcn
 QfFfodWM4beC0U6ifw3GArxJRb+SfrlizqklWxWgNXKmJK4Vl0L8xAd
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Fix inconsistent tab/space usage and bring function definitions
into a single-line format, matching kernel coding style.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c    | 20 +++++++-------------
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h    | 20 +++++++-------------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c     | 14 +++++---------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h     | 13 +++++--------
 4 files changed, 24 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 899d566234b9d3a35401666dcf0c7b1b80fd5b31..49c22a68ec552ed163e3268db2b823fc4ea73b36 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -21,20 +21,16 @@ const struct ia_css_anr_config default_anr_config = {
 	{10, 20, 30}
 };
 
-void
-ia_css_anr_encode(
-    struct sh_css_isp_anr_params *to,
-    const struct ia_css_anr_config *from,
-    unsigned int size)
+void ia_css_anr_encode(struct sh_css_isp_anr_params *to,
+		       const struct ia_css_anr_config *from,
+		       unsigned int size)
 {
 	(void)size;
 	to->threshold = from->threshold;
 }
 
-void
-ia_css_anr_dump(
-    const struct sh_css_isp_anr_params *anr,
-    unsigned int level)
+void ia_css_anr_dump(const struct sh_css_isp_anr_params *anr,
+		     unsigned int level)
 {
 	if (!anr) return;
 	ia_css_debug_dtrace(level, "Advance Noise Reduction:\n");
@@ -42,10 +38,8 @@ ia_css_anr_dump(
 			    "anr_threshold", anr->threshold);
 }
 
-void
-ia_css_anr_debug_dtrace(
-    const struct ia_css_anr_config *config,
-    unsigned int level)
+void ia_css_anr_debug_dtrace(const struct ia_css_anr_config *config,
+			     unsigned int level)
 {
 	ia_css_debug_dtrace(level,
 			    "config.threshold=%d\n",
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h
index 4f77900871c8b9d43bdc00308aa914eda3af7fa7..2f17d62b92087afd26aff2a49dadf4ee2fb7fcf5 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h
@@ -12,20 +12,14 @@
 
 extern const struct ia_css_anr_config default_anr_config;
 
-void
-ia_css_anr_encode(
-    struct sh_css_isp_anr_params *to,
-    const struct ia_css_anr_config *from,
-    unsigned int size);
+void ia_css_anr_encode(struct sh_css_isp_anr_params *to,
+		       const struct ia_css_anr_config *from,
+		       unsigned int size);
 
-void
-ia_css_anr_dump(
-    const struct sh_css_isp_anr_params *anr,
-    unsigned int level);
+void ia_css_anr_dump(const struct sh_css_isp_anr_params *anr,
+		     unsigned int level);
 
-void
-ia_css_anr_debug_dtrace(
-    const struct ia_css_anr_config *config, unsigned int level)
-;
+void ia_css_anr_debug_dtrace(const struct ia_css_anr_config *config,
+			     unsigned int level);
 
 #endif /* __IA_CSS_ANR_HOST_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
index 09599884bdaefe32f891f437274b96110888a675..3c6d99139cda6f12eb6ef6fe8f996f7ff11551c2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
@@ -10,11 +10,9 @@
 
 #include "ia_css_anr2.host.h"
 
-void
-ia_css_anr2_vmem_encode(
-    struct ia_css_isp_anr2_params *to,
-    const struct ia_css_anr_thres *from,
-    size_t size)
+void ia_css_anr2_vmem_encode(struct ia_css_isp_anr2_params *to,
+			     const struct ia_css_anr_thres *from,
+			     size_t size)
 {
 	unsigned int i;
 
@@ -28,10 +26,8 @@ ia_css_anr2_vmem_encode(
 	}
 }
 
-void
-ia_css_anr2_debug_dtrace(
-    const struct ia_css_anr_thres *config,
-    unsigned int level)
+void ia_css_anr2_debug_dtrace(const struct ia_css_anr_thres *config,
+			      unsigned int level)
 {
 	(void)config;
 	(void)level;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h
index 2b1105f21c1e2b37144083b6bb8f9dd465a2f43b..36fb6c25969991ffcdd4424a695dacc5b5c2a9db 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h
@@ -13,15 +13,12 @@
 #include "ia_css_anr2_param.h"
 #include "ia_css_anr2_table.host.h"
 
-void
-ia_css_anr2_vmem_encode(
-    struct ia_css_isp_anr2_params *to,
-    const struct ia_css_anr_thres *from,
-    size_t size);
+void ia_css_anr2_vmem_encode(struct ia_css_isp_anr2_params *to,
+			     const struct ia_css_anr_thres *from,
+			     size_t size);
 
-void
-ia_css_anr2_debug_dtrace(
-    const struct ia_css_anr_thres *config, unsigned int level)
+void ia_css_anr2_debug_dtrace(const struct ia_css_anr_thres *config,
+			      unsigned int level)
 ;
 
 #endif /* __IA_CSS_ANR2_HOST_H */

-- 
2.43.0

