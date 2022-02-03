Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF052F28
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 20:40:36 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id i30so3203462pfk.8
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 12:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Hq8t2i1lFDyLvRnwg1bUDP5VtBgoor+g4ujd66vONY=;
        b=b6icVWzI0OszIxG8sXwiA9RMdLDR7GUV9sSVvqp5VED5n3y2Oxt2I4+88UHpjlzHLO
         rpQFfWA4VPsCtbVYkl8G9rumQXEkuhu+2viy0b6Qc5212QmPyE4xSmAccbE65MHec9Uc
         tG9k4cQbVJ5DgcewrpbY0J4HTW+IQKpH4KT80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Hq8t2i1lFDyLvRnwg1bUDP5VtBgoor+g4ujd66vONY=;
        b=FlGMzBeCIAlljsU8395R2Q5GoUSNJcVyuSVxPyTQNlRRsIU1WY0APTT/LY/nQnX5ty
         zp2lwhDkGk8SH2Kk9wg5Ir65l3Y6ldy/HzoG8hhMlCelHSBhqg+2dEKtRAawqhj7sVoc
         G4pjqa5eUSzm5or/o3hfBmVNkN+XKp3gvkAKjaz0onCM7Ihv80rnMn5fElJOWHQTimkq
         OJPKHtuNP47Ibje0DSQUo/8irQmVCdvEtY44MUd8qp3tKYk4PoepYEygNdx8LHOhzfMv
         Ucf8Gt3jbm7heuKzGi3vZVgF1Dyzpo3m9fRtM5zPNrQhvZAq6gnnd8Gzcg0gTVmyJjQG
         WuNg==
X-Gm-Message-State: AOAM532em/9crpZlVCDmzbhPb3YytPPz/0JRrYkD8TOxJL5jiLAIuoiD
	5xLDYkm+i21RvMSaPaFOiKRXRg==
X-Google-Smtp-Source: ABdhPJw2mF4VsA2EY/uYHOsVHlSiVGc2GUGLjvQGcaAihNJ3QVKNN7ZmRuss4J4/DLYfnUaeevtwjw==
X-Received: by 2002:a65:60c3:: with SMTP id r3mr29348450pgv.347.1643920835918;
        Thu, 03 Feb 2022 12:40:35 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z22sm20845328pfe.42.2022.02.03.12.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 12:40:35 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Arvind Sankar <nivedita@alum.mit.edu>,
	Fangrui Song <maskray@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] x86/build: don't build CONFIG_X86_32 as -ffreestanding
Date: Thu,  3 Feb 2022 12:40:25 -0800
Message-Id: <20220203204025.1153397-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2588; i=keescook@chromium.org; h=from:subject; bh=aiPc6rfVyVWJCKagb0y7ieq3kx54f7V2H4+w457nijQ=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBh/D2OPS4PZRzG7eB9tG4/CcwsHg28XpdLQzsy2j+R SeKm02uJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYfw9jgAKCRCJcvTf3G3AJkBND/ 0UWEgLQJQP2+R5E7y4DmNZF5k5JdGBlkXZL0IIlONprPjQFuw89jHA+HAU+tr+5Tyyu6tyRr02rcke /fh4NYXVdDl4RsvgzhilJKskySMBQ+9+OVoDS2GOlVl9M0R/zAtqnu+Y2MEBkeyq7Xpkzl//Emm17x 5X5krdYmXEzDZnn9KLxDibxKjybpBi4LFa4nFiefUnejjHtjiNx2t8WKGxvQoUn9hNEfAsFCnUXV5/ Ax298EcnluDNSx0rPDHRDctiFBr2Qwq7ZpXHdLQz9WZTOelKktJyBRBI+gWCHcdkSa/7H99Ec7uMY6 +fnUSaeseXl9gOGYINtD4ssfihdlC0A10aNxRiZpu8wNKQ8vs57zAc7Y03c0Q0M+dW/pFNqLWRNBDV y5WsYF2hodjEyGHoEmZZA1NqISeL1NDVI+T2E4u9TeotF/57OmZjsTU/7QJh6SXiwg848hsITVpYD8 rl3CpqvBzxhWvyXLXNC6wExhyLQB4PlVu39xquc+YwxAJkLzVEhraKfIQ2ukjT+4422Zn7O9ckZoPM foA2BMgXiC59qaDZNh3uNyxxdlRvA6ZRMZsc6jAItj5nogkEF0ZLEbhpZztkuj/n5e0VsXOlfl/TOJ nLNw7PvVYlGCYYZTJgnYO34NyNEaFe1pTmcPI04Brr6Vpwj1aZ8HglSBLrzw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

From: Nick Desaulniers <ndesaulniers@google.com>

-ffreestanding typically inhibits "libcall optimizations" where calls to
certain library functions can be replaced by the compiler in certain
cases to calls to other library functions that may be more efficient.
This can be problematic for embedded targets that don't provide full
libc implementations.

-ffreestanding inhibits all such optimizations, which is the safe
choice, but generally we want the optimizations that are performed. The
Linux kernel does implement a fair amount of libc routines. Instead of
-ffreestanding (which makes more sense in smaller images like kexec's
purgatory image), prefer -fno-builtin-* flags to disable the compiler
from emitting calls to functions which may not be defined.

If you see a linkage failure due to a missing symbol that's typically
defined in a libc, and not explicitly called from the source code, then
the compiler may have done such a transform.  You can either implement
such a function (ie. in lib/string.c) or disable the transform outright
via -fno-builtin-* flag (where * is the name of the library routine, ie.
-fno-builtin-bcmp).

i386_defconfig build+boot tested with GCC and Clang. Removes a pretty
old TODO from the codebase.

[kees: These libcall optimizations are specifically needed to allow Clang
to correctly optimize the string functions under CONFIG_FORTIFY_SOURCE.]

Fixes: 6edfba1b33c7 ("x86_64: Don't define string functions to builtin")
Suggested-by: Arvind Sankar <nivedita@alum.mit.edu>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Fangrui Song <maskray@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20200817220212.338670-5-ndesaulniers@google.com
---
This solves build issues for Clang+FORTIFY, and aligns X86_32 with X86_64
builds again. x86 maintainers: I can carry this in my memcpy topic branch
unless you'd prefer to take it?
---
 arch/x86/Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index e84cdd409b64..7ef211865239 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -88,9 +88,6 @@ ifeq ($(CONFIG_X86_32),y)
         include $(srctree)/arch/x86/Makefile_32.cpu
         KBUILD_CFLAGS += $(cflags-y)
 
-        # temporary until string.h is fixed
-        KBUILD_CFLAGS += -ffreestanding
-
 	ifeq ($(CONFIG_STACKPROTECTOR),y)
 		ifeq ($(CONFIG_SMP),y)
 			KBUILD_CFLAGS += -mstack-protector-guard-reg=fs -mstack-protector-guard-symbol=__stack_chk_guard
-- 
2.30.2

