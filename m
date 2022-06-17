Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350FB3201
	for <llvm@lists.linux.dev>; Fri, 17 Jun 2022 16:58:41 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id o199-20020a25d7d0000000b00668ab46306bso3548141ybg.6
        for <llvm@lists.linux.dev>; Fri, 17 Jun 2022 09:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=HIkosMxJu0DsWXpVdxpWrXztbgfsO84tS9Or7dZuu1Q=;
        b=hNEMukuOffSzyw5d6QBcwxNcqKUnC8L7F85D8e4DMiaNmNOcfyuY3Zx7l9WU+TMSNN
         bng7bOJtVv2lMxmVy9WRgT/M1tn0wUyWP+6xcjbbtGndZqD195wLuodEcCItkC1CZnwm
         /yxrwNI4Jl3rGOwj9tm7zr/ciXe+j2yqDhblmTlIoLedlOlLT8hBZJzfF50f4JP6HsDE
         TTStfbmqBaNN8+9kBYjLLKaASBEYJYJhXGYhCWWlCOyrbr25ynvp1kJOOXIRI90IP9Jv
         y88Cvk9Toe3vn+iXOoUKaaV/nJk7QeRSxPxV71CsQGaCI4XKbAKe8LGojB2WJ/BVl/2m
         PH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=HIkosMxJu0DsWXpVdxpWrXztbgfsO84tS9Or7dZuu1Q=;
        b=5wD3dYjL1Jm1lIHsGuxxVXku2LOSIOFqhhFi8ZlFmKJhC7r971v/28RlPGT+j+KQ18
         2H5O3ZpB+SWMfbeplCD1EPf53rZaHNLmhtRvo58LRtTfSKzG1sW9Xw8eGYmAI0EH0u4d
         8UdB0FSKj0xdxMgev+iOVx7QKOFEoSjCrYzWsoaTVRexO6lq9ne62PPBhnRytL89SiSj
         fOWZfbJqSEyAnQq7ighXARymnfQlfe6HNd76cOrkHk1/+x8hqLVsFQk9tD5kC6BMbEUH
         h+dT8hIU0R+n1i7c049pzL/bilAGu+VlGqwwfc3lM0BlEUZN+CfiI0WOo+YTnYfkPDpp
         z+5g==
X-Gm-Message-State: AJIora+gA9VfWG2JTgTy4c2O+nbilwtjOgqspsyKwd+fI5dLftEuYO6H
	TfTVUINOukWr2vWaoG4kCjo5GHF3hKhPS9uTpqM=
X-Google-Smtp-Source: AGRyM1uaTYh1F8LDuoxG1oRipLMJSHEmWpZiFQyuyySsXPgzvm1S5MjCu7Uh4zVtK17/lbBhl7nz67P0zLVAEzLDqRc=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:7e0c:dc00:6576:994e])
 (user=ndesaulniers job=sendgmr) by 2002:a0d:cf04:0:b0:30f:c6e3:b62c with SMTP
 id r4-20020a0dcf04000000b0030fc6e3b62cmr12128627ywd.306.1655485120058; Fri,
 17 Jun 2022 09:58:40 -0700 (PDT)
Date: Fri, 17 Jun 2022 09:58:17 -0700
Message-Id: <20220617165817.3204917-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1655485097; l=1310;
 s=20211004; h=from:subject; bh=pe+YwCN7a/5bmdaqbfY3NE5BJF4TRtPW3C6ELb8zZF8=;
 b=eNQ0gyHPhuoYjZ/pWdaRl9A62Rla+ymyhL1crK6lecZwFPypboi8Y9gWiEqW6dcb1XWwvQeLFVZ1
 KEYzifuFCQCYqa7UTDNE+9DgoPPpMYO6Qjfxhtbg/G3o5f3JfD/C
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH] Documentation/llvm: Update Supported Arch table
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Michal Marek <michal.lkml@markovi.net>, Jonathan Corbet <corbet@lwn.net>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

While watching Michael's new talk on Clang-built-Linux, I noticed the
arch table in our docs that he refers to is outdated.

Add hexagon and User Mode.  Bump MIPS and RISCV to LLVM=1.  PowerPC is
almost LLVM=1 capable; ppc64le works, but ppc64 (big endian) and ppc32
still need more work.

Link: https://youtu.be/W4zdEDpvR5c?t=399
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Documentation/kbuild/llvm.rst | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index b854bb413164..6b2bac8e9ce0 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -129,18 +129,24 @@ yet. Bug reports are always welcome at the issue tracker below!
    * - arm64
      - Supported
      - ``LLVM=1``
+   * - hexagon
+     - Maintained
+     - ``LLVM=1``
    * - mips
      - Maintained
-     - ``CC=clang``
+     - ``LLVM=1``
    * - powerpc
      - Maintained
      - ``CC=clang``
    * - riscv
      - Maintained
-     - ``CC=clang``
+     - ``LLVM=1``
    * - s390
      - Maintained
      - ``CC=clang``
+   * - um (User Mode)
+     - Maintained
+     - ``LLVM=1``
    * - x86
      - Supported
      - ``LLVM=1``
-- 
2.36.1.476.g0c4daa206d-goog

