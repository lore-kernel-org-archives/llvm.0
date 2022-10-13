Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77444429
	for <llvm@lists.linux.dev>; Thu, 13 Oct 2022 20:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665694333; x=1697230333;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DS/ZyZcyEjHNaV7o5ku/y817lSJV9cUyzZCnu//ovMA=;
  b=luIgFlHzJIAhWnLbqP5GGpMchJzN9L5qE8kU8AkVtb6O3ziruypEwlIa
   QnJUe14+PBg9LBymh1LEoueShLfzVVtb8bhoVctIMftskmF+CoBzWkROk
   g2FcXIYFLmJjwIXX4IJuuZMoiGR0cvsMJSVBEMiMqC9Hsb1p9xvF7Bil+
   5RDUmwm56WNz0hr9RQ44sKHxBTeF4DK6BmL2obtX/98FXo/mE/wmMFGkN
   BfuGpkNogtnPmAJfSMsaG1hkCRT9ynDN4hIlbj6VHx2kqxTh8zUfdf4KW
   1lAGSv++mIXOEJxKNVODzsHEZSnW79+iFdf436WN+RVgZVXs4WoQ3fya2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="369384604"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="369384604"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 13:52:13 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="629687638"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="629687638"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.212.104.135]) ([10.212.104.135])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 13:52:11 -0700
Message-ID: <a4e18a6c-d03a-d4fc-fb7e-d8bf37e85ce0@linux.intel.com>
Date: Thu, 13 Oct 2022 16:52:09 -0400
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH] fs/select: avoid clang stack usage warning
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-fsdevel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Eric Dumazet <edumazet@google.com>, "Darrick J. Wong"
 <darrick.wong@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20190307090146.1874906-1-arnd@arndb.de>
 <20221006222124.aabaemy7ofop7ccz@google.com>
 <f0dbc406-11b4-90f7-52fd-ce79f842c356@linux.intel.com>
 <CAKwvOdnpMqW_esBd615Fx8VKTfny-yR2PTUejBH0uYkHaL517A@mail.gmail.com>
From: Andi Kleen <ak@linux.intel.com>
In-Reply-To: <CAKwvOdnpMqW_esBd615Fx8VKTfny-yR2PTUejBH0uYkHaL517A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> I wonder if there is a way to disable the warning or increase the
>> threshold just for this function. I don't think attribute optimize would
>> work, but perhaps some pragma?
> Here's what I would have guessed, the pragma approach seems a little broken.
> https://godbolt.org/z/vY7fGYv7f
> Maybe I'm holding it wrong?

Thanks. Looks like the warning setting is not propagated to the point 
where the warning is generated in the backend. Could file a gcc bug on 
that, but yes the solution won't work for now.

-Andi

