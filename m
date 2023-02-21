Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFB733C4
	for <llvm@lists.linux.dev>; Tue, 21 Feb 2023 20:41:49 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id a1so2383257iln.9
        for <llvm@lists.linux.dev>; Tue, 21 Feb 2023 12:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:cc:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ysPH6WPpk5eU7Ka5J53d3h1W3zWHMXnSdV9y5Xs+C1E=;
        b=Nn9ZobLLbydXkfGjLJB+NFQlDhB969riVbUYWeDqDKElp4mXynQXXexrDy0ffT6YK4
         LoGUUYX6NNlTl09hrodIvLY7GmBIcceWjNAegEsFvcRev8u078caDhxO38Fv/L+i8x2/
         JxMK4Ejurbuu4JhDBKiHZwSf4SKsIORadTEsSRqgcjnMpdGc6Q/Jjy7qM6nM/Ysw9EuK
         qOOffUrokZsXg1SCsJ2XJoEfb3S1VJMvYvU5Nc60od4WmEBrUaleGdLosuUbv8ubAj4o
         yViwXi1+ssBG1sK8rmQ7/bbhoULipaDOkKvjSi4bVuiwjkgjVMNqJN6SmEmclDiUuHCq
         AV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:cc:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ysPH6WPpk5eU7Ka5J53d3h1W3zWHMXnSdV9y5Xs+C1E=;
        b=z5pajuPqAV+rXuXnNR3ejnmMDYpxFxvnzKimRSLw0sDr0g7G0VB918PhoY2uB/nIAU
         aVX1b9otqclIrhGBYopY+n/xqKELivgt7P4GSnK7Dc7aAgZsDKyaivchjSfQMMGvu2j9
         Ska5zPwS7laYfiuzqYfxFyBuC5W9gNxQfTB4/5Cf89ZU8H8up8cUe8N0uObb18XD78rb
         JSLsMdXet/oHMa32FfnVQUkpRzALjgEkbh+HTYn+8bWwRC82e1xCWpArOm9bvv37Uc11
         W1V/1S/la4voRT78gpNQFnITsRasOReHtIW2B10yIlMAb76LxFPW5vqGl8nQ/miLXFt2
         qkyw==
X-Gm-Message-State: AO0yUKVCLT5bfbuXGyU+J94lrn21LvPPEtU6qe/0VyXjmIojLEXS6YXm
	hIOEcqV92S6TDxUr1GPbIuRNDg==
X-Google-Smtp-Source: AK7set+m/ErfaYzUwjNelWdQ0lF2N37seZTfz5TRGJJBUqu3bDINdvRcHS7vIN3ei6Z6Q0u7jbbHlA==
X-Received: by 2002:a05:6e02:20e7:b0:316:d9fa:f4fe with SMTP id q7-20020a056e0220e700b00316d9faf4femr3001680ilv.24.1677012108470;
        Tue, 21 Feb 2023 12:41:48 -0800 (PST)
Received: from [172.16.32.78] ([198.232.126.202])
        by smtp.gmail.com with ESMTPSA id d14-20020a02a48e000000b00375783003fcsm6303jam.136.2023.02.21.12.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 12:41:48 -0800 (PST)
Message-ID: <63c2936e-6bc7-67e3-eaf3-0123333381f8@landley.net>
Date: Tue, 21 Feb 2023 14:55:10 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: [PATCH 1/5] try generic compiler name "cc" before falling back to
 "gcc".
Content-Language: en-US
From: Rob Landley <rob@landley.net>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <b455394f-9faa-1f1a-f171-0b9d5e9ada35@landley.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <b455394f-9faa-1f1a-f171-0b9d5e9ada35@landley.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Distros like debian install the generic "cc" name for both gcc and clang,
and the plumbing already does CC_VERSION_TEXT to include Makefile.clang.

Previously: https://lkml.iu.edu/hypermail/linux/kernel/2202.0/01505.html
Signed-off-by: Rob Landley <rob@landley.net>
---
 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 3f6628780eb2..0ac57ae3b45f 100644
--- a/Makefile
+++ b/Makefile
@@ -456,7 +456,7 @@ endif
 HOSTCC	= $(LLVM_PREFIX)clang$(LLVM_SUFFIX)
 HOSTCXX	= $(LLVM_PREFIX)clang++$(LLVM_SUFFIX)
 else
-HOSTCC	= gcc
+HOSTCC	:= $(shell cc --version >/dev/null 2>&1 && echo cc || echo gcc)
 HOSTCXX	= g++
 endif
 HOSTRUSTC = rustc
@@ -503,7 +503,8 @@ OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
 READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
 STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
 else
-CC		= $(CROSS_COMPILE)gcc
+CC		:= $(CROSS_COMPILE)$(shell $(CROSS_COMPILE)cc --version \
+			>/dev/null 2>&1 && echo cc || echo gcc)
 LD		= $(CROSS_COMPILE)ld
 AR		= $(CROSS_COMPILE)ar
 NM		= $(CROSS_COMPILE)nm
