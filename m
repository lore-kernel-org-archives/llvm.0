Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC8C4400
	for <llvm@lists.linux.dev>; Fri, 29 Jul 2022 10:08:51 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id l188so5336517oia.4
        for <llvm@lists.linux.dev>; Fri, 29 Jul 2022 03:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to:cc;
        bh=FVorsqPmSCV/rHPJEZGeXNnfBrCMbPV4pzYgK1Fz/3s=;
        b=TyxuA/0mnK6SrcpNYeJSx/oO9pPIvEohRAGEjZBG5YWBF5LMw+FjBoYsDzPYFuK32s
         MLSB3BksDGrogcWzkZuq80dCBS+9EFFaDNJryDYGQ7VlEfWu1ptjnHJiZgiR4IjtwdYX
         wi5HWzQwcXwG5CePAiGwfZ7b6i6BGwe7bYTt83oXv0qWsUCJdioPPYqHpH6UezFkOkbz
         hy7BhBgrXmJNSPOD0FJlIrpCk1A3onHqqKwQONHy0/fgfk5hsQg9ihpZwH9aeuSQNvaO
         +vcPgh8dN0STu4Itp2DPTuSWmazQ+Lf44pvz8r1iwlarlBuYJYYCIz54rm9wpgALprZo
         cb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:cc;
        bh=FVorsqPmSCV/rHPJEZGeXNnfBrCMbPV4pzYgK1Fz/3s=;
        b=IJOe9lqKVEMHL4rmngE7AeHFl8X6R3eJcjZAPvdfYXiyO8E4bJ/MY+sxRBclBUboYR
         EaCHErukKF32TnesirjTu4S6+zed48Vtu5JZ5Lq6/K2arQfffD8JjeCil6O/oUUF1NLG
         IWBREin7hzECb1sHlGOZ8fBA0/ZPp2O+qafm2yY/whXCbGwrZQe5Kxd4R9PetAow3pBt
         7V4Vlb/14le1ufc/fuk4Jln42kDHWdN0WMP3+leMrm/YCVg5eF6knROuxxi7K9wU/l3e
         RS4nwpttvbN9+OkOy2zADDWKepyouQUpV9IySLX8uiywH/2HRE93ChNCiAjzg0lebV1b
         8eXA==
X-Gm-Message-State: AJIora8dAZ/x3QQv99m/sVtQ2G2Jusw5De+depe/cFeTaXEhSLUQl4k3
	CsA46bmEyf5zOTHlebX4aLmhbirMU3SgUhFFmBk=
X-Google-Smtp-Source: AGRyM1sHF6moKZRseECrKgh+7V1BEcTha3LwEFtT8caGxsj05HVl+vDbK1Bg4y2QE0+0uw+MXsR9/Pv+qu8bhnCLaM4=
X-Received: by 2002:a05:6808:bd2:b0:33a:c532:54e6 with SMTP id
 o18-20020a0568080bd200b0033ac53254e6mr1278516oik.252.1659089330211; Fri, 29
 Jul 2022 03:08:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 29 Jul 2022 12:08:14 +0200
Message-ID: <CA+icZUXSK1Qxt7osAy3oxvMW+5fVT8b2aBeVGr1TY_1G+N2D7Q@mail.gmail.com>
Subject: LLVM 15 and 16 packages on apt.llvm.org and in Debian
To: Sylvestre Ledru <sylvestre@debian.org>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Stellard <tstellar@redhat.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Sylvestre,

I see some new LLVM 15 and 16 packages on <apt.llvm.org> and
Debian/experimental:

# LC_ALL=C apt-cache policy clang-15
clang-15:
 Installed: 1:15~++20220716100712+45067f8fbf61-1~exp1~20220716220809.624
 Candidate: 1:15~++20220716100712+45067f8fbf61-1~exp1~20220716220809.624
 Version table:
    1:15~++20220724113059+7feab85df8e8-1~exp1 99
        99 https://ftp.debian.org/debian experimental/main amd64 Packages
        99 https://deb.debian.org/debian experimental/main amd64 Packages
*** 1:15~++20220716100712+45067f8fbf61-1~exp1~20220716220809.624 100
       100 /var/lib/dpkg/status
    1:15~++20220625103012+3d37e785c77a-1~exp1 99
        99 https://ftp.debian.org/debian unstable/main amd64 Packages
        99 https://deb.debian.org/debian unstable/main amd64 Packages

# LC_ALL=C apt-cache policy clang-16
clang-16:
 Installed: (none)
 Candidate: 1:16~++20220728111245+7eeb468ae5e5-1~exp1~20220728111345.647
 Version table:
    1:16~++20220728111245+7eeb468ae5e5-1~exp1~20220728111345.647 99
        99 https://apt.llvm.org/unstable llvm-toolchain/main amd64 Packages

Today, Friday I remember Tom wanted to release LLVM version 15.0.0-rc1.

I love to see such a version on any of these two repositories.

And hope to test with it a Linux version 5.19 FINAL (hopefully this sunday).

My aim is not to put pressure - I am just curious what your plans are.

Thanks.

Regards,
-Sedat-
