Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266FF2C9C
	for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 00:32:26 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id by39so1032069ljb.2
        for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 16:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=7xcE93SQUTnmpprWNNrn4RnRomw6varxCO+eWG92cmo=;
        b=lmhKgJQu05WCKShkgxDOsnJSAglx5hzJxv7qyXZ4Tm7pQYz4+yeOpG80ZLArYxBmUY
         ne4ldsh61991ts1XU68fuBrm3GN4LVFapTCIZv06MJihkZLfXn9dbdqWbUUjlfH4euOW
         UtVDi0xkPxHV8V3z9uFgTWH1UdG/GmkT+fxp7BT1a8noXHRY3W2a+QFpec3R9xJQ+pS2
         wQ7CF9YP8H92Wv60P8pK5zIIUYclRTQGKi1VXqAWKvb/Ct28iDmiDrJpSF1Omswsm57N
         n88g9bRTRN83+PNKHdn2oat1PQE1p4KYi92RY5zqE8M+W1re4FUz6TedObimILzA7+C7
         KiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=7xcE93SQUTnmpprWNNrn4RnRomw6varxCO+eWG92cmo=;
        b=vY5QT38yjDROtSF33WT15kQVOF3WUjJ+UvHR+hgdX/unm7Ja83IKtffUUh5sNEhPJ/
         V9INxufv3gC14bJDN6blO9KYD8YC0UNiQwX7+4ZJJgKR8ORYEApujO+T11FcdETbY/7Z
         XZLoRsCi6gUagamQ4R9lyWkLEEGdKeDQoPNahQ6YODzGVvI5x4r/m/LoIY+Yvupjuy4a
         b6ee2EGEkZssqNQFs6r2OAu6NneCSiivHxtEheGuUfTWo6jQiaycZPOz2XuMkUhELpBz
         t9i/HdcnvAr/+8QFzxc1ibwLyjVidGea680LJH69lFMQ8NGeMyvKRzdntCcRmlsLzxvJ
         kKsg==
X-Gm-Message-State: AOAM532Cla1ztctca1MeWPHGmNk58v1DJ2LuMibWfR6K+m3vCJ5SHiDZ
	4H/3xSOedXzU91dsFjkYV+oJiiBzf1AlWHBJhsCqYw==
X-Google-Smtp-Source: ABdhPJx3iJnHCsyoWnKA49ZPV189cBeO62N/fdKwG5AlxTJ7ZmS4LzxQHLqVDQMicic51FyA7eCfJlBZTkljL8LNg30=
X-Received: by 2002:a2e:141c:: with SMTP id u28mr570364ljd.338.1640133143982;
 Tue, 21 Dec 2021 16:32:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 21 Dec 2021 16:32:12 -0800
Message-ID: <CAKwvOd=3ZSuiLxWbRWicTWF2WX4biS=-+EEXbSJiuLEborbD6w@mail.gmail.com>
Subject: CROSS_COMPILE_COMPAT cherry picks for linux-5.10.y and linux-5.15.y
To: Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: "# 3.4.x" <stable@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Stephen Boyd <swboyd@chromium.org>, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Dear stable kernel maintainers,

Please consider cherry-picking to linux-5.15.y:

commit 3e6f8d1fa184 ("arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd")

Please also consider cherry-picking to linux-5.10.y:

commit ef94340583ee ("arm64: vdso32: drop -no-integrated-as flag")
commit 3e6f8d1fa184 ("arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd")

They landed in v5.13-rc1 and v5.16-rc1 respectively.

They allow the command line for building the arm64 compat vdso to be
shortened by dropping the need for CROSS_COMPILE_COMPAT for LLVM=1
(and LLVM_IAS=1) builds.

linux-5.15.y:
from:
$ ARCH=arm64 CROSS_COMPILE_COMPAT=arm-linux-gnueabi- make LLVM=1 -j72
to:
$ ARCH=arm64 make LLVM=1 -j72

linux-5.10.y:
from:
$ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
CROSS_COMPILE_COMPAT=arm-linux-gnueabi- make LLVM=1 LLVM_IAS=1 -j72
to
$ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make LLVM=1 LLVM_IAS=1 -j72

This can be verified with the above by checking .config for
CONFIG_COMPAT_VDSO=y after running defconfig or building
arch/arm64/kernel/vdso32/.

I also verified these build with clang-10, which was the minimum
supported release of clang for linux-5.10.y and linux-5.15.y
(Documentation/process/changes.rst).
--
Thanks,
~Nick Desaulniers
