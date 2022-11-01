Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1362FB2
	for <llvm@lists.linux.dev>; Tue,  1 Nov 2022 22:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667343486; x=1698879486;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=h3B1b8kOxLB+ep8phSxlZOYflbfFLBaAd9A06Q4+aAo=;
  b=m623dym93h54yNXGaHAZCWZO8dZ13TXYqaikdb7EE2da9XP9FVAaqkoc
   aCS0DiVxVWDAnnTnwC6Rqu85JjffggTagVrKTPBC7O8/j+EgRdUWZH44x
   YAGKzQujQTvWxx6kvp2kw3TJlkFf7g65tbReKikcsgTGYgS0M3RDhYlmZ
   cLsUgvQtSL4orxdiaB8iVP11bS+JbqA9c6n2W9OffAzN1YBFTW0Hyyhxp
   /9BNdw/7iNrKufYENP79C9uTioUe3D61oLZ9WEFlZVM13k4TGWSwf8/Ai
   04oDp95gP6ypsLD8hAWbARo8hapJFFN7WhgRys7ObgxvtQ/j0ax++9oJA
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="296698332"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="296698332"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 15:58:06 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="697575365"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="697575365"
Received: from leungcal-mobl.amr.corp.intel.com (HELO [10.212.136.36]) ([10.212.136.36])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 15:58:04 -0700
Message-ID: <74ab03dd-46c5-a79e-c256-e4e4ea0341e0@intel.com>
Date: Tue, 1 Nov 2022 15:58:03 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RESEND PATCH v5] x86, mem: move memmove to out of line assembler
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, bp@alien8.de, tglx@linutronix.de,
 mingo@kernel.org, peterz@infradead.org
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, dave.hansen@linux.intel.com,
 David.Laight@aculab.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux@rasmusvillemoes.dk, llvm@lists.linux.dev, luto@kernel.org,
 mingo@redhat.com, torvalds@linux-foundation.org, x86@kernel.org
References: <20221018172155.287409-1-ndesaulniers@google.com>
 <Y08NJohEeoYX2aIf@thelio-3990X> <202211011534.C31FC5ED6@keescook>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <202211011534.C31FC5ED6@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/1/22 15:36, Kees Cook wrote:
>> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Can an x86 maintainer please pick this up for -tip?

Queued it here:

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=x86/asm


