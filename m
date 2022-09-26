Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC113626;
	Mon, 26 Sep 2022 07:51:32 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id lh5so12202963ejb.10;
        Mon, 26 Sep 2022 00:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=JTLxaDlZ0s+4KzzKxJ2iMAsNQ8edLuUfFix3kOf4hxE=;
        b=IUYcYkeAKAq3Z9pkfcGCw7GFVb5ytx/L103zWixWaVGGHUW4qaqsi7qFcQb8U9ylb+
         ZH86Rft2dsUKJJPRUWtJ5SbNWB4vsOoMJNFE+RdK2CQvW8sUrWj7ZCHcXFtyYAbTbzre
         05ZZb0uTlCJrtnHgUYE3Xmren2i+EwAw2RU0lcC0cs3q9HG0Ad8Uv35WTJuvWm79HW5P
         K9F9i3i+Ol/SXFaX85xP+/7swtxTbQVL4rKPAMc8iyX8adFMUbWloN1UPCTGZq2Il07D
         +TiUZOOKWEghMgGbQMmJULxQ0z/4vUcpXar06SX6FjLR2L+k5eC9evSI2aDdcl09Dz7X
         ZLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=JTLxaDlZ0s+4KzzKxJ2iMAsNQ8edLuUfFix3kOf4hxE=;
        b=UErJWY1OoU+JYWEnlp57akqOaSuH1Wmj5rFs2sOTC8Uk1IZZwa+56LqRiEKzELsHPX
         S41/ui7hzKLXl4c7TBQKdefAyqCnEaOnAaSqqml8CrTqigaPgmH5wbXYFTxKAf8yEkrd
         zNPuHvOnVuSlGOeb1p/yhL/dgsCMJPYqc9ye5WqTyudC6jJWCHEM+O8AfVQnasrPLkYK
         RUm0Mm9VVxYX6YYVMMaqQc/Buix0tYJX9BvDenWztRUNeoAshDTdzIEZRHBlKa1muo69
         bZUQp4AqxJdLj5UsE58KDP4XTADUKrnX1a8Qx02l5PKOwkarLPErkHmMOgn7UnKQmpZs
         z7Rg==
X-Gm-Message-State: ACrzQf0uZB6vcavmVS3nV37eT2MkNAZx994ExHidB9uM0d41ZcgwNQlh
	HAhSjQyX/6L7HT3G/dHEoV9QaQ3xC6gjZYY7NqY=
X-Google-Smtp-Source: AMsMyM54PjI7r9RBNywo7Vr4XI825HD15QzPS4xTM54XWF4bEobGfMMFwon7099h/YE9taKhiPm8G8gbvIN0ntLE4AA=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr16698857ejc.619.1664178690895; Mon, 26
 Sep 2022 00:51:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <nick.desaulniers@gmail.com>
Date: Mon, 26 Sep 2022 00:51:19 -0700
Message-ID: <CAH7mPvj64Scp6_Nbaj8KOfkoV5f7_N5L=Tv5Z9zGyn5SS+gsUw@mail.gmail.com>
Subject: Any interest in building the Linux kernel from a MacOS host?
To: torvalds@linux-foundation.org, Masahiro Yamada <masahiroy@kernel.org>, 
	"marcan@marcan.st" <marcan@marcan.st>
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Not sure if this is potentially interesting to anyone but I was able
to get the kernel building from MacOS my M2 Air with a small amount of
effort (read: duct tape and bailing wire).  If this might seem helpful
to anyone's workflow, I wouldn't mind pursuing this (with some
cleanup, sending a more formal patch set).  Maybe this helps us
bootstrap or get Linux up and running sooner on these machines?

Take a look at the commit message linked below for the trials & tribulations:
https://github.com/ClangBuiltLinux/linux/commit/f06333e29addbc3d714adb340355f471c1dfe95a

Thanks,
~Nick Desaulniers
