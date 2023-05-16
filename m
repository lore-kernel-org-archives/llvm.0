Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5862934CD4
	for <llvm@lists.linux.dev>; Tue, 16 May 2023 17:17:16 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-61cd6191a62so65413026d6.3
        for <llvm@lists.linux.dev>; Tue, 16 May 2023 10:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684257435; x=1686849435;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tMbwruNPzgQ4D/ptNatuJMq8vM/2eW2VH1ORugCzAQM=;
        b=mYFHQJqsp7lxCu80Ayly7QJs9GMtJV4vsg+KQ55u/xRL84M/seeAL7Jhm5QD5mHmUM
         Hvh77shzE5vm66cLw0G4uF7W9w0TegD8Pz1/tg1uVufzMOI3OBHzfcgU56cCpJadaGYn
         ALEPGP/kx5vDTEaSR0AFpoVCSaf9Yv+Pv572IdTOLqn7EUz8pBbxjTDhI8bt5pmJpN6K
         Jcks5cUsqfyCdFyYj5T08X70ymhjCIsape9gZQHz0vmuOy/twVUvAiJ3CPNiqUdpMR4Z
         PTbUKDSMmdbMPOE8OuyehwFfUBADSr6SjiVBiQwoFLnlD/xGa71l5l9ul0vHHhbyculF
         mKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684257435; x=1686849435;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tMbwruNPzgQ4D/ptNatuJMq8vM/2eW2VH1ORugCzAQM=;
        b=PfCGNPxuXwLPnsIbhBr5H3ZH1ALnqTLvzQjj4ium9CxV3V8c1Cepp8dy3kKHltqX4W
         r+s4cNIqKv1G91GUf4yVa4qk3g9w22uEAfCLOY5rvnpR2tKYY6fUVIOOHU8kcif7gatJ
         FvrBerQfY+aPq+dbMclXz2Z9W+Zd5XghaYQSs+mKZ3CXA3WoLluPmFl6RDO66+SnBH4m
         lhFVyNet7/gEGrtRl51g9s43TIb6jynoWm1WhFJoIaoYObpjWlPg5APO76w2JB7JiwFb
         GnLvENyXnm16EKZXl+aY8xJyPOfDBtqfqBUJ2sm13FpMIfr5q/F/jyZzqp8WtbZE4yVc
         u4mg==
X-Gm-Message-State: AC+VfDzhDsvkJVs2wYECazV7HDzOTDeh7z/FxwZ4epq5zaN//MirZtPe
	LYLl3gvxnDBbobree2mREH1UO1xajOM/3XlWLJOfuQ==
X-Google-Smtp-Source: ACHHUZ4EUHdfJHrGuuhC4lLJwUrP8cfLkAlnNTGEgysCmI8QPoki81i8VxwZ5L3ff+2shdUuRgJKMVUIGuQboYB56Yo=
X-Received: by 2002:a05:6214:2b09:b0:5ef:5033:f37b with SMTP id
 jx9-20020a0562142b0900b005ef5033f37bmr60405320qvb.41.1684257434892; Tue, 16
 May 2023 10:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 16 May 2023 10:17:04 -0700
Message-ID: <CAKwvOdn7S61csn2aCYiBVKKz497QyRsF6O2kqSH49zC_TVR2uw@mail.gmail.com>
Subject: debian builds of clang-17 stale
To: Sylvestre Ledru <sylvestre@mozilla.com>
Cc: clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Sylvestre,
Our CI has been alerting to clang-17 builds being 8 days behind ToT.
https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/4986657460/jobs/8927651456#step:4:9

I know the GCP stuff had some recent issues; is that all resolved now?

-- 
Thanks,
~Nick Desaulniers
