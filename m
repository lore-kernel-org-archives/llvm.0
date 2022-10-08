Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0191EA2
	for <llvm@lists.linux.dev>; Sat,  8 Oct 2022 01:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665193609; x=1696729609;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oQxjNLOcMJZGWcwR/V6EOum5AghG2IhHdI8FHMASetQ=;
  b=hh3p6fseQdTyTEHwTUn/dFA8hYa3V0KzPDwGaAgqNtd0gTJ3UmpCyGB1
   Qdads1KJvdgQGgtmo9M/SOQfpeg0M8/hoZFb8rXzUYVuj7VUeU1592+sw
   QTwAkRXTKLV7UvJxIehy/rIoPK1M/aiS6x+6A3kLc3vCs9UEu2np72/pP
   XOnTXmXQHLkwEOae9FVOFbVtNr4ny5/A0Kh/qmEEngoPIaTFhctSiYEdc
   U+5cPNJtpFzyEzGaoyx/UOiX607i/Gdqy/yvz73pY5RxQ5hDjz1oPAB0k
   ubzPULWxFvetv7HQTn/2thnOzDzVNtlKnsfvKA5lPZFM+5HhwdvVcQfZC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="287106881"
X-IronPort-AV: E=Sophos;i="5.95,168,1661842800"; 
   d="scan'208";a="287106881"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2022 18:46:49 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="625358200"
X-IronPort-AV: E=Sophos;i="5.95,168,1661842800"; 
   d="scan'208";a="625358200"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.212.234.20]) ([10.212.234.20])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2022 18:46:49 -0700
Message-ID: <f0dbc406-11b4-90f7-52fd-ce79f842c356@linux.intel.com>
Date: Fri, 7 Oct 2022 18:46:48 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] fs/select: avoid clang stack usage warning
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Eric Dumazet <edumazet@google.com>, "Darrick J. Wong"
 <darrick.wong@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20190307090146.1874906-1-arnd@arndb.de>
 <20221006222124.aabaemy7ofop7ccz@google.com>
From: Andi Kleen <ak@linux.intel.com>
In-Reply-To: <20221006222124.aabaemy7ofop7ccz@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/6/2022 3:21 PM, Nick Desaulniers wrote:
> On Thu, Mar 07, 2019 at 10:01:36AM +0100, Arnd Bergmann wrote:
>> The select() implementation is carefully tuned to put a sensible amount
>> of data on the stack for holding a copy of the user space fd_set,
>> but not too large to risk overflowing the kernel stack.
>>
>> When building a 32-bit kernel with clang, we need a little more space
>> than with gcc, which often triggers a warning:
>>
>> fs/select.c:619:5: error: stack frame size of 1048 bytes in function 'core_sys_select' [-Werror,-Wframe-larger-than=]
>> int core_sys_select(int n, fd_set __user *inp, fd_set __user *outp,
>>
>> I experimentally found that for 32-bit ARM, reducing the maximum
>> stack usage by 64 bytes keeps us reliably under the warning limit
>> again.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   include/linux/poll.h | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/include/linux/poll.h b/include/linux/poll.h
>> index 7e0fdcf905d2..1cdc32b1f1b0 100644
>> --- a/include/linux/poll.h
>> +++ b/include/linux/poll.h
>> @@ -16,7 +16,11 @@
>>   extern struct ctl_table epoll_table[]; /* for sysctl */
>>   /* ~832 bytes of stack space used max in sys_select/sys_poll before allocating
>>      additional memory. */
>> +#ifdef __clang__
>> +#define MAX_STACK_ALLOC 768
> Hi Arnd,
> Upon a toolchain upgrade for Android, our 32b x86 image used for
> first-party developer VMs started tripping -Wframe-larger-than= again
> (thanks -Werror) which is blocking our ability to upgrade our toolchain.


I wonder if there is a way to disable the warning or increase the 
threshold just for this function. I don't think attribute optimize would 
work, but perhaps some pragma?


-Andi


