Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177584;
	b=umepCFBYL2RkSu3dJJVz/AS5JAuiv9WZ/cDpiKZMWac7RVxWnLS+6kxMQMX+GlPHb+/y
	 2hsFxxN0t4OteFTlTemWujRqLS/e6wi3YCL4Oo+ihJlcavuVzU9odUxS2R6M8UG5eekoG
	 as1LqVwRbBaJR/w1Yzb5EFWLCoAkfKJY5xDIZylC6S9o8Xr1UgKBG+6pwOU+rkMd16gq5
	 WVZOupW51jIATps7YR2VFOBCldW2rKvFie8k4bwt/P/jtJi+OHKxI1VNMQMViS7MuK1RW
	 kAWVsDhvNzAdF0eP/glCKy398rPv593rOL/E8nLz5D9oyCV+rOLFAN7TMOodunRA/2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=AHLMqwM6/67Zcd/LOxQ2+hhUbtfPU/BOw3z2THUGUxg=;
	b=DqGEYAfwJGqsY3uDiu0TzE0d56rwBZ1AzXR35LCVMVvehsuk0F1/SKCT3cdnzSfdZy//
	 dd9lRgA0TLA4qBhCjkbA77KBW4JLTHZ2Pszfpdxzf2SsVJ3J6GC6CNHBv/fv8TpRx48H4
	 mvGOnLpRRHo+ShfUxhW20ocwxou4i0NN9NKJ4c/YsAxMbRS/ZhiYZzWLdqr1mrGX25kQ6
	 2sZ/L54G5Bl8fglKf1+c/vyHzbXblUMBoWtpxrvclMYh/rUwryOtnDGiawXKZa6HvIcRn
	 TMxzUOITg7E+WRdxEgk6Tj++P2AQO5gPlxMXk+87hXgob7kXYf/2JtgbwUxpi+tfRIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tdcnz24P;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B995606D805
	for <llvm@lists.linux.dev>; Sun,  8 Nov 2026 22:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B995606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tdcnz24P
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso923110c88.0
        for <llvm@lists.linux.dev>; Sun, 08 Nov 2026 14:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794177582; x=1794782382; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AHLMqwM6/67Zcd/LOxQ2+hhUbtfPU/BOw3z2THUGUxg=;
        b=Tdcnz24PHztVxw12Leq6QUZSi5dimpv9JTLJwf4OoLKLBLpLPEyHDimHRJin0jVCm4
         RyzqY6ZPEVs203WojVG0ADzdtaHyhkkaOISm6qPt2xaKyNd3DQWr9E4XLctvMrVb/TAl
         qyhgBSDXHRRDXvuiLw1Nym2Dk7zkWbt6GWc7J86SMsK845r9cDbJQofOgoNcFSQF8zWc
         Y36fWGcHeMW2UJCRUqNNmZ5zhIjWq4ltFuU7grtUq8rvmmzoLa41s8GDawM87AhoOPCI
         BokjO2GMuV8BeS+hZuSETfvodGbe1J26kOiFhZ6CtrxvuWuSaSLE+M8BVgyZVkIGCqPO
         nbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177582; x=1794782382;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AHLMqwM6/67Zcd/LOxQ2+hhUbtfPU/BOw3z2THUGUxg=;
        b=cLp4SkWU2DuzwUE80Xz2fb4fBGAty1PHSAndh9ibu0k60W0rXF7JxUP3yTmRmzYbj6
         cBxi8r0vBKuVuAOHlRSOknjGg9q3LpsW7Y8382+BVdGfYInlXW/spe0RCMJ44NNFFfjP
         Haft5M8MQ9wIs5s3CLukyodlN8FECajsWPiKTa3i43EIVHcwoZGGOQxCUoYL6kKRQ7th
         tUS4knsTJUFkyX0CfmiX6n9S3HIZXChWGigKPCrB5GVej8yBlB34OyU+wWOMOigdplw1
         nuP59YziXk9NvQB9x+AiUWTZ9ZA7siSE+b0Z5oZ61J+23gLkE3kEfesn4yl8DF03nVzj
         TwqQ==
X-Forwarded-Encrypted: i=1; AL+hErGAfrMuARoeI9pJF8L58qvcro/tiyf79iUF48p2UR1wSsE2YQyEE8m819bA1ixfVXulIiYM@lists.linux.dev
X-Gm-Message-State: APuU4Z9vRTaPhcZeuTyWq4UFj38t64Era0hLb/xJbM4YI9eqkdSgOFUi
	+XtCQzCeGfrXzim6f9GDfjoBE9xPtvU4h9bwTg8w4RwtIq9V0eWb3bD2TlrXUWoYi/1WKR4TvIw
	/12ux8glVKw==
X-Received: from dlbox21.prod.google.com ([2002:a05:7022:1215:b0:1ab:fb55:f657])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b884:b0:1b2:695b:79f0
 with SMTP id a92af1059eb24-1b39fef03f3mr3576923c88.32.1794177581955; Sun, 08
 Nov 2026 14:39:41 -0800 (PST)
Date: Sun,  8 Nov 2026 14:39:05 -0800
In-Reply-To: <20261108223913.3624571-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108223913.3624571-2-irogers@google.com>
Subject: [PATCH v3 1/9] Compiler Attributes: Add __must_init macro
From: Ian Rogers <irogers@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
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

Note that Clang versions prior to the fix for
https://github.com/llvm/llvm-project/issues/232483 do not diagnose
file-scope objects declared without any initializer (initializers at
file scope that omit the field are diagnosed).

Also teach Sphinx (Documentation/conf.py), kernel-doc
(tools/lib/python/kdoc/xforms_lists.py), and checkpatch.pl about the new
attribute macro.

Link: https://lpc.events/event/20/contributions/2392/
Link: https://lore.kernel.org/lkml/2026101532-fantastic-deafness-e04c@gregkh/
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Kees Cook <kees@kernel.org>
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
index b8b64f720191..6a091c45b1a1 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6888,6 +6888,7 @@ sub process {
 				"noreturn"			=> "__noreturn",
 				"packed"			=> "__packed",
 				"pure"				=> "__pure",
+				"require_explicit_initialization" => "__must_init",
 				"section"			=> "__section",
 				"used"				=> "__used",
 				"weak"				=> "__weak"
diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index db23fb650ea8..42956b98aae3 100644
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
2.56.0.455.g6c5a503b38-goog

