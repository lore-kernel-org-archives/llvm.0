Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D7C436BD
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mVi/0Lyv"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-59f67676065so22243237b3.0
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547360; x=1697152160; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Btc8+OmE4IzA7UOP/eGTa4MmLZMG3XazqMQBeE66ZYs=;
        b=mVi/0Lyvu0w2dTSsl52viJITzEUDdl3X7E+VsctVPH6H+RFTGOguSBGLOUUDaCp9ug
         aiFUVGN3HeuxUimPk+/d1RaJwoV9o21KFjOZwHz53ml38hrxP7vTOZP6Gi4pYY7x8/lp
         SJPwEcZxTnwJwgF740OKIiVinVpa6RvCvyvnJuVWp35qpVkx6yElf/ny4v2mK1zdfNmu
         jl3UWA4foRUJdm9lbwuBSEK91M8q3XbwpXYctjQxsT65hGAEubVO7a++V1cq59nh89H6
         otC+bvqdoV5BW0IfkzaSCBwoUPc94Q0S2KUa9Y+Ci280jx4VEq00XUU1Q07ahBaJq/7d
         +M1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547360; x=1697152160;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Btc8+OmE4IzA7UOP/eGTa4MmLZMG3XazqMQBeE66ZYs=;
        b=BTTqCV6Gy4WNbobl4R0T2EzE/LDyJyPooUbGaBRTp/kXjagdTbSJxVf6dQSvkZWTc1
         5Y9hYtLPgowX6qz2SjwdYFENU4eO/sTxaySSzIaQmpBv998gYhx2gzayYZnc2N6LKYM2
         4T0m2k/kmkv/jzGUS16E37ik2bpgh6w/04DBpyinFJ0KpT3fG5O4IIRV3iBXJWrwzVM1
         9BONWhk1mnlcir3D6ihgoPs6ov02NjDsmfrElVjdiHecKsY175O3F3/KS5/tAX1Sz8QF
         sWoHgpEp/1BysETwz5vApF6VlX2Es0hMPbi7s9aLI5xmTRaAch+GUiJP+chffdSvQ0Jk
         6t8Q==
X-Gm-Message-State: AOJu0Yz5KCt0AS2lEXcYbr9mwHWcbvcmMm/68EDLOtYOUwx4JyiMmM1t
	jgkEHEtDXy/VdJx3ZykUAZsEO7Sv3slO
X-Google-Smtp-Source: AGHT+IFfAlyuHJuI2G/9KQCu0TQZva4KyspkcFBHCc0rPvHV/9ONdxVJXDxqSyZ675ZF86Wyxy9Zbxra+WAi
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a81:bd08:0:b0:59b:c811:a702 with SMTP id
 b8-20020a81bd08000000b0059bc811a702mr118562ywi.6.1696547360615; Thu, 05 Oct
 2023 16:09:20 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:43 -0700
In-Reply-To: <20231005230851.3666908-1-irogers@google.com>
Message-Id: <20231005230851.3666908-11-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 10/18] perf dlfilter: Be defensive against potential NULL dereference
From: Ian Rogers <irogers@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Ming Wang <wangming01@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Yanteng Si <siyanteng@loongson.cn>, 
	Yuan Can <yuancan@huawei.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	James Clark <james.clark@arm.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In the unlikely case of having a symbol without a mapping, avoid a
NULL dereference that clang-tidy warns about.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dlfilter.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/dlfilter.c b/tools/perf/util/dlfilter.c
index 1dbf27822ee2..5e54832137a9 100644
--- a/tools/perf/util/dlfilter.c
+++ b/tools/perf/util/dlfilter.c
@@ -52,8 +52,10 @@ static void al_to_d_al(struct addr_location *al, struct perf_dlfilter_al *d_al)
 		d_al->sym_end = sym->end;
 		if (al->addr < sym->end)
 			d_al->symoff = al->addr - sym->start;
-		else
+		else if (al->map)
 			d_al->symoff = al->addr - map__start(al->map) - sym->start;
+		else
+			d_al->symoff = 0;
 		d_al->sym_binding = sym->binding;
 	} else {
 		d_al->sym = NULL;
-- 
2.42.0.609.gbb76f46606-goog

