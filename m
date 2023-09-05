Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA57DDDD7
	for <llvm@lists.linux.dev>; Tue,  5 Sep 2023 22:43:28 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-594e8207103so32637477b3.2
        for <llvm@lists.linux.dev>; Tue, 05 Sep 2023 15:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693953807; x=1694558607; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AAxkSB4LTMIrDzL3yo0sRFWIBDiM+cwzoHmOo/62+qg=;
        b=ma5xOkfHZJ5kEGpsxEFxyRebYs+HHTclmnnBsQr70LLDfMHglniy+ypBNZFbataGqp
         0X7UBNjnKF8NoD9Y/HfrhQ03vSrYrnzLwzThDWdSSeUJJCxQO0DgzA3ypeke8GYmCyhG
         sDLuGe/LIv2lE+SGqx1veyAlTalICnkjchQ2wcw+R9ChwM5dHpN+gXZ/tAElfQjsaoZb
         UkW2taTIkxtZ7icf7X0HhTd7t+k+TPy0keDPv3wl72SCWRZKxBWERWu4QYdKkIdT0fPH
         taF/+8+A7gWO5PUC/7FeYCA96oRTvk0WrvAh7PeKSUGwkySqu2S3Dyw4YIDz3qoactBD
         bUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693953807; x=1694558607;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AAxkSB4LTMIrDzL3yo0sRFWIBDiM+cwzoHmOo/62+qg=;
        b=lw/SzfryCBG2LcHtLP2Bw1ty8m/Ch7m/VWEWpfikr3Gb/ISPKLMP3WpbizI59WqFd9
         6UqqETetRNUGiXf9l+gU2qFvn6BCrvD2W1sjkMhMezy8GaKrfvbPq9sVzC3pDU5qrIvK
         8Cy0AnHxTdHs2NDhG8l4G4YGEzISbZSoVwNHl5nfQlUHVwZ0bPWCqczCCYWJB28WYOxw
         YzbZMVmhy3r9AprVdeFuSHmWSvVuv0chqRV97mi5Mo6S3fglyBbwiWOBBDPxvkrIOqN/
         PzY0kqj+aUzNKYg4o2IxGU1xtiVJFcWajaHiGAdF6LfKu4GgQ+VkX+StI7XpMsVgqj6l
         gFJg==
X-Gm-Message-State: AOJu0Yxu6zDG5N2sKLpCfjV2Yc9WdXHgxl2tCD1+lH6nB4PVGXDh/+hD
	Kb4U1uU8TU5RJknLN9LrTcsTHUnYOQG7ukFtEA==
X-Google-Smtp-Source: AGHT+IGkfcxguu2oZatlIQqfrDF13+qN7//v0B3M0PVplRmGp4NbwSq2ZDy1TBnvyUxJR74WyHNWu1hz9O+i3hLCyQ==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:7e02:0:b0:583:9ace:cf41 with SMTP
 id o2-20020a817e02000000b005839acecf41mr339271ywn.0.1693953807393; Tue, 05
 Sep 2023 15:43:27 -0700 (PDT)
Date: Tue, 05 Sep 2023 22:43:26 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA2v92QC/43NTQqDMBCG4avIrDslP1i1q96juAhxjAOalERCi
 +TuTT1Bl8+3eL8DEkWmBPfmgEiZEwdfoS4N2MV4R8hTNSihtOi1wI1TYu+yiRPZVSF73nEz7NH
 ioCcrhdTz3BuohVekmd9n/TlWL5z2ED/nWZa/9b9uliixHYTozE13qh0eLgS30tWGDcZSyheD2 hyuxwAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693953806; l=3280;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=LUHUcMKNyA83dOPlrrmnaWA5i4/IlBY2l6fBfVmfM9U=; b=hVWv1Bl4sMv0LYQIQE82UOWZwQcoZKpU37nCpmcXve6PXSeUAppfnWBKG8o2Sc2QIQM5djeKS
 FnIzN3wgWRnBEpFMC+REdneiZJ3WWh4md4Yq1nG/J3/1IjRnz1CsCLD
X-Mailer: b4 0.12.3
Message-ID: <20230905-missingvardecl2-init-main-c-v2-1-08498a9cf740@google.com>
Subject: [PATCH v2] init: fix -Wmissing-variable-declarations clang warning
From: Justin Stitt <justinstitt@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, Peter Zijlstra <peterz@infradead.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, Kees Cook <keescook@chromium.org>, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

When building x86/defconfig with Clang-18 I encounter the following warning:
| init/main.c:189:13: warning: no previous extern declaration for non-static variable 'envp_init' [-Wmissing-variable-declarations]
|   189 | const char *envp_init[MAX_INIT_ENVS+2] = { "HOME=/", "TERM=linux", NULL, };
| init/main.c:189:7: note: declare 'static' if the variable is not intended to be used outside of this translation unit
|   189 | const char *envp_init[MAX_INIT_ENVS+2] = { "HOME=/", "TERM=linux", NULL, };

Make `envp_init` static and provide `handle_initrd` its own copy.

This silences the warning and makes the code more readable as you no
longer have to track down extern definitions inside of `handle_initrd`.
It is now more self-contained.

Link: https://github.com/ClangBuiltLinux/linux/issues/1920
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
The kernel test robot didn't like v1 of this patch and I prefer Kees'
approach to simplifying this code anyways so I'm sending this v2.
Hopefully the CI builds clean (as I am locally using their repro).

Changes in v2:
- Make envp_init static and provide handle_initrd() with a copy (thanks Kees)
- Rebase onto mainline (2dde18cd1d8fa)
- Link to v1: https://lore.kernel.org/r/20230830-missingvardecl2-init-main-c-v1-1-59007a637259@google.com
---
Note: build-tested only.

It should be noted that `handle_initrd` has been marked as deprecated
and perhaps the entire thing can be removed as per it's own message:
| using deprecated initrd support, will be removed in 2021.
---
 init/do_mounts_initrd.c | 4 ++--
 init/main.c             | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/init/do_mounts_initrd.c b/init/do_mounts_initrd.c
index 425f4bcf4b77..154bd0de85a6 100644
--- a/init/do_mounts_initrd.c
+++ b/init/do_mounts_initrd.c
@@ -87,7 +87,7 @@ static void __init handle_initrd(char *root_device_name)
 {
 	struct subprocess_info *info;
 	static char *argv[] = { "linuxrc", NULL, };
-	extern char *envp_init[];
+	static char *envp[] = { "HOME=/", "TERM=linux", NULL, };
 	int error;
 
 	pr_warn("using deprecated initrd support, will be removed in 2021.\n");
@@ -100,7 +100,7 @@ static void __init handle_initrd(char *root_device_name)
 	init_mkdir("/old", 0700);
 	init_chdir("/old");
 
-	info = call_usermodehelper_setup("/linuxrc", argv, envp_init,
+	info = call_usermodehelper_setup("/linuxrc", argv, envp,
 					 GFP_KERNEL, init_linuxrc, NULL, NULL);
 	if (!info)
 		return;
diff --git a/init/main.c b/init/main.c
index ad920fac325c..9a473107bb8f 100644
--- a/init/main.c
+++ b/init/main.c
@@ -186,7 +186,7 @@ static int __init set_reset_devices(char *str)
 __setup("reset_devices", set_reset_devices);
 
 static const char *argv_init[MAX_INIT_ARGS+2] = { "init", NULL, };
-const char *envp_init[MAX_INIT_ENVS+2] = { "HOME=/", "TERM=linux", NULL, };
+static const char *envp_init[MAX_INIT_ENVS+2] = { "HOME=/", "TERM=linux", NULL, };
 static const char *panic_later, *panic_param;
 
 static bool __init obsolete_checksetup(char *line)

---
base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
change-id: 20230830-missingvardecl2-init-main-c-93dc1013ff8a

Best regards,
--
Justin Stitt <justinstitt@google.com>

