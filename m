Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E456F6AAB
	for <llvm@lists.linux.dev>; Tue,  5 Sep 2023 10:12:24 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99c4923195dso349774566b.2
        for <llvm@lists.linux.dev>; Tue, 05 Sep 2023 03:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693908742; x=1694513542; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e86Wy3ATT/OU246cW5x4ED89M09p8uuT794yspAsqs0=;
        b=k5i8bn8lEgP1kHgEq+Rl/146LZqUvhkRKXQz7A0gdlnatbdm6dPzeLeS/kcuSRjVEV
         +UDTZH50rGrI3Y9b9Xh1/et7wPIF06oenswfHLuqnHyceDW8eLGEdI8EdtPIOreW+lW6
         ewGPVB+S5DncNcN96GjGU3CRyhKObzmxLv3XdnZzKuH7QcW/+uiPDEOV1XyiISGcXqlE
         QMSUGOd+OcoxtTHxVaCkMVZUP1UcS3OYnxjPngJl3cZB8i3t2kZM3P+mqG5QnHpEio6D
         oLTSTFVFKeBy/Fk/mxdgmW4s1wn5VYdYJ9yjPpCeNXsgDuMsJP+7lO9WTFNvE3c9/1s1
         2HCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693908742; x=1694513542;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e86Wy3ATT/OU246cW5x4ED89M09p8uuT794yspAsqs0=;
        b=MaGCC1zwqwLR/ZPfxI3B1xlIpG3RE/d8L8aKzuJH0hPuuRTLexFjEUpWJriwp1QR36
         oZoHQoOV1mRrVPr6Xd5YirjRVWVct+jYW8P3HJ/8gIkGWbp/VuhYwvypzR3qVZjAo3by
         baznt+Fn/2N54XLpg9XerfBmL8uxg8GwrqqWTHDunho3pAPdb8pEmiyEHwvfONQVESBi
         yd7A4ZJJQ5/5RRxKH3XcUwV5CIxs5szwcgLicGToZQLiOHVb8GH96FnXgv+27oEsGg3k
         km4hSXqqZdUHOgSFKiF6uEb3GMz5mNi2TbP4g4lf/BM/1isSS/krGZ52BJcu2I17w31v
         PZdg==
X-Gm-Message-State: AOJu0YztjAQyeIjtMFQzJAtSHqegMlpohMgP9drg64wT5vOZMiiPUtaA
	YhFVh8nApxFOKIPNOP0V2rLD++QKvUU0sRVnnAY=
X-Google-Smtp-Source: AGHT+IFtEs9mWFBpsEix5UrjaXNdwrMvnwAb1slyKTXl/nh9oMhqDvJ0A0+iT+S2hQ1QIcGFmai0uRh3p878HQXM3/A=
X-Received: by 2002:a17:906:3185:b0:9a1:c00e:60c5 with SMTP id
 5-20020a170906318500b009a1c00e60c5mr9033774ejy.48.1693908742368; Tue, 05 Sep
 2023 03:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 5 Sep 2023 12:12:11 +0200
Message-ID: <CAKXUXMzR4830pmUfWnwVjGk94inpQ0iz_uXiOnrE2kyV7SUPpg@mail.gmail.com>
Subject: Include bac7a1fff792 ("lib/ubsan: remove returns-nonnull-attribute
 checks") into linux-4.14.y
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, llvm@lists.linux.dev, 
	linux- stable <stable@vger.kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	eb-gft-team@globallogic.com
Content-Type: text/plain; charset="UTF-8"

Dear Andrey, dear Nick, dear Greg, dear Sasha,


Compiling the kernel with UBSAN enabled and with gcc-8 and later fails when:

  commit 1e1b6d63d634 ("lib/string.c: implement stpcpy") is applied, and
  commit bac7a1fff792 ("lib/ubsan: remove returns-nonnull-attribute checks") is
  not applied.

To reproduce, run:

  tuxmake -r docker -a arm64 -t gcc-13 -k allnoconfig --kconfig-add
CONFIG_UBSAN=y

It then fails with:

  aarch64-linux-gnu-ld: lib/string.o: in function `stpcpy':
  string.c:(.text+0x694): undefined reference to
`__ubsan_handle_nonnull_return_v1'
  string.c:(.text+0x694): relocation truncated to fit:
R_AARCH64_CALL26 against undefined symbol
`__ubsan_handle_nonnull_return_v1'

Below you find a complete list of architectures, compiler versions and kernel
versions that I have tested with.

As commit bac7a1fff792 ("lib/ubsan: remove returns-nonnull-attribute checks") is
included in v4.16, and commit 1e1b6d63d634 ("lib/string.c: implement stpcpy") is
included in v5.9, this is not an issue that can happen on any mainline release
or the stable releases v4.19.y and later.

In the v4.14.y branch, however, commit 1e1b6d63d634 ("lib/string.c: implement
stpcpy") was included with v4.14.200 as commit b6d38137c19f and commit
bac7a1fff792 ("lib/ubsan: remove returns-nonnull-attribute checks") from
mainline was not included yet. Hence, this reported failure with UBSAN can be
observed on v4.14.y with recent gcc versions.

Greg, once checked and confirmed by Andrey or Nick, could you please include
commit bac7a1fff792 ("lib/ubsan: remove returns-nonnull-attribute checks") into
the linux-4.14.y branch?

The commit applies directly, without any change, on v4.14.200 to v4.14.325.

With that, future versions of v4.14.y will have a working UBSAN with the recent
gcc compiler versions.

Note: For any users, intending to run UBSAN on versions 4.14.200 to v4.14.325,
e.g., for bisecting UBSAN-detected kernel bugs on the linux-4.14.y branch, they
would simply need to apply commit bac7a1fff792 on those release versions.


Appendix of my full testing record:

For arm64 and x86-64 architecture, I tested this whole matrix of combinations of
building v4.14.200, i.e., the first version that failed with the reported build
failure and v4.14.325, i.e., the latest v4.14 release version at the time of
writing.

On v4.14.200 and on v4.14.325:

  x86_64:
    gcc-7:     unsupported configuration (according to tuxmake)
    gcc-8:     affected and resolved by cherry-picking bac7a1fff792
    gcc-9:     affected and resolved by cherry-picking bac7a1fff792
    gcc-10:    affected and resolved by cherry-picking bac7a1fff792
    gcc-11:
      v4.14.200 fails with an unrelated build error on this compiler and arch
      v4.14.325 affected and resolved by cherry-picking bac7a1fff792
    gcc-12:
      v4.14.200 fails with an unrelated build error on this compiler and arch
      v4.14.325 affected and resolved by cherry-picking bac7a1fff792
    gcc-13:
      v4.14.200 fails with an unrelated build error on this compiler and arch
      v4.14.325 affected and resolved by cherry-picking bac7a1fff792
    clang-9:   unsupported configuration (according to tuxmake)
    clang-10:  not affected, builds with and without cherry-picking bac7a1fff792
    clang-17:  not affected, builds with and without cherry-picking bac7a1fff792

  arm64:
    gcc-7:     unsupported configuration (according to tuxmake)
    gcc-8:     affected and resolved by cherry-picking bac7a1fff792
    gcc-9:     affected and resolved by cherry-picking bac7a1fff792
    gcc-10:    affected and resolved by cherry-picking bac7a1fff792
    gcc-11:    affected and resolved by cherry-picking bac7a1fff792
    gcc-12:    affected and resolved by cherry-picking bac7a1fff792
    gcc-13:    affected and resolved by cherry-picking bac7a1fff792
    clang-9:   unsupported configuration (according to tuxmake)
    clang-10:  not affected, builds with and without cherry-picking bac7a1fff792
    clang-17:  not affected, builds with and without cherry-picking bac7a1fff792


Best regards,

Lukas
