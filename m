Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E092F1FDB
	for <llvm@lists.linux.dev>; Wed, 11 Mar 2026 21:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773263210; cv=none; b=XXpulCm9S7ZbKXbtmdruJthGJukAsphhLYLTkLmA1aJweobjksIVyb40djYPEAHwPUnPh2r7iPrno2JTCyTvA9INDBUo8ZvGzCxZIGsxUy0RynTuRIG+eDex11EaHNBCfAAzGZXff2muOW7OJz0LTOvcBuLXxgUO+a6He9C0tm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773263210; c=relaxed/simple;
	bh=Uy/UI29Iq405E8xsVzmdW4SfU10ROPsA+zY2cfEtEVk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=plMaqEzLMRagbtfpqiirZLiPUO/bIVGcql83HX63Pb04P6kwgCf1syDggQYwrgdNgVPeyMrJTiS8mOWNqFAAhT71aJXvyC5v2f+seQHOLjzav2mC6CW8dpmU19gXWLDbs7JEHjIiGPRGeYlsxE/NVtTbuGZ/SWwQSuSvjZEM4zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tqzIZtaW; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tqzIZtaW"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852ef20fe8so8095e9.1
        for <llvm@lists.linux.dev>; Wed, 11 Mar 2026 14:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773263207; x=1773868007; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gZdQ8Ils30nUjKOGDWVOhEvKLZ9afdR+c489qxXz3cA=;
        b=tqzIZtaW+33dV9x4BOVD7G0+dHxTNE3n7wI4zQF0FNIbb+gbTAk+PRQ0g3SVEdZI6j
         VCO4+m3XtpvzBMVtR2M7MYleTuW1l/hf+w5srEpSBkNGV06QYhJfl/iAKQnijhjONnyw
         ck4hYM/DaWwX6PBArJ2OimWkj3ncIl/i3C0Cwqnio/5VOw5nbguVpFwol2rBg7MOfy+9
         MCPmD5Zf8zJ5CArswp1Wlfd1vKLzx0WKLxIEJyK6V/Hl6RK4ZKjGfCn4lwSiCGLyDqwO
         3Gq3cY7XRS/OfAKQ1+UslW7kVhzRay3rHGJEORFh0gFJY7nFCiUQwaQk5u6B8UrWINYn
         I2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773263207; x=1773868007;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZdQ8Ils30nUjKOGDWVOhEvKLZ9afdR+c489qxXz3cA=;
        b=pN49Q6fKdLkRp6EDUIXA5ljIesBWNr83E999LLA06I5oDV7Z2nFBFYPfNDUlmcfv2Y
         TQ7lCoWZ0PaJDHUPuXUG9wGPYTkWiHW2JRh26yJw5P6MAhypdm4HR1BCAxJvIw70PU0q
         ee4WqDtVx+Pcc9k1KAzEeqhXWE8vi9+HZGnhB+FdqDLsuV556ahzNfcGP1qxdZXEA2Sm
         QO8egBcV2dqbMQEqEfsQgQVvwb2AJXhCOOB3T/4esvs3fOQlzXRJ/W3stXUzadkxBt9c
         UzYtQYToxQ31jExFO/kR76VWLZNFpQUBgKiE9W7Md/6kUvc3sIBe0vIc21WKV5sWphrJ
         WYUg==
X-Forwarded-Encrypted: i=1; AJvYcCUysmvCnqDI6ljFIjNNN+sKNU4fpha7i/oAEl8CJ8YQud+DhO7x2LyVofo6bAlwYzNHBNVl@lists.linux.dev
X-Gm-Message-State: AOJu0YwjJ5P7e3hGkEi48DzxS7zxe9VuCcy8zzP6CmFbjf4CYA5ToeiI
	M2QNXUKmuQzQWDlmgYy2cLyBVIris2/ch9kefiLpmxdQ97fOOyeoq0npfLNtE71oTw==
X-Gm-Gg: ATEYQzz6diG0Eoq/q8vxgw/qhnXF/3ABw2i272IWhpMTWnp7+hY33VQKdU9X1VhL7sy
	NwajGUggw/Er1IADQVqlDq2mmAtRLGY4XuuLEaCA0EkZS2TZx/sjOu9Scf6Q8x4l0DeOUDGHKzz
	09D6q4PZ9FMbMpIjCWG6PXef8mcIAZsln3AEOKRmbX08JjoSdYJ/rYoH2bdE9RmqeKcs/02VqMY
	N5eCm+Qwy+pY9EqC3AM9reBGeXPMzaiwFmGqLRJdfXFinNdrQ+v3HIM2UfkdFuG4aUjpafueXZv
	m2pg/Lowt8P/SPPvXmTiCwASG8Jldv/AcaTuKBC6SbvFuH50ZWueF1JSaFBlr8adWdnj4qt+NqR
	XTTMu3Cz4raVEh1SdwGRYEvIixAaDiDhpsRSOI3wgIZa9+4yMwgl9bIs8FtKo2dOU2DL07fFDBR
	YKbhrta3yefKeNxP8y/qndizeRZSwcDH1vJwWtj+kpW5VYtLBGwJ0=
X-Received: by 2002:a05:600c:da:b0:477:86fd:fb49 with SMTP id 5b1f17b1804b1-4854fa196edmr202315e9.10.1773263206900;
        Wed, 11 Mar 2026 14:06:46 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:c9d4:528c:7414:ba3a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-439fe19ad9asm2575134f8f.7.2026.03.11.14.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 14:06:46 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Subject: [PATCH 0/3] KCOV function entry/exit records
Date: Wed, 11 Mar 2026 22:06:13 +0100
Message-Id: <20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEXZsWkC/x3MQQqAIBBA0avIrBtQg6iuEi1MpxqCjDFEiO6et
 HyL/x9IJEwJRvWAUObE8awwjQK/u3Mj5FANVttOt8bg4WNGKreQjxKwIx0GZxfteg81uoRWLv9
 wmt/3AxHQ1n1gAAAA
X-Change-ID: 20260311-kcov-extrecord-6e0d9a2b0a8c
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773263202; l=9105;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=Uy/UI29Iq405E8xsVzmdW4SfU10ROPsA+zY2cfEtEVk=;
 b=hlxXEo/ecNo7FckkbUmQK84ac0pbfDNmhk+lxOWxdyub56fn3Q421h+dqWIsCH/RIa30VFBOj
 bmTVaVT9MlKAy4PUkBQ4LTvRnbXbPVDAm2bX2BDEGUNuTuQ6LX1uyCE
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

This series adds a KCOV feature that userspace can use to keep track of
the current call stack. When userspace enables the new mode
KCOV_TRACE_PC_EXT, collected instruction addresses are tagged with one
of three types:

 - function entry
 - non-entry basic block
 - function exit

This requires corresponding LLVM support; an LLVM patch implementing
this feature has been uploaded for review at
<https://github.com/llvm/llvm-project/pull/185972>, but hasn't landed yet.

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
Jann Horn (3):
      sched: Ensure matching stack state for kcov disable/enable on switch
      kcov: wire up compiler instrumentation for CONFIG_KCOV_EXT_RECORDS
      kcov: introduce extended PC coverage collection mode

 include/linux/kcov.h      |  2 ++
 include/linux/sched.h     |  6 ++--
 include/uapi/linux/kcov.h | 12 ++++++++
 kernel/kcov.c             | 76 +++++++++++++++++++++++++++++++++++++++--------
 kernel/sched/core.c       | 13 ++++++--
 lib/Kconfig.debug         | 14 +++++++++
 scripts/Makefile.kcov     |  2 ++
 tools/objtool/check.c     |  2 ++
 8 files changed, 110 insertions(+), 17 deletions(-)
---
base-commit: b29fb8829bff243512bb8c8908fd39406f9fd4c3
change-id: 20260311-kcov-extrecord-6e0d9a2b0a8c

--  
Jann Horn <jannh@google.com>

