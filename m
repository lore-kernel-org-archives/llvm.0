Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116015;
	b=Wk2xml1UnTopMbIUD5QO5HofNBWvL1aD2FlWvCigOiHs50/+lT3BY5rE78IWKmwAApz6
	 jV62/m/uDSnmafwslEImC2lURSKAmrsY23ReCzbCha1YPbGeHiw4UVp3cT1zdH6mgk//+
	 U6aeWwDhYMdkDvIR3bFwUibkfKvj/JIZJmIqMJI6Pc9uKk7c3qLUDvXjtY93o29Wecrmy
	 47q1EmXHByvoj25iXJA4/lLFfhBLi3FyaRZ4ypL79vDuiLmJWfT8MUvcPZgP2LzVH5JoL
	 dwLDkLm3jstWeQ1HIRTf+aRqF7GI9deg8qmyvS9auIY+XLaOaz96JpOjObrAWoti6TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YJI/IvC1da7kmYqInNWG1mwawohNUcOpQb+NW22ILQk=;
	b=WVcDNgV8LkB57tzwW4JRtdYzRKBwgePkJtyybThXeYrlbqwwsTD1uqUCwC+YrZ316xom
	 u4SRU8sFGBTbLfA8hwJPXgynSub1a5aVr6V3CHT8NSX6BViZWz0nxm3TkoIYiD+PCX555
	 K0VRL3AaXuhYc9NkWLplWNl+8oHb2qOcKiSP765Fq8UrdiJpoOG5K9Cdi0Ywj7w4qit5A
	 VxuPxeBdQBf/a9sSenx09lyI2zKBsISstwmyDeSQOfS7Kh8zg0ZdPH1sohtgqiUB+cPhb
	 DZXB0ijIjK93ZbZs75qZ7dzkvTAtZP4ooghUqeVzHaqZLfkn+rGGtpbLi4JhrWZTvLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ry/qupWa";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370AE60A2637
	for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 15:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 370AE60A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ry/qupWa
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso45027365e9.1
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 08:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793116012; x=1793720812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJI/IvC1da7kmYqInNWG1mwawohNUcOpQb+NW22ILQk=;
        b=ry/qupWaih3mbHx6DKeK8bwj61vBo5z7jR0vM5ehLSt0EpGQ1fup+hMdyPVCLyesNM
         vOgiItdEmjYLt0/ewEtQv33ioOCOq02wE2c3KO2NwPfo2eeoUTfRvqHulnE+jH6Xhln1
         oQv6eoYOKsewJLd/M50btb3bGs3Qe6fDYI1jFeGPd7UPDW/A1XCIbZhokZlIWb+puOpQ
         kuCQo/+qUP5jrKGzARdvHFGVM9xslNx8/RxzTlpKCCMfclMm3Asr9KAWPjTBUMqa/Q50
         8YNzpD94e3aPrUIwQQXYmQR1gp+6OFKhT5F9QmK4vepDpiDHM4BGqCWEys7aE3h63XXL
         pAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116012; x=1793720812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YJI/IvC1da7kmYqInNWG1mwawohNUcOpQb+NW22ILQk=;
        b=vNrQ/e8flOE8L+zHT2RnHakeO8OarXhBTkBuwqjTOPjZEszTH5s5R8hcw/dbu3P+hd
         ZcETTk3EjktqG+8ZuMJPtZWX+8FhPbcVuoAPiY5+lDMBP8DskY1CLjnmD9CVrydI6fo6
         o+uaaEpV3JyTAzESpbpZPdGPepEMuVTmCcjV64dJRO/mgz/MYE1+f3jHANdLKcTl8Ud+
         JMGeBAjH9CTESKjnjpTG+dVYeNpm+2S0YxRMqlG7MdSrRvlGaq7lfQz2eHMEWJ97YIq/
         v9iMZ8HNKz/zPukjg2th6r6DsujVlX04G+lA7Kq/F/1k0KouTmB0+4b3hrhwkxwCtCos
         Tmjg==
X-Forwarded-Encrypted: i=1; AKwUvBzCv64M6+ss/xs1Se0n5XonEuCjfkeGG0zwGqVNE/ZAclc7jdup+krZVqKdXglgYz6icApQ@lists.linux.dev
X-Gm-Message-State: AFq9FYLCkHyX+PWw0IM08rAaaASeO6UopOPA6R+ep0xAp6OaLjtWNDly
	8K2A4xCX5DGKrRmV3hd0oXvoDOeCLESBGZtB1qVjYGHjO3m4D+Bh1v/u
X-Gm-Gg: AYBFou2P42dhvTQG4s2jH+qeY/VzirqsXqWMjkRIVd6TBn76U0CK07p9bsWyBxCkFfj
	rip3FHk3EcOdEXjkboszmnSVH3W5aDAUYf4pJy0scZFDfmgDWoGbaOeS8q+71n9vG4f6nLnIZiL
	1oL48+bChZP02QkG81AsU2cXkzNdgyQDjYtYVJz5dTC3g0SP9ySsll2+u78QL7yXNvyvHnAaEyI
	2PvVkFoSr0dWBnkQIlIErBDsKY1FZDuwHwlp914mVhKPsX5yJhm9rjkGg0SK77k0DhYSbSFZ9zk
	EWkl/B1BSXuPP4RCNc8tSK7t5CtZ0BN2Al4ar2A3eiBm10j4QxmBhLOi/CsneG+YCzgVM+772C8
	Ess1KN+wJN1ffhQ6OTzIxxRODEHDSxTclDCIFp0PBXCgRS9Wmr/uDLRgrx5J/tiJGkELWOO6Nb1
	8bu0SVAFQHAk9eJjfbSJPxC5G1NeaCW4UP/muGEiDiKO/hKQTK3tgsQl7ldeYQiBjtnMpcLIAtz
	VO/VCbXyt4I3fj5YSUAhdiGcbfX9s3jZPdk2vOm6ltnR+YBr0FZZ1ejfQokQfDio7KoJPgvjab1
	Jk05yPC7TA/4Q6F9+80zPJl2Is5W3QcTER1FAv/pAh/xuGT13t0XcIezeB+kzm8GVkpEStiS1Jc
	+5SuPVREJXMo470r3
X-Received: by 2002:a05:600c:4f89:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4a35ac9d018mr202236635e9.15.1793116012270;
        Tue, 27 Oct 2026 08:46:52 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm23845574f8f.21.2026.10.27.08.46.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:46:51 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Ackerley Tng <ackerleytng@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Alexander Graf <graf@amazon.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexey Kardashevskiy <aik@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Connor Williamson <connordw@amazon.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	David Hildenbrand <david@kernel.org>,
	David Rientjes <rientjes@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Erdem Aktas <erdemaktas@google.com>,
	Frank van der Linden <fvdl@google.com>,
	Gregory Price <gourry@gourry.net>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Hugh Dickins <hughd@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	James Houghton <jthoughton@google.com>,
	Jan Kara <jack@suse.cz>,
	Jianxiong Gao <jxgao@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Joey Gouly <joey.gouly@arm.com>,
	John Starks <John.Starks@microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Michael Roth <michael.roth@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Oliver Upton <oupton@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Tycho Andersen <tycho@kernel.org>,
	Vishal Annapurve <vannapurve@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	x86@kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	iommu@lists.linux.dev
Subject: [RFC PATCH 00/14] guest_memfd: Export guest_memfd files to iommufd
Date: Tue, 27 Oct 2026 15:46:35 +0000
Message-ID: <20261027154649.91571-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fred Griffoul <fgriffo@amazon.co.uk>

This series follows Ackerley's RFC v2, "guest_memfd alternative
providers" [1], and applies on top of it (kvm/next 7e60162b16f9 plus
his 50 patches). It answers one question his RFC leaves open: how the
IOMMU mappings of a device assigned to the guest follow guest_memfd.

A device cannot fault, and iommufd cannot pin guest_memfd pages: a
conversion to private, a punch hole, memory failure or a provider's
revoke must take a page away from the device too, and in PFN mode
there is no page to pin. So guest_memfd has to drive the device
mapping. This series proposes an interface for that, uses it in
iommufd as a demonstration, and adds the two PFN mode pieces it relies
on.

The interface
=============

A subsystem that maps guest_memfd pages, such as iommufd, uses three
functions and one callback, all in include/linux/guest_memfd.h:

  kvm_gmem_export_attach()      start following a guest_memfd file
  kvm_gmem_export_lookup_pfn()  which frame backs this page? A frame for
                                a shared page with memory, nothing for a
                                private page or a page without memory
  kvm_gmem_export_detach()      stop following it
  update(start, nr_pages)       the subsystem's callback: the answer for
                                this range may have changed, look it up
                                again and fix the mappings

No reference is taken on the frames. Instead, guest_memfd calls
update() on every change: conversions, punch holes, memory failure,
pages getting memory, and a PFN mode provider taking frames back or
giving them. The subsystem can rely on this:

  - the old frames stay valid until update() returns, so a device that
    never faults can switch each mapping in one step, to the new frame
    or to a scratch page; after it returns, the old frames are no
    longer used;
  - update() cannot fail (see the open questions);
  - update() may be called for pages that did not change;
  - it runs under guest_memfd's invalidate lock.

For the update to come before a frame is freed, a punch hole keeps the
frames until then: folios are held until update() returns, and in PFN
mode the range reads as holes until the update has run, before the
provider gets its frames back.

A PFN mode provider takes frames back with kvm_gmem_revoke(), from
Ackerley's RFC. When it gives frames to pages that had none, or makes a
read-only frame writable, it calls the new kvm_gmem_restore(), the
"counterpart to kvm_gmem_revoke()" that his sample leaves for users that
cannot fault (48/50). Nothing is taken away then, so restore only calls
update(); KVM and the VMM fault the pages in themselves.

Why not dma-buf: our RFC that backed guest_memfd with an imported
dma-buf [3] needed a dma-buf call for importers to build their own page
tables, and ranged invalidation, and Christian rejected both: importers
filling page tables is a no-go for dma-buf. A dma-buf also knows
nothing of shared and private pages, and folio mode guest_memfd needs
the same tracking as PFN mode. So the interface lives in guest_memfd.

iommufd, as a demonstration
===========================

IOMMU_IOAS_MAP_FILE accepts a guest_memfd. Its pages are not pinned:
each update() unmaps the range and maps what a lookup returns now, with
PAGE_SIZE IOPTEs, so a device that touches the range during an update
faults. Dirty tracking, the no-IOMMU mode and kernel access are
refused. This tests the interface and is not meant to be merged: real
support needs large IOPTEs cut and merged in place, IOPTEs replaced in
one step, and a scratch page for holes, all generic_pt work (Jason, on
our v2), and will be a separate iommufd series.

PFN mode pieces
===============

Two PFN mode changes come first, both raised in replies to Ackerley's
series:

  - get_pfn()'s order now means the naturally aligned block around the
    index, and KVM clamps it to a block it can map, aligned and of one
    attribute; today it can map a block over the wrong frames, or over
    shared and private pages. Invalidations of a PFN mode file cover
    the 1G-aligned blocks around their range, so that a fault that
    sized a block before the change retries.
  - get_pfn() gains an attributes output, with read only as its first
    bit, which the guest's, the VMM's and the IOMMU's mappings follow.

Open questions
==============

  - Private pages. The export gives shared pages only. That suits
    devices that are not trusted, and TDX, where a shared IOPTE on a
    private page is fatal. A trusted device (TDISP) needs private pages
    too: on AMD the IOMMU maps them, with IOPTE sizes that follow the
    RMP. The choice depends on the architecture and the device, so
    userspace would make it through iommufd, which would pass an attach
    flag asking lookups for private frames too, refused where the
    architecture cannot take it. Is an attach flag the right place for
    it?
  - update() cannot fail, but a consumer may need memory to apply one:
    iommufd allocates page tables to map a range again, and will need
    one to cut a large IOPTE. The demonstration only warns when that
    fails. Either the consumer reserves page tables when a range is
    mapped, or guest_memfd adds a prepare step before a conversion,
    which could fail and abort it. A provider's revoke cannot be
    aborted, so it would need the reservation either way. Which would
    you prefer?

Patches
=======

  1-2   PFN mode: clamp the order KVM maps, read-only frames.
  3-7   the export interface: folio mode, truncation, PFN mode, hole
        sizes, and updates when pages get memory.
  8-10  iommufd: track revocable domains, map guest_memfd files, and
        mock-domain IOVA queries for the test.
  11    kvm_gmem_restore().
  12-13 the sample provider: read-only pages, large blocks, and backing
        pages on demand and freeing them on a punch hole.
  14    gmem_conversion_iommufd_test.

Patch 2 also puts back the return after a failed kvm_gmem_get_pfn() in
arm64's gmem_abort(), which a kvm/next merge dropped; the fix alone
will be sent separately.

Testing
=======

On x86_64 in QEMU, with KASAN and lockdep:

  - gmem_conversion_iommufd_test maps the guest_memfd of a
    KVM_X86_SW_PROTECTED_VM into an iommufd mock domain, backed by
    folios, a tmpfs resource or the sample provider in PFN mode, and
    checks that the guest, the VMM and the device all see each change:
    conversions, allocations, punch holes, memory failure, and the
    provider's revokes and restores;
  - Ackerley's tests pass as on his RFC alone;
  - the iommufd selftests pass, except 12 dmabuf and
    access_domain_destory tests that also fail on his RFC alone here;
  - each patch builds with KVM and iommufd built in, with KVM as a
    module, with both as modules, and with SEV.

arm64 is neither built nor run.

History
=======

Our v2 [2] added an interface in mm for drivers that lend memory, with
guest_memfd and iommufd as two consumers of a provider file. Ackerley's
RFC now gives guest_memfd PFN mode providers itself and takes v2's
sample provider, so this series drops the mm interface: iommufd maps
the guest_memfd, not the provider file, and follows conversions.

[1] https://lore.kernel.org/all/20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com/
[2] https://lore.kernel.org/all/20261014093733.90312-1-griffoul@gmail.com/
[3] https://lore.kernel.org/all/20261005095329.49764-1-griffoul@gmail.com/

prerequisite-message-id: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>

Fred Griffoul (14):
  KVM: guest_memfd: Clamp the order of PFN mode blocks to what KVM can
    map
  KVM: guest_memfd: Support read-only frames from PFN mode providers
  KVM: guest_memfd: Allow other subsystems to map guest_memfd files
  KVM: guest_memfd: Keep truncated folios until the exports are updated
  KVM: guest_memfd: Export PFN mode files
  KVM: guest_memfd: Report the size of holes in export lookups
  KVM: guest_memfd: Update exports when pages are allocated
  iommufd: Track the domains of revocable pages in struct iopt_pages
  iommufd: Map guest_memfd files
  iommufd/selftest: Add mock-domain IOVA queries
  KVM: guest_memfd: Add kvm_gmem_restore() for PFN mode providers
  samples/kvm: Add read-only pages and large blocks to the sample
    provider
  samples/kvm: Back absent pages on demand in the sample provider
  KVM: selftests: Test guest_memfd mapped by iommufd

 arch/arm64/kvm/mmu.c                          |  10 +-
 arch/arm64/kvm/nested.c                       |   9 +-
 arch/x86/kvm/Makefile                         |   4 +-
 arch/x86/kvm/mmu/mmu.c                        |  15 +-
 arch/x86/kvm/svm/sev.c                        |   4 +-
 drivers/iommu/iommufd/io_pagetable.c          |  38 +-
 drivers/iommu/iommufd/io_pagetable.h          |  61 +-
 drivers/iommu/iommufd/iommufd_test.h          |  18 +
 drivers/iommu/iommufd/pages.c                 | 366 ++++++-
 drivers/iommu/iommufd/selftest.c              | 125 +++
 include/linux/guest_memfd.h                   |  93 +-
 include/linux/kvm_host.h                      |   6 +-
 include/uapi/linux/iommufd.h                  |  11 +-
 samples/kvm/mem_provider_sample.c             | 118 ++-
 samples/kvm/mem_provider_sample.h             |  18 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/x86/gmem_conversion_iommufd_test.c    | 956 ++++++++++++++++++
 virt/kvm/guest_memfd.c                        | 601 ++++++++++-
 18 files changed, 2329 insertions(+), 125 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/x86/gmem_conversion_iommufd_test.c


base-commit: 7e60162b16f9da0d2fa83da5c1723b6853a0ac1d
prerequisite-patch-id: d0932c65d2a453e84f7917da27f9f6ae1da95856
prerequisite-patch-id: 7be8f39fdcfe7e504a9ac85e835a5dfb2ee414ba
prerequisite-patch-id: c6d0df8d4fdd910000ed9e35f514db6ac32e6e11
prerequisite-patch-id: 45cd3951b114a26eac94390727287c1221862b5c
prerequisite-patch-id: 6d978b6f0561697e5b145e4b82d79ac8c89f9f31
prerequisite-patch-id: 9bd6979aa47dd00c87a3aa8feb1798486107ac4b
prerequisite-patch-id: 98438bd35d53340738a20fd8724b038c9de1207e
prerequisite-patch-id: 146dfaa64e29a4930adb60e9524c7613f888a241
prerequisite-patch-id: 170e27bc053fede8d24accca69809d3687faf668
prerequisite-patch-id: 789fe5bfb1183f6b9a9b0d817e5d1050a7999e1a
prerequisite-patch-id: 5dd6878d0476a9dd925aa8d7ef1cf18900cbcd82
prerequisite-patch-id: 1f0d1dca2a51df2283f1d83ed57dd9ce4e11b025
prerequisite-patch-id: 503eb8fb0bf9af163f344c2693d374b6a3093fd1
prerequisite-patch-id: 94e4777a58b357458bdce680bbb41c04c0c661f4
prerequisite-patch-id: 4c1f6b548994d239e5093ee1d268ef5a12a76873
prerequisite-patch-id: f6d13ac583d54fe1ae22adde87f5c68d8e8e41ce
prerequisite-patch-id: 7846b44d34507a9af6ac8a3fb263ee446ea56a1d
prerequisite-patch-id: 2d309198e27a3922b5cf5805ac5660ea92029219
prerequisite-patch-id: e1f75965298956ad87bb78969461eff31419b6eb
prerequisite-patch-id: 40ef669df2a64e5b28127059e4cea288d426f6f6
prerequisite-patch-id: d8adb8f100cb13423db02e7e7a834fa241ff04fe
prerequisite-patch-id: 75591ca138e7de26db6cd3e242a7f0ce56c4752c
prerequisite-patch-id: b1e2c46b473783f37490c29140498a0bb35ec7d3
prerequisite-patch-id: bc8b607986a132eef4daa5e20979d3f038d046ba
prerequisite-patch-id: c9de5cd8a95f8102597b49dcf70b8ec5825b9ec7
prerequisite-patch-id: 954606132449080c4e173eb06d114504f87d0322
prerequisite-patch-id: 82a44a46cf9d4cc3fcdc03c362fc4e86d1fc533a
prerequisite-patch-id: 23dbc9968c0b2570f40cd6c3b13337078334aa8d
prerequisite-patch-id: 6c6a5ca6d0a1b60158a47ed21f25889dd71dd9b7
prerequisite-patch-id: e4d1ba4119277d7772dbf6e81f748beab4e62856
prerequisite-patch-id: a32d69bdd1fb21b85547fdc026475e2d94ffbc28
prerequisite-patch-id: 2704fe13a294e1f33cfbee6cd27c11ee392a8b78
prerequisite-patch-id: ebb701b7e050327e798c172d897021806f7e6c35
prerequisite-patch-id: 03db7e48c976a019ce478883002670c4b1a33cd9
prerequisite-patch-id: a18608129e63bbbc6e89a4ca237863ba4c506a63
prerequisite-patch-id: a35607a73bd0329fd91a39bd7b9c855edb4b8798
prerequisite-patch-id: 6d57cd16d6c6e71c3da069c1d9eee1c86bdeee8d
prerequisite-patch-id: b64a5a718f540e7daf2dc4f0703422ad2cc52ebe
prerequisite-patch-id: eb9a9e4d7f4b7e439c5687786628f07c406864a4
prerequisite-patch-id: 2fe22fda60b4e4678bcf62d87bfd82181556af98
prerequisite-patch-id: 26211cbacdbc31a62524aa5ad402b0f3933d433e
prerequisite-patch-id: 02455f9ee70487d8b30b6aada5f5b62ff4e5ebe2
prerequisite-patch-id: 113da62f7845c2a9f86d24ed178cf52756917cc0
prerequisite-patch-id: 9ef3e8b12bc70690470035f0c6f351fa49562659
prerequisite-patch-id: 0953a92b86c0790554b64ebda5d6aed038a6cf0e
prerequisite-patch-id: 877e1c79e389936278122aa1efbdf99053b2d6c7
prerequisite-patch-id: 0b04c869d49a4c1ad96ff7b5d8e3b11c4069f23f
prerequisite-patch-id: 942b7480ddb281b9df74705f1a3a6e23a2440a43
prerequisite-patch-id: 98c3864233a7ba6d789ad260f4af170a020d2929
prerequisite-patch-id: 40dc0f2b1ab5e59f1f5de0be5134101ca896d13d
-- 
2.47.3

