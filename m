Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CA24D137;
	Thu, 22 Feb 2024 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708608157; cv=none; b=e2iCUQrykREL5CxbcMpun8pMUZAcKt2t/BNygx4eSZNFJUEtb4bJ6GYtbKj9qCDBNQlGwJT3nh2cfO1VOQ4QLCxhMpSC4F3WGI1s4rLeX2kaUrBJedVWi+1KIkf12x9qXzGujNvRIzU8rFg0ZFefJlf7GbZleGvXsM1CQ8oGJ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708608157; c=relaxed/simple;
	bh=1ldgqO5GgIpYhaVkvZBWaimVHDAm3MiDk1t7Zg26Bo4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XBoe9JHSmuZl1Fs1kTuZbLrkKkFjiPeQSx/40UdiHYcW3AH0BbjvAuC5KbqAWHx988XSHrslDMykulAw0OHN51VUXTfqCZV4FhrbtoKZKzyhnsH+OlacKdwZFBu1Voed0K7wG27Z0pxMSxLukj50r+p6UiJqDBMUOXQv0KWU8k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wazj6nhc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wazj6nhc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708608155; x=1740144155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ldgqO5GgIpYhaVkvZBWaimVHDAm3MiDk1t7Zg26Bo4=;
  b=Wazj6nhc2RyUi5oQxIDA9BYPddKcTw1PPXN+y7ql4KLmjWkGHZnJWBOt
   jHjBTmaXioXsE0R3ccQwWkwb3MNq8OlRoCDCJc7H9Hgx3lc3z98EBhpLZ
   cueoRD2qXMN3jMQRu4sYzHsUpR+qgzRhY+fhCkDuL8tY0B+VuAvhL5JA3
   c7JuJgjyK2iObgPMYv00HuP4eXZUj6aDko2Iw0m6UKzlotE0ZIgPIYhK2
   AR7hjjx4+eFLJJPoRxUpdnnIMvTJLTbR4DP6YywV73xSetw59OD0RqXKc
   2GvObSnQAJf3RxN0OtKhctySthBpJAEga+CYOPi5oAH6YHD7AiKa/LcT1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="25291998"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="25291998"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 05:22:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="10068959"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Feb 2024 05:22:33 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd91y-0006LV-3B;
	Thu, 22 Feb 2024 13:22:30 +0000
Date: Thu, 22 Feb 2024 21:22:29 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>,
	Amir Goldstein <amir73il@gmail.com>, Jan Kara <jack@suse.cz>
Subject: [cel:nfsd-5.15.y 41/47] samples/fanotify/fs-monitor.c:68:42:
 warning: format specifies type 'unsigned long long' but the argument has
 type '__u64' (aka 'unsigned long')
Message-ID: <202402222113.AqmDAqAx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-5.15.y
head:   a5aab01194d8736b0d197129d1202ac94e67ede6
commit: 88586fc1009fee86a38c041aed71d2e51a4f2f82 [41/47] orDate: Mon Oct 25 16:27:45 2021 -0300
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240222/202402222113.AqmDAqAx-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402222113.AqmDAqAx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402222113.AqmDAqAx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> samples/fanotify/fs-monitor.c:68:42: warning: format specifies type 'unsigned long long' but the argument has type '__u64' (aka 'unsigned long') [-Wformat]
      68 |                         printf("unexpected FAN MARK: %llx\n", event->mask);
         |                                                      ~~~~     ^~~~~~~~~~~
         |                                                      %lx
   1 warning generated.
   /usr/bin/ld: unrecognised emulation mode: elf64ppc
   Supported emulations: elf_x86_64 elf32_x86_64 elf_i386 elf_iamcu i386pep i386pe
   clang: error: linker command failed with exit code 1 (use -v to see invocation)


vim +68 samples/fanotify/fs-monitor.c

    55	
    56	static void handle_notifications(char *buffer, int len)
    57	{
    58		struct fanotify_event_metadata *event =
    59			(struct fanotify_event_metadata *) buffer;
    60		struct fanotify_event_info_header *info;
    61		struct fanotify_event_info_error *err;
    62		struct fanotify_event_info_fid *fid;
    63		int off;
    64	
    65		for (; FAN_EVENT_OK(event, len); event = FAN_EVENT_NEXT(event, len)) {
    66	
    67			if (event->mask != FAN_FS_ERROR) {
  > 68				printf("unexpected FAN MARK: %llx\n", event->mask);
    69				goto next_event;
    70			}
    71	
    72			if (event->fd != FAN_NOFD) {
    73				printf("Unexpected fd (!= FAN_NOFD)\n");
    74				goto next_event;
    75			}
    76	
    77			printf("FAN_FS_ERROR (len=%d)\n", event->event_len);
    78	
    79			for (off = sizeof(*event) ; off < event->event_len;
    80			     off += info->len) {
    81				info = (struct fanotify_event_info_header *)
    82					((char *) event + off);
    83	
    84				switch (info->info_type) {
    85				case FAN_EVENT_INFO_TYPE_ERROR:
    86					err = (struct fanotify_event_info_error *) info;
    87	
    88					printf("\tGeneric Error Record: len=%d\n",
    89					       err->hdr.len);
    90					printf("\terror: %d\n", err->error);
    91					printf("\terror_count: %d\n", err->error_count);
    92					break;
    93	
    94				case FAN_EVENT_INFO_TYPE_FID:
    95					fid = (struct fanotify_event_info_fid *) info;
    96	
    97					printf("\tfsid: %x%x\n",
    98					       fid->fsid.val[0], fid->fsid.val[1]);
    99					print_fh((struct file_handle *) &fid->handle);
   100					break;
   101	
   102				default:
   103					printf("\tUnknown info type=%d len=%d:\n",
   104					       info->info_type, info->len);
   105				}
   106			}
   107	next_event:
   108			printf("---\n\n");
   109		}
   110	}
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
