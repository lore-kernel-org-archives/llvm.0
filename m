Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1B631D366;
	Fri,  2 Oct 2026 21:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790978379; cv=none; b=u8PndslMguLBf+r8FaawC9sdNhC1daoComZaFtjtlIrz0CcegM94o2eYeS3NGwd5wH6a1oCvofKR1ECTEe9aUfs7s5tMTGA4iT6WgdqoX2NqinoefwyIYh7AeSVY5h8OhT/XgI+/T+BMDpDf0WkMbLQxVgkvLy6lWP1VHUbfXh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790978379; c=relaxed/simple;
	bh=ifbG8gbKfa6x4G4cApl3M409LbdgOXoqJm+m/zdILOg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bQ7Igdoa3wSGwg+KslAhyDtn1fH91hmw4PuQmMYqkhenRp95KEwaGGHquMvoWT96M3iJwvKhb4UuLAjcOv9QcH4YH5GnW4SZtIkafdYYGD/GyII0eNbJPMNV3ipby2GEK/9Y9SSzTpXA8pioh+kPB5qfXDIWQRo6kC0kVzVUK+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDapgxWP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDapgxWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790978378; x=1822514378;
  h=date:from:to:cc:subject:message-id;
  bh=ifbG8gbKfa6x4G4cApl3M409LbdgOXoqJm+m/zdILOg=;
  b=cDapgxWPkLZYlJ2HxrYnaVO8o7ROupK/Qfeqkyzzln4Ozqzpd1cc+jd3
   M91vyrejO4dSZ7SYqmpLu6lkOrUEXr2qaPMDBGpiLO+h2Sy5OOPx/StWi
   HL035m5qhHUPX86ENiufxirsde1MCXxd9LI5teMx9G2piWjQmA1a9sUy9
   viUNhn2t9oIoGB8+raUZtK4uETUAYc0B1aEnLqGldwczW7XooDT6n8zDD
   UpmrlyG9QZDmsqPLxLa1HCSxXrEIbKdG8JlBbNwVIBzGfMyqgFavNj3gG
   EwaHdfSbcDF1OlxkgoXiIYX4gP/w+5W3fuKlmdp+kHkE3p7xy4yP66M7q
   A==;
X-CSE-ConnectionGUID: NwYGupJcTgmRBq4Zx8VH1g==
X-CSE-MsgGUID: ikOqvPaNTD+o1eJkRmP3wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="102423691"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="102423691"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 14:59:37 -0700
X-CSE-ConnectionGUID: PxUWOynKTwOnq2S6V2ywkQ==
X-CSE-MsgGUID: szf5EyxkTtanGk4DQ9/E5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="339859"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 02 Oct 2026 14:59:36 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xClHx-00000000TVr-3ap1;
	Fri, 02 Oct 2026 21:59:33 +0000
Date: Sat, 03 Oct 2026 05:59:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 20/26]
 drivers/attestation/core/ctlv.c:968:5: warning: stack frame size (1344)
 exceeds limit (1280) in 'ctlv_attestation_mr_log_get_query'
Message-ID: <202610030528.9y9vbjsV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: 7c3e9198f02658988c2f0ea335cdfd75b93236e0 [20/26] attestation: introduce the core framework
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261003/202610030528.9y9vbjsV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030528.9y9vbjsV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610030528.9y9vbjsV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/attestation/core/ctlv.c:968:5: warning: stack frame size (1344) exceeds limit (1280) in 'ctlv_attestation_mr_log_get_query' [-Wframe-larger-than]
     968 | int ctlv_attestation_mr_log_get_query(void *priv, struct ctlv_op_ctx *ctx,
         |     ^
   1 warning generated.


vim +/ctlv_attestation_mr_log_get_query +968 drivers/attestation/core/ctlv.c

   967	
 > 968	int ctlv_attestation_mr_log_get_query(void *priv, struct ctlv_op_ctx *ctx,
   969					      const struct ctlv_cursor *request,
   970					      struct ctlv_cursor *reply)
   971	{
   972		struct attestation *att = priv;
   973		struct attestation_mr_log_entry *entry;
   974		struct ctlv_cursor item, nested;
   975		unsigned int ids[256];
   976		size_t ids_count = 0, index;
   977		unsigned int start, end;
   978		unsigned long xa_index;
   979		u64 boundary;
   980		u64 cursor = ctlv_op_query_cursor(ctx);
   981		int ret;
   982	
   983		ctlv_attestation_mr_log_get_mr_selection_for_each(&item, request) {
   984			u64 id = ctlv_attestation_mr_log_get_selection_mr_id_get(&item);
   985	
   986			if (id > UINT_MAX)
   987				return -ERANGE;
   988			for (index = 0; index < ids_count; index++)
   989				if (ids[index] == id)
   990					return -EINVAL;
   991			ids[ids_count++] = id;
   992		}
   993		if (cursor)
   994			boundary = ctlv_op_query_generation(ctx);
   995		else
   996			boundary = att->log->generation;
   997		if (boundary > UINT_MAX || boundary > att->log->generation)
   998			return -ESTALE;
   999		end = boundary;
  1000		if (ctlv_attestation_mr_log_get_mr_end_generation_present(request)) {
  1001			u64 requested_end =
  1002				ctlv_attestation_mr_log_get_mr_end_generation_get(request);
  1003	
  1004			end = min_t(u64, end, requested_end);
  1005		}
  1006		start = 1;
  1007		if (ctlv_attestation_mr_log_get_mr_start_generation_present(request)) {
  1008			u64 value =
  1009				ctlv_attestation_mr_log_get_mr_start_generation_get(request);
  1010	
  1011			if (value > UINT_MAX)
  1012				return -EINVAL;
  1013			start = value;
  1014		}
  1015		if (att->log->generation && start > end)
  1016			return -EINVAL;
  1017		if (!cursor && att->log->generation) {
  1018			if (!ctlv_attestation_mr_start_generation_put(reply, start) ||
  1019			    !ctlv_attestation_mr_end_generation_put(reply, end))
  1020				return -EMSGSIZE;
  1021		}
  1022		xa_index = cursor ? cursor : start;
  1023		entry = xa_find(&att->log->entries, &xa_index, end, XA_PRESENT);
  1024		while (entry &&
  1025		       !attestation_log_selected(ids, ids_count, entry->mr_id))
  1026			entry = xa_find_after(&att->log->entries, &xa_index, end,
  1027					      XA_PRESENT);
  1028		if (!entry)
  1029			return ctlv_op_query_done(ctx, boundary);
  1030		if (!cursor)
  1031			return ctlv_op_query_more(ctx, boundary,
  1032						  entry->mr_generation);
  1033		if (!ctlv_attestation_log_entry_start(reply, &nested))
  1034			return -EMSGSIZE;
  1035		ret = attestation_mr_log_entry_encode(&nested, entry);
  1036		ctlv_nest_end(&nested);
  1037		if (ret)
  1038			return ret;
  1039		entry = xa_find_after(&att->log->entries, &xa_index, end, XA_PRESENT);
  1040		while (entry &&
  1041		       !attestation_log_selected(ids, ids_count, entry->mr_id))
  1042			entry = xa_find_after(&att->log->entries, &xa_index, end,
  1043					      XA_PRESENT);
  1044		if (entry)
  1045			return ctlv_op_query_more(ctx, boundary,
  1046						  entry->mr_generation);
  1047		return ctlv_op_query_done(ctx, boundary);
  1048	}
  1049	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
