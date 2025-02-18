Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D322FF24
	for <llvm@lists.linux.dev>; Tue, 18 Feb 2025 08:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739866631; cv=none; b=jam8e7+P9/BSDsmW3FQWENmeCoyhXSngEIOCUUeqdaEtnEHdPmWkagQVQDGaKBJb5zU11pI3p7HffksIvGYBPLCIquIKYnKWYOLt5frNgbnGGvNc334Eg1hTKZCOl4spkneTCoBPI4oU9nD2MZPL0yOdsESfXn+EZNlscUmasdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739866631; c=relaxed/simple;
	bh=bXO9RjmvEI/gGPfc1eFRDuxO1uk/Wq+sbi65zILen0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hbMMZiuawELSFj8iefPNn+BcbXpnlpRsEnKKqb0KYFB+UjmhVNNGl6+GV44JQygXrxlyHuOITxvnTIPHBPTqyAyIGB3UO0tvocw1c/XcRn7Qw2Vs/QY9TIO8M9eP4g9jRV4sM6bReaLuICF/GSZIJRq6fuuc5zznwLdAgcx0GEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NbUJNHgj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbUJNHgj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739866630; x=1771402630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bXO9RjmvEI/gGPfc1eFRDuxO1uk/Wq+sbi65zILen0w=;
  b=NbUJNHgjOKfoXCYFrDqnwF1iHbIRIIV9bCDsPeFc2OoXUoxyhYCt/NU7
   HdW3qR+lVRqGSD+ufgZAlJbxWLrmgo1UIw8B9F98zrQQtlkyyo9f3dLOz
   KJuTCEdNzZ+fETOzNhXDVEwX3++WTURRyLTXi1F7lPXjfRXyaFdhe5qZd
   F5o78S7oYrOt1xQeRUfHCamC3ebCc7WKhu5POJF+2/c3E51U+kdbFzkrc
   /sIm+nt9JpU9S1YiVBkiLdfN5YvDjHaIHGgDGIzuf2EGDWdSuE5lTm6Z7
   wMVMd8kyBwOQk5yn5f5I4nvqNsL2IVWCKH0GpvNo9ddBfKHKJtSb4xsA6
   w==;
X-CSE-ConnectionGUID: 4jmrjWQST9SiDB9yH8IR5w==
X-CSE-MsgGUID: DHxFnFO4RV+n+lOXSuDBOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="28150088"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="28150088"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 00:17:09 -0800
X-CSE-ConnectionGUID: +HOO78zjQVWglPzSMQGDaA==
X-CSE-MsgGUID: iC+fl3UpTo2a4V5pAf6vOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="119247460"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.49])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 00:16:49 -0800
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: kees@kernel.org,
	julian.stecklina@cyberus-technology.de,
	kevinloughlin@google.com,
	peterz@infradead.org,
	tglx@linutronix.de,
	justinstitt@google.com,
	catalin.marinas@arm.com,
	wangkefeng.wang@huawei.com,
	bhe@redhat.com,
	ryabinin.a.a@gmail.com,
	kirill.shutemov@linux.intel.com,
	will@kernel.org,
	ardb@kernel.org,
	jason.andryuk@amd.com,
	dave.hansen@linux.intel.com,
	pasha.tatashin@soleen.com,
	ndesaulniers@google.com,
	guoweikang.kernel@gmail.com,
	dwmw@amazon.co.uk,
	mark.rutland@arm.com,
	broonie@kernel.org,
	apopple@nvidia.com,
	bp@alien8.de,
	rppt@kernel.org,
	kaleshsingh@google.com,
	richard.weiyang@gmail.com,
	luto@kernel.org,
	glider@google.com,
	pankaj.gupta@amd.com,
	andreyknvl@gmail.com,
	pawan.kumar.gupta@linux.intel.com,
	kuan-ying.lee@canonical.com,
	tony.luck@intel.com,
	tj@kernel.org,
	jgross@suse.com,
	dvyukov@google.com,
	baohua@kernel.org,
	samuel.holland@sifive.com,
	dennis@kernel.org,
	akpm@linux-foundation.org,
	thomas.weissschuh@linutronix.de,
	surenb@google.com,
	kbingham@kernel.org,
	ankita@nvidia.com,
	nathan@kernel.org,
	maciej.wieczor-retman@intel.com,
	ziy@nvidia.com,
	xin@zytor.com,
	rafael.j.wysocki@intel.com,
	andriy.shevchenko@linux.intel.com,
	cl@linux.com,
	jhubbard@nvidia.com,
	hpa@zytor.com,
	scott@os.amperecomputing.com,
	david@redhat.com,
	jan.kiszka@siemens.com,
	vincenzo.frascino@arm.com,
	corbet@lwn.net,
	maz@kernel.org,
	mingo@redhat.com,
	arnd@arndb.de,
	ytcoode@gmail.com,
	xur@google.com,
	morbo@google.com,
	thiago.bauermann@linaro.org
Cc: linux-doc@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v2 03/14] kasan: sw_tags: Support outline stack tag generation
Date: Tue, 18 Feb 2025 09:15:19 +0100
Message-ID: <20f64170c0b59cb5185cfe02c4bc833073a2ebe6.1739866028.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1739866028.git.maciej.wieczor-retman@intel.com>
References: <cover.1739866028.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Holland <samuel.holland@sifive.com>

This allows stack tagging to be disabled at runtime by tagging all
stack objects with the match-all tag. This is necessary on RISC-V,
where a kernel with KASAN_SW_TAGS enabled is expected to boot on
hardware without pointer masking support.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 mm/kasan/kasan.h   | 2 ++
 mm/kasan/sw_tags.c | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 129178be5e64..2fb26f74dff9 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -636,6 +636,8 @@ void *__asan_memset(void *addr, int c, ssize_t len);
 void *__asan_memmove(void *dest, const void *src, ssize_t len);
 void *__asan_memcpy(void *dest, const void *src, ssize_t len);
 
+u8 __hwasan_generate_tag(void);
+
 void __hwasan_load1_noabort(void *);
 void __hwasan_store1_noabort(void *);
 void __hwasan_load2_noabort(void *);
diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
index b9382b5b6a37..94465a8a3640 100644
--- a/mm/kasan/sw_tags.c
+++ b/mm/kasan/sw_tags.c
@@ -71,6 +71,15 @@ u8 kasan_random_tag(void)
 	return (u8)(state % (KASAN_TAG_MAX + 1));
 }
 
+u8 __hwasan_generate_tag(void)
+{
+	if (!kasan_enabled())
+		return KASAN_TAG_KERNEL;
+
+	return kasan_random_tag();
+}
+EXPORT_SYMBOL(__hwasan_generate_tag);
+
 bool kasan_check_range(const void *addr, size_t size, bool write,
 			unsigned long ret_ip)
 {
-- 
2.47.1

