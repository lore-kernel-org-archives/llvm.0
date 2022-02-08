Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B551A2C9D
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 22:53:52 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id z13so1052334pfa.3
        for <llvm@lists.linux.dev>; Tue, 08 Feb 2022 14:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TWuBBZh2D0kGph/0EnqhwxL8jJUMLsx8wV62pCVDmZE=;
        b=apbBiBy9AWrHOggMW6R6axGZST2zCbKuMgkkIFWgOz1oK1oeUG7PU7xS7o589NzOV3
         RzF7qe8Robis5oERDph8tC7pEzzx2NlFoKkQhabOccpW5meN/tvRDgoVtLtIys4+uLY5
         bjJREQeIcvwoO+pYP9YFDse/JAViTZDXGrJ0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TWuBBZh2D0kGph/0EnqhwxL8jJUMLsx8wV62pCVDmZE=;
        b=HgNW24EsKQPYwASMpTrotCb3qQLGivgu8YS/kUh5nFYQl+GVr0HP+Up6m64r93KzdT
         mhxcqAu9BwT/U+foxujW7bAo+NN19HXTbmxqlmGpLE28T3PhuiHbdQVqnmyfyV01O8MZ
         JKO599WBJvHI0WmSI1QFgfFfmIZxaGXHuDqW3/ixGk0wO5ifenH5QeWYFjA4X8Z7OtV+
         urXrEnTb63wE+Wr7xOt8Rxl19hUNUnu1ZoQrGCl8HXQn60BpF7f1mWlK3LPtWy7D0zsQ
         Wc91bD2A3dyc2ZOESMZOSznCyKTR4Mn/s04wRraDwwwo1fOhYZUtgcYVoP2z2+CKQeOx
         n91g==
X-Gm-Message-State: AOAM5311z9L7f1W3hYEYhdb8iedOX2uX6ZbjdafMvFpxvgMZKlU/ye7d
	Re9M2M7pxJXuGZFlaM7u5dhDZw==
X-Google-Smtp-Source: ABdhPJw7GxdGnGnxj0CXoo0e4z0hTO5tiNDoxcc7fyV8/xo2mDlhD8VTmkYAYRThYS8osOiqzc1Rlg==
X-Received: by 2002:a65:550a:: with SMTP id f10mr5434181pgr.204.1644360832227;
        Tue, 08 Feb 2022 14:53:52 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id mi18sm3304156pjb.35.2022.02.08.14.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 14:53:51 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	George Burgess IV <gbiv@google.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v7 3/8] Compiler Attributes: Add __overloadable for Clang
Date: Tue,  8 Feb 2022 14:53:45 -0800
Message-Id: <20220208225350.1331628-4-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220208225350.1331628-1-keescook@chromium.org>
References: <20220208225350.1331628-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518; h=from:subject; bh=l6UvTPRMJNYF2xW3l9gjpmVi+gZHmJuispURJkerkUk=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBiAvR87AAruZSfd0UK+qa8UyR7X8DXxThgrvDYYjhi UiOBgTCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYgL0fAAKCRCJcvTf3G3AJv7SD/ 4t4f9fnUWdK7alIRT5SUzIciYjfn64rlJbPePJi0xAA9ZbdmMJ9N7LPhJlAlxmyzW28hRCAiq3F9qp +MeE+w2Yyt8H028YaykeiK2hF8uy3Fa+XKpv78mU3QXIUzE+LzxjJd9Nvn1+GQZSc/jF86/6+rFLWp 617XKJtg5voAQh6UtSfV46zS2nWsHiEibmhNPhsQjOeEY7++txe6layB5kNUrx6X+W4zyPWfXIe4DQ fkcd2KKnVM75QwqxPSVC2gdw3kNWuY69BCt1sGa6S0oTEgH0aEpu2xaoXh3xDuPGh1/p3nOr/SLT4t bLy4UC/7RV3hwll9c7Ma6AMuUECCb3NmuZUf2Dker0MpvnE4Eq0NSvzBmZQIbhjTnh3zpgJ62zCc5X UFKninZk83cYgp92mWtl1Su+7hKMxPObVCgQWQyefFi0KQ2Vn1f1d9z0fzMmoCQ6Vcknk/A9Nchr7P CQLNHYj78rncFbrJIFaJQbUArBFBmuDvJcr2vlhGQi0jhaZGmztnDr3DuPivCgOBaFI2CBjrDvK1/q O7LrJhMwaO4orNU+ojHaKIcF+ZqQP4nhPUyaDxIs2wVwCnB2uyJ5FvrhU3gBXkuhQVMF/08rMDLV7P 8gjpkaFaYAjg4bfX2lNmF8hfmYGoIdwC9kGpH72kxS4edDknkgk1+ZjuMPBA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In order for FORTIFY_SOURCE to use __pass_object_size on an "extern
inline" function, as all the fortified string functions are, the functions
must be marked as being overloadable (i.e. different prototypes due
to the implicitly injected object size arguments). This allows the
__pass_object_size versions to take precedence.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev
Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/compiler_attributes.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index d0c503772061..dcaf55f5d1ae 100644
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

