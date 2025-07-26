Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170888634A;
	Sat, 26 Jul 2025 07:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753516400; cv=none; b=thavSHDe/KKnKXxJvegeglM8MJA8Jh9Xzia8n4k3TAfkt/QvGOUwUPYH2FWLkwqP8wFtYkEDG5cGyBVAimU1BUKHDMSSqNQqSRND+7+ag7kpDJJIXesQsz1kHAlZF5E1JQx9ijTcuKZdO4bdM+da2uMmu6wYTE7nManWEjyGIaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753516400; c=relaxed/simple;
	bh=AKm7g72T68hpx837rtZwuJrKsWSUOLPM6AEAgTw0Yf4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pGphHP2dr6Xc2oGlJag9gfpy+3nmT9Zed7QTEHPhampt1uN7FqOWNgevC+jAd5r8jbQgcqGTT2IyLVLUlP4IreZtRqW3aOvBaC3LZxm5O8Px+7i1Xkq4btyl9KpSTpt8q6wr7aQZO4l1DX6nXrj2/JamAdsYTMViZpgX31bsEgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCjkEacR; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCjkEacR"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-31c4a546cc2so2329880a91.2;
        Sat, 26 Jul 2025 00:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753516398; x=1754121198; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WpTO5O18cm3MyXauS1BUE3Ie2T6M8m/GCuAGYx5eE2Y=;
        b=CCjkEacReBPs8Sfz4NgdLemD7lI4/JlTCyoqQJFEksma99YkOJV8GisWRzIVApXsGp
         ZnlLuiBBaAp5OYckY9ikdwFtnFUAtiIOz5LOiYfHYxidO/9/pUX1q9y3e6l64yQQmaID
         /nuFOHf+u0dToZaqVCVm5smzvq17n1LXQ85a7YGgvxKIyiS4ooH4rnmec9gi+Pw+1ZCI
         DHqVuc/h1l8xPax6eE1tERylXTJHgxiJINJvcvbWBf9pHMCNBdjOYUcPPw/BnK9j705z
         38bvBuwxLN9czDjj/ZTWlovgoPD8IaFfuhpHCrTxv6rW+3dMn+S426e28zIblY9lv/ZO
         EBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753516398; x=1754121198;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WpTO5O18cm3MyXauS1BUE3Ie2T6M8m/GCuAGYx5eE2Y=;
        b=gJJpo2iqxIuTEsypviNWXACAQcah1s30mflkwgZ2YPoroMy6sbLPNN2DmnAr5f+NZK
         uNtIPPw1wdtmhUio/3Uir8cKm/6BNyvBEUUg5z6kpnSWnxE35d+vZoA0OzFYrP5DVfQo
         izBufuI5fedIH3LIFxPEdPQ2jEL9ZCGI9+gBbe3xCdUTb8//fUtA8JVVUqDVPRvfEJP9
         RdjQtdjcTRJOnP1yXYR8X8hROFUXE9n6uB2wpXdO8OVQgmX4DAWLcG4UgSjFtyKcuec9
         DNAbzcQmRlwF4Zoe5MCCEJxryliXB8SiIkv9vFD7H6cHeR6/hI21X5CKSnIJq39PQ2yn
         Kh2g==
X-Forwarded-Encrypted: i=1; AJvYcCUxAcrBagVcqhQwTX88iD5OHT7ckQG39yEKqz8qL0E1r8Mg4oETW4Ak6NVlvxHv5Jn9XI1a4g==@lists.linux.dev, AJvYcCXjV9FYpF9vfn1pdBr/tcoPXbd3xjDIOo4qj5YLUxnnwwbTT8kugf4y7+eo2R9NM0myrghq2OeQXO9Vvf0r@lists.linux.dev
X-Gm-Message-State: AOJu0YxdWD00UBamdSS3zX2QRSPkhhnqSi/I+gMct0fsZS6acQw/Fzud
	XsZ6VPIHwbydhB2S3pav2VWjD42era4KQ5/CRoUyGWlYmvONL9jD7KTe
X-Gm-Gg: ASbGncvSKJ7foFlOYV38iYuuIVwSkauP1KwMdndxd4dW8GyaZbcec2QMthvUBWVFrRC
	ZWZhZ5pazGF9Alia+2xHllc080vK3APLpHFMeFd9n9Y7O4wTdNE3nfddGsxk19fhuYnqfe1gFEj
	/OUQex8oVbcLMjsYk+LUp8VRQI8VLtQDq51CLYbfncUiqq4YHIZ5ZzQuI0B1oW4KrxB86DQUp7h
	70XISbRq85b1461cQjJl5xlUJG7izOuSQil6suzQo0UQozB1xpfAoKZfxlIsCPsf/Q4H3kGV6jR
	8miyGFUAgCQki1duKd1TYSMjG3SiyJPv5WTw4CYV0I/3J7OnoEVv67LnncybpA1ukizO8jRgxVc
	MYCX8iE+XEayPAB4GsLKDHwCd89WDyCxpGnzsOoh+RavQQEdBZGooNyJM1OjQguzEsUUte+XPej
	CRFZ9dXaXpxQ==
X-Google-Smtp-Source: AGHT+IE9n+ncfUim2vXNe+ctIGk2GCNmciJLM+xaXPDZMnMkVAfa8lxdl8WJWCdOd2pRWem1OHx3ow==
X-Received: by 2002:a17:90a:c886:b0:31e:4492:af48 with SMTP id 98e67ed59e1d1-31e77a227e6mr7276618a91.28.1753516398212;
        Sat, 26 Jul 2025 00:53:18 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e832fbf99sm1234979a91.1.2025.07.26.00.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 00:53:17 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH v11 0/4] staging: media: atomisp: indentation cleanup per
 directory
Date: Sat, 26 Jul 2025 15:53:10 +0800
Message-Id: <20250726-new_atomisp-v11-0-46eba1953fba@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGaJhGgC/23M0Q6CIBiG4VtxHEf7QUHsqPtoraH8KFuKE2c15
 72HHmnr8Pu2551JwMFhIJdkJgNOLjjfxcHYKSFVo7saqTPxIBy4gBwy2uHroUffutBTzFOb5cy
 mkCsSRT+gde8td7vH3bgw+uGz1Se1vv87k6JAuVZCQlWaosRr3Wr3PFe+JWtnKnaWsaMtotWFM
 ZJnXKCVv5bBHqsjZkAZFVlprJUSQKi9XpblC8nHJg0hAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753516395; l=5520;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=AKm7g72T68hpx837rtZwuJrKsWSUOLPM6AEAgTw0Yf4=;
 b=Ah7rRNjeKEpqu+6OGnHgaz78uifiDI2j+VuHLQ9wgGyii43ZpiRjgeRpTUrjQgBDlWWwkELbS
 KEEiPAz9iixA2nZbvbDSW98xeIK48hCQacFAmVTiNVk/WXZmBawWuzI
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

This patch focuses on cleaning up indentation (spaces, tabs) in the
AtomISP driver under drivers/staging/media/atomisp/pci/isp/kernels/.

There are no functional changes.

This version splits the original cleanup patch into four smaller patches,
following review feedback from Dan Carpenter to keep changes focused and easier to review.

---
Changes in v11:
- Split the original patch into four logically grouped patches:
  * Patch 1: Fix indentation and kernel-doc in the aa module
  * Patch 2: Fix indentation in the anr module
  * Patch 3: Replace array-style initializer with designated initializer in anr
  * Patch 4: Fix indentation in the bh module
- Moved inline kernel-doc comment to the correct structure location in ia_css_aa2_types.h
- Dropped trailing commas from array and struct initializers, following
  Dan Carpenter’s suggestion to keep the patch minimal and avoid unrelated
  style changes.
- Thanks to Andy Shevchenko for his earlier reviews and for advocating the
  use of trailing commas to reduce future diff churn. In this version,
  I chose to prioritize minimalism and alignment with the main review direction.
- Updated commit messages accordingly.
- Link to v10: https://lore.kernel.org/r/20250718-new_atomisp-v10-1-54bdff660058@gmail.com

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
LiangCheng Wang (4):
      staging: media: atomisp: improve kernel-doc for ia_css_aa_config
      staging: media: atomisp: fix indentation in anr files
      staging: media: atomisp: use designated initializer in anr config
      staging: media: atomisp: fix indentation in bh host files

 .../pci/isp/kernels/aa/aa_2/ia_css_aa2_types.h     |  8 ++++---
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c  | 26 +++++++++-------------
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h  | 20 ++++++-----------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c   | 14 +++++-------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h   | 13 +++++------
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.c       | 14 +++++-------
 .../pci/isp/kernels/bh/bh_2/ia_css_bh.host.h       | 14 +++++-------
 7 files changed, 42 insertions(+), 67 deletions(-)
---
base-commit: 8c2e52ebbe885c7eeaabd3b7ddcdc1246fc400d2
change-id: 20250704-new_atomisp-e73f471f3078

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

