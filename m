Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D8111CA8
	for <llvm@lists.linux.dev>; Thu,  7 Sep 2023 19:01:30 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6535b9caa1eso12241526d6.0
        for <llvm@lists.linux.dev>; Thu, 07 Sep 2023 12:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694113289; x=1694718089; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UaLNjN3ZJ7PyVOlkdkv0QrmrabX8B4mPti5Xlo/jWYU=;
        b=syxMUgsqFT0is5h53WnkfaZPkPEwBNBT+9uHZjHygF607MuZv1ZjvG0kGPBRTCiP4e
         MowTsTxMzZsZQ0um2kj9YWD9Wb54ZSMDW9DngPRFQ2KqVfg+0BBBKwOmzjf3xXRp0ziM
         E2W+eOQ0ZkKjMtFd0eR13C8kzfzv5IsYWpARJHeQJZAfRMIEAAwF5H+dXbbookVeh301
         u7/rVret8XM9v4c0HPYhNRZEfWaQ+3XghROjtGH0QMvMhHuP8sZkmgVjo1u57RjNkRNE
         Y1Ij/8szAhCTBKdQOrzI2rvFdYTXyY18i6d2Zx6QLEei4tpal5qesB1mYj9lBMyiTMqj
         aUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694113289; x=1694718089;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UaLNjN3ZJ7PyVOlkdkv0QrmrabX8B4mPti5Xlo/jWYU=;
        b=UEAt48qk6AcdQMOPNpmrCl2s1kpS2b9C3IhLQUODO5qAsWFnENF7n+llYA+l9YAP1Y
         GGnjcQzwH0luXY8EmOr6WCpCPS2LyAriFm87HNOMl6ZXvDd7NLyFayfpIGekcKI674nU
         +TyzUBT5Wf9vz5PFMEJQNtAj9/e+kwNbgYrrRMtZoPf6d37Et/hLhItOEXZ7SZZSQtc4
         /iDVX2to7x0zcExEOfMqQ0pV2uIqEJvTAxeQqQkjmw4im1S80r1bSUqB60b6R+GDA6uJ
         R5MBA+X1JDLKYNquq/CEFTgDS3ho0dVYIq1gzjYeafbe6qzTbmrwjmNeWRryVz+0EZ0b
         shOw==
X-Gm-Message-State: AOJu0Yy06VYrmKLzbMyNqojxHMkyS2KQpS5tN6clHxDq5vTr71NJQJ+A
	Xjnniuqoo6J4LTugqHyI2Fg6EsyFMZT1Xiu1R/PlAA==
X-Google-Smtp-Source: AGHT+IHXzTMMD4Rl71NhyoDZ0xSQVibyb32ap43DMerFHyxkAyTKG1EhA6m83AXV+G9mbNxFiKQB8OTbxV/k4hrgonw=
X-Received: by 2002:a0c:e14e:0:b0:64f:53a8:5d0f with SMTP id
 c14-20020a0ce14e000000b0064f53a85d0fmr462867qvl.20.1694113289437; Thu, 07 Sep
 2023 12:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 7 Sep 2023 12:01:18 -0700
Message-ID: <CAKwvOdnaEakT_y8TA9b_nMY3kMp=xxqKpGQPc2drNqRdV39RQw@mail.gmail.com>
Subject: duplicate BTF_IDs leading to symbol redefinition errors?
To: bpf <bpf@vger.kernel.org>
Cc: clang-built-linux <llvm@lists.linux.dev>, Stanislav Fomichev <sdf@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Yonghong Song <yonghong.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"

So we've got a curious report recently:
https://github.com/ClangBuiltLinux/linux/issues/1913

ld.lld: error: ld-temp.o <inline asm>:14577:1: symbol
'__BTF_ID__struct__cgroup__624' is already defined
__BTF_ID__struct__cgroup__624:
^

It's been hard to pin down a SHA and .config to reproduce this, but
looking at the definition of BTF_ID's usage of __ID's usage of
__COUNTER__, and the two statements:

kernel/bpf/helpers.c:2460:BTF_ID(struct, cgroup)
kernel/bpf/verifier.c:5075:BTF_ID(struct, cgroup)

Is it possible that __COUNTER__ could evaluate to the same value
across 2 different translation units, leading to a name collision like
the above?

looking at another usage of BTF_ID other than struct
cgroup;kernel/bpf/helpers.c:2461:BTF_ID(func, bpf_cgroup_release)
is only defined in one translation unit

Should one of those two `BTF_ID(struct, cgroup)` be removed? Is there
some other way we can avoid these collisions in the future?

Was this a previously observed/fixed issue?

-- 
Thanks,
~Nick Desaulniers
