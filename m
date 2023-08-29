Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55CE6FCD
	for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 23:38:33 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5958487ca15so8203777b3.1
        for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 16:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693352312; x=1693957112; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zbqhUxk3XJw1e+A4t7lsmYAPl18T2q+RlEuDduG9BdM=;
        b=wlhHaFtZrk+u/1cHw3BfhPEBDEpbybQDtDmZ86kgD8gI/QG+7bnRf/HUeN64AjIILG
         9ZufGdKOXg8rRyUs3WWW5cBMSJ0Ch9Eoi1KoF6kT281lG+4AWcSyf/ZHFotAfEcdZtUn
         Z/IEvIEQFn3v8DSG2WQzr7IjH5sVYh0m51EKqwOf+LojlyMzGT09Li0NS7ZY/Vs4xb4G
         WVPNbNXPZ2FmCR/dEQYrBaVImOwNDFyXm2x/3sPWC5i3xv+NcSWUqa8NQsG7Fe2zQHtb
         FTWTlcVWeirRFS/8yv2qct1eJLSczKcdu6AWIRKs3ERsuLDUzsDgWDPsYlvE+Xr+gl9Z
         Nn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693352312; x=1693957112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zbqhUxk3XJw1e+A4t7lsmYAPl18T2q+RlEuDduG9BdM=;
        b=hNi2XOKwOQXba94thJSldTmy/92DeUxRIy72Dx9Pn1Oe7MXVS48rSeM+UMQtaqIz/0
         XoyVThB5I6TyKsIy2UN0T7mNydRVKBrX2rpbp6M7LlijaGprtJsqp1oEhTWxVVFBIBVX
         YIPvMZyeATXC6sWjSiqUpL9qEWtK2RQR84CBmvDvG8eX+idS+6/ZujfNVgGDPANpsSHa
         yBzQ4RvR/FKQ7Jy1xynjgamel+z7jrNx76nf32bQhFbdzpA/GtDQ82NPw8rJuDX5VD8g
         eoVUgHpCLqPkJ4bfkRZxj4yLjBzNONX9auC1648hEn6ocj3TPyTygVHI8Epik0aLcbEG
         BMSg==
X-Gm-Message-State: AOJu0YzJDKCjyKhNAe/r0ByzTcB7AFKZGB7pb3WmxOY2z1PyeCsI+F8e
	NcQqzjgluHUfN1/N8N6fcgDN0h+vD8HOMz8wBA==
X-Google-Smtp-Source: AGHT+IG0i29yCeJNWGDvgkhn5P4cGCTob/N6JmX2ceISwe34Yp/gc6LV0oNlEh++3Fizgxv1CWrToMky1ip88xcjlg==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:d1d4:0:b0:d46:45a1:b775 with SMTP
 id i203-20020a25d1d4000000b00d4645a1b775mr17759ybg.3.1693352312545; Tue, 29
 Aug 2023 16:38:32 -0700 (PDT)
Date: Tue, 29 Aug 2023 23:38:31 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHaB7mQC/x3MMQqDQBAF0KvI1BlwJyk0reAB0oYUyzqaD3GUH
 ZGAePcsKV/zDnLNUKd7dVDWHY7FCsKlovSONiljKCap5Vo30vIMd9i0xzxo+jAMG88RxolDHEW DNLfQKpVgzTri+8+f9Og7ep3nD64BOGZxAAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693352311; l=3109;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=5HjtNq8MgBa1E9HQZr8o9ch/Gsru/UDsHmWMCBaxx6M=; b=0PeQHkUcML8AD1uRsbwY92H7Jt2DVdL+c22t5CO157b05/0M5SywN0VMOvIKUiCdVUqqHYiJr
 DdDwqUsNolKAJbewkvaFWrtk78RX/Od7O+xUvq9L5caQGWLcOjitrQ9
X-Mailer: b4 0.12.3
Message-ID: <20230829-missingvardecl-init-main-c-v1-1-ddf0f1a71215@google.com>
Subject: [PATCH RFC] init: fix -Wmissing-variable-declarations warning
From: Justin Stitt <justinstitt@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Kees Cook <keescook@chromium.org>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

Hi all,

I was looking to get some help on solving this -Wmissing-variable-declarations
warning as there is some hope to turn it on for W=1 soon [1].

When building x86/defconfig with Clang-18 I encounter the following warning:
| init/main.c:189:13: warning: no previous extern declaration for non-static variable 'envp_init' [-Wmissing-variable-declarations]
|   189 | const char *envp_init[MAX_INIT_ENVS+2] = { "HOME=/", "TERM=linux", NULL, };
|       |             ^
| init/main.c:189:7: note: declare 'static' if the variable is not intended to be used outside of this translation unit
|   189 | const char *envp_init[MAX_INIT_ENVS+2] = { "HOME=/", "TERM=linux", NULL, };
|       |       ^

It seems like the obvious solution is to just add the `static` keyword
and be done with it. I suspect, however, that it is not so simple for
the following reasons:

Firstly, `envp_init` is surrounded by two other variables that have been
explicitly marked as `static` which leads me to believe that this one
was intentionally _not_ marked as static for some reason:
| static const char *argv_init[MAX_INIT_ARGS+2] = { "init", NULL, };
| static const char *envp_init[MAX_INIT_ENVS+2] = { "HOME=/", "TERM=linux", NULL, };
| static const char *panic_later, *panic_param;

Secondly, there exists this `extern` declaration for `envp_init`:
| init/do_mounts_initrd.c
| 90:     extern char *envp_init[];

This one is tricky because it seems like I can rename (effectively
remove) this extern symbol entirely and still build a kernel image.

If it truly is the case that this extern declaration works then why does
Clang produce the warning at all?

FWIW, I've tried moving `extern char *envp_init[];` to top-level scope
inside of `do_mounts_initrd.c` which did _not_ work in fixing the
warning.

So all in all, it looks like just adding `static` fixes the warning
(which it does) but I am not sure about the other ramifications of this
patch especially considering the second point I brought up above
regarding the extern declaration already existing (but seemingly not
doing anything).

Any help here would be appreciated!

Link: https://github.com/ClangBuiltLinux/linux/issues/1920 [1]
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 init/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
base-commit: 706a741595047797872e669b3101429ab8d378ef
change-id: 20230829-missingvardecl-init-main-c-1af2e128419e

Best regards,
--
Justin Stitt <justinstitt@google.com>

