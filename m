Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284133FDD
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 01:08:57 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id u80-20020a627953000000b004c82105f20dso8270870pfc.11
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 17:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=+cGTUlncoKI8qOYBohRERc3y0sAWcqimeQBl8Ab9RTI=;
        b=e+kmca8jtulDGdN54BEXwgAQTzwVvQmOdxghFymavue4yUbH/JhbYwHShmg1mknAC6
         TGWIGxmq/jFX2ptfeKHdKOfDRmgEQ5v4CL5i0MZStw7TyXz0CKikehanAZ6q80gNqdkb
         Ln5rWelPLY+WQKzPp2vu9zFOh71C0LYNRNranTXX76/y2XvUFmFfGmEf/iVuidZzaps1
         CjSQiklb9jr+iJ0X5DmoXGzzY6x4s3D4XjdeLZJcY33tvhR/KBRMFbbVerGg86YRHTIL
         osbxNrDIlYlZl+1rA1VTn8E3fc1/sAuiWV221P8fbNWyWHM3ryGiW4oTC8AqpbxI3xiT
         Avcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=+cGTUlncoKI8qOYBohRERc3y0sAWcqimeQBl8Ab9RTI=;
        b=3LR2l7Exj8jUnNa62k95y0/7BGLpWOHFktOyfyR77xKVNk/dxY1eM0vLXb5BCVlVyI
         Ky0GrQbhJ5nJTw+WScrYtXafYd2gg6hC8QMiBOEA63HbuuTTXZdQSZlwPwxN+vcK18xj
         a0DTwNv7P4ZC8WUbUBTql1r7xlNStjicpF79GzoUbN4DRGoTVtvFvHpshmMQ6D6en2bW
         SWzc3TZ94ioaOAJrZxDkKRRT/kYJlBc/Y1KbVcQjZv53kz0ZPNhb2XwMW9mWUH3qSTK/
         llmaFrfmM689j92TFSXFarrohVx8vhMcAWturjcV5lhhFEi1smBW08zaByeSeKxAbzIo
         QMQg==
X-Gm-Message-State: AOAM531O6YIiUgwRfeCwYf1BPqQoFmNPQ8WV7kl9y3CqT8KLutJddopE
	EMx3JmvkkxFgeATW+A28383XEEhPDA8=
X-Google-Smtp-Source: ABdhPJwCxixihN3pWoO3t60Sv6arP9CVtFwc3hJkZSrBPQ+/8LfdsTga0XZrersZPuDddjA//zRW0Ms6kc8=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:902:c086:: with SMTP id
 j6mr22888340pld.101.1643677736737; Mon, 31 Jan 2022 17:08:56 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Feb 2022 01:08:34 +0000
In-Reply-To: <20220201010838.1494405-1-seanjc@google.com>
Message-Id: <20220201010838.1494405-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220201010838.1494405-1-seanjc@google.com>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH 1/5] Kconfig: Add option for asm goto w/ tied outputs to
 workaround clang-13 bug
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	syzbot+6cde2282daa792c49ab8@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Add a config option to guard (future) usage of asm_volatile_goto() that
includes "tied outputs", i.e. "+" constraints that specify both an input
and output parameter.  clang-13 has a bug[1] that causes compilation of
such inline asm to fail, and KVM wants to use a "+m" constraint to
implement a uaccess form of CMPXCHG[2].  E.g. the test code fails with

  <stdin>:1:29: error: invalid operand in inline asm: '.long (${1:l}) - .'
  int foo(int *x) { asm goto (".long (%l[bar]) - .\n": "+m"(*x) ::: bar); return *x; bar: return 0; }
                            ^
  <stdin>:1:29: error: unknown token in expression
  <inline asm>:1:9: note: instantiated into assembly here
          .long () - .
                 ^
  2 errors generated.

on clang-13, but passes on gcc (with appropriate asm goto support).  The
bug is fixed in clang-14, but won't be backported to clang-13 as the
changes are too invasive/risky.

[1] https://github.com/ClangBuiltLinux/linux/issues/1512
[2] https://lore.kernel.org/all/YfMruK8%2F1izZ2VHS@google.com

Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 init/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index e9119bf54b1f..a206b21703be 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -77,6 +77,10 @@ config CC_HAS_ASM_GOTO_OUTPUT
 	depends on CC_HAS_ASM_GOTO
 	def_bool $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
 
+config CC_HAS_ASM_GOTO_TIED_OUTPUT
+	depends on CC_HAS_ASM_GOTO_OUTPUT
+	def_bool $(success,echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .\n": "+m"(*x) ::: bar); return *x; bar: return 0; }' | $CC -x c - -c -o /dev/null)
+
 config TOOLS_SUPPORT_RELR
 	def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "NM=$(NM)" "OBJCOPY=$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
 
-- 
2.35.0.rc2.247.g8bbb082509-goog

