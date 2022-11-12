Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601F97B
	for <llvm@lists.linux.dev>; Sat, 12 Nov 2022 09:05:03 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id s196so6201722pgs.3
        for <llvm@lists.linux.dev>; Sat, 12 Nov 2022 01:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mzPh6Amj9ZCyWTqv1xyCzgVH3fgNbAa8SyDTvEXsAa8=;
        b=HVAwRJsL3lI1xd5eAPO1FGyerkPrLz+HOFPPkEyg0Zw0OGcjIiS2Woxrjw9S7naAZp
         Lrk2n4zohcczLqVXz7/Onz46EUPq8KhWyWW8lNMTcYonOCtRpoZ58oEmFjooiSbq/a0/
         nkenpI2Bi2krfe0ouYl6lhc/eEgm3hW9TUF3zCC+YvxBTRb1UtRVb62DShoj8Mx992CA
         4R6rBy4fuR52iP7J5wHpwFUzv+QkPpMv09s3mUWRAniucbVs5TOg2N2D39feD/ZGpMlp
         FfY0NVArOa00Au217GYhnTmz34jENPL5fhVRjOJbvKP17bB8tqdklAy0XMy/q/EuSF0u
         +lCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzPh6Amj9ZCyWTqv1xyCzgVH3fgNbAa8SyDTvEXsAa8=;
        b=aeKu3vKGVrImL0Oziq/K5lT1H0zNn3ZAy6gjjjhihmKEIsPFyXO7Ty0dLiEMU0X9qx
         KrGDrbqsNzvWNJzms3Q2X3jZVDyqiiZ3KtXWGUdG4ObEldUvY0DLdm1+vtMVa0Rg/SGA
         fAM/A1Imb3/5kJyfcwiZfz7jt/dI5jJKYE6v5vOtVhoOFpVMb0pbIYwpKxiu4BhwpZ7W
         j3cNOiuzqEOzF1b7BF14beuWY0//qqvGb2YxR/PFFu8j0eQrizOfuUyDivJ3QrAV/70p
         g0L6d8hpa8nP8wVMAjZeF7qdoSJLVXPE89O0edOZSFv5J0/zV0NBlvt1aSniblnwESwP
         nVrg==
X-Gm-Message-State: ANoB5pklPXQEGtpt2cGGUzo3dmsP6oCesDcazDWZzVWW7NaNVLl/abzh
	kBuq6F8BRtQzh5omaEeLcJ4=
X-Google-Smtp-Source: AA0mqf5YkFjYe3WGjq9zczpwDklDgnH8urSKN7LyqSsTDl/TSTu02QcgtFN6cQwdoaBVHpk/OYP4rQ==
X-Received: by 2002:a63:7e5b:0:b0:470:8098:f0de with SMTP id o27-20020a637e5b000000b004708098f0demr4596295pgn.527.1668243902694;
        Sat, 12 Nov 2022 01:05:02 -0800 (PST)
Received: from fedora.. ([203.220.17.21])
        by smtp.gmail.com with ESMTPSA id oj17-20020a17090b4d9100b00212d9a06edcsm6072611pjb.42.2022.11.12.01.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 01:05:01 -0800 (PST)
From: Samuel Zeter <samuelzeter@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Samuel Zeter <samuelzeter@gmail.com>,
	llvm@lists.linux.dev
Subject: [RESEND PATCH v2 0/2] *** Fix reformat_objdump.awk ***
Date: Sat, 12 Nov 2022 19:04:15 +1000
Message-Id: <20221112090418.284656-1-samuelzeter@gmail.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are two small patches which originally dealt with
the problem found at:

https://github.com/ClangBuiltLinux/linux/issues/1364

The original steps to reproduce were:
$ make -skj"$(nproc)" LLVM=1 LLVM_IAS=1 defconfig
$ scripts/config -e X86_DECODER_SELFTEST
$ make -skj"$(nproc)" LLVM=1 LLVM_IAS=1 olddefconfig bzImage

Which resulted in the error:
arch/x86/tools/insn_decoder_test: warning: objdump says 0 bytes, but
insn_get_length() says 2

Upon inspection it turned out llvm-objdump was formatting its
output differently, which caused objdump_reformat.awk to incorrectly
output its values.

After fixing that bug, a second one was seen where the instruction
"wait" was incorrectly matched with "fwait", which again caused
insn_decoder_test to fail.

Samuel Zeter (2):
  arch/x86/tools/objdump_reformat.awk: Ensure regex matches fwait
  arch/x86/tools/objdump_reformat.awk: Allow for spaces

 arch/x86/tools/objdump_reformat.awk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


base-commit: 151297128990b4b44be8d70b983053831fa857f6
-- 
2.38.1

