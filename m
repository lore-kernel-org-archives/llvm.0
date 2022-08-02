Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD9B7F
	for <llvm@lists.linux.dev>; Tue,  2 Aug 2022 16:35:57 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id l4so18580856wrm.13
        for <llvm@lists.linux.dev>; Tue, 02 Aug 2022 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc;
        bh=VvwQtDo4XUJDzMifcJqq50awcOPGpZoT2iv0SGOkoG0=;
        b=ZOYY8PNoSP7tsnnUzh4b6hp1O53entYC9lwroAKSc+XBb3ZrDyTohjAd2o4krKwcQd
         cWGMEhM6zXC5BInO+dXqhFGT5jtOgHVIFewbcfbZDyxluuE6R4kzTum5C5ccK6sf6zj5
         r8HcmBmr0IuViYwJqzU/iXapdMoCksvuD3yEi1kqx4/BJ9ffgy5WN55MC8z4+Yj8gBm3
         cI6BwWZOVYzB3SkEnylLMKgIEMoATLN1sA6ZnySDWZfOCf90LiIV7eBNaL4C7qWRByKk
         qCZzCZQg10kOTnGTqBvWn8PU4fRBpw/kLek7CVP4vGwDw8H8/hUAm4XBnE4uDLTyaFFj
         RblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=VvwQtDo4XUJDzMifcJqq50awcOPGpZoT2iv0SGOkoG0=;
        b=5tqWGjfmTv4EZUjlZ0NE53dN/XckOT0xoVnQU9tgtqBsHDRicmv8Vg61cT4oKCNamv
         Gxcwd5a7CHauPxrD3Q95ydHyFixofrKKpWHgjsEudhVKyM/nhGObq5vjx+wTudS7Ka6Z
         59lVzK1ma3ByrSTLkiBx6MyqI3/hyDyGIJLk+gjJgeHFyrFwvjwHFgqk24MKBS71Os+O
         nVSFi9gPUdvW1eHu6nRXmBolw4n1gcrBVpeBJiQtRWuYCoVoTVcmFsb/q3UXCenqLzYs
         stFKtxeU5qfkAWpRQlQaVNb1RwYnCXeQw5YywHPJVou3fdsx7x1Wtz05zIHrrEat95P0
         F7XQ==
X-Gm-Message-State: ACgBeo08KNJ+AmA/hqcaLjJWfJNnDvnyyQPtcaEr9gFNxNhIVJQB08VH
	t4zyDuURUtwmGo9uGhux7m8=
X-Google-Smtp-Source: AA6agR5Ik1mqNq6dg9U2/iNzesl5GWF3q0J2Z4CErzUGsbZLCnQuan35y78BqWpZztVKfBJzI4pTqA==
X-Received: by 2002:a5d:6852:0:b0:220:5c11:3cda with SMTP id o18-20020a5d6852000000b002205c113cdamr9370321wrw.592.1659458155799;
        Tue, 02 Aug 2022 09:35:55 -0700 (PDT)
Received: from debian ([2405:201:8005:8149:e5c9:c0ac:4d82:e94b])
        by smtp.gmail.com with ESMTPSA id z5-20020a056000110500b002206b4df832sm4684944wrw.110.2022.08.02.09.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 09:35:55 -0700 (PDT)
Date: Tue, 2 Aug 2022 17:35:47 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org,
	clang-built-linux <llvm@lists.linux.dev>
Subject: mips maltaup_xpa_defconfig build failure with clang
Message-ID: <YulSY1pDms0ZyNs9@debian>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi All,

Not sure if it has been reported, mips maltaup_xpa_defconfig fails to
build with clang with the error:

arch/mips/mm/tlbex.c:629:24: error: converting the result of '<<' to a boolean; did you mean '(1 << _PAGE_NO_EXEC_SHIFT) != 0'? [-Werror,-Wint-in-bool-context]
        if (cpu_has_rixi && !!_PAGE_NO_EXEC) {
                              ^
./arch/mips/include/asm/pgtable-bits.h:174:28: note: expanded from macro '_PAGE_NO_EXEC'
# define _PAGE_NO_EXEC          (1 << _PAGE_NO_EXEC_SHIFT)
                                   ^
arch/mips/mm/tlbex.c:2568:24: error: converting the result of '<<' to a boolean; did you mean '(1 << _PAGE_NO_EXEC_SHIFT) != 0'? [-Werror,-Wint-in-bool-context]
        if (!cpu_has_rixi || !_PAGE_NO_EXEC) {
                              ^
./arch/mips/include/asm/pgtable-bits.h:174:28: note: expanded from macro '_PAGE_NO_EXEC'
# define _PAGE_NO_EXEC          (1 << _PAGE_NO_EXEC_SHIFT)
                                   ^

--
Regards
Sudip
