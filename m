Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F7C168
	for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 18:45:03 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id c66so5179wma.5
        for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 10:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sP8tGVLSq+J8OoY4ZEIZdlL5ioBYvuT3xm7rNvUEflw=;
        b=Jg3B9hSImyqr8JAxuDtr8VSKOk2Y/dAXnQlgy7Gs0O7lNN48oonawsgfd5T0X99BMo
         3prOZpl0lcyHbJkGoeQwRcYztxCp+92XIxOGuuSg6El7mc6aTdhK+T+tTj/i2VYsIkqU
         gY4zk7gyYyq74X4e4k7hJkOwXU8o37tJO+WpnIyFLBAnAOWNNONTc1q9kMAwmb9jkEnt
         I91RZjm6gypNO5i37RPnL531XZMYwFlPpkaU+lQ8bkzy9e7gkPtEg11oida65UkuZBiX
         g6SwKhPOWCEuCI3L3WC3qL/CvbAbkOjUohDi9YCu83hiYtcqFyy60QjlVj1VsEQut2Go
         lp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sP8tGVLSq+J8OoY4ZEIZdlL5ioBYvuT3xm7rNvUEflw=;
        b=mlxMRYy54PHYnh0DFTAGafQCO4bCs+/9AeWwNwY5fd2xxrmmn2fKkQdKfC1R3Ga/n6
         uXXbSfxcsjvLWmFG6h0C4i8Ck13vVTS1KB3ww3WLnMKl5WKvLy+//lNWQJayIrOPXzzu
         QdfGb9FT6j/0ySbmpB7qt1bGBURjcxXYgkJf0MZdI3Y00nWpym+YWnzpxpLSzULYnmzx
         QXlXO6BiAATAAMmQ2RnEeOVL25vpXETE9G+p2FlZPFpyK8YQMyg4ETr4wwTafgWZPbvW
         ZZH8g2GAk7LS7x4HW9puYhOMb3ysgXIE/BTm4YolWxgeweDZOPuIS837sP3pS89IWemD
         34mQ==
X-Gm-Message-State: AOAM5312vBCqxKnU66OBjOt6FjqpKNCiYk4QbAgoyB/suEEoR06/6Kt4
	QzhGlUOf9m4Ys9X8VEdW7Wc=
X-Google-Smtp-Source: ABdhPJwNmb5CLJkrtrJvYyjtqY1LRirngqPgqUNRGYXV+tkZmmmRO1HN1TdmGtt0k3LRJ6c2lALRaQ==
X-Received: by 2002:a7b:c94f:: with SMTP id i15mr3892023wml.79.1640112302147;
        Tue, 21 Dec 2021 10:45:02 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id n8sm20269308wri.47.2021.12.21.10.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 10:45:01 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Iurii Zaikin <yzaikin@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Xiaoming Ni <nixiaoming@huawei.com>,
	linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH][next] kernel/sysctl.c: remove unused variable ten_thousand
Date: Tue, 21 Dec 2021 18:45:01 +0000
Message-Id: <20211221184501.574670-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The const variable ten_thousand is not used, it is redundant and can
be removed.

Cleans up clang warning:
kernel/sysctl.c:99:18: warning: unused variable 'ten_thousand' [-Wunused-const-variable]
static const int ten_thousand = 10000;

Fixes: c26da54dc8ca ("printk: move printk sysctl to printk/sysctl.c")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 kernel/sysctl.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 7f07b058b180..ace130de4a17 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -95,9 +95,6 @@
 
 /* Constants used for minimum and  maximum */
 
-#ifdef CONFIG_PRINTK
-static const int ten_thousand = 10000;
-#endif
 #ifdef CONFIG_PERF_EVENTS
 static const int six_hundred_forty_kb = 640 * 1024;
 #endif
-- 
2.33.1

