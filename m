Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E674410D37;
	Wed, 21 Jan 2026 11:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768994005; cv=none; b=FtkfnDXKeybOjXmOpmn+vAejuP8mXIcO61tj1K8u5OAd9bAB9s7Ci/OxPwPBoVpXCsdK6fZNrOkpbDCOaZviPXf8/esM6ESz6aQpHKsKSd0a1VgD5Io70wSoMie53GOZaX64ch7L95qynyO2bvg8IOZgOrH/61ZHvwes0qBrkV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768994005; c=relaxed/simple;
	bh=Zxrg7VttDviPqEggFn3s0ZNHU1Xo5ltEFuzlWytDA8U=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=MH7RevqKou0eFPzsGKw/hujfE/iM4XYTbhziSAnOTs4KEG1FyThh9JddVV/Xzf+3TiHHrwAszRj7b/peUQxMU3BpqDOB2GqYp1IDABoHBBgvvlECbMdz7DnDdftusO6wO5x+pMvlJxxKMlVvCN3YZyEuyB30d/Iy3cYCk+0pnU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UNtDfyEB; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UNtDfyEB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=BEneuwlKs8iHX3pfX+fsHOBtNw0hsNABQ3/6UHlcO0A=; b=UNtDfyEBAiMQMR9wJyvkYvM6+g
	toT+KHu7KtluxB0zXJnL2WP3/wrx6N3yVGqilUgOw0F+CJg7zAADqfd/BfgMZBUfsYHspvyLQLDd9
	ctz3w9xza0cvZ9eMasb8lSzDf2s5QY7twCg2q8e0oWBrlrjT007cMkd8arfbUu7dsqEO9TKPpS1wV
	+HH7RQBAZ0y9ljOVQqCmCGKnook8e0XljkQxCfLTZMIzgGsgzw/9M1aNpHlvxjB4sq4Fvt6lppgYb
	ATYkZ/fqiRPgrqEQ7oVN6Qa3DcC1KdG9/cbdxgC7ZBALgSV76E1MLbEJ0xg7P6u/TSprPn18mGtJ8
	BAiD+ATA==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viW9E-0000000GGcX-3tkI;
	Wed, 21 Jan 2026 11:13:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 907D83007E1; Wed, 21 Jan 2026 12:13:10 +0100 (CET)
Message-ID: <20260121111213.634625032@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 21 Jan 2026 12:07:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: elver@google.com
Cc: linux-kernel@vger.kernel.org,
 bigeasy@linutronix.de,
 peterz@infradead.org,
 mingo@kernel.org,
 tglx@linutronix.de,
 will@kernel.org,
 boqun.feng@gmail.com,
 longman@redhat.com,
 hch@lst.de,
 rostedt@goodmis.org,
 bvanassche@acm.org,
 llvm@lists.linux.dev
Subject: [RFC][PATCH 1/4] compiler-context-analysys: Add __cond_releases()
References: <20260121110704.221498346@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Useful for things like unlock fastpaths, which on success release the
lock.

Suggested-by: Marco Elver <elver@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/compiler-context-analysis.h |   32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

--- a/include/linux/compiler-context-analysis.h
+++ b/include/linux/compiler-context-analysis.h
@@ -320,6 +320,38 @@ static inline void _context_unsafe_alias
  */
 #define __releases(...)		__releases_ctx_lock(__VA_ARGS__)
 
+/*
+ * Clang's analysis does not care precisely about the value, only that it is
+ * either zero or non-zero. So the __cond_acquires() interface might be
+ * misleading if we say that @ret is the value returned if acquired. Instead,
+ * provide symbolic variants which we translate.
+ */
+#define __cond_acquires_impl_not_true(x, ...)     __try_acquires##__VA_ARGS__##_ctx_lock(0, x)
+#define __cond_acquires_impl_not_false(x, ...)    __try_acquires##__VA_ARGS__##_ctx_lock(1, x)
+#define __cond_acquires_impl_not_nonzero(x, ...)  __try_acquires##__VA_ARGS__##_ctx_lock(0, x)
+#define __cond_acquires_impl_not_0(x, ...)        __try_acquires##__VA_ARGS__##_ctx_lock(1, x)
+#define __cond_acquires_impl_not_nonnull(x, ...)  __try_acquires##__VA_ARGS__##_ctx_lock(0, x)
+#define __cond_acquires_impl_not_NULL(x, ...)     __try_acquires##__VA_ARGS__##_ctx_lock(1, x)
+
+/**
+ * __cond_releases() - function attribute, function conditionally
+ *                     releases a context lock exclusively
+ * @ret: abstract value returned by function if context lock releases
+ * @x: context lock instance pointer
+ *
+ * Function attribute declaring that the function conditionally releases the
+ * given context lock instance @x exclusively. The associated context(s) must
+ * be active on entry. The function return value @ret denotes when the context
+ * lock is released.
+ *
+ * @ret may be one of: true, false, nonzero, 0, nonnull, NULL.
+ *
+ * NOTE: clang does not have a native attribute for this; instead implement
+ *       it as an unconditional release and a conditional acquire for the
+ *       inverted condition -- which is semantically equivalent.
+ */
+#define __cond_releases(ret, x) __releases(x) __cond_acquires_impl_not_##ret(x)
+
 /**
  * __acquire() - function to acquire context lock exclusively
  * @x: context lock instance pointer


