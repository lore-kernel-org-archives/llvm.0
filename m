Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FB96669B
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 21:12:01 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59f8134eb83so186994817b3.2
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 14:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696021920; x=1696626720; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FR1ZKwT/o63KmLhMDo8tUZzc0vKzUsUCbtQdapDGJGA=;
        b=GmUBtooL1aJ2UskWHLlQecDNILaChISjbDIAE/gqEt8DGE3XAsjVbY3021dWluzLDe
         h4jnA4MTLKCjobIN1hI30Chfa1RqGatLoltAjxA69XC9jsc73sDyTsxyE3Y7h5D+ADhM
         +2NMjYAEdCPFgwhctHSCTklciTVdC+BkauxPkm0/h3vB1r0GiafreEGDx+wAxYX5inFp
         ECl5kU4dlW3w0qpZkm9SrrR682RP86BqIMaI9amFblOyZEoXQ8lTORakdOGMGg9OF1ES
         VQPYYm6RM4abFRUIKCIMyg6oh2mGPlUJNEx96xPYRQ5XdyURThvPKZxbbXbsMYt/delT
         B6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696021920; x=1696626720;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FR1ZKwT/o63KmLhMDo8tUZzc0vKzUsUCbtQdapDGJGA=;
        b=h8K6OA0I+P0cDIlxQNzrnB5MgmRnGpyX9ZYamB1WxR8uCzPr1rEMRa1mR/HEcTUULb
         qiOLEiskx1TCsZQSE1q+NBwnqlkQ2sXgHe0L7WP4AN1AmLBU8Lf67rcl+8ZWPcimhxsY
         3etcuMnveRVw+hg355BV+8wOyXR1s9iAkfepR9eFbdnssPiuhcle2IOsLI/t3PqkYvn+
         /qQdwXaKNqc4HA74tbGZqdjoL75lCKEViMzorLtXVZcwCd9/v9bVcpVB0Bzao1R5A97p
         owvQ70LaCb5Euzg1PNaT5JDRIEpOSqfAdwCqP1A290iomxQFwHt+Zf5JzkvyDSPUHVje
         2OIA==
X-Gm-Message-State: AOJu0YypKay0cb4GFKLpJneT6EYYuNNtq/bp44rqS9/DZIeWcYDyHE0D
	SIrD59djSqG3J0JqGUOs+A0jtj+TjbJaZziqTXY=
X-Google-Smtp-Source: AGHT+IHnDIypgcCWBxPESiB/yrBCpKXqORME3PWFhWMxCeyFk9cmGmraRzLwQcSrcYatS2Uvi9kN6m0eWCmXEF8Vfz0=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:6812:0:b0:d13:856b:c10a with SMTP
 id d18-20020a256812000000b00d13856bc10amr77200ybc.3.1696021920090; Fri, 29
 Sep 2023 14:12:00 -0700 (PDT)
Date: Fri, 29 Sep 2023 21:11:57 +0000
In-Reply-To: <20230929211155.3910949-4-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230929211155.3910949-4-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359; i=samitolvanen@google.com;
 h=from:subject; bh=ARqQmg1Q7FqF1vgF9dpD7yhcKdtd1MfRgn2maiynoVQ=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBlFz2bINQRa9JuNqXpxYBQVzDJb/c0+7N1HB+sp
 2/Sm1UUS7iJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZRc9mwAKCRBMtfaEi7xW
 7vOOC/9tO/6MqlDPfjsiexFNXOEfW7Ar2H9OEVyVIE92EgZgm/mYuBlQqBRKkWvnSCUPZ+ktWxw
 /8gD9WFejtTnKMje8tf/4wwgxbVQuClXmgi7zZQJvbJ2+SG6cp6B7JcXsMhPsJsbuh3NhTEQj/o
 pgpvv9Uyv2mK/vRlud+N82dGqhUfLNAWNPfHmZmQ/tMcij5bpFL8VvhWPFF6Akufb6mjaM9D8vG
 +cR914ZzFo93wp2YlrOemHXK7uUcqH8HHjkYtoFn7o8xhU+VQ7oy1yajipTLM7ewaa0tOrdIWqa
 08cpT5V8GX3uAGGuFOzPlMxeF7o/GIDLXMxDfovUqIRoGLzciTjGMCqRmRapZU6oY3GqWEqPSnx
 GnCaN0xzRvU31sMOUQQkusxUC/3qLR05lv7v/sDAlG5Yah5czQB5w1+2ClKsbQ3sCX6HmpcfWsx r/VvM19V0Dekn+5QLhuwnCOlt6Hs+HBdn3kG1truvPJvtRa+QxsCoiBcfxXnVWnQrVOuI=
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20230929211155.3910949-5-samitolvanen@google.com>
Subject: [PATCH 1/2] mm: Change mmap_rnd_bits_max to __ro_after_init
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Allow mmap_rnd_bits_max to be updated on architectures that
determine virtual address space size at runtime instead of relying
on Kconfig options by changing it from const to __ro_after_init.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/linux/mm.h | 2 +-
 mm/mmap.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bf5d0b1b16f4..72a98b2afaf9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -86,7 +86,7 @@ extern int sysctl_legacy_va_layout;
 
 #ifdef CONFIG_HAVE_ARCH_MMAP_RND_BITS
 extern const int mmap_rnd_bits_min;
-extern const int mmap_rnd_bits_max;
+extern int mmap_rnd_bits_max __ro_after_init;
 extern int mmap_rnd_bits __read_mostly;
 #endif
 #ifdef CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS
diff --git a/mm/mmap.c b/mm/mmap.c
index b56a7f0c9f85..ed1b178b223a 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -64,7 +64,7 @@
 
 #ifdef CONFIG_HAVE_ARCH_MMAP_RND_BITS
 const int mmap_rnd_bits_min = CONFIG_ARCH_MMAP_RND_BITS_MIN;
-const int mmap_rnd_bits_max = CONFIG_ARCH_MMAP_RND_BITS_MAX;
+int mmap_rnd_bits_max __ro_after_init = CONFIG_ARCH_MMAP_RND_BITS_MAX;
 int mmap_rnd_bits __read_mostly = CONFIG_ARCH_MMAP_RND_BITS;
 #endif
 #ifdef CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS
-- 
2.42.0.582.g8ccd20d70d-goog

