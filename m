Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6297E
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 04:59:29 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-340ae84fb7dso107090137b3.17
        for <llvm@lists.linux.dev>; Tue, 06 Sep 2022 21:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=OAxiGU2+Zm5TGJDmYfJLZJYOpFooL4QHZIWYZiKDaNI=;
        b=UzsWkCGsn6TQFhqSZYOpR99wDWCEXyZ5MMKliAg92jQS0AYBHwEF9zjvATBGutup0p
         NO4wYpNhStcU1J2cjuQ9GbbOxS0zgurgoKVwHDsFvcRp3qp+1FwJWk9aGuyQbd+ASbse
         iV3thzcFMTbZumH8eFJ/+YP8y1KiQsIPJKUs8IhaiUZOb43fNEAzNxjiZYFDNQPUG37S
         YBaAhRCr92G4fwx7c3G1Ptk9p0+T0o/DqhaN7oWXfr5m8Ga95DnhZNA9Q15IBNaTbnp2
         gNSGwfBi+FAib0O60VIP4ATtHiqMscBaDINfd3MnenIeo3QSkPkQcshNYHMvheD3+gFv
         eKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=OAxiGU2+Zm5TGJDmYfJLZJYOpFooL4QHZIWYZiKDaNI=;
        b=GQsiy5AXkycjrWDIEBcIh6uosWzJcgwiFHm90KCzEZsBFIwl4CyZ5WGDCyieGiHieO
         sa6ufKNOG6I3Xc3IGoAYEdt/UKBTKfYs+U+H9zcuptR2VBgZY4RaRZrz74Iufw0HFP/D
         zxKwC/MLDOVNxn4qjrpz3dPlB0chUQdQRvjgTudz4YMhSoxTgJ9uWr8kmS4mgul+n5Zh
         bxJd7uAvGEzJXPgkA9L2vw1bIFZr7XErpVlPTXb0WRLsJXkqZk0VF+99ykvkC6ru9HB0
         oKb+jWdK0EXFU25fulkGe83k88nylfF3wOOy75fsZjnw5JqbN+Sz/Y59Fj6+d1qZq7M8
         I/9g==
X-Gm-Message-State: ACgBeo36X0R4tTD4Xivxy9wEGwAee6BDsJPqI4i9ufUyEm+3caAwfofs
	sVQvXtzDCXFawfOdBqW3R3mG1Chhz8V4tI+Ruf0=
X-Google-Smtp-Source: AA6agR7THdtxfPlLHDj0ifMy7DcCylYYagRl6nsfCC9Vw9Lgt7j1YooO+zDIu58BxyQMjhmKLfZwaRD9tKprzZQX4dk=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:9755:c523:9dcb:2228])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6902:192:b0:695:7e89:ed5b with
 SMTP id t18-20020a056902019200b006957e89ed5bmr1546228ybh.226.1662526768328;
 Tue, 06 Sep 2022 21:59:28 -0700 (PDT)
Date: Tue,  6 Sep 2022 21:59:04 -0700
In-Reply-To: <20220907045907.484043-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220907045907.484043-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662526746; l=2233;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=M5avwGZxXNJVxI+Cw3zYKb1tkFDlYgC1vraaiWNDNLE=;
 b=PMS5H0clISr6OeQLTZXXnl/Hs9ioLuh2rFA+ahRsD1VUjLrQCJQtmQXeyAUyMdzSLZZtrtXNSCWV
 8GhYxzD9DiNFAxz0fymoGHRZtV2fWVqD5vlKD/7fvZ87O2xKqe1o
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220907045907.484043-3-ndesaulniers@google.com>
Subject: [PATCH v3 2/5] Makefile.compiler: Use KBUILD_AFLAGS for as-option
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org, 
	Dmitrii Bundin <dmitrii.bundin.a@gmail.com>, Fangrui Song <maskray@google.com>, 
	Alexey Alexandrov <aalexand@google.com>, Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

as-instr uses KBUILD_AFLAGS, but as-option uses KBUILD_CFLAGS.  This can
cause as-option to fail unexpectedly when CONFIG_WERROR is set, because
clang will emit -Werror,-Wunused-command-line-argument for various -m
and -f flags for assembler sources.

Callers of as-option (and as-instr) likely want to be adding flags to
KBUILD_AFLAGS/aflags-y, not KBUILD_CFLAGS/cflags-y.

Also, change as-option and as-instr to use -x assembler-with-cpp since
kernel sources are .S files that use the compiler as the driver. And
then add -Werror as well.

Link: https://github.com/ClangBuiltLinux/linux/issues/1699
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v2 -> v1:
* Add -x assembler-with-cpp -Werror to both as-option and (new)
  as-instr, as per Masahiro.
* Add Masahiro's SB tag.

Changes v1 -> v2:
* Split off changes to arch/x86/boot/compressed/Makefile into parent
  patch, as per Masahiro.

 scripts/Makefile.compiler | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 94d0d40cddb3..a66638b5f4a5 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -29,16 +29,16 @@ try-run = $(shell set -e;		\
 	fi)
 
 # as-option
-# Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
+# Usage: aflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
 
 as-option = $(call try-run,\
-	$(CC) $(KBUILD_CFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
+	$(CC) -Werror $(KBUILD_AFLAGS) $(1) -c -x assembler-with-cpp /dev/null -o "$$TMP",$(1),$(2))
 
 # as-instr
-# Usage: cflags-y += $(call as-instr,instr,option1,option2)
+# Usage: aflags-y += $(call as-instr,instr,option1,option2)
 
 as-instr = $(call try-run,\
-	printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
+	printf "%b\n" "$(1)" | $(CC) -Werror $(KBUILD_AFLAGS) -c -x assembler-with-cpp -o "$$TMP" -,$(2),$(3))
 
 # __cc-option
 # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
-- 
2.37.2.789.g6183377224-goog

