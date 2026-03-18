Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458593F23D1
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 16:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851237; cv=none; b=JvJ1d3q0b1gElEVesIHKtQjGsxEFMC7G3/Yny7IdGlritMDAujLOcUpYRFkaz2wLrIc+IGK9ot3KX8+iaFznN9JOGYRaqnRCV7TOC6Fqt1qIisKK6yv2DH8B0EQuUiU6iQyf4PEsuW/txxEDkUxkN7RbjXQDCRGghJtdmhVSo6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851237; c=relaxed/simple;
	bh=FNlzEqywCsWet4sDpwofQnSGHjXjleGTc8sCBOjdrbQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eiHCJQ30OxkNBbJzaxhy40o0Em6x+FJkcBJqR2RTfxLxIQzBDqCwbEs1Ss78AUntBQOEf/vDwoowYC0oanDUTTjNmmo8Oo48Z/CrcmvwxTCQz5e82A2TddY/BvBHxDxrSvvIkmyx7rzrBMzqU+7sIJL54dRVAxLbEUCZgXnjiwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e2BDwXHK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e2BDwXHK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852af55981so95985e9.0
        for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773851229; x=1774456029; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5Xlr1UAhguDsEWYBjjEolkdK0+QL0BA/J6UXOFXwvg=;
        b=e2BDwXHKn1FV3cd7rZZ8UbPY3Yo83x9pmmYd6DONR+nMv3Gx1QQytrIeU24N1mraiU
         agIo/ruAZ7+pRq+AVmpYFBsPEPgqPE6OVETNRKz6IX/nv3hnsASGiRYEQOWzjwsqYpF3
         g/omvNflfM1On1gW1qdFBhfaYQU2UOZh1+sn3l4EU1zLTfwa2cfLrm6AfWwcDurNoCbY
         OauHC2UK+MKsbaqOZOE5ONFaWnskYJFgBusA30usjwNQugqsZMDuO6YvrjfBkPF6A4iy
         dJeBN8d2SH+9LKYdas2RDAriWFOEIA8rYB/6h02JbZgcEmu7i7JHH/gKHhFrTtjdwmoM
         hWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773851229; x=1774456029;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5Xlr1UAhguDsEWYBjjEolkdK0+QL0BA/J6UXOFXwvg=;
        b=TMyhVVIH7Q+6MFmf54jsC4ft0RU8SeZ76yIqnzXPWOAnKWnRor0p3T97U1oWtvZCs0
         mdCSkKsiB3kUkeBGbRpKNvO275nuyLtstbdvD01IEdd9oB+u4A3mLzJ7uxs3d1CkKr2A
         jZ2jjyftezVv9ZDjTtbfPE68Ue6ovLFVXmfrSCAhGdmzmhaRQhFbt4WBHPvEZXfA8Sgg
         yhQUEGQrR+SbIkE70a9WRLlnEK0EYGLr8lCvNmpBA2QKk680IIQfINUuPxgOyfdgDnBL
         8hzd2p1sHOgZg6y3QfuG58XlFv3fAAJ9KEipBSmyEhuq/A2MkVL5pQRoL1tF8z0WP3vz
         /fDg==
X-Forwarded-Encrypted: i=1; AJvYcCVD7hUfC4g8wEgVWH6PMq7TEUS4OOr0htKdLRt1eYzNSPi29LDi70TFgyjgcfm7vz1wXtZQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxYgt+fFlRKcXesfJtusXnLTvY4h98u/AxnWP6da2gM4LyoqNbi
	MBYXuYEsoYNHjkpt6BU9ouY+EZj5fvJOyvNbEwLzEHwiPgxeDSf0jj43INOo8FmykA==
X-Gm-Gg: ATEYQzyssr9Oh4p4LQT34uVcudAEq7fYiVbx4W+yzcN8FHWKOrtvzenhXxTRI8dez89
	s4AYn5AgGa1KJ8j4GMLdE8zY5W6Ou6R+vNx6GaRgKXaD/X65nDnncVP50fO2+2HojRHPcpKXyHG
	X99qOn54a4CbV8UNvZ07kQDDgx96ZPnR0wc2uKvj5egf9iHqpesDa7EuSkzP3vOGZTfPkNmQIA9
	mNoSXUwC/7bwBp6+k6xi5BntFe9a4NxObLv4I5OAdp3NuybD+rL9XyTZkByEN7RUcDL0q+rQ+dA
	hYixs2ZD5WwCGTCX9aJ6TP9Mfmf1YjQMr9Tmzelw9yXlxvwUAFVPBeDEwOwf9n0c6r6bg/7m/jU
	TFkPvLGbFNCJDTX5mbaA7TLhd6i75OlK9uAOoK0uDzZ8hRkJTDRPR5AL7yDi75ystk1Nz8oy4Ya
	XDScnGeLFt4VmnYGpSeJMwpSCQG48y5cmXUtng7L2LrDtUJ2Q6YPtBJTdrWKGQ
X-Received: by 2002:a05:600c:4a13:b0:47e:dbb0:fbcd with SMTP id 5b1f17b1804b1-486f4763f5amr868285e9.6.1773851228585;
        Wed, 18 Mar 2026 09:27:08 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:c66d:1e51:595a:925])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43b5189221dsm8839469f8f.23.2026.03.18.09.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:27:08 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Subject: [PATCH v2 0/4] KCOV function entry/exit records
Date: Wed, 18 Mar 2026 17:26:57 +0100
Message-Id: <20260318-kcov-extrecord-v2-0-2522da6fcd3f@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFHSumkC/3XMQQ7CIBCF4as0sxYzUCXVlfcwXSBMKVE7DTSkp
 uHuYvcu/5e8b4NEMVCCa7NBpBxS4KmGOjRgRzN5EsHVBoVKYyuleFrOgtYlkuXohCZ0F6MeaDo
 L9TRHGsK6g/e+9hjSwvGz+1n+1r9UlgKF7gZs7cng2bibZ/YvOlp+Q19K+QITB7l0rQAAAA==
X-Change-ID: 20260311-kcov-extrecord-6e0d9a2b0a8c
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773851224; l=9531;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=FNlzEqywCsWet4sDpwofQnSGHjXjleGTc8sCBOjdrbQ=;
 b=4VAu2QH2gLfuqKo834Rr6MFS/PtzEx/eU+qHiq8RH1XfjIhhn0N5O2AqH5qb7DqIpylt0kdI+
 r5DUnEtU6nQD1UrSIHOt2iSX6qvlyAMyFw1SRfQYc/t9RgaVKY3Qty5
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

This series adds a KCOV feature that userspace can use to keep track of
the current call stack. When userspace enables the new mode
KCOV_TRACE_PC_EXT, collected instruction addresses are tagged with one
of three types:

 - function entry
 - non-entry basic block
 - function exit

This requires corresponding LLVM support, which was recently added in
LLVM commit:
https://github.com/llvm/llvm-project/commit/dc5c6d008f487eea8f5d646011f9b3dca6caebd7

A simple example of how to use KCOV_TRACE_PC_EXT:
```
user@vm:~/kcov/u$ cat kcov-u.c

  typeof(x) __res = (x);      \
  if (__res == (typeof(x))-1) \
    err(1, "SYSCHK(" #x ")"); \
  __res;                      \
})

static void indent(int depth) {
  for (int i=0; i<depth; i++)
    printf("  ");
}

int main(void) {
  int fd = SYSCHK(open("/sys/kernel/debug/kcov", O_RDWR));
  SYSCHK(ioctl(fd, KCOV_INIT_TRACE, COVER_SIZE));
  unsigned long *cover = (unsigned long*)SYSCHK(
      mmap(NULL, COVER_SIZE * sizeof(unsigned long), PROT_READ | PROT_WRITE,
           MAP_SHARED, fd, 0));
  SYSCHK(ioctl(fd, KCOV_ENABLE, KCOV_TRACE_PC_EXT));
  usleep(1000); // fault in stuff
  __atomic_store_n(&cover[0], 0, __ATOMIC_RELAXED); // start recording
  usleep(1000);
  unsigned long cover_num = __atomic_load_n(&cover[0], __ATOMIC_RELAXED); // end

  int depth = 0;
  for (unsigned long i = 0; i < cover_num; i++) {
    unsigned long record = cover[1+i];
    unsigned long pc = record | ~KCOV_RECORD_IP_MASK;
    switch (record & KCOV_RECORDFLAG_TYPEMASK) {
    case KCOV_RECORDFLAG_TYPE_NORMAL:
      indent(depth);
      printf("BB    0x%lx\n", pc);
      break;
    case KCOV_RECORDFLAG_TYPE_ENTRY:
      indent(depth);
      printf("ENTER 0x%lx\n", pc);
      depth++;
      break;
    case KCOV_RECORDFLAG_TYPE_EXIT:
      if (depth == 0)
        errx(1, "exit at depth 0");
      depth--;
      indent(depth);
      printf("EXIT  0x%lx\n", pc);
      break;
    default: errx(1, "unknown record type in 0x%016lx", record);
    }
  }
}
user@vm:~/kcov/u$ cat symbolize.py

import sys
syms = []
with open('/proc/kallsyms') as f:
  for line in f:
    parts = line.strip().split(' ')
    if len(parts) < 3:
      continue
    syms.append((int(parts[0], 16), parts[2]))

for line in sys.stdin:
  parts = line.rstrip().split('0x')
  if len(parts) != 2:
    continue
  record_pc = int(parts[1], 16)
  for i in range(0, len(syms)-1):
    if syms[i+1][0] > record_pc:
      print(parts[0] + syms[i][1] + '+' + hex(record_pc - syms[i][0]))
      break
user@vm:~/kcov/u$ gcc -o kcov-u kcov-u.c -Wall
user@vm:~/kcov/u$ sudo ./kcov-u | sudo ./symbolize.py
ENTER __audit_syscall_entry+0x2c
  BB    __audit_syscall_entry+0xa4
  BB    __audit_syscall_entry+0xd2
  BB    __audit_syscall_entry+0x1ab
  ENTER ktime_get_coarse_real_ts64+0x1a
    BB    ktime_get_coarse_real_ts64+0x3f
    BB    ktime_get_coarse_real_ts64+0x96
  EXIT  ktime_get_coarse_real_ts64+0x9b
EXIT  __audit_syscall_entry+0x12b
ENTER __x64_sys_clock_nanosleep+0x18
  ENTER __se_sys_clock_nanosleep+0x33
    BB    __se_sys_clock_nanosleep+0x10e
    ENTER get_timespec64+0x29
      ENTER _copy_from_user+0x17
        BB    _copy_from_user+0x5d
      EXIT  _copy_from_user+0x62
      BB    get_timespec64+0xaf
    EXIT  get_timespec64+0xd5
    BB    __se_sys_clock_nanosleep+0x1c0
    ENTER common_nsleep+0x1f
      ENTER hrtimer_nanosleep+0x2f
        ENTER hrtimer_setup_sleeper_on_stack+0x20
          BB    hrtimer_setup_sleeper_on_stack+0x2a
          BB    hrtimer_setup_sleeper_on_stack+0x7e
        EXIT  hrtimer_setup_sleeper_on_stack+0x14c
        ENTER do_nanosleep+0x2d
          BB    do_nanosleep+0x3b
          ENTER hrtimer_start_range_ns+0x28
            BB    hrtimer_start_range_ns+0x67
            ENTER remove_hrtimer+0x22
              BB    remove_hrtimer+0x4b
            EXIT  remove_hrtimer+0x1ea
            BB    hrtimer_start_range_ns+0x173
            ENTER __hrtimer_cb_get_time+0x11
              BB    __hrtimer_cb_get_time+0x32
              ENTER ktime_get+0x17
                BB    ktime_get+0x33
                BB    ktime_get+0x58
                ENTER kvm_clock_get_cycles+0xc
                  BB    kvm_clock_get_cycles+0x48
                EXIT  kvm_clock_get_cycles+0x4d
                BB    ktime_get+0xb7
                BB    ktime_get+0x149
              EXIT  ktime_get+0x151
            EXIT  __hrtimer_cb_get_time+0x84
            BB    hrtimer_start_range_ns+0x3bc
            BB    hrtimer_start_range_ns+0x5a4
            ENTER enqueue_hrtimer+0x20
              BB    enqueue_hrtimer+0x2a
              BB    enqueue_hrtimer+0x5b
              ENTER timerqueue_add+0x1c
                BB    timerqueue_add+0x41
                BB    timerqueue_add+0xb2
                BB    timerqueue_add+0xb2
                BB    timerqueue_add+0xf9
              EXIT  timerqueue_add+0x150
            EXIT  enqueue_hrtimer+0xaf
            BB    hrtimer_start_range_ns+0x714
            ENTER hrtimer_reprogram+0x1b
              BB    hrtimer_reprogram+0x65
              BB    hrtimer_reprogram+0x13a
              BB    hrtimer_reprogram+0x1dc
              ENTER tick_program_event+0x25
                BB    tick_program_event+0x65
                ENTER clockevents_program_event+0x20
                  BB    clockevents_program_event+0x7e
                  ENTER ktime_get+0x17
                    BB    ktime_get+0x33
                    BB    ktime_get+0x58
                    ENTER kvm_clock_get_cycles+0xc
                      BB    kvm_clock_get_cycles+0x48
                    EXIT  kvm_clock_get_cycles+0x4d
                    BB    ktime_get+0xb7
                    BB    ktime_get+0x149
                  EXIT  ktime_get+0x151
                  BB    clockevents_program_event+0x219
                EXIT  clockevents_program_event+0x22b
              EXIT  tick_program_event+0x89
            EXIT  hrtimer_reprogram+0x211
          EXIT  hrtimer_start_range_ns+0x74d
          BB    do_nanosleep+0x9c
          ENTER sched_clock+0xc
            BB    sched_clock+0x40
          EXIT  sched_clock+0x45
          ENTER arch_scale_cpu_capacity+0x13
            BB    arch_scale_cpu_capacity+0x1a
          EXIT  arch_scale_cpu_capacity+0x24
          ENTER __cgroup_account_cputime+0x1b
            ENTER css_rstat_updated+0x2c
              BB    css_rstat_updated+0x77
              BB    css_rstat_updated+0xbe
            EXIT  css_rstat_updated+0x1bc
            BB    __cgroup_account_cputime+0x81
          EXIT  __cgroup_account_cputime+0x86
          ENTER sched_clock+0xc
            BB    sched_clock+0x40
          EXIT  sched_clock+0x45
          ENTER sched_clock+0xc
            BB    sched_clock+0x40
          EXIT  sched_clock+0x45
          ENTER __msecs_to_jiffies+0x13
            BB    __msecs_to_jiffies+0x25
          EXIT  __msecs_to_jiffies+0x4c
          ENTER prandom_u32_state+0x15
          EXIT  prandom_u32_state+0xbe
          ENTER hrtimer_try_to_cancel+0x1e
            BB    hrtimer_try_to_cancel+0x6a
            BB    hrtimer_try_to_cancel+0x1da
          EXIT  hrtimer_try_to_cancel+0x1be
          BB    do_nanosleep+0xbf
          BB    do_nanosleep+0x166
          BB    do_nanosleep+0x177
          BB    do_nanosleep+0x275
        EXIT  do_nanosleep+0x2d5
        BB    hrtimer_nanosleep+0x182
      EXIT  hrtimer_nanosleep+0x194
    EXIT  common_nsleep+0x77
  EXIT  __se_sys_clock_nanosleep+0x15d
EXIT  __x64_sys_clock_nanosleep+0x62
ENTER __audit_syscall_exit+0x1d
  BB    __audit_syscall_exit+0x5c
  ENTER audit_reset_context+0x1e
    BB    audit_reset_context+0x52
  EXIT  audit_reset_context+0x5f6
EXIT  __audit_syscall_exit+0x168
ENTER fpregs_assert_state_consistent+0x11
  BB    fpregs_assert_state_consistent+0x48
  BB    fpregs_assert_state_consistent+0xa6
EXIT  fpregs_assert_state_consistent+0xcc
ENTER switch_fpu_return+0xe
  ENTER fpregs_restore_userregs+0x12
    BB    fpregs_restore_userregs+0x4c
    BB    fpregs_restore_userregs+0xb8
  EXIT  fpregs_restore_userregs+0x107
EXIT  switch_fpu_return+0x18
```

Signed-off-by: Jann Horn <jannh@google.com>
---
Changes in v2:
- patch 2: change commit message (dvyukov)
- patch 2: add __always_inline (dvyukov)
- patch 2: add comment in __sanitizer_cov_trace_pc_entry
- replaced patch 3 with patches 3+4
  - store extended record format flag as part of kcov_mode (dvyukov)
  - clarify comment in __sanitizer_cov_trace_pc_exit (dvyukov)
- Link to v1: https://lore.kernel.org/r/20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com

---
Jann Horn (4):
      sched: Ensure matching stack state for kcov disable/enable on switch
      kcov: wire up compiler instrumentation for CONFIG_KCOV_EXT_RECORDS
      kcov: refactor mode check out of check_kcov_mode()
      kcov: introduce extended PC coverage collection mode

 include/linux/kcov.h      |  9 +++++
 include/uapi/linux/kcov.h | 12 ++++++
 kernel/kcov.c             | 94 ++++++++++++++++++++++++++++++++++++-----------
 kernel/sched/core.c       | 13 +++++--
 lib/Kconfig.debug         | 12 ++++++
 scripts/Makefile.kcov     |  2 +
 tools/objtool/check.c     |  2 +
 7 files changed, 120 insertions(+), 24 deletions(-)
---
base-commit: b29fb8829bff243512bb8c8908fd39406f9fd4c3
change-id: 20260311-kcov-extrecord-6e0d9a2b0a8c

--  
Jann Horn <jannh@google.com>

