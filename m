Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B34E7B
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 17:54:29 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id o2so14992301lfu.13
        for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 10:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=8j6DQTUcAh42nRu9idTCLduRhccqwL4NXaCCnAwTthM=;
        b=oWPmvl9fxuCMQG9XsarKTzhaPQfBl2x8QDf38KEL0Khe362XcbTxH081PHmImLaGI4
         btjHzeqNsrERfoHY/Sup7Uo7pjj/VZpyEtDh8frqUyL+gkA5ny+kij8BMUD37DGzxzaq
         8QX3QLhCzDYG4UIRCE9OLzCtVN3uY1QUcaYlNbn2Y5MQULTMluhDPrsS3TScul5aQi2K
         xPyBCGDcAxf7fVqCLwHU43kAZSiiJgHyW3piL+revWNbM1kmdqthvdIjCfBIiS4d5eks
         PE2MksLBdRy8TAzh7FjucgX53K0uI+qbNU5yL37U1piKMkJQDPC1yhEhlGpulxf2cUDe
         InTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=8j6DQTUcAh42nRu9idTCLduRhccqwL4NXaCCnAwTthM=;
        b=nlN2Tx0XoRW7X5Pk8s7Tgsh/KuuBay6eQiAzQWDjN4ATVUgZbF+X+SIuG5B9337xNH
         NxcA4MT6+KM1aF6pqUMFTO1rO76RR1o5Jl31u3ox7Qry8B2u9uHnbCv6sYEWTL+9rbwE
         ZUh1Ee/D07gI++hbqkcdkK85tkKWTKaZ22f4xI+gPemaLpuLz+EhL5wkG3nm2us6PDfa
         wPMRz1KAuvE6liUvBD+MlicedMO39SD9LsfYjvd1yjxXXrDxZ4Hr8FGXXEcrCbH5AABc
         i5nGL62javQYr+8JBR0cWVeziQqE7ubFLq3f8ljzpO4/HAI/Gm/iDJSFU4rvvSCnZ8Jz
         E6jQ==
X-Gm-Message-State: AOAM532WWp6S2KuboyMfa0Gc9A/DP+rwfvSnvVVgAo1UnCxQ9pO7ODX6
	kHuEBYOfVYoblqeJTl2+jmjbMPyUAMR8AIePDYld4nFTx1RYEA==
X-Google-Smtp-Source: ABdhPJyt3eudvFkY6pMoGXVCyEl0Gf3r1kJue9lHNus9xlzo/im5d5X5WrcDcT/khUq9Df5+fAFg+wYBBlomBOrPkqc=
X-Received: by 2002:a05:6512:b9e:b0:44a:10eb:9607 with SMTP id
 b30-20020a0565120b9e00b0044a10eb9607mr104526lfv.626.1650045267276; Fri, 15
 Apr 2022 10:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 15 Apr 2022 10:54:15 -0700
Message-ID: <CAKwvOdkyY9rsH3eViMK-_4iz_W_usumz5nD+3AhbNCVQ3FRCjA@mail.gmail.com>
Subject: plumbers session on profiling?
To: Sami Tolvanen <samitolvanen@google.com>, Bill Wendling <morbo@google.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, vladimir.mesentzev@oracle.com
Cc: clang-built-linux <llvm@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Yonghong Song <yhs@fb.com>, Wenlei He <wenlei@fb.com>, Hongtao Yu <hoy@fb.com>, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Sami, Bill, Jose, and Vladamir,
Jose and I are currently in the planning process to put together a
Kernel+Toolchain microconference track at Linux Plumbers Conference
this year (Sept 12-14) in Dublin, Ireland.

Would you all be interested in leading a session discussing various
profiling related topics such as:
* gprofng
* PGO
* AutoFDO

Would others find such a discussion useful?
-- 
Thanks,
~Nick Desaulniers
