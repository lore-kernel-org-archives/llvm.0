Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A600942512
	for <llvm@lists.linux.dev>; Thu,  1 Jun 2023 16:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685638717; x=1717174717;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rQr060zH9KUjmdwUDYfSZFTdHmf4ecv0Iqn3RGTCXWg=;
  b=gDryejiLcRPdmSR5wV2sffj3BA6IxcexnaIDRgLiICzMEjD0QhUpJnGk
   +cRfX1cLf7kqZzF4Dcvmi+D5R6TGzWkrSoKg1uPUO3bz/BPTz0Pir2dYH
   WV8llLim64w6F0TV2uFLWgZi3w105tR82EySlu9UtIdOAzQ4dIQCZC0Vv
   yMSYwFWGBdMP5k64GNc9EjRkRoetS2pS8Gk+K6a/Cpw9wzeiL7qEtLExx
   Nw8J6wpv0QAa3lvZHHNj6yZP80//9cLRJRhsXQiUXk1+krL6TSJ47SMs+
   pMom05AAgquDr4GbSldfeMZahYTfP1RSDL/APEu68Cl4MfA9z09bIl5NM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="340238064"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="340238064"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 09:58:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="737182158"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="737182158"
Received: from jdboswor-mobl.amr.corp.intel.com (HELO [10.212.227.45]) ([10.212.227.45])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 09:58:36 -0700
Message-ID: <b8b118ef-d250-f331-fd8f-9853bf72d102@intel.com>
Date: Thu, 1 Jun 2023 09:58:36 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] x86/csum: Move csum_tail result parameter to a local
 variable.
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, ndesaulniers@google.com,
 goldstein.w.n@gmail.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20230530135953.3341174-1-trix@redhat.com>
 <20230530152016.GA3503416@dev-arch.thelio-3990X>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230530152016.GA3503416@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/30/23 08:20, Nathan Chancellor wrote:
> Dave picked it up yesterday, I guess -tip's auto-latest was not
> refreshed for today's -next:
> 
> https://git.kernel.org/tip/2fe1e67e6987b6f05329740da79c8150a2205b0d

BTW, thank you _both_ for the patches!
