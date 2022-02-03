Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13EC2F2B
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 17:33:09 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id s61-20020a17090a69c300b001b4d0427ea2so10672986pjj.4
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 09:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+zBssxH/WxmaUO1sr/ghPwh4fL8f/bXW9MZNrOKPr/w=;
        b=oHqJMzOtTUhUby05qTiPD+GwE2p690AUteZEv8NOXiqzXdXNe9W7NYPJF7Fdhhy0d6
         HrbpsdReZ8syYLPk1n7PqQX0GrdwxvuhtNFpIWiQQ8VoJYKpVRr/YxdoyGUpZA17rTWO
         x1c2kkxyfTcGDUI6iBxO9lRGNTqe/95y+6LxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+zBssxH/WxmaUO1sr/ghPwh4fL8f/bXW9MZNrOKPr/w=;
        b=1cXY4hRV7sezw53t+kYmxya7WidGl82JeE5mKK/tGbsEfuup5U+3zm0eV3StEX9dDc
         QsCluJC1CA2aqdy4tVkna9D435ONfUmgUVT4pCemkcGZILbescqqg6wjF4puGHfhGUB4
         Z39BgruHGZnLcRuKvTnFep4U70GfXAu/hVVQZaFBYhH9FWnwtF7oiqqcjvXdFpfJdvfE
         /rpgZdGpol3oedzZ0uHiBiDXip+vc5v8cYLmzif4vlrorJ2bN14QhRN39yEjm7ejuhLC
         n1lMHJnvj7UAVc9o3aZ/czbgN+6AyuS/oX2T8QH+3W2at/N0nhPjq1Masgz50ysp8f66
         pioA==
X-Gm-Message-State: AOAM531IFHAHQzIm1eq4FKi8Y9OOS0knAM8hdDAsI45FnK9yh/HbeFUF
	8VhuYwItJiDB2XIwdp9s9mpNTw==
X-Google-Smtp-Source: ABdhPJwZxP5UEfB4voCN4yq/C38B+fyMmytMwS4/oRagiqzmZRs0yri0Cci2rcPZ2J8Oe8mJzENBOQ==
X-Received: by 2002:a17:90a:290b:: with SMTP id g11mr15030650pjd.8.1643909589126;
        Thu, 03 Feb 2022 09:33:09 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u18sm29724557pfk.14.2022.02.03.09.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 09:33:08 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev,
	George Burgess IV <gbiv@google.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v6 2/4] Compiler Attributes: Add __overloadable for Clang
Date: Thu,  3 Feb 2022 09:33:05 -0800
Message-Id: <20220203173307.1033257-3-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220203173307.1033257-1-keescook@chromium.org>
References: <20220203173307.1033257-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446; h=from:subject; bh=KMIyemBEeogv0prZ4PjXHBrE0psPPqx5j7gZUW7T9OQ=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBh/BHSjKRmsjxgw96UF0ULSGoSRDajl4PKbrjZ5H1m qvM6GwuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYfwR0gAKCRCJcvTf3G3AJvp+EA CHifGQYlU/vyOgRTFiBUh2o2UcOBRzjmfvCANd+VySak7rvfpyLFYaD2b/KZR+bvpMIwxmKKRMVMgA bcOzv588jJFGqgeabG/ez2ppSc31+DZYscdVT16K5tdTMd56FsbYQWsIauZGy25an5pOe1vdX7qUdU 96CRYKYktuZCj8rLFsN/2ptyObfY0ZDMWx+oY+uT+eQJsk7QICGaycui8n7ZDF+umQ9bXi34Vmm5a0 iq48nXsnOXqWLSFXEfl23DrXjOWRxhf5IMrwX+7pHvxfE1IXC6oTk+t5Y/LqAirc5OqBEUY2kxS94Z 9nblGXGO3EDSh3DAFhTGUqNO/LdU3HuyFeVau3TSCgD2MFV/kePGim0QGn7NTrvbpclEcBDeV+T1cL uqNDvQsvJ2O6c25GtWehSZWPsb3Q5Sn7oW541ZBfAIUZtAz8tT+8AhYQY6rMcJr10BYH7euQgiYSeH j+rdQCt2ux5XL93GfgjCOaeXaEOT2dPN1hm+mcMJksEY1pG2ZoKsDvrZ2Fl+w0tofWJhPpsN6tbmrj 3yojOjQnE0K+C3p0otFZulTm2JsRe9FUxfV/c3Z0FAKDpaea3BE7TjonpuMsJ4HyockIjz+Fv8dJl5 0PPfQL56Ph+nm9i3dFsl0YbJgHJdaKyCmsevhv8YZEyzCZ8lSXCy6HO38Rxg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In order for FORTIFY_SOURCE to use __pass_object_size on an "inline
extern" function, as all the fortified string functions are, the functions
must be marked as being overloadable (i.e. different prototypes).
This allows the __pass_object_size versions to take precedence.

Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/compiler_attributes.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index 4ce370094e3a..dc3bf2a6e1c9 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -257,6 +257,18 @@
  */
 #define __noreturn                      __attribute__((__noreturn__))
 
+/*
+ * Optional: not supported by gcc.
+ * Optional: not supported by icc.
+ *
+ * clang: https://clang.llvm.org/docs/AttributeReference.html#overloadable
+ */
+#if __has_attribute(__overloadable__)
+# define __overloadable			__attribute__((__overloadable__))
+#else
+# define __overloadable
+#endif
+
 /*
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Type-Attributes.html#index-packed-type-attribute
  * clang: https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html#index-packed-variable-attribute
-- 
2.30.2

