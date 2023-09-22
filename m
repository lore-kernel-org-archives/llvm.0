Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408D444488
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:54:10 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6907e44665bso2255325b3a.1
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405249; x=1696010049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lczi2Cwwgxsbc7BUm+vtmTYjmzCLrPy7IPWzoMjHXsA=;
        b=fkgVvkypNapr2aPL8a5a6Sfis2ZopcXclfRi+A+cowFKQq6+BkBf+51kS3yp9V/lDA
         ea9LEFE7ynDfA6LTpeEL+0mnynvu4VqcdkCb6hr7jroYQ0qHvU0oGlfV7Myi/OZRTFgs
         wbB9J8vOc7TlVDuUzTp6EBINKtn0Adznv/fqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405249; x=1696010049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lczi2Cwwgxsbc7BUm+vtmTYjmzCLrPy7IPWzoMjHXsA=;
        b=guwuKIBm7cXQgzk6u/DoLcDC0Uut4CW0fBOkvJwUY1tARlcyL1KqfmyZ9aFIsXrNSt
         5ofXE2Zfpdaamvoft5ckjhS72EPBWq8pwuFGiNkLdpDWRI59JCkPiAiDBuhtgjXFoLZi
         uiVFmLA3OfykkkhLgnytWq7y1htGc8ousPcQJFp+9Q8fn3tUdH9fJc52TcuOiIabnKqu
         ftTTTUBP9Ibc5IOy1UO/gGugIAKNmFXvGYA2AvygA1x2puAXe4MCzpZxGybPrNx6ZUmy
         X7zkJYnMlW3knUayNEtmn6wt9TclAwtQGqGPksW4GClGeiywS/2U1PQzOyjQNXXWsepO
         EShQ==
X-Gm-Message-State: AOJu0YxYN4GIwkpZesl2vfZTYz6ZzAeGo3bp/wafkY61iYUtWYI/yJVF
	ysapVg2VdXSt3zaKxSIv1xOAiQ==
X-Google-Smtp-Source: AGHT+IHPOEfvzSqeKngrjgykEm0H7WgS4W6X29Dhf7MjjHQix/ksWTKhxaphtv4vvK0qiX09/owMvQ==
X-Received: by 2002:a05:6a20:1451:b0:154:a1e4:b676 with SMTP id a17-20020a056a20145100b00154a1e4b676mr388927pzi.4.1695405249724;
        Fri, 22 Sep 2023 10:54:09 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c7-20020a170903234700b001b86dd825e7sm3790470plh.108.2023.09.22.10.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:54:09 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Howells <dhowells@redhat.com>
Cc: Kees Cook <keescook@chromium.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Siddh Raman Pant <code@siddh.me>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Qian Cai <cai@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] watch_queue: Annotate struct watch_filter with __counted_by
Date: Fri, 22 Sep 2023 10:54:08 -0700
Message-Id: <20230922175407.work.754-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1413; i=keescook@chromium.org;
 h=from:subject:message-id; bh=PSX5a1GORIau6HOLEFzIyGta203teU7R+OIUQRXG3Fk=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdTAOP5KZ2dBsFnuwjohj6M1/RzR+kLr/9Sv4
 5Rswa1TpGqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UwAAKCRCJcvTf3G3A
 JpjmD/9Vb3G83w+T0Wm/a0TVUDR575aerkGd7NneXzI+vKqZgtBAYZPk4naeGlBK2uKaFHbFdNr
 SlqoyxinV0iOg0ptX+Gf5W0eUVcJqHwqh4U+/pI7awSyRoAD2ABO0dsfxVpZSAeuCGfVrjct9Gd
 oQ+ndS4eDOmS6ZxpR6h+Z2l3h9MOOkGxqkx8DKV5GXifL5ZKYk1RQx+Uf4TwSgxqAd3ZHr7UGPu
 adWMmlITuMSzYPZx2CjFXaTX7UFjgYcJcQapVcH2Ah9eaXyE0lC/0AP49hCh8s366nf9wv56ebv
 v2SJEjmzwpCIZc2Wu9YW0m/rnd4jaw+loDzAVlwtAPAB527kuAdKZU27cvyJtH/JNyqid8TeJ4H
 wrgLm6ee9sA1pRh24Os8dwG318HMDhFouCEcmd7+XwFdqkb9dLVQD2fn/vee7yQEyWiWeQJaU0+
 yXescem2+8Vs9UR/1cVXg1v8bR1Wh21oalTGmLEzaHfWS3z/VLCPEQa3xTFfV7SD3ecYcHspZkE
 BzzasVKk8/UV2sWMkkMcdLtsRRlEFXsArK+JO0XvTE0186H+K1uLjuymyQ0j5ivbPH/vDHqjA0D
 1tryEZISdYtCxgwBqkQ/b+wsleVx9W9rHiBpH7TO/BfVgU8Jp7qS6q62Die+z0XY/kghOQvxIes
 6+wRhxw owRe2EBA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct watch_filter.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: David Howells <dhowells@redhat.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Siddh Raman Pant <code@siddh.me>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Qian Cai <cai@redhat.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/watch_queue.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/watch_queue.h b/include/linux/watch_queue.h
index 45cd42f55d49..429c7b6afead 100644
--- a/include/linux/watch_queue.h
+++ b/include/linux/watch_queue.h
@@ -32,7 +32,7 @@ struct watch_filter {
 		DECLARE_BITMAP(type_filter, WATCH_TYPE__NR);
 	};
 	u32			nr_filters;	/* Number of filters */
-	struct watch_type_filter filters[];
+	struct watch_type_filter filters[] __counted_by(nr_filters);
 };
 
 struct watch_queue {
-- 
2.34.1

