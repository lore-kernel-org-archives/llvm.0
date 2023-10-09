Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35488156F2
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 18:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D8Vhhwjn"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d99ec34829aso2028490276.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 11:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696876771; x=1697481571; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KnnQkZcbskEopBJnxGh+Vcp7ouLVD/1W8b2XeUOooQY=;
        b=D8VhhwjnNEpXQUND9KKXNKlgpP98xgGURaHzxxXIBvMnW+eI/N5KLVR0GU8/l+rJBg
         T4YegJQe3HXh1Ij8PX2QuHKuYdRqd0MDFkY0UvjsWCf15urJs6K/CHfCjyavaEN99Z2g
         dBsxjvD0cbvyxuLl0JfQXLC3VZaTyu4hCyqhbt9zWgwyZY3IjsZ1oabyDPpNP4sylwaO
         ZAEpsHWDYUIFWLEnsMlwigAMzvxiTfPD3msj/z1yFhh5wsPkMdFMEbsLqQwp+MSHIDIC
         yTnirL4KJVf/qIPwNfGhf1OKnFbTjZHtOXANWH9u5hD/KuuBMqUnadMKTgJuRr1OrSgE
         ooew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876771; x=1697481571;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KnnQkZcbskEopBJnxGh+Vcp7ouLVD/1W8b2XeUOooQY=;
        b=aJb1O4rLe9zgZPUv/NyL2p3dZR9uOASuolsM5tOb20yGvz0hS9+4eDkbo0kus/i28M
         tLlGnPlXkysB2hbr4PsXGZpbOESAayb2xxg28wOLDscO3m2dbgeTi0uhU9YkFqCivZFa
         tSggzml2FcftQiHMclekoJl7vNT9911HjFLc5N4jvKi7WW9oDgN8DThaBhM1eEwMs3AU
         5PCfo+XJZLvDgznb8wv0Q5uacXS3ZUWsBsONmDg9f6E4ze1DGzXZZxz1g33YGL5MSaaI
         Y3VattFgDSvzpPhmaAfwU5kQPrtJHJRaDAfVUAZLkb2d23Qc6dk0D7ckz0x7RcEheFQv
         IYog==
X-Gm-Message-State: AOJu0YwPOyBTdCbsMvnrHuQrPLiiBsKqqNtQ8QangviP01wi04yy0D5c
	7iLWc2lOI0bqutKLad6TfVjTp6MrPEHt
X-Google-Smtp-Source: AGHT+IGj936HBpMxd79H02f/BbU/72frkk4HM9RAto5NleLe3XJS2mgffVtBe63zJHi0k9rP3973otb4eFsT
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:ac4a:9b94:7158:3f4e])
 (user=irogers job=sendgmr) by 2002:a25:6881:0:b0:d89:4776:5d6b with SMTP id
 d123-20020a256881000000b00d8947765d6bmr254778ybc.5.1696876771177; Mon, 09 Oct
 2023 11:39:31 -0700 (PDT)
Date: Mon,  9 Oct 2023 11:39:03 -0700
In-Reply-To: <20231009183920.200859-1-irogers@google.com>
Message-Id: <20231009183920.200859-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231009183920.200859-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v3 02/18] gen_compile_commands: Sort output compile commands
 by file name
From: Ian Rogers <irogers@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Ming Wang <wangming01@loongson.cn>, 
	Kan Liang <kan.liang@linux.intel.com>, Ravi Bangoria <ravi.bangoria@amd.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Make the output more stable and deterministic.

Signed-off-by: Ian Rogers <irogers@google.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
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
2.42.0.609.gbb76f46606-goog

