Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA041F193
	for <llvm@lists.linux.dev>; Tue, 25 Jul 2023 13:27:22 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-794cddcab71so1619865241.1
        for <llvm@lists.linux.dev>; Tue, 25 Jul 2023 06:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690291642; x=1690896442;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ioiyZipNYQNpGagkyruO8NE61Cv2rplOTlMfdFh0CCk=;
        b=B5oIVzIvrI6yphVwz5iUuGiAcqTLBSfjfUDCebR/4w70SIZ7ZTGIAwsK7PdDEu/K4I
         sG7Oky5B/CK8YxQo/cHvcAKjsvUDPBt68n95wjBJbrTqsIG1anTLiwZlrRG8tn1dNVKj
         grfnmg2ie+/ajWinc2ZsNwooO7Q4osaM7B8Isqdt3Qwt4pZMrISx6T+eHlUi5DslIwyv
         R3U94lhpAuLtKRLKdwhYL35BO5nYJE7jCr6WaqUV5Nu4/wQkkJm6N8okt9ZxC72cNQrT
         6Wru4RTC7UcBhHOR1U0BH5FZDn4ZtAljd6me15mMSp1KY/TYrx/K7IvUCGkmlTggEIef
         spVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690291642; x=1690896442;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ioiyZipNYQNpGagkyruO8NE61Cv2rplOTlMfdFh0CCk=;
        b=dUg+bb7i5h6PjVxoe063QjTF+/joNrBruevqRvqnuT10P8rI44ZwEnGdMvHqAll35h
         On781jh2rJv8gDctgTNPv+YbEQTt3CQYZLK/+OlfBSPvjcLVPN4N+00tlYQN0EdUeQ0F
         Mfpc9nPXoLQnmq9eI14racM5Uei30e2DCddGtBwE0JZ2p7rBbceuVkCoqtqmAuLbV2Ci
         q67P3NMqZmj4UxHimDsivaWPXzBuSh4NCZQmGOw/RfRZVwHQ2RwPnAgOaMmFzctw7yaY
         JfY0HqwTbOy5F9Y7AK1Zsioz4If9sXrBALXuOSpzATvumAdsnFRe4V37VtRwhGDh4tEa
         d6yg==
X-Gm-Message-State: ABy/qLZorz80ix9HzgJdBS2Bc3+qStS/RYPvEBc1yWSKBXkjoYK0RQxU
	3mldstLp4NZvAAa52BJ3wl9bPz8zkoRBwPC0BFDDyA==
X-Google-Smtp-Source: APBJJlFNvn3s+3oAm8bOTez+axljqCb0cdR/HKWhBcUfLXHM467GPio5fZcYZwWXG5SRV0YkJpZLQMlUHpBTLGG1gt4=
X-Received: by 2002:a05:6102:3d7:b0:443:5ce7:e62d with SMTP id
 n23-20020a05610203d700b004435ce7e62dmr4261554vsq.21.1690291641801; Tue, 25
 Jul 2023 06:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 25 Jul 2023 18:57:10 +0530
Message-ID: <CA+G9fYvV-71XqpCr_jhdDfEtN701fBdG3q+=bafaZiGwUXy_aA@mail.gmail.com>
Subject: selftests: mm: mremap_dontunmap.c:53:6: error: use of undeclared
 identifier 'MREMAP_DONTUNMAP'
To: open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	linux-mm <linux-mm@kvack.org>, clang-built-linux <llvm@lists.linux.dev>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, David Hildenbrand <david@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Stefan Roesch <shr@devkernel.io>, 
	Andrew Morton <akpm@linux-foundation.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

selftests:mm: mremap_dontunmap build failed with clang-16 due to below
warnings / errors on Linux next-20230725 ( or older kernels ).

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

clang --target=aarch64-linux-gnu -fintegrated-as
-Werror=unknown-warning-option -Werror=ignored-optimization-argument
-Werror=option-ignored -Werror=unused-command-line-argument
--target=aarch64-linux-gnu -fintegrated-as -Wall -I
tools/testing/selftests/../../..  -isystem
/home/tuxbuild/.cache/tuxmake/builds/1/build/usr/include
mremap_dontunmap.c vm_util.c -lrt -lpthread -o
/home/tuxbuild/.cache/tuxmake/builds/1/build/kselftest/mm/mremap_dontunmap
mremap_dontunmap.c:53:6: error: use of undeclared identifier 'MREMAP_DONTUNMAP'
                   MREMAP_DONTUNMAP | MREMAP_MAYMOVE, 0);
                   ^
mremap_dontunmap.c:108:6: error: use of undeclared identifier 'MREMAP_DONTUNMAP'
                   MREMAP_DONTUNMAP | MREMAP_MAYMOVE, NULL);
                   ^
mremap_dontunmap.c:149:6: error: use of undeclared identifier 'MREMAP_DONTUNMAP'
                   MREMAP_DONTUNMAP | MREMAP_MAYMOVE, NULL);
                   ^
mremap_dontunmap.c:200:21: error: use of undeclared identifier
'MREMAP_DONTUNMAP'
                   MREMAP_FIXED | MREMAP_DONTUNMAP | MREMAP_MAYMOVE,
                                  ^
mremap_dontunmap.c:252:6: error: use of undeclared identifier 'MREMAP_DONTUNMAP'
                   MREMAP_DONTUNMAP | MREMAP_MAYMOVE, NULL);
                   ^
mremap_dontunmap.c:310:6: error: use of undeclared identifier 'MREMAP_DONTUNMAP'
                   MREMAP_DONTUNMAP | MREMAP_MAYMOVE | MREMAP_FIXED,
dest_mapping);
                   ^
6 errors generated.
make[4]: Leaving directory 'tools/testing/selftests/mm'


Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2T3676HpK243gMBLYJCp4OXDmWl/

steps to reproduce:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2T3676HpK243gMBLYJCp4OXDmWl/tuxmake_reproducer.sh

--
Linaro LKFT
https://lkft.linaro.org
