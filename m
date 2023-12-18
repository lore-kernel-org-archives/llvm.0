Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803401EB44
	for <llvm@lists.linux.dev>; Mon, 18 Dec 2023 18:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tanzirh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="poG5nBCv"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5c641d55e27so2320927a12.1
        for <llvm@lists.linux.dev>; Mon, 18 Dec 2023 10:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702925091; x=1703529891; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Umcq9pE2qVMi4A7br5lqgMwWQo55dWONwlMYoYlXcJc=;
        b=poG5nBCve3gwXFCLlLgrDbQS8SJz97dsNVYIbKsvwV2v3yAXa78lk6ek9zek8Qzr2h
         bBVz02NtKdQUTjO4c6ippM7vL+Gr9FTKJgB8NG0ebWaraxhB96hbiLBOdqH0Jo2oxZ0r
         CZu2RebOHp7vVstX5H1SdI5Evys920DNHGj1ecIH1ranyoLLfKWo0i4jHxbHBSHj8A/a
         OxeurPMdwGmRPHkRwNEzgpHINSC+9GRTfwoRP5XQYLelY4DON5USS49Zn70aMiT0h0b0
         s82opnwEVceT2LtCDJodCiG7eL+sYW0j1xAR2hGZLcdjGjkDbS4+zPjOBeixYTiQuPzq
         61hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702925091; x=1703529891;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Umcq9pE2qVMi4A7br5lqgMwWQo55dWONwlMYoYlXcJc=;
        b=P0I+b00Oqh5KW6Nuc6yv6TY21UssfFaRDreYnHmd5ScmBq+FBVEVaCkvBWzRL0AVJz
         mectsFI0/jSJPpnf5pm4IB7ZeuRhY1gE46m5L8LfjVFFL1xhlHj2tDU3Z6TU2YgWRJij
         GZwsVUSrT6YyLVZ2QCQ+YG8EdjrdmbOk42j9LgnG/cyIkeUFSkZGHc+QHmAMV7M4bOA6
         wIKzituy4RjiZinUEa0z3wzyKIdbKggnUPP8hBcM3BL34joNiB0iHHJjKWsE1ZQ7OvyA
         wpwYL+h6HMZegPP4Ybu2QHbEVxc00QUXQBVSGcE8NvUHV0PRDuLp8Rf3YTJHLocZVvrf
         Aj4g==
X-Gm-Message-State: AOJu0YyWXpN14jlcPa76vDwo1mwWrW8a0xCDZv5pocR9NB+7NqDxZFQI
	xbj2i0hcdVLKyERJAgvbLp+VL35ntchj
X-Google-Smtp-Source: AGHT+IFE5E5xs9/zAhH8vcnygkkfl0PCpr5tsTnZBHzOIorNrVpXpn3X2Q2hh1/CdP4PLIOh1kQR2Ti1FTom
X-Received: from tanz.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:c4a])
 (user=tanzirh job=sendgmr) by 2002:a65:6a43:0:b0:5cd:9db5:bea with SMTP id
 o3-20020a656a43000000b005cd9db50beamr67169pgu.5.1702925090774; Mon, 18 Dec
 2023 10:44:50 -0800 (PST)
Date: Mon, 18 Dec 2023 18:44:46 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAB6TgGUC/4XSTWrDMBAF4KsEr+ui0f90lXuULix5xhEkcbGDa
 Qm5e2VTSuo4aDmG782T5Gs10pBorN5212qgKY2pP+dBveyqeGjOHdWpzXMlhVQgha6PKYyXIZ2
 7AzUtDTVJ5Uk2bIhildXnQJy+lsT3jzwf0njph+9lwQTz1+dZE9RQR9sqbRsZ0OG+6/vuSK+xP
 83Zv9BsQ8cYjVPCqMbtu1OTjoubS0yysFjOiwMrF6UGYfSd/9sLm07UKrAjp4IFu134GRQMaNr
 InCvdw6WxKjRWubE23gnfssdg1ifWBa9nzwF0BHSaae1NwZvsmcGjxnxybdfe3vuNF7Ozl5Ykg
 2Afce1dwbvsyQoJyoKn2K69L3ifvWwiYvQIIT6cHwsesxeK8+MyKY1x7UEUAkDkBLQNSiusJ+s fEqCUMP/11ptAxonQtv/u4Ha7/QDw4iUK3QMAAA==
X-Developer-Key: i=tanzirh@google.com; a=ed25519; pk=UeRjcUcv5W9AeLGEbAe2+0LptQpcY+o1Zg0LHHo7VN4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702925089; l=1752;
 i=tanzirh@google.com; s=20231204; h=from:subject:message-id;
 bh=RDM8JOpRAJHGe23evuBZKylujjf7/Qb+zvnBcMz4jJs=; b=EEkbJY4feebHBYM69j9pAsvv38o2vJRW6XvSDPqCCEOT19ZRXkDrfelwZHecR/aI/ZfyTTqmn
 VhWknFpcrqbD4c74Bz7DycdCrOCDvDb1BCDJTNZ87dmBQUQl5wTvmrz
X-Mailer: b4 0.12.3
Message-ID: <20231218-libstringheader-v3-0-500bd58f0f75@google.com>
Subject: [PATCH v3 0/2] shrink lib/string.i via IWYU
From: tanzirh@google.com
To: Kees Cook <keescook@chromium.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick DeSaulniers <nnn@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
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

 arch/arm/include/asm/word-at-a-time.h     |  1 +
 arch/arm64/include/asm/word-at-a-time.h   |  1 +
 arch/powerpc/include/asm/word-at-a-time.h |  1 +
 arch/riscv/include/asm/word-at-a-time.h   |  1 +
 arch/s390/include/asm/word-at-a-time.h    |  1 +
 arch/sh/include/asm/word-at-a-time.h      |  2 ++
 arch/x86/include/asm/word-at-a-time.h     |  1 +
 fs/namei.c                                |  2 +-
 include/asm-generic/word-at-a-time.h      |  1 +
 include/linux/kernel.h                    |  7 -------
 include/linux/wordpart.h                  | 17 +++++++++++++++++
 lib/string.c                              | 14 +++++++-------
 12 files changed, 34 insertions(+), 15 deletions(-)
---
base-commit: ceb6a6f023fd3e8b07761ed900352ef574010bcb
change-id: 20231204-libstringheader-e238e2af5eec

Best regards,
-- 
Tanzir Hasan <tanzirh@google.com>

