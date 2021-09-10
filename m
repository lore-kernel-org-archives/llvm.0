Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com [209.85.222.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2A22F80
	for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 23:41:06 +0000 (UTC)
Received: by mail-qk1-f201.google.com with SMTP id k9-20020a05620a138900b003d59b580010so27889263qki.18
        for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 16:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=YZFNZaYPd/he7w5UBJM9lcDxSfmiDtcXiMqEOq338Jg=;
        b=H1UyckYemEOk1oyzIQmj7UFWuIpswTx8cNx7nsRcwyXPFRqUlG2fqYJIv6VYr9sFdm
         m3UpTxocjB8afQ4Fndfs/Jd40MQKs/2xmpSbeZdf2iseG//mSB5+io/wcS3rd3wFGgn9
         1UqtU4N6Y2ZlJgL9NOPmk38lBzuKFFqpJLw/HBzZLHmJasP5/Yzj3vzU3RqNRdeuXy5v
         w1qrW/YJvGV+NqyCIRp4PnopGcKGdchMaSwiXAgV6xpvegaR6z/6R/ATcl6bJE24AyuC
         aJKAggT4Y8ZlinnpEcy7Au1CYlRsL4DQxk7gfNTaVXpZxM8KAYxCkTTibhFVK4lE/SY5
         RFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=YZFNZaYPd/he7w5UBJM9lcDxSfmiDtcXiMqEOq338Jg=;
        b=wbo6XqHI3Lff+2SKirlTxq/XpDsV9X0ytapYDUFiAluF0DdeFr09rrCZIphA1WINka
         4DFiJu5e8uudVKX6TVz/20bCE2TOHqdEzl5QposLSex44OnDw1cafmv4mGf5Ti0/CeJz
         Z7jE5RfniMyzHbrdRWsDjRylHaW0GodUfrTaGy3roGup+MILtwYp3aW+wzMTBjhrzLpD
         avicKuQmZbFsR8xcxErlhUgKPXtB3JbfgGh7Afxca9H5br7yGtdUPF0PXFV4ShQf7MtN
         0hYacb6ImmE9ONjpY3gMd/hD98h9xT6CvtNfEh6qwUcn0uAfzwriDOIYCDa3NUk32dDF
         yqXA==
X-Gm-Message-State: AOAM531C0ZnQZMlMQkfs37Zbjj2l8EFE0E9Iep08Lb4MJoLI4MbHsPvR
	Hmp+LNZ2lAgpIO7VTUsgrN6VcRCSKVrXiJckJwY=
X-Google-Smtp-Source: ABdhPJz6ElitxYBNsJgBjhqNLSWLWIZ6PP7s4iBODM2VeYjjSbItAEn46E/9kQl8RhKTgw7exy1/gynScmufZc9jtZI=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:2b76:71d3:b5fb:3734])
 (user=ndesaulniers job=sendgmr) by 2002:a0c:9d82:: with SMTP id
 s2mr10986321qvd.23.1631317265326; Fri, 10 Sep 2021 16:41:05 -0700 (PDT)
Date: Fri, 10 Sep 2021 16:40:43 -0700
In-Reply-To: <20210910234047.1019925-1-ndesaulniers@google.com>
Message-Id: <20210910234047.1019925-7-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210910234047.1019925-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 06/10] powerpc: remove GCC version check for UPD_CONSTR
From: Nick Desaulniers <ndesaulniers@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, 
	Segher Boessenkool <segher@kernel.crashing.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Now that GCC 5.1 is the minimum supported version, we can drop this
workaround for older versions of GCC. This adversely affected clang,
too.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/powerpc/include/asm/asm-const.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-const.h b/arch/powerpc/include/asm/asm-const.h
index 0ce2368bd20f..dbfa5e1e3198 100644
--- a/arch/powerpc/include/asm/asm-const.h
+++ b/arch/powerpc/include/asm/asm-const.h
@@ -12,16 +12,6 @@
 #  define ASM_CONST(x)		__ASM_CONST(x)
 #endif
 
-/*
- * Inline assembly memory constraint
- *
- * GCC 4.9 doesn't properly handle pre update memory constraint "m<>"
- *
- */
-#if defined(GCC_VERSION) && GCC_VERSION < 50000
-#define UPD_CONSTR ""
-#else
 #define UPD_CONSTR "<>"
-#endif
 
 #endif /* _ASM_POWERPC_ASM_CONST_H */
-- 
2.33.0.309.g3052b89438-goog

