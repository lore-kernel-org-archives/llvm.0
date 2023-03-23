Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6FC2565
	for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 07:58:22 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id df34so138482vsb.8
        for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 00:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679558301;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qy+avBLXTpqBs7wiLv4nHuWGknSEznmW36KI6MrLqak=;
        b=XXv51V0gWpl8UrC6TIbTl/Nsx6t1lMItjiNjdwnbK9G4GQZp7r518YdFtkkZfQSPm9
         5t9QmO87cXoLBPZLjE3ffFYfiBMh+Fzm6ag1FApovASZRizeFttP6VTDwDXgEGg8I4Ca
         EddOmS1e/8vj2F8EbdMEOfwPPFUMD1MokOKMj9f7Dt9Hk/NDbPIGRmDQecaBhAJcOt9Q
         rPib6lHQTRdROEuAVn3L0u+JUOVvC6/de6EoHu3VbJ6mUVk0MDY0Ve3mrS9A6puCpPuM
         ET3o27jrpGF9MUtaHfpIeBs6ikBzbwd3edyrpPfB6Lln/1NOrpySifRo0QhlnRZoqFaS
         /xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679558301;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qy+avBLXTpqBs7wiLv4nHuWGknSEznmW36KI6MrLqak=;
        b=jTLXm7bFGnc79Jhwqyr+IJISLHG2zAJ6jaQbWc3l400aScMueTV3mCGMHZxPhvYGKq
         Rp9XzZV69JCnJSADtsFZpPXzO2XD/xVgiLBnCaNz1qdQXtbkFhMTou27QVEe972bHMtz
         otIl3Hn9IdInWUmEb97E+aBPJkFEQLQHIUOczSwS+T0hbuuVoJaNkzwVJicPMrD97NIn
         rvDJ5JMVPdv1x9d5a0IaePko/nFKZA9jFsgbDmPM6ZTHnDaJTcWjplIQCmWl3gB1wHrC
         tPg7+9szXt/BiWdP9R4b59BcU1K8YQ2P9qzpVzXiHzPMwEMX+9nSnFryNalP+QB0DCb8
         Fvfw==
X-Gm-Message-State: AO0yUKVWZy+kvP1xYjG4IaT0HDAZDda2o0lR5OMO7RKnGGAWcyNXKloq
	C7Lw0HOLsAXm2RcOuNfK2h94EUKWsNgQZYooAGPozw==
X-Google-Smtp-Source: AK7set+2jSxcjk2ShsjiG4KrocUujp4Queqnqp3zqlHipOMcCbLh4yZmFjwK6WEb+j/oACpaL/fM0x6CwZsXKs06MIQ=
X-Received: by 2002:a67:d20f:0:b0:426:392a:92bc with SMTP id
 y15-20020a67d20f000000b00426392a92bcmr1341687vsi.1.1679558301631; Thu, 23 Mar
 2023 00:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 23 Mar 2023 13:28:10 +0530
Message-ID: <CA+G9fYvEqk8tC7w3xxPcFhycctZeOj4CMJj3JbrtWKkp3w9qPQ@mail.gmail.com>
Subject: mm/mmap.c:939:11: error: variable 'next' is used uninitialized
 whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
To: Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

Following multiple build warnings / errors noticed while building
Linux next-20230323 with clang-16 for x86_64.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build warnings / errors:
---------
mm/mmap.c:939:11: error: variable 'next' is used uninitialized
whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
        else if (!curr)
                 ^~~~~
mm/mmap.c:952:15: note: uninitialized use occurs here
        merge_next = next && mpol_equal(policy, vma_policy(next)) &&
                     ^~~~
mm/mmap.c:939:7: note: remove the 'if' if its condition is always true
        else if (!curr)
             ^~~~~~~~~~
mm/mmap.c:912:36: note: initialize the variable 'next' to silence this warning
        struct vm_area_struct *curr, *next, *res;
                                          ^
                                           = NULL
1 error generated.
make[3]: *** [scripts/Makefile.build:252: mm/mmap.o] Error 1

mm/vmalloc.c:3543:6: error: variable 'remains' is used uninitialized
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
        if (bitmap_empty(vb->used_map, VMAP_BBMAP_BITS)) {
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mm/vmalloc.c:3587:17: note: uninitialized use occurs here
        return count - remains + zero_iter(iter, remains);
                       ^~~~~~~
mm/vmalloc.c:3543:2: note: remove the 'if' if its condition is always false
        if (bitmap_empty(vb->used_map, VMAP_BBMAP_BITS)) {
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mm/vmalloc.c:3539:6: error: variable 'remains' is used uninitialized
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
        if (!vb)
            ^~~
mm/vmalloc.c:3587:17: note: uninitialized use occurs here
        return count - remains + zero_iter(iter, remains);
                       ^~~~~~~
mm/vmalloc.c:3539:2: note: remove the 'if' if its condition is always false
        if (!vb)
        ^~~~~~~~
mm/vmalloc.c:3524:16: note: initialize the variable 'remains' to
silence this warning
        size_t remains, n;
                      ^
                       = 0
2 errors generated.
make[3]: *** [scripts/Makefile.build:252: mm/vmalloc.o] Error 1
make[3]: Target 'mm/' not remade because of errors.

steps to reproduce:
----------

tuxmake  \
  --runtime podman \
  --target-arch x86_64 \
  --toolchain clang-16 LLVM=1 LLVM_IAS=1 \
  --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2NOjxURhByyb4dR3Ld788iuYvAR/config

Related discussion on mailing list,
 - https://lore.kernel.org/llvm/202303231055.DeninwHS-lkp@intel.com/
 - https://lore.kernel.org/llvm/14c60785-2427-45db-9613-683410ff6802@lucifer.local/T/#t


--
Linaro LKFT
https://lkft.linaro.org
