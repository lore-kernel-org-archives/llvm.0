Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDE41DFD2
	for <llvm@lists.linux.dev>; Fri, 17 May 2024 21:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715982666; cv=none; b=O+THAvJK8L+jKC1ni8cumaEYu65aG/XPTP7CnOgiIRBySBZz9bsGYjXJnl8hQ1hezXUB9CdZdAWRC/OcYNYt08tWe3kwxzefLNQ1KRUu6jWd4Uu/6hGAeltU/HvalCm2HIX9/kDtfkOrmWLnkPTpDT5yFkwOvqxuXaFkZN04fYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715982666; c=relaxed/simple;
	bh=0E7eaNTn25VPZND5g23qK/Ao2qthaQCAHj3l7eXug3g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uZkar9FYSUqzbGKXPUjzYgL6Zg+gkm7MzjAj0W3q6jtveHzdxzv+L3QedhZzSk/rEunGY2mldn7LicFEWJlcIMBEoHr9z7EGWkx9R2X2lDNq/EklbXSDq48ZusMNllGQh9Ksv191d9aOyu00QpyORvIX6JDPnRQdohyXcX0gED0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=I5JM9JpD; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="I5JM9JpD"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-61ae4743d36so7009497b3.2
        for <llvm@lists.linux.dev>; Fri, 17 May 2024 14:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1715982662; x=1716587462; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JqVu/kA6Go97evFIK242c0lkRDXDcl7LbF0LEfPVfNg=;
        b=I5JM9JpDLc+kQauVnoGt5fJxQErObZGLKFVhnuXmVdsIU+Zn3zjZ6Vn8OBkCzX8uM8
         xo6vDqHn1pQFiAWWnlfZwdUkxr01SVDGg1Xh3rK3URGPKcBY0RSzIsdWTjJbS7W4qOwG
         TMmUS/2W+H6zyiqv8saj1fJ6/SqAlzWCucB4ifwyKe5UjCK9MMKk4Lq1TWQ6xpcbDHwf
         lEPQ/2EurHJ+RHCsYex9TNuyYCFRYZf/y5C7ypa1lK2phGJkGDQD/TYp7OQE4d/wd5m7
         MMBNrD4+h5cA6OjxitEatiogaYywK5YOkeHXpvvC6x/+9wN9VQlxg55P85ewKgJ/ZGwL
         7m/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715982662; x=1716587462;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JqVu/kA6Go97evFIK242c0lkRDXDcl7LbF0LEfPVfNg=;
        b=vA3FJA7OQIqVc1kRRM64lBpUbT2iVFvx620sExp54uaafHYe4MrFB3Av4Q9ZuIThrW
         O92WjsYMpNB+fkAyPJvT9geYEOmx/qx5fMGwLwHXRauQ2IilonGFTHPXGhXid6D/2W+j
         O4ZW1LyLjcUgrZ2SXHsSsKfaV6R+5f9pqEnyf8/NA8FAz1NVD68f1RcvFpzQLwRvQuXP
         ySsA06E19pWep7kBQX7kTpmsaVhXB4oBZs9FgI90qqAYkjoFDf2DSLaAJuJKHdXLhaV5
         98C0DPQxYB7dH4r1NxZ+Xq9f/X84rXrmw9yIcbzmkh+L/WJLdMO9Abcc+IWvVHfuudQM
         Qitw==
X-Forwarded-Encrypted: i=1; AJvYcCUuvE/rox2hdGwIzujrlTyZK8Ki7S3FOw3GagCJtUEP5ZQT85tmqwS2qjq/gZrpbPQjOKnfgtI/XJK9MAqMYucdoc2IfQ==
X-Gm-Message-State: AOJu0YwVevL/fb4EJX95dD60lwOboJzYjmzmk/63jAxXFrDcseB7SaxP
	xvd/TPjTtTPPP+N+nz2Xu5ygNbDpj854riwXbpjQZDK88WMqG0Mg8sFxoi5EA9vTZmFuBj8oH/Z
	f8eV7BbdvctnU1+80Z3KOHjZ9Ph3rnHE0Q1/iLQ==
X-Google-Smtp-Source: AGHT+IEe+nZ2KnnP6vARg4nvWdn1LICCt7qYyk2XbAACiY4Suxq8FXGH4FZW8lOfg1gNUOlq+6kGwbcqxVUklqhTOmo=
X-Received: by 2002:a81:ac23:0:b0:61b:3348:34c0 with SMTP id
 00721157ae682-622b016d1a7mr216119787b3.50.1715982662218; Fri, 17 May 2024
 14:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Ivan Babrou <ivan@cloudflare.com>
Date: Fri, 17 May 2024 14:50:51 -0700
Message-ID: <CABWYdi0ymezpYsQsPv7qzpx2fWuTkoD1-wG1eT-9x-TSREFrQg@mail.gmail.com>
Subject: bpftool does not print full names with LLVM 17 and newer
To: bpf <bpf@vger.kernel.org>
Cc: kernel-team <kernel-team@cloudflare.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

We recently bumped LLVM used for bpftool compilation from 15 to 18 and
our alerting system notified us about some unknown bpf programs. It
turns out, the names were truncated to 15 chars, whereas before they
were longer.

After some investigation, I was able to see that the following code:

    diff --git a/src/common.c b/src/common.c
    index 958e92a..ac38506 100644
    --- a/src/common.c
    +++ b/src/common.c
    @@ -435,7 +435,9 @@ void get_prog_full_name(const struct
bpf_prog_info *prog_info, int prog_fd,
        if (!prog_btf)
            goto copy_name;

    +    printf("[0] finfo.type_id = %x\n", finfo.type_id);
        func_type = btf__type_by_id(prog_btf, finfo.type_id);
    +    printf("[1] finfo.type_id = %x\n", finfo.type_id);
        if (!func_type || !btf_is_func(func_type))
            goto copy_name;

When ran under gdb, shows:

    (gdb) b common.c:439
    Breakpoint 1 at 0x16859: file common.c, line 439.

    (gdb) r
    3403: tracing  [0] finfo.type_id = 0

    Breakpoint 1, get_prog_full_name (prog_info=0x7fffffffe160,
prog_fd=3, name_buff=0x7fffffffe030 "", buff_len=128) at common.c:439
    439        func_type = btf__type_by_id(prog_btf, finfo.type_id);
    (gdb) print finfo
    $1 = {insn_off = 0, type_id = 1547}


Notice that finfo.type_id is printed as zero, but in gdb it is in fact 1547.

Disassembly difference looks like this:

    -    8b 75 cc                 mov    -0x34(%rbp),%esi
    -    e8 47 8d 02 00           call   3f5b0 <btf__type_by_id>
    +    31 f6                    xor    %esi,%esi
    +    e8 a9 8c 02 00           call   3f510 <btf__type_by_id>

This can be avoided if one removes "const" during finfo initialization:

    const struct bpf_func_info finfo = {};

This seems like a pretty annoying miscompilation, and hopefully
there's a way to make clang complain about this loudly, but that's
outside of my expertise. There might be other places like this that we
just haven't noticed yet.

I can send a patch to fix this particular issue, but I'm hoping for a
more comprehensive approach from people who know better.

Thanks.
