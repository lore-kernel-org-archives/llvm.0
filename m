Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86247620
	for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 01:11:26 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id r184so1414499ybc.1
        for <llvm@lists.linux.dev>; Thu, 13 Apr 2023 18:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1681434685; x=1684026685;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7e9/bDdYQAc83BC4MHDH3UDjIiFTqWrXhp7UGil91Hk=;
        b=m0I1OAhWKDHDBZQTvnG6xsnO8mMGI98gmBYjuyRMurhRwBnzUlYwgnKaAFqkss5g6o
         fBZH1Buv3LgFfK2v4g/v/+d0hkF6wnnrsBVD0RoTbW8svuo/yQQ3mwtzeUZ/pycBU11g
         X/wQyVR92Y0GAu1dNqKtQp9jmySHLDnLsSMxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681434685; x=1684026685;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7e9/bDdYQAc83BC4MHDH3UDjIiFTqWrXhp7UGil91Hk=;
        b=G2Rk+ZIo+o+zyL47gA5b0MpiwGTo9+Sw3v7LRG95pPjaWQ3humJmEfMu9U00SAFv2I
         T/kXxTJCxV6A229/7QqFCVm9GgvlQkrMjFIzwCAFOGsGOP7Lfd982JwcoGCDwaKH1IP/
         qet5QGYMfEZv4yW6ObpKptgSWBuk//SbrwAWw+GTHKjILjqCq0MoGulKQQSdx9ZGDRLl
         GFfx7nvqQVQFRYOudGINPZEpwMPC+r15GjT5ngEElsfofj73WaZGN4DdBF8PuxJKHSNf
         ArJG2QCQFa3nag6YZjHqFjk5Vne5tkb6Obm8J2nhHsV37AL1aDIwOFgv0VSSIrUKiNeN
         YREw==
X-Gm-Message-State: AAQBX9c4RYkXTLvFiuYAIwIESBd0DD0CV3arSDw8daFh+mUcvCBl54oh
	EzcIqMqFmrLwBcgjoO5jbQIVRG0EYvShqGT/670U1Q==
X-Google-Smtp-Source: AKy350YPjhOs/a0tAHLcIqdFYyG6No7a5BIJAJagNLInoVfFY0LHcLiTAtVRduj956RTfEfpx+pbyV5ufn1zwDDaOEw=
X-Received: by 2002:a25:d08d:0:b0:b8f:5492:852f with SMTP id
 h135-20020a25d08d000000b00b8f5492852fmr2637618ybg.2.1681434685270; Thu, 13
 Apr 2023 18:11:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230414005309.GA2198310@google.com>
In-Reply-To: <20230414005309.GA2198310@google.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Thu, 13 Apr 2023 21:11:14 -0400
Message-ID: <CAEXW_YRm62XHtpw4Ubp7x3n9jZJNGezRp0ymOGbQ3e62mysz1w@mail.gmail.com>
Subject: Re: clangd cannot handle tree_nocb.h
To: rcu@vger.kernel.org, ndesaulniers@google.com, nathan@kernel.org, 
	trix@redhat.com, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	paulmck@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

One way to fix this could be to add this to the beginning of tree_nocb.h

/* Make clangd understand tree_nocb.h */
+#ifdef CLANGD_PARSER_ACTIVE
+#define TREE_NOCB_H_CLANGD
+#include "tree.c"
+#endif

And then at the end of tree.c, do this to prevent recursion:
+#ifndef TREE_NOCB_H_CLANGD
 #include "tree_nocb.h"
-#include "tree_plugin.h"
+#endif
+#include "tree_plugin.h"

Then in scripts/clang-tools/gen_compile_commands.py, we can just make
it add "-DCLANGD_PARSER_ACTIVE" to all compile command entries in the
JSON file.

Would that be an acceptable solution? Let me know your opinion (both
Paul and clangd people :)) so I can work on a patch to do this.

 - Joel



On Thu, Apr 13, 2023 at 8:53=E2=80=AFPM Joel Fernandes <joel@joelfernandes.=
org> wrote:
>
> Hello!
>
> I have been trying to get clangd working properly with tree_nocb.h. clang=
d
> trips quite badly when trying to build tree_nocb.h to generate ASTs.
>
> I get something like this in the clangd logs showing it 'infers' how to b=
uild
> tree_nocb.h because it could not find a command in compile_commands.json:
>
> ASTWorker building file [..]/tree_nocb.h version 9 with command inferred =
from
> [..]/kernel/rcu/tree.c
>
> This leads to all hell breaking lose with complaints about missing rcu_da=
ta
> struct definition and so forth.
>
> So far I came up with a workaround as follows, but is there a better way?
>
> 1. Open compile_commands.json and add a new entry as follows, with a
> definition "-DNOCB_H_CLANGD_PARSE". Otherwise the entry is indentical to =
how
> tree.c is built.
>
>   {
>     "arguments": [
>       "/usr/bin/clang",
>       "-Wp,-MMD,kernel/rcu/.treenocb.o.d",
>       "-nostdinc",
>       "-I./arch/x86/include",
>       "-I./arch/x86/include/generated",
>       "-I./include",
>       "-I./arch/x86/include/uapi",
> [...]
>       "-Wformat-zero-length",
>       "-Wnonnull",
>       "-Wformat-insufficient-args",
>       "-Wno-sign-compare",
>       "-Wno-pointer-to-enum-cast",
>       "-Wno-tautological-constant-out-of-range-compare",
>       "-Wno-unaligned-access",
>       "-DKBUILD_MODFILE=3D\"kernel/rcu/tree\"",
>       "-DKBUILD_BASENAME=3D\"tree\"",
>       "-DKBUILD_MODNAME=3D\"tree\"",
>       "-D__KBUILD_MODNAME=3Dkmod_tree",
>       "-DNOCB_H_CLANGD_PARSE",
>       "-c",
>       "-I",
>       "/s/",
>       "-I",
>       "/s/",
>       "-o",
>       "kernel/rcu/tree_nocb.h.o",
>       "kernel/rcu/tree_nocb.h"
>     ],
>     "directory": "/usr/local/google/home/joelaf/repo/linux-master",
>     "file": "/usr/local/google/home/joelaf/repo/linux-master/kernel/rcu/t=
ree_nocb.h",
>     "output": "/usr/local/google/home/joelaf/repo/linux-master/kernel/rcu=
/tree_nocb.h.o"
>   },
>
> 2.
> Then in kernel/tree/tree_nocb.h, I do the following right in the beginnin=
g.
> (Thanks to paulmck@ for this idea).
>
> #ifdef NOCB_H_CLANGD_PARSE
> #include "tree.c"
> #endif
>
> 3. To prevent the above inclusion of tree.c from recursively including
> tree_nocb.h, I do the following at the end of tree.c
>
> +#ifndef NOCB_H_CLANGD_PARSE
>  #include "tree_nocb.h"
> -#include "tree_plugin.h"
> +#endif
> +#include "tree_plugin.h"
>
> With that it works, but if I ever generate compile_commands.json again, t=
hen
> I'll have to again modify compile_commands.json manually to make my edito=
r
> work again with clangd.
>
> So I guess my questions are:
>
> 1. Is there a 'standard' procedure to solve something like this?
>
> 2. How do we fix this the right way?
>    One way would be for scripts/clang-tools/gen_compile_commands.py to pa=
rse
>    header files and generate suitable compile_commands.json based on
>    meta-data in the header file.
>
> 3. How do we fix this for other header files in general? Do we have to ma=
ke hacks like
>    above (sad face) or can we come up with a standard way to make it work=
 for kernel
>    sources?
>
> Thank you!
>
>  - Joel
>
>
>
>
>
>
