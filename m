Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5DB66C5
	for <llvm@lists.linux.dev>; Wed, 23 Mar 2022 19:30:34 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id g9so2138103ybf.1
        for <llvm@lists.linux.dev>; Wed, 23 Mar 2022 12:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=4GBPXMmjtCwB7t0ecjf/4IevMdb1dyWXSGcgSEXFlT8=;
        b=qtl+lhBaAMthvQDwCYrV6oxBbC+PpsvyuQLj9/TyMc0cCgyzg/Dls7Uf4lCluf5sOx
         DLyYicn0h5x101JHYSFSrbZBA4YBboKhpgxZfOIKjKBJ2fmLJallwWJEKPTccS1jQp1N
         pK7eIgpawC5cyF/cod72+8hmqN2tddQFpB8QHs0bk+RHqPXOLUmLC92QqzEAdKmupkbp
         U7yHXUEuFIn0IDBY6zm3qkGjbtTWJBjSuaIvGL4CEZrV4MB7t/9F10KLzqsDEfy54MyJ
         tD0/BzuWdLkom/QcU8WK1EwzwLFsnOdMTiBx74ASzxaxaG263bKSDlK7cM+2QoU2LSZ7
         uqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=4GBPXMmjtCwB7t0ecjf/4IevMdb1dyWXSGcgSEXFlT8=;
        b=fBAszoVcV0JsNsC7A3txQH2Xczaleyxqeso9S7TrYUt9ImoMIhPsrZdWXPeAmCtM8Q
         3JfZSBAK7qY0US3gY5jO8APC5BwMEGgGZXPNF8JD5V/TWg5u03y4ny9H6qD41P5oGiSY
         blNu+O2M2F2NGkZvhs3F9IH6h17FGy5v6MrmA6wpxXTEazOOYQbO2Hn4ttYLetGJE7gT
         +UaPZreOUWTBwLHN7KQgw87xe6/c9yGO3iQVXiq9aYQMi3TFpHu2dEWqb9oQKCnjFtGX
         X29imlJq5TE+BJibSSAW1TpXRzH5k57nKduwsgfobg38q+/thLZATP59d5Yz1T99JBz+
         B5rA==
X-Gm-Message-State: AOAM531exKZGRHRjOty1fn1evRlZIOeh/jIEAPnhkSf3zmRe5FR79nXg
	9pVub5+eaIpvkFnHOuBygYZIy8SPJqc21HtaWYI=
X-Google-Smtp-Source: ABdhPJxZ1MSoLDdKHZky2vco5xm5QrfsdbxxW3/Aqho9hXPfRJJqaLRTKCYfMAcuhHnxTxfnVEZsegttbk9HVYJbwuQ=
X-Received: by 2002:a25:d95:0:b0:633:771f:6118 with SMTP id
 143-20020a250d95000000b00633771f6118mr1635509ybn.122.1648063833053; Wed, 23
 Mar 2022 12:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Charlemagne Lasse <charlemagnelasse@gmail.com>
Date: Wed, 23 Mar 2022 20:30:22 +0100
Message-ID: <CAFGhKbyifH1a+nAMCvWM88TK6fpNPdzFtUXPmRGnnQeePV+1sw@mail.gmail.com>
Subject: Re: [PATCH] x86: bug.h: merge annotate_reachable into _BUG_FLAGS for __WARN_FLAGS
To: ndesaulniers@google.com
Cc: adobriyan@gmail.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	hpa@zytor.com, jpoimboe@redhat.com, linux-kernel@vger.kernel.org, 
	linux-sparse@vger.kernel.org, llvm@lists.linux.dev, 
	luc.vanoostenryck@gmail.com, mingo@redhat.com, nathan@kernel.org, 
	peterz@infradead.org, tglx@linutronix.de, x86@kernel.org, 
	Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> @@ -75,9 +77,9 @@ do {                                \
>   */
>  #define __WARN_FLAGS(flags)                    \
>  do {                                \
> +    __auto_type f = BUGFLAG_WARNING|(flags);        \
>      instrumentation_begin();                \
> -    _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));        \
> -    annotate_reachable();                    \
> +    _BUG_FLAGS(ASM_UD2, f, ASM_REACHABLE);            \
>      instrumentation_end();                    \
>  } while (0)

This causes following sparse warning on x86:

make allnoconfig && touch init/version.c && make CHECK="sparse
-Wshadow"  C=1 init/version.o
#
# No change to .config
#
 CALL    scripts/checksyscalls.sh
 CALL    scripts/atomic/check-atomics.sh
 CHK     include/generated/compile.h
 CC      init/version.o
 CHECK   init/version.c
init/version.c: note: in included file (through
include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h,
include/linux/utsname.h):
./include/linux/rcupdate.h:1007:9: warning: symbol 'f' shadows an earlier one
./include/linux/rcupdate.h:1001:47: originally declared here


Affected versions (from the ones on kernel.org):

* 5.17 - bfb1a7c91fb7 ("x86/bug: Merge annotate_reachable() into
_BUG_FLAGS() asm")
* 5.16.17 - fe0c95903a68 ("x86/bug: Merge annotate_reachable() into
_BUG_FLAGS() asm")

Cannot be seen when changing the variable name:

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index bab883c0b6fe..cbd11e38252a 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -77,9 +77,9 @@ do {                                \
  */
 #define __WARN_FLAGS(flags)                    \
 do {                                \
-    __auto_type f = BUGFLAG_WARNING|(flags);        \
+    __auto_type __f = BUGFLAG_WARNING|(flags);        \
     instrumentation_begin();                \
-    _BUG_FLAGS(ASM_UD2, f, ASM_REACHABLE);            \
+    _BUG_FLAGS(ASM_UD2, __f, ASM_REACHABLE);            \
     instrumentation_end();                    \
 } while (0)
