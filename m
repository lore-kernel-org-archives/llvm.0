Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AD07C
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 19:49:36 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id t14so23272879ljh.8
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 11:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=WTk4tYQw2vdZiF+qv8ukX3RKDykoEpwz9TdOJoe0sHw=;
        b=EGJ1AS4e2coTIKzgL/I7zLRvrtm/q2qoHzvNaQa5NbIl/gInsv54nM3QxvJQ4cJHFj
         s9VThdHLmKTS4AKOs9P4WXtuixboCJwE7XesLMUGgGRUUgUJN4auY/pCbzxvC0OAYdIh
         /flsE26K2PV9BxEShEm8cNwcZrM9C9uFEd0Z8Ceeh6E1uTylDckjIjN1zhqlZKXUu0EM
         2tow5Xp9xLefSfWEpglXffvb4sGO0SqyMFRqVJugh8XpEfrnYeIIONVuYaj1/tROQ38T
         aKT14xjh3Ufp19YzFn+XQ3DPDo17TaW2Oppj8wbAkS9ujMrlzSCu/+C3+WhbX0ujhv8S
         SFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=WTk4tYQw2vdZiF+qv8ukX3RKDykoEpwz9TdOJoe0sHw=;
        b=qDf9fNyrc6ZUAUuL+qw7enQGQfDbo/JvA1/kYJJIPWtqUgNg28/3BdcV5FXf43kFt7
         /zcGpNqq5Veb1pryhz0B1tSQ6YMTNc/2Gs8uMHn+/o8tusjdZuT10qzVz4XSRice3EAd
         /z/oUgyfhzyLzclU/vXGjMW0nZKO3LsUxZ0u9Mlqou/AhwwKVnardiG0v0AiE1jmt5Yu
         BS2TEJ+dSdSQfmUIwqc4JLiUqpSPepsNy3CIryOsxFCXKThlxAlsGQxW7h5qZglZVmFI
         VHGp/BXSO3UQVhRcsNgUpN6AwqjpnoyUucbsk1tkKneD1Uy81au2mYyCAVHNNwzsXA3l
         v3qg==
X-Gm-Message-State: AOAM531G2X+Mg9S2wnP+fpFSLiAJkMM1HF38yLUFV+0PxcCGZhy4yflB
	uJF4pzRM5mqUNdtEbfzTv5Kmg2BtYUgVbYLSuwZ9fw==
X-Google-Smtp-Source: ABdhPJyRCgMocLF4Thogv5NYXHgcbdVXaKdaZeSsyN1tJxYwDZkSBjvnt0E2k8NCEjhpcZWr2UAk0bjfiVPO08iuKO8=
X-Received: by 2002:a2e:8942:0:b0:246:4536:cf22 with SMTP id
 b2-20020a2e8942000000b002464536cf22mr18089304ljk.235.1646164174299; Tue, 01
 Mar 2022 11:49:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Mar 2022 11:49:22 -0800
Message-ID: <CAKwvOdkd3vHMRNAJABho7Ok9HOofBZKeXTzjW0ZZku_+5GvtYQ@mail.gmail.com>
Subject: UAPI_HEADER_TEST and CC_CAN_LINK dependency
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, llvm@lists.linux.dev, 
	Elliot Berman <quic_eberman@quicinc.com>, Elliot Berman <eberman@quicinc.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Nathan Chancellor <nathan@kernel.org>, Trilok Soni <tsoni@quicinc.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Masahiro,

We'd like to be able to better test UAPI headers via
CONFIG_UAPI_HEAD_TEST=y with clang builds during cross compiling.
We're finding that CC_CAN_LINK=y is not enabled because clang (unlike
gcc) isn't configured with a cross libc in hand, and one may not be
available in the environment. This is a similar constraint to the
prebuilt GCC images distributed on kernel.org.

Looking at
commit d6fc9fcbaa65 ("kbuild: compile-test exported headers to ensure
they are self-contained")

Simply removing the dependency on CC_CAN_LINK=y allows us to run the
UAPI header tests, which pass on ARCH=arm64 and native x86_64 builds.
https://android-review.googlesource.com/c/kernel/common/+/1991156

I assume there may be some additional constraints perhaps for other
architectures or certain configs?

Another suggestion from the bionic maintainer to ensure the tests are
more hermetic/self-contained would be to add -ffreestanding to the
compiler invocations of these tests.

Do you have thoughts on how we might be able to eliminate the
dependency on CC_CAN_LINK for UAPI_HEADER_TEST? Otherwise, I suspect
we will have to use `USERCFLAGS=--sysroot=/path/to/sysroot` to make
CC_CAN_LINK work for clang cross compilation. See also:
commit f67695c9962e ("kbuild: Add environment variables for userprogs flags")

-- 
Thanks,
~Nick Desaulniers
