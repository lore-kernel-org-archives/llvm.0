Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A349758F066
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 16:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886503; cv=none; b=XqQZAozbyYPI6tUkBUjzzvzNgVrFJwxLW5MJlenna4f0FN4tW5r+/h8WI52IoVmpBkEg2hVZEGq+75/nC84RZuDhkdLs699cZXotMSaJsXLYBOkpLHF9ZKBVY7juBnOMpSXI8ZLyrj8Otp/8MxIEGuAFpDh7/h6O+S+t2HSz8+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886503; c=relaxed/simple;
	bh=FdGYYZBpQ7PuEaN6jp8LzZTWVRnNLNFC19AbILWp6ZQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AEEdUgoe909FskCuhyKmQdhj+1fUS9UtgLVhUDPRoUu03JM9Ih7mVDn6isLBhWlfqLL2lckZv9WvGLzMpBFEv+fBljvbMM6NuMwj7YdoqiCpHr8KMChpcjR8wmUhOGgqEaMFpib2cm3Ixz/3MPuUO9c3b+TzdvoiBOT4bLOs/mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QNv0QTfy; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QNv0QTfy"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b5e50eb70so101905e9.1
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 09:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886500; x=1789491300; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JhNhb6Q9Jz5uQGLykYthIjgwY7eYJQu4K+yL5PdofVg=;
        b=QNv0QTfym9tVgKz9Pok1btlyhgaQJDIAWWQIY7+QE7pUHKZMetLhGCu3naxDueXKjq
         nYY95nyWPU8M9HrWvmicmq8CrPHmglR6e4eIMO84kWQe4mUj/DhE9RlA26c0zGfwDF6t
         cq2J5bo26MIgdTv3+yW6su+A0Nnn8dtp1MWvbILFhOEgjvbURH88VqUKCrKsKemYqQSN
         UOZYhBrKumgmdT9dn1j1wycmPaiuMaAQjiBRzdAwnAT8XV02qZBFiA3TVx9+VcQEI4kw
         7q41Y5HCog84U9Im9egLBidylj07TR9VAZSPYfoVSng3sWOmUTP2qbXh0VHibugqSlc7
         RC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886500; x=1789491300;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JhNhb6Q9Jz5uQGLykYthIjgwY7eYJQu4K+yL5PdofVg=;
        b=VbM6pkTau7KydS6BIgorg5Um3F0AGUfURJ7OJVBHaNdVREIS8gIl+4HF2O4FdsZgx8
         ORWXIqnzpefgz6zMOUOncaSW6DuP0F3ARsmUuVysglfyBWJBJmKO8xoovWi1x3eFT44O
         YMqLo+/54lCy477git9DCBWzEOFPEx7rPMephgpKhTGhqVw/7Me371dcTTpg0P6RbldF
         7xptT6Kkd6HRZ9FioUnd+/BvM7v2bpQJOrDpfv7yTf9QDXChRFmP5nZCdJT/qrZfOybA
         e2tGgmeN+utcABYjp1Un/jdGL39mNWH9fatHX7oQJNBPBnnfqTwgLdI/6rFyVm40Qo6W
         fcWw==
X-Forwarded-Encrypted: i=1; AKwUvBya1OpisPWLZ7E0v4Oh6rYYLjYIqJiexl5eRW/V1VDv18uxXiyO+KacD4KJDz9bsXC6YHWS@lists.linux.dev
X-Gm-Message-State: AFuF++mmH2Zb2fdkpvf3iwEx2ehvBBtqsOvthmuVZb7/gR9Nrp7H54cT
	qmIGy9AOZ1lc+dPW22G+HsF+DJIqN7cJNh6sCjxDTpzJOzkNbS/js0YUt8y/JA8GJg==
X-Gm-Gg: AYBFou1YrPCh0tbW0aHSTErd+0hCG/IGCL/DDMtckyK48KEQ8AMm2mKrVoCyUnSFDPa
	MicYaI4uvK+DKOOn5DC/8q6SbBsoUuVcHwgKlECL2Pxrjgf/Rew6JrwwLNCXAEVaQjZ3lkhyCqH
	YM7QCpj5VZ6ywwjGKGmxnYd0fTb6hDzExIHPBFiXDABGTzpheetRY+5U2U4alkfOLvtJpdkx665
	f7+rFLgiFQzvIVazaohu3xRAAtG09CxgzCpVEIi001m5zqX4UzsiBbomsO4sikLc9CJc3aMiDCW
	FnWiw7L1Tjnyf+czo5pEpxvOKT9HprHQCpP7F0XWzLCTaqW0ii/SzhVqHH/dNA0eUpjIRzKlgkI
	23fbTlJXL7iXJbxSfjDkWeTSwkzt8DJ9aimVMhJXf7nSAj2OpoZWK9BqeyfFHIuMuq/KaGOtMEs
	82J02Yl6Ix0t/Ez2O6GxXVxPfOuc/ADiaGxEgjhJAOdwixNSue3foUVrU+4njN02Tz6UAT/OL+E
	KDsJuM/bBwvaJN0C/vNYAKETj2gGsX2g5RKGFrHL9nRHp92M1ooJicD3cQ=
X-Received: by 2002:a05:600c:6c4e:b0:49d:3:4a29 with SMTP id 5b1f17b1804b1-49d1f6e324cmr36875e9.7.1788886499257;
        Tue, 08 Sep 2026 09:54:59 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:ac21:220d:3908:7e61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b1320sm36407824f8f.27.2026.09.08.09.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:54:58 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Subject: [PATCH RFC v3 00/12] KCOV: entry/exit records, memory access
 records, and delay injection
Date: Tue, 08 Sep 2026 18:54:40 +0200
Message-Id: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANA9oGoC/3WNQQrCMBREr1L+2kj6Y0N1JQgewK24iMlPG9RGk
 hIqpXc3ZKWIy5nhvZkhUnAUYVfNECi56PyQg1hVoHs1dMScyRmQo+SirtlN+8RoGgNpHwyTxM1
 W4ZWrVkOGnoGsm4rwDKfjAS657F0cfXiVk1SX6Z8v1Ywz2Vou9EbxRpl95313p7X2j+JK+Mm3P
 zxmHhtEo6TVRtgvflmWN3JaQqzyAAAA
X-Change-ID: 20260311-kcov-extrecord-6e0d9a2b0a8c
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788886494; l=13917;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=FdGYYZBpQ7PuEaN6jp8LzZTWVRnNLNFC19AbILWp6ZQ=;
 b=u1m9TLG8IpVlGUfOL95gslLjK/etQ8y9wdWnqicNz5zx3IWO6B4+4/vGovxq7CkX5yY2mUrf9
 FpCXSs2NAYrBi9nVaHDivxC8H5Ukmmt7OtAwkgX6cWk0CrucG7GiT++
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

This series consists of three parts that add new KCOV features.
In short:

 - Part 1: Adds function entry/exit records
 - Part 2: Adds information about memory accesses (instruction address,
   data address, access type, data value, timing)
 - Part 3: Adds an API for delay injection (spin-waiting at a specific
   point on one thread until a specific event happens on another
   thread)

Together, these make it possible to build:

 - tooling to force specific ordering of parallel execution (entry/exit
   records provide stable identifiers for recorded memory access events
   that can then be targeted for delay injection)
 - tooling to force a specific ordering on a subset of events ("A should
   happen before B"), where other parts of the testcase are left
   executing in parallel
 - visualization of recorded execution traces of small samples for
   manual review (though the large amount of data makes recording the
   execution of larger programs prohibitively expensive); this is the
   only usecase I have for recording data values, and the main usecase
   for recording timing information

At a higher level, I think this could be useful for the following use
cases:

 - manual testing of possible bugs (especially race condition bugs)
 - unit tests for race conditions
 - fuzzing for race conditions
 - maybe also for other fuzzing (automatically discovering how syscalls
   interact)
 - maybe also for providing more clues for analyzing normal fuzzer
   crashes

=== Part 1: function entry/exit records ===
This series adds a KCOV feature that userspace can use to keep track of
the current call stack. When userspace enables the new mode
KCOV_TRACE_PC_EXT, collected instruction addresses are tagged with one
of three types:

 - function entry
 - non-entry basic block
 - function exit

This requires corresponding LLVM support, which was added in LLVM commit
https://github.com/llvm/llvm-project/commit/dc5c6d008f487eea8f5d646011f9b3dca6caebd7
a few months ago; I believe this will be part of LLVM 23.

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

=== part 2: memory access records (CONFIG_KCOV_MEMORY) ===
A new mode KCOV mode KCOV_TRACE_MEMORY_ACCESS generates the same
records as KCOV_TRACE_PC_EXT, but additionally generates records of
type "struct memory_access_record" when a memory access happens.
Information about memory accesses is obtained in two ways:

 - from instrument_*() hooks
 - from KASAN hooks in generic outline mode

The memory_access_record records in multiple traces can be analyzed
together to discover which memory regions could be relevant for
concurrency bugs.

=== part 3: delay injection ===
A new set of KCOV ioctls can be used to inject spin-waits at specific
points in the execution, identified by call stacks obtained from
KCOV_TRACE_MEMORY_ACCESS.

The main ioctl for configuring this feature for a KCOV instance is
KCOV_SET_DI, which essentially takes a list of call stacks, each
associated with an action, which is one of:

 - wait on bit N in a kcov state bitmap before this access
 - wake up bit N in a kcov state bitmap before this access
 - wake up bit N in a kcov state bitmap after this access

=== userspace users ===
I have written two userspace programs that use this API:
A GUI which lets you interactively experiment with execution orderings
of parallel execution, and a testing harness that can exercise ~all
A-B-A orderings of a given testcase automatically.

See:
https://github.com/googleprojectzero/MAccConc

Signed-off-by: Jann Horn <jannh@google.com>
---
Changes in v3:
- in part 1: remove sched hack and replace it with
  "kcov: summarize entry/exit while disabled" (suggested by peterz)
- add memory access records and delay injection
- Link to v2: https://lore.kernel.org/r/20260318-kcov-extrecord-v2-0-2522da6fcd3f@google.com

Changes in v2:
- patch 2: change commit message (dvyukov)
- patch 2: add __always_inline (dvyukov)
- patch 2: add comment in __sanitizer_cov_trace_pc_entry
- replaced patch 3 with patches 3+4
  - store extended record format flag as part of kcov_mode (dvyukov)
  - clarify comment in __sanitizer_cov_trace_pc_exit (dvyukov)
- Link to v1: https://lore.kernel.org/r/20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com

---
Jann Horn (12):
      kcov: wire up compiler instrumentation for CONFIG_KCOV_EXT_RECORDS
      kcov: refactor mode check out of check_kcov_mode()
      kcov: introduce extended PC coverage collection mode
      kcov: summarize entry/exit while disabled
      kasan: refactor write/is_write arguments to flags
      kcov: introduce memory access tracing
      kasan: provide memory access information to KCOV
      kcov: log freeing of SLUB objects and pages
      kcov: record return address on function entry
      kcov: log old value
      kcov: introduce delay injection
      Documentation/kcov: add documentation for EXT_RECORDS and KCOV_MEMORY

 Documentation/dev-tools/kcov.rst |  70 +++++
 arch/arm64/kernel/traps.c        |   2 +-
 arch/arm64/mm/fault.c            |   2 +-
 include/linux/instrumented.h     |  30 ++
 include/linux/kasan.h            |   7 +-
 include/linux/kcov.h             |  31 +-
 include/uapi/linux/kcov.h        |  86 ++++++
 kernel/kcov.c                    | 618 +++++++++++++++++++++++++++++++++++++--
 lib/Kconfig.debug                |  27 ++
 lib/Kconfig.kasan                |   9 +
 mm/kasan/common.c                |   4 +-
 mm/kasan/generic.c               |  35 ++-
 mm/kasan/kasan.h                 |   6 +-
 mm/kasan/report.c                |   3 +-
 mm/kasan/report_generic.c        |   8 +-
 mm/kasan/shadow.c                |  25 +-
 mm/kasan/sw_tags.c               |  20 +-
 mm/page_alloc.c                  |   3 +
 scripts/Makefile.kasan           |  17 ++
 scripts/Makefile.kcov            |   2 +
 tools/objtool/check.c            |   4 +
 21 files changed, 931 insertions(+), 78 deletions(-)
---
base-commit: 73ae59e975966d24e32926247ddb45a537ebe184
change-id: 20260311-kcov-extrecord-6e0d9a2b0a8c

Best regards,
--  
Jann Horn <jannh@google.com>

