Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5DF6DD09
	for <llvm@lists.linux.dev>; Thu, 14 Dec 2023 21:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tanzirh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C0poAXOT"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dbcc5e43ba4so929409276.0
        for <llvm@lists.linux.dev>; Thu, 14 Dec 2023 13:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702588042; x=1703192842; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=89BRmpC4+tGVLj0OdN3wgdyTYPw2O8NyPVJ2rVYBYWo=;
        b=C0poAXOTlnXk4UkULZZ1lO9+0Mt1uLJKEF+JdqM7vvw1hu3qSxAbrlSVFa7riFDPbK
         1ppqMKzQ89E95aqDtU60WwxCbuATk95A/J7bexz1Uc8l5ymNcZIsbRXvNjVWRi4tXHOW
         avM5Wa8PKXtIyiMl6udpd0+6GQzOiuAa+NTCrkWf53l/kUlQqsULLCduq9NQcs2lo/GB
         p7bFJ889GN0DkYz1zZqSts05tVpTwfjxOk3k1b1okep6+K90cShuND/94DhAtJIo3eNX
         /9j1Mk1Cqqqyjwm2lqUeWDwBwc+f+wszuZXWsETeat661brqCVMTAeBI+fOb1H0gRKnV
         jSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702588042; x=1703192842;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=89BRmpC4+tGVLj0OdN3wgdyTYPw2O8NyPVJ2rVYBYWo=;
        b=DcooWhehlvUSVfCHkrJPhBJQHJYWgaYpZ3YGka4M15IbWkCqI2+7L7EqoRX7YKo0LN
         q0/VicDLaO2EZ8NUvAUBEtD0zReIrcwX4dEYe1MLiu00xJi4ikmA2irD/IJjuY+7w/Ar
         v5cjSQyTBYHuMrUoFOBiaPGCpK0hywllbNcVYnNCxv+cAFo3j964jHRXrlJP6Kzn4GVj
         G/JjAVwQ5fX3AemKq5Jj2zn1GCqx0yai/ZkD9slrwoXF+3owuHM7txeyFVrc4lADr6Hs
         qEZiXMceUJp5YbBgvqucYBIOA39SIYx8eNcsMjHwxhJ+mIDuCmM9PJLpELx2xa2C51El
         kNZQ==
X-Gm-Message-State: AOJu0Yw50VFrpaSz9Ai46dwR4JjMAzZBFoQFdeFaEgFRy6goZj6tGsko
	D04WWeTiXHP0969Bg0JQPLVjEEMxq7Gn
X-Google-Smtp-Source: AGHT+IEak763aS1pPeNAnQmbROsMYYd/NkIf8EJCbCwXKVTEc2nsI06I4KxK9BsEah7aSYwzYu2IrKAJ3sKL
X-Received: from tanz.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:c4a])
 (user=tanzirh job=sendgmr) by 2002:a05:6902:81:b0:dbc:5587:a079 with SMTP id
 h1-20020a056902008100b00dbc5587a079mr192237ybs.4.1702588042049; Thu, 14 Dec
 2023 13:07:22 -0800 (PST)
Date: Thu, 14 Dec 2023 21:06:11 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAENue2UC/4XSTWrDMBAF4KsEr+ui0c9I01XuUbqQ5JEjSOJiB
 9MScvfKoZTESdFyDN97I8nnZuIx89S8bc7NyHOe8nAsg3zZNHHnjz23uStzI4VUIIVu9zlMpzE
 f+x37jseWpXIsfTLMsSnqc+SUv66J7x9l3uXpNIzf14IZlq//Z83QQhuxUxq9DGRp2w9Dv+fXO
 ByW7F9onkObKBqrhFHebvuDz/urW5aYZaVYLsUhKRulBmH0jf/rhadOtCoky1YFBLxb+FqsKsW
 qFGvjrHBdchTMenFd8XrxKYCOQFYnXntT8ab4lMCRpnIAjWuPt/7JxePiJbJMIJKLtPa24m3xj
 EKCQnAcu7V3Fe+Klz4SRUcQ4sP5qeKpeKFSedzESlNcexCVABAlgdCTRIGO0T0kQC1h+XnRmcD GitB1d3dwuVx+AMor9c6kAwAA
X-Developer-Key: i=tanzirh@google.com; a=ed25519; pk=UeRjcUcv5W9AeLGEbAe2+0LptQpcY+o1Zg0LHHo7VN4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702588040; l=922;
 i=tanzirh@google.com; s=20231204; h=from:subject:message-id;
 bh=nZp1XvZPyepFJiRIjWff+689JRuWK2jeokDFwb+Pi2g=; b=yfdKwq1qTjzEfhbEEXr5IeMJ/rmRQ4DlYIo+Nul0PS3tzNUos1O7TrQ3BjAxNCL7XeJ3I7Xmt
 GTka5JhU0eSCsswrfahAS7Z3dPLTiceY8Q/arMYPCqqlHpuyexd/7Fr
X-Mailer: b4 0.12.3
Message-ID: <20231214-libstringheader-v2-0-0f195dcff204@google.com>
Subject: [PATCH v2 0/2] shrink lib/string.i via IWYU
From: tanzirh@google.com
To: Kees Cook <keescook@chromium.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick DeSaulniers <nnn@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	Al Viro <viro@zeniv.linux.org.uk>, Tanzir Hasan <tanzirh@google.com>
Content-Type: text/plain; charset="utf-8"

This patch series changes the include list of string.c to minimize
the preprocessing size. The patch series intends to remove kernel.h
which causes problems in the sh architecture because kernel.h is 
not properly declared in asm/word-at-a-time.h

---

---
Changes in v2:
- Transformed into a patch series
- Changed asm inclusions to linux inclusions
- added a patch to sh
- Link to v1: https://lore.kernel.org/r/20231205-libstringheader-v1-1-7f9c573053a7@gmail.com

---
Tanzir Hasan (2):
      sh: Added kernel.h to word-at-a-time
      lib/string: shrink lib/string.i via IWYU

 arch/sh/include/asm/word-at-a-time.h |  1 +
 lib/string.c                         | 14 +++++++-------
 2 files changed, 8 insertions(+), 7 deletions(-)
---
base-commit: 33cc938e65a98f1d29d0a18403dbbee050dcad9a
change-id: 20231204-libstringheader-e238e2af5eec

Best regards,
-- 
Tanzir Hasan <tanzirh@google.com>

