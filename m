Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9376E2C80
	for <llvm@lists.linux.dev>; Sun,  2 Jan 2022 12:02:10 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id h5so28512431qvh.8
        for <llvm@lists.linux.dev>; Sun, 02 Jan 2022 04:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=giNV2075gDEg5+v4iNG0NypwhzHYGunkPAo5/HPLi/w=;
        b=YpOicduLSBimY9O7Jc0BEMhHhyUhGg0R1wQ9uWjr9kv9cpxpuKGJxd7DtidWPx1+u8
         0bkKI/KZxWn7Tus+Skjlbv0OqxazGWHbq0iGxV5NsJFBnZ7l8lSbKO7CcIfy5v6IXVyI
         eDUZu6sy+42jqlZKZrWMUM4EHeYDZH6mDfy++KraEmOQka0OVFGspJkxSU30d4HuWVc/
         4/nPa1d8TXltLgjb+8kVyfzeL2Dm1VsBcXq0emwb+GU1nECEg/2Zv2FY9UqgUAWsAWl4
         EXjdFeSQKLv/seKMZbgtoV6V3ea4/al893kSrzOxIkap2F6AnNn7eZhLK88qJlri9AUs
         Zigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=giNV2075gDEg5+v4iNG0NypwhzHYGunkPAo5/HPLi/w=;
        b=CUskdFXW0AKrjaxd4fCHbCzjBtmSX5mb4M+Hgp/leWWEebBjg5IbM7aViXurz7gNdg
         eSnT55VvjwN0jaKKpgVUL2bqiVFLZ9TTETBTm7iMEXQyChTzLoYYHiFOHZhhUED54hPZ
         PMqZ+tdazJSPYQH1Rqmz8CIeYyTPF89JylD1avSyEwgXKqOP3xtye/O/fD3nQKTSJZD+
         EkHptXK0xgle3yAD9qJEPAtcDcNlGoKz3QB/mRbJszMlL1jQQNzrUANCqdOx2HmLFuop
         kCmPzBwdKMqPVDGTW1guI1L6GWKSHOF+U5hNYczfeBvAP0eGskE9Ce/OsREdTMW9jxdX
         moqw==
X-Gm-Message-State: AOAM532WI4qKNUBNVzH0Dr0FrUoqYpjmOW+K6O0OKdCTwFqoAIznlzdO
	EZetDljr1YMGg6/yUwfZXVY=
X-Google-Smtp-Source: ABdhPJyrZ/HeawXYxDPqeibxcFyfxrth+Ezl/N8Mr/HYaaUEE8cBMWowC9DIKfOrb1iGoIc1Cs4ecQ==
X-Received: by 2002:ad4:5bc3:: with SMTP id t3mr38168464qvt.47.1641124929530;
        Sun, 02 Jan 2022 04:02:09 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id h3sm25758323qko.78.2022.01.02.04.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 04:02:08 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: xu.xin16@zte.com.cn
To: torvalds@linux-foundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	keescook@chromium.org
Cc: wang.yong12@zte.com.cn,
	xu.xin16@zte.com.cn,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] tools: compiler-gcc.h: Keep compatible with older GCC versions
Date: Sun,  2 Jan 2022 12:02:01 +0000
Message-Id: <20220102120201.594408-1-xu.xin16@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: xu xin <xu.xin16@zte.com.cn>

When HOST CC = gcc (GCC) 4.8.5, we found that there is an error occurring:
Undefined __has_attribute as we built the whole kernel and tools.

To solve this, this patch is given to keep the compatibility with older
GCC versions.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Co-developed-by: wangyong <wang.yong12@zte.com.cn>
Signed-off-by: xu xin <xu.xin16@zte.com.cn>
---
 tools/include/linux/compiler-gcc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/include/linux/compiler-gcc.h b/tools/include/linux/compiler-gcc.h
index 8816f06fc6c7..333ed16b3b12 100644
--- a/tools/include/linux/compiler-gcc.h
+++ b/tools/include/linux/compiler-gcc.h
@@ -16,6 +16,10 @@
 # define __fallthrough __attribute__ ((fallthrough))
 #endif
 
+#ifndef __has_attribute
+# define __has_attribute(x) 0  /* Compatibility with GCC versions < 5.x */
+#endif
+
 #if __has_attribute(__error__)
 # define __compiletime_error(message) __attribute__((error(message)))
 #endif
-- 
2.25.1

