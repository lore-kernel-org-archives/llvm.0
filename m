Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464A53D8B
	for <llvm@lists.linux.dev>; Wed, 19 Jul 2023 06:53:27 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b88f151d8eso311295ad.0
        for <llvm@lists.linux.dev>; Tue, 18 Jul 2023 23:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689749606; x=1692341606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nk80EAfGKzf/xri9kwXUcU9jVWCA389cS7mits424YA=;
        b=hZfYk8s83fiu9qJMl/X9eeiEHso/RSs7yW6z9Wd4QOJXrPTUwZWw+sEI2EigaKWYov
         bUlMTLDEhPpkWo5I1rNYWAltJx39Z1onOV154V4oafYxncnyU3vuUT8frNuFFZPZWpP4
         sNJEk1qXJa3TSwSTyzhhT0sdKlQTVXtnL1w54C40nOVMua+293bWzabVrHnnSwtuKSD0
         Y3zKmkNSyfX/+caa7YiolCq4GB500X+UT5Em6nBadbfPd1RFOkzFde1nUrkBWigDcpnR
         ljB59Er4UVznbrE7ZtDBA9awF5bkzok0gjqMdTOvwuT+mdcuoaGfCg450yrElzD1r2tr
         QJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689749606; x=1692341606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nk80EAfGKzf/xri9kwXUcU9jVWCA389cS7mits424YA=;
        b=Ms9VEBAnB9gaEDMfCRQ0+DOnBYYZAFkInU9x2RxN639UAtvJad9IFGXz6qFQGq2o/4
         QFjT1XYdgXEk5cBEgu2dJWe84HGgTa22DtdtmIeYuUtcDl7HFkjdDc94tswMbu04GZKN
         n5owXqqwZFWWL9arnJZ3ds+7avflQf/URKOKvenV1TsUDD1A4AhY/Poi9xMR5csxbK/d
         K89SleJ8X2AsH6OZqzVningcmizugNDRTewL+CTCJOlCAPLtcYBgoWB64413/FBGIbh6
         Lap5IFspNKp6UFN6AaiM0f+ei8IUPPMqbECHog54rDvXqxbY83o5lI8hLgq/bDjYI/57
         e9Bw==
X-Gm-Message-State: ABy/qLZpwSjRR3ARJmdwAD/ePtdjy5oo3SNolJQgpezCpVusNjFIPqbA
	vCMDQD2SwSE4NMEfEo9q24gUZg==
X-Google-Smtp-Source: APBJJlFM8GZq0vS9Wbtv7TglnMtHa09kaCapBO/DjhYtHqM+DjglEe9oSksGON+qIWme28eRBk5fjw==
X-Received: by 2002:a17:902:d4ce:b0:1b0:36ad:fdf5 with SMTP id o14-20020a170902d4ce00b001b036adfdf5mr394147plg.17.1689749606403;
        Tue, 18 Jul 2023 23:53:26 -0700 (PDT)
Received: from google.com (25.11.145.34.bc.googleusercontent.com. [34.145.11.25])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0067b643b814csm2550051pfb.6.2023.07.18.23.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 23:53:25 -0700 (PDT)
Date: Wed, 19 Jul 2023 06:53:23 +0000
From: Fangrui Song <maskray@google.com>
To: Benjamin Gray <bgray@linux.ibm.com>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] gen_compile_commands: add assembly files to compilation
 database
Message-ID: <20230719065323.uxuax6pzlpqcwgsl@google.com>
References: <20230719031912.224843-1-bgray@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230719031912.224843-1-bgray@linux.ibm.com>

On 2023-07-19, Benjamin Gray wrote:
>Like C source files, tooling can find it useful to have the assembly
>source file compilation recorded.
>
>The .S extension appears to used across all architectures.
>
>Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
>
>---
>
>For example, I'm prototyping adding ASM support to clangd. It can use
>this information to determine the architecture, macros definitions,
>include paths, etc. on a per-file basis. I can capture this during
>compilation with tools like bear, but given this script exists and the
>change is trivial it seems like a good idea to adjust this script too.
>---
> scripts/clang-tools/gen_compile_commands.py | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
>index 15ba56527acd..a84cc5737c2c 100755
>--- a/scripts/clang-tools/gen_compile_commands.py
>+++ b/scripts/clang-tools/gen_compile_commands.py
>@@ -19,7 +19,7 @@ _DEFAULT_OUTPUT = 'compile_commands.json'
> _DEFAULT_LOG_LEVEL = 'WARNING'
>
> _FILENAME_PATTERN = r'^\..*\.cmd$'
>-_LINE_PATTERN = r'^savedcmd_[^ ]*\.o := (.* )([^ ]*\.c) *(;|$)'
>+_LINE_PATTERN = r'^savedcmd_[^ ]*\.o := (.* )([^ ]*\.[cS]) *(;|$)'
> _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
> # The tools/ directory adopts a different build system, and produces .cmd
> # files in a different format. Do not support it.
>-- 
>2.41.0
>

Yes, this is also useful for my tool ccls:)
I agree that for assembly files, the compile_commands.json entries are
only useful for C preprocessing directives like #include and macros, so
.S files are needed but .s files are not. In addition, the kernel doesn't seem to have .s
files.

Reviewed-by: Fangrui Song <maskray@google.com>
