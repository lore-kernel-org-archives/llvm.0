Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE625399
	for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 21:19:30 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1bc0d39b52cso9656915ad.2
        for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 14:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693516770; x=1694121570; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QgjZSn+XzRdQtk5CjJzK65S/oVJ5s5Kx/vC5PIMJxmI=;
        b=HNmUKhtdws1oDwqS38+I5LTWWak0ZUM2llKy0yzkuzJtLESVVxCCbxqN30HInlSELr
         5/D533czQ8HkDmqH4jdf901Vq/vxgqy/lZPkoZ05dv0bdC5QYheBoeAOiP6Ghn+SjvfU
         ecxcJdYD4dLbllFWog5IGpx4OpEFZEFwTccik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693516770; x=1694121570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgjZSn+XzRdQtk5CjJzK65S/oVJ5s5Kx/vC5PIMJxmI=;
        b=RA6i5n2xDI2YeV+mHR0zUcezsxBwrKWERgWl2qQoDcOrASc36Qnqq0cvRYgI2Mme4P
         VcCI2965zztmSJtpoB4dDu4Xq4CRcG9lJ938nz7Oy6d/lxUjadc6v0cbgqSkfTIFYxA/
         86DspuR6bm8sniAYGwxS1U3Bz7dxWbrqzyprVzh4pv6T8EyBDL1x3eSMgToQkEZWZ5N3
         Fff0ZRay8OIzFzKlMVOku4vRaiqB+6Mapxgt4JxIwJbB4pf16uZAxWBGH1fvHW17pjP9
         B4gw014SQWIE95r7qz/ESmRmVW0bN2eKP0+QlBAxvcd/fPgRrbZlARRvXLo+0m0X9yCI
         KLIg==
X-Gm-Message-State: AOJu0YydUyW3yvpSqdD3qwxb1u+Ey+E+MhuAZBiiabAuIGjvHt+H8MtG
	MBAB3EaRBAEZb28q26NJoD3f/Q==
X-Google-Smtp-Source: AGHT+IFcGroa+xsbzbiY6btCmK0qXmWudMPFzGB50zP3JbwjFaXDu0oQ03cZQvba4JfNwBFdPyD3zw==
X-Received: by 2002:a17:902:e752:b0:1c3:1316:ea85 with SMTP id p18-20020a170902e75200b001c31316ea85mr834108plf.47.1693516770230;
        Thu, 31 Aug 2023 14:19:30 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c21500b001b9fef7f454sm1652953pll.73.2023.08.31.14.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 14:19:29 -0700 (PDT)
Date: Thu, 31 Aug 2023 14:19:28 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH RFC] init: fix -Wmissing-variable-declarations warning
Message-ID: <202308311411.B2B57B7441@keescook>
References: <20230829-missingvardecl-init-main-c-v1-1-ddf0f1a71215@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829-missingvardecl-init-main-c-v1-1-ddf0f1a71215@google.com>

On Tue, Aug 29, 2023 at 11:38:31PM +0000, Justin Stitt wrote:
> Hi all,
> 
> I was looking to get some help on solving this -Wmissing-variable-declarations
> warning as there is some hope to turn it on for W=1 soon [1].
> 
> When building x86/defconfig with Clang-18 I encounter the following warning:
> | init/main.c:189:13: warning: no previous extern declaration for non-static variable 'envp_init' [-Wmissing-variable-declarations]
> |   189 | const char *envp_init[MAX_INIT_ENVS+2] = { "HOME=/", "TERM=linux", NULL, };
> |       |             ^
> | init/main.c:189:7: note: declare 'static' if the variable is not intended to be used outside of this translation unit
> |   189 | const char *envp_init[MAX_INIT_ENVS+2] = { "HOME=/", "TERM=linux", NULL, };
> |       |       ^
> 
> It seems like the obvious solution is to just add the `static` keyword
> and be done with it. I suspect, however, that it is not so simple for
> the following reasons:
> 
> Firstly, `envp_init` is surrounded by two other variables that have been
> explicitly marked as `static` which leads me to believe that this one
> was intentionally _not_ marked as static for some reason:
> | static const char *argv_init[MAX_INIT_ARGS+2] = { "init", NULL, };
> | static const char *envp_init[MAX_INIT_ENVS+2] = { "HOME=/", "TERM=linux", NULL, };
> | static const char *panic_later, *panic_param;

I went looking to see the history here and it goes beyond git history.  :)

> 
> Secondly, there exists this `extern` declaration for `envp_init`:
> | init/do_mounts_initrd.c
> | 90:     extern char *envp_init[];

This is the only user of call_usermodehelper_setup() that doesn't make
its own envp. And there's a deprecation warning in that function too:

9acc17baf1fd6   (Christoph Hellwig      2020-07-08 18:18:54 +0200 93)     pr_warn("using deprecated initrd support, will be removed in 2021.\n");

> Any help here would be appreciated!

I recommend making it static and giving handle_initrd() its own copy:

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

-- 
Kees Cook
