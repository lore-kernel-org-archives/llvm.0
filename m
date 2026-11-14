Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699444;
	b=nClcx0HJsJ+0qkRLEP8LkepmZCzaGTbzXePQg7NtMbYFOIfqid0eanxShIrFBpcmWFen
	 peRXz8KCHWE2O7OsuAmrKz5WL/1cVleOEenGCA54nWXhjpZw09xCokrmEspe62gZ8ARQF
	 GliYS8S65u4lVVpE1cYR9eDbmKImLWohgCY+YtCDXOr2fgwmwNbfx6CQp0lQ3zXMIw8mZ
	 haDHh/FXcjd9DrECis4I3ziJQo69BSHNPkHhPYBkLH/QaFT6sEobkCpf5vOeQ5WIhx4TO
	 V9alN/qUaViu8VlHwBDGxi5yH8r/A6FHSZJTCmXyAHdrpZDI0WoAdIECAJ9N0yM2Ttg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699444;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=4u1pM0N2M2Nhelm5XobhP53hhVlX68IGzgp26xCcNvI=;
	b=e+B+hxemN4l9AjjY4UL2FWxGSrvYwns0OZCSFiQG3t7QZBVFXU3GrV1TRX9b0PPcA5CA
	 1oIZjJTxL9ffQiArOtdsURl7gx996f7h4y390E3fMBFUU+Gpj4ymR3wgpIZY6fXxlffw3
	 IzMhgit74ftIR1UyCEx+8Pbvw5n07+hBoLelDmMvXfJozOKyLwJu595K0TA07wdy0ToEg
	 3HnsggzJka9nUcfhsDX2KoK3h0LYiUWTCqXTQWXrbCxVh/Wcu4fbUkPurwktj0pWQsUXs
	 qa3sZpR4IY7FHzBDQP2JxpYBFf4iQCtUCSM3Fxbi7uAF3qDjHHC7sq+ms2zBv0/swSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="T+/K8DpD";
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6FB606A323;
	Sat, 14 Nov 2026 23:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F6FB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T+/K8DpD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794699443; x=1826235443;
  h=date:from:to:cc:subject:message-id;
  bh=UrVmCfz+39cyh6UBbnPyrbNqJW5iNqcSMhT7ObXJvvY=;
  b=T+/K8DpDmVQMNqtg26gLifpfqNA6lU8UzFJ9BDdbx9/8wejyR5eqNA6O
   nCfjgWJ0YTcXHoT/kkO85b09D4yXvwwNhlA6eikU6CJOxbOXVNzmxu8Mg
   ISdjrDMz5tMtNqy+DFuoWxdpVGKp3LVVDfb1xOOltmXcEf5Ryp5HRcuVM
   wFOCcs25BdYl786qAHPAPKqensb4HOAH4+ZHjQEkJsnJ72DgiWXM+6WXo
   DUEulb+EDzas2oEzJCTAwiGhGyS49J4vEEELL1iKykKv+SsfwUpVAN4v+
   EsFABWP/DSbDhzfhdtdRb8jIvyqkgeQcNOromhw5cNWnV690SB9NDfAhd
   w==;
X-CSE-ConnectionGUID: lkyE8m3mRKezWx01T7ZVBg==
X-CSE-MsgGUID: g/TClvpTSDSgxWqsS4xmZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3348831"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3348831"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 15:37:22 -0800
X-CSE-ConnectionGUID: 89hg5JUcROWNWh1TJOmB9A==
X-CSE-MsgGUID: wIX55T/eQWy6146rXTO40A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9372143"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Nov 2026 15:37:19 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSNJ7-00000001692-2ToU;
	Sat, 14 Nov 2026 23:37:17 +0000
Date: Sun, 15 Nov 2026 07:36:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_all_2 48/68]
 lib/ctlv/tests/message_kunit.c:221:13: warning: stack frame size (1440)
 exceeds limit (1280) in 'ctlv_msg_test_a_message_it_accepts'
Message-ID: <202611150750.DOxb8gj0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: 3e5d2a45aaa3688da1de5a2430c2993c39451793 [48/68] ctlv: Add KUnit tests
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261115/202611150750.DOxb8gj0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5dabc01bba1df10de6fb3c32fcf9db4aafe78f38)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611150750.DOxb8gj0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611150750.DOxb8gj0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/ctlv/tests/message_kunit.c:221:13: warning: stack frame size (1440) exceeds limit (1280) in 'ctlv_msg_test_a_message_it_accepts' [-Wframe-larger-than]
     221 | static void ctlv_msg_test_a_message_it_accepts(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:239:13: warning: stack frame size (1448) exceeds limit (1280) in 'ctlv_msg_test_a_missing_field_is_named' [-Wframe-larger-than]
     239 | static void ctlv_msg_test_a_missing_field_is_named(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:268:13: warning: stack frame size (1448) exceeds limit (1280) in 'ctlv_msg_test_a_bad_tlv_is_located' [-Wframe-larger-than]
     268 | static void ctlv_msg_test_a_bad_tlv_is_located(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:293:13: warning: stack frame size (1504) exceeds limit (1280) in 'ctlv_msg_test_an_enum_ext_takes_its_familys_values' [-Wframe-larger-than]
     293 | static void ctlv_msg_test_an_enum_ext_takes_its_familys_values(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:336:13: warning: stack frame size (1464) exceeds limit (1280) in 'ctlv_msg_test_a_header_enum_starts_at_zero' [-Wframe-larger-than]
     336 | static void ctlv_msg_test_a_header_enum_starts_at_zero(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:360:13: warning: stack frame size (1448) exceeds limit (1280) in 'ctlv_msg_test_a_record_is_located_too' [-Wframe-larger-than]
     360 | static void ctlv_msg_test_a_record_is_located_too(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:385:13: warning: stack frame size (1440) exceeds limit (1280) in 'ctlv_msg_test_the_occurrence_too_many' [-Wframe-larger-than]
     385 | static void ctlv_msg_test_the_occurrence_too_many(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:409:13: warning: stack frame size (1464) exceeds limit (1280) in 'ctlv_msg_test_a_malformed_record' [-Wframe-larger-than]
     409 | static void ctlv_msg_test_a_malformed_record(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:605:13: warning: stack frame size (1448) exceeds limit (1280) in 'ctlv_msg_test_inner_fill_optionality_is_inherited' [-Wframe-larger-than]
     605 | static void ctlv_msg_test_inner_fill_optionality_is_inherited(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:619:13: warning: stack frame size (1480) exceeds limit (1280) in 'ctlv_msg_test_contiguous_occurrences' [-Wframe-larger-than]
     619 | static void ctlv_msg_test_contiguous_occurrences(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:651:13: warning: stack frame size (1448) exceeds limit (1280) in 'ctlv_msg_test_a_split_occurrence_run' [-Wframe-larger-than]
     651 | static void ctlv_msg_test_a_split_occurrence_run(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:674:13: warning: stack frame size (1440) exceeds limit (1280) in 'ctlv_msg_test_required_field_precedes_a_split_run' [-Wframe-larger-than]
     674 | static void ctlv_msg_test_required_field_precedes_a_split_run(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:692:13: warning: stack frame size (1448) exceeds limit (1280) in 'ctlv_msg_test_cardinality_precedes_a_split_run' [-Wframe-larger-than]
     692 | static void ctlv_msg_test_cardinality_precedes_a_split_run(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:713:13: warning: stack frame size (1464) exceeds limit (1280) in 'ctlv_msg_test_tlv_error_precedes_a_split_run' [-Wframe-larger-than]
     713 | static void ctlv_msg_test_tlv_error_precedes_a_split_run(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:743:13: warning: stack frame size (1448) exceeds limit (1280) in 'ctlv_msg_test_an_unknown_type_splits_a_run' [-Wframe-larger-than]
     743 | static void ctlv_msg_test_an_unknown_type_splits_a_run(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:764:13: warning: stack frame size (1440) exceeds limit (1280) in 'ctlv_msg_test_a_run_is_local_to_its_record' [-Wframe-larger-than]
     764 | static void ctlv_msg_test_a_run_is_local_to_its_record(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:793:13: warning: stack frame size (1712) exceeds limit (1280) in 'ctlv_msg_test_indexed_access_does_not_rescan' [-Wframe-larger-than]
     793 | static void ctlv_msg_test_indexed_access_does_not_rescan(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:870:13: warning: stack frame size (1624) exceeds limit (1280) in 'ctlv_msg_test_optional_fields_have_empty_slots' [-Wframe-larger-than]
     870 | static void ctlv_msg_test_optional_fields_have_empty_slots(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:893:13: warning: stack frame size (1440) exceeds limit (1280) in 'ctlv_msg_test_a_tlv_a_caller_can_do_without' [-Wframe-larger-than]
     893 | static void ctlv_msg_test_a_tlv_a_caller_can_do_without(struct kunit *test)
         |             ^
>> lib/ctlv/tests/message_kunit.c:912:13: warning: stack frame size (1440) exceeds limit (1280) in 'ctlv_msg_test_a_tlv_a_record_can_do_without' [-Wframe-larger-than]
     912 | static void ctlv_msg_test_a_tlv_a_record_can_do_without(struct kunit *test)
         |             ^
   lib/ctlv/tests/message_kunit.c:931:13: warning: stack frame size (1448) exceeds limit (1280) in 'ctlv_msg_test_a_tlv_nobody_asked_to_ignore' [-Wframe-larger-than]
     931 | static void ctlv_msg_test_a_tlv_nobody_asked_to_ignore(struct kunit *test)
         |             ^
   lib/ctlv/tests/message_kunit.c:953:13: warning: stack frame size (1448) exceeds limit (1280) in 'ctlv_msg_test_a_field_declared_somewhere_else' [-Wframe-larger-than]
     953 | static void ctlv_msg_test_a_field_declared_somewhere_else(struct kunit *test)
         |             ^
   lib/ctlv/tests/message_kunit.c:978:13: warning: stack frame size (1440) exceeds limit (1280) in 'ctlv_msg_test_nothing_inside_an_ignored_tlv' [-Wframe-larger-than]
     978 | static void ctlv_msg_test_nothing_inside_an_ignored_tlv(struct kunit *test)
         |             ^
   lib/ctlv/tests/message_kunit.c:1003:13: warning: stack frame size (1440) exceeds limit (1280) in 'ctlv_msg_test_the_bit_where_it_means_nothing' [-Wframe-larger-than]
    1003 | static void ctlv_msg_test_the_bit_where_it_means_nothing(struct kunit *test)
         |             ^
   lib/ctlv/tests/message_kunit.c:1022:13: warning: stack frame size (1448) exceeds limit (1280) in 'ctlv_msg_test_a_bit_no_version_declares' [-Wframe-larger-than]
    1022 | static void ctlv_msg_test_a_bit_no_version_declares(struct kunit *test)
         |             ^
   lib/ctlv/tests/message_kunit.c:1081:13: warning: stack frame size (1464) exceeds limit (1280) in 'ctlv_msg_test_as_deep_as_the_core_allows' [-Wframe-larger-than]
    1081 | static void ctlv_msg_test_as_deep_as_the_core_allows(struct kunit *test)
         |             ^
   lib/ctlv/tests/message_kunit.c:1092:13: warning: stack frame size (1472) exceeds limit (1280) in 'ctlv_msg_test_one_record_deeper' [-Wframe-larger-than]
    1092 | static void ctlv_msg_test_one_record_deeper(struct kunit *test)
         |             ^
   lib/ctlv/tests/message_kunit.c:1187:13: warning: stack frame size (1600) exceeds limit (1280) in 'ctlv_msg_test_reading_what_is_not_there' [-Wframe-larger-than]
    1187 | static void ctlv_msg_test_reading_what_is_not_there(struct kunit *test)
         |             ^
   28 warnings generated.


vim +/ctlv_msg_test_a_message_it_accepts +221 lib/ctlv/tests/message_kunit.c

   216	
   217	/*
   218	 * Collapse-check requires scalar.u and allows scalar.mode, so the failures
   219	 * below are each one line away from a message it accepts.
   220	 */
 > 221	static void ctlv_msg_test_a_message_it_accepts(struct kunit *test)
   222	{
   223		struct ctlv_error error;
   224		struct ctlv_msg_test_msg msg;
   225	
   226		ctlv_msg_test_msg_init(&msg);
   227		ctlv_msg_test_msg_u64(&msg, CTLV_FIXTURE_T_U, 1);
   228		ctlv_msg_test_msg_u64(&msg, CTLV_FIXTURE_T_OPTIONAL_CHECK_MODE,
   229			CTLV_FIXTURE_MODE_ENABLED);
   230		KUNIT_EXPECT_EQ(
   231			test, 0,
   232			ctlv_msg_test_validate(&msg,
   233					       ctlv_msg_test_request_tree(
   234						       CTLV_FIXTURE_OP_OPTIONAL_CHECK),
   235					       &error));
   236		KUNIT_EXPECT_EQ(test, 0, error.reason);
   237	}
   238	
 > 239	static void ctlv_msg_test_a_missing_field_is_named(struct kunit *test)
   240	{
   241		struct ctlv_error error;
   242		struct ctlv_msg_test_msg msg;
   243	
   244		ctlv_msg_test_msg_init(&msg);
   245		/* Requiredness is reported before this present field's bad value. */
   246		ctlv_msg_test_msg_u64(&msg, CTLV_FIXTURE_T_OPTIONAL_CHECK_MODE,
   247			CTLV_FIXTURE_MODE_AUTO + 1);
   248		KUNIT_EXPECT_EQ(
   249			test, -EINVAL,
   250			ctlv_msg_test_validate(&msg,
   251					       ctlv_msg_test_request_tree(
   252						       CTLV_FIXTURE_OP_OPTIONAL_CHECK),
   253					       &error));
   254		KUNIT_EXPECT_EQ(test, CTLV_VALIDATION_REASON_MISSING_FIELD,
   255				error.reason);
   256		/* The only failure that names a field the message does not carry. */
   257		KUNIT_EXPECT_EQ(test, CTLV_FIXTURE_T_U,
   258				error.missing_type);
   259		/* The offsets are the record that should have carried it. */
   260		KUNIT_EXPECT_EQ(test, 0, error.record_offset);
   261		KUNIT_EXPECT_EQ(test, 0, error.bad_tlv_offset);
   262	}
   263	
   264	/*
   265	 * Every other failure names the TLV and the record as offsets from the root,
   266	 * because an offset survives the snapshot the TLV was found in.
   267	 */
 > 268	static void ctlv_msg_test_a_bad_tlv_is_located(struct kunit *test)
   269	{
   270		struct ctlv_error error;
   271		struct ctlv_msg_test_msg msg;
   272		u32 mode;
   273	
   274		ctlv_msg_test_msg_init(&msg);
   275		ctlv_msg_test_msg_u64(&msg, CTLV_FIXTURE_T_U, 1);
   276		/* One past the highest value the enum declares. */
   277		mode = ctlv_msg_test_msg_u64(&msg, CTLV_FIXTURE_T_OPTIONAL_CHECK_MODE,
   278			       CTLV_FIXTURE_MODE_AUTO + 1);
   279		KUNIT_EXPECT_EQ(
   280			test, -EINVAL,
   281			ctlv_msg_test_validate(&msg,
   282					       ctlv_msg_test_request_tree(
   283						       CTLV_FIXTURE_OP_OPTIONAL_CHECK),
   284					       &error));
   285		KUNIT_EXPECT_EQ(test, CTLV_VALIDATION_REASON_VALUE_OUT_OF_RANGE,
   286				error.reason);
   287		KUNIT_EXPECT_EQ(test, mode, error.bad_tlv_offset);
   288		KUNIT_EXPECT_EQ(test, 0, error.record_offset);
   289		KUNIT_EXPECT_EQ(test, 0, error.missing_type);
   290	}
   291	
   292	/* An enum extension point takes the values the message's family gives it. */
 > 293	static void ctlv_msg_test_an_enum_ext_takes_its_familys_values(struct kunit *test)
   294	{
   295		static const struct {
   296			const struct ctlv_family *family;
   297			u64 value;
   298			int ret;
   299		} cases[] = {
   300			/* The declaring family leaves it unfilled. */
   301			{ &ctlv_msg_test_message_fixture_family, 1, -EINVAL },
   302			{ &ctlv_msg_test_message_fixture_child_family, 0, -EINVAL },
   303			{ &ctlv_msg_test_message_fixture_child_family,
   304			  CTLV_FIXTURE_CHILD_VARIANT_PLAIN, 0 },
   305			{ &ctlv_msg_test_message_fixture_child_family,
   306			  CTLV_FIXTURE_CHILD_VARIANT_FANCY, 0 },
   307			{ &ctlv_msg_test_message_fixture_child_family,
   308			  CTLV_FIXTURE_CHILD_VARIANT_FANCY + 1, -EINVAL },
   309		};
   310		const struct ctlv_schema_tree *tree =
   311			ctlv_msg_test_request_tree(CTLV_FIXTURE_OP_OPTIONAL_CHECK);
   312		struct ctlv_msg_test_msg msg;
   313		struct ctlv_msg message;
   314		struct ctlv_error error;
   315		unsigned int i;
   316		u32 reason;
   317		int ret;
   318	
   319		for (i = 0; i < ARRAY_SIZE(cases); i++) {
   320			ctlv_msg_test_msg_init(&msg);
   321			ctlv_msg_test_msg_u64(&msg, CTLV_FIXTURE_T_U, 1);
   322			ctlv_msg_test_msg_u64(&msg, CTLV_FIXTURE_T_OPTIONAL_CHECK_VARIANT,
   323					      cases[i].value);
   324			ret = ctlv_msg_test_validate_indexed_family(&msg, tree, cases[i].family,
   325								    &message, &error);
   326			ctlv_message_index_free(&message);
   327			reason = 0;
   328			if (cases[i].ret)
   329				reason = CTLV_VALIDATION_REASON_VALUE_OUT_OF_RANGE;
   330			KUNIT_EXPECT_EQ_MSG(test, ret, cases[i].ret, "case %u", i);
   331			KUNIT_EXPECT_EQ_MSG(test, error.reason, reason, "case %u", i);
   332		}
   333	}
   334	
   335	/* A header's enum takes its lowest constant, here zero, up to before $end. */
 > 336	static void ctlv_msg_test_a_header_enum_starts_at_zero(struct kunit *test)
   337	{
   338		const struct ctlv_schema_tree *tree;
   339		struct ctlv_error error;
   340		struct ctlv_msg_test_msg msg;
   341		u32 algo;
   342	
   343		tree = ctlv_msg_test_request_tree(CTLV_FIXTURE_OP_COUNTS_GET);
   344		ctlv_msg_test_msg_init(&msg);
   345		ctlv_msg_test_msg_u64(&msg, CTLV_FIXTURE_T_COUNTS_GET_ALGO,
   346				      HASH_ALGO_MD4);
   347		KUNIT_EXPECT_EQ(test, 0, ctlv_msg_test_validate(&msg, tree, &error));
   348	
   349		ctlv_msg_test_msg_init(&msg);
   350		algo = ctlv_msg_test_msg_u64(&msg, CTLV_FIXTURE_T_COUNTS_GET_ALGO,
   351					     HASH_ALGO__LAST);
   352		KUNIT_EXPECT_EQ(test, -EINVAL,
   353				ctlv_msg_test_validate(&msg, tree, &error));
   354		KUNIT_EXPECT_EQ(test, CTLV_VALIDATION_REASON_VALUE_OUT_OF_RANGE,
   355				error.reason);
   356		KUNIT_EXPECT_EQ(test, algo, error.bad_tlv_offset);
   357	}
   358	
   359	/* A TLV inside a record is located by both, which is not the same offset. */
 > 360	static void ctlv_msg_test_a_record_is_located_too(struct kunit *test)
   361	{
   362		struct ctlv_error error;
   363		u32 level1, level2, u;
   364		struct ctlv_msg_test_msg msg;
   365	
   366		ctlv_msg_test_msg_init(&msg);
   367		level1 = ctlv_msg_test_msg_record_start(&msg, CTLV_FIXTURE_T_RECORDS_DUMP_LEVEL1);
   368		ctlv_msg_test_msg_u64(&msg, CTLV_FIXTURE_T_U, 1);
   369		level2 = ctlv_msg_test_msg_record_start(&msg, CTLV_FIXTURE_T_RECORDS_DUMP_LEVEL1_LEVEL2);
   370		/* Above the maximum of the field, wherever the field is placed. */
   371		u = ctlv_msg_test_msg_u64(&msg, CTLV_FIXTURE_T_U, 4097);
   372		KUNIT_EXPECT_EQ(
   373			test, -EINVAL,
   374			ctlv_msg_test_validate(
   375				&msg,
   376				ctlv_msg_test_reply_tree(CTLV_FIXTURE_OP_RECORDS_DUMP),
   377				&error));
   378		KUNIT_EXPECT_EQ(test, CTLV_VALIDATION_REASON_VALUE_OUT_OF_RANGE,
   379				error.reason);
   380		KUNIT_EXPECT_EQ(test, u, error.bad_tlv_offset);
   381		KUNIT_EXPECT_EQ(test, level2, error.record_offset);
   382		KUNIT_EXPECT_NE(test, level1, level2);
   383	}
   384	
 > 385	static void ctlv_msg_test_the_occurrence_too_many(struct kunit *test)
   386	{
   387		struct ctlv_error error;
   388		struct ctlv_msg_test_msg msg;
   389		u32 excess;
   390		u32 index;
   391	
   392		ctlv_msg_test_msg_init(&msg);
   393		/* Three is what the field allows, and the fourth is reported. */
   394		for (index = 0; index < 3; index++)
   395			ctlv_msg_test_msg_u64(&msg, CTLV_FIXTURE_T_COUNTS_GET_FEW, index);
   396		excess = ctlv_msg_test_msg_u64(&msg, CTLV_FIXTURE_T_COUNTS_GET_FEW, 3);
   397		KUNIT_EXPECT_EQ(
   398			test, -EINVAL,
   399			ctlv_msg_test_validate(
   400				&msg,
   401				ctlv_msg_test_request_tree(CTLV_FIXTURE_OP_COUNTS_GET),
   402				&error));
   403		KUNIT_EXPECT_EQ(test, CTLV_VALIDATION_REASON_TOO_MANY_OCCURRENCES,
   404				error.reason);
   405		KUNIT_EXPECT_EQ(test, excess, error.bad_tlv_offset);
   406	}
   407	
   408	/* The one failure found by walking, so what it names is the record. */
 > 409	static void ctlv_msg_test_a_malformed_record(struct kunit *test)
   410	{
   411		struct ctlv_msg message;
   412		struct ctlv_error error;
   413		struct ctlv_msg_test_msg msg;
   414		u32 offset;
   415		int ret;
   416	
   417		ctlv_msg_test_msg_init(&msg);
   418		offset = ctlv_msg_test_msg_u64(&msg, CTLV_FIXTURE_T_COUNTS_GET_FEW, 1);
   419		ctlv_msg_test_msg_done(&msg);
   420		ctlv_msg_test_msg_hdr(&msg, offset)->len = 0;
   421		ret = ctlv_msg_test_validate_indexed(&msg,
   422				       ctlv_msg_test_request_tree(CTLV_FIXTURE_OP_COUNTS_GET),
   423				       &message, &error);
   424		KUNIT_EXPECT_EQ(test, ret, -EINVAL);
   425		KUNIT_EXPECT_NULL(test, message.index);
   426		KUNIT_EXPECT_EQ(test, CTLV_VALIDATION_REASON_MALFORMED_MESSAGE,
   427				error.reason);
   428		KUNIT_EXPECT_EQ(test, 0, error.bad_tlv_offset);
   429		KUNIT_EXPECT_EQ(test, 0, error.record_offset);
   430	}
   431	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
