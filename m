Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51D02C81
	for <llvm@lists.linux.dev>; Fri,  8 Oct 2021 01:28:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="225186978"
X-IronPort-AV: E=Sophos;i="5.85,356,1624345200"; 
   d="scan'208";a="225186978"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2021 18:28:01 -0700
X-IronPort-AV: E=Sophos;i="5.85,356,1624345200"; 
   d="scan'208";a="439750605"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.172.35]) ([10.249.172.35])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2021 18:27:59 -0700
Subject: Re: [kbuild-all] Re: [peterz-queue:sched/cleanup 38/40]
 kernel/irq_work.c:44:6: warning: no previous prototype for function
 'irq_work_single'
To: Peter Zijlstra <peterz@infradead.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, yujie.liu@intel.com
References: <202110071515.2ivww4qz-lkp@intel.com>
 <20211007074843.GO174703@worktop.programming.kicks-ass.net>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <aa767320-ef44-3d04-e7b2-dd7bf5620595@intel.com>
Date: Fri, 8 Oct 2021 09:27:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211007074843.GO174703@worktop.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/7/2021 3:48 PM, Peter Zijlstra wrote:
> 
> This mail has dodgy headers:
> 
> To: unlisted-recipients: no To-header on input <;
> 
> Is the robot sick?

Hi Peterz,

This warning is from W=1 option, so the bot didn't send this report to
your mail address which looks like there's a wrong "To:", we'll stop
sending such reports next time.

Best Regards,
Rong Chen
