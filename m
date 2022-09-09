Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCEC65A
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 07:38:52 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id nb19-20020a1709071c9300b0074151953770so575434ejc.21
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 00:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=ZgjuXiR7GOoWQwHIqm/Zq+w7cYIxur6W3viv+dY7RH8=;
        b=j+UIMYBTztIdEddAyQiLGMbyZseB1O22pSgIKiq3dObuMbk/LL18hQYw2XnwhChEno
         njdoU+3QMR7gbmgwGyVpo44ABifiMAXrO2NcXAV20tvaK2to9ta9VgLe7oqbevNVn+My
         CY1IKSTmC7bwqSToFhdGidMuTizf0IuFctMiiQ22E0ixlDDbZuVt102UdCmuTQUeDRA1
         naSl15bd2TUlgku+q5RdYvuyrx7QEZPOGsl+hbf2M6OGLfZUQW6IlzJV9y38f0cRr33g
         JcMkGIiKLKS00KTmIczkcO+n7iSbzJfAOyzGap2cwppwbotjo7CBfOlAK5w52TOPfKwb
         MWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=ZgjuXiR7GOoWQwHIqm/Zq+w7cYIxur6W3viv+dY7RH8=;
        b=VZkxoZ0fnqNsoMVunfIwYK0QqlePkQrCy52y3pMUgEJxD/Kc6dOpSTRaqDlXKmp2Oj
         ONwKapX8RC3HfuYWqaHyalpRqeu3AdY20J0v5z+n5Afl67/30FtAmJtPWXXLkujJOTG6
         cgFo53AtKF18b3Z/iOyGScOqtkQlDl+VseccvPx27On7xb3lsK4N6XEBV7g7PJR7vxRu
         y41eb7n/uETFGQ9SD+okoWudi/ZlRY06CIWDi2EiEDV0f8zWfswYPy8R84sKdCP2MKa/
         gnFpNxh1DXcc/8Tuq5NcaVzHsxXR7cwSAQidvJBK7Z6WKlGPGMkLw8uMBrkVbgiuIu4V
         WaPw==
X-Gm-Message-State: ACgBeo27+/43zFZGqabaoNoW5LykKHu1jK3hFfn/HuueHegEwl0aP03M
	WBq8VsQM2IjVxokFfoO1rlVFqwFhfw==
X-Google-Smtp-Source: AA6agR72lEybpcVa7cBjPW4pKXFE8r3tYkQb5/NC95gOTISnGkgRwU/Efuez6zfWhM70OFPhqME9JBdrGw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:1d1e:ddcd:2020:36c2])
 (user=elver job=sendgmr) by 2002:a05:6402:27cd:b0:44e:c4aa:5ff with SMTP id
 c13-20020a05640227cd00b0044ec4aa05ffmr10390086ede.193.1662709131149; Fri, 09
 Sep 2022 00:38:51 -0700 (PDT)
Date: Fri,  9 Sep 2022 09:38:38 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220909073840.45349-1-elver@google.com>
Subject: [PATCH v2 1/3] s390: Always declare __mem functions
From: Marco Elver <elver@google.com>
To: elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Like other architectures, always declare __mem*() functions if the
architecture defines __HAVE_ARCH_MEM*.

For example, this is required by sanitizer runtimes to unambiguously
refer to the arch versions of the mem-functions, and the compiler not
attempting any "optimizations" such as replacing the calls with builtins
(which may later be inlined etc.).

Signed-off-by: Marco Elver <elver@google.com>
---
v2:
* New patch.
---
 arch/s390/include/asm/string.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/s390/include/asm/string.h b/arch/s390/include/asm/string.h
index 3fae93ddb322..2c3c48d526b9 100644
--- a/arch/s390/include/asm/string.h
+++ b/arch/s390/include/asm/string.h
@@ -20,8 +20,11 @@
 #define __HAVE_ARCH_MEMSET64	/* arch function */
 
 void *memcpy(void *dest, const void *src, size_t n);
+void *__memcpy(void *dest, const void *src, size_t n);
 void *memset(void *s, int c, size_t n);
+void *__memset(void *s, int c, size_t n);
 void *memmove(void *dest, const void *src, size_t n);
+void *__memmove(void *dest, const void *src, size_t n);
 
 #ifndef CONFIG_KASAN
 #define __HAVE_ARCH_MEMCHR	/* inline & arch function */
@@ -55,10 +58,6 @@ char *strstr(const char *s1, const char *s2);
 
 #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
 
-extern void *__memcpy(void *dest, const void *src, size_t n);
-extern void *__memset(void *s, int c, size_t n);
-extern void *__memmove(void *dest, const void *src, size_t n);
-
 /*
  * For files that are not instrumented (e.g. mm/slub.c) we
  * should use not instrumented version of mem* functions.
-- 
2.37.2.789.g6183377224-goog

