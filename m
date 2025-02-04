Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA0015886C
	for <llvm@lists.linux.dev>; Tue,  4 Feb 2025 17:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690483; cv=none; b=rbkydtH1hPrLCRu8qCFfvM53znrVJVFyzgSTkJwUqojRaCn41Pjx7QuZ04z2SHDZ/BNE7i/zkzUouYsQO8JDAYITau0pL8d6Wxa/4MZBvHIUUXvO7IUO5qn39ddJSG3FQIksOf/Mwg6x+NgSi9cuMGZtyez0IjRT0mhe1/07lJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690483; c=relaxed/simple;
	bh=gkSVi874oZamWXqTFhaAOZ4pp4va5gatG6W8+kcuVHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aTXyv8/Mwrto+4YwZHs8CW39icMDHggeuOTpw92qXOawGEHpf6E7D2XxQzzQZe5lil/GVN22BsYU+RErC3aP5pSIGLJjnWWoEfOEGjDFVaxRNPU7cKIG5uTAX2ALhMosZCRsJ3NkORzNBTMmn6FQEYe1W6VkgYEMRSVFt6IkuF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4h+hBsl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4h+hBsl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690481; x=1770226481;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gkSVi874oZamWXqTFhaAOZ4pp4va5gatG6W8+kcuVHA=;
  b=P4h+hBslYI1JjYiF2vzeJmfod001otwUzQOXjlrUGQI5MPtQA65wrg0x
   iZf5ZxSaKy+4u9oJvVPxlOzoEbrT+84O8jyPS5SXKohyInqzzUe5OXKbv
   HqevV5yi0h3xw5z+92KB7aySyOb+lmibdF/K6QdR4Dn2jnA4j6wvYue/N
   WFzapJpz+soBkDFVFmi1LaEZedH1U58bPerZ98riwcAb/BYfGfHWF5y2/
   v6YS4pzGdJWGvneH7gOu1FuMiPO4WBqHppPxMuePEKPaTfrJa9ZE/PZQC
   fKkWUz3ltfdTWDnlES+Y1pjOSOR6d1x/MDKTyL8K3tc+JtFbgverJF61H
   A==;
X-CSE-ConnectionGUID: CRM94ryTRU69bEm6xiHbMQ==
X-CSE-MsgGUID: zd4jXnteRXCHAbQWUGOybg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38930253"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38930253"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:34:37 -0800
X-CSE-ConnectionGUID: prkHYuVRSJ2uR8d8lQLj6Q==
X-CSE-MsgGUID: /nP6Sa9pRLaAvJF1jo5+uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147866051"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:34:25 -0800
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: luto@kernel.org,
	xin@zytor.com,
	kirill.shutemov@linux.intel.com,
	palmer@dabbelt.com,
	tj@kernel.org,
	andreyknvl@gmail.com,
	brgerst@gmail.com,
	ardb@kernel.org,
	dave.hansen@linux.intel.com,
	jgross@suse.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	corbet@lwn.net,
	maciej.wieczor-retman@intel.com,
	dvyukov@google.com,
	richard.weiyang@gmail.com,
	ytcoode@gmail.com,
	tglx@linutronix.de,
	hpa@zytor.com,
	seanjc@google.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	justinstitt@google.com,
	jason.andryuk@amd.com,
	glider@google.com,
	ubizjak@gmail.com,
	jannh@google.com,
	bhe@redhat.com,
	vincenzo.frascino@arm.com,
	rafael.j.wysocki@intel.com,
	ndesaulniers@google.com,
	mingo@redhat.com,
	catalin.marinas@arm.com,
	junichi.nomura@nec.com,
	nathan@kernel.org,
	ryabinin.a.a@gmail.com,
	dennis@kernel.org,
	bp@alien8.de,
	kevinloughlin@google.com,
	morbo@google.com,
	dan.j.williams@intel.com,
	julian.stecklina@cyberus-technology.de,
	peterz@infradead.org,
	cl@linux.com,
	kees@kernel.org
Cc: kasan-dev@googlegroups.com,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for x86
Date: Tue,  4 Feb 2025 18:33:41 +0100
Message-ID: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

======= Introduction
The patchset aims to add a KASAN tag-based mode for the x86 architecture
with the help of the new CPU feature called Linear Address Masking
(LAM). Main improvement introduced by the series is 4x lower memory
usage compared to KASAN's generic mode, the only currently available
mode on x86.

There are two logical parts to this series. The first one attempts to
add a new memory saving mechanism called "dense mode" to the generic
part of the tag-based KASAN code. The second one focuses on implementing
and enabling the tag-based mode for the x86 architecture by using LAM.

======= How KASAN tag-based mode works?
When enabled, memory accesses and allocations are augmented by the
compiler during kernel compilation. Instrumentation functions are added
to each memory allocation and each pointer dereference.

The allocation related functions generate a random tag and save it in
two places: in shadow memory that maps to the allocated memory, and in
the top bits of the pointer that points to the allocated memory. Storing
the tag in the top of the pointer is possible because of Top-Byte Ignore
(TBI) on arm64 architecture and LAM on x86.

The access related functions are performing a comparison between the tag
stored in the pointer and the one stored in shadow memory. If the tags
don't match an out of bounds error must have occurred and so an error
report is generated.

The general idea for the tag-based mode is very well explained in the
series with the original implementation [1].

[1] https://lore.kernel.org/all/cover.1544099024.git.andreyknvl@google.com/

======= What is the new "dense mode"?
To further save memory the dense mode is introduced. The idea is that
normally one shadow byte stores one tag and this one tag covers one
granule of allocated memory which is 16 bytes. In the dense mode, one
tag still covers 16 bytes of allocated memory but is shortened in length
from 8 bits to 4 bits which makes it possible to store two tags in one
shadow memory byte.

=== Example:
The example below shows how the shadow memory looks like after
allocating 48 bytes of memory in both normal tag-based mode and the
dense mode. The contents of shadow memory are overlaid onto address
offsets that they relate to in the allocated kernel memory. Each cell
|        | symbolizes one byte of shadow memory.

= The regular tag based mode:
- Randomly generated 8-bit tag equals 0xAB.
- 0xFE is the tag that symbolizes unallocated memory.

Shadow memory contents:           |  0xAB  |  0xAB  |  0xAB  |  0xFE  |
Shadow memory address offsets:    0        1        2        3        4
Allocated memory address offsets: 0        16       32       48       64

= The dense tag based mode:
- Randomly generated 4-bit tag equals 0xC.
- 0xE is the tag that symbolizes unallocated memory.

Shadow memory contents:           |0xC 0xC |0xC 0xE |0xE 0xE |0xE 0xE |
Shadow memory address offsets:    0        1        2        3        4
Allocated memory address offsets: 0        32       64       96       128

=== Dense mode benefits summary
For a small price of a couple of bit shifts, the dense mode uses only
half the memory compared to the current arm64 tag-based mode, while
still preserving the 16 byte tag granularity which allows catching
smaller offsets of out of bounds errors.

======= Differences summary compared to the arm64 tag-based mode
- Tag width:
	- Tag width influences the chance of a tag mismatch due to two
	  tags from different allocations having the same value. The
	  bigger the possible range of tag values the lower the chance
	  of that happening.
	- Shortening the tag width from 8 bits to 4, while helping with
	  memory usage also increases the chance of not reporting an
	  error. 4 bit tags have a ~7% chance of a tag mismatch.

- TBI and LAM
	- TBI in arm64 allows for storing metadata in the top 8 bits of
	  the virtual address.
	- LAM in x86 allows storing tags in bits [62:57] of the pointer.
	  To maximize memory savings the tag width is reduced to bits
	  [60:57].

======= Testing
Checked all the kunits for both software tags and generic KASAN after
making changes.

In generic mode the results were:

kasan: pass:59 fail:0 skip:13 total:72
Totals: pass:59 fail:0 skip:13 total:72
ok 1 kasan

and for software tags:

kasan: pass:63 fail:0 skip:9 total:72
Totals: pass:63 fail:0 skip:9 total:72
ok 1 kasan

======= Benchmarks
All tests were ran on a Sierra Forest server platform with 512GB of
memory. The only differences between the tests were kernel options:
	- CONFIG_KASAN
	- CONFIG_KASAN_GENERIC
	- CONFIG_KASAN_SW_TAGS
	- CONFIG_KASAN_INLINE [1]
	- CONFIG_KASAN_OUTLINE [1]

Used memory in GBs after boot [2][3]:
* 14 for clean kernel
* 91 / 90 for generic KASAN (inline/outline)
* 31 for tag-based KASAN

Boot time (until login prompt):
* 03:48 for clean kernel
* 08:02 / 09:45 for generic KASAN (inline/outline)
* 08:50 for dense tag-based KASAN
* 04:50 for dense tag-based KASAN with stacktrace disabled [4]

Compilation time comparison (10 cores):
* 7:27 for clean kernel
* 8:21/7:44 for generic KASAN (inline/outline)
* 7:41 for tag-based KASAN

Network performance [5]:
* 13.7 Gbits/sec for clean kernel
* 2.25 Gbits/sec for generic KASAN inline
* 1.50 Gbits/sec for generic KASAN outline
* 1.55 Gbits/sec for dense tag-based KASAN
* 2.86 Gbits/sec for dense tag-based KASAN with stacktrace disabled

[1] Based on hwasan and asan compiler parameters used in
scripts/Makefile.kasan it looks like inline/outline modes have a bigger
impact on generic mode than the tag-based mode. In the former inlining
actually increases the kernel image size and improves performance. In
the latter it un-inlines some code portions for debugging purposes when
the outline mode is chosen but no real difference is visible in
performance and kernel image size.

[2] Used "cat /proc/meminfo | grep MemAvailable" and then subtracted
that from the total memory of the system. Initially wanted to use "grep
Slab" similarly to the cover letter for arm64 tag-based series but
because the tests were ran on a system with 512GB of RAM and memory
usage was more split up between different categories this better shows
the memory savings.

[3] If the 14 GBs from the clean build were subtracted from the KASAN
measurements one can see that the tag-based mode uses about 4x less of
the additional memory compared to the generic mode.

[4] Memory allocation and freeing performance suffers heavily from saving
stacktraces that can be later displayed in error reports.

[5] Measured as `iperf -s & iperf -c 127.0.0.1 -t 30`.

======= Compilation
Clang was used to compile the series (make LLVM=1) since gcc doesn't
seem to have support for KASAN tag-based compiler instrumentation on
x86.

======= Dependencies
Series is based on risc-v series [1] that's currently in review. Because
of this for the time being it only applies cleanly on top of 6.12
mainline kernel. Will rebase on the newest kernel once the risc-v series
is also rebased.

[1] https://lore.kernel.org/all/20241022015913.3524425-1-samuel.holland@sifive.com/

Maciej Wieczor-Retman (15):
  kasan: Allocation enhancement for dense tag-based mode
  kasan: Tag checking with dense tag-based mode
  kasan: Vmalloc dense tag-based mode support
  kasan: arm64: x86: risc-v: Make special tags arch specific
  x86: Add arch specific kasan functions
  x86: Reset tag for virtual to physical address conversions
  mm: Pcpu chunk address tag reset
  x86: Physical address comparisons in fill_p*d/pte
  x86: Physical address comparison in current_mm pgd check
  x86: KASAN raw shadow memory PTE init
  x86: LAM initialization
  x86: Minimal SLAB alignment
  x86: runtime_const used for KASAN_SHADOW_END
  x86: Make software tag-based kasan available
  kasan: Add mititgation and debug modes

 Documentation/arch/x86/x86_64/mm.rst |  6 +-
 MAINTAINERS                          |  2 +-
 arch/arm64/include/asm/kasan-tags.h  |  9 +++
 arch/riscv/include/asm/kasan-tags.h  | 12 ++++
 arch/riscv/include/asm/kasan.h       |  4 --
 arch/x86/Kconfig                     | 11 +++-
 arch/x86/boot/compressed/misc.h      |  2 +
 arch/x86/include/asm/kasan-tags.h    |  9 +++
 arch/x86/include/asm/kasan.h         | 50 +++++++++++++--
 arch/x86/include/asm/page.h          | 17 +++--
 arch/x86/include/asm/page_64.h       |  2 +-
 arch/x86/kernel/head_64.S            |  3 +
 arch/x86/kernel/setup.c              |  2 +
 arch/x86/kernel/vmlinux.lds.S        |  1 +
 arch/x86/mm/init.c                   |  3 +
 arch/x86/mm/init_64.c                |  8 +--
 arch/x86/mm/kasan_init_64.c          | 24 +++++--
 arch/x86/mm/physaddr.c               |  1 +
 arch/x86/mm/tlb.c                    |  2 +-
 include/linux/kasan-tags.h           | 12 +++-
 include/linux/kasan.h                | 94 +++++++++++++++++++++++-----
 include/linux/mm.h                   |  6 +-
 include/linux/page-flags-layout.h    |  7 +--
 lib/Kconfig.kasan                    | 49 +++++++++++++++
 mm/kasan/Makefile                    |  3 +
 mm/kasan/dense.c                     | 83 ++++++++++++++++++++++++
 mm/kasan/kasan.h                     | 27 +-------
 mm/kasan/report.c                    |  6 +-
 mm/kasan/report_sw_tags.c            | 12 ++--
 mm/kasan/shadow.c                    | 47 ++++++++++----
 mm/kasan/sw_tags.c                   |  8 +++
 mm/kasan/tags.c                      |  5 ++
 mm/percpu-vm.c                       |  2 +-
 33 files changed, 432 insertions(+), 97 deletions(-)
 create mode 100644 arch/arm64/include/asm/kasan-tags.h
 create mode 100644 arch/riscv/include/asm/kasan-tags.h
 create mode 100644 arch/x86/include/asm/kasan-tags.h
 create mode 100644 mm/kasan/dense.c

-- 
2.47.1

