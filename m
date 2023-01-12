Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799552F33
	for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 22:49:52 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id a14-20020a5b0ace000000b007bf99065fcbso12790647ybr.2
        for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 14:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k1JPjbOQ3twwCwVlAFBMY3qVvPpY8UbYSrJ/ZH6BzqQ=;
        b=C+6arahpXofsQ4/5TXoa5s3dPh2/+h8+T6vNr8Xm5Jzn0MJecvYKer2be4zi2BsNve
         JNselWBnbBC2Yu/KP5VtuxgjMhAKTon4iLNvFm1eT394OkJVIk1JADYH4isIkJJQp/8T
         2zd0rr+pPM4ZkdrjTEEqcR3XhFVlLAnQrpHO8lHul3nEVnyINw44zayX3Si6aU4UGNg9
         l04lOd8ptfdISM/pmHbTFbGnTM2UGvY8qQBcUo98YoSt7MdmGRHknYOGUhtnsbKKSw9m
         rpWntd0bbcM6dihybhM9aDSCiXv5ulT3gjPJvSKpwqa8aCs3J3ZBVTojp2FCBoomNZgL
         IRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k1JPjbOQ3twwCwVlAFBMY3qVvPpY8UbYSrJ/ZH6BzqQ=;
        b=gVhfpJMjUAgDrhn0iz0WtD7ou0zXvl28ZHGRNtaqtv2qr2uPGvgHD+98MTPcyn+nET
         HJZA5VM2hCOb1CnckNievxmO8GyTWqvy9HnmSu01Vy9qcwt5awamf9ThK1zsRmPZjw0t
         v8hZmx8ICObaoEb6oq7tf1DQe+oFa+LnLmcPfSdNlJYoMS+5wqs+9qZXh+tQvnm2qpeq
         +S10LjdHzsnClgSzO6leu5JwZgWfOceVBn2vDXapTcAtu417MjeRr8/f96RadhbUiiHT
         0B1r5KqC9ehadljI9l4BA+8m0TIm5UBKebZ3ztqaIHBsjms/fq6UyRPhXcDZbYXSdCDx
         KcsQ==
X-Gm-Message-State: AFqh2kqvMjSfeLpmj0h9pKM8hEx1Vpb/dPNxK7iOaL3DDfikTdhNcPWP
	BEO6f8gxTP0xKmenxa3ZlmTVKV2iXRcj0rcgd3M=
X-Google-Smtp-Source: AMrXdXuAS6TrhA/thn+Y88sZDTak+5v33qq9KMGKa2v/rKCpkx1Gac8Y4xEDv2MpYAI/XqvE328cUwFnFiyqV12HiaY=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:690c:291:b0:498:693d:c342 with
 SMTP id bf17-20020a05690c029100b00498693dc342mr5155044ywb.468.1673563791533;
 Thu, 12 Jan 2023 14:49:51 -0800 (PST)
Date: Thu, 12 Jan 2023 22:49:47 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=759; i=samitolvanen@google.com;
 h=from:subject; bh=FjTRhLA9CePRZYIdtY20ypwiouGtoz1QdaFB6TOg7Dk=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBjwI6MpoLvqaH1V7mD24emzCXHeOJafLjsjoDYdvtk
 w53TaaCJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCY8COjAAKCRBMtfaEi7xW7j6mDA
 CpsD+W/2uCHxg43p5GFPtc6hB7gf2sNnjbX2olMo/N1oymT0eWYLML9jzn/VYWqCKq5EgkFErYf2cJ
 kjcO5VHj8yDo0bmAbyRJTbkkxP1zJNSRk98PeKc/ZkxFrVRYNuFODO3VXj1qPP8zSNeheAkgh2z2+I
 od+5+9Zl2dYE9QJZNb50qmsrGMUFjkmo2xXw/xp/4I/5h1QUIcupcspXeIbgRQAuRjx+lQXatiAKcA
 WZoMscSUh7J4ZzMlF/kFjS5RTHgc7atL++s1AyCTo4/6dD8GgOKpwKJQ66cA7LnPDJP98uRNuCZDxG
 qjuWdF3l+PPSVqDsRQjW71TZy8EWOXA7Td8Zz3fR2voTPwi2MFd+dksta3smkfsnZKepdnbZOL6QpB
 Bq5GXapBR/RDT9PRHan5wSAUi/h8xvbf+flIPBwBTAmISxC6zMo/WRNO86IrFjiTMkwipFcDrVxGhC
 Tfm0sg22++c5k0aBWdP+8uheSiAG1Wxo6KKZD80bSd+3A=
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230112224948.1479453-1-samitolvanen@google.com>
Subject: [PATCH 0/1] Fix CFI hash randomization with KASAN
From: Sami Tolvanen <samitolvanen@google.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Peter, Masahiro,

I noticed that KASAN+CFI fails to boot on x86_64 without
cfi=norand. The randomization code is missing a couple of KASAN
constructors in object files that are not part of vmlinux.o. This
happens because we don't run objtool for the files, which means
the type hashes are not included in the .cfi_sites section.

This patch simply disables KASAN for these files, which seems
reasonable to me and fixes the boot issue, but perhaps you have
better ideas?

Sami


Sami Tolvanen (1):
  kbuild: Fix CFI hash randomization with KASAN

 init/Makefile            | 1 +
 scripts/Makefile.vmlinux | 1 +
 2 files changed, 2 insertions(+)


base-commit: c757fc92a3f73734872c7793b97f06434773d65d
-- 
2.39.0.314.g84b9a713c41-goog

