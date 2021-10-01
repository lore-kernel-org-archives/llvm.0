Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE4B3FDF
	for <llvm@lists.linux.dev>; Fri,  1 Oct 2021 17:07:26 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id x27so41395938lfu.5
        for <llvm@lists.linux.dev>; Fri, 01 Oct 2021 10:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=sGOdKuc9A+94BPHIRjx/I8ILKp4QXPpGytu8ytqcLLE=;
        b=L/66TCtUk2WRgzJk04jT5ij6RlHOUgqUmQXHUbNLr2McbDLfN38/D0g9k7BSG4Ee9F
         w4NV4dq/joge1Ezmy8av0Renp2gYwulSvwItNB/P6lXcYaEdGaG4fcnVlFavSE/FD0M2
         iia2mVi1MtfGWUNJcq1GdhDUsDnPuHC9w0MVakEbxlY0bUHYb8V8N8ky9L67uU9t+GXS
         zQsqE/rGXS7SPj06AIXz7R2x/rdK+JNjs8guPwYf1buMMVdbsVshWzm0cTe8VVALDGUF
         NHBQ2LgU4iMH16cVPJ2FLF+uM4WzLDbnVk0DyrAYOyBgzi816K+YPBv+vO1Uw6z4badc
         OFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=sGOdKuc9A+94BPHIRjx/I8ILKp4QXPpGytu8ytqcLLE=;
        b=tf7KHkxaLinYATLZcZ5QQn/DFNdcp3fw5bINCHTKvGbwZXg4HBUKGtXoJXt43lDyPe
         IBN2jPOskBXgYz/boVdMp0noMrb8vWuYECNnSfYEB6XGH/e7gc+iSvmbjLPfQzb/5tiF
         S7qjiRRe1dq2bCMZXkA0iCQVcV0vDmHGOVRsHf17Yns2CK8MfrOGr2PSiH3j2dkliyTk
         0+oD7EHYq8jz0HN/GmH0SFG9mt4V7BCsUff+0sWANaHUn5vDRwLw/yDwthBnSoNHQc7j
         ybNmIV2EQdRusGyug+9/pe2/eX/jEBiEqGIu2A7nalNJag+eMQjf6wRfVv5FBJJ83az6
         bEBQ==
X-Gm-Message-State: AOAM531tKLltebFk8DgGf6smv/JJpbyNgnz3Uh/qhSi3X9uZn8ZG8Fnh
	5CyuCKYspLcjR5s85n4blOZygNputMv483OsaUuUbEGOBorg8Q==
X-Google-Smtp-Source: ABdhPJzkYymxJxxwFcv0Vcbdi7GI9B6+guKxFnCbGDkaQzdZZeSgZo5DNaEErnTpv0WiWLbqn1OEHyZcH2BiC5YTDnI=
X-Received: by 2002:a05:6512:110a:: with SMTP id l10mr6471795lfg.550.1633108044206;
 Fri, 01 Oct 2021 10:07:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 1 Oct 2021 10:07:12 -0700
Message-ID: <CAKwvOdmrOYTxVd1f+=g4e-+q0fD+BZZTBGOkzcRq494bYYCkgw@mail.gmail.com>
Subject: missing build.log files
To: Vishal Bhoj <vishal.bhoj@linaro.org>
Cc: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Vishal,
Last night's run had a few HTTP 404's where the build.log files
weren't produced, example:
https://github.com/ClangBuiltLinux/continuous-integration2/runs/3767134165?check_suite_focus=true

download_url: https://builds.tuxbuild.com/1yuAt3oatFT1XZifxO2YoBUadf4/

expected the log file to be at
https://builds.tuxbuild.com/1yuAt3oatFT1XZifxO2YoBUadf4/build.log

-- 
Thanks,
~Nick Desaulniers
