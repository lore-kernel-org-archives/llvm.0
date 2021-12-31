Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EAD168
	for <llvm@lists.linux.dev>; Fri, 31 Dec 2021 10:08:41 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id t66so13324144qkb.4
        for <llvm@lists.linux.dev>; Fri, 31 Dec 2021 02:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NsDwqT0a3hNUqKU4v2jYJjLM/HyV4fz8C5Jr5vH1eWo=;
        b=WJqufZUIJMz/Ry44a5f4Vh2iqhbRm/tjNVoVB3JqvyZqgcEFRSPUaU3pSY41xYZ9p+
         H2v6mKUUJX4H3k/al0FByWFFUjLX/uz+l93KdsQlpLvYrcgbzE2Gj3+ZoyCV17nN2qq3
         YBhqiW1MOTmz/VgAYS9GIJoan5gH4nn2spUdSA0YDD3w1p6dXLN1Wlvd3YDePKdvk8PD
         CPK3PscZropAbdWapioydQR/RZCSopeh+7PqyjjJ60JDXtZpOSV7insKfCuREGQ0Eiqt
         FfPFNme/UsL6vIWcv6/6AX7pjRbc/H/YVb6nkVx1LJ5geqZZHEHV5Nx0M/p0U//cOL3J
         DfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NsDwqT0a3hNUqKU4v2jYJjLM/HyV4fz8C5Jr5vH1eWo=;
        b=SqkNKOWB47AiaUc5ymXilAog5aViDFejDcYP7P3TJto1uHmQQyo7CXkrVF7fPayUlu
         NHhZmMrLYdel46GMrAEIXPpXVJ86KS1pofCziOD0VSzm6bTnaDGJLN0C7vEgk68WgHSX
         MvcJsNhXtBQfng4ol06vfAXDNYLML9qREBurQnUzXR8Pl9wzDle4tYL+PdFR/YZCHplw
         t40a1Rf2qSp6rK2EHQWKcHTEFHZSRhW1698dz9vciyMrXAUOAwtfN8nKuWq+7rsRNyDq
         tk0/jZRHrGtmY5thMA8IT9z5VFXJwQ0VewZPmUbabJvDz2QMgvy3zJo8ygcL46WgOsZU
         UwxA==
X-Gm-Message-State: AOAM532travkUuSazSB/YihX3zX1g12bzoj1QLid1TFRWBfyKQwB7FlM
	VXngLNRsvro77YE1lFCX7YA=
X-Google-Smtp-Source: ABdhPJwqwBpqbNnDAckOs9aKDylSND0AV7nkWJTx0l3kxiwOckUL6CQ2uGdgLEMgLLxNkRSWgQqObg==
X-Received: by 2002:ae9:efd6:: with SMTP id d205mr21576547qkg.380.1640945321058;
        Fri, 31 Dec 2021 02:08:41 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id b2sm20457789qtq.95.2021.12.31.02.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 02:08:40 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: xu.xin16@zte.com.cn
To: nathan@kernel.org,
	ndesaulniers@google.com,
	keescook@chromium.org
Cc: wang.yong12@zte.com.cn,
	xu.xin16@zte.com.cn,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] tools: compiler-gcc.h::Keep compatible with non-clang compilers.
Date: Fri, 31 Dec 2021 10:08:33 +0000
Message-Id: <20211231100833.590691-1-xu.xin16@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: xu xin <xu.xin16@zte.com.cn>

When HOSTC = gcc (GCC) 4.8.5, there is an error occurring as follows:
error: Undefined __has_attribute.

This problem is introduced by commit d0ee23f9d78be ("tools:
compiler-gcc.h: Guard error attribute use with __has_attribute").

To solve it, this patch is given to keep the comatibility.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Co-developed-by: wangyong <wang.yong12@zte.com.cn>
Signed-off-by: xu xin <xu.xin16@zte.com.cn>
---
 tools/include/linux/compiler-gcc.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/include/linux/compiler-gcc.h b/tools/include/linux/compiler-gcc.h
index 8816f06fc6c7..7da593d3cb91 100644
--- a/tools/include/linux/compiler-gcc.h
+++ b/tools/include/linux/compiler-gcc.h
@@ -16,6 +16,11 @@
 # define __fallthrough __attribute__ ((fallthrough))
 #endif
 
+
+#ifndef __has_attribute
+# define __has_attribute(x) 0  /* Compatibility with non-clang compilers. */
+#endif
+
 #if __has_attribute(__error__)
 # define __compiletime_error(message) __attribute__((error(message)))
 #endif
-- 
2.25.1

