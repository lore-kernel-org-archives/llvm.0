Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ED110E7
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 00:49:06 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5417f156cb9so205494667b3.8
        for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 17:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680223745;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=84rSN6Ht+1euIPSdyCBZjcpP/EwF+4yl0XpMXRK6K0o=;
        b=eO6h9idthBFhW8xHGMhl0AqUg17HLN8tPAnocKihroIpMCiEdvoP7m53EnwCd6qkil
         /VdUBw0S0LW3Up3c3CksxNzX9QdrmWn5A/gx2Adl7JL69alaBGvIwktXbBtn+tlZaHev
         oUy5D1Gaf4NfMEdt82MYjcTfZ3NUHiWVRdTh5GEFUlI9ydHHt274KcVg0NEA89ls4xrd
         /LrPI9XkMqokZ5VHiOj26fuf1KeoAJ3YQv6EeoCS4ekdkhbO2IpQxbze4xZEdWbLzOnt
         DzcNk6+gM1UK5vqx9L4VxEdm72G4ESKxu94dtHGldRzIQTchr1HDm9YkgJzK6juTIG2f
         M51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680223745;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=84rSN6Ht+1euIPSdyCBZjcpP/EwF+4yl0XpMXRK6K0o=;
        b=xoLscCBQaWFTIoSz6YbkvSDlto+6cMxKvBBJagF3HLtk817eBHNsIGjY6mNXokI+Ap
         jJzAmBo41tf9+Iq12ysu8CCdVOi00t4xQiZAkeCLvL6w4KB03HZA79tMMefzbcRRAznc
         A1X7Flgr2TLavt6/ySpuxOpoDg8F1QF+9JnevRfMlfIG/w7eQ22dkJJ05yCDUwrzGWCt
         dBZX9pTjAl031nwZunlMVFEN6ZfPmg1YqOem3o2xjtzBfDYBGdOmqwowtSwxriX7Vszl
         txa/cbdARFrtxWxQsFRgzYpLP91ShXIzXk6RQNUz4S9vLjdEqRAWVBPcPkPBAWISryXq
         ZAzw==
X-Gm-Message-State: AAQBX9fD3NZ7KUc3ilqyLUv6eiKYj1M2VjeNLxFUEWqRP6UXMD2rNdfF
	XSv1k1gBh+5L0q4RpBW2TXp3y3Pmh1Mg
X-Google-Smtp-Source: AKy350YTjGn40/rJlWyDU+AGPuezI4eGj7Nq1IkN4RT41dxlR0XFQQOcf00oGq/k4FZ24S9I75hMIlV8MuF2
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:11ea:eb75:e48c:2c04])
 (user=irogers job=sendgmr) by 2002:a05:6902:154e:b0:b77:d2db:5f8f with SMTP
 id r14-20020a056902154e00b00b77d2db5f8fmr16389779ybu.12.1680223745258; Thu,
 30 Mar 2023 17:49:05 -0700 (PDT)
Date: Thu, 30 Mar 2023 17:48:40 -0700
Message-Id: <20230331004844.1592789-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Subject: [PATCH v1 0/4] Support for llvm-addr2line
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The addr2line command is started and then addresses piped to it. In
order to determine the end of a addr2lines output a ',' it output with
an expectation to get '??\n??:0\n' as a reply. llvm-addr2line differs
in that ',' generates a reply of ','.

The approach detects and then caches the addr2line style. When records
are read the sentinel is detected appropriately.

Comparing the output there is a little more inline data on my machine
with llvm-addr2line:
$ sudo perf record -a -g sleep 1
$ sudo perf report --addr2line=addr2line > a.txt
$ sudo perf report --addr2line=llvm-addr2line > b.txt
$ wc -l a.txt b.txt
  12386 a.txt
  12477 b.txt

Some other small changes, switching to the api/io code to avoid file
streams wrapping the command's stdin/stdout. Ignore SIGPIPE for when
addr2line exits and writes fail.

Ian Rogers (4):
  tools api: Add io__getline
  perf srcline: Simplify addr2line subprocess
  perf srcline: Support for llvm-addr2line
  perf srcline: Avoid addr2line SIGPIPEs

 tools/lib/api/io.h        |  40 ++++++++++
 tools/perf/tests/api-io.c |  36 +++++++++
 tools/perf/util/srcline.c | 162 +++++++++++++++++++++++---------------
 3 files changed, 174 insertions(+), 64 deletions(-)

-- 
2.40.0.348.gf938b09366-goog

