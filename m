Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF2A2F44
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 09:50:10 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id w81so1812562oiw.0
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 02:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to:cc;
        bh=ituFRW03CJ69UX44RThNKS/t7e3hyB9IpwP5rCupbuw=;
        b=Byav1HHwnrYxcAdGKxqq5abxMDnuwEUZbwzx3N2KxSzW3PIt1g8jHwnSo3OBd7U0Yj
         YLIrkvDZyzR3dFDupkZAjQ/7lDhHr2pK1cK3fyHQkVETjeQmtg3EV6m3lPvhTvT4/5eT
         8hRMHjz74WRLHCgWfADi3wHyrd7Gey7jpzKAfPPxODbu8S3qO8pieM4noI7tZZf6FLB4
         Bh/NBzXFbyUU9HJu5l5J+ixVBLPsUeYmkwxzqj+Vd6LOlCD930Wlal05jFdsVYbshU2M
         y8PYsyhU8vtEljq9aiCUgbaSAWcF3Jn2dqjJKIDwc6cxoD+WHQckKvVeA2REBZchub1B
         BK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:cc;
        bh=ituFRW03CJ69UX44RThNKS/t7e3hyB9IpwP5rCupbuw=;
        b=MwocqZEVavyotCCTwf0BiETTVpI22toZjsm3UCoMGOtIOvLifwM/Bun6kUfdsufSfT
         9/ik8Op8YQsFf9Ov6y3tquBgZQvPDoyskA6HeX5SoMy7REuoEfsyRPWk+lI4VsN4c41P
         RDLPz/ldL7kNs3vAUL4wZCoYdQxvLF0l0uThLXQ5aduf48jRkkF4LlXpfmUxvE2WaZGB
         YOzd/7P/2Bf9HWsRFnJqvAE6I2PwfdX44jRRPphkHd6p9a49eAcukfbdRTry2XxTjDIB
         okcW4VsX5lA2LZ2YpkBUjS2oipY80jTh2iJ4RmcisXF9Ck9ZQai7RcFsWNKbt8BpzC0w
         FT1Q==
X-Gm-Message-State: AJIora9dsoDsKXxiwuowVCLfTwI/xEMoQFCDVyXYlyMSXxQMC1g3wy+H
	Jve+EVI93vbJ7u4H4DsFy/+U4cX9Fa1M35ys/YA=
X-Google-Smtp-Source: AGRyM1tDUiJU7EjLK4/ttlpjgQwo5Z8e7kl4C4MWxAmb+RFvnfOkCe4e1sr9LUfKwQxKpZDl0I+tpF+BTKjR8c78rQ8=
X-Received: by 2002:a05:6808:302b:b0:2f9:eeef:f03 with SMTP id
 ay43-20020a056808302b00b002f9eeef0f03mr6975747oib.128.1657792209455; Thu, 14
 Jul 2022 02:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 14 Jul 2022 11:49:33 +0200
Message-ID: <CA+icZUURRcY+f6OHbAqc_ruUSsft8hMttOy9TS=k0MnATpjLGg@mail.gmail.com>
Subject: Linux v5.19-rc6: Building and testing x86/retbleed
To: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

as far as I can see to fully support x86/retbleed you need LLVM-15?

Due to:

[ arch/x86/Kconfig ]
config CC_HAS_RETURN_THUNK
def_bool $(cc-option,-mfunction-return=thunk-extern)

Has someone a commit-id which supports above and is stable/safe?

Looks like apt.llvm.org ships new clang-15 packages, again (see P.S.).

Has anyone numbers w/ and w/o enabling x86/retbleed?

Thanks.

Regards,
-Sedat-

P.S.: List of available clang-15 packages in Debian AMD64 world.

$ LC_ALL=C apt-cache policy clang-15
clang-15:
 Installed: (none)
 Candidate: 1:15~++20220712100758+8fe076ffe090-1~exp1~20220712220909.616
 Version table:
    1:15~++20220712100758+8fe076ffe090-1~exp1~20220712220909.616 99
        99 https://apt.llvm.org/unstable llvm-toolchain/main amd64 Packages
    1:15~++20220625103012+3d37e785c77a-1~exp1 99
        99 https://ftp.debian.org/debian unstable/main amd64 Packages
        99 https://deb.debian.org/debian unstable/main amd64 Packages
    1:15~++20220309105819+8bef17ed59aa-1~exp1 99
        99 https://ftp.debian.org/debian experimental/main amd64 Packages
        99 https://deb.debian.org/debian experimental/main amd64 Packages

-EOT-
