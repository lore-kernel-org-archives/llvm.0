Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762162F80
	for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 23:41:11 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id y134-20020a25dc8c000000b0059f0301df0fso4514550ybe.21
        for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 16:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=VVycRjqCyikLXTyX3XiEITjrwGSxvaGodk5mb1ImPSQ=;
        b=TNefXA90HT5t+VMamelxf6ZHaaT4VEiDPuE4ok/wJdOVi2p7mfbzTb3UQsp6+n4HNc
         8qDXPfrluytEVS/lE313LPM84ytsmEQiMU9PSFidxoNyVsUWmMDcZA4RX7j60A9rcGar
         qKxsqnSNmiSrVzE+latG8iyRLiIZ+psw4g4wS4aU/Y4xcoJF+BmA8A+b4q+1j8VEKImh
         tVIGXc7eQVBuq3r9nUbJRp+vqZ8VFAqglLV+gkPriKYf5GlwPHePlQOq7qMWPNmUF5wR
         UrN02r/0ErpYovsTA/4ggsmVb0UoLOpFK5wNV5u6Eg0CYZBZR58heukDYJqE/A5owWOr
         6K4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=VVycRjqCyikLXTyX3XiEITjrwGSxvaGodk5mb1ImPSQ=;
        b=OkdWt/Whtwa1Sz9hYSjNxNarHlgxhpP4DyZAK5f4uXQphCrp4r38gHiXizAvqrazLv
         NXZHnFwrQApNaA6Ghiw3F7/c4JPl0TpkRQgMsZr8zqc3rGdQ3006RpXS0TgdUsWjv5Pt
         pmY6Y6emr9V2Hnt6ZHxB7rXuEfslqT0ESF5s+/FCf508Comx1HFZxp+WSF+0c80d2PjE
         VjQVrD6n4O7y3GTka4YGDEqFVlDBAv+cUUd8MmVEK3wy4Om82hdedisMImPn0tvMkv9G
         YecfZlyNeMoth5k6A57YiQdmOP2iVu0nae3FnH6H+XThvrmzRmZBaaOJMnlvRoSOiSL2
         HLwQ==
X-Gm-Message-State: AOAM5332GLO6UJ2gscwPEFlmhYd8Twu9YgJI1BQZj+TUQqxpXv25geVy
	n9lyrVE3It75kaA59r7hBSuNqealLe9ouTnr0jo=
X-Google-Smtp-Source: ABdhPJxlcL8orqv7m/N8sZDNsSIELfbF5/uenPTSopNYlQYm+J7Nucv0KZGfgFLv6kluTLoDYkCfKiomtq8RqAlLP34=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:2b76:71d3:b5fb:3734])
 (user=ndesaulniers job=sendgmr) by 2002:a25:5b45:: with SMTP id
 p66mr332465ybb.273.1631317270573; Fri, 10 Sep 2021 16:41:10 -0700 (PDT)
Date: Fri, 10 Sep 2021 16:40:45 -0700
In-Reply-To: <20210910234047.1019925-1-ndesaulniers@google.com>
Message-Id: <20210910234047.1019925-9-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210910234047.1019925-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 08/10] Makefile: drop GCC < 5 -fno-var-tracking-assignments workaround
From: Nick Desaulniers <ndesaulniers@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

Now that GCC 5.1 is the minimally supported version, we can drop this
workaround for older versions of GCC.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Makefile b/Makefile
index 2d1e491f7737..f9ef07f573e0 100644
--- a/Makefile
+++ b/Makefile
@@ -849,12 +849,6 @@ endif
 
 DEBUG_CFLAGS	:=
 
-# Workaround for GCC versions < 5.0
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61801
-ifdef CONFIG_CC_IS_GCC
-DEBUG_CFLAGS	+= $(call cc-ifversion, -lt, 0500, $(call cc-option, -fno-var-tracking-assignments))
-endif
-
 ifdef CONFIG_DEBUG_INFO
 
 ifdef CONFIG_DEBUG_INFO_SPLIT
-- 
2.33.0.309.g3052b89438-goog

