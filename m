Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE8D2CA4
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 10:21:50 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a8so52430875ejc.8
        for <llvm@lists.linux.dev>; Tue, 01 Feb 2022 02:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w0qn/AbWYdlLKsTLrdNzjvpKb0731eh3D9ihByfG+Cg=;
        b=GclaufmiyIC2kKKQl4aH3RGgPrbBuv3HO3aoA323ZCByUaHOYBu14a+1X4OPD10WK3
         fm09gXtsRKcRrXHZzbGhdDWhrBhzp7aZRXgIHcl5GSEivA00a4ZpoPShGxrimismSBbt
         5hRcYS3bs53+jLtmUacafSZhb65dAhhzN6Q0cXaKlA9pMyNrm3qXPqQ8ZPQkwT4+kxCL
         k8gWdAn7OfjVIOKW38f7SPxR9tRi6j2OiiPzKJf2uR1GJjx7NLalUItt2Ps4tKxvxxFy
         TeMbypA4daJ/EklIghqrkNpywc3ae4t5HOTQg5sZADVHQTuDLqg3TFdR6HRfe7zZDMf8
         AffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w0qn/AbWYdlLKsTLrdNzjvpKb0731eh3D9ihByfG+Cg=;
        b=i1Te9dwsCEhfkUNeSXis4Lrkh3bPaJkM9fGWU/0RBhG32m8nIXTmxNJklWOm2SwaJo
         n5A0xmMiiTGBfmbFf5OC6Bbwnr53JFH4VthQ3PupUr9/2NTYDpVuSDQmsRy792PYQp9N
         ZPwdCpXzFl5xOsclLdhaCvECzwBWcMdElqz7/QXYPsgvVKJCXSm1DSyGizZS1L0EfOnn
         uq+8/tCAuM1Pqs4zitafiXkLYyRU3LgEhDNZUxL0Zk+89jwP7cdxRhBp04dSnMtr07cs
         GgMwij9ssQ9oXWl+STs1u76s1BuLl2kqbxQZT2AVyCTRCODVXLOJ7nusQJPjpM2iMUzP
         4YAg==
X-Gm-Message-State: AOAM5317ZxGG0/3xJGUSKqCNqIWswwHnJyMvvaeseTUdWkoGuKRW44Na
	G8+Z1r55x0fce3SLBGDbJ+3vdQ==
X-Google-Smtp-Source: ABdhPJzP6DNVGKDR/xSND+TRoZ71TnPMxBl+WvaIrcN/UAaCkj9VHFG9apRFHeZD0UVOyZv+T/zx4w==
X-Received: by 2002:a17:906:bc4a:: with SMTP id s10mr20318695ejv.371.1643710908455;
        Tue, 01 Feb 2022 02:21:48 -0800 (PST)
Received: from localhost.localdomain (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id lm6sm14283211ejb.46.2022.02.01.02.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 02:21:48 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: nathan@kernel.org
Cc: ndesaulniers@google.com,
	llvm@lists.linux.dev,
	bpf@vger.kernel.org,
	andrii@kernel.org,
	quentin@isovalent.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH] tools: Ignore errors from `which' when searching a GCC toolchain
Date: Tue,  1 Feb 2022 09:31:20 +0000
Message-Id: <20220201093119.1713207-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When cross-building tools with clang, we run `which $(CROSS_COMPILE)gcc`
to detect whether a GCC toolchain provides the standard libraries. It is
only a helper because some distros put libraries where LLVM does not
automatically find them. On other systems, LLVM detects the libc
automatically and does not need this. There, it is completely fine not
to have a GCC at all, but some versions of `which' display an error when
the command is not found:

	which: no aarch64-linux-gnu-gcc in ($PATH)

Since the error can safely be ignored, throw it to /dev/null.

Fixes: cebdb7374577 ("tools: Help cross-building with clang")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tools/scripts/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index b0be5f40a3f1..79d102304470 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -90,7 +90,7 @@ EXTRA_WARNINGS += -Wstrict-aliasing=3
 
 else ifneq ($(CROSS_COMPILE),)
 CLANG_CROSS_FLAGS := --target=$(notdir $(CROSS_COMPILE:%-=%))
-GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)gcc))
+GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)gcc 2>/dev/null))
 ifneq ($(GCC_TOOLCHAIN_DIR),)
 CLANG_CROSS_FLAGS += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
 CLANG_CROSS_FLAGS += --sysroot=$(shell $(CROSS_COMPILE)gcc -print-sysroot)
-- 
2.34.1

