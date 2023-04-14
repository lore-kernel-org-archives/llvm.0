Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97423620
	for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 00:53:11 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id l11so18208344qtj.4
        for <llvm@lists.linux.dev>; Thu, 13 Apr 2023 17:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1681433590; x=1684025590;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u6ht6VeS0SYKV/SXdhYfuGvwNi3nriuxD0cNinrb83g=;
        b=duedhMmGMNRKLOW7F4MD1jMvtneIgcC6F5J3y2xm5PnUBFiC6YzEBKoc3sukHb46wo
         umdd53NagWIYzOWck9jCuvIO3VY2EqBwCe6ZZz1502+JhWZdEgRrIYzbc3J43HIjTcd7
         ymGLvZyWVztbmkmCTD7agyZ9C7yAdhPMiaNzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681433590; x=1684025590;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u6ht6VeS0SYKV/SXdhYfuGvwNi3nriuxD0cNinrb83g=;
        b=ddHmSoLFSxx9A6DTLlvIBieQLqoH3kyweqFcSZqVp90brAELU759FGgOI15q3reIyz
         ScdYXq3I7ZWEpZ3lCWL4qe7Lgv2zfntgVQJr8E8vbmxb47OwuwAoW6hNcIkj989e4QYS
         V9NfXH8bWLb2BIoV/tGma69jxZBoQK8auFouVNpT3qquYBbXNM5LZHzzNTRsUl8Pcsmp
         n+anNtpU3efCnPetM/CadbjV7VSpv9RHi7wUW6Jfy59MosMwLqlUfuosKhRZut18w8w2
         x2u4qtEEo8UmtDEG91AYGTnoTSRDt1J047OiZWcSX1UymgbeySsH6maTUoYluImHhjX7
         lRMQ==
X-Gm-Message-State: AAQBX9cbtz4pPB6GS18YoZ15AcKWC96krDzkAkiIbsBMwypb1/pub/BW
	iXnSZLOU/Tj/WBtN77TqMD/zcw==
X-Google-Smtp-Source: AKy350ZHeQYY3Mlpr5qR+jlU5dWCzqny5lOsxPfsSHe+prE7uemkv7G6mzqEfhhWcWn2SeBKVItI2Q==
X-Received: by 2002:a05:622a:1aa1:b0:3e3:8bcd:23cb with SMTP id s33-20020a05622a1aa100b003e38bcd23cbmr5836300qtc.29.1681433590254;
        Thu, 13 Apr 2023 17:53:10 -0700 (PDT)
Received: from localhost (129.239.188.35.bc.googleusercontent.com. [35.188.239.129])
        by smtp.gmail.com with ESMTPSA id qb4-20020a05620a650400b0074ace1dbd83sm861835qkn.39.2023.04.13.17.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 17:53:09 -0700 (PDT)
Date: Fri, 14 Apr 2023 00:53:09 +0000
From: Joel Fernandes <joel@joelfernandes.org>
To: rcu@vger.kernel.org, ndesaulniers@google.com, nathan@kernel.org,
	trix@redhat.com, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	paulmck@kernel.org
Subject: clangd cannot handle tree_nocb.h
Message-ID: <20230414005309.GA2198310@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

I have been trying to get clangd working properly with tree_nocb.h. clangd
trips quite badly when trying to build tree_nocb.h to generate ASTs.

I get something like this in the clangd logs showing it 'infers' how to build
tree_nocb.h because it could not find a command in compile_commands.json:

ASTWorker building file [..]/tree_nocb.h version 9 with command inferred from
[..]/kernel/rcu/tree.c

This leads to all hell breaking lose with complaints about missing rcu_data
struct definition and so forth.

So far I came up with a workaround as follows, but is there a better way?

1. Open compile_commands.json and add a new entry as follows, with a
definition "-DNOCB_H_CLANGD_PARSE". Otherwise the entry is indentical to how
tree.c is built.

  {
    "arguments": [
      "/usr/bin/clang",
      "-Wp,-MMD,kernel/rcu/.treenocb.o.d",
      "-nostdinc",
      "-I./arch/x86/include",
      "-I./arch/x86/include/generated",
      "-I./include",
      "-I./arch/x86/include/uapi",
[...]
      "-Wformat-zero-length",
      "-Wnonnull",
      "-Wformat-insufficient-args",
      "-Wno-sign-compare",
      "-Wno-pointer-to-enum-cast",
      "-Wno-tautological-constant-out-of-range-compare",
      "-Wno-unaligned-access",
      "-DKBUILD_MODFILE=\"kernel/rcu/tree\"",
      "-DKBUILD_BASENAME=\"tree\"",
      "-DKBUILD_MODNAME=\"tree\"",
      "-D__KBUILD_MODNAME=kmod_tree",
      "-DNOCB_H_CLANGD_PARSE",
      "-c",
      "-I",
      "/s/",
      "-I",
      "/s/",
      "-o",
      "kernel/rcu/tree_nocb.h.o",
      "kernel/rcu/tree_nocb.h"
    ],
    "directory": "/usr/local/google/home/joelaf/repo/linux-master",
    "file": "/usr/local/google/home/joelaf/repo/linux-master/kernel/rcu/tree_nocb.h",
    "output": "/usr/local/google/home/joelaf/repo/linux-master/kernel/rcu/tree_nocb.h.o"
  },

2.
Then in kernel/tree/tree_nocb.h, I do the following right in the beginning.
(Thanks to paulmck@ for this idea).

#ifdef NOCB_H_CLANGD_PARSE
#include "tree.c"
#endif

3. To prevent the above inclusion of tree.c from recursively including
tree_nocb.h, I do the following at the end of tree.c

+#ifndef NOCB_H_CLANGD_PARSE
 #include "tree_nocb.h"
-#include "tree_plugin.h"
+#endif
+#include "tree_plugin.h"

With that it works, but if I ever generate compile_commands.json again, then
I'll have to again modify compile_commands.json manually to make my editor
work again with clangd.

So I guess my questions are:

1. Is there a 'standard' procedure to solve something like this?

2. How do we fix this the right way?
   One way would be for scripts/clang-tools/gen_compile_commands.py to parse
   header files and generate suitable compile_commands.json based on
   meta-data in the header file.

3. How do we fix this for other header files in general? Do we have to make hacks like
   above (sad face) or can we come up with a standard way to make it work for kernel
   sources?

Thank you!

 - Joel






