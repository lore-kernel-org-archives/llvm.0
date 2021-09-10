Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C642F80
	for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 23:41:01 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id j9-20020a2581490000b02905897d81c63fso4549862ybm.8
        for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 16:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Q5Lb7e2vgavVwQ4D08qL5EmkhBoCA6wKbGlKTNkLNSI=;
        b=aWtGEFs/z5evTm1HEbnJiIjzV6zhziqLmrYqKg00fjbO6TLvF8GVhJ+YqRpgjwRdxs
         lHWuWXuIK8Rb7fiRL3nZB1Xla/xqH3InnQ9eU4FZJBgn5DapWVLNfJSz5JDkhXiI4JZv
         jdo7I3YEn7pjHurXKaTswqYkCygOk44ZIWPF5tlNa92ENnSOTSfXVQXIVVPyCNVsRbQF
         9Q8Ww7/sZNnW/81IGG9qLWiKDOwANhiVAsMabS04vNGFzu+/mK3gI1DHVblzcadiDswz
         Za38BmAEGfrh/5DOp0lXxkGzlQDXd6wnDjrKpgCd+hEoG/oLHfLfieFfDzGwB9d/ZJpG
         /RTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Q5Lb7e2vgavVwQ4D08qL5EmkhBoCA6wKbGlKTNkLNSI=;
        b=UgNylBMCS61AD8ieYjYeW+NAflVgRed7XQeQzesLfBgwgQ0B/plVDaYGkNZLUR+4yk
         glr8iLXK/YGI9zI1cHcJFqDU4Miji0ZHYDMveop3YUGkRor+WlU4FBIdNjETh0D0ZH0D
         Rh7nX741TGO5AkJS0lDnSCzMZ7Ngb6M0I//V+9wGilAZxHqdVUes+yuZF+hxKKkLQlF/
         ce29PPIHaDaa21zUEPiq+Ug1Pp2H5S3Zwt27Em5fXj3WsRa/0jBeEa8LKud8JezO3Mea
         ZK7yKxscHCgxiQ6W8plyME8EaRD2oDNqxk32h4byyLLgVydZsPXDoE+45FBgJ17lRqRk
         E/fg==
X-Gm-Message-State: AOAM533DyLOKqtMX1BMxrCby6qurkWUS7MKXmuhCcgEpFCvWo6iWZJwF
	4jNzyHOncHT3JCixRcPUAnDzlE6LI2mG/mIax34=
X-Google-Smtp-Source: ABdhPJzxzb+3bK+bR8SA2swgwjDHDcBccp8Nxjg24ARkUTHf7IrR/2cU954HvNmJuNCK8FQwmJ88Yf1ZbWbbqJmK/CM=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:2b76:71d3:b5fb:3734])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6902:110b:: with SMTP id
 o11mr360373ybu.207.1631317260479; Fri, 10 Sep 2021 16:41:00 -0700 (PDT)
Date: Fri, 10 Sep 2021 16:40:41 -0700
In-Reply-To: <20210910234047.1019925-1-ndesaulniers@google.com>
Message-Id: <20210910234047.1019925-5-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210910234047.1019925-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 04/10] Kconfig.debug: drop GCC 5+ version check for DWARF5
From: Nick Desaulniers <ndesaulniers@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

Now that the minimum supported version of GCC is 5.1, we no longer need
this Kconfig version check for CONFIG_DEBUG_INFO_DWARF5.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 lib/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ed4a31e34098..d566f601780f 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -295,7 +295,7 @@ config DEBUG_INFO_DWARF4
 
 config DEBUG_INFO_DWARF5
 	bool "Generate DWARF Version 5 debuginfo"
-	depends on GCC_VERSION >= 50000 || (CC_IS_CLANG && (AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)))
+	depends on !CC_IS_CLANG || (CC_IS_CLANG && (AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)))
 	depends on !DEBUG_INFO_BTF
 	help
 	  Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0+ (gcc
-- 
2.33.0.309.g3052b89438-goog

