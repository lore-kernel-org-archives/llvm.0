Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE8B5668;
	Tue, 31 Oct 2023 03:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXh5C56P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698724287; x=1730260287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EVo5xxQbvrtoTxEAhz94v8nEertjPwvw2/I4eoqLmMQ=;
  b=mXh5C56PqDb5uJfCIEaIyOe0NaTzRQmQ71a3Kmit9M7BckY/X5d13Cbd
   atw8BDYID2w5Zm/60BM+ZUJsio0kDvg2ClaekPz6YkHv3/93i+S8627Li
   H1G8jBKH9v2VPdmN0BytKY6BLj3k0yr8QevfP2TENmXQZNawNqScKf++b
   Hrc4vxUnu6EesGmR6WSTfF9hl9ZwugaYWCxH4bp+oC29rbLJbgdGaleOF
   k5zULZvWsSl78N9UB6tZ6z/b5T8ziVxUn5Qk31FjNtDkFgJ0/HmeOeghC
   7VlFq1QscGRPY2TfveQl0SyqGNMTtLCSufZgImpqxwWRebQowsxxugLqD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="9738849"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="9738849"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 20:51:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="8189022"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Oct 2023 20:51:24 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxfmk-000Dnj-0Z;
	Tue, 31 Oct 2023 03:51:22 +0000
Date: Tue, 31 Oct 2023 11:50:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH] wifi: wil6210: Replace strlcat() usage with seq_buf
Message-ID: <202310311131.HryHNtzn-lkp@intel.com>
References: <20231026171349.work.928-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026171349.work.928-kees@kernel.org>

Hi Kees,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main kvalo-ath/ath-next linus/master v6.6 next-20231030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/wifi-wil6210-Replace-strlcat-usage-with-seq_buf/20231027-011746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20231026171349.work.928-kees%40kernel.org
patch subject: [RFC][PATCH] wifi: wil6210: Replace strlcat() usage with seq_buf
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231031/202310311131.HryHNtzn-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311131.HryHNtzn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310311131.HryHNtzn-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/wil6210/wmi.c:3162:57: warning: declaration of 'struct seq_buf' will not be visible outside of this function [-Wvisibility]
    3162 | static void resume_triggers2string(u32 triggers, struct seq_buf *s)
         |                                                         ^
>> drivers/net/wireless/ath/wil6210/wmi.c:3165:3: error: call to undeclared function 'seq_buf_puts'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3165 |                 seq_buf_puts(s, " UNKNOWN");
         |                 ^
   drivers/net/wireless/ath/wil6210/wmi.c:3165:3: note: did you mean 'seq_puts'?
   include/linux/seq_file.h:121:6: note: 'seq_puts' declared here
     121 | void seq_puts(struct seq_file *m, const char *s);
         |      ^
   drivers/net/wireless/ath/wil6210/wmi.c:3170:3: error: call to undeclared function 'seq_buf_puts'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3170 |                 seq_buf_puts(s, " HOST")
         |                 ^
>> drivers/net/wireless/ath/wil6210/wmi.c:3170:27: error: expected ';' after expression
    3170 |                 seq_buf_puts(s, " HOST")
         |                                         ^
         |                                         ;
>> drivers/net/wireless/ath/wil6210/wmi.c:3189:2: error: call to undeclared function 'DECLARE_SEQ_BUF'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3189 |         DECLARE_SEQ_BUF(s, 100);
         |         ^
>> drivers/net/wireless/ath/wil6210/wmi.c:3189:18: error: use of undeclared identifier 's'
    3189 |         DECLARE_SEQ_BUF(s, 100);
         |                         ^
   drivers/net/wireless/ath/wil6210/wmi.c:3204:65: error: use of undeclared identifier 's'
    3204 |         resume_triggers2string(le32_to_cpu(reply.evt.resume_triggers), s);
         |                                                                        ^
>> drivers/net/wireless/ath/wil6210/wmi.c:3206:46: error: call to undeclared function 'seq_buf_cstr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3206 |                    reply.evt.status ? "failed" : "passed", seq_buf_cstr(s),
         |                                                            ^
   drivers/net/wireless/ath/wil6210/wmi.c:3206:59: error: use of undeclared identifier 's'
    3206 |                    reply.evt.status ? "failed" : "passed", seq_buf_cstr(s),
         |                                                                         ^
>> drivers/net/wireless/ath/wil6210/wmi.c:3206:46: error: call to undeclared function 'seq_buf_cstr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3206 |                    reply.evt.status ? "failed" : "passed", seq_buf_cstr(s),
         |                                                            ^
   drivers/net/wireless/ath/wil6210/wmi.c:3206:59: error: use of undeclared identifier 's'
    3206 |                    reply.evt.status ? "failed" : "passed", seq_buf_cstr(s),
         |                                                                         ^
   1 warning and 10 errors generated.


vim +/seq_buf_puts +3165 drivers/net/wireless/ath/wil6210/wmi.c

  3161	
> 3162	static void resume_triggers2string(u32 triggers, struct seq_buf *s)
  3163	{
  3164		if (!triggers) {
> 3165			seq_buf_puts(s, " UNKNOWN");
  3166			return;
  3167		}
  3168	
  3169		if (triggers & WMI_RESUME_TRIGGER_HOST)
> 3170			seq_buf_puts(s, " HOST")
  3171	
  3172		if (triggers & WMI_RESUME_TRIGGER_UCAST_RX)
  3173			seq_buf_puts(s, " UCAST_RX");
  3174	
  3175		if (triggers & WMI_RESUME_TRIGGER_BCAST_RX)
  3176			seq_buf_puts(s, " BCAST_RX");
  3177	
  3178		if (triggers & WMI_RESUME_TRIGGER_WMI_EVT)
  3179			seq_buf_puts(s, " WMI_EVT");
  3180	
  3181		if (triggers & WMI_RESUME_TRIGGER_DISCONNECT)
  3182			seq_buf_puts(s, " DISCONNECT");
  3183	}
  3184	
  3185	int wmi_resume(struct wil6210_priv *wil)
  3186	{
  3187		struct wil6210_vif *vif = ndev_to_vif(wil->main_ndev);
  3188		int rc;
> 3189		DECLARE_SEQ_BUF(s, 100);
  3190		struct {
  3191			struct wmi_cmd_hdr wmi;
  3192			struct wmi_traffic_resume_event evt;
  3193		} __packed reply = {
  3194			.evt = {.status = WMI_TRAFFIC_RESUME_FAILED,
  3195				.resume_triggers =
  3196					cpu_to_le32(WMI_RESUME_TRIGGER_UNKNOWN)},
  3197		};
  3198	
  3199		rc = wmi_call(wil, WMI_TRAFFIC_RESUME_CMDID, vif->mid, NULL, 0,
  3200			      WMI_TRAFFIC_RESUME_EVENTID, &reply, sizeof(reply),
  3201			      WIL_WAIT_FOR_SUSPEND_RESUME_COMP);
  3202		if (rc)
  3203			return rc;
  3204		resume_triggers2string(le32_to_cpu(reply.evt.resume_triggers), s);
  3205		wil_dbg_pm(wil, "device resume %s, resume triggers:%s (0x%x)\n",
> 3206			   reply.evt.status ? "failed" : "passed", seq_buf_cstr(s),
  3207			   le32_to_cpu(reply.evt.resume_triggers));
  3208	
  3209		return reply.evt.status;
  3210	}
  3211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
