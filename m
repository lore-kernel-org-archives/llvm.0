Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7807B
	for <llvm@lists.linux.dev>; Fri,  2 Dec 2022 04:58:29 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-36810cfa61fso37858707b3.6
        for <llvm@lists.linux.dev>; Thu, 01 Dec 2022 20:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fILq8A5qrz+unrhULUsXFNDjXn/1W1i4JLQUQRTfzvo=;
        b=acO/rNicqUru8CkyXkWALo/Fo2ksQ8hWFQGgauAkCDH9CYAjhXMx2G6uXmAEFKIYU1
         FEDkyb6VhGSOK4t1tK46XWBuCchhlS1aJSGEKIH79Q+G/OhDs4MXMewZmk34Rn8E1vM/
         mSRisawQckSeTp2MkhOMqYTigFB1Z9FMDVqpWaX9U4M39HG23S3FBx4aLE4ndNeqEnCI
         2BRkONxouTflHYDQgx1iDO6qwz3B2MTCqeeRsAc8W36Zm+6Dhabs1ZY+Fmqatd0/KZZx
         M1DWpDDg0SjO4hCaqS04mv5+k9MacTqZ3R0iYJO3mfBnIj0cw0trCdA7okWKg6xa1xsf
         YqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fILq8A5qrz+unrhULUsXFNDjXn/1W1i4JLQUQRTfzvo=;
        b=c9pzw4z5XBo78ZP4pGx2O1go8Etp1bkR69k+KjA2KcgL0BvWSfbqRj5KYT4uv8rtyK
         fYiIHIOQ5R2uMouhCzOZkF43bRTnFM8RR0t73ZqtcyfhjPYhz1o/Y4p0yj998T0nsPkO
         sSZg1yTbyNongSDk+LHAOhOXzhVti0a5crcHrXDgyMeuOBpIDjbDMaCHbsYVuJgEa8Ce
         Wad6kwbtkTz+gtywC+mddOK/dBhJG+TzJgavD9yLH393F8h+TDcnOA7TleUb668lBpLv
         t4enu3eNBqqK8bcBxnaHGIRJvE76ByliiZQiOqhb6bz1TLdk4G31m2MSzR3ELEuR212o
         e+QQ==
X-Gm-Message-State: ANoB5plJTnZ23j9MHSj0zVvgCOKQ2bXl1VGkhM/NcpTWx8c0uMIIpck4
	Bt+W9LGgyxHJL560QrX9wbBqtG7V+yXq
X-Google-Smtp-Source: AA0mqf6J88v0jQ/vpUt8gWXuYLzszh3xJz4A/psqOw9CH17kaOd1Hvy7pJ8mWpeUGZogqM+Y2HcWcehDaIV6
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:e3b0:e3d1:6040:add2])
 (user=irogers job=sendgmr) by 2002:a05:690c:8:b0:391:c415:f872 with SMTP id
 bc8-20020a05690c000800b00391c415f872mr47275258ywb.318.1669957108981; Thu, 01
 Dec 2022 20:58:28 -0800 (PST)
Date: Thu,  1 Dec 2022 20:57:42 -0800
In-Reply-To: <20221202045743.2639466-1-irogers@google.com>
Message-Id: <20221202045743.2639466-5-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221202045743.2639466-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
Subject: [PATCH 4/5] tools lib symbol: Add dependency test to install_headers
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Compute the headers to be installed from their source headers and make
each have its own build target to install it. Using dependencies
avoids headers being reinstalled and getting a new timestamp which
then causes files that depend on the header to be rebuilt.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/lib/symbol/Makefile | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tools/lib/symbol/Makefile b/tools/lib/symbol/Makefile
index ea8707b3442a..13d43c6f92b4 100644
--- a/tools/lib/symbol/Makefile
+++ b/tools/lib/symbol/Makefile
@@ -89,10 +89,10 @@ define do_install_mkdir
 endef
 
 define do_install
-	if [ ! -d '$(DESTDIR_SQ)$2' ]; then             \
-		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$2'; \
-	fi;                                             \
-	$(INSTALL) $1 $(if $3,-m $3,) '$(DESTDIR_SQ)$2'
+	if [ ! -d '$2' ]; then             \
+		$(INSTALL) -d -m 755 '$2'; \
+	fi;                                \
+	$(INSTALL) $1 $(if $3,-m $3,) '$2'
 endef
 
 install_lib: $(LIBFILE)
@@ -100,9 +100,16 @@ install_lib: $(LIBFILE)
 		$(call do_install_mkdir,$(libdir_SQ)); \
 		cp -fpR $(LIBFILE) $(DESTDIR)$(libdir_SQ)
 
-install_headers:
-	$(call QUIET_INSTALL, libsymbol_headers) \
-		$(call do_install,kallsyms.h,$(prefix)/include/symbol,644);
+HDRS := kallsyms.h
+INSTALL_HDRS_PFX := $(DESTDIR)$(prefix)/include/symbol
+INSTALL_HDRS := $(addprefix $(INSTALL_HDRS_PFX)/, $(HDRS))
+
+$(INSTALL_HDRS): $(INSTALL_HDRS_PFX)/%.h: %.h
+	$(call QUIET_INSTALL, $@) \
+		$(call do_install,$<,$(INSTALL_HDRS_PFX)/,644)
+
+install_headers: $(INSTALL_HDRS)
+	$(call QUIET_INSTALL, libsymbol_headers)
 
 install: install_lib install_headers
 
-- 
2.39.0.rc0.267.gcb52ba06e7-goog

