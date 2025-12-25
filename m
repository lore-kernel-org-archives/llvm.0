Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8071E4C98;
	Thu, 25 Dec 2025 03:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766632711; cv=none; b=HIPYr+GcRvD2CpMciIGB4ebpSaeVMkPqbBsGZzYPm9YLSBVj6/Bqv9s+N/2d5Ug9qbZzROqoZUmr0hkCJSRwk3mM02shm2DeY4RPbGVo2s1RFD9fyyK3DCo0mkw4FjyxXJQiH5aDLViNaArJm5g22SUDmk7A3gGib+28UmaQCoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766632711; c=relaxed/simple;
	bh=3pk8PNUmAdodRrGJ5xTDJgc7YffMRSN3tTSGs9dCvJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4t8xyHjXbvVNq5IUM/0fXy1Ru6FehJ080FKePyRYZjG7gFA2rAtktblHXU2ADdIKuUs4OAKRkQdQQ61qasEMreXQrwVvKJG6HFz6AaYi7i+XafZSsDzux+5f94LAXnl/f2ZCWpZY6/o3MVIcbGKHFjG5XellRMrSzBLjNkowVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DIuqHaXQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DIuqHaXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766632709; x=1798168709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3pk8PNUmAdodRrGJ5xTDJgc7YffMRSN3tTSGs9dCvJg=;
  b=DIuqHaXQZkZaAgOmK4VjppFs4YnMgGyEKbO3BCOL2rsTkrOSNDS1P4ki
   pD+vFRhDW4T5fQykerUWCsnXxD6E1EMdLLcM9Eh/FYQYUALuOHGcODxbc
   OH/5tYHaXQHGguy2jQlSUEeEjqalGZMoXbiH6ze+IQTBQUJ5zFnfi/7VW
   8NGJ0htr9rLcR5QiDLAF8KxuXhIeVK2CxvJMy23zwcgPy0PudVINziA9R
   /Qp0+UhCjyyWYSTwlkS4tWT+wWFZLiIUGzg4n6EUEE+vQgGOm9mtiBflF
   qyZwkS6Jz6RyC0nEjWHSPH8VYnABpWdtJ8nZ6u7j6LFY4SNFrnvvGnfY6
   Q==;
X-CSE-ConnectionGUID: nseZ94tkTWatRz79OHgyrA==
X-CSE-MsgGUID: CWvo44G3QjaE5YyHTl50iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="78755733"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="78755733"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 19:18:29 -0800
X-CSE-ConnectionGUID: Q0xLe2jxQy6AnuPLDdi3tg==
X-CSE-MsgGUID: sVitdgBkQnCa3bzFp+BC2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="200165295"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 Dec 2025 19:18:27 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYbrs-000000003gv-3h1A;
	Thu, 25 Dec 2025 03:18:24 +0000
Date: Thu, 25 Dec 2025 11:17:40 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Maurer <fmaurer@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net 5/6] hsr: Implement more robust duplicate discard for
 PRP
Message-ID: <202512251125.VWalZkfn-lkp@intel.com>
References: <af4bd23b0a4b417b9ce26d77c1d153cfaf78ec64.1766433800.git.fmaurer@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af4bd23b0a4b417b9ce26d77c1d153cfaf78ec64.1766433800.git.fmaurer@redhat.com>

Hi Felix,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Maurer/selftests-hsr-Add-ping-test-for-PRP/20251223-050252
base:   net/main
patch link:    https://lore.kernel.org/r/af4bd23b0a4b417b9ce26d77c1d153cfaf78ec64.1766433800.git.fmaurer%40redhat.com
patch subject: [RFC net 5/6] hsr: Implement more robust duplicate discard for PRP
config: arm64-randconfig-001-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251125.VWalZkfn-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251125.VWalZkfn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251125.VWalZkfn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/hsr/prp_dup_discard_test.c:23:13: error: no member named 'seq_start' in 'struct hsr_node'
      23 |         data->node.seq_start[HSR_PT_SLAVE_A] = 1;
         |         ~~~~~~~~~~ ^
>> net/hsr/prp_dup_discard_test.c:24:13: error: no member named 'seq_expected' in 'struct hsr_node'
      24 |         data->node.seq_expected[HSR_PT_SLAVE_A] = 1;
         |         ~~~~~~~~~~ ^
   net/hsr/prp_dup_discard_test.c:25:13: error: no member named 'seq_start' in 'struct hsr_node'
      25 |         data->node.seq_start[HSR_PT_SLAVE_B] = 1;
         |         ~~~~~~~~~~ ^
   net/hsr/prp_dup_discard_test.c:26:13: error: no member named 'seq_expected' in 'struct hsr_node'
      26 |         data->node.seq_expected[HSR_PT_SLAVE_B] = 1;
         |         ~~~~~~~~~~ ^
   net/hsr/prp_dup_discard_test.c:39:35: error: no member named 'seq_start' in 'struct hsr_node'
      39 |         KUNIT_EXPECT_EQ(test, data->node.seq_start[HSR_PT_SLAVE_A],
         |                               ~~~~~~~~~~ ^
   include/kunit/test.h:1032:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
    1032 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:1037:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
    1037 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:873:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     873 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:839:15: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   net/hsr/prp_dup_discard_test.c:39:35: error: no member named 'seq_start' in 'struct hsr_node'
      39 |         KUNIT_EXPECT_EQ(test, data->node.seq_start[HSR_PT_SLAVE_A],
         |                               ~~~~~~~~~~ ^
   include/kunit/test.h:1032:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
    1032 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:1037:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
    1037 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:873:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     873 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:839:31: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   net/hsr/prp_dup_discard_test.c:41:35: error: no member named 'seq_start' in 'struct hsr_node'
      41 |         KUNIT_EXPECT_EQ(test, data->node.seq_start[HSR_PT_SLAVE_B],
         |                               ~~~~~~~~~~ ^
   include/kunit/test.h:1032:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
    1032 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:1037:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
    1037 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:873:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     873 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:839:15: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   net/hsr/prp_dup_discard_test.c:41:35: error: no member named 'seq_start' in 'struct hsr_node'
      41 |         KUNIT_EXPECT_EQ(test, data->node.seq_start[HSR_PT_SLAVE_B],
         |                               ~~~~~~~~~~ ^
   include/kunit/test.h:1032:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
    1032 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:1037:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
    1037 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:873:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     873 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:839:31: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   net/hsr/prp_dup_discard_test.c:43:35: error: no member named 'seq_expected' in 'struct hsr_node'
      43 |         KUNIT_EXPECT_EQ(test, data->node.seq_expected[HSR_PT_SLAVE_A],
         |                               ~~~~~~~~~~ ^
   include/kunit/test.h:1032:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
    1032 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:1037:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
    1037 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:873:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     873 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:839:15: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   net/hsr/prp_dup_discard_test.c:43:35: error: no member named 'seq_expected' in 'struct hsr_node'
      43 |         KUNIT_EXPECT_EQ(test, data->node.seq_expected[HSR_PT_SLAVE_A],
         |                               ~~~~~~~~~~ ^
   include/kunit/test.h:1032:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
    1032 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:1037:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
    1037 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:873:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     873 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:839:31: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   net/hsr/prp_dup_discard_test.c:45:35: error: no member named 'seq_expected' in 'struct hsr_node'
      45 |         KUNIT_EXPECT_EQ(test, data->node.seq_expected[HSR_PT_SLAVE_B],


vim +23 net/hsr/prp_dup_discard_test.c

814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  13  
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  14  static struct prp_test_data *build_prp_test_data(struct kunit *test)
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  15  {
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  16  	struct prp_test_data *data = kunit_kzalloc(test,
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  17  		sizeof(struct prp_test_data), GFP_USER);
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  18  	KUNIT_EXPECT_NOT_ERR_OR_NULL(test, data);
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  19  
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  20  	data->frame.node_src = &data->node;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  21  	data->frame.port_rcv = &data->port_rcv;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  22  	data->port_rcv.type = HSR_PT_SLAVE_A;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07 @23  	data->node.seq_start[HSR_PT_SLAVE_A] = 1;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07 @24  	data->node.seq_expected[HSR_PT_SLAVE_A] = 1;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  25  	data->node.seq_start[HSR_PT_SLAVE_B] = 1;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  26  	data->node.seq_expected[HSR_PT_SLAVE_B] = 1;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  27  	data->node.seq_out[HSR_PT_MASTER] = 0;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  28  	data->node.time_out[HSR_PT_MASTER] = jiffies;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  29  	data->port.type = HSR_PT_MASTER;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  30  
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  31  	return data;
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  32  }
814dbf4b6c955c Jaakko Karrenpalo 2025-03-07  33  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
