Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580E13E1D1D
	for <llvm@lists.linux.dev>; Tue,  2 Jun 2026 13:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405406; cv=none; b=fic7XQqvMnIbgB6sp8mkI3/rNKzEAtLwtt3q9ft9IQ+KcGRAFLybMdA7/pqTFx8Ku9nWVLAyodxGgUa6mg3PZdDKMMSSMGbmvklafgiVx6JazFSJMjVFpcOsgJpG0eKs9OexSlLcgPnzeVJvq0qYlJhFPEgZ6T9CS+tBX78NkRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405406; c=relaxed/simple;
	bh=GDZbYvQUamOFYqe+wDRuXBL1KE4AYy5pkKArBFAUAWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LvwZwoQIjJmtl8vYx1uPR6DOhJjh3m89NOS2ROpJS4skIdqdjzDvyinWEacgSQ3O3XFMutC+J6UG5vrcXvrSYL3lze21Ivh5/ZzKs42WHA7WrXlUE6vinv7GBN37iQxMVTakYqB6j7TUgV7AbeYgqkiAiuKskL6wogGi0OpcK+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EOIekoTT; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EOIekoTT"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-68c3421b009so5819654a12.1
        for <llvm@lists.linux.dev>; Tue, 02 Jun 2026 06:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780405404; x=1781010204; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZypcCVdQoLHHXNUwPT3EyFR3TdxTd7mb2pLyq2WFR0=;
        b=EOIekoTT2CBWWzKNqHUnc7Gp5ovCWR73Iulrl7oysUq9Ix5IyLRslsD7r/h6B5RVX0
         CSlQAC9XSwRUbSTg8muVnRcKOLbm9Z/+sSm2XBJDj6F9J2o+pNKqgpUMVqO3bq+L6mn9
         54mYtlbu8TKY/EGvTk4mpD8MHZB906RasbenNrczg5kNSUn6ov+pQS9T8DpHS1KVp1WZ
         owBCe1DmBFiTfcKE6q/OLJbrBT3BWiRjZ7ctsvAf5APfitnS8o68PpT9YiK5sEHnthvV
         9PEqsTuDvAAEA2TcZcgOmYD7wNSmreVxh9pbYoeiaehJGAanp0dfona5YdJ7TStcQvYf
         62Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405404; x=1781010204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MZypcCVdQoLHHXNUwPT3EyFR3TdxTd7mb2pLyq2WFR0=;
        b=lkdZRY1FbIgKbT24UC8ct/5XRr+/KGw5teEZdM4sct45Fx4BEeyRvndKkBzsLjXyfJ
         RWDOm+xlnlil9tsP5aiSRU6XF3H5Lv+4TKTU2UDbYgBxuHTvCHeDuZZoopmK42T6ZNVP
         Eyj/zGGKg84xTrBR+9CUU6AZ5zrVe7/EluFudvVNzXjxzilfojm4v6MWP6p6YFPMhV0K
         aROGIpt4MKkyfd/LhFqOM2QF7vdSpBZdotdjTsJ95Zpa7jS/HB26QPWW9I5NCaUCAfPF
         bpO9CGVAoqhqsC+KHYJpUPmLDsrCu4Ys/wXXcm+OXdO5N027srvIGkTvMAbNIeWqavfS
         rBTg==
X-Forwarded-Encrypted: i=1; AFNElJ/oS91hqVdPp+T3CWxUScWUnN0cDBRQFRCL8+1sISDtfiV2dCpvQJyngLxLl5MumvlmvwGo@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd+DX71TXdcoLiEeJHJcWxe6pRrhLgswYVfxZ02nSdokuKFZxQ
	0JVyc5c+DbS8+oqjp1u6UwEfiwQP5WUGNtUY3pJ0fpHwjejSMOh3pcoLTT5v0LFP4xc=
X-Gm-Gg: Acq92OH5P3zBoFVTIiX1TEwsGy8soqMbsbHD7Q1OI98DXtk2CDYhPw5Ixpye1sOPOM8
	RPebKW6gqV+nj6oYT0c7eO5TiWyw02fqC9H5KvwUaN/qBHrAQNd0XP8/kWO+2HFtUXLyeaateWH
	CE2Cl9/rwVjBhqBJjMQKvS9N3wY5lHo3dWfLIoRfDp0YlxlNyJvM/O8Y7wbDAo2kxsiLXdKfGzl
	Ek+8QAOe3QAwEj13Hx/VzcuuLoVHFMYmeH0ACz4fdag5gQYhKdwLShmENi654O/6WhUj+Dcsfa+
	fGpxs5MhZ+jhq1/bg1vt2iZHKVi7z9hIN3/XjBoS4ONDCnY+aIcyzmHGM5OJ65G4RcrMMLI0cTg
	BAgo9GGuR0toJ68KasTjwPIkClBhnWvmR+t0MB2o5mIHqoCgmnGXph1L8YXUrkJ0lp1bAlLXum3
	sXrzYqujzcSuDroZvdzmDjS4DKNogmODf/
X-Received: by 2002:a17:906:c14d:b0:bee:d554:f33c with SMTP id a640c23a62f3a-beef57fbdebmr208259266b.0.1780405401970;
        Tue, 02 Jun 2026 06:03:21 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e15:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bee8899dd5bsm176361766b.23.2026.06.02.06.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:03:21 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 02 Jun 2026 10:02:50 -0300
Subject: [PATCH bpf-next RESEND v12 01/11] selftests/bpf: Add
 BPF_STRICT_BUILD toggle
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260602-selftests-bpf_misconfig-v12-1-27f898b3ba26@suse.com>
References: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
In-Reply-To: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1780405395; l=1573;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=GDZbYvQUamOFYqe+wDRuXBL1KE4AYy5pkKArBFAUAWs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPZE5O73neptr/nVHQlz6qoj/gAhVpUqQ41Slol1ZYyw3dxCoSxmAPVUrEPlcTP7dTwRAKVf8wo
 JaX29rXsJVQk=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Distro kernels often lack BTF types or kernel features required by some BPF
selftests, causing the build to abort on the first failure and preventing
the remaining tests from running.

Add BPF_STRICT_BUILD (default 1) to control build failure tolerance. When
set to 0, the PERMISSIVE make variable is assigned a non-empty value that
subsequent Makefile rules use to make individual build steps non-fatal.
When set to 1 (the default), the build fails on any error, preserving the
existing behavior for CI and direct builds.

Users can opt in to permissive mode on the command line:

  make -C tools/testing/selftests \
       TARGETS=bpf SKIP_TARGETS= BPF_STRICT_BUILD=0

Suggested-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index bc049620c774..75036c1b5c4f 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -44,6 +44,12 @@ SKIP_LLVM	?=
 SKIP_LIBBFD	?=
 SKIP_CRYPTO	?=
 
+# When BPF_STRICT_BUILD is 1, any BPF object, skeleton, test object, or
+# benchmark compilation failure is fatal. Set to 0 to tolerate failures
+# and continue building the remaining tests.
+BPF_STRICT_BUILD ?= 1
+PERMISSIVE := $(filter 0,$(BPF_STRICT_BUILD))
+
 ifeq ($(srctree),)
 srctree := $(patsubst %/,%,$(dir $(CURDIR)))
 srctree := $(patsubst %/,%,$(dir $(srctree)))

-- 
2.54.0

