Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6CD747B
	for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 19:47:30 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-58d428d4956so2307337b3.0
        for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 12:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693424849; x=1694029649; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JE+0J4LE2Y9WLJA4sbzDU6bKkGcfTw3IfTNM4aZ8RZg=;
        b=Ni0Q4+Ga9uOHc9w5UVwVrxWDWIyTyR6b0vjCoK7cRQ4a1JUabVYJosctLsYqxU53gh
         prbbv1AwfjCPDN86BHojsTWwIJIZD44v88B70bwDPtMcwdlB27pYheU1dbuH/CqrKF5D
         0UKAe37MLZZHjL/pGnIB4Gru/eUyxhpR58zAIJ8wS4+nZlB+TuJxI2lhqwhN0A4pyTA0
         AZh9fbAhRICsVoxs+sSyGyOkr7GG3kHY2JErjsc73DhzIVNf9trzmFXD/ljGRp94V9wL
         Rr1Qj+Eu7gCrBL/508Bv5sQmubo4q//OgtlAPpi8TZSc6CCBDwXlU7tHSSF0aS7wSVey
         zATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693424849; x=1694029649;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JE+0J4LE2Y9WLJA4sbzDU6bKkGcfTw3IfTNM4aZ8RZg=;
        b=DkBqJ8ZnNATNgr7YUjJoM6XRK+499S+qlYUvMaoQdaXoxEoDbuP3aE7hjarnHG6+BG
         h5u9Zjs4ZtuSLp7GhXf0bO+RkEAX+5BQEBtmxSWW7yZ7YjHuPvoYssY7O36rHKJrR5Yy
         hCbRVmGYc8v3FlRrSoPImTs2uisHT4FnPMnjOWbW35DgKXJyC0QGpEQ4N/LQewpSO5Up
         6STgI0fOQJYxRWWEVEiBVqjzndC2jbd2JgsYHVvzUyZGS/eKKIne/fg06C/uS3aG0avQ
         sfZ1ExP+zaLdTN03F3L84IWdzct+e41QITp7GICgxBgCHI8Kb5tsbFGWlpZKvXzqT3hP
         8Tkw==
X-Gm-Message-State: AOJu0YzqQeh9N0hAnzdf99S8SF718y8cpT8UJP+8gusghYTSxgNXcV9D
	fz7pPNXPjDdzN5wrekVvmJFwWPRE30SqcTYlBw==
X-Google-Smtp-Source: AGHT+IHs+RWMaNtA93jfYo5odypjlgOLH3hb204BRKjTj2NCRouc7VuVWQozkwCmR1nmpUaVeTHB/jrtkwAiF+KhVg==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:1287:b0:d7b:92d7:5629 with
 SMTP id i7-20020a056902128700b00d7b92d75629mr109004ybu.8.1693424849002; Wed,
 30 Aug 2023 12:47:29 -0700 (PDT)
Date: Wed, 30 Aug 2023 19:47:06 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALmc72QC/x3MTQqDMBAG0KvIrDuQn43tVYqLkEz0gzotGZGCe
 HeDy7d5B5k0iNFrOKjJDsNXO/xjoLwknYVRuim4EN0YHa8wg857akXyJzAUG68JypmfsWTvfKx 1TNSHX5OK/72/p/O8AFfl655tAAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693424848; l=2357;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=GIGvI2tq5BYA3OyOut6s0LymlGqm3neCSz8tHLPc2Nw=; b=4KSwwoIvqS8EU5l3yCMv60/x1oUuI+qdr3mOXLmSXbCSA/rG1Q6mfxjytKCd/Cwa5MZki1/Tt
 u3meMQNbnlwBfXxiAse3Eqxqa2iuxvKCHAz+Iqtn37lXFZ85ufdHtch
X-Mailer: b4 0.12.3
Message-ID: <20230830-missingvardecl2-init-main-c-v1-1-59007a637259@google.com>
Subject: [PATCH] init: fix -Wmissing-variable-declarations clang warning
From: Justin Stitt <justinstitt@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Peter Zijlstra <peterz@infradead.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

When building x86/defconfig with Clang-18 I encounter the following warning:
| init/main.c:189:13: warning: no previous extern declaration for non-static variable 'envp_init' [-Wmissing-variable-declarations]
|   189 | const char *envp_init[MAX_INIT_ENVS+2] = { "HOME=/", "TERM=linux", NULL, };
| init/main.c:189:7: note: declare 'static' if the variable is not intended to be used outside of this translation unit
|   189 | const char *envp_init[MAX_INIT_ENVS+2] = { "HOME=/", "TERM=linux", NULL, };

Move the extern declaration to a header file so that the compiler can find it
when compiling init/main.c.

Add `const` qualifier to extern declaration so that the types match and
we follow the One-Definition Rule (ODR).

Link: https://github.com/ClangBuiltLinux/linux/issues/1920
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.

There's a previous RFC [1] wherein the kernel test robot reported some
build errors which lead me to creating this patch which both fixes the
errors as well as the -Wmissing-variable-declarations warning.

[1]: https://lore.kernel.org/all/20230829-missingvardecl-init-main-c-v1-1-ddf0f1a71215@google.com/

Also, get_maintainer.pl had a hard time finding folks to Cc here, not sure why.
---
 include/linux/initrd.h  | 2 ++
 init/do_mounts_initrd.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index f1a1f4c92ded..0114f1acbb45 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -34,4 +34,6 @@ extern unsigned long __initramfs_size;
 
 void console_on_rootfs(void);
 
+extern const char *envp_init[];
+
 #endif /* __LINUX_INITRD_H */
diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index 425f4bcf4b77..b35c1b0babc2 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -87,7 +87,6 @@ static void __init handle_initrd(char *root_device_name)
 {
 	struct subprocess_info *info;
 	static char *argv[] = { "linuxrc", NULL, };
-	extern char *envp_init[];
 	int error;
 
 	pr_warn("using deprecated initrd support, will be removed in 2021.\n");

---
base-commit: 706a741595047797872e669b3101429ab8d378ef
change-id: 20230830-missingvardecl2-init-main-c-93dc1013ff8a

Best regards,
--
Justin Stitt <justinstitt@google.com>

