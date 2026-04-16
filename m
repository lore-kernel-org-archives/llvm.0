Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93493B8BDE
	for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 12:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342115; cv=none; b=j808hpB7H4O4xTJEk8Szv1CV+0oYN6I4/FmbsmU+4tVOk56XeabxvQXU9I/BiOhEudGN854Hu8GaQKNzRLaTZcf96QXtMoEtfD9I867rf4xhZCnEJBT9spJaTJ9k0rXyceuEg5Xhfahimsi4cn0MnLaov2ry1ZiOJalF/f7/fQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342115; c=relaxed/simple;
	bh=XgVya1wOhlmwdTfwic9NIwBF44z1ohItenbrD/1EmJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fDdVQnzEor1AIZIb0q1vTJ9RsjAHMumPPVWuOlh0wkHp8lhic+zB51KvW37k4DjcXHspKMgB9Vl+PG2/awCuGU4WEc2M1jfuhhU/b1/j+m+Fn0lLB4JhOmkiSfNzfub2YD12ILvGiiqK9fkoZGybgEn2Umf8S/9R+FyFsh7Px5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=d8OljrCn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="d8OljrCn"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso74817325e9.3
        for <llvm@lists.linux.dev>; Thu, 16 Apr 2026 05:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776342112; x=1776946912; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFAhrEcbWUNGkUNeZMznGeM5elrK7tHUIUxprsV4V9k=;
        b=d8OljrCnAkbv5Y04u6VYkGfNmecXqi7jFNvKFu/rxODNZgFRtWlikHTv1rHmxVCZU3
         OKEIb3CNxOL7MnlAdzpFCAHt444nl9uz7ctolEUFwvs5ztaLUkEOJ4iE0q0XKjHmOzEh
         sUsFQXrntAdHE+Fr0h5hD3WwYphYemnmLZ9jojyWtv4N04c8Q2gd68E93ekjEE7qcXF0
         5wlymyzdjiHJW6vU3Ez+wYDYDWWVHSLt4sg9B3x5KtfKsK5ypQLK0zqP+UPBY6+iKjTo
         yGDLZeCsvPutAxvrAoAvVQvMLT7QzWjHbAdUaZG09hFBTKkxA0r2kpCJQslWSxpstRJJ
         EaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342112; x=1776946912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xFAhrEcbWUNGkUNeZMznGeM5elrK7tHUIUxprsV4V9k=;
        b=p1AU5lONmW+7nfOijU0mgiJyJOxWR0hRFOx1c4Rql6f+9kPudRAU/31A+JeWsTUxj/
         NKATY74ungKmN5hd0Ek2TAS0pZPymvdPDP+tYwGg2ISgt7ZC3P8tmWSiAnTbccXOX/7W
         Bdw45NT3VylqWEGAI7/xCXjqlnyONXPrt8uBEepu2K21Xxcu3e6e6E0bbGtehKPOTUrz
         8k8N+q/bke69cqzADJtX5KhdKayJvOKesr2MCOmxfFXX2+B24cqGE5PMv0ZDVoX/343i
         r3rVWKMsyMNpF4SxLMkSy5QsxIo6qWDHYeEOU+z+cGjo0B5NWCbN3NnsEpZN4w2C7KtI
         nt0g==
X-Forwarded-Encrypted: i=1; AFNElJ+U6Jb9qlrwuNVzDOVZIxqSrGw0YS+PtXV2EO2jl9t/lTH1QaklWu7/J/a4eI7ncutnaU/r@lists.linux.dev
X-Gm-Message-State: AOJu0YyZf3wdxs00gYEBCu56x5FoSnGFSdK8jqW4CPU5VZjNzGBA85Wj
	SOiFfQun+mgloiUoPOXU9Qat7y6RQPGRd5y5XqK9MZHu4QbFOiJ1fmD4Mv7jzOApYXo=
X-Gm-Gg: AeBDievYUc6GkqtCMFUbZaxsCqEakfZnfIpimPD4HuskAAUooh4RHTQ6OOza4JT2vWq
	YU61trrMIdXyFEDMLkSXmAKNNGR9Bc/84WjRi3lfwk0hVApzboObSpUE4E4/q06PJxmM20zTrsW
	4P1zriueGbqargsTI/bHOMwvinqpdu5kBQzMjdOosXKoM1/frSyse+V1DKYutCREa5zQgK5nUA/
	SRarxKxedcbux9bxcZfnUWdgzeSrLAxHYz9OUPOMRIMuQygEErSoqXdg8hW9KhE4RCPoL2at3C3
	CauUum04W2JbEuReBgLHHqSMSumS0e7oUHBaXAR5zT/ra+bnN+8mIrUjO2VEBlJ2I9ouKDBbKIq
	Epb0mja0d1fyTNNwRNoo7/w+nE3Mr/qzwxHudyYAZAfN+iTPVABQK4SD1kD62wAOucEI+Aik8YX
	X1xc7facunQdg=
X-Received: by 2002:a05:600c:474c:b0:487:219e:42d with SMTP id 5b1f17b1804b1-488d67e72b7mr330683115e9.11.1776342112260;
        Thu, 16 Apr 2026 05:21:52 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e41:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5e6a860fsm5523313c88.11.2026.04.16.05.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:21:51 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 16 Apr 2026 09:21:22 -0300
Subject: [PATCH bpf-next v6 05/11] selftests/bpf: Make skeleton headers
 order-only prerequisites of .test.d
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-selftests-bpf_misconfig-v6-5-7efeab504af1@suse.com>
References: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
In-Reply-To: <20260416-selftests-bpf_misconfig-v6-0-7efeab504af1@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1776342088; l=1610;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=XgVya1wOhlmwdTfwic9NIwBF44z1ohItenbrD/1EmJk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QItrZ/Bp0ea4xdUjeMka6QelzaapYgbCSvM7vE7JnjuhA/jZzjrLzEE61ubPgurq3r7QDEOBjPb
 4zqHoHV3kZgE=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

The .test.d dependency files are generated by the C preprocessor and list
the headers each test file actually #includes. Skeleton headers appear in
those generated lists, so the .test.o -> .skel.h dependency is already
tracked by the .d file content.

Making skeletons order-only prerequisites of .test.d means that a missing
or skipped skeleton does not prevent .test.d generation, and regenerating a
skeleton does not force .test.d to be recreated. This avoids unnecessary
recompilation and, more importantly, avoids build errors when a skeleton
was intentionally skipped due to a BPF compilation failure.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 7d1e5d6c30ec..b3eaa4a93707 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -717,11 +717,11 @@ $(TRUNNER_TEST_OBJS): $(TRUNNER_OUTPUT)/%.test.o:			\
 $(TRUNNER_TEST_OBJS:.o=.d): $(TRUNNER_OUTPUT)/%.test.d:			\
 			    $(TRUNNER_TESTS_DIR)/%.c			\
 			    $(TRUNNER_EXTRA_HDRS)			\
+			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)		\
 			    $(TRUNNER_BPF_SKELS)			\
 			    $(TRUNNER_BPF_LSKELS)			\
 			    $(TRUNNER_BPF_LSKELS_SIGNED)		\
-			    $(TRUNNER_BPF_SKELS_LINKED)			\
-			    $$(BPFOBJ) | $(TRUNNER_OUTPUT)
+			    $(TRUNNER_BPF_SKELS_LINKED)
 
 ifeq ($(filter clean docs-clean emit_tests,$(MAKECMDGOALS)),)
 include $(wildcard $(TRUNNER_TEST_OBJS:.o=.d))

-- 
2.53.0

