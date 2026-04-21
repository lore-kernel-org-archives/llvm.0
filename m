Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433D3361DA8
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 19:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776798247; cv=none; b=kDPKo1X7CnaHTQtRs7HKGNBSCmUG6EKA+vpyECoLyb+Hb2LuiNXCGWeaMGP+C3abcZgi2Q/d2BAmF+MtF5DmldfG4Ua/tfsTayHsRlUugajt70IyQv2TAMEZxCXURsv/1j/RRDHaDda8XxQ+OnRuyBta7vb8jXDJNHqRx98aXlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776798247; c=relaxed/simple;
	bh=itmHKeYdTrXU9RgiqwsA1M7ZjCooCXj0hGK5wGYsCvg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TDBcDetA7aWkFly6OiM1EAtI+Ft0iSKYpVC4WEl3joCxZKOMKy3UkEbNgWSHFaO+zcvS+IL2UYxTrH+QSuiA6OG8vXLKZP7+t96Mz0zeySDd4kwNyALH2R/WMmTt8H2pXX99vU0rQpvwAohjzsoa3c1izIlRIWBV5tt9IcF+nNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jM3sqME2; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jM3sqME2"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43cff5ef652so2928090f8f.2
        for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 12:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776798244; x=1777403044; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZuYemzHrsE4FyqS0s1BFQk1xjd8CwS4JPKuxgVOhZ8o=;
        b=jM3sqME2fQ+HyNayD24uF83p+PeOeE0bRbfNJ7CQ/c62s7oeACjGK1Dg9WuHdf27/3
         XlL9rSSIXPphbYUiLVHa9tvCqaceuieJRsDq12r+EBWdM1qKVFlhUHyiILxMh6NbIeoA
         X8Dfgic4s8FeeTfnfXsXLxABApwKDWfvRw68HmSwPom1FVe6/O+5mevTlDdpkoLjTjqj
         cX16xLhlGSZ32CG+qkPKySq9TKH30fFE5IVQlx51qPpacx5J0ps1ksCQVxb4Vkn3rrNr
         EU+YAxe48+kgu5SHq/i6HosiX3WJg+7HbYgCOHtavoZhEcb9Va3NDNuD7uHNbxmkKh2Q
         5bPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776798244; x=1777403044;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZuYemzHrsE4FyqS0s1BFQk1xjd8CwS4JPKuxgVOhZ8o=;
        b=AxM98cDnhbP1IbcGZt6Za1abH5LBHups3kQdhGo3m96nMwBgf+UR+itqVE9wNPrUjT
         KkMOEHKmF6VJ038u3X4GP9UVbLVxjsso2zoKOjvOaAaP3XCa4FyYkb6Csgoh0nH6CYJ4
         TMj6yDtM38N+woY5UaDqQHlAmzV8tXMFzmTj0N/w2xx/fO7R0dabbkviI3nVpjHsD1PY
         nj5w8lOu8R5PZg3JTUjnhH06tU41/d/iX0fjKvOd9JNqrUV4/Q7DQr+Xp6doRBRD6meI
         q0Ojp1YvGJDWzZ5XQ+r15ptsWkobtQEGD0s6LQMokIPpxbyAOKn9/p9gqRAMHoy6AmJl
         oP5w==
X-Forwarded-Encrypted: i=1; AFNElJ/PJo6D6/CWmenyNpTdZHg7iwN9BS5+4Ul4SSPgX7a4ONGfLYMBb0Hb+j+YcPoAHtQ2/+Xh@lists.linux.dev
X-Gm-Message-State: AOJu0YzMxki45vTg1Az+3gELzwg3EGxolhZsSiEyiose4txwP4hsVrrM
	iRff+7W3kaZ79EpTsts4CbMbEOVhCEuTxRKHC6OHCvhxFLgplJg71w1isoxA46bviSictE1Ih4F
	+Cg==
X-Received: from wmkz3.prod.google.com ([2002:a7b:c7c3:0:b0:488:7e69:14c1])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6990:b0:48a:5970:1fe1
 with SMTP id 5b1f17b1804b1-48a597021eamr12282985e9.4.1776798244496; Tue, 21
 Apr 2026 12:04:04 -0700 (PDT)
Date: Tue, 21 Apr 2026 21:03:47 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.rc2.533.g4f5dca5207-goog
Message-ID: <20260421190351.1976329-1-elver@google.com>
Subject: [PATCH 1/2] Compiler Attributes: Add __access macro
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Add support for the `__access__` attribute, which is supported since gcc
>= 11 but not currently supported by clang.

The attribute allows specifying how a function accesses memory passed
via a pointer argument (read_only, write_only, read_write, none) and
optionally the size of the access. Per [1] these annotations only affect
diagnostics, and should not affect code generation:

	"The access attribute enables the detection of invalid or unsafe
	 accesses by functions or their callers, as well as write-only
	 accesses to objects that are never read from. Such accesses may
	 be diagnosed by warnings such as -Wstringop-overflow,
	 -Wuninitialized, -Wunused, and others."

[1] https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html#index-access

Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/compiler_attributes.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index c16d4199bf92..ef4e279e9872 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -20,6 +20,18 @@
  * Provide links to the documentation of each supported compiler, if it exists.
  */
 
+/*
+ * Optional: only supported since gcc >= 11
+ * Optional: not supported by clang
+ *
+ *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html#index-access
+ */
+#if __has_attribute(__access__)
+# define __access(x, ...)		__attribute__((__access__(x, ## __VA_ARGS__)))
+#else
+# define __access(x, ...)
+#endif
+
 /*
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-alias-function-attribute
  */
-- 
2.54.0.rc2.533.g4f5dca5207-goog

