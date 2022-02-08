Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A082C80
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 22:53:52 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id n32so969026pfv.11
        for <llvm@lists.linux.dev>; Tue, 08 Feb 2022 14:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cQMwXqlDPSXD5WcTL3esNOpDqscVXLIQFDsHDlsLA6s=;
        b=I7DYO0+aevF5VNc7lv6kik71OWvQgcQNZ8zVQtSbj5ylPTl774t0T5TzMtC8W+xc5a
         G4V4PntNj6Wx//xFTtpnlKptTcgc6sVfB8LfdDkC0cNxX3M4aW4wQMC9A4bNoYOEYM2P
         1lHHM0tCCK7nqJYtjXvIGjtcKV/o6fC9kvJcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cQMwXqlDPSXD5WcTL3esNOpDqscVXLIQFDsHDlsLA6s=;
        b=yeRj4JKCKDO6287l+wAccEwGyHgFNLGljNQJQUjmgnDpidCs6QRRJ0hKqG93paX4Ur
         5/bA8EBR1H9L7tWhr5LPYK6JQI2QxMrnSIwyZjGeYv3w0tdCbuqsV5Ti8RNh8HiKp4LX
         rpVT5a41zQGqqLB5zWs4bRFdHaj9HUfOsvPwrdIPy8+COURezjWuWBcHyO78rJpBL0fh
         E8zTwMnWH/j1UELP+qi3Dtdzx7nHwAGd+lbXX5gXVLnwK2SjWDT5C9T7EBcln3OiC2L7
         c7wftxl/nS5E0Mxwdjc57afLHBK7V75pYowbo5lqKda+eK2BwXelWvrSTPyeAqfJpoGP
         HHsg==
X-Gm-Message-State: AOAM531m6oR8TQp7ErvXlMI0ZoyCXNW2fIOP/CctWUFGkBrWKKpT4EtN
	VsUZT1LQIuQ/Y6NzEewCxSgcjw==
X-Google-Smtp-Source: ABdhPJyYhpQYVGMNJXYXnSxOERPvWyclLewnhUUMAxAOZuJ7tLHin//i/EiDuxPbUhpcU0GU9RuCSA==
X-Received: by 2002:a63:2322:: with SMTP id j34mr3073107pgj.583.1644360832076;
        Tue, 08 Feb 2022 14:53:52 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id mj21sm3798910pjb.20.2022.02.08.14.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 14:53:51 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Kees Cook <keescook@chromium.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,
	George Burgess IV <gbiv@google.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v7 2/8] Compiler Attributes: Add __pass_object_size for Clang
Date: Tue,  8 Feb 2022 14:53:44 -0800
Message-Id: <20220208225350.1331628-3-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220208225350.1331628-1-keescook@chromium.org>
References: <20220208225350.1331628-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929; h=from:subject; bh=i0Oi+LXolg+eM3YPVR/El2E4tGz736zn+2NHNZGvzdI=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBiAvR8bIQyeNI+NWaNQZqa8J2M9TzhXpEub4iVXEfv UzC3tZiJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYgL0fAAKCRCJcvTf3G3AJrm5D/ 9EGjvGZsuSNeXlB/ANO8IFgIGTwIXHRLmmfagMWJtTn5f0+hz4BgaRbPeS4QtNZkzoLAPwaQLFqPDc waWxLmtqXpmnn2xxTuscc3+DVmcKeNX9jPGCBmln0sVZkfIMdp5M5Mr//rsJVByTGQZuU/Eo+i27JV nK0CKkl/tQ6TWmER+YJM+f8IjiozsiN6ndeJxch4neSrzjBDqXKeKh0jIsflO8unil9uTNFCa6O674 8lEuyws8iqyFFAPaardjsC/ccYDTNKjvLBEmym9St62Dsg0VwlAz48NVgiZletgVD08a0y76U7vwIW 2eJzMJLV6cz4T/0RwGbtONrbLRXla3EFHGLYDCNClPIB1LXDUS5Qk9L5lGf7Z3rP4PbpCCSoKe8TeT wBp4ONPatn0kMdEzAP6aIgAv7VZ2P45TVzwTx5ThYWW5oG+qenakqfSGKE2udjlkk1wR8GqJBvm7j+ M4o9TTsjguid/+ArNUi5l8WC8wCnt0mXBu4dzJ9JUoTq7ymMKxd5U6fNrmyIp9hlQpGk+kJkDjXk2x YsZ/gC/FzYgLUEpK5QFoK1rbs1mN4jWTcB2uZ2FvHRQNCFKZNsCiFzBH24YPxREDZujwmpu65fnaOH M3DNpnvZOh5sWF0O4YrRZxuHCyONucVcFUVeCShow/6tZFwm9rOa2Nfy8Q9w==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In order to gain greater visibility to type information when using
__builtin_object_size(), Clang has a function attribute "pass_object_size"
that will make size information available for marked arguments in
a function by way of implicit additional function arguments that are
then wired up the __builtin_object_size().

This is needed to implement FORTIFY_SOURCE in Clang, as a workaround
to Clang's __builtin_object_size() having limited visibility[1] into types
across function calls (even inlines).

This attribute has an additional benefit that it can be used even on
non-inline functions to gain argument size information.

[1] https://github.com/llvm/llvm-project/issues/53516

Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev
Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/compiler_attributes.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index 37e260020221..d0c503772061 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -263,6 +263,20 @@
  */
 #define __packed                        __attribute__((__packed__))
 
+/*
+ * Note: the "type" argument should match any __builtin_object_size(p, type) usage.
+ *
+ * Optional: not supported by gcc.
+ * Optional: not supported by icc.
+ *
+ * clang: https://clang.llvm.org/docs/AttributeReference.html#pass-object-size-pass-dynamic-object-size
+ */
+#if __has_attribute(__pass_object_size__)
+# define __pass_object_size(type)	__attribute__((__pass_object_size__(type)))
+#else
+# define __pass_object_size(type)
+#endif
+
 /*
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-pure-function-attribute
  */
-- 
2.30.2

