Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133591EE019
	for <llvm@lists.linux.dev>; Fri,  5 Sep 2025 05:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757049509; cv=none; b=HWUAMkQlnZvQw0LUsZ8x2uCIhTQBCb9Dl682+xur/+skSI4LMCfG4wcKW03si6kLVtoiVJACO1sqPnKsXY+P5nC6VgNVZ0X01KHAp2MkteAFC56YavE+X6YFACI0O318zL82sedCKXgcH6Du4vq0z21hI4mWbdxvgiQl+KqMgh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757049509; c=relaxed/simple;
	bh=ygTZIPfgCo6hNG+cPV9VDgeofT3k1nLuYT1YU2g1kQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b5yeND1Yg3VnUrqkDIcbSSyaJSugBMAN0V26mcH1bkp1Z068ZQFQF6xsT7BtPGur1k5xu8BbZfBlmlsQAGh8C4CIQstnjVbykdXFycbg9g3DMxGy+d7HmlBvTRXhxXTvIeg7fAqnKmpd7N5qudy7kx9W5u7pN35EQEkY6IY3yzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GkmIw/+S; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GkmIw/+S"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso1162459f8f.2
        for <llvm@lists.linux.dev>; Thu, 04 Sep 2025 22:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757049504; x=1757654304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KbidYaPpONskm2RHlehMffMFV6QihoSSM5d6KYCHNk0=;
        b=GkmIw/+SCqqVXdnCSmH8JFkpp8bx3jRFQtdLZVGvo4GDdRFb2JHAYe3OkLyNRx6b+6
         7LQDygEkJJxKU9ym9cpgPt807pDFJkkCUPj+Xm4CucYW0JK3i0eVd9NwbZf1Ugefg72e
         cypvQD6EQ1VCHDJFgns4hplMBjRJNpmogR0UAodA0slM2tOW+7lFoO+SlQFRg1LhEsOX
         o2xW1uCpRYxJ3egzi9fyoZuetfjOLhbZf5eDd0VVtFTUVO7jMGTY36/C+J3OGEee1VQa
         YSWqc+D12sPV9x3E9QzWFbFLyHt63qRxuYWQq9JcsjwbPKOhMZG9jBFK7/T2N4+NfbGD
         MthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757049504; x=1757654304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbidYaPpONskm2RHlehMffMFV6QihoSSM5d6KYCHNk0=;
        b=KtD7jjuMatVZyunGcCMfilUzD6LVWM1mbysgCAjtAzb9Sqs0SKwPj2FsOxiCn9E+P0
         N9MTVWKEtIMcAYzdGpGKLrCVedyPJtONL6P05IQAJhTqgVGUbj+84HgnSp9RWRDx/enO
         Tao+35bP5H7DCzEp22/sSyXLq62dEdTdVWsKVYnx/3WzjAFt3zZV29WDKmEyDFNDPGRo
         XALqIEoIhxxzF2KZbSAVhaR5PwLsnzmonVLtZsyCNDxIIeaMAF5Om0z/tCZFOgZ/oeed
         WpvQV3gs39FZXw8K711H5h2kXjV8T2gWCpp2Y8XbEfSoIeAfxtj0A0/Rhp6shKQPzPI4
         +ywg==
X-Forwarded-Encrypted: i=1; AJvYcCUG5j1kCnm0NugGu6gYo03pMb/2QB6WdPkLLG+2sa+sdGXX0R8QOtMVtokmIDdabie/yfKq@lists.linux.dev
X-Gm-Message-State: AOJu0YzvZeYNy8HqxKBggwc9DrlG+ftrojUMtufsrSfq88mLolYufSZY
	ECYG5HAxrP2NMyAdBjUp0VTom15di4GaEneVMtZEmyuOFbdd/7XYNKOM+5iBnfowcXg=
X-Gm-Gg: ASbGncv7Dq2kqGuGX8JGkxyA0YDvC5AFPbcdgGcGP+pIWs16JVyTrKueGrIURj+p05g
	QNISVB4A3I+BBnyJREKuItzgN65iRB7MCSR0X1o9b4G9FEZrrjO8BCv6a2uvP3SZUp+B5l7eZ1z
	o6/6538Io/8QU7fiN4CV917pYs1FlmTfTJLe/qhQXO6J3TJrvkBS/uqkEr7FMrJNGxUsFxoFS4c
	Vkr14PrCUwYALG8Mi+lTir2xOWlk7vUmlMgg9R2d6cRghHKiOCPT7z30ZWHGgQH21b5dTT5Ns+h
	BLiSe7iuSjUv6jeJyHNxz9JnW3xoQyxubKLun/iYlJXYWQXi40kgBkKTi1232anIZ9KM/9VrdEt
	yetaTacds5P4NJqymb3rPj34Vf1ww/jfeSOCXjA==
X-Google-Smtp-Source: AGHT+IFVJ7Ek9klNQOz86proipcWUUpbFNH1LIRA+A1sQqLYNggp1aEWZp2EFhKAmEv4xD4F+marag==
X-Received: by 2002:a5d:64c7:0:b0:3d0:ae58:e337 with SMTP id ffacd0b85a97d-3d1dcb76478mr17958366f8f.14.1757049504225;
        Thu, 04 Sep 2025 22:18:24 -0700 (PDT)
Received: from F5.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcf04b8sm27410154a91.26.2025.09.04.22.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 22:18:23 -0700 (PDT)
From: Hoyeon Lee <hoyeon.lee@suse.com>
To: 
Cc: netdev@vger.kernel.org,
	Hoyeon Lee <hoyeon.lee@suse.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	bpf@vger.kernel.org (open list:BPF [LIBRARY] (libbpf)),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [RFC bpf-next v2 0/1] libbpf: add compile-time OOB warning to bpf_tail_call_static
Date: Fri,  5 Sep 2025 14:18:11 +0900
Message-ID: <20250905051814.291254-1-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC adds a compile-time check to bpf_tail_call_static() to warn
when a constant slot(index) is >= map->max_entries. This uses a small
BPF_MAP_ENTRIES() macro together with Clang's diagnose_if attribute.

Clang front-end keeps the map type with a '(*max_entries)[N]' field,
so the expression

    sizeof(*(m)->max_entries) / sizeof(**(m)->max_entries)

is resolved to N entirely at compile time. This allows diagnose_if()
to emit a warning when a constant slot index is out of range.

Example:

    struct { /* BPF_MAP_TYPE_PROG_ARRAY = 3 */
        __uint(type, 3);             // int (*type)[3];
        __uint(max_entries, 100);    // int (*max_entries)[100];
        __type(key, __u32);          // typeof(__u32) *key;
        __type(value, __u32);        // typeof(__u32) *value;
    } progs SEC(".maps");

    bpf_tail_call_static(ctx, &progs, 111);

produces:

    bound.bpf.c:26:9: warning: bpf_tail_call: slot >= max_entries [-Wuser-defined-warnings]
       26 |         bpf_tail_call_static(ctx, &progs, 111);
          |         ^
    /usr/local/include/bpf/bpf_helpers.h:190:54: note: expanded from macro 'bpf_tail_call_static'
      190 |          __bpf_tail_call_warn(__slot >= BPF_MAP_ENTRIES(map));                  \
          |                                                             ^
    /usr/local/include/bpf/bpf_helpers.h:183:20: note: from 'diagnose_if' attribute on '__bpf_tail_call_warn':
      183 |     __attribute__((diagnose_if(oob, "bpf_tail_call: slot >= max_entries", "warning")));
          |                    ^           ~~~

Out-of-bounds tail call checkup is no-ops at runtime. Emitting a
compile-time warning can help developers detect mistakes earlier. The
check is currently limited to Clang (due to diagnose_if) and constant
indices, but should catch common errors.

---
Changes in V2:
- add function definition for __bpf_tail_call_warn for compile error

Hoyeon Lee (1):
  libbpf: add compile-time OOB warning to bpf_tail_call_static

 tools/lib/bpf/bpf_helpers.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

--
2.51.0
