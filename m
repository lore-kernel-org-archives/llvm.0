Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1B62C83
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 08:22:14 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id t8so6324903wri.1
        for <llvm@lists.linux.dev>; Wed, 06 Oct 2021 01:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xtmKhpid0Egxie2Iw2C5px+jdI/2/t58HcZiShikhEg=;
        b=UMdXZXvRK+KB24Qmn+sEV2fkRBHjx2JetJ1V1FldatAQgdskN8G/Unn5tkxFGwBYoD
         m5xiafoaloahtQWkHX/LJqTFn5aF88/xekYmpoJ6t1DQhMkrBJ7AH+O9SV0moJGfFXPX
         cqJpnWtvtgnqLEvdbguwfnxp8f2EDXrb7eahj/PtEtQydf6QL/0juW81nzF9s0x9sSu4
         ALbTWiGAy3/qGhzsRaaSE+xlywLdXX0dkLH24unzHcCRZuwZ6ZU3zcKt2LX4KNVljbEs
         ZtdC9f+Qkb8FdeYbeaJy5a/CJIVbm6Iw8/NO6JVXuFv6/rl4cSvHSymmvvGmt7ZcEtjE
         QLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xtmKhpid0Egxie2Iw2C5px+jdI/2/t58HcZiShikhEg=;
        b=y0CzjqYhUKX1gdPh1WGZW29lsop0mQW8GDiYHiM8xpzumlMVxHIpsiAUfIdiFDFOgY
         i3SlGc5gThJPYBcgdW9Vh4KwDxPbqGXB5FgDJPVJe5CkpHttUVOxhuwqSiZF7DyKj6gh
         e3P2/7tG8FfZsjAkzYUOen9oMnuMC2wfKkG8aGTreYrAzyiGmR/nTcOzuP4WWraS5/n4
         0JKYml1PIDeUk6Ox55+AMohb7tMbHnJLPhf1oSu5JKUNfGdTKwE3iGi32uPWWzimf0Vf
         DqSfssWcz93bg3In2ZDe/VADB79wpfZQfKDJEb1y2D5aZ74LBj0o2SOmo+ovCowmeHkb
         Ctzw==
X-Gm-Message-State: AOAM531DUOVK/bS6kx6XFPpaltndU4mNnal3frPkU5KGH8avC9PWL58y
	OPMbWCWqFQ45VgR001lgRsE=
X-Google-Smtp-Source: ABdhPJzlGGPhWwbXnW93of0HIaIOYgCK8jVui529YWYn4EryuglYibg7wbxQVE3OE732gkOJS1HQfA==
X-Received: by 2002:a05:600c:210f:: with SMTP id u15mr8278165wml.157.1633508533302;
        Wed, 06 Oct 2021 01:22:13 -0700 (PDT)
Received: from localhost.localdomain (i577BCBA0.versanet.de. [87.123.203.160])
        by smtp.gmail.com with ESMTPSA id 36sm17769818wrc.92.2021.10.06.01.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 01:22:12 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] elfcore: correct reference to CONFIG_UML
Date: Wed,  6 Oct 2021 10:22:09 +0200
Message-Id: <20211006082209.417-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 6e7b64b9dd6d ("elfcore: fix building with clang") introduces
special handling for two architectures, ia64 and User Mode Linux.
However, the wrong name, i.e., CONFIG_UM, for the intended Kconfig symbol
for User-Mode Linux was used.

Although the directory for User Mode Linux is ./arch/um; the Kconfig
symbol for this architecture is called CONFIG_UML.

Luckily, ./scripts/checkkconfigsymbols.py warns on non-existing configs:

UM
Referencing files: include/linux/elfcore.h
Similar symbols: UML, NUMA

Correct the name of the config to the intended one.

Fixes: 6e7b64b9dd6d ("elfcore: fix building with clang")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20211005

Arnd, please ack.
Andrew, please pick this fix.

 include/linux/elfcore.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/elfcore.h b/include/linux/elfcore.h
index 2aaa15779d50..127716b58235 100644
--- a/include/linux/elfcore.h
+++ b/include/linux/elfcore.h
@@ -109,7 +109,7 @@ static inline int elf_core_copy_task_fpregs(struct task_struct *t, struct pt_reg
 #endif
 }
 
-#if defined(CONFIG_UM) || defined(CONFIG_IA64)
+#if defined(CONFIG_UML) || defined(CONFIG_IA64)
 /*
  * These functions parameterize elf_core_dump in fs/binfmt_elf.c to write out
  * extra segments containing the gate DSO contents.  Dumping its
-- 
2.26.2

