Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57B41F60E
	for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 21:19:57 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59c0327b75dso7320707b3.2
        for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 14:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694726397; x=1695331197; darn=lists.linux.dev;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gyCa8y2D4tfagLdEhZkffRRlznGd/QDpuIxcjKD4E/c=;
        b=lRpGLfS8hMhpGJIqCvEyuEZ+mmAEetCUbeEybTOWBpyIoWGwDS+IxebOQaa7+P+WJP
         h1eo/kMb/xTO48QHJG4Ths+VOZMrHFLl+VUZi+4y9Fzt8IHOfH4H41YAtSEur3eTaUMc
         SfizOa42hzmlAe9p7CQSYWVer3SNPsT2Kq2HjMo3XCHOzpCC2uUVthmAFox47QIudHPA
         3TE+QtrqdjH9ztllDtfjLyCsYCSH0Nzl/7iqsVpNBaiyx3ShydetLFFVkOpWq5XOxfPw
         Ft87yX7z/dsEBF7PwKsKWXRW8rzmDn0qbzTfk7yVlsgE3PExE6hBVDCUd0y3D6VSMIcM
         xw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694726397; x=1695331197;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gyCa8y2D4tfagLdEhZkffRRlznGd/QDpuIxcjKD4E/c=;
        b=lnMEVzYowFgfKwehVrzbxC9B0KL1DLMhjquajGrMs6Gm3KwPbqE6OBXO0CCL90vjCO
         ETCQbN0I5UGwBbbIrcNO3QRNiNigrUa1GrE7PtG1Fq8dROH7ndRDi1jCH/0fv3NUyPKl
         x1CfZFFjaZAVJIlhZI8r9ELvtjDj/cTI+SFoAxOge5/Q+Qxsg2gRr2w3qnLhYdLNkO78
         eRu4VxQKzCmIAkXiqJZ6d38dRUalFWR/peSX7YlQ1CYruWiQauobZ7bKnj0Kbmww0qrN
         rJUdnOFSzHaI2Mj9+FNP+4jatmIUGyv7pkYyJkXKZG5HhadYcsF+MftT87/Myvvownlb
         KDMA==
X-Gm-Message-State: AOJu0Yw2Kw4MJrVy3X/gGEaULlPu6b5Wl/H8MzgRTkdJ6wrNppI2qGPI
	iKaF/8vC/XXmVu40fmO3d+yijnpkhvi6
X-Google-Smtp-Source: AGHT+IFICCNKx7p+w3Fwj7ubun2Y+fAPBczDWbh5iaJborCvmiUiAZpQehTzmuFkOiLw/9n5Yvv+V5nsTa3o
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:5357:1d03:3084:aacb])
 (user=irogers job=sendgmr) by 2002:a05:690c:a8a:b0:59b:c6bb:babb with SMTP id
 ci10-20020a05690c0a8a00b0059bc6bbbabbmr148679ywb.6.1694726397030; Thu, 14 Sep
 2023 14:19:57 -0700 (PDT)
Date: Thu, 14 Sep 2023 14:19:43 -0700
Message-Id: <20230914211948.814999-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Subject: [PATCH v1 0/5] Enable BPF skeletons by default
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nick Terrell <terrelln@fb.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	James Clark <james.clark@arm.com>, Kajol Jain <kjain@linux.ibm.com>, 
	Patrice Duroux <patrice.duroux@gmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Enable BPF skeletons by default but warn don't fail if they can't be
supported. This was the intended behavior for Linux 6.4 but it caused
an issue captured in this thread:
https://lore.kernel.org/lkml/20230503211801.897735-1-acme@kernel.org/

This issue isn't repeated here as the previous issue related to
generating vmlinux.h, which is no longer performed by default as a
checked-in vmlinux.h is used instead.

Unlike with those changes, the BUILD_BPF_SKEL is kept and setting it
to 0 disables BPF skeletons. Also, rather than fail the build due to a
missed dependency, dependencies are checked and BPF skeletons disabled
if they aren't present.

Some related commits:
b7a2d774c9c5 perf build: Add ability to build with a generated vmlinux.h
a887466562b4 perf bpf skels: Stop using vmlinux.h generated from BTF, use subset of used structs + CO-RE
a2af0f6b8ef7 perf build: Add system include paths to BPF builds
5be6cecda080 perf bpf skels: Make vmlinux.h use bpf.h and perf_event.h in source directory
9a2d5178b9d5 Revert "perf build: Make BUILD_BPF_SKEL default, rename to NO_BPF_SKEL"
a887466562b4 perf bpf skels: Stop using vmlinux.h generated from BTF, use subset of used structs + CO-RE
1d7966547e11 perf build: Add warning for when vmlinux.h generation fails
a980755beb5a perf build: Make BUILD_BPF_SKEL default, rename to NO_BPF_SKEL

Ian Rogers (5):
  perf version: Add status of bpf skeletons
  perf build: Default BUILD_BPF_SKEL, warn/disable for missing deps
  perf test: Update build test for changed BPF skeleton defaults
  perf test: Ensure EXTRA_TESTS is covered in build test
  perf test: Detect off-cpu support from build options

 tools/perf/Makefile.config              | 78 ++++++++++++++++---------
 tools/perf/Makefile.perf                |  8 +--
 tools/perf/builtin-version.c            |  1 +
 tools/perf/tests/make                   |  7 ++-
 tools/perf/tests/shell/record_offcpu.sh |  2 +-
 5 files changed, 59 insertions(+), 37 deletions(-)

-- 
2.42.0.459.ge4e396fd5e-goog

