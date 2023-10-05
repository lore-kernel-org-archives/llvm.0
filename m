Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83AA14001
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4UcoV0ik"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-59f8134ec00so21222547b3.3
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547341; x=1697152141; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KnnQkZcbskEopBJnxGh+Vcp7ouLVD/1W8b2XeUOooQY=;
        b=4UcoV0ik8/oZQ/IOnOiJ8nJ+CKMlsg0r/RFSAbLIm+CiH4XCdr3QpXNgRkXNF2oLbJ
         ylpSKux7LNxUKG96yfDd4yzjao+z7q7Qvf+DLXVCK2aMd5lAmfTTxCtcGpJzYR6TeZSL
         f+SR0jTm1ZxqhdvQ6SDl8+EL1tLx2mruEP8vYviDqtYuMyYCp3SbQExOpvqT1BMCEmjV
         LLoRlps6AMlTiMr8k4Idj6mz+yV43/mEY35cV2gNO4DZiqRLyZz48HQq8iRoxk5Wwf46
         mw/NlcEGqwv1YbHnJmAKvInhdLMu8uMZbZHFukgH36brfuhl0/wx3ljICf9tLCCUz66P
         AOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547341; x=1697152141;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KnnQkZcbskEopBJnxGh+Vcp7ouLVD/1W8b2XeUOooQY=;
        b=RsiMIoXqTV3974CgodsrbcbixNv2ssgCnyqoyHpfK8zCODoY4lVhMpBNXGcUKI+r1O
         PQAjYlTPG+3afSy8PVkb+CWBj9epM41zLqiRQwO4A+dC8mBBPFkfHQezHhT5jTz1GrIw
         Mj6iha0BiRmYW+AlMd0QM5agRrJlUGn7tfepl0/qGk6UZgL+3221IqUiI4Us3vKu0RKT
         GHxLr07gaTtZLdffgcRS3XjB0AM1TVOhosFvn+iVoigv+LKRIcf4jxKWk8O1jOIcGAlM
         3dwIu2z6uVNetbtdMrQ5u0vEWpyNRGlzUSwQqItKFM69nO7fY+07d2ehNv8B63TnHaxT
         HOfA==
X-Gm-Message-State: AOJu0YyVV0/0FqUnjqSh3NQwxbDYoNZLwH+nmDM1KGHhY2gEwxYmAdz/
	faTOljeD3A9EKLC/z1rpX4q5nUsIKZGi
X-Google-Smtp-Source: AGHT+IEq5EgGgGfFQhFuBi8DznGe/koY92/hRN8c1uDlC9VFhaJLStShPDnueShOCjNEO4Bz7a83VK6LLkIx
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a5b:584:0:b0:d7b:94f5:1301 with SMTP id
 l4-20020a5b0584000000b00d7b94f51301mr103920ybp.9.1696547341616; Thu, 05 Oct
 2023 16:09:01 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:35 -0700
In-Reply-To: <20231005230851.3666908-1-irogers@google.com>
Message-Id: <20231005230851.3666908-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 02/18] gen_compile_commands: Sort output compile commands
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
	James Clark <james.clark@arm.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
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

