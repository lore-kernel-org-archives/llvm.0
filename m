Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34B3EA9
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 10:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652695770; x=1684231770;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=0iuQqxuydIJZPFNzzRya7Q5thdN33xJWufGwf1DqOaI=;
  b=IpB6qjLn9VGyjDwsGvpxPsLUfUyQgdG5dx0qIx/27p8R0RooRzKFCESO
   zSrFKDBZb8RBlENaCwvwUAiDyeS5rydAyLsc1DktTsSvGJwTG2qI/Dpm2
   d7duwxuLYACdCjuDt2yDlTS+RzZrrdGoXI3v7sJ9TNux13ySz9hDuYiG8
   R7PIulSCQRe7BsOQ6yWk9nc9ZPsKhmBkwiG1fxHzMn7huyoBoLkZnGae1
   u50oILW2rSzRJxgnvOKPsi8jli3iAda4W4+mByRtbf4Naad/Buj0UjXH5
   djc7EeLoQzU4SbWt+ckq8nuMDk2F3jiAwYjwpzRhRwDzwTPDaJE/yWAkS
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="250681986"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="250681986"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 03:09:25 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="568253695"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.169.165]) ([10.249.169.165])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 03:09:18 -0700
Subject: Re: [kbuild-all] Re: [linux-next:master 9995/11651]
 fs/buffer.c:2254:5: warning: stack frame size (2144) exceeds limit (1024) in
 'block_read_full_folio'
To: Nathan Chancellor <nathan@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Brian Cain <bcain@quicinc.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>,
 linux-hexagon@vger.kernel.org
References: <202205150051.3RzuooAG-lkp@intel.com>
 <Yn/YsTpOh898B30l@casper.infradead.org>
 <YoAlvnyjEbYV4T1L@dev-arch.thelio-3990X>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <416aa517-6813-2227-ddce-34c8b63696e2@intel.com>
Date: Mon, 16 May 2022 18:09:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YoAlvnyjEbYV4T1L@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 5/15/2022 5:57 AM, Nathan Chancellor wrote:
> On Sat, May 14, 2022 at 05:28:33PM +0100, Matthew Wilcox wrote:
>> On Sun, May 15, 2022 at 12:23:46AM +0800, kernel test robot wrote:
>>> commit: 2c69e2057962b6bd76d72446453862eb59325b49 [9995/11651] fs: Convert block_read_full_page() to block_read_full_folio()
>>> config: hexagon-randconfig-r041-20220513 (https://download.01.org/0day-ci/archive/20220515/202205150051.3RzuooAG-lkp@intel.com/config)
>>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
>> ...
>>> All warnings (new ones prefixed by >>):
>>>
>>>>> fs/buffer.c:2254:5: warning: stack frame size (2144) exceeds limit (1024) in 'block_read_full_folio' [-Wframe-larger-than]
>>>     int block_read_full_folio(struct folio *folio, get_block_t *get_block)
>>>         ^
>>>     1 warning generated.
>>
>> Now show the warnings that were removed.  This patch renames the
>> function, and I bet there was a similar warning before this patch.
>>
>> But basically, I don't care about stack usage on hexagon with clang.
>> AIUI, it's a known bug.
> 
> For what it's worth, it seems like this is just 256K pages being 256K
> pages... MAX_BUF_PER_PAGE is PAGE_SIZE / 512 so *arr is 2048 bytes big
> in this configuration. You'd see a similar warning with PowerPC but that
> configuration is non-standard:
> 
> fs/buffer.c: In function ‘block_read_full_page’:
> fs/buffer.c:2337:1: warning: the frame size of 2064 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>   2337 | }
>        | ^
> 
> It would be nice if the Intel folks could look at recognizing a function
> rename so that you are not bothered by reports like this.

Hi Nathan, Matthew,

Sorry about this, we'll take a look.

Best Regards,
Rong Chen


> 
> As a side note... Brian, is there any reason for 256K pages to exist for
> Hexagon? This has been an option since Hexagon's introduction but is it
> actually used? 4K pages is the default and the help text says "use with
> caution". Perhaps the choice should be turned off altogether for
> CONFIG_COMPILE_TEST so that we cannot select this configuration and
> bother developers with these reports.
> 
> Cheers,
> Nathan
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
> 
