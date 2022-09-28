Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B5C7E
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 22:39:46 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id w10so12899869pll.11
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 15:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=U0PyleBjz1Jd5oWUVZio6RUWGLxtohOKB6h6C5whrdY=;
        b=FjIbeX43tiptrH0Dr3dc75iC1tt7oXAfXIstBI80FnGmWp1ORJkehJGzSTT6SOxgPs
         CfYlydYWcZyc/xSBKkXbOHqcjFerz2d783+2qukPaMYgkcPnb+wvGwpdZQrb90U9kS2I
         WzOEc6JqdYgpwU8FKblT+Q+blxem0o1hERn/F8xRO2C710/10GHeoRDY6uNiwRxgTnIh
         sZP3vNDBASkXEwI5HuHSYj2XEiwHZHRxm8WNKmxYVOCc7QzYxML2V72eswabils1EJmI
         t2/P7ueyUd6TP+jRualGT07tRB34UL2IuW+XsGz+oN4RDS1aemZ2D3s3aqQLf0PHEPru
         85Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=U0PyleBjz1Jd5oWUVZio6RUWGLxtohOKB6h6C5whrdY=;
        b=Fl2Z69u1j2FtQLDPRT28lupjVDkulZ1oSgvnccnoAFP82kbzdut5OgLHmaNJDn189w
         0KiHaXX/uGOc7FREBOYmpXZShGeCvOz0J+dZi63HtP0AZ0zI2z9QyjyBO1NNVxMe02Ms
         3tPVVK+vcaYeRNPQrjpj67n3ibrYBS3KGCp27peabEBbuPn8DoDq/imzKrcJA+GIFhDK
         A1cAH+hEafGV+ERn41Nw3W4qIPxCLNYI7yqzHRs80t132J+0264k36IPewWmx51q05tY
         zUA85pGXNWm0KpDQRV5Oxbd7vbSWqDOZftbU5H+vPNXziaUNtKPRoUEREk5wl59ZZhrp
         DYTQ==
X-Gm-Message-State: ACrzQf1kUgQ5Yweehwbxf10iOAPFiNRIOeNt1mdlpN07NwkbptbTTi0Z
	40bQm7nNB6bmJQIKKXfxB8k1sXnOzjHa08Rrq2EVmx611RjygQ==
X-Google-Smtp-Source: AMsMyM7gHI9qtd1dV4zaGyG2/uPfo5up9SPUScYgtXtVVoRNHXTPbWq8WE3JF3JPg/eFwHgasgE2WloIEikMQ2kc6tY=
X-Received: by 2002:a17:90b:1d0f:b0:202:be3e:a14a with SMTP id
 on15-20020a17090b1d0f00b00202be3ea14amr12812214pjb.102.1664404785758; Wed, 28
 Sep 2022 15:39:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 28 Sep 2022 15:39:34 -0700
Message-ID: <CAKwvOd=vyPExviYodAR91HO-V64NU8-7jW=KP3C7C7AA8=LjYQ@mail.gmail.com>
Subject: DFSAN & linux
To: "Moreira, Joao" <joao.moreira@intel.com>
Cc: "Koschel, J. (Jakob)" <j.koschel@vu.nl>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Joao,
Here's a link to that talk from plumbers I mentioned yesterday.
https://youtu.be/KkOdMwZRpYY?t=2771
https://lpc.events/event/16/contributions/1211/attachments/979/1981/LPC2022_slides_Jakob_Koschel.pdf
Check it out!
-- 
Thanks,
~Nick Desaulniers
