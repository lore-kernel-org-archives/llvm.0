Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598203FC8
	for <llvm@lists.linux.dev>; Tue, 21 Sep 2021 18:09:35 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id e15so878330lfr.10
        for <llvm@lists.linux.dev>; Tue, 21 Sep 2021 11:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=cqgJbN2GafozmlGGSfm41Ya3RdqcsMkrMRIafH/kSfI=;
        b=iSo6v8SdWRMLEzi+o+BcQNF0NJOd9VnOtBDsvZ3SOESvZSQMZ6YW1npJAnNk/FyGY5
         dwrOU632atnJeUfdCvGrwCGKaJ8JY03PrUsNRl2z92wTBxaoslxEKCiBCOzKyu7F3cuK
         cTk5NmKmZpHDUpRu3GmOTj9vJtBqivuyCXz79AREky/ztzMs14csOZIemd6KKlnqDWBQ
         1+z3Q/hv5tJWrq3/iBQcH03WVrqXzd+roHY87Ln+vZ4GPpXsrX3Um7SPi9YVuuWYLP0U
         tMqYQguH75AAkibyBbEZRuZ2/YW0dGwuTI95HQM4DARnzsIuue0oREaXtwX0gqI/wJYc
         BOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=cqgJbN2GafozmlGGSfm41Ya3RdqcsMkrMRIafH/kSfI=;
        b=2dXp7Q0CKz2sNPWfraqyIdMUjTGTOM5xHChMIFNYQujxNsJ12oUI3RFu7TeCg10EUG
         hh8qXXiEkdRl+CGhFN30sDOyctiPyruA0EQvDZAJJY9PuvFxKydjLR3ufzhorV99UmDI
         U3GxS5/zRycTSO9wAIAAJ4tywCg24LMfIkpkn5NeCHAp8qjtYAx45TZxywOIcIMBDzWM
         e8BGpnb/iTRdmexa62aSSWjZrsZeP1LH+qRv8a4NS2QXQm1vi0Gsq+paqYVFFiTWbte/
         rWhL6ojDzdrh3PmT0+mke1+9KRMy4gVTKhXeXXbcrJYRsfuyBU8rSAXDhQfP3IWdAYVW
         +YNA==
X-Gm-Message-State: AOAM532o0eB6FCLYkcbHABonzyz5msuC3wu757wuXtCfh4oDj7t/vlSc
	nMl3k234bo2iRjZPwMuXYA6Hm0MkErfDHap68A2xLw==
X-Google-Smtp-Source: ABdhPJzc+vXbcuq6TK8Sl7FG+XMR4pkfSf0ID9zn+RRVRp4MnMGFS8G6FZUncOpdnWz/+qf6u3RuX6vzT2K6owDM87g=
X-Received: by 2002:a2e:5049:: with SMTP id v9mr23979825ljd.128.1632247773045;
 Tue, 21 Sep 2021 11:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 21 Sep 2021 11:09:21 -0700
Message-ID: <CAKwvOdnGrBB1uJWiGLDSvJeitACri=wgGMiyEzB=0taA5aSNdg@mail.gmail.com>
Subject: tcp connection timeout fetching images
To: Vishal Bhoj <vishal.bhoj@linaro.org>
Cc: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Vishal,
I saw a connection timeout on our end with a CI run last night when
attempting to fetch the kernel image:

https://github.com/ClangBuiltLinux/continuous-integration2/runs/3663556307?check_suite_focus=true

Is there anything we can add to our client to help with logging in
this case? Should we add some retry logic?
-- 
Thanks,
~Nick Desaulniers
