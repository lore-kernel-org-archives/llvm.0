Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904BE14AA9;
	Mon, 13 Jan 2025 02:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736736327; cv=none; b=YNIg3Z2CY+/NtUECyV8MlJTblsjDs+CV3luEz2BsWwhQWprz1L711OdOcBNd9zOL1KoUWY6zube0f5ftdni1D2/qVxG3Q868EsE8Oc3jAUE2aq00UJJJfKK92x3IUgfQ/ntnYQioy77weBqenQaJUPJ+siWFZmnzkwXVS4K35EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736736327; c=relaxed/simple;
	bh=rwuymBKNC1xJJb3cN3Hxy1sDdE03AL/DPwsrMP6BJ7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kzRpz5zIWwqFx4b60T6QPkkdS6+y9GpgK6CEk0SFUNBMOd+h/OT7EokMSoqWTvQ2TdwcoDaJtt+c4d+RQMEkJa3LjLk/HpACtsq+hNeoBYzNIUSs8WiK2+1wQW8iNIn70RoFmyiovstXwDHgxW3pMWFygT0l6W7Y8HhN3GD6DFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJdCCf/Y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJdCCf/Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736736326; x=1768272326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rwuymBKNC1xJJb3cN3Hxy1sDdE03AL/DPwsrMP6BJ7U=;
  b=gJdCCf/YWZ1g7+KDk1SvNr+4S7wijdBXZYKJS+L986VONn1IbaoKiyqV
   qDCCDbfjBmyamsrq3mO9SxOYLQB/SEDqySsvHWkYmRgCOChZeSvdYBuFC
   +AUFdWlaQzEVusfShRX8VP98RL6dAi7T5txyWFwaInXGNitaOW6dMsCwI
   CVRNlKYLvucDNXHMgajT3srcw6RnGul0KQNRslH9trHyHD8c6/IcEOz6R
   uzACe5A/EgGl1GxYUWsVvlqdq0DfOcx346oayynyICE5v7f7sVH+5Q73G
   x8/cmfQcjMrYkCPCzGdlmEkaMfW6ejV1op5SNsIQHoJB09MlFUh9khdSC
   w==;
X-CSE-ConnectionGUID: OeCgmteMTtWQrQS/W0rHUg==
X-CSE-MsgGUID: UYlGyO/HQze8XqVKYopaZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="48353268"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48353268"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 18:45:26 -0800
X-CSE-ConnectionGUID: q9sIMqf2QLSJSfxy1e8QBw==
X-CSE-MsgGUID: c32pmQqcRt+inXnJwG/Qng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104847338"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Jan 2025 18:45:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXAS8-000Mdp-2H;
	Mon, 13 Jan 2025 02:45:20 +0000
Date: Mon, 13 Jan 2025 10:44:29 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Garrett <mjg59@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
	Bartosz Szczepanek <bsz@semihalf.com>
Subject: include/linux/tpm_eventlog.h:165:6: warning: variable 'mapping_size'
 set but not used
Message-ID: <202501131033.emEdcL5L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthew,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be548645527a131a097fdc884b7fca40c8b86231
commit: c46f3405692de1ac82240d927b9c7a0f9d6a4a36 tpm: Reserve the TPM final events table
date:   6 years ago
config: x86_64-randconfig-071-20241231 (https://download.01.org/0day-ci/archive/20250113/202501131033.emEdcL5L-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501131033.emEdcL5L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501131033.emEdcL5L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm-chip.c:24:
>> include/linux/tpm_eventlog.h:165:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     165 |         int mapping_size;
         |             ^
   drivers/char/tpm/tpm-chip.c:422:11: warning: cast from 'void (*)(struct device *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
     422 |                                       (void (*)(void *)) put_device,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from drivers/char/tpm/tpm-dev-common.c:19:
   In file included from drivers/char/tpm/tpm.h:29:
>> include/linux/tpm_eventlog.h:165:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     165 |         int mapping_size;
         |             ^
   1 warning generated.
--
   In file included from drivers/char/tpm/eventlog/tpm1.c:24:
>> include/linux/tpm_eventlog.h:165:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     165 |         int mapping_size;
         |             ^
   drivers/char/tpm/eventlog/tpm1.c:253:6: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     253 |         int len = 0;
         |             ^
   2 warnings generated.


vim +/mapping_size +165 include/linux/tpm_eventlog.h

   138	
   139	/**
   140	 * __calc_tpm2_event_size - calculate the size of a TPM2 event log entry
   141	 * @event:        Pointer to the event whose size should be calculated
   142	 * @event_header: Pointer to the initial event containing the digest lengths
   143	 * @do_mapping:   Whether or not the event needs to be mapped
   144	 *
   145	 * The TPM2 event log format can contain multiple digests corresponding to
   146	 * separate PCR banks, and also contains a variable length of the data that
   147	 * was measured. This requires knowledge of how long each digest type is,
   148	 * and this information is contained within the first event in the log.
   149	 *
   150	 * We calculate the length by examining the number of events, and then looking
   151	 * at each event in turn to determine how much space is used for events in
   152	 * total. Once we've done this we know the offset of the data length field,
   153	 * and can calculate the total size of the event.
   154	 *
   155	 * Return: size of the event on success, <0 on failure
   156	 */
   157	
   158	static inline int __calc_tpm2_event_size(struct tcg_pcr_event2_head *event,
   159						 struct tcg_pcr_event *event_header,
   160						 bool do_mapping)
   161	{
   162		struct tcg_efi_specid_event_head *efispecid;
   163		struct tcg_event_field *event_field;
   164		void *mapping = NULL;
 > 165		int mapping_size;
   166		void *marker;
   167		void *marker_start;
   168		u32 halg_size;
   169		size_t size;
   170		u16 halg;
   171		int i;
   172		int j;
   173	
   174		marker = event;
   175		marker_start = marker;
   176		marker = marker + sizeof(event->pcr_idx) + sizeof(event->event_type)
   177			+ sizeof(event->count);
   178	
   179		/* Map the event header */
   180		if (do_mapping) {
   181			mapping_size = marker - marker_start;
   182			mapping = TPM_MEMREMAP((unsigned long)marker_start,
   183					       mapping_size);
   184			if (!mapping) {
   185				size = 0;
   186				goto out;
   187			}
   188		} else {
   189			mapping = marker_start;
   190		}
   191	
   192		event = (struct tcg_pcr_event2_head *)mapping;
   193	
   194		efispecid = (struct tcg_efi_specid_event_head *)event_header->event;
   195	
   196		/* Check if event is malformed. */
   197		if (event->count > efispecid->num_algs) {
   198			size = 0;
   199			goto out;
   200		}
   201	
   202		for (i = 0; i < event->count; i++) {
   203			halg_size = sizeof(event->digests[i].alg_id);
   204	
   205			/* Map the digest's algorithm identifier */
   206			if (do_mapping) {
   207				TPM_MEMUNMAP(mapping, mapping_size);
   208				mapping_size = halg_size;
   209				mapping = TPM_MEMREMAP((unsigned long)marker,
   210						     mapping_size);
   211				if (!mapping) {
   212					size = 0;
   213					goto out;
   214				}
   215			} else {
   216				mapping = marker;
   217			}
   218	
   219			memcpy(&halg, mapping, halg_size);
   220			marker = marker + halg_size;
   221	
   222			for (j = 0; j < efispecid->num_algs; j++) {
   223				if (halg == efispecid->digest_sizes[j].alg_id) {
   224					marker +=
   225						efispecid->digest_sizes[j].digest_size;
   226					break;
   227				}
   228			}
   229			/* Algorithm without known length. Such event is unparseable. */
   230			if (j == efispecid->num_algs) {
   231				size = 0;
   232				goto out;
   233			}
   234		}
   235	
   236		/*
   237		 * Map the event size - we don't read from the event itself, so
   238		 * we don't need to map it
   239		 */
   240		if (do_mapping) {
   241			TPM_MEMUNMAP(mapping, mapping_size);
   242			mapping_size += sizeof(event_field->event_size);
   243			mapping = TPM_MEMREMAP((unsigned long)marker,
   244					       mapping_size);
   245			if (!mapping) {
   246				size = 0;
   247				goto out;
   248			}
   249		} else {
   250			mapping = marker;
   251		}
   252	
   253		event_field = (struct tcg_event_field *)mapping;
   254	
   255		marker = marker + sizeof(event_field->event_size)
   256			+ event_field->event_size;
   257		size = marker - marker_start;
   258	
   259		if ((event->event_type == 0) && (event_field->event_size == 0))
   260			size = 0;
   261	out:
   262		if (do_mapping)
   263			TPM_MEMUNMAP(mapping, mapping_size);
   264		return size;
   265	}
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
