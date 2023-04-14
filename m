Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633207C
	for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 10:36:48 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id x8so4068274uau.9
        for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 03:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681468607; x=1684060607;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lReA+ncD6yIgYbMrwcUzGWmHYZNQhQliejFF65m3oKY=;
        b=WuZt7p9fB1/N2w/S73wBULhopqjvzfsNZXaqslNaVAYaeTT9ak9SqxCcCTgav9FA8l
         0LXIpH5twmp32wwdxGaf0OgpUV+Gmzvga4BbZUl3d1nrddHrj/CHkSO5TSS89IGGUW7O
         jvnrE6wDLM1IusT2+QtloEYyssbzlXQV8D+MF96UUl/s3ebrDQXS+PHFOR/yX6iI1PlP
         enc/H8tbO56VvZ3VzEXT8tQpEUj6kuyNRabbdl2VA4gkPbZl8ReSxfiaKKDaTY9Yi9eY
         0B2kr0ZNzVOk63QDwsjbAOsLtEs6pOtCYXQc+72+gS0VOiEvo7/hnFu4P0I3dc40otAy
         rRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681468607; x=1684060607;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lReA+ncD6yIgYbMrwcUzGWmHYZNQhQliejFF65m3oKY=;
        b=S1sdqIDu5O4mTa7WkS1FXLtjaAmcYOANEAyYtvNly52sr4OdnTQjC1IRTeq83LOlYs
         gmjyzdjiDIPLYLmeVu69zGXmMUBl0NMBdFx8RAj90Vr0TnjKCS32zcTNuST01/3DEd3x
         XTHIo9OYdTfti4hJ5K1VZpYXHCk5P+YlCwS2iuM/dMSMfBmyMCfmKqEGWC7Nbe47jybO
         vj1LOob1vFgmgDlb5c0SF7XScWlqEyEdI+WqZ8W8JVDu2fAKK9QAqdJ3glrfmPRpxmrK
         mEOLkZngtTYwaHM+6Tdy/CuI6Ni4WwBg5nVyFlWuy4MwydUsmM20JzTQ3i1uzsknw0OO
         SUOw==
X-Gm-Message-State: AAQBX9c+jCrHVTFVpzUD9NcGBJrh/V6D2wvnpQX9jdi6eYzSttta6cwm
	vtytCPXPM//WICTHSR82rb5GF8dzNinwIWJcUZNYEeI+8FtYvQ==
X-Google-Smtp-Source: AKy350ZU9zDfhLK7ppiiviRe0MJUGmPgMXi7E6cwhLFwIsLGDHFQAzmkvYp6SSz/C7nBdB/AbYFwl6Xrj97OVx8N5uc=
X-Received: by 2002:a1f:a154:0:b0:43b:6f57:4a00 with SMTP id
 k81-20020a1fa154000000b0043b6f574a00mr2788371vke.3.1681468607096; Fri, 14 Apr
 2023 03:36:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: No Name <xbjfk.github@gmail.com>
Date: Fri, 14 Apr 2023 22:36:35 +1200
Message-ID: <CALS7K9V1j6ufrQ=6nGjyHQCWb7-YiqNdctBWk8og1gW_q4C4dA@mail.gmail.com>
Subject: LLVM not detected in bpfutil due to LLVM 16 requiring c++17
To: linux-kernel@vger.kernel.org
Cc: nathan@kernel.org, ndesaulniers@google.com, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This is my first time reporting a bug, so apologies if I get something wrong.
In tools/build/feature/Makefile, line 342, the c++ std is set to
gnu++14, whereas LLVM 16 now requires c++17 to include the headers.
This results in the llvm feature being falsely disabled for bpfutil.
Perhaps the --cxxflags, --ldflags and --libs options of llvm-config
should instead?

Reagan.
