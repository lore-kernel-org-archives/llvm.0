Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2787E
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 04:59:26 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id v5-20020a2583c5000000b006964324be8cso10108265ybm.14
        for <llvm@lists.linux.dev>; Tue, 06 Sep 2022 21:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=HyKr9I8MzG9kBN69CE/ANl9iOdCK/yJrqP2VJJKmtbA=;
        b=mJJdHlkWP0qiECsFlrlh4TKS0YhzeMCgS4kv9vWslSXb4Vob+X30ichTiTL9WTKgI5
         gol9O3sKAlXKI1d1of7Cx5Dpy6M7xy066hXl72LhnNeDvOPqt4fAeMBFk9P/xDlbHDD2
         UA/pc6CA6BCCHdAtX4qtkpOdFmk8fiZ2OArMTR+ncA3Yby8+sBmM+xa3oX1KJ2YzgJKa
         L3WqzmAD6s/p69GW8Di63kcHhq5ThiT5UKYWfMmqynAphjEWW/B63Rm2Ocy3RFqD/324
         TnivXmR6PypnprSSrfFTKQ6rz9V+TOXSc4HJQE//4PY20nwqS/FUvdbNY4f1mLnkixFm
         MvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=HyKr9I8MzG9kBN69CE/ANl9iOdCK/yJrqP2VJJKmtbA=;
        b=8Qe/jUXYwNG4yyAc5GEtWuKh0EXnmJwnKSDoBDMswaqzPjPcO/AB4vT4IIwLSAU4+/
         RoPtT8dMKK1hY+0yHceHRURAmipaJWW7yyCRn+UkCO4HnWJSXGPM8TAfxWgS6gYP8smo
         VNx97Gvr77+izuL6l/PHJD5hYHnxSV8OeXC5yBWzY3m3ISeYSNJxK2OfMDtg/7WVDEQ2
         5N4DnAXPVgTjn/J1nmCnKH24f8iTBMAFpmQYDgtdr9kAGJTbHZy2NQuRFkF7IeL0QHva
         VtGLoAVDn3sIIAlE0tiFNmd1/8H1VmYHXjNq8Y+wtGuwMBQM9CEEVy/CxWhGu14o+Ej+
         7s3A==
X-Gm-Message-State: ACgBeo0SJV9xSC74jbm9O2gcLs5EiTIWlqcLZD909Bz8phD2SzHImTr1
	hpkM3F+meJGWwtv+g7FK8BQQj7sKtz0l036C1bE=
X-Google-Smtp-Source: AA6agR6A3nOFVgzH/LIlkj47r/IKh6L2ey7C7N3pfYOn5TOUy3NjV0xTHyAbU1giaqkuT92t6UljPsTDaUWLkFIxjWY=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:9755:c523:9dcb:2228])
 (user=ndesaulniers job=sendgmr) by 2002:a0d:f2c4:0:b0:333:560c:ee46 with SMTP
 id b187-20020a0df2c4000000b00333560cee46mr1649366ywf.109.1662526766087; Tue,
 06 Sep 2022 21:59:26 -0700 (PDT)
Date: Tue,  6 Sep 2022 21:59:03 -0700
In-Reply-To: <20220907045907.484043-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220907045907.484043-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662526746; l=1808;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=kYGYc5XWvUdto/5QJT//gD0cOAVBQRf+GCe08dKvohM=;
 b=QJ3sqizOMx1/LC5t2cVcxIGdd+h2qlDiVbAXaw+l/z2ysUwiRHXCM6y0Rhd2/XAI2e9D/+A9TzOz
 sLMzCcW9BimZSDyDaerFZtig2p3NctS62ufemI2LaTKtXaET2zUe
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220907045907.484043-2-ndesaulniers@google.com>
Subject: [PATCH v3 1/5] x86/boot/compressed: prefer cc-option for CFLAGS additions
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org, 
	Dmitrii Bundin <dmitrii.bundin.a@gmail.com>, Fangrui Song <maskray@google.com>, 
	Alexey Alexandrov <aalexand@google.com>, Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arvind Sankar <nivedita@alum.mit.edu>
Content-Type: text/plain; charset="UTF-8"

as-option tests new options using KBUILD_CFLAGS, which causes problems
when using as-option to update KBUILD_AFLAGS because many compiler
options are not valid assembler options.

This is being fixed in a follow up patch. Before doing so, move the
assembler test for -Wa,-mrelax-relocations=no from using as-option to
cc-option.

Cc: Arvind Sankar <nivedita@alum.mit.edu>
Cc: x86@kernel.org
Link: https://lore.kernel.org/llvm/CAK7LNATcHt7GcXZ=jMszyH=+M_LC9Qr6yeAGRCBbE6xriLxtUQ@mail.gmail.com/
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v2 -> v3:
* Reword commit message as per Nathan.
* Pick up Nathan's RB/TB tags.

Changes v1 -> v2:
* Split off of v1 [1/3].
* Use cc-option to update CFLAGS, as per Masahiro.
* Add Masahiro's Suggested-by, Cc Arvind.

 arch/x86/boot/compressed/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 35ce1a64068b..85934204d905 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -49,7 +49,7 @@ KBUILD_CFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
 KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS += -D__DISABLE_EXPORTS
 # Disable relocation relaxation in case the link is not PIE.
-KBUILD_CFLAGS += $(call as-option,-Wa$(comma)-mrelax-relocations=no)
+KBUILD_CFLAGS += $(call cc-option,-Wa$(comma)-mrelax-relocations=no)
 KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
 
 # sev.c indirectly inludes inat-table.h which is generated during
-- 
2.37.2.789.g6183377224-goog

