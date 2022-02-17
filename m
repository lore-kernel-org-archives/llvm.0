Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FAD3D9E
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 14:21:43 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id p9so7668912ejd.6
        for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 06:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pszNuayq3uAwPjpzq/uwyInszVpNCtaI4non2ruEen8=;
        b=EzWUOMPttCGG5Yg3G3nXzK6cU6fkvWMUdfJ1CNKVYIofnQ8MBABhzHGcjpeaFGveKU
         1OJ87QrSEX1uuPUc7BJfeIXXIytBzZXFv4LINWFVY4q0nOBh21i+Dm+TNrqGBcP6ILHL
         RYij2xEsD4K9kfiKIPn1kgvc5FXRqQJe3rsjuiXcLRwTgOEY8S7C5EP47XiYxycZvsQX
         tsBHRGZih1VxQ8SDY14SgZdLKxYb6uPxBy9oA9ytoZh6iBNdvdycVP8Shj7JdvFwV3aL
         UaZfCHoIRd/1OXv2XTyFj0JQvyUlRQ2nvRshbjkDNpVEAMTxb0OOkGByWao2Bj/kbnqT
         ErnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pszNuayq3uAwPjpzq/uwyInszVpNCtaI4non2ruEen8=;
        b=Q42ANYuHwCDW4bkWVhKThkjAp52PDMjxoBh54O3b4CPjb70ErK9MsBUEoR9GJlPQdr
         xsZazu9Ie1XhB5L57W7ob65yUKRe8c0R31G0i55tdFolhMDyOa6pK5AGXp7oNP9oYXcF
         ETPBxjfv3elaJJZ+Mv9np+RRFkOgB2OYnk3p6VZ5IhXkBJv5RkLM3jsPzL4Xr+mzOu/o
         5gDWjM2eSUxkEgatg80YokStnTA/oKKAw7tLaED0cH9pJTQ8T03J+02I2EmrKvaPDcx7
         HbJMs1KMhEYlrGM0B2hpncAHrBSvI4gViIoYaTbyJ0SFPmWmz2tE77tyKiJ+6HGQH3vp
         JAqw==
X-Gm-Message-State: AOAM530MNBdqDcvdSd/hU0nmsnx4GMfGuYMWBggWiLsEmp9zT8AH5yo0
	H5PCkgjmvaPjmfcgV2ni4y0=
X-Google-Smtp-Source: ABdhPJwa0W7mI8nYQ7LIYGYeZKKRoW7ww/i5hwmuOBPRPmWmW0gWn5Vc8PxZZvea3wi00KlNvupvhQ==
X-Received: by 2002:a17:906:c08a:b0:6ce:36f8:bfe8 with SMTP id f10-20020a170906c08a00b006ce36f8bfe8mr2553503ejz.52.1645107701726;
        Thu, 17 Feb 2022 06:21:41 -0800 (PST)
Received: from debianHome.localdomain (dynamic-077-001-066-240.77.1.pool.telefonica.de. [77.1.66.240])
        by smtp.gmail.com with ESMTPSA id a13sm578436edn.25.2022.02.17.06.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 06:21:41 -0800 (PST)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To: selinux@vger.kernel.org
Cc: Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Austin Kim <austin.kim@lge.com>,
	Kees Cook <keescook@chromium.org>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 2/5] selinux: use correct type for context length
Date: Thu, 17 Feb 2022 15:21:25 +0100
Message-Id: <20220217142133.72205-1-cgzones@googlemail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

security_sid_to_context() expects a pointer to an u32 as the address
where to store the length of the computed context.

Reported by sparse:

    security/selinux/xfrm.c:359:39: warning: incorrect type in argument 4 (different signedness)
    security/selinux/xfrm.c:359:39:    expected unsigned int [usertype] *scontext_len
    security/selinux/xfrm.c:359:39:    got int *

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 security/selinux/xfrm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/selinux/xfrm.c b/security/selinux/xfrm.c
index 90697317895f..c576832febc6 100644
--- a/security/selinux/xfrm.c
+++ b/security/selinux/xfrm.c
@@ -347,7 +347,7 @@ int selinux_xfrm_state_alloc_acquire(struct xfrm_state *x,
 	int rc;
 	struct xfrm_sec_ctx *ctx;
 	char *ctx_str = NULL;
-	int str_len;
+	u32 str_len;
 
 	if (!polsec)
 		return 0;
-- 
2.35.1

