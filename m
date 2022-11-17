Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16E78F69
	for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 22:03:49 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id j132-20020a25238a000000b006da635e2073so2777951ybj.2
        for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 14:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lfxYDuXklSdFBnB842iyXLpCafR1Yynr/t8/u3lWnLk=;
        b=QB6NtROf6U1rxz3MyBkb7hyXnsEAUKn8Yt7U8Js/VGrXwQui98OWbEU535c27I3kV4
         cvi1UMKhtUodANPnqcN9MZfZG7RB5/e1U81ZDY8y9TP1DQuxEisw6ZNl6Uo0vX5ALiNC
         hYAFvtbhHBZwcR2Uq42KK2KnkeD7Rb+sH79PCGMl0pcaHtfrHDdumqzv7upUM1Y5Ahha
         rFlnLIvVk3OJR2Q3L7iCbGWmoU8wXyS9fKP5aiLtPszslHHZmg49vcpgskGqmYLRCM+2
         wiClBH8WViK/yNDBnKbQvt1kuLEyfHPbRaSaOZmZ6SG77F4PK3TaAlF/1Q+C3XNo1THY
         xwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfxYDuXklSdFBnB842iyXLpCafR1Yynr/t8/u3lWnLk=;
        b=oRD4ZyqtVp72lXAbhkBkCdPL9Gkcc6wZSHter8b/BaY5OrYdZHk96qutLuMjmZsuD6
         2gIxudU9/85RRiJQIoljmoIS3Eo3zRf/50/ZVk6H74u0m7xBLsxqBj1SA8Pie6PfofCh
         Bu/p9wihcZw0KZOgxiaeMlphY6cqlbhkiTYDBfPjoelp89+kBn4sOob7Kzg/c4PUVkRN
         Al/QZdG5CqWPMIfTp8fq7A2635cECKGaEaruNP9YWcuEkz9SbOaJ2FTx6mYlMGzZp0mz
         LvMJdBjhus065Tl5ME8UEshzX8b98K4vBE9ufUNAyG1B29IYPhOV4UDqjfsMOESUasAl
         V+Vg==
X-Gm-Message-State: ANoB5pkr6z6YK2CyUBMJ0m1W/sKEFO5vYgKDDgmkvnTzgHnFNS9655dy
	FzoOsTbe/iNQQGqYfuJukf0yRVTKi/1t
X-Google-Smtp-Source: AA0mqf6jZaYoAVCrlYwRZY8eE8TGFmtwjrHL90Yo9gR5Yof6nlyvd2wV12j+TFtuN3SnPLeBkHN3eGgbrpnn
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:3f1e:c462:d6b8:fba8])
 (user=irogers job=sendgmr) by 2002:a0d:fb83:0:b0:373:65e2:ad91 with SMTP id
 l125-20020a0dfb83000000b0037365e2ad91mr4098454ywf.66.1668722628801; Thu, 17
 Nov 2022 14:03:48 -0800 (PST)
Date: Thu, 17 Nov 2022 14:03:36 -0800
Message-Id: <20221117220339.341290-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Subject: [PATCH v1 0/3] objtool build improvements
From: Ian Rogers <irogers@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>, Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Install libsubcmd and then get headers from there, this avoids
inadvertent dependencies on things in tools/lib. Fix V=1
support. Clean up how HOSTCC is used to override CC to avoid CFLAGS
being set for say gcc, and then CC being overridden to clang. Support
HOSTCFLAGS as a make option.

Ian Rogers (3):
  objtool: Install libsubcmd in build
  objtool: Properly support make V=1
  objtool: Alter how HOSTCC is forced

 tools/objtool/Build    |  2 --
 tools/objtool/Makefile | 68 +++++++++++++++++++++++++++++-------------
 2 files changed, 48 insertions(+), 22 deletions(-)

-- 
2.38.1.584.g0f3c55d4c2-goog

