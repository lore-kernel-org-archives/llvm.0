Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B742C80
	for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 18:36:55 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id my12-20020a17090b4c8c00b001b528ba1cd7so11527809pjb.1
        for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 10:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q5vjG+YMypgAosvq5fGFyI71IypDtaJUOdFNQIbCj7c=;
        b=Tb8nC01F+DRqFoHXLT7qgPpKsIdyH09z+q9OtVS0BCOO7v4EMNn42gukaDyeTdAo2m
         UqWilgsSHw3fQHIKwDxPJOYJT/odvwD+RQdZlVu4ayXZ3YRVJI/9yNJlpEnQ9+Orhs+N
         q71CrR0DEPFX0q4KLBMBE+abeKxHRtJrwT1/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q5vjG+YMypgAosvq5fGFyI71IypDtaJUOdFNQIbCj7c=;
        b=zmj9nG/0JSabyU4ouGtmAxAQbbF+shIhp8klGhmu9HQyK3Ih1XxSRNo37b8eR9+8ob
         CIPHX/Theca4LCaVfQxhxBCc1jheWc9rF7QVSLg9fru7YaCMQemcdFGvapFmPNLXm9eN
         M5F4M1uD7DN9PUH19bUCggi/bg79yug9q5d7KYl9rCa8zOIx9GamJUO7/EwiFXUO/ZBu
         w9ajbyHgbJW4YzdM//ag+63ZPSjopoEOjX0jeto5ClY63MTOBGayslm4TiB3EtAJbIJo
         dssa9YxrDO8c2/EEs2tJZ1bybXPirMI4ynWDZ6M9RWAsNr7kFG584jpmBf63yCUVKXCQ
         4mbQ==
X-Gm-Message-State: AOAM530vxVqbk8HTgr7iAr2PRluGoG1BZcZqKb7jY0s8Otl+tOIIcN6D
	hMolPPiJgeND4t6iUIxro0UDpQ==
X-Google-Smtp-Source: ABdhPJzi6aCYq4cU+3Y6e2MM/lD1976jEVm8rfWvXvefJCxXxdbxY/5xTJkF3VFptZ27isF8Ea8KWg==
X-Received: by 2002:a17:90b:1c8b:: with SMTP id oo11mr5325523pjb.9.1643567815256;
        Sun, 30 Jan 2022 10:36:55 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id ne23sm8342898pjb.57.2022.01.30.10.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 10:36:54 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Kees Cook <keescook@chromium.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Peter Rosin <peda@axentia.se>,
	Andy Shevchenko <andy@kernel.org>,
	Matteo Croce <mcroce@microsoft.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] lib/test_string.c: Add test for strlen()
Date: Sun, 30 Jan 2022 10:36:53 -0800
Message-Id: <20220130183653.491292-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1906; h=from:subject; bh=StW5CkYsJmkZOPt9qK/Mj4yFOZ3WDOkjyFpDMiiGEws=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBh9trEXeMxmUufHBSxPUHfFwxLEBs9VUcxm3mkqbV3 B0QB/XmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYfbaxAAKCRCJcvTf3G3AJrOvEA CKkBcQp1Pf4H5nU+9Xgq02JhlS8Hatlj0a3OjZYovR7LFvzBXrbK2tboDY8ADyPof0JlHBjaFlEzzV hZSLQz4NlIJBBGoSl4tgS1pz6Joq4yYj4tdtN6jR4T7C+ZQDJsE9aeQ6fMbn9Cr2/Soditxu1dY8Kc 6HZi+ABohJPLNGuQHNtwMXX3ZQHxSFEmSzMxtOTCYcpjh7D5f4R74Pw5dJ4RmQL2lsDL/b02i5akNZ YeFeSWLZcqW0rISxX8hpv0K+oAtaN27+RKnnh4CgjnpsWdYzS+6X2DdBNl/3SBFZvWqVOrZIZhJt9r vSNjQEKjO01zr1RmnZAEHjNSLrAfuzMX0IRVzcmsp7yfmBgP/P1G41oD04Q0FAakHpT0J0ONnjnXNQ WN3XGBTetguzj+IL4CLS8GfW5ifgUn2SfSq3S5hWHZ1/O6Kn/09LC+LT7zWU4iKSBMetrZS+Rzxyxp 2NCpGnyWWhG0EUB7m7nhBWbEZA2cKmyBdxnw2qStimSHHcRECPtJmCg6aL5iIbgWdrP7H5f8PphRoF NTVcIaeWChv7UfmYe2bhEEFZvvbXoYxP5WqVi9kKeodGHKkHnpPLfCm39/BaiK2+Edz5YJoSWlEAmJ 3kwbX+0KYhcH3OkRf3oB40iDh+9YecgwQ0GhR+KOJNvAVikfpG+VkAOZo8Pw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Add a simple test for strlen() functionality, including using it as a
constant expression.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Peter Rosin <peda@axentia.se>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
I'll be taking this as part of my Clang FORTIFY_SOURCE series.
---
 lib/test_string.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/lib/test_string.c b/lib/test_string.c
index 9dfd6f52de92..59994f552c48 100644
--- a/lib/test_string.c
+++ b/lib/test_string.c
@@ -179,6 +179,38 @@ static __init int strnchr_selftest(void)
 	return 0;
 }
 
+/*
+ * Unlike many other string functions, strlen() can be used in
+ * static initializers when string lengths are known at compile
+ * time. (i.e. Under these conditions, strlen() is a constant
+ * expression.) Make sure it can be used this way.
+ */
+static const int strlen_ce = strlen("tada, a constant expression");
+
+static __init int strlen_selftest(void)
+{
+	/* String length ruler:         123456789012345 */
+	static const char normal[]   = "I am normal";
+	static const char *ptr       = "where do I go?";
+	static const char trailing[] = "hidden NULLs\0\0\0";
+	static const char leading[]  = "\0\0hidden text";
+
+	if (strlen(normal) != 11)
+		return 0x100001;
+	if (strlen(ptr++) != 14)
+		return 0x100002;
+	if (strlen(ptr++) != 13)
+		return 0x100003;
+	if (strlen(trailing) != 12)
+		return 0x100004;
+	if (strlen(leading) != 0)
+		return 0x100005;
+	if (strlen_ce != 27)
+		return 0x100006;
+
+	return 0;
+}
+
 static __exit void string_selftest_remove(void)
 {
 }
@@ -212,6 +244,11 @@ static __init int string_selftest_init(void)
 	if (subtest)
 		goto fail;
 
+	test = 5;
+	subtest = strlen_selftest();
+	if (subtest)
+		goto fail;
+
 	pr_info("String selftests succeeded\n");
 	return 0;
 fail:
-- 
2.30.2

