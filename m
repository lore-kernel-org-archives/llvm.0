Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F180A2C9D
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 00:30:35 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id z14-20020a17090ab10e00b001b6175d4040so5161043pjq.0
        for <llvm@lists.linux.dev>; Tue, 01 Feb 2022 16:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bebo5VtQ+fBGReGGI7tcyPsOFW4PGB+odxeVjPqXpcE=;
        b=TyrTR/b+cZDYjKhYpjOptxXGYc5aM6WnQWw5RNUNO6D0RLZ/BxLdeCuea7PAr02Lsm
         rE9WBgDtTo4EEQfHKZqWpbfruZW4RKTYGA4vl+gwLcTwm7RfM1uLJXfq1C3tM/xOCic2
         gOnc5ugpiu1aSgNY0nZV0dRDWXGjEzZZbnn3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bebo5VtQ+fBGReGGI7tcyPsOFW4PGB+odxeVjPqXpcE=;
        b=aAq2jsgpNgnAZy6ME0kOpxjBJsqwtY42Rq2p3lAqj1Jj7MOE867FNS5+MCrLXmq4GU
         6S+vtr0z5iU+kr7Tthu+Ohe3u+VuscX8lbk5L49Fv/Tc0QrGVd4pkoiXwTZQNsL98lsa
         xu6zVxGmOdlr8juHkP/lmYnXbJ36cnsS+IWz59BwucL6cH2m/NpilUcjwL7UR+0dlAVL
         3Hcc04WEMv+aa2oqK0Wdz/1RZC1F3RRW11y0FlsOqO1CGSXXroj9WWvZbc2xUpM0ysOy
         mtaJJ6Kv7eCeie9QlTIRme2cWu3TEN1pEVLI2OsSNOAFpRmBbEic6vyM7d58F/Y/ySXF
         ifTg==
X-Gm-Message-State: AOAM533F9RDMSaVsxXCFHRgT/HfShHNRhonPrJjx/MCiHJHgE1zg5fuU
	RJ9UDOsNjgI0mCzfKvD3ktGI5g==
X-Google-Smtp-Source: ABdhPJxGEf8Hi1nqHyOPmLF51OkWLjdfrfUdnvtD357ppDinjvMOloNg8yKcdCKks505YcVAQojr4Q==
X-Received: by 2002:a17:902:da92:: with SMTP id j18mr28237959plx.127.1643761835524;
        Tue, 01 Feb 2022 16:30:35 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a6sm32210500pgq.62.2022.02.01.16.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 16:30:34 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev,
	George Burgess IV <gbiv@google.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH 2/4] Compiler Attributes: Add __overloadable
Date: Tue,  1 Feb 2022 16:30:31 -0800
Message-Id: <20220202003033.704951-3-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202003033.704951-1-keescook@chromium.org>
References: <20220202003033.704951-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362; h=from:subject; bh=kPhaiMRcRcpe1F0B+vNrSNLRWFcSehODtiMdmi/QMtI=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBh+dCoVkMB/8+aU6DxpDuQAyvQOXwOty/i33WS1w9L GmB4MquJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYfnQqAAKCRCJcvTf3G3AJlxVD/ 0R4klSKDS5K9GW522csvbV4mzUi4w8/kRpEsomBw+LukBZcXh1nDTrWutvawH9QQhZSDDEqPTt3jss QxCdMQwEXg6imUgnDLVDxC2lOZde2FG5VH1LLMPlPRKUa66kg3unwFDn3tXGKgknX+Az/mcyGADJGk w9gc7pQMS3KpxNJXYQ4acQrYkEvWJ7hztQyYrxgghEDMoFqyxe3q0jf2e4SDKzLL0J5iByXng93YXO KJ2Ul5UMv4vyA4OrEnrM7nnvM4CRyolRK2aJQli74CvghDNLe1D8wQ/XT8yGZ4jLxSvKdenneNpDvm kGEQvdYaTjV6AwUf29bFjAOgT0nynF6GhK7/ovHS5JYiBpCc0BVgbYO8W74IaL1kUZg5ItcfZ/Lk2u ncAcW8ZDqg/0Q4NXZMOOtpFp9YHy0RSElxNs7CO+esY+Aau3u4SASvMcQ/MY8+WL0FJWH1JypgnLS6 IpcH7s4RR5WACyYKb5LDFTSg0h97WWyYS+FNkuKDIVFw+MlDThzh2+U29sK0zAq0ie5ehUsrj1Ktma OzFV4fzB8xeGqogcGpVHh5BVQRTX0/LzggFoBP1cuAspjAIBCr0qnrqr+YWHLyADbg4xS6GZSA8AzH qWuXmAGO7jNzyJJleoSO3aZwo+O9ezs/5p2ur6xSbH4V6DSl//IitFElhHnQ==
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
 include/linux/compiler_attributes.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index cc751e0770f5..51e063347fd6 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -257,6 +257,15 @@
  */
 #define __noreturn                      __attribute__((__noreturn__))
 
+/*
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

