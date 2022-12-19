Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95C9EC2
	for <llvm@lists.linux.dev>; Mon, 19 Dec 2022 05:55:39 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id o12so7979995pjo.4
        for <llvm@lists.linux.dev>; Sun, 18 Dec 2022 21:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHzEIi0IzwDcW6qehabkUJ0tP11qKINwVZkQDVdKT0Q=;
        b=XkOpXb81CmxQ682F7rjpRz1Hxg3Pvzg4IoARDxvSGNhlfXN5gCbwNWvOlryS2HYWlq
         RMAjdRoU24YkZmD+IPs527XteVhOMeL59kWEVnCBknkb+KRDcS5DzQfeR7V/F/kZRLpk
         qS5CUy6Me2Ps1RrpOX5nliFLpDIPzqNzn7UjBKeBm2MwC6tTGD6UDa4a9cEuq7J3Vrh6
         OVdQwHYHkQEilt5XD21s9Fy8lxkoaGZiYSRKdQ0MB0Jaz+0BbDm5gCeuMc8OFs0oEnkp
         sgwYV0KHreBK1HAuJD0kvL0nz8sk/uABvYL5fGfP3OuQGHfP33l5DxkkeXrETs+1zaA5
         aHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHzEIi0IzwDcW6qehabkUJ0tP11qKINwVZkQDVdKT0Q=;
        b=Nb01I7bsXMJNEP9nf3OHOv+ERSylN7+8jRTIMaqNbEyk1U1nqUNJuyOUIi2XHpMtmG
         d4XqP1wbFakbZ950SmNwiex8TbZPNJa3mkKjX22naIOdNENIENN/i0WLcT/CkJaNQUk9
         v4T5BcVX8UHfrcqoSbT6K7bRYrxLqNl5q/7vo1x1RwN3SiMIe1DVHDivDAnqq2rRiqK0
         kR/Z8/rZycWS5kBowf6539G7hHCiqy4KACRDJEwPUOhHz2V4UU92IJPomlmSuYGiWWAa
         VK1dmC11zprYkVDvvzqqbNE7W8HxUPbOpFAt5NHfZf4NGYMnI7+JbkQKx9zq1E6J8KZU
         rIxA==
X-Gm-Message-State: ANoB5pkZQgRSu3lQenOMmCF4uwv9TFfMwRaR8Jv95xQ70jRqlhQLOqWO
	2hDOsRU6paE3PJFUF+yOGOU=
X-Google-Smtp-Source: AA0mqf4162d2wz/tcqPOfHcQD65f+tQLW8hGBDIuBRcx6CcMBX3aX0PwqQq3LS75LC/nDYoumCuJcg==
X-Received: by 2002:a17:90b:1181:b0:219:c87a:6926 with SMTP id gk1-20020a17090b118100b00219c87a6926mr41765963pjb.26.1671429339065;
        Sun, 18 Dec 2022 21:55:39 -0800 (PST)
Received: from localhost ([103.152.220.92])
        by smtp.gmail.com with ESMTPSA id y10-20020a17090a1f4a00b001ef8ab65052sm4954640pjy.11.2022.12.18.21.55.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Dec 2022 21:55:38 -0800 (PST)
From: Dan Li <ashimida.1990@gmail.com>
To: gcc-patches@gcc.gnu.org,
	Richard Sandiford <richard.sandiford@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tom Rix <trix@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Dan Li <ashimida.1990@gmail.com>,
	Marco Elver <elver@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Song Liu <song@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uros Bizjak <ubizjak@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Borislav Petkov <bp@suse.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Aaron Tomlin <atomlin@redhat.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	Changbin Du <changbin.du@intel.com>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [RFC/RFT 0/3] Add compiler support for Control Flow Integrity
Date: Sun, 18 Dec 2022 21:54:28 -0800
Message-Id: <20221219055431.22596-1-ashimida.1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

This series of patches is mainly used to support the control flow
integrity protection of the linux kernel [1], which is similar to
-fsanitize=kcfi in clang 16.0 [2,3].

I hope that this feature will also support user-mode CFI in the
future (at least for developers who can recompile the runtime),
so I use -fsanitize=cfi as a compilation option here.

Any suggestion please let me know :).

Thanks, Dan.

[1] https://lore.kernel.org/all/20220908215504.3686827-1-samitolvanen@google.com/
[2] https://clang.llvm.org/docs/ControlFlowIntegrity.html
[3] https://reviews.llvm.org/D119296

Dan Li (3):
  [PR102768] flag-types.h (enum sanitize_code): Extend sanitize_code to
    64 bits to support more features
  [PR102768] Support CFI: Add new pass for Control Flow Integrity
  [PR102768] aarch64: Add support for Control Flow Integrity

Signed-off-by: Dan Li <ashimida.1990@gmail.com>

---
 gcc/Makefile.in                               |   1 +
 gcc/asan.h                                    |   4 +-
 gcc/c-family/c-attribs.cc                     |  10 +-
 gcc/c-family/c-common.h                       |   2 +-
 gcc/c/c-parser.cc                             |   4 +-
 gcc/cgraphunit.cc                             |  34 +++
 gcc/common.opt                                |   4 +-
 gcc/config/aarch64/aarch64.cc                 | 106 ++++++++
 gcc/cp/typeck.cc                              |   2 +-
 gcc/doc/invoke.texi                           |  35 +++
 gcc/doc/passes.texi                           |  10 +
 gcc/doc/tm.texi                               |  27 +++
 gcc/doc/tm.texi.in                            |   8 +
 gcc/dwarf2asm.cc                              |   2 +-
 gcc/flag-types.h                              |  67 ++---
 gcc/opt-suggestions.cc                        |   2 +-
 gcc/opts.cc                                   |  26 +-
 gcc/opts.h                                    |   8 +-
 gcc/output.h                                  |   3 +
 gcc/passes.def                                |   1 +
 gcc/target.def                                |  39 +++
 .../aarch64/control_flow_integrity_1.c        |  14 ++
 .../aarch64/control_flow_integrity_2.c        |  25 ++
 .../aarch64/control_flow_integrity_3.c        |  23 ++
 gcc/toplev.cc                                 |   4 +
 gcc/tree-cfg.cc                               |   2 +-
 gcc/tree-cfi.cc                               | 229 ++++++++++++++++++
 gcc/tree-pass.h                               |   1 +
 gcc/tree.cc                                   | 144 +++++++++++
 gcc/tree.h                                    |   1 +
 gcc/varasm.cc                                 |  29 +++
 31 files changed, 803 insertions(+), 64 deletions(-)
 create mode 100644 gcc/testsuite/gcc.target/aarch64/control_flow_integrity_1.c
 create mode 100644 gcc/testsuite/gcc.target/aarch64/control_flow_integrity_2.c
 create mode 100644 gcc/testsuite/gcc.target/aarch64/control_flow_integrity_3.c
 create mode 100644 gcc/tree-cfi.cc

-- 
2.17.1

