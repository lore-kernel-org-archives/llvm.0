Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679833;
	b=t9HG8/j/bMO0WjK8fDkq1PRZz+wxBX2/Su5HxptSVW2K7aHz/mHpdcFHOO5+W+UBGlQG
	 brouglP1N0Uacd5O3NAvLmtkVlZQWHf5QyNC1ruomtcKvaAbwA1eH0xhIfSj2ahZkdUpe
	 h9V41xQTnOxdMETcLWFqHyT7qiNOCJeTEnGJwOkBsxRpMcIrwvkrx4D7YUQlOy+S5bTjb
	 eeAT0xc3qCnSF9N8+ZCh5cgVJyincQDeOrEw16u3OPBxLQdDkafwqDeIZGV1+HytuW23x
	 qSK/ai7vfn6H88HmY6HUhzlw6nDn+pvH6WMQO+DZ2S27Q47ky5pcpEVO/ni0TZBilSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679833;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=kvqxuyKdqOZIctZ1RVDJiTTys7XqmGboeKGR0Mb/Lz0=;
	b=jIeG3E6c42/fO8N/XgRY7h00OJCynukwwQiykRXXrZNqhG3sGxjJJKLoJ86i7w0cIIRp
	 lFijadeVCEyTpZBOTQL+tLiRFgZh6LeHbJpR9zpY82yAgWd0uDEi4E5Mm6hbkCkbXOnuL
	 AwY508zNiAwcZ4wrv9xGbSpbqbEQaWi1pdeY6kkZHqn0eXm9KrOGk22LSHBfKv67PzSEV
	 G4FfqshWG6gXo4acwnlsPlDn3wufxI6aSIl2zpS3gsRu2JRcihVHabKQIVaL2b95T7Yb8
	 yDEHJSGEC5yMhCzyZZaTGpqYMNJcX40jut+YSzsmUCLYuDTTUDVwWfqaJVMKHXK0Hlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GVKL0CWE;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02723606A31C;
	Thu, 26 Nov 2026 07:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02723606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GVKL0CWE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795679832; x=1827215832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7gqO7mtbAkU5IaNVQpE0KYsTeEo00WqOION0Mo8l5RQ=;
  b=GVKL0CWEFGDvI0s36/UX/xO8hKFVpwEIhE6S4vfUyI/75GmNN+rJRBq8
   0wMZXHYKBq1dkDTUzLeTKUFGXoKBh8tyhy/dn96jJwQjZ0j8iH2r7K4yh
   JMvZ5z5kX1XJ/7UtNulMh5ZXOEYLykCU1ZDk+69ezj+Q+0xCLDFuuXSQj
   Qm0Kellht+VWiFXwk/FJ8nwPy+x+qqjDSnepuXoUuWGtyLpFMzzjji4Sz
   7wDmnTR1cmPeXDmAwl09W0C0LrovZHZO53P+i8XdvBfv7eBDBSicfx1W0
   t3SvxCwyomuU6rNFh4GE++dScWhfWqP2AoZ2lQGtJFWSnfaVEsFZGLmgi
   g==;
X-CSE-ConnectionGUID: 7X5HWC0wQ8+GpK6freeyDw==
X-CSE-MsgGUID: BCeYRk6CSvqsEjt49/W5ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4567265"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4567265"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 23:57:11 -0800
X-CSE-ConnectionGUID: itKbRMG2R9iWVRnaqlN10Q==
X-CSE-MsgGUID: sN7xmylnSZSZMY9a4fnawA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12152074"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Nov 2026 23:57:06 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWULm-00000001TZw-2xrc;
	Thu, 26 Nov 2026 07:57:02 +0000
Date: Thu, 26 Nov 2026 15:56:28 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	John Hubbard <jhubbard@nvidia.com>,
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v4 4/5] rust: workqueue: add creation of workqueues
Message-ID: <20261126154348.RP9PjaYR-lkp@intel.com>
References: <20261119-rust-workqueue-v4-4-707c68994940@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-rust-workqueue-v4-4-707c68994940@google.com>

Hi Alice,

kernel test robot noticed the following build warnings:

[auto build test WARNING on aebb7274476403040d582c61478df8f4a7bf9cd3]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/rust-workqueue-support-stack-allocated-work-items/20261119-141242
base:   aebb7274476403040d582c61478df8f4a7bf9cd3
patch link:    https://lore.kernel.org/r/20261119-rust-workqueue-v4-4-707c68994940%40google.com
patch subject: [PATCH v4 4/5] rust: workqueue: add creation of workqueues
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261126/20261126154348.RP9PjaYR-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126154348.RP9PjaYR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126154348.RP9PjaYR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from rust/helpers/helpers.c:110:
>> rust/helpers/workqueue.c:27:9: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 4)' attribute to the declaration of 'rust_helper_alloc_workqueue' [-Wmissing-format-attribute]
      23 | __rust_helper
         | __attribute__((format(printf, 1, 4))) 
      24 | struct workqueue_struct *rust_helper_alloc_workqueue(const char *fmt, unsigned int flags,
      25 |                                                      int max_active, const void *data)
      26 | {
      27 |         return alloc_workqueue(fmt, flags, max_active, data);
         |                ^
   include/linux/workqueue.h:519:76: note: expanded from macro 'alloc_workqueue'
     519 | #define alloc_workqueue(...)    alloc_hooks(alloc_workqueue_noprof(__VA_ARGS__))
         |                                                                               ^
   include/linux/alloc_tag.h:270:31: note: expanded from macro 'alloc_hooks'
     270 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^
   include/linux/alloc_tag.h:256:9: note: expanded from macro 'alloc_hooks_tag'
     256 |         typeof(_do_alloc) _res;                                         \
         |                ^
   rust/helpers/workqueue.c:24:26: note: 'rust_helper_alloc_workqueue' declared here
      24 | struct workqueue_struct *rust_helper_alloc_workqueue(const char *fmt, unsigned int flags,
         |                          ^
   1 warning generated.


vim +27 rust/helpers/workqueue.c

    22	
    23	__rust_helper
    24	struct workqueue_struct *rust_helper_alloc_workqueue(const char *fmt, unsigned int flags,
    25							     int max_active, const void *data)
    26	{
  > 27		return alloc_workqueue(fmt, flags, max_active, data);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
