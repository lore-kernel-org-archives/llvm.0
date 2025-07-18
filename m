Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E328314D283;
	Fri, 18 Jul 2025 15:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752850949; cv=none; b=iNWYpl3RhZbtp8kDvA5ZpbxtQu1MOV8Bij4kz1ysOGzvzNMy38t6ZwDvzELvI8FE1h4Avp4bftXzrl6kIGXnMoCqyla3KMqOjmMsLUXrNv4JEnf/l2VQxD7gzM3yvCB61JSDhL6b9PB612e10+zKg5ihwS/cTUptGSlNU3+kfbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752850949; c=relaxed/simple;
	bh=+e1iMGRpKp9G4bBHxeR7ZAWHo4gzQHuUdz02p5ovehI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CD9pwSPeEblN1i45JTWmwG+Ib6TM8Oz6iD95B0lY2WrcD+s7eBVKRXBCKyaQk0uNFMn5strm59coEiUqMgWVEE+zQbWgPPuId07IudX6kdcJ6hRn/DKFEqKR3UOjLgzQpBaO63yb2r/uqUlpH9WKJllHHX731WQAubAWRDXFtoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+Kkm2oV; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+Kkm2oV"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-748e63d4b05so1455216b3a.2;
        Fri, 18 Jul 2025 08:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752850946; x=1753455746; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rS1Hb9jkF9G9opMttID/56RDiABU17nuzI2X985+cNg=;
        b=R+Kkm2oVXEA9wT9JFWvuG5ROU87tLh6cH9+U4fKFAL1CNuQjVJSON2WsCWg7GLZ6/K
         QyutHJkrYlSMPgntmmPMZIWKrpFDkY6Gsa+rqO7EUaGai7V6G0aOhx4cX+BqcLlCt2II
         IJZDnQTeeTsYRQCA7ndhpu98zpRuIbE2N4O6agaFBsWLd8NqdPDy/DYbjyQB682aiYVj
         Arfq1DwtFkQ81mrSI+3Y+VZpIxwONqbg5BKDsoAUFe8jdZymjLlFRcxkd30ONUZRDKiH
         v9Siav8x6xrtrVbqljVSeg+7HpU9FBB2gXs3OTRK7GeXsQMMSuQjk3krVPPji41wY7gw
         yYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752850946; x=1753455746;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rS1Hb9jkF9G9opMttID/56RDiABU17nuzI2X985+cNg=;
        b=aBlm6LXN1T2xDuzXyCEUf4eQPkAs39Oa7e0riXPbSQO4YpeP9nR8Hy5ndY7Jfv3ITt
         soaorr+aLQhGDL/yeggPEW9nPFrZDI9UJuT+iSRYJjyhfpWc+qaPlOYEXbAQn8iDvFXa
         uvUcdo4r5w3DNUKOW8/b1tGXp7qtD+iA3dyYYFAVRnWRQr0WikTKOlzjXaQPNymHVd5U
         ZJavgmH6bm8SAYXtYPqnIyGPa1OqQviFqQpq+JqKAh6n65TmFefhcxSNaSLIP8p0zdSJ
         nXcu5/FyS98NNsW86v+ltJNOqC7pGm2bfvFZ2LbcWMpxkSOB7Epns3uuDlTiiQnqGejs
         37jg==
X-Forwarded-Encrypted: i=1; AJvYcCWzt1TNxrft3jLCRqw/7dyD50I3uv+wkY5UqIMZGABf59KkM46alyRMVGe8s8VODKay2KP4nSDjsh17BNsu@lists.linux.dev, AJvYcCXoAKhCKvjhNOnvm9GBgy6sbiIHRynFuRLtzB6ph1BHm1qthQiGZP8YpCFau8xe108gqg1ZPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7AC7e6IisHId39f/LNTySbT+a9YsvCNh1dmZUUOdgG0OZTJ5X
	NQ2BE6PG5JLd3SIiPfJ8CO71nfi1atuXfQUOfjXVxWysv93A1X/MJlqz9DwDXMw4OjY=
X-Gm-Gg: ASbGncuOch1H3d6FMUAlycHVuO+0PCiAFM9DRlcGPg81LBgJss4j6fyRAwKRcpV1xr1
	pG3H16iBpuT7fDt3DoG7xzFa3Tyvw5Er59yrR4yObaO6s6McMuN04ibLusOwCNWSxzRwDqAr5S8
	0kgV1RVtFOY98qKb1I6i6BKd5SB7UNxYaoeHSCBgqNXfTsgozGsLD+LsYxBsSBzFVS6WTyj+Xix
	xXOrvv+qEKaM0lIaNtH6hrxtH1w61+fkmLV7/J+w4KrcoBIruKDzLlg3HAvf0qfqOrpoImBx/qb
	Ik+oDUamYRCWuVHQNahLr8Pah0enFkF0tUcXt3hKul0qMOjQesQZhYXfBSh4KEV06Bl7xNpoGAK
	O5ZZ/eLZobi0frSczCM9R1AcfJfzcCZ/lUWEypTDv1BnBPCWwhWZ/lqfoPgxVU2DPHkLPwbB515
	47FNOwpfYSoUzHLT+1azyy
X-Google-Smtp-Source: AGHT+IH7PMcccun3vaGdeD/RJhARuzeNyiL2lgqrv4BXVHpklhW5GTvP9s8/rnb6DrIRpDhNiwqhHw==
X-Received: by 2002:a05:6a20:4311:b0:22b:3da9:fb33 with SMTP id adf61e73a8af0-2381244decdmr15629829637.12.1752850946374;
        Fri, 18 Jul 2025 08:02:26 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe653a7sm1384051a12.2.2025.07.18.08.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:02:25 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Fri, 18 Jul 2025 23:02:14 +0800
Subject: [PATCH v10] staging: media: atomisp: fix indentation in aa, anr,
 and bh modules
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-new_atomisp-v10-1-54bdff660058@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPVhemgC/23M3QqDIBjG8VsJj+cw+1B3tPsYY1i+1gsrQ8NtR
 Pc+66jBDp8Hfv+FBPAIgVyyhXiIGNCNaeTslJG212MHFE06CGe8YoKVdITXQ89uwDBREIUtRW4
 LJiRJYvJg8b3nbve0ewyz85+9HuX2/u9ESRnlWlY1axujGrh2g8bnuXUD2TpRHWye/1qVrFbG1
 LzkFdj6aNd1/QIKp71/4wAAAA==
X-Change-ID: 20250704-new_atomisp-e73f471f3078
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752850943; l=12648;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=+e1iMGRpKp9G4bBHxeR7ZAWHo4gzQHuUdz02p5ovehI=;
 b=RRMB2Qo5128Ga5uyePBpVrOIOM/21Cn+QmVtt64YoavRO4Q+CuU4Fbt3j7+HJ7B3Q2/fW7gyv
 4nSTC2Qp9g7D/YcJqp8dNaQrTonsNwN6+fSR1QkkIPUa/lEVQfaY3KB
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Fix tab/space indentation and move a standalone kernel-doc
comment of the 'strength' field of the struct ia_css_aa_config
to the whole-structure one.
Align with kernel coding style guidelines.

No functional logic changes were made.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
This patch focuses on cleaning up indentation (spaces, tabs) in the
AtomISP driver under drivers/staging/media/atomisp/pci/isp/kernels/.

There is no functional logic change.
---
Changes in v10:
- Squashed previous aa/anr/bh patches into a single patch
- Rewrote commit message to reflect actual changes
- Removed unnecessary Suggested-by and Link tags as advised
- Added trailing comma to array initialization as suggested
- Link to v9: https://lore.kernel.org/r/20250711-new_atomisp-v9-0-a9dd62425ef6@gmail.com

Changes in v9:
- Reformatted struct comments to follow kernel-doc format
- Reverted macro definition changes that removed alignment
- Reverted multi-line array initializations to use brace-on-own-line style
- Added trailing comma in small array initializations
- Adjusted function declarations to follow kernel-style indentation
- Removed unnecessary churn in cases where code was already style-compliant
- Link to v8: https://lore.kernel.org/r/20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com

Changes in v8:
- Reorganized cleanup by subdirectory (one commit per directory)
- Focused only on indentation fixes (spaces, tabs)
- Removed all clang-format involvement
- No functional changes
- Link to v7: https://lore.kernel.org/all/20250629113050.58138-1-zaq14760@gmail.com/

Changes in v7:
- Split previous monolithic patch into multiple smaller patches
- Applied clang-format to entire driver excluding i2c directory
- Fixed checkpatch.pl-reported ERRORs (parentheses in macros, unnecessary return parentheses, zero-initialized globals, spaces after unary minus)
- Left WARNINGS untouched for future cleanup
- No functional logic changes
- Link to v6: https://lore.kernel.org/r/20250627-bar-v6-1-b22b5ea3ced0@gmail.com

Changes in v6:
- Applied clang-format across the entire AtomISP driver
- Fixed all checkpatch.pl-reported ERRORs
- Added explanation of tooling and scope
- No functional logic modified
- Moved 'Suggested-by' and 'Link' tags above Signed-off-by
- Link to v5: https://lore.kernel.org/r/20250625-bar-v5-1-db960608b607@gmail.com

Changes in v5:
- Replaced space-based indentation with tabs in output_1.0 directory
- Used checkpatch.pl and grep to identify formatting issues
- No functional changes made
- This patch is now focused solely on tab/space issues
- Link to v4: https://lore.kernel.org/r/20250624-bar-v4-1-9f9f9ae9f868@gmail.com

Changes in v4:
- Moved assignment operator '=' to the same line for static struct definitions
- Remove unnecessary line breaks in function definitions
- Update commit message to reflect all the coding style fixes
- Link to v3: https://lore.kernel.org/r/20250622-bar-v3-1-4cc91ef01c3a@gmail.com

Changes in v3:
- Removed extra spaces between type and asterisk (e.g., `*to`) in function
  declarations, as pointed out by Andy Shevchenko
- Update commit message to reflect all the coding style fixes
- Link to v2: https://lore.kernel.org/r/20250621-bar-v2-1-4e6cfc779614@gmail.com

Changes in v2:
- Fix patch subject prefix to "staging: media: atomisp:" to comply with media CI style.
- No other functional changes.
- Link to v1: https://lore.kernel.org/r/20250621-bar-v1-1-5a3e7004462c@gmail.com

Thanks for your previous feedback.

Best regards,  
LiangCheng Wang <zaq14760@gmail.com>

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h     |  8 +++++---
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c  | 24 ++++++++--------------
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h  | 20 +++++++-----------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c   | 14 +++++--------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h   | 13 +++++-------
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.c       | 14 +++++--------
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.h       | 14 +++++--------
 7 files changed, 41 insertions(+), 66 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
index 2f568a7062da726397f55b1e73dadd27fcd1f2f8..f825f537a5366f6b97170dd44827436fd800d105 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h
@@ -28,11 +28,13 @@
  *     ISP block: BAA2
  *     ISP1: BAA2 is used.
  *     ISP2: BAA2 is used.
+ *
+ * @strength: Strength of the filter, in u0.13 fixed-point format.
+ *            Valid range: [0, 8191]. A value of 0 means the filter is
+ *            ineffective (default).
  */
 struct ia_css_aa_config {
-	u16 strength;	/** Strength of the filter.
-					u0.13, [0,8191],
-					default/ineffective 0 */
+	u16 strength;
 };
 
 #endif /* __IA_CSS_AA2_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 899d566234b9d3a35401666dcf0c7b1b80fd5b31..488807a161b9a6ba9ebc4a557221cd21bd1df108 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -16,25 +16,21 @@ const struct ia_css_anr_config default_anr_config = {
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
-		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4
+		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
 	},
-	{10, 20, 30}
+	{ 10, 20, 30 },
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

---
base-commit: 8c2e52ebbe885c7eeaabd3b7ddcdc1246fc400d2
change-id: 20250704-new_atomisp-e73f471f3078

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

