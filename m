Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B2C4696
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 20:34:10 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id f4so4831771pgf.4
        for <llvm@lists.linux.dev>; Fri, 27 May 2022 13:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BhWiy+u6CGIxU/xIbrrvAKnLH+DMq1tyIbHLZpH6IYA=;
        b=KSwFPHiiGG1DMPxJblwbpP1Ur2ictm9QtDr7vMqJeyIoPo+SXOmrbr2i/OYxRbDxM3
         o4jKrNaKqIm4jhthNdZ9zuB1J0dnww89O+V/4/KFWWq8kII6xZ+XamzwcRqtbR1iPQ5A
         rwieHD4Y2s344gn/ma8mBg38ntnc9PXu4cW7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BhWiy+u6CGIxU/xIbrrvAKnLH+DMq1tyIbHLZpH6IYA=;
        b=Edr8tE1HxDMPPsWRvQws5J3aHKuS2rMSusDUPnf5/gtf7zm/xB95I+RAwqxgsud3NR
         JjZM/I0bSgE2roR0DXEjOGntjwN+b2ZWoV8D3+dh0tk3zx0PMReI0rXmOuBSB+fI/8IS
         /GltrOXuC17JXrF0VwyIz8rSsDGAiPm8vS/WZIdMP9GJTla8VBBUogzA+P80Dqsp+9KT
         7P7I2GNXE2lXUVMn1KIbvIwVp57hy+A665Gss3/IWANH6EayemwLuvw9dH9/n470KnU0
         WDuzhwBQKyGUlKsbFCVW8ovtY4gDQCtZSuk93ZlcTg/MF4/KtbL/Jwtj5ONUVxiyxzHF
         0X8w==
X-Gm-Message-State: AOAM533zwZfZtScUDxa++2YtokKl8wBYcTbI6K4ppcKxsFNCDgRBu4GD
	4Fl9UVEZu82pvaxP+KDzC0Hzpg==
X-Google-Smtp-Source: ABdhPJzUD2QjIliB8iVM+amgGA8Khu4/8pI/8T3lk3zMUpCf+RrhJEX4WjwNEWS14JAuyuRq1ZpcCw==
X-Received: by 2002:a63:1a17:0:b0:3fa:e901:1c68 with SMTP id a23-20020a631a17000000b003fae9011c68mr11571011pga.243.1653683649828;
        Fri, 27 May 2022 13:34:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v9-20020a17090a0e0900b001df93c8e737sm2009741pje.39.2022.05.27.13.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 13:34:09 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: zhuyifei@google.com
Cc: Kees Cook <keescook@chromium.org>,
	shuah@kernel.org,
	luto@amacapital.net,
	wad@chromium.org,
	bpf@vger.kernel.org,
	brauner@kernel.org,
	llvm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH seccomp] selftests/seccomp: Fix compile warning when CC=clang
Date: Fri, 27 May 2022 13:34:01 -0700
Message-Id: <165368363912.774765.17949173463800378438.b4-ty@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220526223407.1686936-1-zhuyifei@google.com>
References: <20220526223407.1686936-1-zhuyifei@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:34:07 +0000, YiFei Zhu wrote:
> clang has -Wconstant-conversion by default, and the constant 0xAAAAAAAAA
> (9 As) being converted to an int, which is generally 32 bits, results
> in the compile warning:
> 
>   clang -Wl,-no-as-needed -Wall -isystem ../../../../usr/include/  -lpthread  seccomp_bpf.c -lcap -o seccomp_bpf
>   seccomp_bpf.c:812:67: warning: implicit conversion from 'long' to 'int' changes value from 45812984490 to -1431655766 [-Wconstant-conversion]
>           int kill = kill_how == KILL_PROCESS ? SECCOMP_RET_KILL_PROCESS : 0xAAAAAAAAA;
>               ~~~~                                                         ^~~~~~~~~~~
>   1 warning generated.
> 
> [...]

Applied to for-next/seccomp, thanks!

[1/1] selftests/seccomp: Fix compile warning when CC=clang
      https://git.kernel.org/kees/c/73a8dbafd31a

-- 
Kees Cook

