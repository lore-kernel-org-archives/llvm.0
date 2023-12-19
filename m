Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967B14B133
	for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 18:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tanzirh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2gQ/cH87"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dbd73a15605so583900276.3
        for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 10:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703009408; x=1703614208; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6YimShC/XWREZWbimdIHfWtB7p6pALlpTQBZ3gNvoJM=;
        b=2gQ/cH87z/4ZMBzADMwRlnGcmSmmQXliUr6zTpxvgLEkC+IYqpBQHtB7A+9WiHlmpM
         tFPzHd0ERFuK1tRQisAZLhZ5SgrAIUQDpac9o4OwbHwDtW3JWKhM1zf+uChELzoWzzRF
         GozlP3hVeQYjPVjf84OG+TsC7ftLWT6gPFuNouaia2HMonlgxAOumix+QOlyexGrSEeM
         NyPohxJEdr/juMmVeLfTCPBI/k3/hOrmc+9tKCFMB9t5MxX3Lpiy4z58NyCHtEhG2vTT
         /waG1aDNHpHSkPdRJf9+ILwCHCQ3fRitajFRB4BP3q+S788XnXdt7QlV5kkmwPdOohXi
         pkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703009408; x=1703614208;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6YimShC/XWREZWbimdIHfWtB7p6pALlpTQBZ3gNvoJM=;
        b=rHEGz/y7q8ftfvITNaOpG/HeFUMehC2305so+RGEssyDyg+XDdqIKcYHXbRmnEZaTE
         CqfzL9PJ8Ct+/QfmdTrPU4Kr93PI1tMyh3ygIsdU9v5x/J4bk+KsbcTtsvCKXj59vfGr
         F1CBW4LjaEJBUv439rRdplWiTQzEMjgdcUmi1Fu14Hnn/5En1YpZ78YzCUZNxJ7uRYzy
         vZSFz9VYlCzd7unHtQEWUHyf815FJIxDb0Um5SETAPFLLNzAQQTYnZnjDym5LKz+MLlG
         i3h8VZzPXcdxmjFRvjARETnBuCVGRNsVCVIy+b/Z+3kNGxYbGVd+Wn3hEIgb7IJHgC2z
         K2mg==
X-Gm-Message-State: AOJu0YzyiynHRnMjJ2sG3zAp+HSHDzapeops01IJjEamikU9lOlVSM7I
	Ee/4AnCjqS9UKH0nktYzrCu0MJlbVZb/
X-Google-Smtp-Source: AGHT+IE0LVzd1vIXn2iPSd7+2GWc6vaG1+AA4mD7m5oG/N4X0o6afACq67YqgCScWtq13tbE4o/PXfHybrHM
X-Received: from tanz.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:c4a])
 (user=tanzirh job=sendgmr) by 2002:a25:8a09:0:b0:db5:3676:74dd with SMTP id
 g9-20020a258a09000000b00db5367674ddmr2252608ybl.3.1703009408385; Tue, 19 Dec
 2023 10:10:08 -0800 (PST)
Date: Tue, 19 Dec 2023 18:09:50 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG7cgWUC/42T3WrjMBBGX6X4ul5m9DvqVd9j2QtJnnEEaVzsE
 nYpefeVw7KksYtyOYLznY9h9NktPBdeupenz27mc1nKdKqDeX7q8iGeRu7LUOdOgdKowPTHkpa
 PuZzGA8eB556VJlZRLHPuKvU+s5Tf18Sfv+p8KMvHNP+5Cs64vn6fdcYe++wGbVxUKfjwOk7Te
 OQfeXpbs/+Bdh/0ErL1GqyO/nV8i+V45dYSZ9UQq1WcRPusDII1N/x/L+5y0Osknr1ODt1+4e9
 AEAx2yCK10i14bawbjXVtbCx5oEEoJLvbmPY46C1AGiwJiLcbsWmIzSqWhCZj8Eb4UbGpYueFv
 AFM4PVGbBtiW8UiSMGEumvjHhXbddVRCKxiIQobsbsV7xyXW8XKsRIEoRweFbsqFi/1JpGii2k
 j9g2xr2J2oFA7JM7D/VVTg6fKq5hDyBQwZb7nQ4MPlQct9YCFtQn5nkdoBCDUhOBiUA4csaNNA rYS1p/tyCa2vh7t8GUHl8vlL641c+bBBAAA
X-Developer-Key: i=tanzirh@google.com; a=ed25519; pk=UeRjcUcv5W9AeLGEbAe2+0LptQpcY+o1Zg0LHHo7VN4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703009406; l=2043;
 i=tanzirh@google.com; s=20231204; h=from:subject:message-id;
 bh=8piwcHlVOU33cOMSn+USqF0MHaHhYcY6fc7RoBv6vb8=; b=DWx0jSzRsHu9oVM1my/TMXQUlg/ncE79Qk8lLVoLyXs9r1PQc7h6ga1/+5cC8yDeQ+ziG9PNP
 sgO6ATbiY2hBpIJ/6/i+u4CA9YRsKBR8o91tjOu4mN5XgaebduJRFhR
X-Mailer: b4 0.12.4
Message-ID: <20231219-libstringheader-v4-0-aaeb26495d2f@google.com>
Subject: [PATCH v4 0/2] shrink lib/string.i via IWYU
From: Tanzir Hasan <tanzirh@google.com>
To: Kees Cook <keescook@chromium.org>, Nick DeSaulniers <nnn@google.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	llvm@lists.linux.dev, Al Viro <viro@zeniv.linux.org.uk>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Tanzir Hasan <tanzirh@google.com>
Content-Type: text/plain; charset="utf-8"

This patch series changes the include list of string.c to minimize
the preprocessing size. The patch series intends to remove REPEAT_BYE
from kernel.h and move it into its own header file because
word-at-a-time.h has an implicit dependancy on it but it is declared
in kernel.h which is bloated.

---

---
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

 arch/arm/include/asm/word-at-a-time.h     |  2 +-
 arch/arm64/include/asm/word-at-a-time.h   |  2 +-
 arch/powerpc/include/asm/word-at-a-time.h |  2 +-
 arch/riscv/include/asm/word-at-a-time.h   |  2 +-
 arch/s390/include/asm/word-at-a-time.h    |  2 +-
 arch/sh/include/asm/word-at-a-time.h      |  1 +
 arch/x86/include/asm/word-at-a-time.h     |  1 +
 fs/namei.c                                |  2 +-
 include/asm-generic/word-at-a-time.h      |  2 +-
 include/linux/kernel.h                    |  7 -------
 include/linux/wordpart.h                  | 17 +++++++++++++++++
 lib/string.c                              | 17 +++++++++--------
 12 files changed, 35 insertions(+), 22 deletions(-)
---
base-commit: ceb6a6f023fd3e8b07761ed900352ef574010bcb
change-id: 20231204-libstringheader-e238e2af5eec

Best regards,
-- 
Tanzir Hasan <tanzirh@google.com>

