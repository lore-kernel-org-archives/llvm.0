Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5CD17C98;
	Mon, 18 Nov 2024 10:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731926719; cv=none; b=hGLwocihkad5yoydiWO0iS+p0hGL44vhfZPFQmCaNATx94JRqjsgHfsgSjaEpOVloQxYooyx4XDQIWFU8GHbEGADCTF/gbwtIy3nhDOyZfdVzM0Att67noj4SRhrjpVFVFAojnRXQFgwWuTrKTT3cEoNEYM5xl5v5FrKy6xWsWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731926719; c=relaxed/simple;
	bh=oUu8ZApxrCmVMRGTlenQNLwoHFTsX9NfjXig3KnmDMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjD0hCshTYPHxLpcHInTucuTTol4Bhwn+rdJZHIypJeWfJ0JwHGUX2xL8Noptlu6t1JHOYQk9XzWIzSHFUZt01Dss2g1TpRsxpcQPiNRQyuIaEh9izubB44lrjVWHu29M3Q0E0aheuD8NCo20JnbF3Z0Ufu4ZHlpbrN4cSsGSsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pA8K2zck; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pA8K2zck"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=T1TVzATO6hPWRoz8J6Qk/xFkTBrFRRbR2/2nTNaaKps=; b=pA8K2zckOGtewCvXj1hlBuxj57
	512QFsQpoLZ/ZxW+HJmIikRKAkiXbiZBLIMhJ9TJVH/zJYkOGimf0VspzzT/sQSf8FYu7YW6wLa9t
	amzcXBARPQ4F9ntmQbKmHmm5ZpW0VSUvABzvRKLKj4ojsuisVtoB/edwE+1aYkKTWTlU1CsUB6nxX
	RsyxF1FNOUHz99574aQQ3jcK5ip743iEKQ1+f5WPZX5cnHMCOhiV6lxECP8V9BCK9V5BCFxgSHdSs
	dvWRO6WLDO333qzYneVK8uLePc6o9gtgw3Yu2f2UzdeO8ujqS3lv9hdM5dM2O8PgUiIG3Zs1Uyzdc
	2EeHe+2Q==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzFn-00000002qYW-0C24;
	Mon, 18 Nov 2024 10:45:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E6B9130049D; Mon, 18 Nov 2024 11:45:10 +0100 (CET)
Date: Mon, 18 Nov 2024 11:45:10 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:module/namespace 8/8] <inline asm>:1191:93: error:
 unexpected token
Message-ID: <20241118104510.GI38972@noisy.programming.kicks-ass.net>
References: <202411170618.NtapXkN9-lkp@intel.com>
 <20241117113212.GC27667@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241117113212.GC27667@noisy.programming.kicks-ass.net>

On Sun, Nov 17, 2024 at 12:32:12PM +0100, Peter Zijlstra wrote:
> On Sun, Nov 17, 2024 at 06:49:12AM +0800, kernel test robot wrote:
> 
> >     1191 | .section ".export_symbol","a" ; __export_symbol_kvm_caps: ; .asciz "GPL" ; .asciz "MODULE_" "kvm,kvm-intel,kvm-amd" ; .balign 8 ; .quad kvm_caps ; .previous
> >          |                                                                                             ^
> 
> Urgh.. so GCC does the expected string concatenation here, while LLVM is
> having a wobble because it expects a single string constant, and not
> two.
> 
> I've tried the whole CONCATENATE() trick, but that doesn't work right
> for strings.
> 
> And I'm not sure what else to try.. The whole of C is build on the
> expectation that two string constants are merged into one, but LLVM
> integrated assembler clearly disagrees :-/
> 
> Anybody?

Made it work like so.

diff --git a/include/linux/export.h b/include/linux/export.h
index 176671624420..2bf1eb80c86b 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -24,11 +24,23 @@
 	.long sym
 #endif
 
-#define ___EXPORT_SYMBOL(sym, license, ns)		\
+/*
+ * LLVM intregrated assembler refuses to merge adjacent string literals (like
+ * C and GNU-as) and chokes on:
+ *
+ *   .asciz "MODULE_" "kvm" ;
+ *
+ * As would be generated when using EXPORT_SYMBOL_GPL_FOR(foo, "kvm"), use
+ * varargs to assemble it like so:
+ *
+ *   .ascii "MODULE_", "kvm", "\0" ;
+ *
+ */
+#define ___EXPORT_SYMBOL(sym, license, ns...)		\
 	.section ".export_symbol","a"		ASM_NL	\
 	__export_symbol_##sym:			ASM_NL	\
 		.asciz license			ASM_NL	\
-		.asciz ns			ASM_NL	\
+		.ascii ns, "\0"			ASM_NL	\
 		__EXPORT_SYMBOL_REF(sym)	ASM_NL	\
 	.previous
 
@@ -39,20 +51,20 @@
  * be reused in other execution contexts such as the UEFI stub or the
  * decompressor.
  */
-#define __EXPORT_SYMBOL(sym, license, ns)
+#define __EXPORT_SYMBOL(sym, license, ns...)
 
 #elif defined(__GENKSYMS__)
 
-#define __EXPORT_SYMBOL(sym, license, ns)	__GENKSYMS_EXPORT_SYMBOL(sym)
+#define __EXPORT_SYMBOL(sym, license, ns...)	__GENKSYMS_EXPORT_SYMBOL(sym)
 
 #elif defined(__ASSEMBLY__)
 
-#define __EXPORT_SYMBOL(sym, license, ns) \
+#define __EXPORT_SYMBOL(sym, license, ns...) \
 	___EXPORT_SYMBOL(sym, license, ns)
 
 #else
 
-#define __EXPORT_SYMBOL(sym, license, ns)			\
+#define __EXPORT_SYMBOL(sym, license, ns...)			\
 	extern typeof(sym) sym;					\
 	__ADDRESSABLE(sym)					\
 	asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
@@ -68,9 +80,8 @@
 #define EXPORT_SYMBOL(sym)		_EXPORT_SYMBOL(sym, "")
 #define EXPORT_SYMBOL_GPL(sym)		_EXPORT_SYMBOL(sym, "GPL")
 #define EXPORT_SYMBOL_NS(sym, ns)	__EXPORT_SYMBOL(sym, "", ns)
-#define EXPORT_SYMBOL_NS_GPL(sym, ns)	__EXPORT_SYMBOL(sym, "GPL", ns)
+#define EXPORT_SYMBOL_NS_GPL(sym, ns...)	__EXPORT_SYMBOL(sym, "GPL", ns)
 
-#define EXPORT_SYMBOL_FOR(sym, mods)	EXPORT_SYMBOL_NS(sym, "MODULE_" mods)
-#define EXPORT_SYMBOL_GPL_FOR(sym, mods) EXPORT_SYMBOL_NS_GPL(sym, "MODULE_" mods)
+#define EXPORT_SYMBOL_GPL_FOR(sym, mods) EXPORT_SYMBOL_NS_GPL(sym, "MODULE_", mods)
 
 #endif /* _LINUX_EXPORT_H */
