Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140759;
	b=S5JNxr8Hi17GlEdxdDb7Gpss9ijsqq3N3REfTjyZitBa3sYep9wIOqwnknDbyb6FWEQN
	 1M10J/wGohppEjPT1QKAbxTBhBSP4sjo/5xJx//PYjJaJhM7ic4kSgQ8/n57w1nKBjEOE
	 7z3ebzuK9MW8c5WIixKP2tjvOAiJTtzPqtgAgGsOKIcxTJwWqwgAUs7xlwb8ugHgzRDKq
	 cXUHA8mKdBboj82kIPUFmGYzC6opQquAvFKjlHDz7gP/1Irr2MkP2xM1Fqr3V3W1i1+7w
	 bCGDbv5YuUl2I5+a8gAkOF1oxQ/0w+Z81Pn/4qY30cPvYGoCrkz1R6j9Hc+M/1lCAfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dWBu3E1+9O630leKOxiPf33Qem+izCRkowC6gFS9sVM=;
	b=KWK56lPnt4QFFrVmaWLm7cRl7UVYWiHbbrc1OaUHiBwb2dH8YJAXJiV5onePJhDLhcyv
	 07RpkmL0WJ43fsbT6uQ0ePkvEnqYI9pcds8LaHWZfF3OXFPHlziw0DAWuAKH5tl9upWfj
	 XKttjjJzFxkJj4LBly1D/99Q4B+BRXSbsk0kqk8onz/1GujONNqyp5Sy1ByOkgBl7XkRb
	 w/aDX4XRX16BTsQw9EhDqNXLFnVXC49biWsDNvoUIadgM8V1+dPhtUBKygTSJSVE6Q9ow
	 CLQ9VM+6VKxJ1TpP1+TnPdfXDwNb7c7GvnpiTa1YEk42LSMFtbOuVZOh9GAEJqcJxww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dTJJy4ZY;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F29606A33A
	for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 22:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60F29606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dTJJy4ZY
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso523838eec.0
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 15:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793140752; x=1793745552; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWBu3E1+9O630leKOxiPf33Qem+izCRkowC6gFS9sVM=;
        b=dTJJy4ZYZIR5ceNemzkhPyrfYIwKUcOGMDczHr724lvhvzkMn5RCkOrJ/7d3G5B307
         GKK6L0PyMoxgzmQ6CNvhsV2AyUbXeF8AZ3J5KJiHRf+2RWY3PHkGfSO+gZsjcV7x3Cu8
         ttzb+Eg+JWjWYdeCtSoZVIwXoZP+KD4VunIQlMmucmPy4QicfGf+CWeN68cba8ylmfwM
         7NjRUmZnkLNY/GHjIp542CIkg+metw3WjA4pZfY9cDkpG3oTH+mIK1apTufp26/sDHtk
         0EXAJNYrwGrsntdEy+oiQqydxRTLQMx6pwQJdJQ1D29KH3Nch9lByLYaUHIld4LYGtr0
         f2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140752; x=1793745552;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWBu3E1+9O630leKOxiPf33Qem+izCRkowC6gFS9sVM=;
        b=chWkLtUQlrrMLKI1L0zrni6ccB0l2vkecV8u2ZrX1F3PUdiMI/VKnQ9ZQk2WP3Cxxu
         O907m7yArFrJWUcGBZKkpEOJXiaxVZbUzDxUtQeeG65BXnKmo7gdVEwI+PrqJM/6o1+7
         Nfe4FGycoqDSR+Z6EKW85rAThdaL86ZE7nF/b4e9WiwrKB9GMPHwRM0humcGikOVVqVR
         uMrIXkjDnoIqNPgAc59vUrv7TlcBmCjekkWowejLgao/KhJTcE8AnZf4FPlU2la8ieJa
         p9uaimkR6aQhfdOiRyexosrKpI2zMKiXLTA6TPyrc2lOgJbnzZvkJNP+9DuqHy8Bag9e
         g0uA==
X-Forwarded-Encrypted: i=1; AKwUvBzErXQM6PlxdB4zSW3qA9qyGTpJbkk8VIhyK7YfAmIBLd8utVAMxxT9ES0Ek5xoXr1BRewM@lists.linux.dev
X-Gm-Message-State: AFq9FYJVpWUU7pB9oG8Avp+F7BJ1oB3w9rqyHlKUUPJWwBa7AI8phFS8
	RZlQPWgnC+NwOcz7FtRXlTIWmQuPEyCu83Egsuva8SNOQzFeECLFDreQ/hhN9EcymiXqTcB2Iss
	aX9mboXRWgg==
X-Received: from dybnl11.prod.google.com ([2002:a05:7300:cf8b:b0:36a:117:523b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:250d:b0:369:f5f6:36a7
 with SMTP id 5a478bee46e88-36a2014b887mr1132027eec.16.1793140751881; Tue, 27
 Oct 2026 15:39:11 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:38:36 -0700
In-Reply-To: <20261027223847.652884-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027223847.652884-2-irogers@google.com>
Subject: [PATCH v2 1/9] Compiler Attributes: Add __must_init macro
From: Ian Rogers <irogers@google.com>
To: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"

Clang supports the 'require_explicit_initialization' attribute on struct
fields to indicate that a field must be initialized explicitly by the
user when the object is constructed. When an aggregate initializer or
uninitialized variable omits an annotated field, Clang emits a
-Wuninitialized-explicit-init warning (enabled by default).

Add the __must_init macro to include/linux/compiler_attributes.h (which
is included by include/linux/compiler_types.h and
include/linux/compiler.h) so kernel structs with error-prone
initialization (such as mandatory callbacks or cleanup handlers) can
enforce explicit initialization at compile time, as discussed at the
Linux Plumbers Conference. The shorter __must_init spelling, rather than
the attribute's full name, keeps annotated struct members readable and
was suggested by Greg Kroah-Hartman.

Note that Clang does not yet diagnose file-scope objects declared
without any initializer (initializers at file scope that omit the field
are diagnosed), see https://github.com/llvm/llvm-project/issues/232483.

Also teach Sphinx (Documentation/conf.py), kernel-doc
(tools/lib/python/kdoc/xforms_lists.py), and checkpatch.pl about the new
attribute macro.

Link: https://lpc.events/event/20/contributions/2392/
Link: https://lore.kernel.org/lkml/2026101532-fantastic-deafness-e04c@gregkh/
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 Documentation/conf.py                 |  1 +
 include/linux/compiler_attributes.h   | 12 ++++++++++++
 scripts/checkpatch.pl                 |  1 +
 tools/lib/python/kdoc/xforms_lists.py |  1 +
 4 files changed, 15 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 5ab26ce89daf..baaa4035258c 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -203,6 +203,7 @@ c_id_attributes = [
     "__noreturn",
     "__packed",
     "__pure",
+    "__must_init",
     "__section",
     "__always_unused",
     "__maybe_unused",
diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index 476c4c560d17..b9c0b56dd22e 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -322,6 +322,18 @@
  */
 #define __pure                          __attribute__((__pure__))
 
+/*
+ * Optional: not supported by gcc
+ * Optional: only supported since clang >= 20.0
+ *
+ * clang: https://clang.llvm.org/docs/AttributeReference.html#require-explicit-initialization
+ */
+#if __has_attribute(__require_explicit_initialization__)
+# define __must_init __attribute__((__require_explicit_initialization__))
+#else
+# define __must_init
+#endif
+
 /*
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-section-function-attribute
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html#index-section-variable-attribute
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c9840f5219c2..5232f66d2b80 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6860,6 +6860,7 @@ sub process {
 				"noreturn"			=> "__noreturn",
 				"packed"			=> "__packed",
 				"pure"				=> "__pure",
+				"require_explicit_initialization" => "__must_init",
 				"section"			=> "__section",
 				"used"				=> "__used",
 				"weak"				=> "__weak"
diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index 320f977c5bac..3c744cbd2f34 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -36,6 +36,7 @@ class CTransforms:
         (CMatch("CRYPTO_MINALIGN_ATTR"), ""),
         (CMatch("__private"), ""),
         (CMatch("__rcu"), ""),
+        (CMatch("__must_init"), ""),
         (CMatch("____cacheline_aligned_in_smp"), ""),
         (CMatch("____cacheline_aligned"), ""),
         (CMatch("__cacheline_group_(?:begin|end)"), ""),
-- 
2.56.0.313.g2479322e68-goog

