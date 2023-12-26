Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8166E4F61E
	for <llvm@lists.linux.dev>; Tue, 26 Dec 2023 18:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tanzirh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H02ShcXl"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1d3eff55aa5so50406795ad.2
        for <llvm@lists.linux.dev>; Tue, 26 Dec 2023 10:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703613649; x=1704218449; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uL68m7/nloxAmVxHBhyXARaUNsJ4FqLRMv7smk0VXkU=;
        b=H02ShcXldwEzraqqpF76B53xMeTGqkXOuaGkJztp6kg+xFbXeEyJ6bpL2cnvaaK5L6
         NfNLhZ7gaHNBAhxUzJLu2IoRxiY4k13bzqGic5RKhWU3+dfJjB7RyP/DYS2xBKwwmlZu
         747fa0PknwpQpiKbRIcvQdtOaxN+n2IjDCZk5tsNXu65dF2i3S3zWK8oTsyOuxhJI+3l
         1NLGaDHirVzAKuGm7hj1kMw9HJ/CVTS53uKvs0FyckKKq60m0hdMAQ1V3MdoCvTCA7/H
         /uxClIfK+0DuHSd/c9qLcZcUgqP1/TNMce/36biP73i5ic8vwwxASaOvvTQyadyYTJFj
         FmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703613649; x=1704218449;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uL68m7/nloxAmVxHBhyXARaUNsJ4FqLRMv7smk0VXkU=;
        b=YLIpEDUA3l5PAbk61nHrSUky/LzZmWN0y4J5LKpWX6Pq4NwGNazy77f1cevEswhWzn
         VxHet0G1ERm5B2pLAi8viSmQojTVdiOiBqVwRnrCSB+D4I80ZA3Ro0Joww2YASXB19bF
         JDBTSaeChKQxHllTdr3275LJqDPUXxA5MRFHO6/Ph9F7Vk8KbzHC9CeMivd0P9qDY50K
         nvrLBPxBCGoUoN4b/qoZWYKHkhUCbPqpv6XHdiSlqYYnf/HbF1HpocWT9KSdzJ00mclG
         IbY1DagVAt9yb/dtt8SWqJXheUxRnANJcZkdpDCuKtXAgF4Gotknn6Vt5PpByyQ/HK7p
         bTSg==
X-Gm-Message-State: AOJu0YysaonZd1Fm1REG3iujoZMhrj6efuG0H/VAUr1vxgc+aDtnzq6i
	59oFB9maq/l91M+veuybGQudAXLzHoNAW/gbmKY=
X-Google-Smtp-Source: AGHT+IHvB4n72zhphWG0KAwIt3BqQtmNnGxtZajtuTZQqOlIgqHluySRRvP5+OuOqf07zfouccipiRqRDjXP
X-Received: from tanz.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:c4a])
 (user=tanzirh job=sendgmr) by 2002:a17:903:1c2:b0:1d4:3bcd:4317 with SMTP id
 e2-20020a17090301c200b001d43bcd4317mr228480plh.7.1703613648926; Tue, 26 Dec
 2023 10:00:48 -0800 (PST)
Date: Tue, 26 Dec 2023 17:59:59 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ8Ui2UC/42Uy4rbQBBFf2XQOgpV/ajuymr+I2TRjypb4LGCN
 JiEwf+elgnBsTTIyxKcew/dXfroZpkGmbtvLx/dJJdhHsZzG+jLS1eO6XyQfqht7gwYiwZcfxr
 y/D4N58NRUpWpF2OjmKRepHSN+jmJDr9uid9/tPk4zO/j9PtWcMHl6+dZF+yxL1Sto2QyB349j
 OPhJF/L+LZk/wX9NhiUiw8WvE3h9fCWhtONWyQuZqfYLMVZbSjGIXh3x//rxU0Oeps1SLCZkLa
 FPwNBkX0tqk3pHrwZ2x1j24ydjwFi1cjZbxrHLQ56D5Crjwoa/KrY7RS7pVgzuoIcnMqzxa4VU
 9AYHGCGYLePirfBlCQbcu24jK6M/Y6xb8aqGNlxuyRHzxr75Y6SRvBGNEZ+2ngBDVB1SasFTit
 jujfeeM60GBsSowgaCz9rTK1Yg7YtwJgo5VVx2CkOrVgIDFrCKKU+7lHc4WPjTSrMJTLmIo887 /DceLDaVkbFOi6PPMJOAEJLYEpsCCgKxVUC7iUs/xKKPosPbU3qf2dwvV7/AAPVY7szBQAA
X-Developer-Key: i=tanzirh@google.com; a=ed25519; pk=UeRjcUcv5W9AeLGEbAe2+0LptQpcY+o1Zg0LHHo7VN4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703613647; l=2420;
 i=tanzirh@google.com; s=20231204; h=from:subject:message-id;
 bh=vEaBhflrd5vMapldmscLIaaJ/z8U/1AZB7sFpnB7nVk=; b=eCLsBksk7Ew4KMhKgVxOJ0lTDMKkj1WQmj/2pbxoPN3s8KVL4V+lNNy2NA433QAJhnskjoZ0u
 eB9DdT/PIVNC0Ci9WXitVLr3qccFXLHfRaaVpgh8L22m9iS0ZeiY82L
X-Mailer: b4 0.12.4
Message-ID: <20231226-libstringheader-v6-0-80aa08c7652c@google.com>
Subject: [PATCH v6 0/2] shrink lib/string.i via IWYU
From: Tanzir Hasan <tanzirh@google.com>
To: Kees Cook <keescook@chromium.org>, Nick Desaulniers <nnn@google.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Greg KH <gregkh@linuxfoundation.org>, llvm@lists.linux.dev, 
	Al Viro <viro@zeniv.linux.org.uk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Tanzir Hasan <tanzirh@google.com>
Content-Type: text/plain; charset="utf-8"

This patch series changes the include list of string.c to minimize
the preprocessing size. The patch series intends to remove REPEAT_BYE
from kernel.h and move it into its own header file because
word-at-a-time.h has an implicit dependancy on it but it is declared
in kernel.h which is bloated.

---

---
Changes in v6:
- added linux/bitops.h to wordpart.h
- removed kernel.h from x86
- Link to v5: https://lore.kernel.org/r/20231219-libstringheader-v5-0-206d4afd309a@google.com

Changes in v5:
- Removed bad copyright.
- Link to v4: https://lore.kernel.org/r/20231219-libstringheader-v4-0-aaeb26495d2f@google.com

Changes in v4:
- Fixed personal email client so name appears instead of just email
- Removed kernel.h where not needed.
- Sorted include list in lib/string.c and used linux/limits.h
- Link to v3: https://lore.kernel.org/r/20231218-libstringheader-v3-0-500bd58f0f75@google.com

Changes in v3:
- Moved REPEAT_BYTE out of kernel.h and into wordpart.h.
- Included wordpart.h where REPEAT_BYTE was necessary.
- Link to v2: https://lore.kernel.org/r/20231214-libstringheader-v2-0-0f195dcff204@google.com

Changes in v2:
- Transformed into a patch series
- Changed asm inclusions to linux inclusions
- added a patch to sh
- Link to v1: https://lore.kernel.org/r/20231205-libstringheader-v1-1-7f9c573053a7@gmail.com

---
Tanzir Hasan (2):
      kernel.h: removed REPEAT_BYTE from kernel.h
      lib/string: shrink lib/string.i via IWYU

 arch/arm/include/asm/word-at-a-time.h     |  3 ++-
 arch/arm64/include/asm/word-at-a-time.h   |  3 ++-
 arch/powerpc/include/asm/word-at-a-time.h |  4 ++--
 arch/riscv/include/asm/word-at-a-time.h   |  3 ++-
 arch/s390/include/asm/word-at-a-time.h    |  3 ++-
 arch/sh/include/asm/word-at-a-time.h      |  2 ++
 arch/x86/include/asm/word-at-a-time.h     |  3 ++-
 arch/x86/kvm/mmu/mmu.c                    |  1 +
 fs/namei.c                                |  2 +-
 include/asm-generic/word-at-a-time.h      |  3 ++-
 include/linux/kernel.h                    |  7 -------
 include/linux/wordpart.h                  | 14 ++++++++++++++
 lib/string.c                              | 17 +++++++++--------
 13 files changed, 41 insertions(+), 24 deletions(-)
---
base-commit: ceb6a6f023fd3e8b07761ed900352ef574010bcb
change-id: 20231204-libstringheader-e238e2af5eec

Best regards,
-- 
Tanzir Hasan <tanzirh@google.com>

