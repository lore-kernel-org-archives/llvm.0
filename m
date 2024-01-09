Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C265F2206B
	for <llvm@lists.linux.dev>; Tue,  9 Jan 2024 13:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PfKZbXgD"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6d9b050e88cso1318855b3a.0
        for <llvm@lists.linux.dev>; Tue, 09 Jan 2024 05:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704807412; x=1705412212; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W1OkkIDMSc8Q0KyW2jakNuTKvRC/V38TH1jOx19EXCA=;
        b=PfKZbXgDwhD32SeC9ZXG50OPtVFNo1XI1wzssFL8t2ad086YzpjeroLsenO3X0tXmB
         0MynyYeoQII8dHwiHyIMVE/Q1Hv+5vVEUIyDLM0/Nbr41zmp48/eCfrHokwtkdWZePFX
         XoePOIcdoRpxBL9EK6IkmRyQ0CgcG8wc0gPBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704807412; x=1705412212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1OkkIDMSc8Q0KyW2jakNuTKvRC/V38TH1jOx19EXCA=;
        b=sdo9NrfOpx24iIYiDrdOuCYXp+O0Hd4Aw/XN8y859IpmvwbY7TbVXInxi2MKPH06nM
         1T0Ft/2PZX4zCHO4OAm/tjDeKKK/K3JjRFcUwryHKN7KSHmcSMi9dDH5zH2H9wV++NZ1
         nK2K6mvE+a+bzyZjmyoXbmFkqqudnpYuG3egAnotqDceU+Wq88BqMDS2k2c3SvgKlDVW
         cIXq4o3IYrsjUA+iNNhSXDYkF00JAl0kW58R7n8w0G+f7rtG8IvBN71mK7msSQDVytIX
         3QJHLRJigv1OusuITw7J9861jwphW5J8sI9sTYxQ8MdOmPhLZqBFckfrj3edeGEFg28G
         30mA==
X-Gm-Message-State: AOJu0YxKEVN7dc1AwGr/ptd0Qr/u9k/ToJXoQKUb8lrTrx6u497ejuhk
	4WMBgA+8gnNzDas16zd4JE+xAV/EFwoI
X-Google-Smtp-Source: AGHT+IGjwjOduo3sVvMklylvN3XYhL/ktYo2abqFN5x1SN3P9np4ra0Um4OeWouTXow82nwY84Gm5Q==
X-Received: by 2002:aa7:8c18:0:b0:6da:27f1:b8dd with SMTP id c24-20020aa78c18000000b006da27f1b8ddmr2452353pfd.0.1704807412116;
        Tue, 09 Jan 2024 05:36:52 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:e7f6:5139:c752:8303])
        by smtp.gmail.com with ESMTPSA id t185-20020a6281c2000000b006d97f80c4absm1727934pfd.41.2024.01.09.05.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 05:36:51 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <keescook@chromium.org>
Cc: "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] Compiler Attributes: counted_by: bump compiler versions
Date: Tue,  9 Jan 2024 22:36:24 +0900
Message-ID: <20240109133633.1103876-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bump compiler versions, as GCC is expected to implement it
in version 15 and current clang-18 still has no support for
counted_by(). Also fix clang URL - the project has moved
to github.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/linux/compiler_attributes.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index 28566624f008..1829c24c3357 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -95,11 +95,11 @@
 #endif
 
 /*
- * Optional: only supported since gcc >= 14
- * Optional: only supported since clang >= 18
+ * Optional: only supported since gcc >= 15
+ * Optional: only supported since clang >= 19
  *
  *   gcc: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108896
- * clang: https://reviews.llvm.org/D148381
+ * clang: https://github.com/llvm/llvm-project/pull/76348
  */
 #if __has_attribute(__counted_by__)
 # define __counted_by(member)		__attribute__((__counted_by__(member)))
-- 
2.43.0.472.g3155946c3a-goog

