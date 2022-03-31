Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC68A2D
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 17:34:28 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id p15so412796lfk.8
        for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 10:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OpzNliID3SJF8mkL/R1m7B3GbTTnCU3xmaYQk4hdJxg=;
        b=Pl95tPuGINI7Ed7WbqIptzsgtmRRQbUsGEtp9dMBKwEBSIwDIove4HWr5DpFu7vfXx
         oO2YFuze6ZGyVwAu2qcJ9fgrnv2zisG/87YCdBNaIiK0mIgvpJOvLxDReMSMWERJJGk5
         WwUk0GZdC75yn3t3TLAZn7qLQQ+ezDcmwD2Mk/FsMad7E8+DggD/NcDyIuszN00SmtWy
         5fcEGwsArRcMK00cwXnN9L/uY5KzUkBj5EF3WWw0jCK+HEuNabBOUJ7tru2XnGblfUUE
         Qw++XWD0i0qhhwsvzDQ/f2RNM9JxsvkZUIOjYFNCppPnNF90Ofgj5RC/wJW+phKS6NNJ
         lAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OpzNliID3SJF8mkL/R1m7B3GbTTnCU3xmaYQk4hdJxg=;
        b=5tMkwmm91LvQdCtMNjSULNOLnho7IZa4SnBsjJ+HSCzfwZlKaCHbJWMydP43yFEOBY
         12i6y6zGK8jAyty7olTj4afo8mj8mzd12bs67QZG++2V7jxOwsqOqyGmoZWf1ywllDnP
         kDww+Pe1PokWbjKVumOPIahEWoKe7VeIS1RtislNCHfuXUECE27pDYpeYS8bpspHXkei
         wgWozlk6lqRBg6CEf3KrAqxhniySOi3xniHRs9EnaC8VpMiIcRgdqeDHOnIv+rV2PsBv
         J/LnYctPCX7x4ItVIfZYN7JCyh9VvY+WaFUJh5btIGOIjjZJROFqa19CPZSwpo/7xY0o
         +alg==
X-Gm-Message-State: AOAM531Ja6Om3HPuIZLuajCi9GAU7fO6kmNvbZF1MmoRHD4X2P9Fo6Z+
	pjKp/ndvV5RqznrmIP+jxXo=
X-Google-Smtp-Source: ABdhPJwvcR9wHiqOmhQFqud1XOa3bbZXUQW8k2EYkMf0A9J27rV9+c1UMmS4a0LkEtiixFx9fssazw==
X-Received: by 2002:a05:6512:3082:b0:44a:6dc3:3 with SMTP id z2-20020a056512308200b0044a6dc30003mr11237952lfd.663.1648748067209;
        Thu, 31 Mar 2022 10:34:27 -0700 (PDT)
Received: from morzel-asus.lan (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id bd10-20020a05651c168a00b00247fe29d83csm2746992ljb.73.2022.03.31.10.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 10:34:26 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: Mimi Zohar <zohar@linux.ibm.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Michal Orzel <michalorzel.eng@gmail.com>,
	linux-integrity@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 2/5] integrity: Remove redundant assignments
Date: Thu, 31 Mar 2022 19:33:55 +0200
Message-Id: <20220331173358.40939-2-michalorzel.eng@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331173358.40939-1-michalorzel.eng@gmail.com>
References: <20220331173358.40939-1-michalorzel.eng@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of redundant assignments which end up in values not being
read either because they are overwritten or the function ends.

Reported by clang-tidy [deadcode.DeadStores]

Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
---
 security/integrity/ima/ima_main.c   | 2 +-
 security/integrity/ima/ima_modsig.c | 2 +-
 security/integrity/ima/ima_policy.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
index 3d3f8c5c502b..1aebf63ad7a6 100644
--- a/security/integrity/ima/ima_main.c
+++ b/security/integrity/ima/ima_main.c
@@ -432,7 +432,7 @@ int ima_file_mmap(struct file *file, unsigned long prot)
 int ima_file_mprotect(struct vm_area_struct *vma, unsigned long prot)
 {
 	struct ima_template_desc *template = NULL;
-	struct file *file = vma->vm_file;
+	struct file *file;
 	char filename[NAME_MAX];
 	char *pathbuf = NULL;
 	const char *pathname = NULL;
diff --git a/security/integrity/ima/ima_modsig.c b/security/integrity/ima/ima_modsig.c
index fb25723c65bc..2c9d451d6326 100644
--- a/security/integrity/ima/ima_modsig.c
+++ b/security/integrity/ima/ima_modsig.c
@@ -109,7 +109,7 @@ void ima_collect_modsig(struct modsig *modsig, const void *buf, loff_t size)
 		return;
 
 	/* Ask the PKCS7 code to calculate the file hash. */
-	rc = pkcs7_get_digest(modsig->pkcs7_msg, &modsig->digest,
+	pkcs7_get_digest(modsig->pkcs7_msg, &modsig->digest,
 			      &modsig->digest_size, &modsig->hash_algo);
 }
 
diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
index eea6e92500b8..c328c2266092 100644
--- a/security/integrity/ima/ima_policy.c
+++ b/security/integrity/ima/ima_policy.c
@@ -869,7 +869,7 @@ static int __init ima_init_arch_policy(void)
 		char rule[255];
 		int result;
 
-		result = strscpy(rule, *rules, sizeof(rule));
+		strscpy(rule, *rules, sizeof(rule));
 
 		INIT_LIST_HEAD(&arch_policy_entry[i].list);
 		result = ima_parse_rule(rule, &arch_policy_entry[i]);
-- 
2.25.1

