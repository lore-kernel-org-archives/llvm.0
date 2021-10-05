Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9AF2C8E
	for <llvm@lists.linux.dev>; Tue,  5 Oct 2021 21:34:10 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id 134so547243iou.12
        for <llvm@lists.linux.dev>; Tue, 05 Oct 2021 14:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to:cc;
        bh=W2tk5Y4sqY0TSMUKcdmHTUBphFgUI/SAHc2J7zeb6jo=;
        b=jtMh6uDdADz+X6C6UWAd2DuuIv4jhmnNgY5EAK/ozNELtukTz36uy+23jUCn4saz40
         HrfDn0IBEU/XQhzdg6PVXz62Svn5jG8R0Ns8ux2DTCp2NF4m7cZRqEibQt8FyQ5yk98h
         t/COuOfJgEShYibG38Fe0zgZE8S+uLBdrHttFkZF5N8e8154Y2ghn5KxW2mvajXkG311
         OMMhzolVFMBYqpc+5tiGOgYW/NNnS4TRSUhk0IdtWfMRHXC5j3qAnHGblLUROQXFMuES
         fFDPQIigxcDjvgVnZMV/NUbxdI7HtZz6Kkw1otO9TSeowmjztbpsrGsJxV/oGa+WbcHj
         AvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:cc;
        bh=W2tk5Y4sqY0TSMUKcdmHTUBphFgUI/SAHc2J7zeb6jo=;
        b=sNf3X3CILLZewbEgpvTcx3xBMX08bu9+8fEgJQYrocIGCiA8dizkvhM75qSuPFQsid
         Y1wIW04xSs60DRik0opx32C8AQ9HED16FkdZJap2JEdHTafOfXBkAepTFGVt3X5ZGQlI
         ss7PtGBFY22AystI9I3lf0Ri3mJXR4DeRe7Wm2q+PU+76v26wpSSlFiHruFnBbdeIPJw
         DPYRWsFsqBNiUZ1YFvQBt5XqYQDN9E8QYxlk3gALoMwWJCf0ox/EJVkozaeqsEaksEZZ
         kkFq9QGTNgJtUNk+ouX3zR0adFWnQgyF6CV/j8lYxW7sGe70i30zH3HTEULUk+hpFadT
         yhvQ==
X-Gm-Message-State: AOAM532lwlM77Keqfyg0NmisDBS9XLd/bOQE+CxGAmwHaDXpJl+cbSpB
	steNs3bz3PDLyvxQAEGpfmME3uNtp+jAdDu+ZdRW64yPZxFBk1Tj
X-Google-Smtp-Source: ABdhPJxROkbWdtf1cgYBLURSSQ757w6cvjlluIUe08B7Xi0UC6yCJ/1Bh9SppeQAU8CzHTUCEPvrlvIqHBa7UCzBbyE=
X-Received: by 2002:a6b:5f1b:: with SMTP id t27mr3931973iob.213.1633469649343;
 Tue, 05 Oct 2021 14:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 5 Oct 2021 23:33:33 +0200
Message-ID: <CA+icZUWf5OgQGOKG8jK+mEmSnT9wUGo4WV9wCSmDGwdDAX15TQ@mail.gmail.com>
Subject: How to check my LLVM toolchain is optimized for PGO and/or ThinLTO?
To: llvm@lists.linux.dev
Cc: Sylvestre Ledru <sylvestre@debian.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

does anyone have a hint how to check a selfmade or distribution LLVM
toolchain for optimizations like PGO and/or ThinLTO?

Personally, I use tc-build to generate a selfmade PGO-ThinLTO LLVM
toolchain which optimizes for my specific hardware (CPU Intel
SandyBridge) and a Linux x86 64-Bit kernel-config.

In case of PGO...
Can I use or better benefit from a distro PGO profile file?
Can I use/benefit from my selfmade (generated) PGO profile file when I
use an optimized distro LLVM toolchain?

Background is Sylvestre is planning to offer PGO+ThinLTO optimized
LLVM toolchains on <apt.llvm.org> for Debian/Ubuntu systems (see [1]).

Thanks.

Regards,
- Sedat -

[1] https://github.com/ClangBuiltLinux/tc-build/issues/155
