Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA3281B
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:35:42 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59eea906b40so54359057b3.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447341; x=1696052141; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sj6/NNUjZTKqDNZk1SrzqO39OG4waux/cevEfWDj9So=;
        b=0dC+tH+MMOVbmS7zQCMHbRm88BGaAgDIpe4tE31pDUmff/A4mET+g4FPDl8hVV2qwS
         geYt8bn7PULic6ExJ+XeCdaiL6J2mkej9fd0dESixv2GM/V1iuzHy4FmHwwoTqOeWqTZ
         YhVA6o3fbGflYaaedckQn+VTRD1TfNCtwD7uurxL8JyyeApc9JOWW5amx5ahDwSOu7I7
         kTEsJ2wv4tML6NUy6nN7tMXgrwoy+IRlw3fs/dKTKOK0ttCE1MlOFjscLSHidfw8eRm4
         Iu38nCWjq1N1RIZ2P7ZCV/GwPcOnCKwjXriHkmf6C4yvs6ISx814m2kqCxMMVp7BsfKq
         baow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447341; x=1696052141;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj6/NNUjZTKqDNZk1SrzqO39OG4waux/cevEfWDj9So=;
        b=nino5mlBRkyc66MigeG6yJJpx40FUrSxQvdLhRAaOStbbnjeVPYj+xmE7M+llkwjSR
         o3tZLBgWXhqXtspH/fgUTmkbaSaLzBkRqvO7JTpZtHWaFUZlESDsWpCoC+bTJT0vK1T1
         Nowd+pOk05v7ZZhLFI0PUwOWwYhhvSaUMRAXQ5o2mwl6k7oV3PXqz1LNsmEGEHX3RTvV
         /qFeuf2uaV17cOiQC4WI63hLAJGOhA+Jr8gz54AOOCXLpqXTA48rlqfbnqRQaixuHrZb
         eRb2c3dhTz6jhnxMBWctZh1/MI/nV9GSW31JOVjLemZ6V3qjIK2jVHoVFcTkc9TudDfk
         s/4w==
X-Gm-Message-State: AOJu0Yw0utQ5qdMi1qNL7kp3fK+I7ZdIRgGIn5xoSgLbKb4M+wvTc0nX
	DKdyza5/7of7i/Vfp73RnhBihbTu/9Jd
X-Google-Smtp-Source: AGHT+IHbSzioQSTamsrTSTL4Bee/g9Pe12Cn5Z+M9ExBNqmPozrvsrmeb06sIAWOJ+A4bl9QoEI2702248Yo
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a81:eb0d:0:b0:59b:ec33:ec6d with SMTP id
 n13-20020a81eb0d000000b0059bec33ec6dmr21490ywm.5.1695447341257; Fri, 22 Sep
 2023 22:35:41 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:34:59 -0700
In-Reply-To: <20230923053515.535607-1-irogers@google.com>
Message-Id: <20230923053515.535607-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 02/18] gen_compile_commands: Sort output compile commands
 by file name
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
	James Clark <james.clark@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Make the output more stable and deterministic.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 scripts/clang-tools/gen_compile_commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index b43f9149893c..180952fb91c1 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -221,7 +221,7 @@ def main():
                                      cmdfile, err)
 
     with open(output, 'wt') as f:
-        json.dump(compile_commands, f, indent=2, sort_keys=True)
+        json.dump(sorted(compile_commands, key=lambda x: x["file"]), f, indent=2, sort_keys=True)
 
 
 if __name__ == '__main__':
-- 
2.42.0.515.g380fc7ccd1-goog

