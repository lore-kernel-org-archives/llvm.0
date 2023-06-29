Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929F810784
	for <llvm@lists.linux.dev>; Thu, 29 Jun 2023 23:43:01 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-57704a25be9so18842267b3.1
        for <llvm@lists.linux.dev>; Thu, 29 Jun 2023 16:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688082180; x=1690674180;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hI1W3vZtR+9nkE20l1uechEUk7Tap/X/lCCO/vArtS0=;
        b=Q99ataBrVMMj1/30tDgNlRKyHCZSqEUzPhraQDs3af5FWGxtd2xiR791ZBqr2urUmj
         VziLScNBQ/wNWoPtUo1GAUxfiWBt9Z23+sb2cvAXrkc5X6S+q+YKXakjQkafV4+c0wMV
         mIem4WXC4+1cb9fZ9sMvLDHFBHfw3NE6HVnt4gkfrtdFFWcfUvvFGQSX5ZMSg58mbuEq
         uFN3qIf9GcgB+gPtV18WbJfCQ7HjodVRNQg0sLGufXuzlI7jOu5cBkVrjaC5a7vvLQmi
         PPaIQ1ztJBsIFlA4BHqNj+Clm1YzG7bFL2WSAqSMtwK6hgryaYoOO4zbuc+E7FsISDe8
         v99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688082180; x=1690674180;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hI1W3vZtR+9nkE20l1uechEUk7Tap/X/lCCO/vArtS0=;
        b=HAldLHtol/KLgQVgDFX2Mv8MdiyubaR15P9S/vPa4MWt3fk/F9OqxXfsb1dnhmyeAg
         K96Qsyf1VjptOLbxUgsbky16kdEWJ1jgxTbF+N5kM/0siEw+KfPqCD3FV51hY0uSoAde
         dMjh4Y0G0QAb2uqYpcGf4dvrNAXcKJRTYbaa5D2EgV0M1nTUOq7E+K+1xQht/QuMDaTd
         SL6C/fZVeMMnjt1rmq+d5zBBiTXQc0A61SEeSmBFHpS5OqNJsuq+D66N2k9q41NUTCCf
         7KBL3kI8J8GNw5mYC1Znf9QzJLCjju5mDsbEibWSN8Y4upyM/RgBpfqa5lcwMHB+tm53
         T9Mg==
X-Gm-Message-State: ABy/qLZHwiTSSslE2o9WeH8giPxggryLL005z/hQ/rYAabG2a/GZUT0W
	cFRptt+of2eu/+lJzG5xf2+m2mFfIUDKCP930YY=
X-Google-Smtp-Source: APBJJlE4AEhOYTb7QMh6sXfCMc5LWtWpbgzK5p/x1CWtYt1uO+ltyY9NSG2IJzuCFHi/jJ3JABHe8OLe7NSpTPp8OvA=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a81:aa0b:0:b0:56c:ed45:442c with SMTP
 id i11-20020a81aa0b000000b0056ced45442cmr22810ywh.5.1688082180469; Thu, 29
 Jun 2023 16:43:00 -0700 (PDT)
Date: Thu, 29 Jun 2023 23:42:51 +0000
In-Reply-To: <20230629234244.1752366-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230629234244.1752366-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=689; i=samitolvanen@google.com;
 h=from:subject; bh=g8cSbJ3YqGqII3Es78fHzl0mN4OnPxVObPCoUIO2Cw0=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBknhb1jX6BLvnk0FKQHZsmyPKyvo4TJBI2RL/Fa
 sauJUMVL5yJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZJ4W9QAKCRBMtfaEi7xW
 7nuMC/wLrmKtkYfd+iRZVIIgu+Y5m2M9if9FoIpZHdzE1sPHuEoeRb71eU9RY0XTpDiHCGPiMNP
 YbjG6hBOYmthlFvkkZe34E7uxSmP2qlWDjGtIh0Z+psbI9KOhxLdNO6136VZOaifKjMNtqGQvlz
 rAgmqkVNLA6Q710CI5OrJ/lUad7tNT7cx5lRpvzeTrgaUXI9mcWBOP5vr0xb3P7K+bjMf6WOWLa
 w/RroR5VNlXhzLL3pamA1Y55QzNu7u8sbUvvaZgRSfOvpNWm1tfqGS+vci2Q5WBLkmGw2lawL43
 d3BruriP5Q3JTisr5jHg8Zysv4VFxW78GL7dTSAkv7nPLw21lFpZtWpyBU274NKrD4PeFzdqjaJ
 /8ZopxIQJG64TVeMX+Dwfx0bhZ6Pz5B7r5CxdwL0z+p15PaXWqhx6uTWtmMEKOFLB2AAprrNsZS 5mth9xbFP0G2ongMFbaDFjlNdXZ5tmF94r/B3WQ9UzapWOCids09pksdQ/AFipOMR1Dkw=
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230629234244.1752366-14-samitolvanen@google.com>
Subject: [PATCH 6/6] riscv: Allow CONFIG_CFI_CLANG to be selected
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Select ARCH_SUPPORTS_CFI_CLANG to allow CFI_CLANG to be selected
on riscv.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 20a40927175e..2699e1f8fe33 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -44,6 +44,7 @@ config RISCV
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
+	select ARCH_SUPPORTS_CFI_CLANG
 	select ARCH_USES_CFI_TRAPS if CFI_CLANG
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
-- 
2.41.0.255.g8b1d071c50-goog

