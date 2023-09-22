Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE40443AB5
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:51:43 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c0c6d4d650so22165005ad.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405103; x=1696009903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rJoQ4rDttwSQzl+h8GPO+G7mapr3BtySN8HDbnxSAIA=;
        b=BHFWvDtC8FK4+08xa35wTfJbfoF4ZnmQXCqsLQZ3Av8gCIg6zS+S8GZ20uc+pi59/O
         HMJljbT3HYA/8+dLY+vQFqfKh0edsZRJdzsDI92Addz1kRy6LNDEYfpDk8dsTkhvSz8D
         Ah7kEeP4SJkKwD69s924BQABU+PuGpopPIKCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405103; x=1696009903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJoQ4rDttwSQzl+h8GPO+G7mapr3BtySN8HDbnxSAIA=;
        b=wNoUvh3YQ72wOb6RSarDSU1gLa70ET5XakpCj9ZS83EP3FmVZKhxv5K7/JgXItqr3C
         z/PmWwdOw+7p7DE1aa/4pTDUBhFupPwrHW0bqv52LfSkGs/vegCrT6ktBh45RDCQq92J
         wdaqnxfIrsL1mA5dkqq5elXjfX1zPJc8nKEbKwVv9seKb/BXEzIKpwjiRhAOHOdL9XV/
         /jWmlUJNbgGTUtz0F4Fn0Q1jFQUfxZz6/j+X3zaBbCnejEC9nT5V/ZukKTQwceTIK/zd
         Bnmnm6Q14wuIndD9FsISG3t3hJZZhhQ+XmY/SEI+4DSMkj5ZcqrcQByLmBS9GJ6Y4Mnh
         4P1w==
X-Gm-Message-State: AOJu0Yxj1LpZgtxI3j+tXwUAmedHYg+qgm1Tm3+U0DIg0ZlKg0zL+3My
	HvuBK6HQ4q0CU50OmEvnui0gAQ==
X-Google-Smtp-Source: AGHT+IE0vw3tENlyJ7OADDBoRIfgRk/i//iN/tovYi2O/PZ45AZp8cZKFhBRGB/lpULSf1SYlKBaxg==
X-Received: by 2002:a17:902:f7c7:b0:1c5:dd24:f0bb with SMTP id h7-20020a170902f7c700b001c5dd24f0bbmr158735plw.63.1695405103381;
        Fri, 22 Sep 2023 10:51:43 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ji21-20020a170903325500b001b392bf9192sm3789240plb.145.2023.09.22.10.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:51:43 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Helge Deller <deller@gmx.de>
Cc: Kees Cook <keescook@chromium.org>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] video: mmp: Annotate struct mmp_path with __counted_by
Date: Fri, 22 Sep 2023 10:51:41 -0700
Message-Id: <20230922175141.work.450-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140; i=keescook@chromium.org;
 h=from:subject:message-id; bh=H1/vE1vzDEkKr/pR9G2TlDq8I/0Pjxfcmq4WIBG2rX4=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdQtbAyYSxB3rtoiVITScXMw9/igQbzzli6cd
 9NaF66HGJGJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3ULQAKCRCJcvTf3G3A
 JgFvD/9aVhNFMXOLfYvQuvtNWdczuksf82WmWUjZ3XxnXA2fVtRIrmINsMubWXN5BqlzWb54JAd
 2JvpfxjAjclOiZQ1TaC+xCzUTkoEbnWszJAT778l3qNuM+FynSmS8WJqcyfFWae6qACzw/UexAD
 JDEdStWGpO05F2Y+sgcCmf6rvfJS8A3MiilSGKaXl+xUHsXWS2iEBwRa4eiIE70ykhfR0HAMdXS
 L5qBSDWbXjlq0mui0yKkhE6H+xAA95ChwfuiVfcSp3s7uA5qT12D1BC9Cxy9TwGWQc/gzstl0q5
 Act4VdII0lEJtWXvl4Sj9czaYZOIflGtUky/NbxfaXdyCXBldJ15O3hex7Gy+a7jRwaFIO5lP1l
 VrXKQwNlknIw7kLZsuScN9wJEkwbAkNtn2dNeXWJRIVDRZlEDYch+nmd1ma+pDKFjLccKHNVCyn
 srI+NBBV0w6HIUUfyqXhVfXNhpxbawfW88qpoywu/N71xmeTIdAbcNhW4F7jFKwwFPOz8+ib6PB
 htPR2uKXF1fwz05xPScZwFqkbtuiB5nzGhfpttxqXo6HjJpg3OuRsjckExbw4ipKW2dbuANjPVL
 n1Saavvp4yFM7FKZDSNxqVP/nSKD8kjtleMkQzEEJwmM4S/b0Fm0MbxtSCIKC/ed6tHkllPeipu
 NODokxp /mmGU/PQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mmp_path.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/video/mmp_disp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/video/mmp_disp.h b/include/video/mmp_disp.h
index 77252cb46361..a722dcbf5073 100644
--- a/include/video/mmp_disp.h
+++ b/include/video/mmp_disp.h
@@ -231,7 +231,7 @@ struct mmp_path {
 
 	/* layers */
 	int overlay_num;
-	struct mmp_overlay overlays[];
+	struct mmp_overlay overlays[] __counted_by(overlay_num);
 };
 
 extern struct mmp_path *mmp_get_path(const char *name);
-- 
2.34.1

