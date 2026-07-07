Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B766540D57C
	for <llvm@lists.linux.dev>; Tue,  7 Jul 2026 07:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408984; cv=none; b=mANy8BBIKBXjFroP3h8s61eZpVlTH0g0jbUTFFqxjiNJvGj/JX33e9/2E5+fi8yUnhLnj5kNLi8XS21sG52HGBa33SctBadSqmymor66vwTQsbVJG3MxgN0um0EeeI3vQ/Fgi78CWmCwjeAp1dTLQ9IYUsIDSSe1Tn8ATAzxoFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408984; c=relaxed/simple;
	bh=dydZVhth1y6JE7+fyLmn2w7NHqI4W6Xits7j2exGHig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X0Ff99BiuuXNIjOaw29lIBa4XIhX37ecm6q+nZ3HAx+MtGvpPjGDsqz9zhaJZoWjeUBdOksLROUp7GZX+GK3m3RLUcLGoWbRMqHQ7ddceZLkZ8l0LszAkHyPYMC4zgdfG4P/kqeqB68ExqwV8eXNLAr0UM0bSP0Co+R1QgjIWpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wBsYJKmU; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wBsYJKmU"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783408975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2K4imcceEzYpUOx6xUchhbO3GzKewULjWdUSxLezYq8=;
	b=wBsYJKmUkD1vZIENhJ/jjIMVXtfHDfhtcXUWtsRsJm5VOlKMsz5smqzWuuDtl+m5OObTV2
	BOxiErW5YNItSa17xZT8cEy3Za9zTwTq0zBar9ntvj5b8r+4sGcvi2dSm2PMwvofLZucrg
	kTgTIDpp258zYXFH54i/K4Ci5MiJ2ZU=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org,
	jpoimboe@kernel.org,
	peterz@infradead.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com
Cc: kernel@xen0n.name,
	joe.lawrence@redhat.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	yangtiezhu@loongson.cn,
	jiaxun.yang@flygoat.com,
	liukexin@kylinos.cn,
	guodongtai@kylinos.cn,
	xry111@xry111.site,
	wangyuli@aosc.io,
	loongarch@lists.linux.dev,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/12] klp-build: Add LoongArch syscall patching macro
Date: Tue,  7 Jul 2026 15:20:26 +0800
Message-Id: <20260707072031.231066-8-dongtai.guo@linux.dev>
In-Reply-To: <20260707072031.231066-1-dongtai.guo@linux.dev>
References: <20260707072031.231066-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

Add LoongArch support for KLP_SYSCALL_DEFINEx(), mirroring the generic
__SYSCALL_DEFINEx() pattern from include/linux/syscalls.h.

Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 include/linux/livepatch_helpers.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/livepatch_helpers.h b/include/linux/livepatch_helpers.h
index 4b647b83865f..a8aad067177b 100644
--- a/include/linux/livepatch_helpers.h
+++ b/include/linux/livepatch_helpers.h
@@ -91,6 +91,28 @@
 	}								\
 	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
 
+#elif defined(CONFIG_LOONGARCH)
+
+#define __KLP_SYSCALL_DEFINEx(x, name, ...)                             \
+	__diag_push();                                                  \
+	__diag_ignore(GCC, 8, "-Wattribute-alias",                      \
+		      "Type aliasing is used to sanitize syscall arguments");\
+	asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
+		__attribute__((alias(__stringify(__se_sys##name))));    \
+	ALLOW_ERROR_INJECTION(sys##name, ERRNO);                        \
+	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));\
+	asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__)); \
+	asmlinkage long __attribute__((optimize("-fno-optimize-sibling-calls")))\
+			__se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))  \
+	{                                                               \
+		long ret = __klp_do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));\
+		__MAP(x,__SC_TEST,__VA_ARGS__);                         \
+		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));       \
+		return ret;                                             \
+	}                                                               \
+	__diag_pop();                                                   \
+	static inline long __klp_do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
+
 #endif
 
 #endif /* _LINUX_LIVEPATCH_HELPERS_H */
-- 
2.25.1

