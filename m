Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216456D1A7
	for <llvm@lists.linux.dev>; Thu, 14 Dec 2023 21:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tanzirh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yEkVN0+1"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dbcc50db48cso3543398276.0
        for <llvm@lists.linux.dev>; Thu, 14 Dec 2023 13:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702588044; x=1703192844; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GxLPM1oqmNGerHkMNP4+xZeFGhPzqpzdxyTLE69WerU=;
        b=yEkVN0+1jjRkEsG1vLGSvLv4fMhOMkk06RIRaYq8yqOjjdFv/hIvpfUKvJqwHvlUL8
         wFbqjhsW/WaXMpcETd6z+7K0oEEcLqH0EkaU3URfZNr4AK0o9VRT0+ku8FIZRAPHfnXn
         edz0yzXgep0ucO9As0YF3wwJYiw6EoPME+qzpP5NbOe+1lzQ/ZjLjFQg7Uu3U+4VIrYa
         q8pgAdJ+uzYOYDNNUoUWKAY9i0xwvCwxG5fnHBnEx4Pu07Ea1SMQhzArKdyGcOdqzthL
         TPX+o1tjNu++BFsZ7e/cgpm/Ld3n39V447OhYnInt7mw8PC4G+M18nq90Hmfv+1ud3z2
         LgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702588044; x=1703192844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxLPM1oqmNGerHkMNP4+xZeFGhPzqpzdxyTLE69WerU=;
        b=Cqy0rLKhPcGHFxH85KPDP+TzssZ00Rm7lPZyOse9GZSIuNJDa6vGTit5+Oepgad334
         YQWKqgkiS9r1SUH9exf0LVmUR8uI/wQiT178giNvOel59hXrbl6Lx2BxtHfcqsWIiSrM
         FvDMiUjJ/Sy437q2gHbDjKfokya3wdU2YE6zTmF0Bwc0xr/ZBU/jzPLTRAoNEYTIbNqp
         bngl/gITj5agrwzDMVCmIi174oYBC1erftlvF+fWhsymj69HtiUSCu+txrFC0MnRg3qC
         O9+kvg18JegblKz7YqipnD6b6Aog7ND1uEQ8kx1C6MIxSQyt/15gtqV+hW6GdhOLcvMP
         X3WQ==
X-Gm-Message-State: AOJu0YyibOKIqFBY87ikxPwgwWwWDg9SDuglCDjn+cItiVZYlUjfktfU
	2OPfV8rzkK0LTHfUT4P0snOxiBx7UPK4
X-Google-Smtp-Source: AGHT+IFWZSkq0B2/TbJ3gU0ovel02eHeHOYebHA23VSPZ2uOaylOSpizkT8NynTvz1Zj6UyJGHB/+sVru/Fc
X-Received: from tanz.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:c4a])
 (user=tanzirh job=sendgmr) by 2002:a05:6902:1345:b0:db7:e75c:24c1 with SMTP
 id g5-20020a056902134500b00db7e75c24c1mr14651ybu.9.1702588043996; Thu, 14 Dec
 2023 13:07:23 -0800 (PST)
Date: Thu, 14 Dec 2023 21:06:12 +0000
In-Reply-To: <20231214-libstringheader-v2-0-0f195dcff204@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231214-libstringheader-v2-0-0f195dcff204@google.com>
X-Developer-Key: i=tanzirh@google.com; a=ed25519; pk=UeRjcUcv5W9AeLGEbAe2+0LptQpcY+o1Zg0LHHo7VN4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702588040; l=815;
 i=tanzirh@google.com; s=20231204; h=from:subject:message-id;
 bh=7hhCHMZ64vzG26ydgTYNXlYZ8X3Olq+V06BfdYggSYo=; b=2xXCyTjP9XZppKjpc3ICzOEWNBCWkOuL3pfPLeXwpxUsepeC/rvl31dRR4SAvkKaJIwOJisuM
 2Trf8HpEghbDFhMnztWWFe/NalZlfE8igHkdkOqJ0RQ2b/MWRjjy72t
X-Mailer: b4 0.12.3
Message-ID: <20231214-libstringheader-v2-1-0f195dcff204@google.com>
Subject: [PATCH v2 1/2] sh: Added kernel.h to word-at-a-time
From: tanzirh@google.com
To: Kees Cook <keescook@chromium.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick DeSaulniers <nnn@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"

This patch includes linux/kernel.h in asm/word-at-a-time.h for the
sh architecture. WORD_AT_A_TIME_CONSTANTS depends on kernel.h.
Making this implicit dependancy explicit allows for later improvements
in the lib/string.c inclusion list.

Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
---
 arch/sh/include/asm/word-at-a-time.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/sh/include/asm/word-at-a-time.h b/arch/sh/include/asm/word-at-a-time.h
index 4aa398455b94..f680f5f1d626 100644
--- a/arch/sh/include/asm/word-at-a-time.h
+++ b/arch/sh/include/asm/word-at-a-time.h
@@ -5,6 +5,7 @@
 #ifdef CONFIG_CPU_BIG_ENDIAN
 # include <asm-generic/word-at-a-time.h>
 #else
+#include <linux/kernel.h>
 /*
  * Little-endian version cribbed from x86.
  */

-- 
2.43.0.472.g3155946c3a-goog

