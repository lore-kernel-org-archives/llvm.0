Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204454401
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 18:10:56 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-337ed9110c2so36981267b3.15
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 11:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=CWU/c+Z/T3afmWH8jUSRUPrlGa0DK6zNkVSVmthE7JY=;
        b=J+AQGYjSJRFoIHL2qT5xdAZvDrv7rB5xy/XhHbqmf4gaE97fgjZ/gsV7Bj3BJxJ6C+
         FPRauz+dGA3SM+kwveIWXCZxJ7Lo09AWQQ48FIY0hXIPvqLTUVr2mNyYvf0+hQLa5dRB
         p8jEAl2BGy5VXM7O9Hc7ChpszUItzykwB158shIdBODNy334KmOa7Wmpm6E3iQQ83TJt
         32XwyG0fmLqJ039OynjBFyJqv8N2DKehM8g7IugjxRi7bq5yo9SZ8Eas2ju1LuPB7ou7
         0OJ42v4NsHKPhivZjHIYd0OnMbrCqPgaGPj8gsCuamCPEeSNl4fyigNCj8s3DLHyhH42
         ztVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=CWU/c+Z/T3afmWH8jUSRUPrlGa0DK6zNkVSVmthE7JY=;
        b=cmWe2n2kuAqLhshLBI9ALg5vKv2u+vUNZ3J6cbyioGTbOBotIAIXMtJGh9jOuMM0qn
         lAheCaMgQFdipMawlNLWxgZ3eHWVHNou0ShGbAe0Y28FqRK5a3s1JgY1NY+J1v7T2at6
         BuyNOmimLkRo1jm19qqTQOOQnwg0C6ArBbgCR+taWREE4o8yibHPNtOweEOsRU+EDUu/
         2tgEkKquEf/Fbs4VgdueJOqjR70U+xjdyC80qGpe0FSxtFMLUYOkAI8S6GqjpufwA6dm
         r2OgmxHLVx6ZdIla8HvIYmwa3HG/dzbnnf/y/5JoIktETYh2yNDN2rNzRoz6PTeg6S1Y
         EAbA==
X-Gm-Message-State: ACgBeo3WMtLcTGgiT/VUAX7ztC882CAxrH3VxoVBZA6mjCz0vsxQTNw7
	oE9XrWq8ir3L0HtR2GkFWEfzTJTW8dHE3ed+WK4=
X-Google-Smtp-Source: AA6agR5zI4BE0SfjNUKDcGZ6Xb4IGuI7GBSJB6t0ufhMUW2iZNyRbbuavTdHsFVco3HP2hlWhORE8Awb5dEsiQIyeEs=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:8d7b:b933:5438:2a88])
 (user=ndesaulniers job=sendgmr) by 2002:a25:8e84:0:b0:696:466c:baa with SMTP
 id q4-20020a258e84000000b00696466c0baamr798614ybl.604.1661537455239; Fri, 26
 Aug 2022 11:10:55 -0700 (PDT)
Date: Fri, 26 Aug 2022 11:10:35 -0700
In-Reply-To: <20220826181035.859042-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220826181035.859042-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661537435; l=1289;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=KFmDrL6BvTknKQovEEq6T3GFbpZs3ibjX3HcMW2RbEw=;
 b=HAVmPHDoSpY2S9bAFO1KTHzp0jMYkmspk0Y0zWNA/klCy1NkTBTvFdbFEPvTjqH5HFwy7nCPzrDJ
 2mGy2RsICFikIgnIL9rPA36Q4SDd51mgrcFdoNpQ/CPxtlHcT01h
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220826181035.859042-4-ndesaulniers@google.com>
Subject: [PATCH 3/3] Makefile.debug: set -g unconditional on CONFIG_DEBUG_INFO_SPLIT
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org, 
	Dmitrii Bundin <dmitrii.bundin.a@gmail.com>, Fangrui Song <maskray@google.com>, 
	Alexey Alexandrov <aalexand@google.com>, Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

Dmitrii, Fangrui, and Mashahiro note:

  Before GCC 11 and Clang 12 -gsplit-dwarf implicitly uses -g2.

Fix CONFIG_DEBUG_INFO_SPLIT for gcc-11+ & clang-12+ which now need -g
specified in order for -gsplit-dwarf to work at all.

Link: https://lore.kernel.org/lkml/20220815013317.26121-1-dmitrii.bundin.a@gmail.com/
Link: https://lore.kernel.org/lkml/CAK7LNARPAmsJD5XKAw7m_X2g7Fi-CAAsWDQiP7+ANBjkg7R7ng@mail.gmail.com/
Link: https://reviews.llvm.org/D80391
Reported-by: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
Reported-by: Fangrui Song <maskray@google.com>
Reported-by: Masahiro Yamada <masahiroy@kernel.org>
Suggested-by: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 scripts/Makefile.debug | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
index a7a6da7f6e7d..0f9912f7bd4c 100644
--- a/scripts/Makefile.debug
+++ b/scripts/Makefile.debug
@@ -1,10 +1,8 @@
-DEBUG_CFLAGS	:=
+DEBUG_CFLAGS	:= -g
+KBUILD_AFLAGS	+= -g
 
 ifdef CONFIG_DEBUG_INFO_SPLIT
 DEBUG_CFLAGS	+= -gsplit-dwarf
-else
-DEBUG_CFLAGS	+= -g
-KBUILD_AFLAGS	+= -g
 endif
 
 ifdef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
-- 
2.37.2.672.g94769d06f0-goog

