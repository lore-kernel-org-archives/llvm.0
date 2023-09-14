Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490D326E14
	for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 21:20:00 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d81841ef79bso1768962276.1
        for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 14:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694726399; x=1695331199; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H3jVQnyzaN1ERNCJQeHBDC5w9lFgMjdheWTQKUJ7noQ=;
        b=pMky9gOk8qc+R/mQMp9zF4YYkaTWKM6tjgqjpO+YtXmYiAUcfs7FjZACD5Bj7Cx5xb
         ZVA1/Jd8JxUbSAc5kovBGnWZP7Dbn5xmUu5mCGWbRbcW8QEm4KzKJrrmF/HU+5UrhIhz
         q7/elRAqq53IMoQ9L1nQMoXGn/5qERwiDFJHS4WpjBYEASyRItcU+b0ofQveT5toCuqI
         KB6z01yU5L1WC8wE/MPb/SBEmyuC/rGeTpRRRJ9MPzXGvIDjAWxfH8AUc4fuVi1EpQZH
         eBphkhNy3rEWTD7GZGTqqig4T4UnZH9l6Axzg4olJtR9gmInw3HeXQVIkJ37pL3tEbLA
         JnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694726399; x=1695331199;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H3jVQnyzaN1ERNCJQeHBDC5w9lFgMjdheWTQKUJ7noQ=;
        b=HHb/12FpmVimO0zBczKLhpgsYYitBINR2HktDqgbLND2SRTEt+RxSopskiQHACP86u
         ViW1o9PjuwfWT9kK1mCEXGRHZn5OlA5V7VgdQypgOpcR7+dFAUrfsZnSP5wt4+frOI9T
         DlPd6C3qv+fP6qP5b26T/9i2YW9xuLPGmKp3+tUAYMV0Vyn1YvdOSqP5lHWzSjY4Pt4x
         Vwfr67XXa3FItUgE/7oRdmZ4mka7IobUaXls5K0KJKauklfwBPgUbDd02EtJ/Qok0Ngf
         iKkvO0f3ilLc/EOJXY5Yf8LtvRYPTj6/ISU97uNpU2SX3W2FHBjsMrL6TcQFVCzAlZMF
         lFqg==
X-Gm-Message-State: AOJu0YynqAzv3QLCw9cutSKML2OJmLIwwpuuhg5gU/jmWzwJ2Sp8rBXe
	pQ1GfQKUQZdTqai9/mhs25Z9gHx7IkGd
X-Google-Smtp-Source: AGHT+IFf8LiHETjdJOMkgyABGonPNfygVlLPcRmeIzrdeNSCgieUQG/MM4JXzNQp5a4GH33BKmh9TwiXvCaP
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:5357:1d03:3084:aacb])
 (user=irogers job=sendgmr) by 2002:a05:6902:1102:b0:d0b:d8cd:e661 with SMTP
 id o2-20020a056902110200b00d0bd8cde661mr203768ybu.12.1694726399348; Thu, 14
 Sep 2023 14:19:59 -0700 (PDT)
Date: Thu, 14 Sep 2023 14:19:44 -0700
In-Reply-To: <20230914211948.814999-1-irogers@google.com>
Message-Id: <20230914211948.814999-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230914211948.814999-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Subject: [PATCH v1 1/5] perf version: Add status of bpf skeletons
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

Add status for BPF skeletons, to see if a build has them enabled:
```
$ perf version --build-options
perf version 6.6.rc1.g0381ae36d1a6
                 dwarf: [ OFF ]  # HAVE_DWARF_SUPPORT
    dwarf_getlocations: [ OFF ]  # HAVE_DWARF_GETLOCATIONS_SUPPORT
         syscall_table: [ on  ]  # HAVE_SYSCALL_TABLE_SUPPORT
                libbfd: [ OFF ]  # HAVE_LIBBFD_SUPPORT
            debuginfod: [ OFF ]  # HAVE_DEBUGINFOD_SUPPORT
                libelf: [ OFF ]  # HAVE_LIBELF_SUPPORT
               libnuma: [ OFF ]  # HAVE_LIBNUMA_SUPPORT
numa_num_possible_cpus: [ OFF ]  # HAVE_LIBNUMA_SUPPORT
               libperl: [ on  ]  # HAVE_LIBPERL_SUPPORT
             libpython: [ on  ]  # HAVE_LIBPYTHON_SUPPORT
              libslang: [ on  ]  # HAVE_SLANG_SUPPORT
             libcrypto: [ on  ]  # HAVE_LIBCRYPTO_SUPPORT
             libunwind: [ OFF ]  # HAVE_LIBUNWIND_SUPPORT
    libdw-dwarf-unwind: [ OFF ]  # HAVE_DWARF_SUPPORT
                  zlib: [ on  ]  # HAVE_ZLIB_SUPPORT
                  lzma: [ on  ]  # HAVE_LZMA_SUPPORT
             get_cpuid: [ on  ]  # HAVE_AUXTRACE_SUPPORT
                   bpf: [ OFF ]  # HAVE_LIBBPF_SUPPORT
                   aio: [ on  ]  # HAVE_AIO_SUPPORT
                  zstd: [ on  ]  # HAVE_ZSTD_SUPPORT
               libpfm4: [ on  ]  # HAVE_LIBPFM
         libtraceevent: [ on  ]  # HAVE_LIBTRACEEVENT
         bpf_skeletons: [ OFF ]  # HAVE_BPF_SKEL
```

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-version.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/builtin-version.c b/tools/perf/builtin-version.c
index e5859c70e195..ac20c2b9bbc2 100644
--- a/tools/perf/builtin-version.c
+++ b/tools/perf/builtin-version.c
@@ -81,6 +81,7 @@ static void library_status(void)
 	STATUS(HAVE_ZSTD_SUPPORT, zstd);
 	STATUS(HAVE_LIBPFM, libpfm4);
 	STATUS(HAVE_LIBTRACEEVENT, libtraceevent);
+	STATUS(HAVE_BPF_SKEL, bpf_skeletons);
 }
 
 int cmd_version(int argc, const char **argv)
-- 
2.42.0.459.ge4e396fd5e-goog

