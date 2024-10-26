Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A88178CDE
	for <llvm@lists.linux.dev>; Sat, 26 Oct 2024 05:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729919667; cv=none; b=KEvZ8sEDbQrIx27BqPw20zrc7YmHCVwPUwqasaCkr6zqA62PeGgKQJ3cdk9FZfebLm+ZZ1jFRXYtJz174PlcD5ASkZ2hD0om1KsT7azKJznF/vRzMUb32+FANUnAelYdeW7tTZovq05p308Tc3JjwyidRYusJF8INMymKWM2OYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729919667; c=relaxed/simple;
	bh=gX6C+xmPZI4vviIG2gcRmXQgQ4QuSRea9Xum6Y8PdvA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Sw8vibsHkNfYVKR2vkA1KwhxBaMPAPjsixh/R6LUrwyoeTAvk6Q/17cJJ2gRg6e9iJM30EflQweaQLdpvS9ABAODn20VMUOBlKLy/TsP0ZdPrR3yo0b75ZvHlQ9HlZqkS3ZYUYhWi1S+aUmtOLXubnrxyE62PiccRd4PG/huld4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tbPcm15+; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tbPcm15+"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e7f633af02so43425097b3.3
        for <llvm@lists.linux.dev>; Fri, 25 Oct 2024 22:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729919663; x=1730524463; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wHmgx0WMT0WJm/0bRZiTBO3ZfS/7yoeScA7PHXz66a0=;
        b=tbPcm15+RZJZZ9w9VPWs9oAuNPaamm/UMtjURXFqu2b6qA9gEOhXeVpgnigOtE1NTj
         VVJ7XF1P1LFFtu0ytjsh9cSh3HV/ee2iQdCaGzyB8yiXRSFtzUxeUlE8JobEE81ffSN1
         yysX0CwmZXmVGwEjrlwH72DCxT5slQepAZA8y8mWwvwAo+ZpdoOdlQ9xZcPQaPwRJ3q0
         dbDi+ve+dMs3WpsEongy726vAywFlNm88VT7eXS9gLERai0DWRBzY14wBPz53sT8mv/o
         jMBZ/b7VMKZS46LzeSxTWy81/qL3dFIyRPo5BbAgNLSfFcWJ7qb2xDqSPqOjihPJPG6N
         34Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729919663; x=1730524463;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wHmgx0WMT0WJm/0bRZiTBO3ZfS/7yoeScA7PHXz66a0=;
        b=SjllgtOFaxMCBoLzTvixg7X/5xFTOVBZDbYDKqwD8SQiJ7aTI1ior9z+Um/5BD31t7
         gkiyMX1dCk/Rgg5B61nmoll49D8jbDdZcOXVg3P31P7OSHD4++xBAo79bC9Lde6Br5GP
         5wIinboVGvxsFYTPhe9H6NEG+VXDvGdwcPm6NqQKF6BQPADweF6Pk+pXnTyJVb7KmiPa
         JeV5M4cDW2NGfHDwnM2v/om8RH/OaYeg28ANJhZT+SiRESUG4fF/C8puB2/wDxD4jj1I
         FaOWFtWHPyVIc4nEfxsFa57LO+Ka8gFz6eMdPuEKSbti7MYxPUW6ds1n1XlZqsGYvvXe
         r4fw==
X-Forwarded-Encrypted: i=1; AJvYcCV/I0OpwQxDbhJkfQe3215y3vfbinHEF48D4baVF4BJK7No9IFvrJoLQ6Xyy/Zw4Q7FH08m@lists.linux.dev
X-Gm-Message-State: AOJu0YwscYcz3yEF70yFlLlO2VgGGHm/p7tdI8xknhD8ZfC4LLk0Ajs6
	l8Lxo3MbRjuTv9o0cjnRO4u4Unat0QZmAtj6Ra5Rs+TBqdaNjAJlZBviIMZVwiDYFQ==
X-Google-Smtp-Source: AGHT+IFwdCF0m/L8cOwxhS25nb8LXGI1xFUxVkPvvMAds6km/RMLSYmvagpwqP7CwRbJFodaTTB7c0k=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:9704:0:b0:e2b:d404:7acb with SMTP id
 3f1490d57ef6-e3087c0c240mr5801276.9.1729919663197; Fri, 25 Oct 2024 22:14:23
 -0700 (PDT)
Date: Fri, 25 Oct 2024 22:14:07 -0700
In-Reply-To: <20241026051410.2819338-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241026051410.2819338-6-xur@google.com>
Subject: [PATCH v6 5/7] AutoFDO: Enable -ffunction-sections for the AutoFDO build
From: Rong Xu <xur@google.com>
To: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>
Cc: x86@kernel.org, linux-arch@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Enable -ffunction-sections by default for the AutoFDO build.

With -ffunction-sections, the compiler places each function in its own
section named .text.function_name instead of placing all functions in
the .text section. In the AutoFDO build, this allows the linker to
utilize profile information to reorganize functions for improved
utilization of iCache and iTLB.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Tested-by: Yonghong Song <yonghong.song@linux.dev>
Tested-by: Yabin Cui <yabinc@google.com>
Change-Id: I6dc9150c46983a576f4d4f1415dbdcab78a48021
---
 include/asm-generic/vmlinux.lds.h | 11 +++++++++--
 scripts/Makefile.autofdo          |  2 +-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index e02973f3b4189..bd64fdedabd2f 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -95,18 +95,25 @@
  * With LTO_CLANG, the linker also splits sections by default, so we need
  * these macros to combine the sections during the final link.
  *
+ * With AUTOFDO_CLANG, by default, the linker splits text sections and
+ * regroups functions into subsections.
+ *
  * RODATA_MAIN is not used because existing code already defines .rodata.x
  * sections to be brought in with rodata.
  */
-#if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CLANG)
+#if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CLANG) || \
+defined(CONFIG_AUTOFDO_CLANG)
 #define TEXT_MAIN .text .text.[0-9a-zA-Z_]*
+#else
+#define TEXT_MAIN .text
+#endif
+#if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LTO_CLANG)
 #define DATA_MAIN .data .data.[0-9a-zA-Z_]* .data..L* .data..compoundliteral* .data.$__unnamed_* .data.$L*
 #define SDATA_MAIN .sdata .sdata.[0-9a-zA-Z_]*
 #define RODATA_MAIN .rodata .rodata.[0-9a-zA-Z_]* .rodata..L*
 #define BSS_MAIN .bss .bss.[0-9a-zA-Z_]* .bss..L* .bss..compoundliteral*
 #define SBSS_MAIN .sbss .sbss.[0-9a-zA-Z_]*
 #else
-#define TEXT_MAIN .text
 #define DATA_MAIN .data
 #define SDATA_MAIN .sdata
 #define RODATA_MAIN .rodata
diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index ff96a63fea7cd..6155d6fc4ca7f 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -9,7 +9,7 @@ ifndef CONFIG_DEBUG_INFO
 endif
 
 ifdef CLANG_AUTOFDO_PROFILE
-  CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE)
+  CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
-- 
2.47.0.163.g1226f6d8fa-goog

