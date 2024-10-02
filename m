Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9211A4F1C
	for <llvm@lists.linux.dev>; Wed,  2 Oct 2024 23:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727912070; cv=none; b=HfkkkSmommbyJmDdmoJLB1XBo4+cMFZzZLmC21p1egrMszkPNUFVYay8rg1S4cILIs5JiniYSb2JUc2U2u9GHp9Nef82K3umL2b5x2wC3TZksluGCXVQtLh5C2fi52jUL1rk6gI4T7ZepXz/QxV1X0xT0frBxTTlbtnNNH5nWW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727912070; c=relaxed/simple;
	bh=TfH9pGj8JDl+Aaof/nrcmhyRJuPoerK+wbLPSo061QU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=CiiHja7OGJHNl0X2aP60vxgYn3cHVvwGSmVs83BN6vm8dXNloTkfPv0kaOt2qKVJg8lzZb687RICi69diXu7WRvTJqiFfnDBSsnn4TQF8ZvOvYpt5CxJBukZ6DZtgvpzy06KlpTwH60TKV/+qFocZOst/JY3l9Gs1NeBX/dc890=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z8s6Xt45; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z8s6Xt45"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ddbcc96984so6725107b3.2
        for <llvm@lists.linux.dev>; Wed, 02 Oct 2024 16:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727912067; x=1728516867; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gf2t9bmrSErOVfsrBNPXAQs5s7MnOlbk17b3fEGLpOY=;
        b=z8s6Xt455e7QGsfAJ99H4p2gcYMHnFfy5kW85g/j8gJGhl7UrB7GtgXX1cpIZWRUtK
         0eVhTPSAHAtQ7p+CZUEbaiVbXtISUsgrWsHgxVrPVmEu6sVOA2Fb9y8KxlUNb9JKWQyn
         CnJyOP3coA+ututOR8tJm46Xtgw6AEyObqedLqJJ/P3WcGL22orFE3Y/BO65GRZYT3iG
         CTLRC8su0evJf9PR6luywGAGorux1uur3wNsOEErUEIqF1xuryDC8KmHi3+WsZFS/xAl
         1jWZC3EZaqc9/GSMMaxr+js8eTB4oPNe1SP2blFub8FbcyQKK5Zks5Nt/16QVtiZjUvn
         urDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727912067; x=1728516867;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gf2t9bmrSErOVfsrBNPXAQs5s7MnOlbk17b3fEGLpOY=;
        b=mdyTxYXAAbFcgNRUnBi4Aj8itA8XL5ldkW6U/+4I0KvtG7fNE6wwlg5xTpWZ9VcUoh
         wYfo1iCmZB7XJurAFqNOjuNVD3qiT6PktuvIt0J9tMJn4J4jlsA/AbgooM1FTrQKljUg
         9hfK+v3fOS/qpF2taSx7fKjKPF3m4zxaAI/LUpLT+58om0NBR5bO21D90dwetXJuDdR9
         DeDo4hJ0/yzl8u0DSz38waHRMVH8mtdBhB4Q61lr+KcOWYQNRdWvwFVqngE9Tja2nacN
         1yJbhZsuPE1v9o6MSHwYkRMxhMyOb998g8AsLYSlHF9thR/113eCeQmdO6J0mbUvPE5y
         Np0A==
X-Forwarded-Encrypted: i=1; AJvYcCUiuDf47lLCoSfSVHju/Tpt1K4rNNQIykJxmtFnImyoFKnXqUJNlegHGLgjkvgl4i8z2ghO@lists.linux.dev
X-Gm-Message-State: AOJu0YwbARQvnTkacmeELLorqD6/aVY77ECqNzgiA2n4djSB/iQCL8e4
	najOBsDfPjnzdkOHKGwDDOzzJLsv7ixxlSb9KDD6xY/yP6ZSJZRK93BJulpMYK0Qbg==
X-Google-Smtp-Source: AGHT+IH7n5TnZZKl1p5XBw74fsA3I5CI+Qm3oY/OY6wfantpUFtmuhzgkxj4i5TBuYuTlUnEBB8GoCA=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a05:690c:4988:b0:6dd:bc07:2850 with SMTP id
 00721157ae682-6e2a3048277mr1088157b3.6.1727912066877; Wed, 02 Oct 2024
 16:34:26 -0700 (PDT)
Date: Wed,  2 Oct 2024 16:34:04 -0700
In-Reply-To: <20241002233409.2857999-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20241002233409.2857999-6-xur@google.com>
Subject: [PATCH v2 5/6] AutoFDO: Enable machine function split optimization
 for AutoFDO
From: Rong Xu <xur@google.com>
To: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Juergen Gross <jgross@suse.com>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, x86@kernel.org, 
	"Xin Li (Intel)" <xin@zytor.com>
Content-Type: text/plain; charset="UTF-8"

Enable the machine function split optimization for AutoFDO in Clang.

Machine function split (MFS) is a pass in the Clang compiler that
splits a function into hot and cold parts. The linker groups all
cold blocks across functions together. This decreases hot code
fragmentation and improves iCache and iTLB utilization.

MFS requires a profile so this is enabled only for the AutoFDO builds.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
---
 include/asm-generic/vmlinux.lds.h | 6 ++++++
 scripts/Makefile.autofdo          | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index ace617d1af9b..20e46c0917db 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -565,9 +565,14 @@ defined(CONFIG_AUTOFDO_CLANG)
 		__unlikely_text_start = .;				\
 		*(.text.unlikely .text.unlikely.*)			\
 		__unlikely_text_end = .;
+#define TEXT_SPLIT							\
+		__split_text_start = .;					\
+		*(.text.split .text.split.[0-9a-zA-Z_]*)		\
+		__split_text_end = .;
 #else
 #define TEXT_HOT *(.text.hot .text.hot.*)
 #define TEXT_UNLIKELY *(.text.unlikely .text.unlikely.*)
+#define TEXT_SPLIT
 #endif
 
 /*
@@ -584,6 +589,7 @@ defined(CONFIG_AUTOFDO_CLANG)
 		ALIGN_FUNCTION();					\
 		*(.text.asan.* .text.tsan.*)				\
 		*(.text.unknown .text.unknown.*)			\
+		TEXT_SPLIT						\
 		TEXT_UNLIKELY						\
 		. = ALIGN(PAGE_SIZE);					\
 		TEXT_HOT						\
diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 9c9a530ef090..380042a301cc 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -11,6 +11,7 @@ endif
 
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
+  CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
@@ -18,6 +19,7 @@ ifdef CONFIG_LTO_CLANG_THIN
     KBUILD_LDFLAGS += --lto-sample-profile=$(CLANG_AUTOFDO_PROFILE)
   endif
   KBUILD_LDFLAGS += --mllvm=-enable-fs-discriminator=true --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
+  KBUILD_LDFLAGS += -plugin-opt=-split-machine-functions
 endif
 
 export CFLAGS_AUTOFDO_CLANG
-- 
2.46.1.824.gd892dcdcdd-goog

