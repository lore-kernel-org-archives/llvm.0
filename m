Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516277F5
	for <llvm@lists.linux.dev>; Wed, 27 Apr 2022 11:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651059485; x=1682595485;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=f9bFUaGTVR+i6An9LL+H6bnimlYb2K5th0PLpOc2b6o=;
  b=J1V4oAQ3WJ5kEqHNp7fwBz6f1J3laTdlw0L2cOEgMw8KBkzXzJfy2iLf
   dR7pNesxH+96MBJetC4GZqpmUcq0RZV0wbiZV3mU2vHyTsn3a2T6DJk5L
   ShYZiIftId3OEoMvmi6Le5qb7m9PPP0pNcGL2dFYK0SDrYY9IK6Y8nDLI
   BPtep8TMBx3uWHOvCyqFONlIRpEMBjnM3CCULKT/g7rPAvj9IhKiUKL0Q
   5iS2pDMo0C3ciQlK1TXdqTSpKrlzQm3FAYPOt/c2fV/zbKUfg4afMJ6qJ
   uusmOI/Ap0JjpeLZciMxdjPbKvy1S2FsgHMQ6i+bURrDvcyLNkw52Pay4
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="266059524"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="266059524"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 04:38:04 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="580545484"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.255.29.10]) ([10.255.29.10])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 04:38:02 -0700
Subject: Re: [kbuild-all] Re: [soc:arm/multiplatform-late 13/18]
 arch/arm/mach-s3c/s3c24xx.c:683:9: warning: The platform is deprecated and
 scheduled for removal. Please reach to the maintainers of the platform and
 linux-samsung-soc@vger.kernel.org if you still use it.Without such feedback,
 the platform will be removed...
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
 clang-built-linux <llvm@lists.linux.dev>, kbuild-all@lists.01.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, arm-soc <arm@kernel.org>
References: <202204261130.D9GY2vp9-lkp@intel.com>
 <15dcf5b4-a5ee-66b8-2762-db7728c9928c@kernel.org>
 <CAK8P3a2EB4k5oQDSK5n9RTGJv-Zwgijb-NG-qr7mCTz=mW9baQ@mail.gmail.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <bb89d0d1-b26b-7f0a-7b52-bb00eb34aa48@intel.com>
Date: Wed, 27 Apr 2022 19:38:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2EB4k5oQDSK5n9RTGJv-Zwgijb-NG-qr7mCTz=mW9baQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 4/26/2022 3:08 PM, Arnd Bergmann wrote:
> On Tue, Apr 26, 2022 at 8:56 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 26/04/2022 05:24, kernel test robot wrote:
>>>
>>>     arch/arm/mach-s3c/s3c24xx.c:177:16: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
>>>             unsigned long tmp = 0;
>>>                           ^
>>>>> arch/arm/mach-s3c/s3c24xx.c:683:9: warning: The platform is deprecated and scheduled for removal. Please reach to the maintainers of the platform and linux-samsung-soc@vger.kernel.org if you still use it.Without such feedback, the platform will be removed after 2022. [-W#pragma-messages]
>>>     #pragma message "The platform is deprecated and scheduled for removal. " \
>>
>> This pragma is in purpose, so -W#pragma-messages is not helpful. The
>> message will stay for 1 year here and ~2 years in s3c64xx.
> 
> I don't think there is much we can do about this, from what I can
> tell, this is just the way that
> clang prints the message, and the kernel test robot pricked it up
> because clang has the word
> 'warning:' in the output that gcc does not:
> 
> $ echo "#pragma message(\"message\")" | clang -xc - -c -o /dev/null
> <stdin>:1:9: warning: message [-W#pragma-messages]
> #pragma message("message")
>          ^
> 1 warning generated.
> 
> $ echo "#pragma message(\"message\")" | gcc -xc - -c -o /dev/null
> <stdin>:1:9: note: ‘#pragma message: message’
> 
>         Arnd

Hi Arnd, Krzysztof,

Sorry for the noise, We have added the "pragma-messages" warnings to 
ignore list.

Best Regards,
Rong Chen
